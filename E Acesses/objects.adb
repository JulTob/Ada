with Ada.Unchecked_Deallocation;
with Ada.Text_IO;
use Ada.Text_IO;

procedure Access_Type_Example is



  type Int_Access is access all Integer;
  type Flt_Access is access all Float;
  type Str_Access is access all String;

  to_int: Int_Access;
  to_flt: Flt_Access;
  to_Str: Str_Access;

  type My_Class is record
     To_Int: Int_Access;
     To_Flt: Flt_Access;
     To_Str: Str_Access;
     end record;

  Type Class_Access is access My_Class;

  Object: Class_Access;
  BackUp: Class_Access;

  -- Functions for deallocation.
  procedure Deallocate is New Ada.Unchecked_Deallocation( Object, Class_Access);
  procedure Deallocate is new Ada.Unchecked_Deallocation( To_Str, Str_Access);
  procedure Deallocate is new Ada.Unchecked_Deallocation( To_Flt, Flt_Access);
  procedure Deallocate is new Ada.Unchecked_Deallocation( To_Int, Int_Access);

  procedure Print(Object: Class_Access) is
    begin
      Put_Line("Object Content");
      Put_Line(" Integer: " & Integer'Image(Object.To_Int.all));
      Put_Line(" Float: "  & Float'Image(Object.To_Flt.all));
      Put_Line(" String: "  & Object.To_Str.all);
    end Print;


  Test_Int: aliased Integer:= 94;

  begin
    -- Allocate memory to the pointers.
    Object.all:= New Class_Access;
    Object.To_int:= Test_Int'Access;
    Object.To_flt:= New Float'(0.0);
    Object.To_Str:= New String'("Hello World");

    BackUp:= Object;

    Put_Line("BACKUP");
    Print(BackUp);

    -- Reset Object properties.
    BackUp.To_Int.all := 42;
    BackUp.To_Flt.all := 3.1415;
    BackUp.To_Str.all := "Hello Ada";

    Put_Line("BACKUP");
    Print(BackUp);

    Put_Line("Object");
    Print(Object);

    -- Deallocate
    Deallocate(Object.To_Flt);
    Deallocate(Object.To_Str);
    Deallocate(Object);





end    Access_Type_Example;
