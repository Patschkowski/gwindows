------------------------------------------------------------------------------
--                                                                          --
--            GWINDOWS - Ada 95 Framework for Windows Development           --
--                                                                          --
--                      G W I N D O W S . L O C A L E S                     --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--                                                                          --
--               Copyright (C) 2014 - 2022 Gautier de Montmollin            --
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

with GWindows.Constants;
with GWindows.GStrings;
with GWindows.Types;

package body GWindows.Locales is

   --  Full list of the MS Locale Information Constants:
   --  http://msdn.microsoft.com/en-us/library/dd464799(v=vs.85).aspx

   LOCALE_SLIST      : constant := 16#0000_000C#;
   LOCALE_SDECIMAL   : constant := 16#0000_000E#;
   LOCALE_STHOUSAND  : constant := 16#0000_000F#;

   function Get_List_Separator return GString is
   begin
      return Get_Locale_Info (LOCALE_SLIST);
   end Get_List_Separator;

   function Get_Decimal_Separator return GString is
   begin
      return Get_Locale_Info (LOCALE_SDECIMAL);
   end Get_Decimal_Separator;

   function Get_Thousands_Separator return GString is
   begin
      return Get_Locale_Info (LOCALE_STHOUSAND);
   end Get_Thousands_Separator;

   LOCALE_USER_DEFAULT : constant := 16#400#;

   function Get_Locale_Info (Locale_Info_Code : Integer) return GString is

      Buffer : GString_C (0 .. Constants.Max_Text);

      function GetLocaleInfo
        (Locale   : Interfaces.C.long  := LOCALE_USER_DEFAULT;
         LCType   : Interfaces.C.long  := Interfaces.C.long (Locale_Info_Code);
         lpLCData : Types.LPTSTR       := Buffer (0)'Unchecked_Access;
         cchData  : Interfaces.C.int   := Constants.Max_Text)
      return Interfaces.C.int;

      pragma Import (StdCall, GetLocaleInfo,
                    "GetLocaleInfo" & Character_Mode_Identifier);

      use type Interfaces.C.int;
   begin
      if GetLocaleInfo /= 0 then
         return GWindows.GStrings.To_GString_From_C (Buffer);
      else
         raise Get_Locale_Info_Failed;
      end if;
   end Get_Locale_Info;

end GWindows.Locales;
