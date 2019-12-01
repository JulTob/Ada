with Ada.Text_IO;	                               
with Ada.Float_Text_IO;	                         
with Ada.Numerics.Generic_Elementary_Functions;	
			                       
procedure  Circle_Area  is	                  
   Pi  : Float := Ada.Numerics.Pi;	        --  Pi is predefined in Ada.Numerics	
   Radius : Float := 12.0;	--  Change here to calculate with different areas
   Area   : Float := 0.0;     	--  Reccomended, but not mandatory, to initialize variables
begin				--  Begins the algorithm here and follows sequentially (unless...)
   Area := Pi* Radius ** 2;	        
   Ada.Float_Text_Io.Put(Area);    --  Dot notation for elements on a set, in this case a function
   
end Circle_Area;
