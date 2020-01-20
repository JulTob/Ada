with Ada.Text_IO;
use Ada.Text_IO;

with Angles;

procedure Sum is
  use Angles;
  --type Angle is new Degree;

  A : Radian := Radian(Tau-1.0);
  B : Degree := Degree( 180);
begin
  A := A + To_Radian(10.0 => N);
  Put(A);
  Put( Radian'Delta );
  Put( Radian'First );
  Put( Radian'Last );
  New_Line;

  B:= B+190;
  Put(B);

  Put(A+90);

end Sum;
