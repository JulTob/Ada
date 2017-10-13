with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Tabla_Sum_Fact is
    --Renames--
    package T_IO renames Ada.Text_IO;
    package I_IO renames Ada.Integer_Text_IO;

    --Functions & Procedures--
    function Suma(N:Integer) return Integer is
    begin -- Suma
        return ((N*(N+1))/2);
    end Suma;

    function Factorial(N:Integer) return Integer is
        Out_N: Integer:=1;
    begin -- Suma
        for ii in 1..N loop
            Out_N:=Out_N*N;
        end loop;
        return Out_N;
    end Factorial;

    --Variables--
    N: integer range 1..9;
    
begin --Tabla
    T_IO.New_Line;
    T_IO.put("N=  ? ");
    I_IO.get(N);
    T_IO.New_Line;
    T_IO.put("    ");
    T_IO.put("N");
    T_IO.put("    ");
    T_IO.put("Suma");
    T_IO.put("    ");
    T_IO.put("Factorial");
    T_IO.New_Line;
    T_IO.put("----------------------------");
    T_IO.New_Line;

    for ii in 1..N loop
        I_IO.put(ii, Width=> 5);
        I_IO.put(Suma(ii), Width=> 8);
        I_IO.put(Factorial(ii), Width=> 13);
        T_IO.New_Line;
    end loop;

exception
    when constraint_error =>
        T_IO.Put_Line("Rango: 1..9");


end Tabla_Sum_Fact;
