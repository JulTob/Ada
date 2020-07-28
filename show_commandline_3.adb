--   {{Ada/Sourceforge|show_commandline_3.adb}}

with Ada.Text_IO;
with Ada.Command_Line;
with Ada.Strings.Bounded;

procedure Show_Commandline_3 is

   package T_IO renames Ada.Text_IO;
   package CL renames Ada.Command_Line;

   function Max_Lenght
     (Value_1 : Integer;
      Value_2 : Integer)
      return    Integer;

   function Max_Lenght
     (Value_1 : Integer;
      Value_2 : Integer)
      return    Integer
   is
      Retval : Integer;
   begin
      if Value_1 > Value_2 then
         Retval := Value_1;
      else
         Retval := Value_2;
      end if;
      return Retval;
   end Max_Lenght;

   pragma Inline (Max_Lenght);

   package SB is new Ada.Strings.Bounded.Generic_Bounded_Length (
      Max => Max_Lenght
               (Value_1 => CL.Argument (1)'Length,
                Value_2 => CL.Argument (2)'Length));

   X : SB.Bounded_String :=
      SB.To_Bounded_String (CL.Argument (1));

begin
   T_IO.Put ("Argument 1 = ");
   T_IO.Put_Line (SB.To_String (X));

   X := SB.To_Bounded_String (CL.Argument (2));

   T_IO.Put ("Argument 2 = ");
   T_IO.Put_Line (SB.To_String (X));
end Show_Commandline_3;

-----------------------------------------------------------------
--  $Log: show_commandline_3.adb,v $
--  Revision 2.2  2005/09/15 17:34:47  krischik
--  paranoia checkin
--
-----------------------------------------------------------------
--  vim: textwidth=0 nowrap                             :
--  vim: tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--  vim: filetype=ada encoding=latin1 fileformat=unix   :
