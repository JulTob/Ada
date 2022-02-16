

with Ada.Strings.Maps.Constants;
with Ada.Strings.Fixed;
with Ada.Text_IO; use Ada.Text_IO;

procedure Test is
   Test_String : String := "Hello World!";
begin
   -- Display Original String
   Put_Line(Test_String);

   -- Change String to all Upper Case and Display
   Put_Line(Ada.Strings.Fixed.Translate(Test_String,
     Ada.Strings.Maps.Constants.Upper_Case_Map));

   -- Change String to all Lower Case and Display
   Put_Line(Ada.Strings.Fixed.Translate(Test_String,
     Ada.Strings.Maps.Constants.Lower_Case_Map));

end Test;


