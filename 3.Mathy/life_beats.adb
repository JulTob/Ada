with Ada.Text_IO;

procedure Life_Beats is

    --Renames--
    package T_IO renames Ada.Text_IO;

    --Variables--
    Beats_in_sec: float := 1.0;
    sec_in_min  : constant float:= 60.0;
    min_in_hour : constant float:= 60.0;
    hour_in_day : constant float:= 24.0;
    day_in_year : constant float:= 365.25;
    years_lived : constant float:= 78.0;
    total       : float;

begin
    total:= Beats_in_sec*sec_in_min*min_in_hour*hour_in_day*day_in_year*years_lived;
    T_IO.put("The number of beats of a heart of");
    T_IO.Put(integer'image(integer(years_lived)));
    T_IO.Put(" is aproximately ");
    T_IO.Put(float'image(total));
    T_IO.New_Line;


exception
    when constraint_error => 	T_IO.Put_Line("A heart beats a lot in " & float'Image(years_lived) & " years");

end Life_Beats;
