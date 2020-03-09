-- Basic ranges for types

with Ada.Text_IO;

procedure test is
  use Ada.Text_IO;
begin
  Put_Line("Range of Integer:");
  New_Line;
  Put("From " &
    Integer'Image(
      Integer'First
    ) & " to " &
    Integer'Image(
      Integer'Last
    )
  );

  New_Line;
  New_Line;

  Put_Line("Range of Natural:");
  New_Line;
  Put("From " &
    Integer'Image(
    -- Note that we can call Naturals onto the Integer Atribute, as it is a subtype
      Natural'First
    ) & " to " &
    Integer'Image(
      Natural'Last
    )
  );

  New_Line;
  New_Line;

  Put_Line("Range of Positive:");
  New_Line;
  Put("From " &
    Integer'Image(
      Positive'First
    ) & " to " &
    Integer'Image(
      Positive'Last
    )
  );
end test;
