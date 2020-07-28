with Ada.Text_IO;

procedure Operator_Multiply is
   package T_IO renames Ada.Text_IO;
   package F_IO is new Ada.Text_IO.Float_IO (Float);
   package I_IO is new Ada.Text_IO.Integer_IO (Integer);

   A : constant Float   := 5.0 * 2.0;  --  A is now 10.0
   B : constant Integer := 5 * 2;      --  B is also 10
  begin
     T_IO.Put ("A = ");
     F_IO.Put (Item => A, Fore => 3, Aft => 1, Exp => 0);
     T_IO.New_Line;
     T_IO.Put ("B = ");
     I_IO.Put (Item => B, Width => 3, Base => 10);
     T_IO.New_Line;
    end Operator_Multiply;
