with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure Calculator is
    First, Second : Integer;
    Operator      : Character;
    result        : Integer;
    begin
      Put ("Enter an expression: ");
      Get (First);
      Get (Operator);
      Get (Second);
      case Operator is
        when '+' =>
            Result := First + Second;
        when '-' =>
            Result := First - Second;
        when '*' =>
            Result := First * Second;
        when '/' =>
            if second = 0 then raise Constraint_Error; end if;
            Result := First / Second;
        when others =>
            Put ("Invalid operator '");
            Put (Operator);
            Put ("'");
        end case;
      Put(Result, Width => 1);
      New_Line;
      exception
         when Constraint_Error | Data_Error =>
            Put_Line(" Input Error. Try again.");
            Skip_Line;
      end Calculator;
