--Non working example of a procedure syntaxis


procedure Mode_Example (X : in Integer:=0;    --Read only parameter with default value
                        Y : out Integer;      --Write only var 
                        Z : in out Integer) is
begin
X := 1; −− Error. Can’t modify an in parameter.
Y := X; −− Okay. Can read X and modify Y.
Z := Z + 1; −− Okay. Can read and write an in out parameter.
end Mode_Example;




--Named association:

Mode_Example(Z => Accumulator, X => N+15, Y => Output);
