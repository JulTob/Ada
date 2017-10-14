with    Ada.Text_IO;
With    Ada.Integer_Text_IO;

procedure Fuerza_Bruta is
    --Renames--
    package T_IO renames Ada.Text_IO;
    package I_IO renames Ada.Integer_Text_IO;

    --Variables--
    --Fichero
    File: T_IO.File_Type;
    a: Character:= 'a';
    z: Character:= 'z';
    n0: Character:='0';
    n9: Character:='9';
begin --Fuerza_Bruta


    for VIII in n0..n9 loop
        T_IO.Create(File, T_IO.Out_File,VIII & "fuerza_bruta.txt");
        T_IO.New_Line(File);
        for VII in a..z loop
            for VI in a..z loop
                for V in n0..n9 loop
                    for IV in n0..n9 loop
                        for III in n0..n9 loop
                            for II in n0..n9 loop
                                for I in n0..n9 loop

        --Salida: VIII-VII-VI-V-IV-III-II-I
        T_IO.Put(File, VIII & VII & VI & V & IV & III & II & I);
        T_IO.New_Line(File);
                                end loop;
                            end loop;
                        end loop;
                    end loop;
                end loop;
            end loop;
        end loop ;
        T_IO.Close(File);
    end loop ;
--    T_IO.Close(File);
end Fuerza_Bruta;
