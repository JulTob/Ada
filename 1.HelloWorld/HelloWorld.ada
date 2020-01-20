with Ada.Text_IO;

procedure HelloWorld is
  use Ada.Text_IO;
begin -- HelloWorld
  Put_Line("Hello World.");
  exception
    when others =>
      Put_Line("Bye Cruel World.");
end HelloWorld;
