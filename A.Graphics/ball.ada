with Display;       use Display; 
with Display.Basic; use Display.Basic;
--  References to graphical library

procedure Ball is
   Ball : Shape_Id := New_Circle(
      X      => 0.0,   -- Parameters set by name
      Y      => 0.0,   -- 0.0 is a float value
      Radius => 10.0,
      Color  => Blue);
      --  Declaration of a shape object with an initial value
      
   Step : Float := 0.05;
begin

   loop
   
      -- If the ball gets out of the boundaries, invert
      if Get_X (Ball) > 100.0 then
         Step := -0.05;
      elsif Get_X (Ball) < -100.0 then
         Step := 0.05;
      end if;
      
      --  Move the ball in X
      Set_X (Ball, Get_X (Ball) + Step);
      
      delay 0.001;
      --  Wait 1 milisecond
      
   end loop;   
   
end Ball;
