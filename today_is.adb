with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Calendar;

procedure Today_Is is

    --Renames--
    package T_IO renames Ada.Text_IO;
    package I_IO renames Ada.Integer_Text_IO;
    Package Cal renames Ada.Calendar;

    --Types--
    Type Month_Name is (Enero, Febrero, Marzo, Abril, Mayo, Junio, Julio, Septiembre, Octubre, Noviembre, Diciembre);

    --Variables--
    Today: constant Cal.Time := Cal.Clock;

begin --Today_Is
    T_IO.New_Line;
    I_IO.put(Cal.Year(Today), Width => 5);
    T_IO.put("/");
    I_IO.put(Cal.Month(Today), Width => 2);
    T_IO.put("/");
    I_IO.put(Cal.Day(Today), Width => 2);
    T_IO.New_Line;

    T_IO.put("Hoy es ");
    I_IO.put(Cal.Day(Today), Width => 2);
    T_IO.put(" de ");
    T_IO.put(Month_Name'Image(Month_Name'Val(Cal.Month(Today))));
    T_IO.put(" del ");
    I_IO.put(Cal.Year(Today), Width => 4);



end Today_Is;
