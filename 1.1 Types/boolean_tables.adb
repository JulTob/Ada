-- Basic ranges for types

with Ada.Text_IO;

procedure boolean_tables is
  use Ada.Text_IO;
begin

  New_Line;
  Put("Truth tables");
  Put("============");

  New_Line;
  New_Line;

  Put("AND");   New_Line;
  Put("___");
  for b1 in boolean'range loop
  for b2 in boolean'range loop
    New_Line;
    Put(
      boolean'Image(b1)
      & " "
      & "AND"
      & " "
      & boolean'Image(b2)
      & " "
      & "="
      & " "
      & boolean'Image(b1 AND b2));
  end loop;
  end loop;


  New_Line;
  New_Line;

  Put("OR");   New_Line;
  Put("___");
  for b1 in boolean'range loop
  for b2 in boolean'range loop
    New_Line;
    Put(
      boolean'Image(b1)
      & " "
      & "OR"
      & " "
      & boolean'Image(b2)
      & " "
      & "="
      & " "
      & boolean'Image(b1 OR b2));
  end loop;
  end loop;




  New_Line;
  New_Line;

  Put("NOT");   New_Line;
  Put("___");
  for b in boolean'range loop
    New_Line;
    Put(
      "NOT"
      & " "
      & boolean'Image(b)
      & " "
      & "="
      & " "
      & boolean'Image(NOT b));
  end loop;


  New_Line;
  New_Line;

  Put("XOR");   New_Line;
  Put("___");
  for b1 in boolean'range loop
  for b2 in boolean'range loop
    New_Line;
    Put(
      boolean'Image(b1)
      & " "
      & "XOR"
      & " "
      & boolean'Image(b2)
      & " "
      & "="
      & " "
      & boolean'Image(b1 XOR b2));
  end loop;
  end loop;


  New_Line;
  New_Line;

  Put("= (Eq.)");   New_Line;
  Put("_______");
  for b1 in boolean'range loop
  for b2 in boolean'range loop
    New_Line;
    Put(
      boolean'Image(b1)
      & " "
      & "="
      & " "
      & boolean'Image(b2)
      & " "
      & "->"
      & " "
      & boolean'Image(b1 = b2));
  end loop;
  end loop;

  New_Line;
  New_Line;

  Put("/= (Not Eq.)");   New_Line;
  Put("____________");
  for b1 in boolean'range loop
  for b2 in boolean'range loop
    New_Line;
    Put(
      boolean'Image(b1)
      & " "
      & "/="
      & " "
      & boolean'Image(b2)
      & " "
      & "->"
      & " "
      & boolean'Image(b1 /= b2));
  end loop;
  end loop;

New_Line;
New_Line;

  Put("AND then");   New_Line;
  Put("________");
  for b1 in boolean'range loop
  for b2 in boolean'range loop
    New_Line;
    Put(
      boolean'Image(b1)
      & " "
      & "AND THEN"
      & " "
      & boolean'Image(b2)
      & " "
      & "="
      & " "
      & boolean'Image(b1 AND then b2));
  end loop;
  end loop;


  New_Line;
  New_Line;

  Put("OR Else");   New_Line;
  Put("_______");
  for b1 in boolean'range loop
  for b2 in boolean'range loop
    New_Line;
    Put(
      boolean'Image(b1)
      & " "
      & "OR ELSE"
      & " "
      & boolean'Image(b2)
      & " "
      & "="
      & " "
      & boolean'Image(b1 OR Else b2));
  end loop;
  end loop;


end boolean_tables;
