procedure Hello_Explicit_Conversion is

    type Colour is (Red, Blue, Green);
    type Light is new Colour;

    --Write Personalized types for transferable programs.
    type Double is new Long_Double;
    type Triple is new Long_Long_Double;
    type My_Float is digits 7; --Accuracy as needed

    Buffer_Size=2**4;
    type Position_Type is (Starting, Finishing);
    type Buffer_Type is record
        Data: String(1..Buffer_Size);
        Position: is array Position_Type of (Integer range 1..Buffer_Size); --Beggining/Finish position
    end record;
    
declare
    C: Colour:= Blue;
    L: Light;
    Buffer: Buffer_Type;
begin --Hello_Explicit_Conversion
L:= Light(C);    --legal
C:= Colour(L);   --legal
--C:=L            --ilegal
Buffer.Data(1..3):='xyz';
Buffer.Position(Starting):=1;
Buffer.Position(Finishing):=3;
Buffer:= (Data=> ('X','Y','Z',others=>' '),
          Position=>(Starting=>1,Finishing=>3);
end Hello_Explicit_Conversion;
