--  Project Euler 
--  Problem 2
--  Julio Toboso 

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Euler_2 is
    Sum: Natural := 0;
    Limit : Natural := 4_000_000; -- 4 Million
    fib_1 : Natural := 0;
    fib_2 : Natural := 0;
    fib_3 : Natural := 1;
begin
    loop
        fib_1 := fib_2;
        fib_2 := fib_3;
        fib_3 := fib_1 + fib_2; 
        --Put(fib_3); -- To see that the series is correct. It is!
        exit when fib_3>Limit;
        if (fib_3 rem 2 = 0) then
            Sum := Sum + fib_3;
        end if;
    end loop;
    Put(sum);
end Euler_2;
