

  Money_Delta : constant := 0.01;

  Money_First : constant := Integer'Pos (Integer'First) * Money_Delta;

  Money_Last : constant := Integer'Pos (Integer'Last) * Money_Delta;

  type Money is delta Money_Delta range Money_First .. Money_Last;

  for Money'Small use Money_Delta;


