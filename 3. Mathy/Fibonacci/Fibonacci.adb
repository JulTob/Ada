with Ada.Text_IO;
with Ada.Command_Line;

procedure Fibonacci_1 is

   type Integer_Type is range 0 .. 999_999_999_999_999_999;

   package CL renames Ada.Command_Line;
   package T_IO renames Ada.Text_IO;
   package I_IO is new Ada.Text_IO.Integer_IO (Integer_Type);

   function Fib (N : Integer_Type) return Integer_Type;

   Last  : Positive;
   Value : Integer_Type;

   function Fib (N : Integer_Type) return Integer_Type is
      begin
        if N = 0 then
          return 0;
        elsif N = 1 then
          return 1;
        else
          return Fib (N - 1) + Fib (N - 2);
        end if;
      end Fib;

begin
   I_IO.Get
     (From => CL.Argument (1),
      Item => Value,
      Last => Last);

   T_IO.Put ("The Fibonacci of ");
   I_IO.Put(
      Item  => Value,
      Width => 3,
      Base  => I_IO.Default_Base);
   T_IO.Put (" is ");
   I_IO.Put(
      Item  => Fib (Value),
      Width => I_IO.Default_Width,
      Base  => I_IO.Default_Base);

   return;
end Fibonacci_1;
