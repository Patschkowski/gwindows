
-- This header comes from RC.y (bottom)

with RC_Tokens, RC_Shift_Reduce, RC_Goto, RC_Help, RC_IO;
use  RC_Tokens, RC_Shift_Reduce, RC_Goto, RC_Help, RC_IO;

with RC_DFA, YYroutines, YYerror;
use  RC_DFA, YYroutines;

with Ada.Text_IO;                       use Ada.Text_IO;
with Text_IO; -- for compat.

with Ada.Characters.Handling;           use Ada.Characters.Handling;
with Ada.Strings.Fixed;                 use Ada.Strings, Ada.Strings.Fixed;

with Interfaces;                        use Interfaces;

with GWindows.Static_Controls;

-- Header end.

--  Warning: This file is automatically generated by AYACC.
--           It is useless to modify it. Change the ".Y" & ".L" files instead.

with YY_Sizes;
-- ^ 14-Jan-2006 (GdM): configurable sizes instead of hard-coded
--   ones in AYACC's output

procedure YYParse is

   -- Rename User Defined Packages to Internal Names.
    package yy_goto_tables         renames
      Rc_Goto;
    package yy_shift_reduce_tables renames
      Rc_Shift_Reduce;
    package yy_tokens              renames
      Rc_Tokens;
    package yy_io                  renames -- (+GdM 2008)
      Rc_IO;

   use yy_tokens, yy_goto_tables, yy_shift_reduce_tables;

   procedure yyerrok;
   procedure yyclearin;


   package yy is

       -- the size of the value and state stacks
       --  Affects error 'Stack size exceeded on state_stack'
       stack_size : constant Natural := yy_sizes.stack_size; -- was 300, then 8192

       -- subtype rule         is natural;
       subtype parse_state  is natural;
       -- subtype nonterminal  is integer;

       -- encryption constants
       default           : constant := -1;
       first_shift_entry : constant :=  0;
       accept_code       : constant := -3001;
       error_code        : constant := -3000;

       -- stack data used by the parser
       tos                : natural := 0;
       value_stack        : array(0..stack_size) of yy_tokens.yystype;
       state_stack        : array(0..stack_size) of parse_state;

       -- current input symbol and action the parser is on
       action             : integer;
       rule_id            : rule;
       input_symbol       : yy_tokens.token:= Error;


       -- error recovery flag
       error_flag : natural := 0;
          -- indicates  3 - (number of valid shifts after an error occurs)

       look_ahead : boolean := true;
       index      : integer;

       -- Is Debugging option on or off
        DEBUG : constant boolean := FALSE;

    end yy;


    function goto_state
      (state : yy.parse_state;
       sym   : nonterminal) return yy.parse_state;

    function parse_action
      (state : yy.parse_state;
       t     : yy_tokens.token) return integer;

    pragma inline(goto_state, parse_action);


    function goto_state(state : yy.parse_state;
                        sym   : nonterminal) return yy.parse_state is
        index : integer;
    begin
        index := goto_offset(state);
        while  integer(goto_matrix(index).nonterm) /= sym loop
            index := index + 1;
        end loop;
        return integer(goto_matrix(index).newstate);
    end goto_state;


    function parse_action(state : yy.parse_state;
                          t     : yy_tokens.token) return integer is
        index      : integer;
        tok_pos    : integer;
        default    : constant integer := -1;
    begin
        tok_pos := yy_tokens.token'pos(t);
        index   := shift_reduce_offset(state);
        while integer(shift_reduce_matrix(index).t) /= tok_pos and then
              integer(shift_reduce_matrix(index).t) /= default
        loop
            index := index + 1;
        end loop;
        return integer(shift_reduce_matrix(index).act);
    end parse_action;

