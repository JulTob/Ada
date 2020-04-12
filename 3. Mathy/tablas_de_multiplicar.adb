with Ada.Text_IO;

	-- Programa que muestras las tablas de multiplicar
procedure Tablas_De_Multiplicar is
	Resultado: Integer;

 begin
	Ada.Text_IO.Put_Line("Tablas de Multiplicar");
	Ada.Text_IO.Put_Line("=====================");
	Ada.Text_IO.New_Line(2);
	for Fila in 1..10 loop

		for Columna in 1..10 loop
			Resultado := Fila * Columna;
			Ada.Text_IO.Put (Integer'Image(Fila) & " * " &
					Integer'Image(Columna) & " = " &
					Integer'Image(Resultado));
			Ada.Text_IO.New_Line;
		    end loop;
		Ada.Text_IO.New_Line;
	    end loop;
    end Tablas_De_Multiplicar;
