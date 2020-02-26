with Ada.Numerics.Elementary_Functions;  use Ada.Numerics.Elementary_Functions;
with Ada.Text_IO;                        use Ada.Text_IO;
with Generic_Rational;
 
procedure Test_Rational is
   package Integer_Rational is new Generic_Rational (Integer);
   use Integer_Rational;
begin
   for Candidate in 2..2**15 loop
      declare
         Sum  : Rational := 1 / Candidate;
      begin
         for Divisor in 2..Integer (Sqrt (Float (Candidate))) loop
            if Candidate mod Divisor = 0 then -- Factor is a divisor of Candidate
               Sum := Sum + One / Divisor + Rational'(Divisor / Candidate);
            end if;
         end loop;
         if Sum = 1 then
            Put_Line (Integer'Image (Candidate) & " is perfect");
         end if;
      end;
   end loop;
end Test_Rational;
