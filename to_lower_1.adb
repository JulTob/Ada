--  {{Ada/Sourceforge|to_lower_1.adb}}

with Ada.Text_IO;
with Ada.Command_Line;
with Ada.Characters.Handling;

procedure To_Lower_1 is

   package CL renames Ada.Command_Line;
   package T_IO renames Ada.Text_IO;

   function To_Lower (Str : String) return String;

   Value : constant String := CL.Argument (1);

   function To_Lower (C : Character) return Character renames
      Ada.Characters.Handling.To_Lower;

   --  tolower - translates all alphabetic, uppercase characters
   --  in str to lowercase
   function To_Lower (Str : String) return String is
      Result : String (Str'Range) := (others => ' ');
   begin
      for C in  Str'Range loop
         Result (C) := To_Lower (Str (C));
      end loop;
      return Result;
   end To_Lower;
begin

   T_IO.Put ("The lower case of ");
   T_IO.Put (Value);
   T_IO.Put (" is ");
   T_IO.Put (To_Lower (Value));

   return;
end To_Lower_1;

-----------------------------------------------------------------
--  $Log: to_lower_1.adb,v $
--  Revision 2.1  2005/09/15 17:37:57  krischik
--  paranoia checkin
--
-----------------------------------------------------------------
--  vim: textwidth=0 nowrap                             :
--  vim: tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--  vim: filetype=ada encoding=latin1 fileformat=unix   :
