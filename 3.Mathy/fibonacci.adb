with  Ada.Text_IO;
with  Ada.Command_Line;


procedure Fibonacci is

   type Positive is range 0 .. Integer'Last;

   package CL   renames Ada.Command_Line;
   package T_IO renames Ada.Text_IO;
   package I_IO is new  Ada.Text_IO.Integer_IO (Integer_Type);

   function Fib (N : Integer_Type) return Positive;
     Last  : Positive;
     Value : Integer_Type;
   function Fib (N : Integer_Type) return Positive is
   begin
      if N = 0 then
         return 0;
      elsif N = 1 then
         return 1;
      else
         return Fib (N - 1) + Fib (N - 2);
      end if;
   end Fib;

   
    function Fibonacci_Fast(N : Natural) return Natural is
      Lookup_Table : constant array(natural range 0..46) of Natural :=
        ( 0 =>           0,  1 =>             1,  2 =>             1,  3 =>           2,
          4 =>           3,  5 =>             5,  6 =>             8,  7 =>          13,
          8 =>          21,  9 =>            34, 10 =>            55, 11 =>          89,
         12 =>         144, 13 =>           233, 14 =>           377, 15 =>         610,
         16 =>         987, 17 =>         1_597, 18 =>         2_584, 19 =>       4_181,
         20 =>       6_765, 21 =>        10_946, 22 =>        17_711, 23 =>      28_657,
         24 =>      46_368, 25 =>        75_025, 26 =>       121_393, 27 =>     196_418,
         28 =>     317_811, 29 =>       514_229, 30 =>       832_040, 31 =>   1_346_269,
         32 =>   2_178_309, 33 =>     3_524_578, 34 =>     5_702_887, 35 =>   9_227_465,
         36 =>  14_930_352, 37 =>    24_157_817, 38 =>    39_088_169, 39 =>  63_245_986,
         40 => 102_334_155, 41 =>   165_580_141, 42 =>   267_914_296, 43 => 433_494_437,
         44 => 701_408_733, 45 => 1_134_903_170, 46 => 1_836_311_903
        );
   begin
      return Lookup_Table(N);
   end Fibonacci_Fast;


begin
   I_IO.Get(From => CL.Argument (1),
            Item => Value,
            Last => Last);
            
   T_IO.Put ("The Fibonacci of ");
   I_IO.Put (Item  => Value,
             Width => 3,
             Base  => I_IO.Default_Base);
   T_IO.Put (" is ");
   I_IO.Put (Item  => Fib (Value),
             Width => I_IO.Default_Width,
             Base  => I_IO.Default_Base);
   return;
end Fibonacci;
