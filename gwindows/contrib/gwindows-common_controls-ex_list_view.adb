------------------------------------------------------------------------------
--                                                                          --
--            GWINDOWS - Ada 95 Framework for Windows Development           --
--                                                                          --
-- G W I N D O W S . C O M M O N _ C O N T R O L S . E X _ L I S T _ V I E W--
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--                                                                          --
--                 Copyright (C) 2007 - 2022 Falk Maier                     --
--                                                                          --
-- This is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 2,  or (at your option) any later ver- --
-- sion. It is distributed in the hope that it will be useful,  but WITHOUT --
-- ANY WARRANTY;  without  even the  implied warranty of MERCHANTABILITY or --
-- FITNESS FOR A PARTICULAR PURPOSE.    See the GNU General  Public License --
-- for  more details.  You should have  received  a copy of the GNU General --
-- Public License  distributed with this;  see file COPYING.  If not, write --
-- to  the Free Software Foundation,  59 Temple Place - Suite 330,  Boston, --
-- MA 02111-1307, USA.                                                      --
--                                                                          --
-- As a special exception,  if other files  instantiate  generics from this --
-- unit, or you link  this unit with other files  to produce an executable, --
-- this  unit  does not  by itself cause  the resulting  executable  to  be --
-- covered  by the  GNU  General  Public  License.  This exception does not --
-- however invalidate  any other reasons why  the executable file  might be --
-- covered by the  GNU Public License.                                      --
--                                                                          --
-- More information about GWindows and the latest current release can       --
-- be located on the web at one of the following places:                    --
--   http://sf.net/projects/gnavi/                                          --
--   https://github.com/zertovitch/gwindows                                 --
--                                                                          --
------------------------------------------------------------------------------

with System;
with Ada.Unchecked_Conversion;
with Ada.Unchecked_Deallocation;
with Ada.Exceptions; use Ada.Exceptions;

with GWindows.Constants;
with GWindows.GStrings;
with GWindows.Drawing;

