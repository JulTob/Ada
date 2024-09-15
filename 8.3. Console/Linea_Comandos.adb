with Ada.Text_IO;
with Ada.Command_Line;

procedure Linea_Comandos is
   -- Renaming the Ada.Command_Line package for easier usage
   package ACL renames Ada.Command_Line;

   -- Custom exception for argument handling
   Mi_Excepcion: exception;

begin
   -- Check if the number of arguments is exactly 2 (program name + 1 argument)
   if ACL.Argument_Count /= 2 then
      raise Mi_Excepcion;  -- Raise exception if the argument count is not 2
   end if;

   -- Print the second argument (the first user-provided argument)
   Ada.Text_Io.Put_Line(ACL.Argument(2));

exception
   -- Handle the custom exception and provide a more informative message
   when Mi_Excepcion =>
      Ada.Text_Io.Put_Line("Error: Exactly one argument is expected. Please provide one argument.");

end Linea_Comandos;
