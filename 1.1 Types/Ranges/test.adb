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

  New_Line;
  New_Line;


  Put_Line("Range of Long Integers:");
  New_Line;
  Put("From " &
    Long_Integer'Image(
      Long_Integer'First
    ) & " to " &
    Long_Integer'Image(
      Long_Integer'Last
    )
  );

  New_Line;
  New_Line;


    Put_Line("Range of Long Long Integers:");
    New_Line;
    Put("From " &
      Long_Long_Integer'Image(
        Long_Long_Integer'First
      ) & " to " &
      Long_Long_Integer'Image(
        Long_Long_Integer'Last
      )
    );

    New_Line;
    New_Line;

  Put_Line("Range of short Integers:");
  New_Line;
  Put("From " &
    Short_Integer'Image(
      Short_Integer'First
    ) & " to " &
    Short_Integer'Image(
      Short_Integer'Last
    )
  );


      New_Line;
      New_Line;

    Put_Line("Range of short short Integers:");
    New_Line;
    Put("From " &
      Short_Short_Integer'Image(
        Short_Short_Integer'First
      ) & " to " &
      Short_Short_Integer'Image(
        Short_Short_Integer'Last
      )
    );



    New_Line;
    New_Line;


    Put_Line("Range of Floats:");
    New_Line;
    Put("From " &
      Float'Image(
        Float'First
      ) & " to " &
      Float'Image(
        Float'Last
      )
    );


    New_Line;
    New_Line;


    Put_Line("Range of Long Floats:");
    New_Line;
    Put("From " &
      Long_Float'Image(
        Long_Float'First
      ) & " to " &
      Long_Float'Image(
        Long_Float'Last
      )
    );

    New_Line;
    New_Line;


    Put_Line("Range of Long Long Floats:");
    New_Line;
    Put("From " &
      Long_Long_Float'Image(
        Long_Long_Float'First
      ) & " to " &
      Long_Long_Float'Image(
        Long_Long_Float'Last
      )
    );

    New_Line;
    New_Line;


    Put_Line("Range of Short Floats:");
    New_Line;
    Put("From " &
      Short_Float'Image(
        Short_Float'First
      ) & " to " &
      Short_Float'Image(
        Short_Float'Last
      )
    );

    New_Line;
    New_Line;




end test;
