--   {{Ada/Sourceforge|show_commandline_2.adb}}

with Ada.Text_IO;
with Ada.Command_Line;
with Ada.Strings.Fixed;

procedure Show_Commandline_2 is

   package T_IO renames Ada.Text_IO;
   package CL renames Ada.Command_Line;
   package S renames Ada.Strings;
   package SF renames Ada.Strings.Fixed;

   X : String := CL.Argument (1);

begin
   T_IO.Put ("Argument 1 = ");
   T_IO.Put_Line (X);

   SF.Move
     (Source  => CL.Argument (2),
      Target  => X,
      Drop    => S.Right,
      Justify => S.Left,
      Pad     => S.Space);

   T_IO.Put ("Argument 2 = ");
   T_IO.Put_Line (X);
end Show_Commandline_2;

-----------------------------------------------------------------
--  $Log: show_commandline_2.adb,v $
--  Revision 2.2  2005/09/15 17:34:47  krischik
--  paranoia checkin
--
-----------------------------------------------------------------
--  vim: textwidth=0 nowrap                             :
--  vim: tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--  vim: filetype=ada encoding=latin1 fileformat=unix   :
