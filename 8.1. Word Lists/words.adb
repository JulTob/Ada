---------------------------------
-- Word Management from a File --
---------------------------------

-- This program analyzes lines from a file and stores words and their occurrences
-- in a dynamic list. The interactive mode allows adding, deleting, or searching
-- for words in the list (but not modifying the file itself).

-- Finally, the word with the highest occurrence is displayed at the end.

-- Author: Julio Toboso

-- Libraries

with Split;              -- Custom package for splitting text into words
with Ada.Text_IO;        -- Standard input/output package
with word_lists;         -- Custom package for managing word lists and their occurrences
	
	

procedure Words is

  --Paquetes
    -- Renaming Ada.Text_IO for cleaner code
	  package T_IO renames Ada.Text_IO;

  -- Variables
    Fichero : T_IO.File_Type;                -- File handler for the input file
    List : word_lists.Word_List_Type;        -- Dynamic list to store words and occurrences
    File_Name : String := "f1.txt";          -- Default file name (can be changed by the user)
  begin

   -- Open the file for reading (dynamic file name could be used)
	 T_IO.Open(Fichero, T_IO.In_File, File_Name);	

   -- Call the Split package procedure to split the text into words and populate the list
   Split.Split_Text_In_Words(Fichero, List);

   -- Close the file after processing
   T_IO.Close(Fichero);

   -- Display the entire word list (with occurrences)
   word_lists.Print_All(List);

   -- Optionally, the following could be added to display the word with the highest occurrence:
   -- word_lists.Display_Most_Frequent(List); -- This assumes such a procedure exists in word_lists

  exception
    when T_IO.Name_Error =>
      T_IO.Put_Line("Error: File not found or cannot be opened.");
    when others =>
      T_IO.Put_Line("An unexpected error occurred while processing the file.");


  end Words;
