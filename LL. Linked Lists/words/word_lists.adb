	---------------------------------------
	--Gestión de palabras en un fichero  --
	--Paquete de manejo de lista de datos--
	---------------------------------------
--Permite añadir/borrar/buscar palabras a la lista, pero no al ficihero!
--By Julio Toboso



--Librerias--

with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Unchecked_Deallocation;
with Ada.Command_Line;
with ADA.Exceptions;
with Ada.IO_Exceptions;


--Declaración de paquete!
-------------------------

package body Words_Lists is

--Renames--

	package T_IO renames Ada.Text_IO;
	package ASU renames Ada.Strings.Unbounded;
	package ACL renames Ada.Command_Line;

	use Type ASU.Unbounded_String;

--Types están en .ads!--

	
--Procedimientos--
	
	procedure Free is new Ada.Unchecked_Deallocation(Cell, Word_List_Type);

----------------Escribe aquí:



	procedure Sort (List: in out Word_List_Type) is
		Aux_List: Word_List_Type;
		Aux2_List: Word_List_Type;
		Aux3_List: Word_List_Type;

		finish: boolean:= False;
	begin
		--Buscar el maximo para primero
		Aux_List:=List;
		Aux2_List:=List;
		Aux3_List:=List;
		
		while not finish loop
			if Aux2_List=null then
				finish:=true;
			elsif List.Count<Aux2_List.Count then
				List:=Aux2_List;
				Aux3_List.Next:=Aux2_List.Next;
				List.Next:=Aux_List;			
				Aux2_List:=Aux3_List.Next;
			end if;
			
		end loop;
		if List.Next/=null then
		
		Sort(List.Next);

		end if;
	end;

--No toques
	Procedure New_Node (Last_Pointer: in out Word_List_Type; 
				Word : in ASU.Unbounded_String) is
	begin
		Last_Pointer:= New Cell;
		Last_Pointer.Word:=Word;
		Last_Pointer.Count:=1;
		Last_Pointer.Next:=null; --Opcional, pero buena praxis
	end New_Node;


-- No toques
	procedure Add_Word (List: in out Word_List_Type;
			Word: in ASU.Unbounded_String) is
		
		Aux_List: Word_List_Type;
		finish: boolean:= False;
		auxB: 	boolean:= False;
	begin
		Aux_List:=List;
		
		--si no existe la crea

		if Aux_List=null then
			New_Node(List,Word);
		else

		-- Busca si la palabra concuerda (si es así ++Cntr y termina)
		
			loop  
			
				if Aux_List.Word=Word then
					Aux_List.Count:=Aux_List.Count+1;
					finish:=true;
				
		-- Mira si el siguiente va a tierra (si va, nuevo nodo y termina)

				elsif Aux_List.Next=null then
					New_Node(Aux_List.Next,Word);
					finish:=True;
				end if;

		-- Si nada de lo anterior, siguiente nodo.
				Aux_List:=Aux_List.Next;

		    	exit when finish;
			end loop;
		end if;
		
		Sort(List);

	end Add_Word;

		


--No toques esto

	procedure Print_All (Word_List: in Word_List_Type) is
		Aux: Word_List_Type;
	begin
		Aux:=Word_List;
		loop 
			T_IO.Put_Line(ASU.To_String(Aux.Word));
			T_IO.Put_Line(Integer'Image(Aux.Count));
			Aux:=Aux.Next;
		exit when Aux= null;
		end loop;
	end Print_All;




--No toques esto, pero metelo al programa principal!
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

end Words_Lists;
