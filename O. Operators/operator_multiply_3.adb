with Ada.Text_IO;
with Ada.Strings.Fixed;

procedure Operator_Multiply_3 is
   use Ada.Strings.Fixed;

   package T_IO renames Ada.Text_IO;

   A : constant String := 3 * "Hello ";   --  A is filled with 3
                                          --  Hello.
  begin
     T_IO.Put_Line ("A = " & A);
    end Operator_Multiply_3;
