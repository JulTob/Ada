with Ada.Text_IO;

procedure First_Letter is

    --Renames--
    package T_IO renames Ada.Text_IO;

    --Variables--
    Word: string;
begin

        T_IO.Put_Line("Escriba 4 letras en una palabra: ");
        T_IO.Get(Word);
        T_IO.Put_Line("La primera en el abecedario es " & Day'image(Day'Min( word(1), word(2), word(3), word(4) ) ));
end First_Letter;
