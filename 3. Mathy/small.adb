
with Ada.Text_IO;

procedure small is

	X:Float;
	Y:Float;
	Z:Float;

begin

	Y := 15.0;
	Z := -Y + 3.5;
	X := Y+Z;
	Ada.text_IO.Put(
	        Float'Image(X) 
			& ' ' &
			Float'Image(Y)
			& ' ' &
			Float'Image(Z));
end small;
