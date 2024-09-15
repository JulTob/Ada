with Text_IO;

procedure File_Hello is
   The_File : Text_Io.File_Type;                            -- File handle
   As_Input : constant Text_Io.File_Mode := Text_Io.In_File; -- File mode (input)
   External_Name : String := "C:\\Data\\My.Txt";             -- External file name
   The_Data : String(1..80);                                -- Buffer for reading data
   Line_Length : Natural;                                   -- Length of the input line
begin
   -- Attempt to open the file with error handling
   begin
      Text_Io.Open(The_File, As_Input, External_Name);       -- Open file for input
   exception
      when Text_Io.Name_Error =>
         Text_Io.Put_Line("Error: File not found.");
         return;  -- Exit if the file is not found
      when others =>
         Text_Io.Put_Line("An unexpected error occurred.");
         return;
   end;

   -- Loop through the file until reaching the end
   Input_Routine:
      while not Text_Io.End_Of_File(The_File) loop
         Text_Io.Get_Line(The_File, The_Data, Line_Length);  -- Read line from file
         Text_Io.Put_Line(The_Data(1..Line_Length));         -- Echo the line
      end loop Input_Routine;

   -- Close the file
   Text_Io.Close(The_File);
   Text_Io.Put_Line("File reading complete.");               -- Notify user that reading is complete
end File_Hello;
