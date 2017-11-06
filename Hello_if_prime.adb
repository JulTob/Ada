with Ada.Text IO; use Ada.Text IO;
with Ada.Integer Text IO; use Ada.Integer Text IO;

procedure Prime is

Number : Integer;

begin

Put(”Enter an integer : ”); 
Get(Number);

if Number < 2 then
  Put(”The value ”); 
  Put(Number, 0);
  Put_Line(” is bad.”);
else
  Put(”The value ”); 
  Put(Number, 0); 
  for I in 2 .. (Number−1)loop
    if Number rem I = 0 then
      Put Line(” is not prime.”); 
      return;
    end if;
  end loop;
Put Line(” is prime.”); end if;
end Prime;
