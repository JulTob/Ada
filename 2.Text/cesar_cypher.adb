with Ada.Text_IO; use Ada.Text_IO;
with Ada.Characters.Handling; use Ada.Characters.Handling;

procedure CESAR_CYPHER is

    function ROT_Encrypt(
      Input_Text : in String;
      Key        : in Natural := 1
      ) 
      return String 
      is 
          Output_Text : String(Input_Text'Range);
          Base, Offset, New_Offset : Integer;
          key_times: Integer;
      begin
          key_times := Key mod 26;
          for key_cicle in 1..key_times loop
              -- Encrypt the input using ROT-1 Key-times
              for I in 1 .. Input_Text'Length loop
                    if Input_Text(I) in 'A' .. 'Y' or Input_Text(I) in 'a' .. 'y' then
                        Output_Text(I) := Character'Val(Character'Pos(Input_Text(I)) + 1);
                    elsif Input_Text(I) = 'Z' then
                        Output_Text(I) := 'A';
                    elsif Input_Text(I) = 'z' then
                        Output_Text(I) := 'a';
                    else
                        Output_Text(I) := Input_Text(I);  -- Non-alphabetic characters remain unchanged
                    end if;
                    end loop;
                    end loop;
          return Output_Text;
          end ROT_Encrypt;

    Input_Text  : String(1 .. 100);
    Length      : Natural := 0;
    Encrypted   : String(1 .. 100);

  begin
      -- Prompt user for input
      Put("Enter a text to encrypt (up to 100 characters): ");
      Get_Line(Input_Text, Length);
      Length := Input_Text'Length;
      Encrypted := ROT_Encrypt(Input_Text(1 .. Length),200);
      Put_Line("Encrypted Text: ");
      Put_Line(Encrypted(1 .. Length));

      end CESAR_CYPHER;
