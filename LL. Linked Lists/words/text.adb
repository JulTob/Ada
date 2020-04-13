
with Ada.Text_IO;
with Ada.Strings.Unbounded;



--Programa principal--
----------------------

procedure Text is



--Renames--

	package T_IO renames Ada.Text_IO;
	package ASU renames Ada.Strings.Unbounded;
	package ACL renames Ada.Command_Line;

--Types--

	type Index_Type is record
		from: integer:=0;
		to: integer:=0;
	end record;
	
--NdEditor: CHACHO! QUE ESTO TIENE QUE IR EN UN ARCHIVO APARTEEEEEEEEE!!!!	
	
	type Cell;

	type Word_List_Type is access Cell;

	type Cell is record
		Word: 	ASU.Unbounded_String;
		Cntr: 	Natural := 0; --Counter --Contador
		Next: 	Word_List_Type;
	end record;

-- CHACHO STA AQUI FUEEERA	


	
--Subprogramas--
	
	procedure Free is new Ada.Unchecked_Deallocation(Cell, Word_List_Type);

-----------------	Escribe aquí:


--	procedure Copy_File_To_Text(The_Text: in out ASU.Unbounded_String) is
--		File: T_IO.File_Type;
--		Finish: Boolean:= False;
--		Aux_Text: ASU.Unbounded_String;			 
--	begin
--		The_Text:=ASU.To_Unbounded_String(ACL.Argument(1));
--
--		T_IO.Open(File,T_IO.In_File,ASU.To_String(The_Text));
--
--
--			while not Finish loop
--			begin
--				Aux_Text:= ASU.To_Unbounded_String(T_IO.Get_Line(File));
--				T_IO.Put_Line(ASU.To_String(Aux_Text));
--			exception
--				when Ada.IO_Exceptions.End_Error =>
--					Finish := True;
--				end;
--			end loop;
--		T_IO.Close(File);
--	end Copy_File_To_Text;

--


--	function 



	procedure Add_Node ( 	The_List: in out Word_List_Type ; 
				Word_To_Add: in ASU.Unbounded_String) is
	
	begin
		The_List.Word:= Word_To_Add;
		The_List.Cntr:= 1;
		The_List.Next:= null; --Opcional, pero buena praxis

	end Add_Node;


	function Is_Valid( char: in character) return Boolean is
		bool: boolean:=False;
		aux: character;

	begin
		for aux in letter_uppercase loop
			if char=aux then
				bool:= True;
			end if
		end loop;
		for aux in letter_lowercase loop		
			if char=aux then
				bool:= True;
			end if
		
		end loop;
		for aux in number_letter loop		
			if char=aux then
				bool:= True;
			end if
		
		end loop;

		return bool;
	end Is_Valid;



	procedure Extract_Word (Read_Me_Text: in out ASU.Unbounded_String;  
				The_Word: in out ASU.Unbounded_String;
				ndex: in out index_type) is
		i:integer;

	begin

		for i in 1..Lenght(Read_Me_Text) loop

			if (not Is_Valid(Element(Read_Me_Text,i))) and (ndex.From<ndex.To) then

				ndex.From:=i;
				
			else
				ndex.To:=i;
			end if;
	
		The_Word:= ASU.Unbounded_Slice(Help_Me_Text, index.from, index.to);
		end loop;

		--clean word
		for i in ndex.from..ndex.to loop
			ASU.Replace_Element(Read_Me_Text,i,' ');
		end loop;

	end Extract_Word;







	procedure Initiate_Index(ndx: Index_Type) is
	begin
		ndx.from:=1;
		ndx.to:=2;
	end Initiate_Index;






	function Make_List_From_Line ( Text_To_Read : in out ASU.Unbounded_String) return Word_List_Type is
		New_List: Word_List_Type;
		Word: ASU.Unbounded_String;
		Index: Index_Type;
		lenght: Integer;
	begin	
		Initiate_Index(Index);
		New_List:= new Cell;
		Text_To_Read:=ASU.To_Unbounded_String("Hola mi polla");
		lenght:=ASU.Length(Text_To_Read);
		while (Index.To<=lenght) loop
			
		
			Extract_Word (Text_To_Read, Word, Index);
			Add_Node (New_List, Word);
			Index.To:=Index.To+1;
		end loop;
		return New_List;
	end Make_List_From_Line;




--
	procedure Print_List (Word_List: in Word_List_Type) is
		Aux: Word_List_Type;
	begin
		Aux:=Word_List;
		loop 
			T_IO.Put_Line(ASU.To_String(Aux.Word));
			Aux:=Aux.Next;
		exit when Aux= null;
		end loop;
	end Print_List;
--



	procedure Dispose_List (Word_List: in out Word_List_Type) is
		Trasher:	Word_List_Type;
	begin
		loop 
			Trasher:=Word_List.Next;
			Word_List:=Word_List.Next;
			Free(Trasher);
		exit when Word_List= null;
		end loop;
	end Dispose_List;
--

	


--Constantes--
	
--Variables--
	List: 	Word_List_Type;
	Text:	ASU.Unbounded_String;
begin

	
--Program--
		
	
--	Copy_File_To_Text(Text);					
	T_IO.Put_Line("Escribe Algo:");		--T_IO.End_Of_Line);
--	Get_Text(Text);
	List:= Make_List_From_Line(Text);
	Print_List(List);

	Dispose_List(List);
	

--Errors--

end Words;
