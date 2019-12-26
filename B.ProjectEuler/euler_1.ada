--  Project Euler 
--  Problem 1
--  Julio Toboso 

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Euler_1 is
    Sum: Natural := 0;
    To: Positive := 1000;
begin
    for multiple in 1..(To-1) loop
        if (multiple rem 3 = 0) or else (multiple rem 5 = 0) then
            Sum := Sum + Multiple;
            end if;
    end loop;
    Put(sum);
end Euler_1;
