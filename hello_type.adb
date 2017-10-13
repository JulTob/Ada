with Ada.Text_IO;

procedure Hello_Type is

    --Renames--
    package T_IO renames Ada.Text_IO;

    --Types--
    type Day is (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday);
    type Gender is (M, F, X);

    --Variables--
    Today: Day := Thursday;
    John: Gender:= M;
    Jane: Gender:= F;
    Chr: Character:='c';

begin
    T_IO.Put_Line("John is " & Gender'Image(John));
    T_IO.Put_Line("Gender 1st= " & Gender'image(Gender'First));
    T_IO.Put_Line("Gender Last= " & Gender'image(Gender'Last));


    T_IO.Put_Line("First in list (Tuesday or Friday?) = " & Day'image(Day'Min(Tuesday, Friday)));
    T_IO.Put_Line("Last in list (Tuesday or Friday?) = " & Day'image(Day'Max(Tuesday, Friday)));
    T_IO.Put_Line("Next to Tuesday = " & Day'image(Day'Succ(Tuesday)));
    T_IO.Put_Line("Previous to Tuesday = " & Day'image(Day'Pred(Tuesday)));

    T_Io.Put_Line("Just a letter:" & character'image(Chr));

--Descubrir que hace todo esto:
--    Day'Pos(Monday);
--    Day'Pos(Today);
--    Day'Val(6);
--    Today < Tuesday;
--    Day'Succ(Sunday);
--    Day'Pred(Monday);
--    Day'Val(0);
--    Today >= Thursday;

end Hello_Type;
