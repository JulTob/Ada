with Ada.Text_IO;
with Ada.Float_Text_IO;

procedure Order is


package T_IO renames Ada.Text_IO;
package F_IO renames Ada.Float_Text_IO;

procedure OrderF(X,Y: in out Float) is
    Aux: Float;
begin -- Order
    if Y<X then
        Aux:=X;
        X:=Y;
        Y:=Aux;
    end if;
end OrderF;

    X,Y: Float;
begin -- Order
    T_IO.Put_Line("Gimme 2 numbers");
    T_IO.Put_Line("X:");
	F_IO.Get(X);
    T_IO.Put_Line("Y:");
    F_IO.Get(Y);
    OrderF(X,Y);
    F_IO.Put(X);
    T_IO.New_Line;
    F_IO.Put(Y);


end Order;
