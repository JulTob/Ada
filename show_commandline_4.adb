--   {{Ada/Sourceforge|show_commandline_4.adb}}

with Ada.Text_IO;
with Ada.Command_Line;
with Ada.Strings.Unbounded;

procedure Show_Commandline_4 is

   package T_IO renames Ada.Text_IO;
   package CL renames Ada.Command_Line;
   package SU renames Ada.Strings.Unbounded;

   X : SU.Unbounded_String :=
      SU.To_Unbounded_String (CL.Argument (1));

begin
   T_IO.Put ("Argument 1 = ");
   T_IO.Put_Line (SU.To_String (X));

   X := SU.To_Unbounded_String (CL.Argument (2));

   T_IO.Put ("Argument 2 = ");
   T_IO.Put_Line (SU.To_String (X));
end Show_Commandline_4;

-----------------------------------------------------------------
--  $Log: show_commandline_4.adb,v $
--  Revision 2.2  2005/09/15 17:34:47  krischik
--  paranoia checkin
--
-----------------------------------------------------------------
--  vim: textwidth=0 nowrap                             :
--  vim: tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--  vim: filetype=ada encoding=latin1 fileformat=unix   :
