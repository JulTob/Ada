with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Sueldo_Neto is

    --Renames--
    package T_IO renames Ada.Text_IO;
    package I_IO renames Ada.Integer_Text_IO;

    --Types--
    type dinero is delta 0.01 digits 10;

    --Variables--
    horas_trabajadas: integer:= 0;
    euros_en_hora:    dinero := 0.00;
    Get_N:  integer:= 0;
    bruto:  dinero := 0.00;
    SS:     dinero := 0.00; --Seguridad Social
    IRPF:   dinero := 0.00; --Impuesto Renta Personas Fisicas (supongo)
    neto:   dinero := 0.00;

begin --Sueldo_Neto
    T_IO.put("Introduce las horas trabajadas en un mes:  ");
    I_IO.get(Get_N);
    horas_trabajadas:= Get_N;
    T_IO.put("Introduce el coste en euros por hora:  ");
    I_IO.get(Get_N);
    euros_en_hora:= dinero(Get_N);
    bruto:= dinero( float(horas_trabajadas)*float(euros_en_hora));
    SS:= bruto*0.20;
    if bruto>600.00 then
        IRPF:=(bruto-600.00)*0.15;
    end if;
    neto:=bruto-SS-IRPF;
    T_IO.Put_Line("Bruto: " & Dinero'Image(Bruto));
    T_IO.Put_Line("Neto: " & Dinero'Image(Neto));

end Sueldo_Neto;
