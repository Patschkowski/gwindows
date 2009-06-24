-- Convert a C-headerfile containing only defines for resource-IDs
-- to an Ada-spec. It is expected that each line contains a simgle
-- #define for a synonym of a number, e.g.: "define THISID 100"

with Text_IO; use Text_IO;
with RC_Help;

package body Resource_Header is

  procedure Convert_Header_File  (Name : String; Done : out Boolean) is

    H_File : File_Type;

    Input_Line_Nr : Integer := 0;
    Line : String (1..1024);
    Len : Integer;
    Was_Comment : boolean;
    Comment : String (1..256);
    Comment_Len : Integer;

    procedure Adjust_Input (S : in out String; l : in out Integer) is
      j : Integer := 1;
      pos : Integer := 0;
      so : String := S;

      procedure Skip_Comment (s : in out String; l : in out Integer) is
        p : Integer := 0;
        str : String (1..s'Last);
        In_Comment : boolean := false;
        Comment_Start : Integer;
        Comm_Len : Integer;
      begin
        Comment_Len := 0;

        if l < 2 then return; end if;

        for i in 1 .. l - 1
        loop
          if s (i..i+1) ="//"
          then
            Was_Comment := True;
            Comment_Start := i + 2;
            Comm_Len := l - i - 1;
            Comment (Comment_Len + 1 .. Comment_Len + Comm_Len) := s (Comment_Start .. Comment_Start + Comm_Len - 1);
            Comment_Len := Comment_Len + Comm_Len;

            l := i - 1;
            exit;
          end if;
        end loop;

        for i in 1 .. l
        loop
          if (i < l) and then (s (i..i+1) = "/*")
          then
            In_Comment := true;
            Comment_Start := i + 2;
          end if;

          if not In_Comment
          then
            p := p + 1;
            str (p) := s (i);
          end if;

          if (i > 1) and then (s (i-1..i) = "*/")
          then
            In_Comment := false;

            Was_Comment := True;
            Comm_Len := i - 1 - Comment_Start;
            Comment (Comment_Len + 1 .. Comment_Len + Comm_Len) := s (Comment_Start .. Comment_Start + Comm_Len - 1);
            Comment_Len := Comment_Len + Comm_Len;
          end if;
        end loop;

        s := str;
        l := p;
      end Skip_Comment;
    begin
      for i in s'range
      loop
        if S (i) = Character'Val (09)
        then
          S (i) := ' ';
        end if;
      end loop;

      Was_Comment := false;
      Skip_Comment (S, l);

      while (l > 0) and then (S (l) = ' ')
      loop
        l := l - 1;
      end loop;

      while (j < l) and then (s (j) = ' ')
      loop
        j := j + 1;
      end loop;

      while (j <= l) and then (s (j) /= ' ')
      loop
        pos := pos + 1;
        so (pos) := S (j);
        j := j + 1;
      end loop;

      if j < l
      then
        pos := pos + 1;
        so (pos) := ',';

        while (j < l) and then (s (j) = ' ')
        loop
          j := j + 1;
        end loop;

        while (j <= l) and then (s (j) /= ' ')
        loop
          pos := pos + 1;
          so (pos) := S (j);
          j := j + 1;
        end loop;

        if j < l
        then
          pos := pos + 1;
          so (pos) := ',';

          while (j < l) and then (s (j) = ' ')
          loop
            j := j + 1;
          end loop;

          if j <= l
          then
            while (j <= l) and then (s (j) /= ' ')
            loop
              pos := pos + 1;
              so (pos) := S (j);
              j := j + 1;
            end loop;

            if j >= l
            then
              pos := pos + 1;
              so (pos) := ';';
            end if;
          end if;
        end if;
      end if;

      l := pos;
      S := so;
    end Adjust_Input;

    procedure Generate_Output (s : String) is
      f : constant Integer := s'First;
      l : Integer := s'Last;
      c,d : Integer := 0;
      dummy : Integer;

      procedure Insert(s: String) is
      begin
        if s(s'First)= '_' then
          RC_Help.Insert_symbol(s(s'First+1..s'Last), dummy);
        else
          RC_Help.Insert_symbol(s, dummy);
        end if;
      end;

    begin
      -- put_line("@..." & s & "@");
      if s = "#endif" then
        return;
      end if;
      if l >= 7 and then s (f..f+6) = "#ifdef," then
        return;
      end if;
      if l >= 8 and then s (f..f+7) = "#ifndef," then
        return;
      end if;

      if s (l) /= ';'
      then
        raise Unexpected_Syntax;
      end if;

      if s (f..f+7) /= "#define,"
      then
        raise No_Define;
      end if;

      for i in f+8 .. l
      loop
        if s(i) = ','
        then
          c := i;
          exit;
        end if;
      end loop;

      if c > 0
      then
        begin
          d:= c;
          if s (l-1) = ')' then l := l-1; end if;
          if s (d+1) = '(' then d := d+1; end if;
          if s (l-1) = 'L' then l := l-1; end if;

          if s (d+1 .. d+2) = "0x"
          then
            dummy := Integer'Value ("16#" & s (d+3..l-1) & "#");
          elsif s (d+1) = '0'
          then
            dummy := Integer'Value ("8#" & s (d+1..l-1) & "#");
          elsif s (d+1) = '-' or s (d+1) in '1' .. '9'
          then
            dummy := Integer'Value (s (d+1..l-1));
          else
            raise Illegal_Number;
          end if;
        exception
          when others =>
            raise Illegal_Number with s (d+1..l-1);
        end;
        Insert(s (f+8..c-1));
      end if;

    end Generate_Output;

  begin
    Done := False;

    begin
      Open (H_File, In_File, Name);
    exception
      when Name_Error =>
        return; -- just not done...
    end;

    while not End_Of_File (H_File) loop
      Input_Line_Nr := Input_Line_Nr + 1;
      Get_Line (H_File, Line, Len);
      --  put_line ("1:" & line (1..len));
      Adjust_Input (Line, Len);
      --  put_line ("2:" & line (1..len));
      if Len > 0 then
        Generate_Output (Line (1..Len));
      elsif Was_Comment then
        null;
      end if;
    end loop;

    Close (H_File);

    Done := True;

  exception
    when Unexpected_Syntax  =>
      Close (H_File);
      raise Unexpected_Syntax with Integer'Image (Input_Line_NR);
--    when Illegal_Number =>
--      Close (H_File);
--      raise Illegal_Number with Integer'Image (Input_Line_NR);
    when No_Define =>
      Close (H_File);
      raise No_Define with Integer'Image (Input_Line_NR);
  end Convert_Header_File;

end Resource_Header;