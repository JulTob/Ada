with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.IO_Exceptions;
with Ada.Exceptions;
with word_lists;

package body Split is
	
	procedure 
	Split_Line_In_Words
		(Frase: in out UString.Unbounded_String;
		List:   in out word_lists.Word_List_Type) is 
			Finish_Line: Boolean :=False;
			Word: UString.Unbounded_String;
			Position: Integer;
		begin
			while not Finish_Line loop 
				Position:= UString.Index(Frase," ");
				if Position = 0 then 						
					Finish_Line:= True;		
				elsif Position=1 then 
					Frase:= UString.Tail(Frase,UString.Length(Frase)-Position);					
				else 
					Word:= UString.Head(Frase,Position-1);
					word_lists.Add_Word(List,Word);
					Frase:= 
						UString.Tail(
							Frase,
							UString.Length(Frase)-Position);		
					end if;
			end loop;
		end Split_Line_In_Words;

	
	procedure 
	Split_Text_In_Words(
		Fichero: in T_IO.File_Type;
		List: in out word_lists.Word_List_Type) is 
			Finish: Boolean:= False;
			Line: UString.Unbounded_String;
		begin	while not Finish loop 
			begin
				Line := UString.To_Unbounded_String(T_IO.Get_Line(Fichero));
				Split_Line_In_Words(Line,List);
			exception
				when Ada.IO_Exceptions.End_Error =>
					Finish := True;
			end;
		end loop;
		end Split_Text_In_Words;
	
end Split;
