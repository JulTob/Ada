with Ada.Text_Io;
with Ada.Characters.Latin_1;

procedure Hello is
   -- Escape character to terminate input
   Esc : constant Character := Ada.Characters.Latin_1.Esc;
   
   -- Input character variable initialized to space
   Input : Character := Ada.Characters.Latin_1.Space;

   -- Index for tracking the position in the string
   Index : Natural := 0;

   -- String to store the input, initialized with 80 spaces
   Max_Length : constant Natural := 80;
   Hello : String(1 .. Max_Length) := (others => Input);  

begin
   -- Prompt the user for input
   Ada.Text_Io.Put_Line("Enter characters (Press ESC to finish):");

   -- Get the first input immediately without requiring Enter
   Ada.Text_Io.Get_Immediate(Input);

   -- Loop until the Escape key is pressed
   while Input /= Esc loop
      -- Ensure we don't exceed the string bounds
      if Index < Max_Length then
         Index := Index + 1;                  -- Increment the index
         Hello(Index) := Input;               -- Store the character in the string
         Ada.Text_Io.Put(Input);              -- Echo the input character
      else
         Ada.Text_Io.Put_Line("Input limit reached (80 characters).");
         exit;                                -- Exit if the string limit is reached
      end if;

      -- Get the next input character
      Ada.Text_Io.Get_Immediate(Input);
   end loop;

   -- Print a newline for better formatting
   Ada.Text_Io.New_Line;

   -- Output the collected string, only up to the number of characters entered
   Ada.Text_Io.Put_Line(Hello(1 .. Index));   -- Only print up to the last valid index

end Hello;
