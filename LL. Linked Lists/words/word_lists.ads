with Ada.Strings.Unbounded;

package Word_Lists is
   package ASU renames Ada.Strings.Unbounded;
   
   type Cell;
   type Word_List_Type is access Cell;
   type Cell is record
      Word: ASU.Unbounded_String;
      Count: Natural := 0;
      Next: Word_List_Type;
     end record;
   
   Word_List_Error: exception; 
   
   procedure 
   Add_Word (
   	List : in out Word_List_Type; 
	Word : in     ASU.Unbounded_String);
   
   procedure 
   Delete_Word (
   	List: in out Word_List_Type; 
	Word: in     ASU.Unbounded_String);
   
   procedure 
   Search_Word (
   	List:  in  Word_List_Type;
	Word:  in  ASU.Unbounded_String;
	Count: out Natural);
   
   procedure 
   Max_Word (
   	List:  in  Word_List_Type;
	Word:  out ASU.Unbounded_String;
	Count: out Natural);  
   
   procedure 
   Print_All (
   	List: in Word_List_Type);
   
end Word_Lists;
