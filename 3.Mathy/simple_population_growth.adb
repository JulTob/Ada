with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Simple_Population_Growth is

    --Renames--
    package T_IO renames Ada.Text_IO;
    package I_IO renames Ada.Integer_Text_IO;

    --Function to calculate a step on growth
    function Growth_Step (Population_Numb: Integer; Growth_Rate: Integer) return Integer is

    begin --Growth_Step
        return Population_Numb+(Population_Numb*Growth_Rate)/100;
    end Growth_Step;

    --Variables--
    Population:  Integer;
    Growth_Rate: Integer;
    N_Periods:   Integer;
begin --Simple_Population_Growth
    T_IO.put(" Initial Population: ");
    I_IO.get(Population);
    T_IO.put(" Growth rate in percentage (%) for one period of time:");
    I_IO.get(Growth_Rate);
    T_IO.put(" How many periods:");
    I_IO.get(N_Periods);

    for ii in 1..N_Periods loop
        Population:= Growth_Step(Population,Growth_Rate);
    end loop;

    T_IO.New_Line;
    T_IO.put(" The population at the end is: ");
    I_IO.put(Population);
    T_IO.New_Line;


end Simple_Population_Growth;
