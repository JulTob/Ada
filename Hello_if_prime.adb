with Ada.Text IO; use Ada.Text IO;
with Ada.Integer Text IO; use Ada.Integer Text IO;

procedure Prime is

Number : Positive;

  --This function returns true if N is prime, false otherwise
  function Is_Prime((N: Positive) return Boolean is
  begin --Is_Prime
    for ii in 2..(N-1) loop
      if (N mod ii)=0 then
        return False;
      end if;
    end loop;
    return True;
  end Is-Prime;

begin --Prime

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
    Put_Line(" is prime.");
  else
    Put_Line(" is NOT prime.");
  end if;
end if;
end Prime;
