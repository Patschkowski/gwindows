with GNAVI_Controls;

with GWindows.GStrings.Unbounded;
with GWindows.GStrings.Handling;
with GWindows.GStrings.Constants;
with GWindows.GStrings.IO;

with GNAT.OS_Lib;

procedure Control_Generator is
   use GWindows.GStrings;
   use GWindows.GStrings.IO;
   use GWindows.GStrings.Unbounded;
   use GNAVI_Controls;

   NL : constant GWindows.GString :=
     GWindows.GCharacter'Val (13) & GWindows.GCharacter'Val (10);

   With_Strings     : GWindows.GString_Unbounded;
   Dispatch_Strings : GWindows.GString_Unbounded;
   Spec_Strings     : GWindows.GString_Unbounded;
   Body_Strings     : GWindows.GString_Unbounded;

   Caveat_Generated : constant GWindows.GString :=
      "--  This file contains only automatically generated code." & NL &
      "--  DO NOT MODIFY !" & NL &
      "--  Change the `datastore\controls.xml` file instead." & NL &
      "--  Generated by: Control_Generator." & NL & NL;

   procedure Write_File (File_Spec : GWindows.GString;
                         Contents  : GWindows.GString);
   --  Output file with contents

   function With_Of (Type_Name : GWindows.GString) return GWindows.GString;
   --  Get the with part of Type_Name

   procedure Add_With (Type_String : GWindows.GString);
   --  Add with to buffer

   procedure Make_Create_Procedure (Index : Positive);

   procedure Write_File (File_Spec : GWindows.GString;
                         Contents  : GWindows.GString)
   is
      use GNAT.OS_Lib;

      O_File    : File_Descriptor;
      S_Content : String := To_String (Contents);
      Dummy     : Integer;
   begin
      O_File := Create_File (To_String (File_Spec), Binary);
      Dummy := Write (O_File,
                      S_Content (S_Content'First)'Address,
                      S_Content'Length);
      Close (O_File);
   exception
      when others =>
         Put_Line ("Unable to write : " & File_Spec);
   end Write_File;

   function With_Of (Type_Name : GWindows.GString) return GWindows.GString
   is
      use GWindows.GStrings.Handling;
      use GWindows.GStrings.Constants;
   begin
      return Type_Name
        (Type_Name'First .. Index (Type_Name, ".", Backward) - 1);
   end With_Of;

   procedure Add_With (Type_String : GWindows.GString) is
      W_S : constant GWindows.GString := With_Of (Type_String);
   begin
      if W_S /= "" then
         declare
            A_S : constant GWindows.GString := "with " & W_S & ";" & NL;
         begin
            if Index (With_Strings, A_S) = 0 then
               With_Strings := With_Strings & A_S;
            end if;
         end;
      end if;
   end Add_With;

   procedure Make_Create_Procedure (Index : Positive) is
      use GWindows.GStrings.Handling;
      use GWindows.GStrings.Constants;

      function Create_Function return GWindows.GString;
      function Create_Inits return GWindows.GString;

      T : constant GWindows.GString := Control_Type (Index);
      P : constant GWindows.GString :=
        "   function Create_Index_" & Trim (Image (Index), Left) & NL &
        "     (Parent      : GWindows.Base.Pointer_To_Base_Window_Class;"
        & NL &
        "      Control_XML : GNAVI_Window.Control_Element)" & NL &
        "     return GWindows.Base.Pointer_To_Base_Window_Class";

      Non_Enum : constant GWindows.GString :=
        "Integer Natural Positive Boolean";

      function Create_Function return GWindows.GString is
         I : constant GWindows.GString :=  "         ";
         C : GWindows.GString_Unbounded;
      begin
         C := C & "      " & With_Of (T) & "." & "Run_Mode " & NL &
           "        (" & T &
           " (C.all), GWindows.Base.Development_Create_Start);" & NL & NL;

         C := C & "      " & With_Of (T) & "." & "Create " & NL &
           "        (" & T & " (C.all)," & NL &
           I & "Parent => Parent.all, " & NL;

         for N in 1 .. Control_Create_Properties_Count (Index) loop
            declare
               A : constant GWindows.GString :=
                 Control_Create_Property_Type (Index, N);
            begin
               C := C & I &
                 Control_Create_Property_Name (Index,
                                               N)
                 & " => ";

               if GWindows.GStrings.Handling.Index (Non_Enum, A) > 0 then
                  C := C &
                    "GNAVI_Window.Get_Create_Property (Control_XML, """ &
                    Control_Create_Property_Name (Index, N) & """),";
               elsif A = "GWindows.GString" then
                  C := C &
                    "GNAVI_Window.Trim_Ends (" &
                    "GNAVI_Window.Get_Create_Property (Control_XML, """ &
                    Control_Create_Property_Name (Index, N) & """)),";
               else
                  C := C & A & "'Value (GNAVI_Window.Strip_Type (" &
                    "GNAVI_Window.Get_Create_Property (Control_XML, """ &
                    Control_Create_Property_Name (Index, N) & """))),";
               end if;

               C := C & NL;
            end;
         end loop;

         return To_GString_From_Unbounded (C) & I &
           "Is_Dynamic => True);";
      end Create_Function;

      function Create_Inits return GWindows.GString is
         I : constant GWindows.GString :=  "      ";
         C : GWindows.GString_Unbounded;
      begin
         C := C &
           I & "for N in 1 .. GNAVI_Window.Init_Property_Count " &
           "(Control_XML) loop" & NL &
           I & "   declare" & NL &
           I & "      P : constant GWindows.GString :=" & NL &
           I & "        GNAVI_Window.Init_Property_Name (Control_XML, N);" &
           NL &
           I & "   begin" & NL;

         for N in 1 .. Control_Init_Properties_Count (Index) loop
            declare
               PN : constant GWindows.GString :=
                 Control_Init_Property_Name (Index, N);
               A  : constant GWindows.GString :=
                 Control_Init_Property_Type (Index, N);
            begin
               C := C &
                 I & "      " & (if N = 1 then "" else "els") & "if P = """ & PN & """ then" & NL &
                 I & "         " & With_Of (T) & "." & PN & NL &
                 I & "           (" & T & " (C.all)," & NL;

               if GWindows.GStrings.Handling.Index (Non_Enum, A) > 0 then
                  C := C &
                    I & "            GNAVI_Window.Get_Init_Property " &
                    "(Control_XML, """ & PN & """));" & NL;
               elsif A = "GWindows.GString" then
                  C := C &
                    I & "            GNAVI_Window.Trim_Ends" & NL &
                    I & "             (GNAVI_Window.Get_Init_Property " &
                    "(Control_XML, """ & PN & """)));" & NL;
               else
                  C := C &
                    I & "            " & A & "'Value" & NL &
                    I & "             (GNAVI_Window.Strip_Type" & NL &
                    I & "              (GNAVI_Window.Init_Property_Value" &
                    " (Control_XML, N))));" & NL;
               end if;
            end;
         end loop;

         C := C &
           I & "      end if;" & NL &
           I & "   end;" & NL &
           I & "end loop;";

         return To_GString_From_Unbounded (C);
      end Create_Inits;

   begin
      Add_With (T);

      Dispatch_Strings := Dispatch_Strings &
        "   elsif T = """ & T & """ then" & NL &
        "      return Create_Index_" & Trim (Image (Index), Left) &
        " (Parent, Control_XML);" & NL;

      Spec_Strings := Spec_Strings & P & ";" & NL & NL;

      Body_Strings := Body_Strings & P & NL &
        "   is" & NL &
        "       C : constant GWindows.Base.Pointer_To_Base_Window_Class :=" & NL &
        "         GWindows.Base.Pointer_To_Base_Window_Class'" & NL &
        "         (new " & T & ");" & NL &
        "   begin" & NL &
        Create_Function & NL & NL &
        Create_Inits & NL & NL &
        "      return C;" & NL &
        "   end Create_Index_" & Trim (Image (Index), Left) & ";" & NL & NL;

   end Make_Create_Procedure;

begin
   GNAVI_Controls.Init;

   Put_Line ("Processing" & Image (Control_Count) & " controls");
   New_Line;

   With_Strings := With_Strings &
     "--  with GWindows.GStrings.IO; use GWindows.GStrings.IO;" & NL;

   for N in 1 .. Control_Count loop
      if Control_Category (N) /= "Windows" then
         Make_Create_Procedure (N);
      end if;
   end loop;

   Spec_Strings :=
     Caveat_Generated &
     "with GNAVI_Window;" & NL &
     "with GWindows.Base;" & NL & NL &
     "package Control_Creators is" & NL & NL &
     Spec_Strings &
     "end Control_Creators;" & NL;
   Write_File ("control_creators.ads",
               To_GString_From_Unbounded (Spec_Strings));

   Body_Strings :=
     Caveat_Generated &
     "with GWindows.Colors;" & NL &
     With_Strings & NL &
     "package body Control_Creators is" & NL & NL &
     Body_Strings &
     "end Control_Creators;" & NL;
   Write_File ("control_creators.adb",
               To_GString_From_Unbounded (Body_Strings));

   Dispatch_Strings :=
     Caveat_Generated &
     "with GNAVI_Window;" & NL &
     "with Control_Creators; use Control_Creators;" & NL & NL &
     "separate (GNAVI_Layout_View.Controls)" & NL &
     "function Dispatch" & NL &
     "     (Parent      : GWindows.Base.Pointer_To_Base_Window_Class;" & NL &
     "      Control_XML : GNAVI_Window.Control_Element)" & NL &
     "     return GWindows.Base.Pointer_To_Base_Window_Class" & NL &
     "is" & NL &
     "   T : constant GWindows.GString := GNAVI_Window.Control_Type " &
     "(Control_XML);" & NL &
     "begin" & NL &
     "   if False then" & NL &
     "      return null;" & NL &
     Dispatch_Strings & NL &
     "   else" & NL &
     "      return null;" & NL &
     "   end if;" & NL &
     "end Dispatch;" & NL;
   Write_File ("gnavi_layout_view-controls-dispatch.adb",
               To_GString_From_Unbounded (Dispatch_Strings));

   Put_Line ("Done");
end Control_Generator;
