------------------------------------------------------------------------------
--                             Templates Parser                             --
--                                                                          --
--                        Copyright (C) 1999 - 2004                         --
--                               Pascal Obry                                --
--                                                                          --
--  This library is free software; you can redistribute it and/or modify    --
--  it under the terms of the GNU General Public License as published by    --
--  the Free Software Foundation; either version 2 of the License, or (at   --
--  your option) any later version.                                         --
--                                                                          --
--  This library is distributed in the hope that it will be useful, but     --
--  WITHOUT ANY WARRANTY; without even the implied warranty of              --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU       --
--  General Public License for more details.                                --
--                                                                          --
--  You should have received a copy of the GNU General Public License       --
--  along with this library; if not, write to the Free Software Foundation, --
--  Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.          --
--                                                                          --
--  As a special exception, if other files instantiate generics from this   --
--  unit, or you link this unit with other files to produce an executable,  --
--  this  unit  does not  by itself cause  the resulting executable to be   --
--  covered by the GNU General Public License. This exception does not      --
--  however invalidate any other reasons why the executable file  might be  --
--  covered by the  GNU Public License.                                     --
------------------------------------------------------------------------------

separate (Templates_Parser)

package body Cached_Files is

   Initial_Size : constant := 20; -- cache initial size
   Growing_Size : constant := 50; -- cache growing size

   type File_Array is array (Positive range <>) of Tree;
   type File_Array_Access is access File_Array;

   Files : File_Array_Access;
   Index : Natural := 0;

   procedure Growth;
   --  Growth the size (by Growing_Size places) of Files array.

   function Get (Filename : in String) return Natural;
   --  Look for Filename into the set and return its index. Returns 0 if
   --  filename was not found.

   function Up_To_Date (T : in Tree) return Boolean;
   --  Returns True if the file tree is up to date (the templates files
   --  have not been modified on disk) or False otherwise.

   type Mark_Mode is (Used, Released);

   procedure Update_Used_Counter (T : in out Static_Tree; Mode : in Mark_Mode);
   --  Update C_Info used counter according to Mode

   protected body Prot is

      ---------
      -- Add --
      ---------

      procedure Add
        (Filename : in     String;
         T        : in     Tree;
         Old      :    out Tree)
      is
         L_Filename : constant Unbounded_String
           := To_Unbounded_String (Filename);

         S : Natural := 1;
         E : Natural := Index;
         N : Natural;
         I : Tree;

      begin
         --  Does the table initialized and do we have enough place on it ?

         if Files = null or else Index = Files'Last then
            Growth;
         end if;

         loop
            exit when S > E;

            N := (S + E) / 2;

            if Files (N).Filename = L_Filename then
               --  This is a file that was already loaded. If loaded again
               --  it is because the file timestamp has changed. We want to
               --  just update the tree and not the info node (first node).

               Old := Files (N).Next;
               --  This is a pointer to the C_Info tree node, skipping the
               --  info node (first node).

               I := Files (N).I_File;
               --  Old include files dependances

               Files (N).Next      := T.Next;
               Files (N).Timestamp := T.Timestamp;
               Files (N).I_File    := T.I_File;

               --  Now free old I_File

               declare
                  O : Tree;
               begin
                  while I /= null loop
                     O := I;
                     I := I.Next;
                     Free (O);
                  end loop;
               end;

               --  This part is tricky, the tree could be currently used
               --  (parsed). So we need to be careful to not release the tree
               --  too early.

               if Old.Used = 0 then
                  --  File is not currently used, we can release it safely
                  Release (Old, Include => False);

                  Old := T.Next;

               else
                  --  Tree is used, mark it as obsoleted, it will be removed
                  --  when no more used by the Prot.Release call.
                  Old.Obsolete := True;

                  --  But current tree is not used, it has been posted here
                  --  for futur use. But if replaced right away it should be
                  --  freed.
                  Files (N).Next.Used := 0;
               end if;

               --  Nothing more to do in this case

               return;

            elsif Files (N).Filename < L_Filename then
               S := N + 1;

            else
               E := N - 1;
            end if;
         end loop;

         --  Filename was not found, insert it in the array at position S

         Files (S + 1 .. Index + 1) := Files (S .. Index);

         Index := Index + 1;

         Files (S) := T;

         Old := T.Next;
         --  Old point to the current C_Info tree
      end Add;

      ---------
      -- Get --
      ---------

      procedure Get
        (Filename : in     String;
         Result   :    out Static_Tree)
      is
         N : constant Natural := Get (Filename);
      begin
         if N = 0 then
            Result := Null_Static_Tree;

         else
            Result := (Files (N), Files (N).Next);

            Update_Used_Counter (Result, Mode => Used);
         end if;
      end Get;

      -------------
      -- Release --
      -------------

      procedure Release (T : in out Static_Tree) is
      begin
         pragma Assert (T.C_Info /= null);

         Update_Used_Counter (T, Mode => Released);

         if T.C_Info.Obsolete and then T.C_Info.Used = 0 then
            pragma Assert (T.Info.Next /= T.C_Info);
            Release (T.C_Info, Include => False);
         end if;
      end Release;

   end Prot;

   ---------
   -- Get --
   ---------

   function Get (Filename : in String) return Natural is

      L_Filename : constant Unbounded_String
        := To_Unbounded_String (Filename);

      S : Natural := 1;
      E : Natural := Index;
      N : Natural;

   begin
      loop
         exit when S > E;

         N := (S + E) / 2;

         if Files (N).Filename = L_Filename then

            if Up_To_Date (Files (N)) then
               return N;
            else
               --  File has changed on disk, we need to read it again. Just
               --  pretend that the file was not found.
               return 0;
            end if;

         elsif Files (N).Filename < L_Filename then
            S := N + 1;

         else
            E := N - 1;
         end if;
      end loop;

      return 0;
   end Get;

   ------------
   -- Growth --
   ------------

   procedure Growth is

      procedure Free is
         new Ada.Unchecked_Deallocation (File_Array, File_Array_Access);

   begin
      if Files = null then
         Files := new File_Array (1 .. Initial_Size);
      else

         declare
            New_Array : File_Array_Access;
         begin
            New_Array := new File_Array (1 .. Files'Length + Growing_Size);
            New_Array (1 .. Files'Length) := Files.all;
            Free (Files);
            Files := New_Array;
         end;
      end if;
   end Growth;

   ----------------
   -- Up_To_Date --
   ----------------

   function Up_To_Date (T : in Tree) return Boolean is
      use GNAT;
      use type GNAT.OS_Lib.OS_Time;

      P      : Tree;
      Result : Boolean;
   begin
      --  Check main file

      if OS_Lib.File_Time_Stamp (To_String (T.Filename)) /= T.Timestamp then
         return False;
      end if;

      --  Check all include files

      P := T.I_File;

      while P /= null loop
         Result := Up_To_Date (P.File.Info);

         if not Result then
            return False;
         end if;
         P := P.Next;
      end loop;

      return True;
   end Up_To_Date;

   -------------------------
   -- Update_Used_Counter --
   -------------------------

   procedure Update_Used_Counter
     (T : in out Static_Tree; Mode : in Mark_Mode)
   is
      P : Tree;
   begin
      if Mode = Used then
         T.Info.Next.Used := T.Info.Next.Used + 1;
      else
         T.Info.Next.Used := T.Info.Next.Used - 1;
      end if;

      P := T.Info.I_File;

      while P /= null loop
         Update_Used_Counter (P.File, Mode);
         P := P.Next;
      end loop;
   end Update_Used_Counter;

end Cached_Files;
