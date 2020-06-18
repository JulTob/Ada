----------
--Titulo--
----------

--Descripción--
--ADB: Algoritmos/Interfaz

--By Julio Toboso


--Declaración del paquete
--------------------------

package body Modelo is


--Procedimientos--
	
	--Liberar memoria del puntero
	procedure Free is new Ada.Unchecked_Deallocation(Nodo, Puntero_Type);

	procedure Change (
    a: in out integer;
		b: in out integer) is
		  Aux: integer;
    begin
		  Aux:= a;
		  a:= b;
		  b:= Aux;
	    end;

  --Funciones
	function funcion_int ( 
    a: in integer; 
    b: in integer) is
	  begin
		  s:=a+b;
	    end

  end Modelo;
