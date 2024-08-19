with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.IO_Exceptions;
with Ada.Exceptions;
with word_lists;

package body Split is

    procedure Split_Line_In_Words(
        Frase : in out UString.Unbounded_String;
        List  : in out word_lists.Word_List_Type
    ) is 
        End_Of_Line : Boolean := False;
        Word        : UString.Unbounded_String;
        Position    : Integer;
    begin
        while not End_Of_Line loop
            -- Find the position of the first space.
            Position := UString.Index(Frase, " ");
            
            if Position = 0 then  -- No more spaces, end of line.
                End_Of_Line := True;
            elsif Position = 1 then  -- Space at the beginning, skip it.
                Frase := UString.Tail(Frase, UString.Length(Frase) - 1);
            else
                -- Extract the word before the space.
                Word := UString.Head(Frase, Position - 1);
                word_lists.Add_Word(List, Word);
                -- Remove the word and the space from the original string.
                Frase := UString.Tail(Frase, UString.Length(Frase) - Position);
            end if;
        end loop;
    end Split_Line_In_Words;

    procedure Split_Text_In_Words(
        Fichero : in T_IO.File_Type;
        List    : in out word_lists.Word_List_Type
    ) is 
        End_Of_File : Boolean := False;
        Line        : UString.Unbounded_String;
    begin
        while not End_Of_File loop
            begin
                -- Read the next line and split it into words.
                Line := UString.To_Unbounded_String(T_IO.Get_Line(Fichero));
                Split_Line_In_Words(Line, List);
            exception
                when Ada.IO_Exceptions.End_Error =>
                    -- End of the file reached.
                    End_Of_File := True;
            end;
        end loop;
    end Split_Text_In_Words;

end Split;
