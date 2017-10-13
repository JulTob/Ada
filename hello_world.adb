with Ada.Text_IO;		--Uso de la libreria de Texto In/Out

procedure Hello_World is	--Declaracion del programa

	package T_IO renames Ada.Text_IO;
			--Sustituye con T_IO para llamar a la libreria Text_IO


begin 				--Comienza la definicion del programa

	T_IO.Put_Line("Hola mundo");
			--Las dobles comillas ("...") declaran un array de chars
			--Put_Line es una función que imprime por salida estandar

end Hello_World;


--------------------------Nota-----------------------
--Se crea un ejecutable desde la pantalla de comandos
--Se usa GNAT
--Para instalar GNAT usa el comando:
--
----sudo apt-get install gnat
--
--
--El programa debe guardarse en minusculas con la extensión [.adb]
----programa.adb
--
--
--Para compilar y enlazar el programa se invoca:
--
----gnatmake programa.adb
--
--
--El Ejecutable se guarda sin extensión
--Se ejecuta con el comando del tipo
--./programa
--
--
--Asegurate de que el PATH esté bien:
--Para cambiarlo usa el comando export 
-- export PATH=/Applications/GNAT/bin:$PATH
