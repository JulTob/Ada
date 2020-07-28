--  {{Ada/Sourceforge|numeric_1.adb}}

with Ada.Text_IO;

procedure Numeric_1 is
   type Value_Type is digits 12 range
      -999_999_999_999.0e999 .. 999_999_999_999.0e999;

   package T_IO renames Ada.Text_IO;
   package F_IO is new Ada.Text_IO.Float_IO (Value_Type);

   Value_1 : Value_Type;
   Value_2 : Value_Type;

begin
   T_IO.Put ("First Value : ");
   F_IO.Get (Value_1);
   T_IO.Put ("Second Value : ");
   F_IO.Get (Value_2);

   F_IO.Put (Value_1);
   T_IO.Put (" + ");
   F_IO.Put (Value_2);
   T_IO.Put (" = ");
   F_IO.Put (Value_1 + Value_2);
end Numeric_1;

-----------------------------------------------------------------
--  $Log: numeric_1.adb,v $
--  Revision 2.2  2005/09/15 17:34:47  krischik
--  paranoia checkin
--
-----------------------------------------------------------------
--  vim: textwidth=0 nowrap                             :
--  vim: tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--  vim: filetype=ada encoding=latin1 fileformat=unix   :
