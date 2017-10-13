with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Sumatorio is

    --Renames--
    package T_IO renames Ada.Text_IO;
    package I_IO renames Ada.Integer_Text_IO;

    --Functions & Procedures--

  function Suma_1_a (N: Integer) return Integer is

  begin --Suma_1_a

      return ((N*(N+1))/2);
  end Suma_1_a;

  function  Suma_Cuadrados (N: Integer) return Integer is
      total: integer :=0;
  begin -- Suma_Cuadrados
      for ii in 1..N loop
          total:=total + ii**2;
      end loop;
      return total;
  end Suma_Cuadrados;

  --Variables--
  N_In: Integer;
  N_Out:Integer;

begin --Sumatorio
    T_IO.Put_Line("Introduce N: ");
    I_IO.Get(N_In);
    N_Out:=Suma_1_a(N_In);
    T_IO.Put_Line("La suma de 1 a N: " & Integer'Image(N_Out));
    N_Out:=Suma_Cuadrados(N_In);
    T_IO.Put_Line("La suma de cuadrados de 1 a N: " & Integer'Image(N_Out));

end Sumatorio;
