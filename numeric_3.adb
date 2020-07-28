--   {{Ada/Sourceforge|numeric_4.adb}}

with Ada.Text_IO;

procedure Numeric_3 is
   procedure Pop_Value;
   procedure Push_Value;

   type Value_Type is digits 12 range
      -999_999_999_999.0e999 .. 999_999_999_999.0e999;

   type Value_Array is
      array (Natural range 1 .. 4) of Value_Type;

   package T_IO renames Ada.Text_IO;
   package F_IO is new Ada.Text_IO.Float_IO (Value_Type);

   Values    : Value_Array := (others => 0.0);
   Operation : String (1 .. 40);
   Last      : Natural;

   procedure Pop_Value is
   begin
      Values (Values'First + 1 .. Values'Last) :=
         Values (Values'First + 2 .. Values'Last) & 0.0;
   end Pop_Value;

   procedure Push_Value is
   begin
      Values (Values'First + 1 .. Values'Last) :=
         Values (Values'First .. Values'Last - 1);
   end Push_Value;

begin
   Main_Loop : loop
      T_IO.Put (">");
      T_IO.Get_Line (Operation, Last);

      if Last = 1 and then Operation (1) = '+' then
         --  addition
         Values (1) := Values (2) + Values (1);
         Pop_Value;
      elsif Last = 1 and then Operation (1) = '-' then
         --  subtraction
         Values (1) := Values (2) - Values (1);
         Pop_Value;
      elsif Last = 1 and then Operation (1) = '*' then
         --  multiplication
         Values (1) := Values (2) * Values (1);
         Pop_Value;
      elsif Last = 1 and then Operation (1) = '/' then
         --  division
         Values (1) := Values (2) / Values (1);
         Pop_Value;
      elsif Last = 4
        and then Operation (1 .. 4) = "exit"
      then
         exit Main_Loop;
      else
         Push_Value;
         F_IO.Get
           (From => Operation,
            Item => Values (1),
            Last => Last);
      end if;

      Display_Loop : for I in reverse  Value_Array'Range loop
         F_IO.Put
           (Item => Values (I),
            Fore => F_IO.Default_Fore,
            Aft  => F_IO.Default_Aft,
            Exp  => 4);
         T_IO.New_Line;
      end loop Display_Loop;
   end loop Main_Loop;

   return;
end Numeric_3;

-----------------------------------------------------------------
--  $Log: numeric_3.adb,v $
--  Revision 2.2  2005/09/15 17:34:47  krischik
--  paranoia checkin
--
-----------------------------------------------------------------
--  vim: textwidth=0 nowrap                             :
--  vim: tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--  vim: filetype=ada encoding=latin1 fileformat=unix   :
