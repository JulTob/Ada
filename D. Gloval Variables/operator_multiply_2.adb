--   {{Ada/Sourceforge|operator_multiply_2.adb}}

with Ada.Text_IO;
with Ada.Strings.Fixed;

procedure Operator_Multiply_2 is
   use Ada.Strings.Fixed;

   package T_IO renames Ada.Text_IO;

   A : constant String := 10 * "X";  --  A is filled with 10 X.
begin
   T_IO.Put_Line ("A = " & A);
end Operator_Multiply_2;

-----------------------------------------------------------------
--  $Log: operator_multiply_2.adb,v $
--  Revision 2.2  2005/09/15 17:34:47  krischik
--  paranoia checkin
--
-----------------------------------------------------------------
--  vim: textwidth=0 nowrap                             :
--  vim: tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--  vim: filetype=ada encoding=latin1 fileformat=unix   :
