with Ada.Text_IO;

procedure Hello is
    Str  : String (1 .. 80);
    Last: Natural;
begin
   Ada.Text_IO.Put_Line("Hello, world!");
   Ada.Text_IO.Get_Line(Str,Last);
end Hello;
