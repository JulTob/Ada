with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Hello_old is

    --Renames--
    package T_IO renames Ada.Text_IO;
    package I_IO renames Ada.Integer_Text_IO;

    --Variables--
    Age: integer range 0..120;

begin
    T_IO.put("Hello. What's your age? ");
    I_IO.get(Age);	--Might cause an exception if out of range

    if Age<18 then
	T_IO.put_line("You are too young to watch South Park!");
    elsif Age<60 then	--note spelling of elsif and closing THEN
	T_IO.Put_Line("Ok. Go on.");
    else
	T_IO.Put_Line("You are too old for South Park! Watch Rick and Morty instead");
    end if;		--we close the control structure


exception		--ALWAYS control your exceptions!
    when constraint_error =>
	T_IO.Put_Line("Really?");

end Hello_old;