package body GWindows.Common_Controls.Ex_List_View is

   --  Lvs_Ex_Gridlines             : constant := 1;
   --  Lvs_Ex_Headerdragdrop        : constant := 16;
   --  Lvs_Ex_Fullrowselect         : constant := 32;
   --  Lvs_Ex_Flatsb                : constant := 256;
   --  Lvm_Insertitema              : constant := Lvm_First + 7;
   --  Lvm_Finditema                : constant := Lvm_First + 13;
   --  Lvm_Sortitems                : constant := Lvm_First + 48;
   --  Lvm_Setextendedlistviewstyle : constant := Lvm_First + 54;
   --  Lvm_Insertitemw              : constant := Lvm_First + 77;
   Lvm_SortItemsEx              : constant := LVM_FIRST + 81;
   --  Lvm_Finditemw                : constant := Lvm_First + 83;
   --  LVM_GETCOLUMNA               : constant := Lvm_First + 25;
   --  LVM_GETCOLUMNW               : constant := Lvm_First + 95;
   --  LVM_SETCOLUMNA               : constant := LVM_FIRST + 26;
   --  LVM_SETCOLUMNW               : constant := LVM_FIRST + 96;
   --  LVM_GETSUBITEMRECT           : constant := LVM_FIRST + 56;
   LVM_SETCOLUMNWIDTH           : constant := LVM_FIRST + 30;

   LVN_FIRST                    : constant := -100;
   LVN_INSERTITEM               : constant := LVN_FIRST - 2;
   LVN_DELETEITEM               : constant := LVN_FIRST - 3;
   --  Lvfi_Param                   : constant := 1;
   --  LVCF_TEXT                    : constant := 16#0004#;
   LVM_SETBKCOLOR               : constant := LVM_FIRST + 1;
   LVM_REDRAWITEMS              : constant := LVM_FIRST + 21;
   LVM_GETHEADER                : constant := LVM_FIRST + 31;
   Lvm_Settextcolor             : constant := LVM_FIRST + 36;
   LVM_SETTEXTBKCOLOR           : constant := LVM_FIRST + 38;
   Cdrf_Notifyitemdraw          : constant := 16#00000020#;
   Cdds_Prepaint                : constant := 16#0001#;
   Cdds_Item                    : constant := 16#00010000#;
   Cdds_Itemprepaint            : constant := Cdds_Item + Cdds_Prepaint;
   Cdrf_Newfont                 : constant := 2;
   Cdrf_Notifysubitemdraw       : constant := 16#00000020#;
   Cdds_Subitem                 : constant := 16#00020000#;
   Nm_Header_Click              : constant := -108;
   --  HDI_width                   : constant := 1;
   --  HDI_height                   : constant := HDI_WIDTH;
   HDI_TEXT                   : constant := 2;
   HDI_FORMAT                   : constant := 4;
   HDF_SORTUP                   : constant := 16#400#;
   HDF_SORTDOWN                 : constant := 16#200#;
   HDF_string                   : constant := 16#4000#;
   --  HDF_right                   : constant := 1;
   --  HDF_fixedwidth                   : constant := 16#100#;
   HDF_OWNERDRAW                : constant := 16#8000#;
   HDM_FIRST                    : constant := 16#1200#;
   HDM_GETITEMA                 : constant := HDM_FIRST + 3;
   HDM_GETITEMW                 : constant := HDM_FIRST + 11;
   HDM_SETITEMA                 : constant := HDM_FIRST + 4;
   HDM_SETITEMW                 : constant := HDM_FIRST + 12;
   HDM_GETITEMCOUNT             : constant := HDM_FIRST;
   --  HDM_GETITEMRECT              : constant := HDM_FIRST + 7;

   type LVITEM_Access is access all LVITEM;

   type Nmcustomdraw_Type is
      record
         Hdr         : Base.Notification;
         Dwdrawstage : Interfaces.C.long;
         Hdc         : Types.Handle;
         Rect        : Types.Rectangle_Type;
         Dwitemspec  : Types.DWORD_PTR;  --  Fix 2020-07-10: was Interfaces.C.long;
         Uitemstate  : Interfaces.C.unsigned;
         Litemlparam : Types.Lparam;
      end record;
   --  type Pointer_To_Nmcustomdraw_Type is access all Nmcustomdraw_Type;
   type Nmlvcustomdraw_Type is
      record
         Nmcd      : Nmcustomdraw_Type;
         Clrtext   : Color_Type;
         Clrtextbk : Color_Type;
         Isubitem  : Interfaces.C.int;
      end record;
   type Pointer_To_Nmlvcustomdraw_Type is access all Nmlvcustomdraw_Type;

   type Nmlistview_Type is
      record
         Hdr       : Base.Notification;
         Iitem     : Interfaces.C.int;
         Isubitem  : Interfaces.C.int;
         Unewstate : Interfaces.C.int;
         Uoldstate : Interfaces.C.int;
         Uchanged  : Interfaces.C.int;
         Point     : Types.Point_Type;
         Lparam    : Types.Lparam;
      end record;
   type Pointer_To_Nmlistview_Type is access all Nmlistview_Type;

   --  type Lvcolumn_type is
   --     record
   --        Mask    : Interfaces.C.unsigned := 0;
   --        Format  : Interfaces.C.unsigned := 0;
   --        Width   : Integer               := 0;
   --        Text    : LPTSTR                := null;
   --        Textmax : Integer               := 0;
   --        Subitem : Integer               := 0;
   --        Image   : Integer               := 0;
   --        Order   : Integer               := 0;
   --     end record;
   --  type Lvcolumn_Pointer is access all Lvcolumn_type;

   --  type Findinfo_Type is
   --     record
   --        Flags       : Interfaces.C.unsigned := Lvfi_Param;
   --        Psz         : LPTSTR                := null;
   --        Lparam      : Types.Lparam;
   --        Point       : Types.Point_Type;
   --        Vkdirection : Interfaces.C.unsigned := 0;
   --     end record;

   type Hditem_type is
      record
         Mask       : Interfaces.C.unsigned := 0;
         Cxy        : Interfaces.C.int      := 0;
         pszText    : Types.LPTSTR          := null;
         HBitmap    : Types.Handle          := Types.Null_Handle;
         CchTextMax : Interfaces.C.int      := 0;
         Fmt        : Interfaces.C.int      := 0;
         Lparam     : Types.Lparam          := 0;
         IImage     : Interfaces.C.int      := 0;
         IOrder     : Interfaces.C.int      := 0;
         Typ        : Interfaces.C.unsigned := 0;
         PvFilter   : System.Address        := System.Null_Address;
         state      : Interfaces.C.unsigned := 0;
      end record;
   type Hditem_Pointer is access all Hditem_type;

   type Drawitem_Type is
      record
         CtlType       : Interfaces.C.unsigned;
         CtlID         : Interfaces.C.unsigned;
         CtlItemID     : Interfaces.C.unsigned;
         CtlItemAction : Interfaces.C.unsigned;
         CtlItemState  : Interfaces.C.unsigned;
         HwndItem      : Types.Handle;
         Hdc           : Types.Handle;
         RcItem        : Types.Rectangle_Type;
         ItemData      : System.Address;
      end record;
   type Drawitem_Pointer is access all Drawitem_Type;

   type Buffer is new GString_C (0 .. Constants.Max_Text);
   type PBuffer is access all Buffer;

   function Lvitem_To_Lparam is new Ada.Unchecked_Conversion (LVITEM_Access, Types.Lparam);
   --  function Lparam_To_tvitem is new Ada.Unchecked_Conversion (Types.Lparam, Lvitem_access);

   function Internal_To_Lparam is new Ada.Unchecked_Conversion (Internal_Access, Types.Lparam);
   function Lparam_To_Internal is new Ada.Unchecked_Conversion (Types.Lparam, Internal_Access);

   --  function Lvcolumn_To_Lparam is new Ada.Unchecked_Conversion (Lvcolumn_Pointer, Types.Lparam);
   --  function Lparam_To_lvcolumn is new Ada.Unchecked_Conversion (Types.Lparam, Lvcolumn_pointer);

   function Hditem_To_Lparam is new Ada.Unchecked_Conversion (Hditem_Pointer, Types.Lparam);
   --  function Lparam_To_hditem is new Ada.Unchecked_Conversion (Types.Lparam, Hditem_pointer);

   --  function drawitem_To_Lparam is new Ada.Unchecked_Conversion (drawitem_pointer, Types.Lparam);
   function Lparam_To_Drawitem is new Ada.Unchecked_Conversion (Types.Lparam, Drawitem_Pointer);

   function Address_To_Lparam is new Ada.Unchecked_Conversion (System.Address, Types.Lparam);

   function Color_To_Lparam (C : Color_Type) return Types.Lparam is
   begin
      return Types.Lparam (C);
   end Color_To_Lparam;

   function Message_To_Nmlvcustomdraw_Pointer is
      new Ada.Unchecked_Conversion
         (GWindows.Base.Pointer_To_Notification, Pointer_To_Nmlvcustomdraw_Type);
   function Message_To_Nmlistview_Pointer is
      new Ada.Unchecked_Conversion
         (GWindows.Base.Pointer_To_Notification, Pointer_To_Nmlistview_Type);

   function To_PBuffer is new Ada.Unchecked_Conversion (Types.LPTSTR, PBuffer);

   procedure Free_Color_Array is
      new Ada.Unchecked_Deallocation (Internal_Color_Array_Type, Internal_Color_Array_Access);
   procedure Free_Internal is
      new Ada.Unchecked_Deallocation (Internal_Type, Internal_Access);

   function Sendmessage (Hwnd   : Types.Handle;
                         Umsg   : Interfaces.C.int;
                         Wparam : Types.Wparam := 0;
                         Lparam : Types.Lparam := 0) return Types.Lparam;
   pragma Import (Stdcall, Sendmessage, "SendMessage" & Character_Mode_Identifier);

   procedure Sendmessage_proc (Hwnd   : Types.Handle;
                               Umsg   : Interfaces.C.int;
                               Wparam : Types.Wparam := 0;
                               Lparam : Types.Lparam := 0);
   pragma Import (Stdcall, Sendmessage_proc, "SendMessage" & Character_Mode_Identifier);

   procedure Redraw_subitem (Lvcd_Ptr     : in     Pointer_To_Nmlvcustomdraw_Type;
                             Control      : in out Ex_List_View_Control_Type;
                             Return_Value : in out Types.Lresult);

   procedure Redraw_item (Lvcd_Ptr     : in     Pointer_To_Nmlvcustomdraw_Type;
                          Control      : in out Ex_List_View_Control_Type;
                          Return_Value : in out GWindows.Types.Lresult);

   procedure On_Header_Click (Control : in out Ex_List_View_Control_Type;
                              Column  : in     Integer);

   procedure Header_sorticon (Control   : in out Ex_List_View_Control_Type;
                              Column    : in     Natural;
                              Direction : in     Integer;
                              Enable    : in     Boolean := True);
   procedure Ownerdraw_flag (Control : in out Ex_List_View_Control_Type;
                             Column  : in     Natural;
                             Enable  : in     Boolean := True);
   procedure Draw_sorticon (Control   : in out Ex_List_View_Control_Type;
                            Drawitem  : in     Drawitem_Type;
                            Direction : in     Integer);

   -----------------------------------------------------------------------------------------
   function Get_Comctl_Version return Natural is

      function Getmodulehandle (LpModulname : in Types.LPTSTR) return Types.Handle;
      pragma Import (Stdcall, Getmodulehandle, "GetModuleHandle" & Character_Mode_Identifier);

      type Dllversioninfo is
         record
            Cbsize       : Interfaces.C.long := 0;
            majorversion : Interfaces.C.long := 0;
            minorversion : Interfaces.C.long := 0;
            buildnumber  : Interfaces.C.long := 0;
            platformid   : Interfaces.C.long := 0;
         end record;
      type Dllversioninfo_Pointer is access all Dllversioninfo;

      type Dll_Get_Version_Func is access
        function (Versioninfo : in Dllversioninfo_Pointer) return Interfaces.C.unsigned_long;
      pragma Convention (C, Dll_Get_Version_Func);

      use Interfaces.C;

      function Getprocaddress (hmodule    : in GWindows.Types.Handle;
                               Lpprocname : in char_array)
                             return Dll_Get_Version_Func;
      pragma Import (Stdcall, Getprocaddress, "GetProcAddress");

      libname   : GString_C := GWindows.GStrings.To_GString_C ("comctl32");
      Procname  : aliased constant char_array := To_C ("DllGetVersion");
      ModHandle : GWindows.Types.Handle;
      FuncPtr   : Dll_Get_Version_Func;
      pragma Unreferenced (FuncPtr);
      Info : aliased Dllversioninfo;
      Ret_Func : Interfaces.C.unsigned_long;
      pragma Unreferenced (Ret_Func);

   begin
      --  get dll
      ModHandle := Getmodulehandle (LpModulname => libname (0)'Unchecked_Access);
      --  get dllgetversion
      FuncPtr := Getprocaddress (hmodule => ModHandle,
                                 Lpprocname => Procname);
      --  call dllgetversion
      Info.Cbsize := Info'Size / 8;
      return 6;
      --  Ret_Func := FuncPtr(Info'unchecked_access) ;  --  ** This hangs GNAT GPL 2015 **
      --  Put_Line("Major version...." & Info.majorversion'Img);
      --  Put_Line("Minor version...." & Info.minorversion'Img);
      --  Put_Line("Build............" & Info.buildnumber'Img);
      --  Put_Line("Platform........." & Info.platformid'Img);
      --  return Natural(Info.MajorVersion);
   exception
      when others =>
         return 0;
   end Get_Comctl_Version;
   -----------------------------------------------------------------------------------------
   function Create_Internal (Control : in Ex_List_View_Control_Type) return Internal_Access is
      Int : Internal_Access;
      nullColors : constant Internal_Color_Type := (Textcolor => NullColor,
                                                    Backcolor => NullColor);
   begin
      Int := new Internal_Type;
      if Column_Count (Control) > 0 then
         Int.Colors := new Internal_Color_Array_Type (0 .. Column_Count (Control) - 1);
         Int.Colors.all := (others => nullColors);
      end if;

      return Int;
   end Create_Internal;
   -----------------------------------------------------------------------------------------
   procedure On_Create (Control : in out Ex_List_View_Control_Type) is
   begin
      GWindows.Common_Controls.On_Create (Control => List_View_Control_Type (Control));
      --  pen for sort
      GWindows.Drawing_Objects.Create_Pen (Pen => Control.Sort_Object.Sort_Pen,
                                           Style => GWindows.Drawing_Objects.Solid,
                                           Width => 1,
                                           Color => Sort_Icon_Pen_Color);
      --  brush for sort
      GWindows.Drawing_Objects.Create_Solid_Brush (Brush => Control.Sort_Object.Sort_Brush,
                                                   Color => Sort_Icon_Brush_Color);

      --  comctlversion for drawing sorticons
      Control.Comctl_Version := Get_Comctl_Version;

   end On_Create;
   -----------------------------------------------------------------------------------------

   function Get_Internal (Control   : in     Ex_List_View_Control_Type;
                          Index     : in     Natural)
                         return Internal_Access is
      Item : LVITEM;
   begin
      Item.Mask    := LVIF_PARAM;
      Item.Item    := Interfaces.C.int (Index);
      Item.SubItem := 0;

      Sendmessage_proc (Hwnd   => Handle (Control),
                        Umsg   => LVM_GETITEM (Character_Mode),
                        Wparam => 0,
                        Lparam => Lvitem_To_Lparam (Item'Unrestricted_Access));

      return Lparam_To_Internal (Item.lParam);
   exception
      when others =>
         return null;
   end Get_Internal;
   -----------------------------------------------------------------------------------------
   procedure Set_Internal_color (Control    : in Ex_List_View_Control_Type;
                                 Index      : in Natural;
                                 Sub_Index  : in Natural;
                                 new_colors : in Internal_Color_Type)
   is
      Item : LVITEM;
      internal : Internal_Access := null;
      nullColors : constant Internal_Color_Type := (Textcolor => NullColor,
                                                    Backcolor => NullColor);
   begin
      --  get the lparam
      Item.Mask    := LVIF_PARAM;
      Item.Item    := Interfaces.C.int (Index);
      Item.SubItem := 0;

      Sendmessage_proc (Hwnd   => Handle (Control),
                        Umsg   => LVM_GETITEM (Character_Mode),
                        Wparam => 0,
                        Lparam => Lvitem_To_Lparam (Item'Unrestricted_Access));

      internal := Lparam_To_Internal (Item.lParam);

      --  range?
      if internal.Colors.all'Last < Sub_Index then
         declare
            Tmp_Colors : constant Internal_Color_Array_Access :=
               new Internal_Color_Array_Type (0 .. Column_Count (Control) - 1);
         begin
            Tmp_Colors.all := (others => nullColors);
            Tmp_Colors (0 .. internal.Colors.all'Last) := internal.Colors.all;
            --  free the old array
            Free_Color_Array (internal.Colors);
            internal.Colors := Tmp_Colors;
         end;
      end if;

      internal.Colors (Sub_Index) := new_colors;

   end Set_Internal_color;
   -----------------------------------------------------------------------------------------
   procedure Set_Internal_Payload (Control : in Ex_List_View_Control_Type;
                                   Index   : in Natural;
                                   payload : in Data_Access)
   is
      Item     : LVITEM;
      internal : Internal_Access := null;
   begin
      --  get the lparam
      Item.Mask    := LVIF_PARAM;
      Item.Item    := Interfaces.C.int (Index);
      Item.SubItem := 0;

      Sendmessage_proc (Hwnd   => Handle (Control),
                        Umsg   => LVM_GETITEM (Character_Mode),
                        Wparam => 0,
                        Lparam => Lvitem_To_Lparam (Item'Unrestricted_Access));

      internal := Lparam_To_Internal (Item.lParam);

      --  set payload
      internal.User_Data := payload;

   end Set_Internal_Payload;
   -----------------------------------------------------------------------------------------
   procedure On_Message (Control      : in out Ex_List_View_Control_Type;
                         message      : in     Interfaces.C.unsigned;
                         wParam       : in     GWindows.Types.Wparam;
                         lParam       : in     GWindows.Types.Lparam;
                         Return_Value : in out GWindows.Types.Lresult)
   is
      use Interfaces.C;
      WM_DRAWITEM                : constant := 16#002B#;
      ODT_HEADER                 : constant := 100;
   begin
      case message is
         when WM_DRAWITEM =>
            --  ab comctl 6 direkt hdm_setitem rufen f�r sorticons
            declare
               Drawitem : Drawitem_Pointer := null;
            begin
               Drawitem := Lparam_To_Drawitem (lParam);
               if Drawitem /= null and then Drawitem.all.CtlType = ODT_HEADER then
                  Draw_sorticon (Control, Drawitem.all, Control.Sort_Object.Sort_Direction);
               end if;
               Return_Value := 1;
            end;
         when others =>
            GWindows.Common_Controls.On_Message (List_View_Control_Type (Control), message, wParam, lParam, Return_Value);
      end case;

   end On_Message;
   --------------------------------------------------------------------------------------------
   procedure On_Notify (Window       : in out Ex_List_View_Control_Type;
                        Message      : in     GWindows.Base.Pointer_To_Notification;
                        Control      : in     GWindows.Base.Pointer_To_Base_Window_Class;
                        Return_Value : in out GWindows.Types.Lresult)
   is
      pragma Warnings (Off, Return_Value);

      Nm_Customdraw   : constant := -12;
   begin
      --  customdraw subitem
      if Message.Code = Nm_Customdraw and then
        Window.Color_Mode = Subitem
      then
         declare
            Lvcd_Ptr : constant Pointer_To_Nmlvcustomdraw_Type :=
              Message_To_Nmlvcustomdraw_Pointer (Message);
         begin
            Redraw_subitem (Lvcd_Ptr, Window, Return_Value);
         end;
         --  customdraw item
      elsif Message.Code = Nm_Customdraw and then
        Window.Color_Mode = Item_Alternately
      then
         declare
            Lvcd_Ptr : constant Pointer_To_Nmlvcustomdraw_Type :=
              Message_To_Nmlvcustomdraw_Pointer (Message);
         begin
            Redraw_item (Lvcd_Ptr, Window, Return_Value);
         end;
         --  header click
      elsif Message.Code = Nm_Header_Click then
         declare
            Nmlistview_Pointer : constant Pointer_To_Nmlistview_Type :=
              Message_To_Nmlistview_Pointer (Message);
         begin
            On_Header_Click (Window,
                             Integer (Nmlistview_Pointer.Isubitem));
         end;
      elsif Message.Code = LVN_INSERTITEM then
         declare
            Nmlistview_Pointer : constant Pointer_To_Nmlistview_Type :=
               Message_To_Nmlistview_Pointer (Message);
            Item : LVITEM;
         begin
            --  setitem
            Item.Mask   := LVIF_PARAM;
            Item.Item   := Nmlistview_Pointer.Iitem;
            Item.lParam := Internal_To_Lparam (Create_Internal (Window));
            Sendmessage_proc (Hwnd   => Handle (Window),
                              Umsg   => LVM_SETITEM (Character_Mode),
                              Wparam => 0,
                              Lparam => Lvitem_To_Lparam (Item'Unrestricted_Access));
         exception
            when others =>
               null;
         end;
      elsif Message.Code = LVN_DELETEITEM then
         declare
            Nmlistview_Pointer : constant Pointer_To_Nmlistview_Type :=
               Message_To_Nmlistview_Pointer (Message);
         begin
            if Window.Color_Mode = Item_Alternately then
               --  redraw on items
              Sendmessage_proc (Hwnd => Handle (Window),
                                Umsg => LVM_REDRAWITEMS,
                                Wparam => GWindows.Types.Wparam (Nmlistview_Pointer.Iitem),
                                Lparam => GWindows.Types.Lparam (Item_Count (Window) - 1));
            end if;
         end;
      else
         GWindows.Common_Controls.On_Notify
            (List_View_Control_Type (Window), Message, Control, Return_Value);
      end if;

   end On_Notify;
   -----------------------------------------------------------------------------------------
   procedure Destroy_Row (Control : in out Ex_List_View_Control_Type; Index : Integer) is
      Int : Internal_Access := Get_Internal (Control, Index);
   begin
      if Int /= null then
         if Int.Colors /= null then
            Free_Color_Array (Int.Colors);
         end if;
         --  Free the payload data. With 'Class we re-dispatch in case
         --  the method On_Free_Payload has been overriden.
         On_Free_Payload (Control => Ex_List_View_Control_Type'Class (Control),
                          Payload => Int.User_Data);
      end if;
      Free_Internal (Int);
   end Destroy_Row;

   procedure Destroy_All_Rows (Control : in out Ex_List_View_Control_Type) is
   begin
      for Index in 0 .. Item_Count (Control) - 1 loop
         Destroy_Row (Control, Index);
      end loop;
   end Destroy_All_Rows;

   procedure On_Destroy (Control : in out Ex_List_View_Control_Type) is
   begin
      Destroy_All_Rows (Control);
      On_Destroy (List_View_Control_Type (Control));  --  Call parent method
   end On_Destroy;

   procedure Delete_Item (Control : in out Ex_List_View_Control_Type;
                          Index   : in     Integer) is
   begin
      Destroy_Row (Control, Index);
      Delete_Item (List_View_Control_Type (Control), Index);  --  Call parent method
   end Delete_Item;

   procedure Clear (Control : in out Ex_List_View_Control_Type) is
   begin
      Destroy_All_Rows (Control);
      Clear (List_View_Control_Type (Control));  --  Call parent method
    end Clear;
   -----------------------------------------------------------------------------------------
   procedure Redraw_subitem (Lvcd_Ptr     : in     Pointer_To_Nmlvcustomdraw_Type;
                             Control      : in out Ex_List_View_Control_Type;
                             Return_Value : in out GWindows.Types.Lresult) is
   begin
      --  set color in redraw according to color_mode
      case Lvcd_Ptr.Nmcd.Dwdrawstage is
         when Cdds_Prepaint =>
            Return_Value := Cdrf_Notifyitemdraw;
         when Interfaces.C.long (Cdds_Itemprepaint) =>
            Return_Value := Cdrf_Notifysubitemdraw;
         when Interfaces.C.long (Cdds_Itemprepaint + Cdds_Subitem) =>
            declare
               internal : constant Internal_Access :=
                  Get_Internal (Control => Control,
                                Index   => Integer (Lvcd_Ptr.Nmcd.Dwitemspec));
               i_color : constant Integer := Integer (Lvcd_Ptr.Isubitem);
            begin
               if internal /= null and then
                 internal.Colors /= null and then
                 i_color in internal.Colors'Range and then
                 internal.Colors (i_color).Textcolor /= NullColor
               then
                  Lvcd_Ptr.Clrtext := internal.Colors (i_color).Textcolor;
               else
                  Lvcd_Ptr.Clrtext := Control.Control_Textcolor;
               end if;
               if internal /= null and then
                 internal.Colors /= null and then
                 i_color in internal.Colors'Range and then
                 internal.Colors (i_color).Backcolor /= NullColor
               then
                  Lvcd_Ptr.Clrtextbk := internal.Colors (i_color).Backcolor;
               else
                  Lvcd_Ptr.Clrtextbk := Control.Control_Backcolor;
               end if;
            end;
            Return_Value := Cdrf_Newfont;
         when others =>
            Return_Value := Cdrf_Newfont;
      end case;
   end Redraw_subitem;
   -----------------------------------------------------------------------------------------
   procedure Redraw_item (Lvcd_Ptr     : in     Pointer_To_Nmlvcustomdraw_Type;
                          Control      : in out Ex_List_View_Control_Type;
                          Return_Value : in out GWindows.Types.Lresult) is
   begin
      case Lvcd_Ptr.Nmcd.Dwdrawstage is
         when Cdds_Prepaint =>
            Return_Value := Cdrf_Notifyitemdraw;
         when Interfaces.C.long (Cdds_Itemprepaint) =>
            Return_Value := Cdrf_Notifysubitemdraw;
            Lvcd_Ptr.Clrtext := Control.Control_Textcolor;
            if Integer (Lvcd_Ptr.Nmcd.Dwitemspec) mod 2 = 0 then
               Lvcd_Ptr.Clrtextbk := Control.Alt_Color1;
            else
               Lvcd_Ptr.Clrtextbk := Control.Alt_Color2;
            end if;
            Return_Value := Cdrf_Newfont;
         when others =>
            Return_Value := Cdrf_Newfont;
      end case;
   end Redraw_item;
   ----------------------------------------------------------------------------------------------------
   procedure On_Header_Click (Control : in out Ex_List_View_Control_Type;
                              Column  : in     Integer) is
   begin
      --  Call Sort, defined here or overriden.
      Sort
         (Control   => Ex_List_View_Control_Type'Class (Control),
          Column    => Column,
          Direction => Auto,
          Show_Icon => True);
   end On_Header_Click;
   ----------------------------------------------------------------------------------------------------
   procedure Draw_sorticon (Control   : in out Ex_List_View_Control_Type;
                            Drawitem : in Drawitem_Type;
                            Direction : in Integer) is
      Canvas : GWindows.Drawing.Canvas_Type;
      Paint_Left : Integer;
      Max_Width : Integer;
      Columntext : constant GString := Column_Text (Control => Control, Index => Integer (Drawitem.CtlItemID));
      Columntext_Last : Natural := Columntext'Last;
      Size : GWindows.Types.Size_Type;
      Icon_Width, Icon_Height : Natural;
   begin
      GWindows.Drawing.Handle (Canvas, Drawitem.Hdc);

      --  get left for paint
      Paint_Left := Drawitem.RcItem.Left + 1;

      Icon_Height := Natural (Drawitem.RcItem.Bottom / 3);
      Icon_Width := Icon_Height;
      if Icon_Width mod 2 > 0 then
         Icon_Width := Icon_Width + 1;
      end if;

      Max_Width := Drawitem.RcItem.Right - Drawitem.RcItem.Left - (4 * Icon_Width);

      if Max_Width < 0 then
         return;
      end if;

      --  check string
      while Columntext_Last > 0 loop
         if Columntext_Last < Columntext'Last then
            Size := GWindows.Drawing.Text_Output_Size
               (Canvas => Canvas,
                Text => Columntext (1 .. Columntext_Last) & "...");
         else
            Size := GWindows.Drawing.Text_Output_Size (Canvas => Canvas,
                                                       Text => Columntext);
         end if;
         if Size.Width <= Max_Width then
            exit;
         end if;
         Columntext_Last := Columntext_Last - 1;
      end loop;

      --  put the string
      if Columntext_Last = Columntext'Last then
         GWindows.Drawing.Put (Canvas => Canvas,
                               X => Paint_Left + (3 * Icon_Width),
                               Y => 2,
                               Text => Columntext);
      elsif Columntext_Last > 0 then
         GWindows.Drawing.Put (Canvas => Canvas,
                               X => Paint_Left + (3 * Icon_Width),
                               Y => 2,
                               Text => Columntext (1 .. Columntext_Last) & "...");
      end if;

      --  paint the polygon
      GWindows.Drawing.Select_Object (Canvas => Canvas, Object => Control.Sort_Object.Sort_Pen);
      GWindows.Drawing.Select_Object (Canvas => Canvas, Object => Control.Sort_Object.Sort_Brush);

      declare
         Pt_Array  : GWindows.Types.Point_Array_Type (1 .. 3);
         Pt_Top    : constant Natural := Icon_Height;
         Pt_Bottom : constant Natural := Drawitem.RcItem.Bottom - Icon_Height - 1;
         Pt_Left   : constant Natural := Icon_Width;
         Pt_Right  : constant Natural := 2 * Icon_Width;
      begin
         if Icon_Height > 5 then
            Icon_Height := Icon_Height - 1;
         end if;
         --  up
         if Direction = 1 then
            Pt_Array (1).X := Pt_Left + Paint_Left + Natural (Icon_Width / 2);
            Pt_Array (1).Y := Pt_Top;
            Pt_Array (2).X := Pt_Right + Paint_Left;
            Pt_Array (2).Y := Pt_Bottom;
            Pt_Array (3).X := Pt_Left + Paint_Left;
            Pt_Array (3).Y := Pt_Bottom;
         else
            --  down
            Pt_Array (1).X := Pt_Left + Paint_Left;
            Pt_Array (1).Y := Pt_Top;
            Pt_Array (2).X := Pt_Right + Paint_Left;
            Pt_Array (2).Y := Pt_Top;
            Pt_Array (3).X := Pt_Left + Paint_Left + Natural (Icon_Width / 2);
            Pt_Array (3).Y := Pt_Bottom;
         end if;

         GWindows.Drawing.Polygon (Canvas => Canvas, Vertices => Pt_Array);
      end;

   end Draw_sorticon;

   procedure Header_sorticon (Control   : in out Ex_List_View_Control_Type;
                              Column    : in Natural;
                              Direction : in Integer;
                              Enable    : in Boolean := True) is
      use Interfaces.C;
      use GWindows.GStrings;
      Header : GWindows.Types.Handle;
      Hd : aliased Hditem_type;
      C_Text : Buffer;
      L_setUmsg : Interfaces.C.int;
      L_getUmsg : Interfaces.C.int;
   begin
      C_Text (C_Text'First) := Interfaces.C.wchar_t'Val (0);
      case Character_Mode is
         when Unicode =>
            L_setUmsg := HDM_SETITEMW;
            L_getUmsg := HDM_GETITEMW;
         when ANSI =>
            L_setUmsg := HDM_SETITEMA;
            L_getUmsg := HDM_GETITEMA;
      end case;

      --  get the header
      Header := GWindows.Types.To_Handle (Sendmessage (Hwnd => Handle (Control),
                                                       Umsg => LVM_GETHEADER,
                                                       Wparam => 0,
                                                       Lparam => 0));

      --  get the item
      Hd.Mask := HDI_FORMAT + HDI_TEXT;
      Hd.pszText := C_Text (0)'Unchecked_Access;
      Hd.CchTextMax := 255;
      Sendmessage_proc (Hwnd  => Header,
                        Umsg  => L_getUmsg,
                        Wparam => GWindows.Types.To_Wparam (Column),
                        Lparam => Hditem_To_Lparam (Hd'Unchecked_Access));

      --  update item
      Hd.Mask := HDI_FORMAT + HDI_TEXT;
      --  remove the old icon flag
      if (unsigned (Hd.Fmt) and unsigned (HDF_SORTUP)) > 0 then
         Hd.Fmt := Hd.Fmt - HDF_SORTUP;
      end if;
      if (unsigned (Hd.Fmt) and unsigned (HDF_SORTDOWN)) > 0 then
         Hd.Fmt := Hd.Fmt - HDF_SORTDOWN;
      end if;

      --  set the new icon flag
      if Enable then
         if Direction = 1 then -- up
            Hd.Fmt := Hd.Fmt + HDF_SORTUP;
         elsif Direction = -1 then -- down
            Hd.Fmt := Hd.Fmt + HDF_SORTDOWN;
         end if;
      end if;

      --  text
      Hd.CchTextMax := int (To_GString_From_C (GString_C (To_PBuffer (Hd.pszText).all))'Last + 1);
      --  set the new item
      Sendmessage_proc (Hwnd   => Header,
                        Umsg   => L_setUmsg,
                        Wparam => GWindows.Types.To_Wparam (Column),
                        Lparam => Hditem_To_Lparam (Hd'Unchecked_Access));

   end Header_sorticon;

   procedure Ownerdraw_flag (Control : in out Ex_List_View_Control_Type;
                             Column  : in Natural;
                             Enable  : in Boolean := True) is
      use Interfaces.C;
      Header : GWindows.Types.Handle;
      Hd : aliased Hditem_type;
      L_Umsg : Interfaces.C.int;
   begin
      --  get the header
      Header := GWindows.Types.To_Handle (Sendmessage (Hwnd   => Handle (Control),
                                                       Umsg   => LVM_GETHEADER,
                                                       Wparam => 0,
                                                       Lparam => 0));
      Hd.Mask := HDI_FORMAT;
      Hd.Fmt := HDF_string;
      if Enable then
         Hd.Fmt := Hd.Fmt + HDF_OWNERDRAW;
      end if;

      case Character_Mode is
         when Unicode =>
            L_Umsg := HDM_SETITEMW;
         when ANSI =>
            L_Umsg := HDM_SETITEMA;
      end case;

      Sendmessage_proc (Hwnd   => Header,
                        Umsg   => L_Umsg,
                        Wparam => GWindows.Types.To_Wparam (Column),
                        Lparam => Hditem_To_Lparam (Hd'Unchecked_Access));

   end Ownerdraw_flag;
   ----------------------------------------------------------------------------------------------------
   ----------------------------------------------------------------------------------------------------
   ----------------------------------------------------------------------------------------------------
   function Column_Count (Control : in Ex_List_View_Control_Type) return Natural is
      use GWindows.Types;
      Header : GWindows.Types.Handle;
      Count : GWindows.Types.Lparam;
   begin
      Header := GWindows.Types.To_Handle (Sendmessage (Hwnd => Handle (Control),
                                                       Umsg => LVM_GETHEADER));

      Count := Sendmessage (Hwnd => Header,
                            Umsg => HDM_GETITEMCOUNT);
      if To_Integer (Lresult (Count)) < 0 then
         Raise_Exception (Elv_Exception'Identity, "Error on HDM_GETITEMCOUNT.");
      end if;

      return Natural (Count);
   end Column_Count;
   ----------------------------------------------------------------------------------------------------
   procedure Autosize (Control : in out Ex_List_View_Control_Type;
                       Column  : in Natural;
                       Sizing  : in Autosize_Type := Headersize) is

      LVSCW_AUTOSIZE            : constant := -1;
      LVSCW_AUTOSIZE_USEHEADER  : constant := -2;
   begin
      case Sizing is
         when Columnsize =>
            Sendmessage_proc (Hwnd   => Handle (Control),
                              Umsg   => LVM_SETCOLUMNWIDTH,
                              Wparam => GWindows.Types.To_Wparam (Column),
                              Lparam => GWindows.Types.To_Lparam (LVSCW_AUTOSIZE));
         when Headersize =>
            if Control.Sort_Object.Sort_Column = Column and then
              Control.Sort_Object.Icon_Visible
            then
               --  Width manually calculated for including the sort icon.
               declare
                  Canvas : GWindows.Drawing.Canvas_Type;
                  Font : GWindows.Drawing_Objects.Font_Type;
                  Size : GWindows.Types.Size_Type;
                  Offset : Natural;
               begin
                  Get_Canvas (Control, Canvas);
                  Get_Font (Control, Font);
                  GWindows.Drawing.Select_Object (Canvas, Font);
                  Size := GWindows.Drawing.Text_Output_Size (Canvas, Column_Text (Control, Column));
                  Offset := (Size.Height + 4) / 3;
                  if Offset mod 2 > 0 then
                     Offset := Offset + 1;
                  end if;
                  Offset := Offset * 4;
                  Sendmessage_proc (Hwnd => Handle (Control),
                                    Umsg => LVM_SETCOLUMNWIDTH,
                                    Wparam => GWindows.Types.To_Wparam (Column),
                                    Lparam  => GWindows.Types.To_Lparam (Size.Width + Offset));
               end;
            else
               Sendmessage_proc (Hwnd   => Handle (Control),
                                 Umsg   => LVM_SETCOLUMNWIDTH,
                                 Wparam => GWindows.Types.To_Wparam (Column),
                                 Lparam => GWindows.Types.To_Lparam (LVSCW_AUTOSIZE_USEHEADER));
            end if;
      end case;
   end Autosize;
   ----------------------------------------------------------------------------------------------------
   function Color_Mode (Control : in Ex_List_View_Control_Type) return Color_Mode_Type is
   begin
      return Control.Color_Mode;
   end Color_Mode;
   ----------------------------------------------------------------------------------------------------
   procedure Text_Color (Control : in  out Ex_List_View_Control_Type;
                         Color   : in      Color_Type) is
   begin
      Sendmessage_proc (Hwnd => Handle (Control),
                        Umsg => Lvm_Settextcolor,
                        Wparam => 0,
                        Lparam => Color_To_Lparam (Color));
      Control.Color_Mode := All_Items;
      Control.Control_Textcolor := Color;
   end Text_Color;
   ----------------------------------------------------------------------------------------------------
   procedure Back_Color (Control : in  out Ex_List_View_Control_Type;
                         Color   : in      Color_Type) is
   begin
      Sendmessage_proc (Hwnd => Handle (Control),
                        Umsg => LVM_SETTEXTBKCOLOR,
                        Wparam => 0,
                        Lparam => Color_To_Lparam (Color));
      Control.Color_Mode := All_Items;
      Control.Control_Backcolor := Color;
   end Back_Color;
   ----------------------------------------------------------------------------------------------------
   procedure Control_Back_Color (Control : in  out  Ex_List_View_Control_Type;
                                 Color   : in     Color_Type) is
   begin
      Sendmessage_proc (Hwnd => Handle (Control),
                        Umsg => LVM_SETBKCOLOR,
                        Wparam => 0,
                        Lparam => Color_To_Lparam (Color));
   end Control_Back_Color;
   ----------------------------------------------------------------------------------------------------
   procedure Set_Alternately_Colors (Control : in out Ex_List_View_Control_Type;
                                     Color1  : in     Color_Type;
                                     Color2  : in     Color_Type) is
   begin
      Control.Alt_Color1 := Color1;
      Control.Alt_Color2 := Color2;
      Control.Color_Mode := Item_Alternately;
   end Set_Alternately_Colors;
   ----------------------------------------------------------------------------------------------------
   procedure Subitem_Color (Control    : in out Ex_List_View_Control_Type;
                            Text_Color : in     Color_Type := Black;
                            Back_Color : in     Color_Type := White;
                            Index      : in     Integer := -1;
                            Sub_Index  : in     Integer := -1) is

      new_colors : Internal_Color_Type;
   begin
      if Column_Count (Control) = 0 then
         Ada.Exceptions.Raise_Exception (Elv_Exception'Identity, "No columns!");
      end if;

      if Index < 0 and Sub_Index < 0 then
         Ada.Exceptions.Raise_Exception (Elv_Exception'Identity, "No index/subindex!");
      end if;

      new_colors.Textcolor := Text_Color;
      new_colors.Backcolor := Back_Color;

      if Index >= 0 and Sub_Index >= 0 then -- subitem
         Set_Internal_color (Control => Control,
                             Index   => Index,
                             Sub_Index => Sub_Index,
                             new_colors => new_colors);
      elsif Index >= 0 then -- row
         for P_Sub_Index in 0 .. Column_Count (Control) - 1 loop
            Set_Internal_color (Control => Control,
                                Index   => Index,
                                Sub_Index => P_Sub_Index,
                                new_colors => new_colors);
         end loop;
      elsif Sub_Index >= 0 then -- column
         for P_Index in 0 .. Item_Count (Control) - 1 loop
            Set_Internal_color (Control => Control,
                                Index   => P_Index,
                                Sub_Index => Sub_Index,
                                new_colors => new_colors);
         end loop;
      end if;
      Control.Color_Mode := Subitem;
   end Subitem_Color;
   ----------------------------------------------------------------------------------------------------
   procedure Color_Mode (Control : in out Ex_List_View_Control_Type;
                         Mode    : in Color_Mode_Type;
                         Redraw  : in Boolean := True) is
   begin
      Control.Color_Mode := Mode;
      if Redraw then
         GWindows.Common_Controls.Ex_List_View.Redraw (Control);
      end if;
   end Color_Mode;
   ----------------------------------------------------------------------------------------------------
   procedure Item_Data (Control : in Ex_List_View_Control_Type;
                        Index   : in Natural;
                        Payload : in Data_Access) is

   begin
      Set_Internal_Payload (Control, Index, Payload);
   end Item_Data;
   ----------------------------------------------------------------------------------------------------
   function Item_Data (Control : in Ex_List_View_Control_Type;
                       Index   : in Natural) return Data_Access is

   begin
      return Get_Internal (Control, Index).User_Data;
   end Item_Data;
   ----------------------------------------------------------------------------------------------------
   procedure On_Free_Payload (Control : in out Ex_List_View_Control_Type;
                              Payload : out Data_Access)
   is
   begin
      if Control.On_Free_Payload /= null then
         Control.On_Free_Payload (Control, Payload);
      end if;
   end On_Free_Payload;
   ----------------------------------------------------------------------------------------------------
   procedure On_Free_Payload_Handler (Control : in out Ex_List_View_Control_Type;
                                      Event   : in Free_Payload_Event) is
   begin
      Control.On_Free_Payload := Event;
   end On_Free_Payload_Handler;
   ----------------------------------------------------------------------------------------------------
   function Compare_Texts
               (Control          : in Ex_List_View_Control_Type;
                Column           : in Natural;
                Index_1, Index_2 : in Natural) return Integer
   is
      pragma Inline (Compare_Texts);
      --  Fast internal comparison method, which does the comparison of
      --  both C strings instead of converting them into Ada strings, then comparing.
      use Interfaces.C;

      type Buffer is new GString_C (0 .. Constants.Max_Text);

      C_Text_1 : Buffer;
      C_Text_2 : Buffer;
      LVI      : LVITEM;

      procedure SendMessage
        (hwnd   : GWindows.Types.Handle := Handle (Control);
         uMsg   : Interfaces.C.int      := LVM_GETITEM (Character_Mode);
         wParam : GWindows.Types.Wparam := 0;
         lParam : in out LVITEM);
      pragma Import (StdCall, SendMessage,
                       "SendMessage" & Character_Mode_Identifier);
      diff : Integer;
   begin
      LVI.Mask    := LVIF_TEXT;
      LVI.Item    := Interfaces.C.int (Index_1);
      LVI.SubItem := Interfaces.C.int (Column);
      LVI.TextMax := Constants.Max_Text;
      LVI.Text    := C_Text_1 (0)'Unchecked_Access;
      SendMessage (lParam => LVI);
      LVI.Item    := Interfaces.C.int (Index_2);
      LVI.Text    := C_Text_2 (0)'Unchecked_Access;
      SendMessage (lParam => LVI);
      pragma Assert (Integer'Size > GChar_C'Size);
      --  ^ GChar_C is 8 or 16 bits, and, on GNAT/Windows, Integer is min 32 bits.
      for i in Buffer'Range loop
         diff := wchar_t'Pos (C_Text_1 (i)) - wchar_t'Pos (C_Text_2 (i));
         if diff /= 0 then
            --  After a common part, C strings have a different character at position i.
            --  This includes the case where one string has the null character.
            --  Then, that string is shorter than the other.
            return diff;
         end if;
         --  So far, the C strings are identical.
         if C_Text_1 (i) = GString_C_Null then
            --  For both strings, the end is reached.
            return 0;
         end if;
      end loop;
      --  This point should not be reached: both C strings are not
      --  null-terminated. In C, the strcmp function would just continue
      --  running in uncharted waters...
      return 0;
   end Compare_Texts;

   function On_Compare
              (Control : in Ex_List_View_Control_Type;
               Column  : in Natural;
               Value1  : in GString;
               Value2  : in GString) return Integer
   is
   begin
     return Fire_On_Compare (Control, Column, Value1, Value2);
   end On_Compare;
   --
   procedure On_Compare_Handler (Control : in out Ex_List_View_Control_Type;
                                 Event   : in Compare_Event) is
   begin
      Control.On_Compare_Event := Event;
   end On_Compare_Handler;
   --
   function Fire_On_Compare
              (Control : in Ex_List_View_Control_Type;
               Column  : in Natural;
               Value1  : in GString;
               Value2  : in GString) return Integer
   is
   begin
      if Control.On_Compare_Event /= null then
         return Control.On_Compare_Event
            (Control, Column, Value1, Value2);
      end if;
      if Value1 = Value2 then
         return 0;
      elsif Value1 > Value2 then
         return 1;
      else
         return -1;
      end if;
   end Fire_On_Compare;
   ----------------------------------------------------------------------------------------------------
   function On_Compare (
               Control : in Ex_List_View_Control_Type;
               Column  : in Natural;
               Index_1 : in Natural;
               Index_2 : in Natural) return Integer
   is
   begin
     return Fire_On_Compare (Control, Column, Index_1, Index_2);
   end On_Compare;
   --
   procedure On_Compare_Handler (Control       : in out Ex_List_View_Control_Type;
                                 General_Event : in General_Compare_Event)
   is
   begin
      Control.On_General_Compare_Event := General_Event;
   end On_Compare_Handler;
   --
   function Fire_On_Compare (
               Control : in Ex_List_View_Control_Type;
               Column  : in Natural;
               Index_1 : in Natural;
               Index_2 : in Natural) return Integer
   is
   begin
      if Control.On_General_Compare_Event /= null then
         return Control.On_General_Compare_Event (
            Control, Column, Index_1, Index_2
         );
      end if;
      --  Default behaviour: alphabetic.
      return Compare_Texts (Control, Column, Index_1, Index_2);
   end Fire_On_Compare;
   ----------------------------------------------------------------------------------------------------
   procedure Sort (Control   : in out Ex_List_View_Control_Type;
                   Column    : in     Natural;
                   Direction : in     Sort_Direction_Type;
                   Show_Icon : in     Boolean := True;
                   Technique : in     Comparison_Technique_Type := As_Strings
                  )
   is
      function On_compare_internal (Lparam1, Lparam2, Lparamsort : GWindows.Types.Lparam)
         return Interfaces.C.int;
      pragma Convention (Stdcall, On_compare_internal);

      Local_Sort_Direction : Integer;
      pragma Volatile (Local_Sort_Direction);

      function On_compare_internal (Lparam1, Lparam2, Lparamsort : GWindows.Types.Lparam)
         return Interfaces.C.int
      is
      begin
         --  Note 01-Nov-2022:
         --  -----------------
         --  A new approach, since revision #447, is using the
         --  Windows API message Lvm_SortItemsEx instead of Lvm_SortItems.
         --  In the callback given to Lvm_SortItemsEx, Lparam1 and Lparam2
         --  contain the current row indices, instead of pointers to LVITEM structures
         --  which contain unusable information about row indices (we have tested it).
         --
         --  Consequently, two calls to LVM_FindItem can be removed in this place.
         --  Result: the entire sorting is *six* times faster on a list of ~20,000 items.
         --
         --  See AZip, the Zip archive manager, for testing (constant timing := True).
         --  You can use rt.jar (the Java runtime) as test data.
         case Technique is
            when As_Strings =>
               --  String values.
               --  We call the On_Compare method (strings variant), which is either
               --  overriden, or calls Fire_On_Compare which in turn calls the handler,
               --  if available, or applies a default alphabetical sorting.
               return Interfaces.C.int (
                  On_Compare (
                     Control => Ex_List_View_Control_Type'Class (Control),
                     Column  => Integer (Lparamsort),
                     Value1  =>
                        Text (Control => Control,
                              Item    => Integer (Lparam1),
                              SubItem => Integer (Lparamsort)),
                     Value2  =>
                        Text (Control => Control,
                              Item    => Integer (Lparam2),
                              SubItem => Integer (Lparamsort)))
                  * Local_Sort_Direction
                );
            when As_Strings_Default =>
               declare
               begin
                  return
                     Interfaces.C.int
                        (Compare_Texts
                           (Control,
                            Integer (Lparamsort),
                            Integer (Lparam1),
                            Integer (Lparam2))
                         * Local_Sort_Direction);
               end;
            when General =>
               return Interfaces.C.int (
                  On_Compare (
                     Control  => Ex_List_View_Control_Type'Class (Control),
                     Column   => Integer (Lparamsort),
                     Index_1  => Integer (Lparam1),
                     Index_2  => Integer (Lparam2))
                  * Local_Sort_Direction
                );
         end case;
      exception
         when E : others =>
            Raise_Exception
               (Elv_Exception'Identity, "error on on_compare: " & Exception_Information (E));
      end On_compare_internal;
   --
   begin
      case Direction is
         when Auto =>
            if Control.Sort_Object.Sort_Column = Column then
               --  Same column, reverse sort direction:
               Control.Sort_Object.Sort_Direction := Control.Sort_Object.Sort_Direction * (-1);
            else
               if Control.Sort_Object.Sort_Column >= 0 then
                  --  Reset the Icon:
                  if Control.Comctl_Version <= 5 then
                     Ownerdraw_flag (Control, Control.Sort_Object.Sort_Column, False);
                  else
                     Header_sorticon (Control, Control.Sort_Object.Sort_Column, 0, False);
                  end if;
               end if;

               --  New column, start with sorting up:
               Control.Sort_Object.Sort_Column := Column;
               Control.Sort_Object.Sort_Direction := 1;
            end if;
         when Up =>
            Control.Sort_Object.Sort_Column := Column;
            Control.Sort_Object.Sort_Direction := 1;
         when Down =>
            Control.Sort_Object.Sort_Column := Column;
            Control.Sort_Object.Sort_Direction := -1;
      end case;
      Local_Sort_Direction := Control.Sort_Object.Sort_Direction;

      --  Start sorting:
      Sendmessage_proc (Hwnd   => Handle (Control),
                        Umsg   => Lvm_SortItemsEx,
                        Wparam => Types.To_Wparam (Control.Sort_Object.Sort_Column),
                        Lparam => Address_To_Lparam (On_compare_internal'Address));

      Control.Sort_Object.Icon_Visible := Show_Icon;

      --  Draw the sort icon:
      if Show_Icon then
         if Control.Comctl_Version <= 5 then
            Ownerdraw_flag (Control, Column, True);
         else
            Header_sorticon (Control, Column, Control.Sort_Object.Sort_Direction, True);
         end if;
      end if;

   end Sort;

   procedure Sort_Info (Control   : in  Ex_List_View_Control_Type;
                        Column    : out Integer;
                        Direction : out Sort_Direction_Type)
   is
   begin
      Column := Control.Sort_Object.Sort_Column;
      case Control.Sort_Object.Sort_Direction is
         when 1 =>
            Direction := Up;
         when -1 =>
            Direction := Down;
         when others =>
            Direction := Up;
      end case;
   end Sort_Info;

end GWindows.Common_Controls.Ex_List_View;
