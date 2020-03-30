with Ada.Unchecked_Deallocation;
with Ada.Text_IO;
use Ada.Text_IO;

procedure TestAccess is

  type Int_Access is access all Integer;

  int1: Int_access;
  int2: Int_Access;
  procedure Free
    is new Ada.Unchecked_Deallocation(
      Integer,
      Int_Access);

  alint: aliased Integer := 12;

  begin

    int1:= new Integer'(7);

    New_Line;
    Put(Integer'Image(int1.all));
    
    int2:= int1;
    int2.all:= 3;

    New_Line;
    Put(Integer'Image(int1.all));
    Put(Integer'Image(int2.all));
    Put(Integer'Image(alint));

    int2:= alInt'Access;
    int2.all:=5;

    New_Line;
    Put(Integer'Image(int1.all));
    Put(Integer'Image(int2.all));
    Put(Integer'Image(alint));

    alint:= 2;

    New_Line;
    Put(Integer'Image(int1.all));
    Put(Integer'Image(int2.all));
    Put(Integer'Image(alint));

    Free(int1);
  --  Free(int2);  -- No! Points to allocated object


    end TestAccess;
