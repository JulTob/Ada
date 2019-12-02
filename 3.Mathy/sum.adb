with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Sum is


subtype Number is Positive;


procedure Sum_Constraint_Error_Message;
procedure Interface_Error_Message;


function is_Even(n: in Number) return Boolean is

begin -- is_Even
  return ((n mod 2) = 0);
end is_Even;

function Sum(n: in Number) return Number is

begin -- Sum
if n=1 then return 1; end if;
  if is_Even(n) then
    return (n+1)*n/2;
  else
    return Sum(n-1)+n;
  end if;
  exception
    when Constraint_Error => Sum_Constraint_Error_Message;
end Sum;

function Sum(from: in Number; To: in Number ) return Number is

begin -- Sum
  return (Sum(to)-Sum(from-1));
end Sum;


procedure Single_Mode_Set(n: in out Number) is
  use Ada.Text_IO;
  use Ada.Integer_Text_IO;
begin -- Interface
  Put_Line("Introduce a number to calculate the series 1 to n");
  Put("   n = ");
  Get(n);
end Single_Mode_Set;

procedure Single_Mode_Result(n: in Number) is
  use Ada.Text_IO;
  use Ada.Integer_Text_IO;
begin -- Interface

  Put("The series 1 to ");
  Put(n);
  Put_Line(" is");

  Put("  = ");
  Put(Sum(n));

end Single_Mode_Result;

procedure Double_Mode_Set(n: in out Number; m: in out Number ) is
  use Ada.Text_IO;
  use Ada.Integer_Text_IO;
begin -- Interface
  Put_Line("Introduce a number to calculate the series n to m");
  Put("   n = ");
  Get(n);
  Put("   m = ");
  Get(m);

  if m <= n then
    raise Constraint_Error;
  end if;
end Double_Mode_Set;

procedure Double_Mode_Result(n: in Number; m: in Number ) is
  use Ada.Text_IO;
  use Ada.Integer_Text_IO;
begin -- Interface

  Put("The series ");
  Put(n);
  Put(" to ");
  Put(m);
  Put_Line(" is");

  Put("  = ");
  Put(Sum(n,m));
end Double_Mode_Result;

procedure Mode_Selection
  (mode : in out Positive)
is
  use Ada.Text_IO;
  use Ada.Integer_Text_IO;
begin -- InterfaceInput
  Put_Line("Set the Mode:");
  Put_Line("  1. Sum 1 to N, setting N");
  Put_Line("  2. Sum N to M, setting N and M");
  Put("   mode = ");
  Get(mode);
end Mode_Selection;



  procedure Sum_Constraint_Error_Message is
    use Ada.Text_IO;
  begin -- Sum_Constraint_Error_Message
    Put_Line("Sum is defined for Natural Positive Integers only");
  end Sum_Constraint_Error_Message;

  procedure Interface_Error_Message is
    use Ada.Text_IO;
  begin -- Interface_Error_Message
    Put_Line("Interface Error:");
    Put_Line("Select from available modes by introducing the number.");
    Put_Line("Inputs must be positive natural numbers.");
    Put_Line("The upper limit (m) must be greater than the lower limit (n)");


  end Interface_Error_Message;


--Sum's interface
  n: Number;
  m: Number;
  mode : Positive range 1..2;
begin
  Mode_Selection(mode);
  if mode=1 then
    Single_Mode_Set(n);
    Single_Mode_Result(n);
  elsif mode=2 then
    Double_Mode_Set(n,m);
    Double_Mode_Result(n,m);
  end if;

exception
  when others =>
    Interface_Error_Message;
end Sum;
