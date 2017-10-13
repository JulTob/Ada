with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Potencias_2 is
    --Renames--
    package T_IO renames Ada.Text_IO;
    package I_IO renames Ada.Integer_Text_IO;

    --Variables--
    N: integer:=15;

begin --Potencias_2

    --Tabla
    T_IO.put(" N");
    T_IO.put("          ");
    T_IO.put("2^N");
    T_IO.New_Line;
    T_IO.put("-------------------");
    T_IO.New_Line;

    for ii in 0..N loop
        I_IO.put(ii, Width=> 3);
        I_IO.put(2**ii, Width=> 10);
        T_IO.New_Line;
    end loop;


end Potencias_2;
