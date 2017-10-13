with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Is_Prime is

    --Renames--
    package T_IO renames Ada.Text_IO;
    package I_IO renames Ada.Integer_Text_IO;

    --Funcs & Procs--
    function Check(number: Integer) return Boolean is
        result: Boolean:= True;
    begin -- Check
        if (number<=1) then
            result:=False; --1 no es primo. No, no sé xq.
            return result;
        end if;
        for ii in 2..number-1 loop
                if ((number rem ii)=0 and then (number rem 2)=0 ) and then (number rem 3)=0 ) then
                    result:=False;
                    return result;
                end if;
        end loop;
        return result;
    end Check;

    procedure Up_To(number: Integer) is
    begin -- Up_To
        T_IO.New_Line;
        for ii in 2..number loop
            if Check(ii) then
                    I_IO.put(ii);
                    T_IO.New_Line;
            end if;
        end loop;
        T_IO.New_Line;
    end Up_To;

    function Nth_Prime(N: integer) return Integer is
        Result  : integer:=1;
        Count_Down  :   integer:=N;
        Count_Up    :   integer:=1;
    begin -- Nth_Prime
        while Count_Down>1 loop  --Inconsistencia: Aquí quiero que 1 sea primo
                                 --Más que nada xq da sensacion de orden 1>>1 2>>2 3>>3 4>>5 5>>7
            Count_Up:=Count_Up+1;
            if Check(Count_Up) then
                Count_Down:=Count_Down-1;
                result:=Count_Up;
            end if;

        end loop;

        return result;
    end Nth_Prime;


    --Variables--
    N: Integer;
begin --Is_Prime
    T_IO.put(" Check for prime: ");
    I_IO.get(N);
    if Check(N) then
        T_IO.Put_Line("  Is prime ");
    else
        T_IO.Put_Line("  Not prime ");
    end if;
 -- T_IO.Put_Line("Primes up to N:");
 -- Up_To(N);
    T_IO.Put_Line("The Nth Prime is:");
    I_IO.put(Nth_Prime(N));
end Is_Prime;
