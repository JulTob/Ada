--  {{Ada/Sourceforge|numeric_8.adb}}

with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Exceptions;
--  with Ada.Containers.Indefinite_Vectors;

procedure Numeric_8 is
   package Str renames Ada.Strings.Unbounded;
   package T_IO renames Ada.Text_IO;
   package Exept renames Ada.Exceptions;

   type Result is (
      Exit_Calculator,
      Start_Real,
      Start_Complex,
      Start_Real_Matrix,
      Start_Complex_Matrix);

   function Get_Line return Str.Unbounded_String;
   function Real_Calculator return Result;
   function Complex_Calculator return Result;

   type Value_Type is digits 12 range
      -999_999_999_999.0e999 .. 999_999_999_999.0e999;

   Activ_Calculator : Result := Start_Real;

   function Complex_Calculator return Result is separate;
   function Get_Line return Str.Unbounded_String is separate;
   function Real_Calculator return Result is separate;

begin
   Main_Loop : loop
      Try : begin
         case Activ_Calculator is
            when Exit_Calculator =>
               exit Main_Loop;
            when Start_Real =>
               Activ_Calculator := Real_Calculator;
            when Start_Complex =>
               Activ_Calculator := Complex_Calculator;
            when Start_Real_Matrix =>
               raise Program_Error;
            when Start_Complex_Matrix =>
               raise Program_Error;
         end case;
      exception
         when An_Exception : others =>
            T_IO.Put_Line
              (Exept.Exception_Information (An_Exception));
      end Try;
   end loop Main_Loop;

   return;
end Numeric_8;

-----------------------------------------------------------------
--  $Log: numeric_8.adb,v $
--  Revision 2.2  2005/09/15 17:34:47  krischik
--  paranoia checkin
--
-----------------------------------------------------------------
--  vim: textwidth=0 nowrap                             :
--  vim: tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--  vim: filetype=ada encoding=latin1 fileformat=unix   :
