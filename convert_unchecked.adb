--    {{Ada/Sourceforge|convert_unchecked.adb}}

with Ada.Text_IO;
with Ada.Unchecked_Conversion;

procedure Convert_Unchecked is
   type Short is range -128 .. +127;
   type Byte is mod 256;

   package T_IO renames Ada.Text_IO;
   package I_IO is new Ada.Text_IO.Integer_IO (Short);
   package M_IO is new Ada.Text_IO.Modular_IO (Byte);

   function Convert is new Ada.Unchecked_Conversion (
      Source => Short,
      Target => Byte);

   A : constant Short := -1;
   B : Byte;
begin
   B := Convert (A);
   T_IO.Put ("A = ");
   I_IO.Put (Item => A, Width => 5, Base => 10);
   T_IO.Put (", B = ");
   M_IO.Put (Item => B, Width => 5, Base => 10);
end Convert_Unchecked;

-----------------------------------------------------------------
--  $Log: convert_unchecked.adb,v $
--  Revision 2.2  2005/09/15 17:34:47  krischik
--  paranoia checkin
--
-----------------------------------------------------------------
--  vim: textwidth=0 nowrap                             :
--  vim: tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--  vim: filetype=ada encoding=latin1 fileformat=unix   :
