-- Global Reach: Demonstrates global variables

WITH Text_Io;             USE Text_Io;
WITH Ada.Integer_Text_IO; USE Ada.Integer_Text_IO;

PROCEDURE test IS

   Glob : Integer := 10; -- Global Variable

   -- bodies for 3 procedures
   PROCEDURE Access_Global IS
   BEGIN
      Put("In access_global is glob is: ");
      Put(Glob); New_Line; New_Line;
   END;

   PROCEDURE Hide_Global IS
      Glob : Integer := 0;   -- hide global glob with local glob
   BEGIN
      Put("In hide_global, glob is: ");
      Put(Glob); New_Line; New_Line;
   END;

   PROCEDURE Change_Global IS
   BEGIN
      Glob := -10;
      -- Change Global Variable Glob
      Put("In change_global glob is: ");
      Put(Glob); New_Line; New_Line;
   END;

BEGIN  -- main procedure

   Put( "In main glob is: ");
   Put(Glob); New_Line; New_Line;
   Access_Global;  -- call the procedures
   Hide_Global;
   Change_Global;
   Put( "In main glob now is: ");
   Put(Glob); New_Line; New_Line;
   Access_Global;  -- call the procedures

END;
