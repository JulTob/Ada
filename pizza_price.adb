with Ada.Text_IO;
with Ada.Float_Text_IO;

procedure Pizza_Price is

    --Renames--
    package T_IO renames Ada.Text_IO;
    package F_IO renames Ada.Float_Text_IO;

    --Variables--
    Pi      : constant float := 3.141_59;
    radius  : float;
    --width : float;  --If you want per volume
    price   : float;
    get_f   : float;

begin -- Pizza_Price
    T_IO.put_line("How much for the pizza? (Rounded in €)");
    F_IO.get(get_f);
    price:=get_f;
    T_IO.New_Line;
    T_IO.put_line("How much pizza? (Diameter)");
    F_IO.get(get_f);
    radius:=get_f/2.0;
    T_IO.New_Line;
    T_IO.put_line("Well, that is" & float'image(price/(Pi*radius*radius)) & " per unit area");

end Pizza_Price;
