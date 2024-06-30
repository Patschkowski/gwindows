with GWindows.Application;
with GWindows.Drawing_Objects;

--  GNAVI: No user changes may be made here

separate (GNAVI_New_Project_Package)
procedure On_Create (Window : in out GNAVI_New_Project_Type)
is
begin
On_Create_Handler (Window, Do_Create'Access);
On_Close_Handler (Window, Do_Close'Access);
   Keyboard_Support (Window, True);
   Width (Window, 300);
   Height (Window, 425);
   Text (Window, "New Project Wizard...");
   Visible (Window, False);
   Set_Standard_Font (Window, GWindows.Drawing_Objects.Default_GUI);
   GWindows.Packing_Boxes.Create (Window.New_Project_Box,
      Parent => Window,
      direction => GWindows.Packing_Boxes.Vertical,
      height => 1,
      left => 0,
      top => 0,
      width => 1);
   GWindows.Packing_Boxes.Border (Window.New_Project_Box, True);
   GWindows.Packing_Boxes.Padding (Window.New_Project_Box, 5);
   GWindows.Packing_Boxes.Fill_Width (Window.New_Project_Box, True);
   GWindows.Packing_Boxes.Dock (Window.New_Project_Box, GWindows.Base.Fill);
   GWindows.Packing_Boxes.Inset_Left (Window.New_Project_Box, 3);
   GWindows.Packing_Boxes.Inset_Top (Window.New_Project_Box, 3);
   GWindows.Packing_Boxes.Inset_Right (Window.New_Project_Box, 3);
   GWindows.Packing_Boxes.Inset_Bottom (Window.New_Project_Box, 3);
   GWindows.Static_Controls.Create (Window.Project_Label,
      Parent => Window.New_Project_Box,
      alignment => GWindows.Static_Controls.Left,
      height => 20,
      left => 0,
      text => "Enter new project's name:",
      top => 0,
      width => 1);
   GWindows.Edit_Boxes.Create (Window.Project_Name_Box,
      Parent => Window.New_Project_Box,
      height => 20,
      left => 0,
      text => "",
      top => 0,
      width => 1);
   GWindows.Static_Controls.Create (Window.Project_Dir_Label,
      Parent => Window.New_Project_Box,
      alignment => GWindows.Static_Controls.Left,
      height => 20,
      left => 0,
      text => "Enter new project's root directory:",
      top => 0,
      width => 1);
   GWindows.Edit_Boxes.Create (Window.Project_Dir_Box,
      Parent => Window.New_Project_Box,
      height => 20,
      left => 0,
      text => "",
      top => 0,
      width => 1);
   GWindows.Static_Controls.Create (Window.Project_Type_Label,
      Parent => Window.New_Project_Box,
      alignment => GWindows.Static_Controls.Left,
      height => 20,
      left => 0,
      text => "Choose new project's type:",
      top => 0,
      width => 1);
   GWindows.List_Boxes.On_Selection_Change_Handler (Window.Project_Type_List, Do_Select'Access);
   GWindows.List_Boxes.Create (Window.Project_Type_List,
      Parent => Window.New_Project_Box,
      height => 120,
      left => 0,
      sort => False,
      top => 0,
      width => 1);
   GWindows.Edit_Boxes.Create (Window.Description_Box,
      Parent => Window.New_Project_Box,
      height => 120,
      left => 0,
      top => 0,
      width => 1,
      text => "");
   GWindows.Edit_Boxes.Tab_Stop (Window.Description_Box, False);
   GWindows.Edit_Boxes.Read_Only (Window.Description_Box, True);
   GWindows.Packing_Boxes.Create (Window.Button_Pack_Box,
      Parent => Window.New_Project_Box,
      direction => GWindows.Packing_Boxes.Horizontal_From_Center,
      height => 50,
      left => 0,
      top => 0,
      width => 1);
   GWindows.Packing_Boxes.Padding (Window.Button_Pack_Box, 5);
   GWindows.Packing_Boxes.Fill_Width (Window.Button_Pack_Box, True);
   GWindows.Packing_Boxes.Inset_Left (Window.Button_Pack_Box, 3);
   GWindows.Packing_Boxes.Inset_Top (Window.Button_Pack_Box, 3);
   GWindows.Packing_Boxes.Inset_Right (Window.Button_Pack_Box, 3);
   GWindows.Packing_Boxes.Inset_Bottom (Window.Button_Pack_Box, 3);
   GWindows.Buttons.On_Click_Handler (Window.OK_Button, Do_OK'Access);
   GWindows.Buttons.Create (Window.OK_Button,
      Parent => Window.Button_Pack_Box,
      height => 35,
      left => 0,
      text => "&OK",
      top => 0,
      width => 60);
   GWindows.Buttons.Create (Window.Cancel_Button,
      Parent => Window.Button_Pack_Box,
      height => 35,
      left => 0,
      text => "&Cancel",
      top => 0,
      width => 60);
   GWindows.Windows.On_Create (GWindows.Windows.Window_Type (Window));
end On_Create;
