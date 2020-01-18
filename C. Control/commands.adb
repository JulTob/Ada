with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Command_Line;

procedure Linea_Comandos is

  package ACL renames Ada.Command_Line;
	package ASU renames Ada.Strings.Unbounded;
	use type ASU.Unbounded_String;

	Mi_Excepcion: exception;
	
begin
	
	
	
	if ACL.Argument_Count /= 2 then
		raise Mi_Excepcion;
	end if;
	
	Ada.Text_Io.Put_Line(ACL.Argument(2));
	
exception
	when Mi_Excepcion => 
		Ada.Text_Io.Put_Line("Pon al menos un argumento");
	
end Linea_Comandos;



