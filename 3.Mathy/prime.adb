with Ada.Text IO; use Ada.Text IO;
with Ada.Integer Text IO; use Ada.Integer Text IO;

procedure Prime is

  function Is_Prime(N : Integer) return Boolean is
  ---   O(N)
  begin
     for I in 2 .. (Number/2+1)loop
      if Number rem I = 0 then
        return false; 
      end if;
    end loop;
    return true; 
  end Is_Prime;
  
  
  function Is_Prime2(N : Integer) return Boolean is
    ---   O(sqrt(N))
     test: positive := 2;
     Upper : Positive := N-1;
  begin
    while test <= upper loop
      pragma Loop_Invariant(Trial_Divisor <= N);
      
      if N rem test = 0 then
        return false;
      end if;
      
      upper := N/ test;
      test := test + 1;
    end loop;
    
    return true;
    
  end Is_Prime2;
  
  
  
  
  
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
  if Is_Prime(Number) then
      Put Line(” is not prime.”); 
  else 
    Put Line(” is prime.”); 
  end if;
end if;
end Prime;
