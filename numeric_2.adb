--   {{Ada/Sourceforge|numeric_2.adb}}

with Ada.Text_IO;

procedure Numeric_2 is
   type Value_Type is digits 12 range
      -999_999_999_999.0e999 .. 999_999_999_999.0e999;

   package T_IO renames Ada.Text_IO;
   package F_IO is new Ada.Text_IO.Float_IO (Value_Type);

   Value_1   : Value_Type;
   Value_2   : Value_Type;
   Result    : Value_Type;
   Operation : Character;

begin
   T_IO.Put ("First Value  : ");
   F_IO.Get (Value_1);
   T_IO.Put ("Second Value : ");
   F_IO.Get (Value_2);
   T_IO.Put ("Operation    : ");
   T_IO.Get (Operation);

   case Operation is
      when '+' =>
         Result := Value_1 + Value_2;
      when '-' =>
         Result := Value_1 - Value_2;
      when others =>
         T_IO.Put_Line ("Illegal Operation.");
         goto Exit_Numeric_2;
   end case;

   F_IO.Put (Value_1);
   T_IO.Put (" ");
   T_IO.Put (Operation);
   T_IO.Put (" ");
   F_IO.Put (Value_2);
   T_IO.Put (" = ");
   F_IO.Put (Result);

   <<Exit_Numeric_2>>return;
end Numeric_2;

-----------------------------------------------------------------
--  $Log: numeric_2.adb,v $
--  Revision 2.2  2005/09/15 17:34:47  krischik
--  paranoia checkin
--
-----------------------------------------------------------------
--  vim: textwidth=0 nowrap                             :
--  vim: tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--  vim: filetype=ada encoding=latin1 fileformat=unix   :
