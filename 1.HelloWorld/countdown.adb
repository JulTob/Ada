with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Countdown is
    package T_IO renames Ada.Text_IO;
    package I_IO renames Ada.Integer_Text_IO;

begin -- Countdown
    T_IO.New_Line;
    for ii in reverse 1..10 loop
        I_IO.Put(ii, Width => 3);
    end loop;
    T_IO.New_Line;
    for ii in 0..9 loop
        I_IO.Put(10-ii, Width => 3);
    end loop;
    T_IO.New_Line;
end Countdown;
