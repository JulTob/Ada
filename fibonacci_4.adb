--  {{Ada/Sourceforge|fibonacci_4.adb}}

with Ada.Text_IO;
with Ada.Command_Line;

procedure Fibonacci_4 is

   type Integer_Type is range 0 .. 999_999_999_999_999_999;

   package CL renames Ada.Command_Line;
   package T_IO renames Ada.Text_IO;
   package I_IO is new Ada.Text_IO.Integer_IO (Integer_Type);

   function Fib (N : Integer_Type) return Integer_Type;

   Last  : Positive;
   Value : Integer_Type;

   function Fib (N : Integer_Type) return Integer_Type is
      U : Integer_Type := 0;
      V : Integer_Type := 1;
   begin
      for I in  2 .. N loop
         Calculate_Next : declare
            T : constant Integer_Type := U + V;
         begin
            U := V;
            V := T;
         end Calculate_Next;
      end loop;
      return V;
   end Fib;

begin
   I_IO.Get
     (From => CL.Argument (1),
      Item => Value,
      Last => Last);
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
end Fibonacci_4;

-----------------------------------------------------------------
--  $Log: fibonacci_4.adb,v $
--  Revision 2.2  2005/09/15 17:34:47  krischik
--  paranoia checkin
--
-----------------------------------------------------------------
--  vim: textwidth=0 nowrap                             :
--  vim: tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--  vim: filetype=ada encoding=latin1 fileformat=unix   :
