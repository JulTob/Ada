	-------------------------------------
	--Gestión de palabras en un fichero--
	-------------------------------------
  
--Analiza las lineas del fichero y almacena --En lista dinámica-- las palabras  y su ocurrencia--
--Además, el modo interactivo permite añadir/borrar/buscar palabras a la lista, pero no al ficihero!
--Muestra la palabra con más ocurrencia al final

--By Julio Toboso

--Librerias--
-------------
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Unchecked_Deallocation;
with Ada.Command_Line;
with ADA.Exceptions;
with Ada.IO_Exceptions;
-------------

--Programa principal--
----------------------

procedure Words is

--Renames--
	package T_IO renames Ada.Text_IO;
	package ASU renames Ada.Strings.Unbounded;
	package ACL renames Ada.Command_Line;


--Types--

	type Cell;

	type Word_List_Type is access Cell;

	type Cell is record
		Word: 	ASU.Unbounded_String;
		Cntr: 	Natural := 0; --Counter --Contador
		Next: 	Word_List_Type;
	  end record;

--Constantes--
	
--Variables--
	Text:	ASU.Unbounded_String;
	List: Word_List_Type;
	
--Subprogramas--
	procedure Free is new Ada.Unchecked_Deallocation(Cell, Word_List_Type);

	procedure 
  Add_Node (
    The_List: in out Word_List_Type ;  
    Word_To_Add: in ASU.Unbounded_String) is
	  begin
		  The_List.Word:= Word_To_Add;
		  The_List.Cntr:= 1;
		  The_List.Next:= null; --Opcional, pero buena praxis
	  end Add_Node;

	function 
  Make_List ( 
    Text_To_Read : in ASU.Unbounded_String) 
      return Word_List_Type is
		New_List: Word_List_Type;
		Word: ASU.Unbounded_String;
	  begin
		  New_List:= new Cell;
		  Get_Word (Text_To_Read, Word);
		  Add_Node (New_List, Word);
		  return New_List;
	  end Make_List;

	procedure 
  Print_List (
    Word_List: in Word_List_Type) is
		Aux: Word_List_Type;
	  begin
		  Aux:=Word_List;
		  loop 
			  T_IO.Put_Line(ASU.To_String(Aux.Word));
			  T_IO.Put_Line(Aux.Cntr'Image);
			  Aux:=Aux.Next;
		    exit when Aux= null;
		    end loop;
	  end Print_List;

	procedure 
  Dispose_List (
    Word_List: in out Word_List_Type) is
		Trasher:	Word_List_Type;
	  begin
		  loop 
			  Trasher:=Word_List.Next;
			  Word_List:=Word_List.Next;
			  Free(Trasher);
		    exit when Word_List= null;
		  end loop;
	  end Dispose_List;
   
begin	--Program--		
	List:= Make_List(Text);
	Print_List(List);
	Dispose_List(List);	
--Errors--

end Words;
