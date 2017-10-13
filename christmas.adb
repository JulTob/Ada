with Ada.Text_IO;

procedure Christmas is
    --Renames--
    package T_IO renames Ada.Text_IO;

    --Variables--
    N: Integer:=10;

begin --Christmas

    for ii in 1..N loop
        T_IO.New_Line;

        for iii in 1..N-ii loop
            T_IO.Put(" ");
        end loop;

        for iv in reverse 1..2*ii-1 loop
            T_IO.Put("*");
        end loop;

    end loop;

    for v in 1..3 loop
        T_IO.New_Line;
        for vi in 1..N-1 loop
            T_IO.Put(" ");
        end loop;
        T_IO.Put("*");
    end loop;

end Christmas;
