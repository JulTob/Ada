with Ada.Text_IO;

procedure Convert_Evaluate_As is
   type Byte is mod 256;

   package T_IO renames Ada.Text_IO;
   package M_IO is new Ada.Text_IO.Modular_IO (Byte);

   A : constant Byte := Byte'(256);
  begin
     T_IO.Put ("A = ");
     M_IO.Put (Item => A, Width => 5, Base => 10);
    end Convert_Evaluate_As;
