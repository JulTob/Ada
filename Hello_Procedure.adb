--Non working example of a procedure syntaxis


procedure Mode_Example (X : in Integer; Y : out Integer; Z : in out Integer) is
begin
X := 1; −− Error. Can’t modify an in parameter.
Y := X; −− Okay. Can read X and modify Y.
Z := Z + 1; −− Okay. Can read and write an in out parameter.
end Mode Example;
