with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Vowels is
  Letter : Character;
  Vowel_Count : Integer := 0;
  Y_Count : Integer := 0;
begin
  while not End_Of_File loop
    Get(Letter );
    case Letter is
      when ’A’|’E’|’I’|’O’|’U’|’a’|’e’|’i’|’o’|’u’ =>
        Vowel_Count := Vowel_Count + 1;
---   when ’Y’|’y’ => Y_Count := Y_Count + 1;
      when others => null ;
    end case; 
  end loop;
  Put(”Total number of vowels = ”); 
  Put(Vowel Count); 
  New Line;
  
---  Put(”Total number of Ys = ”); Put(Y Count); 
  New Line(2); 
end Vowels;
