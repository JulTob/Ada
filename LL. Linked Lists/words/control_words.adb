with Ada.Exceptions;
with Ada.IO_Exceptions;
with Ada.Text_IO;
with Word_Lists;

procedure Control_Words is

	package T_IO renames Ada.Text_IO;

	package Int_IO is new Ada.Text_IO.Integer_IO(Integer);
	
	stop: boolean:= false;
	selector: integer:= 0;

	procedure lounch_control_mode
    ( selector: in out integer) is
	  begin
	
		T_IO.Put_Line("Options");
		T_IO.Put_Line("[1] Add word");
		T_IO.Put_Line("[2] Delete word");
		T_IO.Put_Line("[3] Search word");
		T_IO.Put_Line("[4] Show all words");
		T_IO.Put_Line("[5] Quit");
		Int_IO.Get(selector);
		T_IO.Skip_Line;
	  exception	
	    when ADA.IO_EXCEPTIONS.DATA_ERROR =>
		    selector:=0;
		    T_IO.Skip_Line;
	  end lounch_control_mode;




	procedure Dispose_List
    (Word_List: in out Word_List_Type) is
    Trasher:	Word_List_Type;
	  begin
		loop 
			Trasher:=Word_List.Next;
			Word_List:=Word_List.Next;
			Free(Trasher);
		  exit when Word_List= null;
		  end loop;
	  end Dispose_List;

begin	
  while not stop loop 
		lounch_control_mode(selector);
		case selector is
			when 1 =>
				T_IO.Put_Line("Selection: Add");
				T_IO.Put_Line("Write the word");
				Add_Word (List; Word);
			when 2 =>
				T_IO.Put_Line("Selection: Delete");
				T_IO.Put_Line("Write the word");
			when 3 =>
				T_IO.Put_Line("Selection: Search");
				T_IO.Put_Line("Write the word");
			when 4 =>
				T_IO.Put_Line("Selection: Show all");
			when 5 =>
				T_IO.Put_Line("Selection: Quit");
				T_IO.Put_Line("Bye.");
				stop:=true;
			when others =>
				Ada.Text_IO.Put_Line("Not a valid statement. Choose a diferent case");
		  end case;
	  end loop;
  end Control_Words;
