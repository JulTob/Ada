with Ada.Text_IO;

procedure Hello_Name is

    --Renames--
    package T_IO renames Ada.Text_IO;

    --Variables--
    Name: string(1..100);	--100 character array, string of 100
    Last: integer;		--To localize last (proper) letter of the name

begin
    T_IO.put("Hello. What's your name? ");
    T_IO.get_line(name,last);
    T_IO.put_line("Nice to meet you, " & name(1..Last));
				-- & : string concatenation
				--name(1..Last) : array slice

end Hello_Name;
