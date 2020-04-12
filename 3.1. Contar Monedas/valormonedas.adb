
with Ada.Text_IO;

procedure ValorMonedas is

	package Integer_IO is new Ada.Text_IO.Integer_IO(Integer);

	package T_IO renames Ada.Text_IO;
 	

	Valores: array (1..6) of Integer;
	Contable: Integer ;
	Cantidad: Integer;
	Aux: Integer;

begin

	Contable:=0;
	Cantidad:=0;
	
	Valores:=(1,2,5,10,20,50);
	
	for C in Integer range 1..6 loop
	
		T_IO.Put("Monedas de" & Integer'Image(Valores(C)) & "centimos ");

		Integer_IO.Get(Cantidad);

		T_IO.New_Line(1);

		Contable:= Contable + (Cantidad * Valores(C));
	end loop;
	--Parte "a mano" del loop. Se indexa a misma altura por relación
		T_IO.Put("Monedas de 1 Euro ");

		Integer_IO.Get(Cantidad);

		T_IO.New_Line(1);

		Contable:=Contable + (Cantidad * 100);
		
		T_IO.Put("Monedas de 2 Euros ");

		Integer_IO.Get(Cantidad);

		T_IO.New_Line(1);

		Contable:= Contable + (Cantidad * 200);
	
	Aux:= Contable/100;
	Contable:= Contable - (Aux*100);

	T_IO.Put_Line("Son " & Integer'Image(Aux) & " Euros y "
			 & Integer'Image(Contable) & " centimos.");
	

end ValorMonedas;
