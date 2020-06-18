----------
--Titulo--
----------

--Descripción--
--ADS: Archivo de llamadas con with

--By Julio Toboso


--Librerias--
-------------

--Texto 
with Ada.Text_IO;
with Ada.Strings.Unbounded;

--Manejo de errores
with Ada.IO_Exceptions;
with Ada.Exceptions;

--Nombrar paquete de uso
package Modelo is

	--Renombrar Accesos rapidos a otras librerias
	package T_IO renames Ada.Text_IO;
	package UString renames Ada.Strings.Unbounded;	

	--Use (No usar use!)
	use Type ASU.Unbounded_String;
	
	--Tipos--
	---------

	--Lista
	type Nodo;

	type Puntero_Type is access Nodo;

	type Nodo is record
		Word: ASU.Unbounded_String;
		Count: Natural := 0;
		Next: Puntero_Type;
		Prev: Puntero_Type;
		end record;
	
	--Excepciones personalizadas

	TipoExcepcion: exception;

	--Procedimientos y funciones
	procedure Change (
		a: in out integer;
		b: in out integer);

	function funcion_int ( 
		a: in integer; 
		b: in integer);

end Modelo
