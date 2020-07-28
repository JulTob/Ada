
with Ada.Text_IO;
with Ada.Command_Line;

procedure Show_Commandline_1 is

   package T_IO renames Ada.Text_IO;
   package CL renames Ada.Command_Line;

   X : String := CL.Argument (1);

begin
   T_IO.Put ("Argument 1 = ");
   T_IO.Put_Line (X);

   X := CL.Argument (2);

   T_IO.Put ("Argument 2 = ");
   T_IO.Put_Line (X);
end Show_Commandline_1;
