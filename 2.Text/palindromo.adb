with Ada.Strings.Unbounded;
with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Palindromo is

    --Renames--
    package T_IO renames Ada.Text_IO;
    package I_IO renames Ada.Integer_Text_IO;

    --Words--
    Input: String(1..100);
    Length: Positive;

    --Check for palindrom--
    function Check_Palindrom
        (Input: String)
    return Boolean is
        Is_Palindrom: Boolean:=True;
    begin -- Check_Palindrom
        for ii in 1..Input'Length loop
            if Input(ii)/=Input(Input'Length+1-ii) then
                Is_Palindrom:=False;
                return Is_Palindrom;
            end if;
        end loop;
        return Is_Palindrom;
    end Check_Palindrom;

begin -- Palindromo

    T_IO.Put_Line("Give me a word, pal: ");
    T_IO.Get_line(Input, Length);
    if Check_Palindrom(Input(1..Length)) then
        T_IO.Put_Line("Is palindrom");
    else
        T_IO.Put_Line("Not palindrom!");
    end if;

end Palindromo;
