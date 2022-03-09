with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure Calculator is
    First, Second : Integer;
    Operator      : Character;
    begin
      Put ("Enter an expression: ");
      Get (First);
      Get (Operator);
      Get (Second);
      case Operator is
        when '+' =>
            Put (First + Second, Width => 1);
        when '-' =>
            Put (First - Second, Width => 1);
        when '*' =>
            Put (First * Second, Width => 1);
        when '/' =>
            if second = 0 then raise Constraint_Error; end if;
            Put (First / Second, Width => 1);
        when others =>
            Put ("Invalid operator '");
            Put (Operator);
            Put ("'");
        end case;
      New_Line;
      exception
         when Constraint_Error | Data_Error =>
            Put_Line(" Input Error. Try again.");
            Skip_Line;
      end Calculator;
