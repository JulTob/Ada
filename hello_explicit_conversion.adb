procedure Hello_Explicit_Conversion is



    --Write Personalized types for transferable programs.
    type Double is new Long_Double;
    type Triple is new Long_Long_Double;
    type My_Float is digits 7; --Accuracy as needed
    
    --Or write types to prevent mistakes!
    type X_Coordinate_Type is new integer;
    type Y_Coordinate_Type is new integer;
    
    --Or write types to constrain values
    type Z_Coordinate_Type is range 0..(1024-1);  --No variables here
    
    --Or improve portability specifying size
    type Block Counter Type is range 0 .. 1 000 000 000;
    
    --Or make a cyclic type with modular types!!!!
    type Offset_Type is mod 2**8;   --0 to 2**8-1 and back. 8 bits
                                    --Also allows AND OR XOR operations
    
    
    
    
    --Or make characteristics a type with enumeration types
    type Day_Type is (Sun, Mon, Tue, Wed, Thu, Fri, Sat);
    
    --This improves the modular thinking of programming
    type State_Type is ( Initializing , Waiting, Processing, Stopping);

    --Or represent better the real world you try to model
    type Color_Type is (Red, Blue, Yellow, Green);
    
    −− These types are alternatives to Boolean’s True/False. 
    type Switch_Setting is (Off, On);
    type Control_Rod_Setting is (Down, Up);
    type System_Mode is (Sleeping, Active );
    
    
    --Or make derived types from other types
    type Light_Type is new Color_Type;
    
    
    --Set constrains to types with subtypes
    subtype Weekday_Type is Day_Type range Mon..Fri;   --is not a new type, but just a name for a constrained version of the parent type

    --Two integer subtypes are always visible!
    subtype Natural is Integer range 0 .. Integer ’ Last ; 
    subtype Positive is Integer range 1 .. Integer ’ Last ;


    --All this are discrete Types and share this properties: THE ATRIBUTES
    


    Buffer_Size=2**4;
    type Position_Type is (Starting, Finishing);
    type Buffer_Type is record
        Data: String(1..Buffer_Size);
        Position: is array Position_Type of (Integer range 1..Buffer_Size); --Beggining/Finish position
    end record;
    
declare
    C: Color_Type:= Blue;
    L: Light_Type;
    
    Buffer: Buffer_Type;
    
    I : Integer;
    F : Float;
    
    Base: X_Coordinate_Type;
    High: Y_Coordinate_Type;
    Depth:= Z_Coordinate_Type;
    
    Offset : Offset Type;
    
    Day: Day_Type;
    
begin --Hello_Explicit_Conversion

L:= Light_Type(C);    --legal
C:= Color_Type(L);   --legal
--C:=L            --ilegal

I := 1;      --legal
F := 1.0;    --legal

--I := 1.0;  --ilegal
--F := 1;    --ilegal
--F := I;    --ilegal
--I := F;    --ilegal

F := Float(I);    −− Explicit conversion: Legal
I := Integer (F); −− Explicit conversion: Legal

Base:=2;
-- High:=Base;                    --ilegal
High:= Y_Coordinate_Type(Base);   --Legal
Depth:= Z_Coordinate_Type(Base);  --Can raise error!
Depth:= 1024;                     --WILL raise an error at runtime



Offset := Offset and 16#3FF#; −− Bitwise AND with a hex mask.

 
---------  ATRIBUTES:  ----------
--First
C:= Color_Type'First;    --is Red
Day:= Day_Type'First;    --is Mon? No! It's Sun! Better assign 'First
I:= Integer'First;       --Whatever it is, is far in the negative side

--Last
C:= Color_Type'Last;    --is Green
Day:= Day_Type'Last;    --is Sun? No! It's Sat! Better assign 'Last
I:= Integer'Last;       --Pretty big guy

--Succ (Succesor)
C:= Color_Type'Succ(Red);
Day:=Day_Type'Succ(Mon);
I:= Integer'Succ(3);        --Weird? A little.

--Pred  (Predecesor)
C:= Color_Type'Pred(C);     --Go back!
Day:=Day_Type'Pred(Day);
I:= Integer'Pred(3);        --2, that's 2!

--Pos   (Position in list) 
I:=Color_Type'Pos(C);
I:=Day_Type'Pos(Day);
I:= Integer'Pos(2);        --Wait... This works?

--Val (The Value at position...)
C:= Color_Type'Val(3);
Day:=Day_Type'Val(I);
I:=Integer'Val(1);      --Again, wtf is this doing


--Control Flow: Use your types for better control of the program!

for Day2 in Sun .. Fri loop
    case Day2 in
        when Sun => null; −− etc... 
        when Mon | Tue =>null;  −− etc... 
        when Wed .. Fri => null; −− etc...
        when others => null; --Did you control all the flow?
    end case; 
end loop;



Buffer.Data(1..3):='xyz';
Buffer.Position(Starting):=1;
Buffer.Position(Finishing):=3;
Buffer:= (Data=> ('X','Y','Z',others=>' '),
          Position=>(Starting=>1,Finishing=>3);
          
          
end Hello_Explicit_Conversion;


procedure Demonstrate_Subtypes (Lower, Upper : in Day_Type;
                                Day : in out Day_Type) is
    subtype Interval is Day_Type range Lower .. Upper;   --Also, if Lower>Upper the range is 0!
                                                         --Also, SUBTYPES CAN BE DEFINED ON THE RUN!
    X : Interval := Interval’First ;
begin
    Day := X; −− No run time check. Will definitely succeed.
    X := Day; −− Run time check. Day might be out of range. ERROR!
End Demonstrate_Subtypes;


