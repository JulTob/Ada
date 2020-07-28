with Ada.Text_IO;
with Ada.Strings.Fixed;

procedure Operator_Multiply_2 is
   use Ada.Strings.Fixed;

   package T_IO renames Ada.Text_IO;

   A : constant String := 10 * "X";  --  A is filled with 10 X.
begin
   T_IO.Put_Line ("A = " & A);
end Operator_Multiply_2;