-- error recovery stuff

    procedure handle_error is
      temp_action : integer;
    begin

      if yy.error_flag = 3 then -- no shift yet, clobber input.
      if yy.debug then
          text_io.put_line("Ayacc.YYParse: Error Recovery Clobbers " &
                   yy_tokens.token'image(yy.input_symbol));
      end if;
        if yy.input_symbol = yy_tokens.end_of_input then  -- don't discard,
        if yy.debug then
            text_io.put_line("Ayacc.YYParse: Can't discard END_OF_INPUT, quiting...");
        end if;
        raise yy_tokens.syntax_error;
        end if;

            yy.look_ahead := true;   -- get next token
        return;                  -- and try again...
    end if;

    if yy.error_flag = 0 then -- brand new error
        if yy_io.Input_Line > 1 then
            yyerror("Syntax Error at line" & Text_IO.Count'Image(yy_io.Input_Line));
        else
            yyerror("Syntax Error at line 1 (or possibly later and the AFLex -E option was omitted).");
        end if;
    end if;

    yy.error_flag := 3;

    -- find state on stack where error is a valid shift --

    if yy.debug then
        text_io.put_line("Ayacc.YYParse: Looking for state with error as valid shift");
    end if;

    loop
        if yy.debug then
          text_io.put_line("Ayacc.YYParse: Examining State " &
               yy.parse_state'image(yy.state_stack(yy.tos)));
        end if;
        temp_action := parse_action(yy.state_stack(yy.tos), error);

            if temp_action >= yy.first_shift_entry then
                if yy.tos = yy.stack_size then
                    text_io.put_line(" Stack size exceeded on state_stack");
                    raise yy_Tokens.syntax_error;
                end if;
                yy.tos := yy.tos + 1;
                yy.state_stack(yy.tos) := temp_action;
                exit;
            end if;

        Decrement_Stack_Pointer :
        begin
          yy.tos := yy.tos - 1;
        exception
          when Constraint_Error =>
            yy.tos := 0;
        end Decrement_Stack_Pointer;

        if yy.tos = 0 then
          if yy.debug then
            text_io.put_line("Ayacc.YYParse: Error recovery popped entire stack, aborting...");
          end if;
          raise yy_tokens.syntax_error;
        end if;
    end loop;

    if yy.debug then
        text_io.put_line("Ayacc.YYParse: Shifted error token in state " &
              yy.parse_state'image(yy.state_stack(yy.tos)));
    end if;

    end handle_error;

   -- print debugging information for a shift operation
   procedure shift_debug(state_id: yy.parse_state; lexeme: yy_tokens.token) is
   begin
       text_io.put_line("Ayacc.YYParse: Shift "& yy.parse_state'image(state_id)&" on input symbol "&
               yy_tokens.token'image(lexeme) );
   end;

   -- print debugging information for a reduce operation
   procedure reduce_debug(rule_id: rule; state_id: yy.parse_state) is
   begin
       text_io.put_line("Ayacc.YYParse: Reduce by rule "&rule'image(rule_id)&" goto state "&
               yy.parse_state'image(state_id));
   end;

   -- make the parser believe that 3 valid shifts have occured.
   -- used for error recovery.
   procedure yyerrok is
   begin
       yy.error_flag := 0;
   end yyerrok;

   -- called to clear input symbol that caused an error.
   procedure yyclearin is
   begin
       -- yy.input_symbol := yylex;
       yy.look_ahead := true;
   end yyclearin;


begin
    -- initialize by pushing state 0 and getting the first input symbol
    yy.state_stack(yy.tos) := 0;


    loop

        yy.index := shift_reduce_offset(yy.state_stack(yy.tos));
        if integer(shift_reduce_matrix(yy.index).t) = yy.default then
            yy.action := integer(shift_reduce_matrix(yy.index).act);
        else
            if yy.look_ahead then
                yy.look_ahead   := false;

                yy.input_symbol := yylex;
            end if;
            yy.action :=
             parse_action(yy.state_stack(yy.tos), yy.input_symbol);
        end if;


        if yy.action >= yy.first_shift_entry then  -- SHIFT

            if yy.debug then
                shift_debug(yy.action, yy.input_symbol);
            end if;

            -- Enter new state
            if yy.tos = yy.stack_size then
                text_io.put_line(" Stack size exceeded on state_stack");
                raise yy_Tokens.syntax_error;
            end if;
            yy.tos := yy.tos + 1;
            yy.state_stack(yy.tos) := yy.action;
              yy.value_stack(yy.tos) := yylval;

        if yy.error_flag > 0 then  -- indicate a valid shift
            yy.error_flag := yy.error_flag - 1;
        end if;

            -- Advance lookahead
            yy.look_ahead := true;

        elsif yy.action = yy.error_code then       -- ERROR

            handle_error;

        elsif yy.action = yy.accept_code then
            if yy.debug then
                text_io.put_line("Ayacc.YYParse: Accepting Grammar...");
            end if;
            exit;

        else -- Reduce Action

            -- Convert action into a rule
            yy.rule_id  := -1 * yy.action;

            -- Execute User Action
            -- user_action(yy.rule_id);


                case yy.rule_id is

when 1 => -- #line 221
RC_Help.YY_ACCEPT;

when 2 => -- #line 222
RC_Help.YY_ABORT;

when 25 => -- #line 262
 style_switch(simple_border):= True; 

when 37 => -- #line 275
 style_switch(disabled):= True; 

when 47 => -- #line 293
 if anonymous_item then
                   anonymous_dialog_counter:=
                     anonymous_dialog_counter+1;
                   last_dialog_ident:= U("Dialog_" &
                     Trim(Integer'Image(anonymous_dialog_counter),both));
                 else
                   last_dialog_ident:= last_ident;
                 end if;
               

when 48 => -- #line 303

                 Open_if_separate(S(last_dialog_ident));
                 Ada_Put_Line(to_spec,
                   "  type " & S(last_dialog_ident) &
                   "_Type is new Window_type with record"
                 );
                 Ada_New_Line(to_spec);
                 Ada_New_Line(to_body);
                 last_caption:= U("""""");
                 style_switch:= (others => False); -- Reset all style switches
                 static_counter:= 0;
               

when 49 => -- #line 317

                 last_dialog_rect:= last_rect;
               

when 50 => -- #line 321

                 last_dialog_caption:= last_caption;
                 Ada_Proc_Dialog(
                    to_body,
                    S(last_dialog_ident) & "_Type",
                    S(last_dialog_caption)
                 );
               

when 51 => -- #line 331
 empty_dialog_record:= True; 

when 52 => -- #line 334
 Ada_Proc_Dialog(
                    to_spec,
                    S(last_dialog_ident) & "_Type",
                    S(last_dialog_caption)
                 );
                 Ada_Put_Line(to_spec, ";");
                 Ada_New_Line(to_spec);
                 Ada_Put_Line(to_body,
                   "  end Create_Contents; -- " &
                   S(last_dialog_ident) & "_Type" );
                 Ada_New_Line(to_body);
                 Close_if_separate(S(last_dialog_ident));
               

when 65 => -- #line 376
 style_switch(shell_font):= True; 

when 85 => -- #line 415
 style_switch(shell_font):= True; 

when 86 => -- #line 416
 style_switch(shell_font):= True; 

when 87 => -- #line 417
 style_switch(shell_font):= True; 

when 100 => -- #line 446
 last_caption:= U(yytext); 

when 102 => -- #line 450

              style_switch:= (others => False); -- Reset all style switches
              last_text:= U("""""");
            

when 105 => -- #line 459
empty_dialog_record:= False;

when 107 => -- #line 461
empty_dialog_record:= False;

when 108 => -- #line 462
empty_dialog_record:= False;

when 109 => -- #line 463
empty_dialog_record:= False;

when 110 => -- #line 464
empty_dialog_record:= False;

when 111 => -- #line 465
empty_dialog_record:= False;

when 112 => -- #line 466
empty_dialog_record:= False;

when 113 => -- #line 467
empty_dialog_record:= False;

when 114 => -- #line 468
empty_dialog_record:= False;

when 115 => -- #line 478
 control:= unknown; 

when 116 => -- #line 480
 last_control_text:= U(yytext); 

when 117 => -- #line 483
 Insert_last_symbol;
               

when 118 => -- #line 487
 last_class:= U(yytext); 

when 119 => -- #line 493
 Ada_untyped_control; 

when 123 => -- #line 504
 Identify_control_class(yytext); 

when 125 => -- #line 518
 control:= date_time;
		

when 128 => -- #line 524
 control:= calendar;
		

when 130 => -- #line 529
 control:= progress;
          Control_Direction:= Horizontal;
		

when 136 => -- #line 539
 control:= track_bar;
          Trackbar_Control_Ticks:= No_Ticks;
          Control_Direction:= Horizontal;
        

when 137 => -- #line 544
 control:= up_down;
          Control_Direction:= Vertical;
		

when 146 => -- #line 557
 control:= list_view;
		

when 150 => -- #line 565
 control:= static; 

when 151 => -- #line 569
 control:= static; 

when 152 => -- #line 572
 control:= tab_control; 

when 153 => -- #line 575
 control:= tree_view; 

when 161 => -- #line 589
 Control_Direction:= Vertical; 

when 163 => -- #line 592
 Control_Direction:= Vertical; 

when 164 => -- #line 594
 Trackbar_Control_Ticks:= Top_Ticks; 

when 165 => -- #line 596
 Trackbar_Control_Ticks:= Bottom_Ticks; 

when 168 => -- #line 601
 style_switch(tips):= True; 

when 170 => -- #line 604
 Control_Direction:= Horizontal; 

when 171 => -- #line 606
 style_switch(keys):= True; 

when 172 => -- #line 608
 style_switch(wrap):= True; 

when 173 => -- #line 610
 style_switch(no_1000):= True; 

when 191 => -- #line 629
 style_switch(tips):= True; 

when 193 => -- #line 632
 style_switch(has_lines):= True; 

when 195 => -- #line 635
 style_switch(has_buttons):= True; 

when 196 => -- #line 637
 style_switch(lines_at_root):= True; 

when 200 => -- #line 642
 style_switch(single_expand):= True; 

when 220 => -- #line 680
 style_switch(fully_sunken):= True; 

when 221 => -- #line 682
 style_switch(half_sunken):= True; 

when 236 => -- #line 704
 style_switch(half_sunken):= True; 

when 239 => -- #line 708
 control:= bitmap; -- overrides the "control:= static;" of WC_STATIC
            

when 249 => -- #line 720
 style_switch(whiterect):= True; 

when 255 => -- #line 737

              Ada_edit_control;
            

when 266 => -- #line 766
 style_switch(multi_line):= True; 

when 268 => -- #line 768
 style_switch(auto_h_scroll):= True; 

when 269 => -- #line 769
 style_switch(auto_v_scroll):= True; 

when 279 => -- #line 785
 Ada_label_control; 

when 280 => -- #line 788
last_alignment:= GWindows.Static_Controls.Left;   

when 281 => -- #line 789
last_alignment:= GWindows.Static_Controls.Center; 

when 282 => -- #line 790
last_alignment:= GWindows.Static_Controls.Right;  

when 283 => -- #line 798
 combo:= no_drop; 

when 284 => -- #line 801

              Ada_normal_control(
                Combo_type_name(combo),
                 ", " & S(last_text),
                 ", " & Boolean'Image(style_switch(sort))
              );
            

when 292 => -- #line 828
 combo:= no_drop; 

when 293 => -- #line 829
 combo:= drop_down; 

when 294 => -- #line 830
 combo:= drop_down_list; 

when 295 => -- #line 831
 style_switch(sort):= True; 

when 302 => -- #line 847

              Ada_Put_Line(to_spec, "    " & S(last_Ada_ident) & ": Group_Box_Type;");
              Ada_Coord_conv(last_rect);
              Ada_Put_Line(to_body,
                "    Create( Window." & S(last_Ada_ident) & ", Window, " &
                S(last_text) & ", x,y,w,h);"
              );
            

when 310 => -- #line 882

              Ada_normal_control(
                "List_Box_Type",
                 "",
                 ", " & Boolean'Image(style_switch(sort))
              );
            

when 317 => -- #line 908
 style_switch(sort):= True; 

when 332 => -- #line 932

              style_switch(checkbox):= True;
              Ada_button_control;
            

when 333 => -- #line 939
 style_switch(auto):= False;
                 style_switch(state3):= False;
               

when 334 => -- #line 943
 style_switch(auto):= False;
                 style_switch(state3):= True;
               

when 335 => -- #line 947
 style_switch(auto):= True;
                 style_switch(state3):= False;
               

when 336 => -- #line 951
 style_switch(auto):= True;
                 style_switch(state3):= True;
               

when 337 => -- #line 964

              style_switch(push):= True;
              Ada_button_control;
            

when 339 => -- #line 973
 style_switch(default):= True; 

when 340 => -- #line 984

              style_switch(radio):= True;
              Ada_button_control;
            

when 342 => -- #line 993
 style_switch(auto):= True; 

when 351 => -- #line 1020
 style_switch(auto):= True;
              style_switch(radio):= True;
            

when 352 => -- #line 1024
 style_switch(radio):= True; 

when 353 => -- #line 1026
 style_switch(state3):= True; 

when 354 => -- #line 1028
 style_switch(state3):= True;
              style_switch(auto):= True;
            

when 355 => -- #line 1032
 style_switch(checkbox):= True; 

when 356 => -- #line 1034
 style_switch(auto):= True;
              style_switch(checkbox):= True; 

when 369 => -- #line 1049
 style_switch(push):= True; 

when 370 => -- #line 1051
 style_switch(push):= True;
              style_switch(default):= True; 

when 374 => -- #line 1066

              if style_switch(vertical) then
                Ada_normal_control("GWindows.Scroll_Bars.Scroll_Bar_Type", ", Vertical");
              else
                Ada_normal_control("GWindows.Scroll_Bars.Scroll_Bar_Type", ", Horizontal");
              end if;
            

when 379 => -- #line 1085
 style_switch(vertical):= True; 

when 382 => -- #line 1096
 last_control_text:= U(yytext); 

when 383 => -- #line 1100
 if S(last_control_text) = """""" then
                null; -- phantom icon...
              else
                Ada_normal_control(
                  "GWindows.Static_Controls.Icon_Type",
                  ", Num_resource(" & S(last_control_text) & ')' ,
                  with_id => False);
              end if;
            

when 386 => -- #line 1119
 Insert_last_symbol; 

when 388 => -- #line 1126
 last_text:= U(yytext); 

when 390 => -- #line 1132
 RC_Help.last_rect.x:= yylval.intval;
       

when 391 => -- #line 1136
 RC_Help.last_rect.y:= yylval.intval;
       

when 392 => -- #line 1140
 RC_Help.last_rect.w:= yylval.intval;
       

when 393 => -- #line 1144
 RC_Help.last_rect.h:= yylval.intval;
       

when 394 => -- #line 1153
 if anonymous_item then
           anonymous_menu_counter:=
             anonymous_menu_counter+1;
           last_dialog_ident:= U("Menu_" &
             Trim(Integer'Image(anonymous_menu_counter),both));
         else
           last_dialog_ident:= last_ident;
         end if;
       

when 395 => -- #line 1164

         Open_if_separate(S(last_dialog_ident));
         Ada_Put_Line(to_spec,
           "  type " & S(last_dialog_ident) &
           "_Type is tagged record"
         );
         menu_popup_counter:= 0;
         popup_top:= 0;
         Ada_Put_Line(to_spec,
           "    Main: Menu_Type; -- Root of the whole menu tree"
         );
         Ada_New_Line(to_body);
         Ada_Proc_Menu(
            to_body,
            S(last_dialog_ident) & "_Type"
         );
         Ada_New_Line(to_body);
         Ada_Put_Line(to_body, "  is");
         Ada_Put_Line(to_body, "  begin");
         Ada_Put_Line(to_body, "    Menu.Main:= Create_Menu;");
       

when 396 => -- #line 1186
 empty_dialog_record:= True;
       

when 397 => -- #line 1190
 if empty_dialog_record then
           Ada_Put_Line(to_spec, "    null; -- empty!");
         end if;
         Ada_Put_Line(to_spec,
           "  end record; -- " & S(last_dialog_ident) & "_Type"
         );
         Ada_New_Line(to_spec);
         Ada_Proc_Menu(
            to_spec,
            S(last_dialog_ident) & "_Type"
         );
         Ada_Put_Line(to_spec, ";");
         Ada_New_Line(to_spec);
         Ada_Put_Line(to_body,
           "  end Create_Full_Menu; -- " &
           S(last_dialog_ident) & "_Type" );
         Ada_New_Line(to_body);
         Close_if_separate(S(last_dialog_ident));
       

when 404 => -- #line 1225
 empty_dialog_record:= False; 

when 405 => -- #line 1230
 last_popup_title:= U(yytext); 

when 406 => -- #line 1232

              menu_popup_counter:= menu_popup_counter + 1;
              Ada_Put_Line(to_spec,
                "    " &
                Popup_num_to_Ada_ident(menu_popup_counter) &
                ": Menu_Type; "
                & " -- level" & Integer'Image(popup_top+1) &
                "; title: " &
                S(last_popup_title)
              );
              Ada_Put_Line(to_body,
                "    Menu." &
                Popup_num_to_Ada_ident(menu_popup_counter) &
                ":= Create_Popup;"
              );
              Ada_Put_Line(to_body,
                "    Append_Menu(Menu." &
                Popup_num_to_Ada_ident(popup_stack(popup_top)) &
                ", " & S(last_popup_title) &
                ", Menu." &
                Popup_num_to_Ada_ident(menu_popup_counter) &
                ");"
              );
              popup_top:= popup_top+1;
              popup_stack(popup_top):= menu_popup_counter;
            

when 407 => -- #line 1261

              popup_top:= popup_top-1;
            

when 408 => -- #line 1269

              style_switch:= (others => False); -- Reset all style switches
              Ada_Put(to_body,
                "    Append_Item(Menu." &
                Popup_num_to_Ada_ident(popup_stack(popup_top)) &
                ", " & yytext
              );
            

when 409 => -- #line 1279

              Insert_last_symbol;
              Ada_Put_Line(to_body, ", " & S(last_Ada_constant) & ");");
            

when 410 => -- #line 1284

              if style_switch(grayed) then
                Ada_Put_Line(to_body, "    State(Menu." &
                Popup_num_to_Ada_ident(popup_stack(popup_top)) &
                ", Command, " & S(last_Ada_constant) &
                ", Grayed);");
              end if;
              if style_switch(inactive) then
                Ada_Put_Line(to_body, "    State(Menu." &
                Popup_num_to_Ada_ident(popup_stack(popup_top)) &
                ", Command, " & S(last_Ada_constant) &
                ", Disabled);");
              end if;
              if style_switch(checked) then
                Ada_Put_Line(to_body, "    Check(Menu." &
                Popup_num_to_Ada_ident(popup_stack(popup_top)) &
                ", Command, " & S(last_Ada_constant) &
                ", True);");
              end if;
            

when 417 => -- #line 1318
 style_switch(grayed):= True; 

when 418 => -- #line 1319
 style_switch(inactive):= True; 

when 419 => -- #line 1320
 style_switch(checked):= True; 

when 423 => -- #line 1329

              Ada_Put_Line(to_body,
                "    Append_Separator(Menu." &
                Popup_num_to_Ada_ident(popup_stack(popup_top)) &
                ");"
              );
            

when 451 => -- #line 1417

                 Open_if_separate("Version_info", with_body => False);
                 if not separate_items then
                   Ada_Put_Line(to_spec, "  package Version_info is");
                 end if;
               

when 452 => -- #line 1425
 if not separate_items then
                   Ada_Put_Line(to_spec, "  end Version_info;");
                   Ada_New_Line(to_spec);
                 end if;
                 Close_if_separate("Version_info", with_body => False);
               

when 471 => -- #line 1476
RC_Help.version_info_value_counter:= 0;

when 476 => -- #line 1491
RC_Help.version_info_value_counter:= RC_Help.version_info_value_counter + 1;
              case RC_Help.version_info_value_counter is
                when 1 =>
                  declare
                    item: constant String:= yytext;
                  begin
                    Ada_Put(to_spec, "    " & item(item'First+1..item'Last-1));
                  end;
                when 2 =>
                  Ada_Put_Line(to_spec, ": constant String:= " & yytext & ';');
                when others =>
                  null;
              end case;
             

when 477 => -- #line 1506
RC_Help.version_info_value_counter:= RC_Help.version_info_value_counter + 1;
              case RC_Help.version_info_value_counter is
                when 1 =>
                  null; -- should not happen...
                when 2 =>
                  Ada_Put_Line(to_spec, ": constant:=" & Long_Long_Integer'Image(yylval.intval) & ';');
                when others =>
                  null;
              end case;
             

when 491 => -- #line 1576
Treat_include(yytext(2..yylength-1));

when 498 => -- #line 1601
Treat_include(yytext(2..yylength-1));

when 499 => -- #line 1604
Treat_include(yytext(2..yylength-1));

when 520 => -- #line 1672
 last_ident:= U(yytext);
             last_Ada_constant:= Ada_ify(yytext);
             last_Ada_ident:= last_Ada_constant;
             -- normally no confusion here (record entry vs int. constant)
             anonymous_item:= False;
           

when 521 => -- #line 1679
 last_ident:= U(yytext);
             last_Ada_constant:= last_ident;
             if yylval.intval < -1 then
               last_Ada_ident:= U("RC_item_Minus_Invalid" & yytext);
             elsif yylval.intval = -1 then
               New_static_item;
               last_Ada_constant:= U("IDC_STATIC");
             else
               last_Ada_ident:= U("RC_item_" & yytext);
             end if;
             anonymous_item:= True;
           

when 522 => -- #line 1692
 last_ident:= U(yytext);
             last_Ada_constant:= last_ident;
             New_static_item;
             anonymous_item:= True;
           

                    when others => null;
                end case;


            -- Pop RHS states and goto next state
            yy.tos      := yy.tos - rule_length(yy.rule_id) + 1;
            if yy.tos > yy.stack_size then
                text_io.put_line(" Stack size exceeded on state_stack");
                raise yy_Tokens.syntax_error;
            end if;
            yy.state_stack(yy.tos) := goto_state(yy.state_stack(yy.tos-1) ,
                                 get_lhs_rule(yy.rule_id));

              yy.value_stack(yy.tos) := yyval;

            if yy.debug then
                reduce_debug(yy.rule_id,
                    goto_state(yy.state_stack(yy.tos - 1),
                               get_lhs_rule(yy.rule_id)));
            end if;

        end if;


    end loop;


end yyparse;
