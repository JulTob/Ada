with Ada.Text_IO;
use Ada.Text_IO;

procedure CharsAndQuits is

   Char : CHARACTER;

begin

   Put_Line(
      "Input characters to display, enter 'Q' to stop."
   );

   loop      
   --  Reads one character at a time and display it
      Get( Char );
      Put( Char );
      New_Line;
      exit when Char = 'Q';
   end loop;
   
   New_Line(2);

end CharsAndQuits;




-- Result of execution

-- (The output depends on the input.)
