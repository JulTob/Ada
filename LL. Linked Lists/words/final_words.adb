	-------------------------------------
	--Gestión de palabras en un fichero--
	-------------------------------------

--Analiza las lineas del fichero y almacena --En lista dinámica-- las palabras  y su ocurrencia--

--Además, el modo interactivo permite añadir/borrar/buscar palabras a la lista, pero no al ficihero!

--Muestra la palabra con más ocurrencia al final

--By Julio Toboso

--Librerias

with Split;
with Ada.Text_IO;
with word_lists;
	
	

procedure Final_Words is

--Paquetes
	package T_IO renames Ada.Text_IO;

--Variables
	Fichero:T_IO.File_Type;
	List: word_lists.Word_List_Type;
begin


	T_IO.Open(Fichero, T_IO.In_File, "f1.txt");	
	Split.Split_Text_In_Words(Fichero, List);
	T_IO.Close(Fichero);
	word_lists.Print_All(List);
	

end Final_Words;
