
with Ada.Text_IO;
with Ada.Integer_Text_IO;


package Trafico is

	--Renames--
        package T_IO renames Ada.Text_IO;
    	package I_IO renames Ada.Integer_Text_IO;


	--Types--
	type Tipo_Trafico is (Lento, Moderado, Correcto, Rapido, Punible);
	

	--Functions & Procedures--
	function Clasifica(Speed: integer) return Tipo_Trafico;

	

end Trafico;
