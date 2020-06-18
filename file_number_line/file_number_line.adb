with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.IO_Exceptions;

procedure File_Number_Line is
  --Renames
  package T_IO renames Ada.Text_IO;
  package ASU  renames Ada.Strings.Unbounded;

  --String type
  --subtype UString is new ASU.Unbounded_String;

  --Fichero
  Fichero_de_Texto: Ada.Text_IO.File_Type;

  --Lineas
  Line_Length:  constant Integer:= 10;
  Line_N:  Integer:= 1;
  Line: ASU.Unbounded_String;

  begin -- File_Number_Line

    Ada.Text_IO.Open( File => Fichero_de_Texto,
                      Mode => T_IO.In_File,
                      Name => "archivo.txt");

    declare
      Finish: Boolean:= False;
      begin
        while not Finish loop
          Line := ASU.To_Unbounded_String(
            T_IO.Get_Line( Fichero_de_Texto)  );
          <<here>>
          T_IO.Put(Line_N'Image & " ");
          T_IO.Put_Line( 
              ASU.To_String( 
                ASU.Head( 
                  Source =>  Line ,
                  Count  =>  Line_Length)));
            Line_N:= Line_N+1;
          if Line_Length < ASU.Length(Line) then
              Line:= ASU.Tail(
                 Source => Line,
                 Count  => ASU.Length(Line)-Line_Length );
              goto here;
              end if;
            Finish:=T_IO.End_Of_File(Fichero_de_Texto);
          end loop;
        exception
            when Ada.IO_Exceptions.End_Error =>
                Finish:= true;
        end;
    T_IO.Close(Fichero_de_Texto);
    end File_Number_Line;
