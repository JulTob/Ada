with Ada.Text_IO;
with Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions;

procedure Distancia_Euclidiana is

    package F_IO renames Ada.Float_Text_IO;
    package T_IO renames Ada.Text_IO;
    package N_EF renames Ada.Numerics.Elementary_Functions;

    type Punto is record
        D1: Float;
        D2: Float;
    end record;

    Punto_1: Punto;
    Punto_2: Punto;
    Distancia: Float;

begin --Distancia_Euclidiana

    T_IO.Put("Punto 1, dimensión X: ");
	F_IO.Get(Punto_1.D1);
    T_IO.Put("Punto 1, dimensión Y: ");
    F_IO.Get(Punto_1.D2);
    T_IO.Put("Punto 2, dimensión X: ");
    F_IO.Get(Punto_2.D1);
    T_IO.Put("Punto 2, dimensión Y: ");
    F_IO.Get(Punto_2.D2);
    Distancia:=N_EF.Sqrt((Punto_2.D1-Punto_1.D1)**2+(Punto_2.D2-Punto_1.D2)**2);
    T_IO.put_line("Well, that is" & float'image(Distancia) & " units of distance");

end Distancia_Euclidiana;
