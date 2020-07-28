--  {{Ada/Sourceforge|fibonacci_2.adb}}

with Ada.Text_IO;
with Ada.Command_Line;

procedure Fibonacci_3 is

   type Cache_Type is range -1 .. 999_999_999_999_999_999;
   subtype Integer_Type is Cache_Type range
      0 .. Cache_Type'Last;

   package CL renames Ada.Command_Line;
   package T_IO renames Ada.Text_IO;
   package I_IO is new Ada.Text_IO.Integer_IO (Integer_Type);

   function Fib (N : in Integer_Type) return Integer_Type;

   Value : constant Integer_Type :=
      Integer_Type'Value (CL.Argument (1));

   type Cache_Array is
      array (Integer_Type range 0 .. Value) of Cache_Type;

   F : Cache_Array :=
      (0     => 0,
      1      => 1,
      others => Cache_Type'First);

   function Fib (N : in Integer_Type) return Integer_Type is
   begin
      if F (N) /= Cache_Type'First then
         return F (N);
      else
         F (N) := Fib (N - 1) + Fib (N - 2);
         return F (N);
      end if;
   end Fib;

begin
   T_IO.Put ("The Fibonacci of ");
   I_IO.Put
     (Item  => Value,
      Width => 3,
      Base  => I_IO.Default_Base);
   T_IO.Put (" is ");
   I_IO.Put
     (Item  => Fib (Value),
      Width => I_IO.Default_Width,
      Base  => I_IO.Default_Base);

   return;
end Fibonacci_3;

-----------------------------------------------------------------
--  $Log: fibonacci_3.adb,v $
--  Revision 2.2  2005/09/15 17:34:47  krischik
--  paranoia checkin
--
-----------------------------------------------------------------
--  vim: textwidth=0 nowrap                             :
--  vim: tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--  vim: filetype=ada encoding=latin1 fileformat=unix   :
