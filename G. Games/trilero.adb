
WITH Ada.Text_IO; USE Ada.Text_IO;
WITH Ada.Numerics.Discrete_Random;
WITH Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

-- El juego del trilero se basa en encontrar bajo que copa está el guisante


PROCEDURE Trilero IS

  SUBTYPE Cups IS Integer RANGE 1..3;
  Games, Won : Integer := 0;
  Pea : Cups;
  Choice : Natural;

  PROCEDURE Instructions
    IS
    BEGIN
      Put_line( "This game is called Pick the Cup, or Thimblerig. The goal of the game" );
      Put_line( "is to try to guess under which cup the pea is hidden." ); 
      new_line(2);
      end;

  FUNCTION Whereis
	  RETURN natural IS
	  -- Ask user where is the pea (L, R, C or Q)
   	c : character;
	  BEGIN
   		LOOP
        	put_line( "Pick the cup with the pea, any cup! [] [] []" );
    	    put( "L for left, C for center, and R for right (Q to quit) and press enter: ");
         	Get(C);
         	new_line(2);
	        CASE C IS
	            WHEN 'l' | 'L' => RETURN 1;
	            WHEN 'c' | 'C' => RETURN 2;
	            WHEN 'r' | 'R' => RETURN 3;
	            WHEN 'q' | 'Q' => RETURN 0;
	            WHEN OTHERS =>
	              new_line(3);
	              put_line( "Sorry, that was not a valid input." );
	         	    END CASE;
		       END LOOP;
	        END;

  PROCEDURE Showpea(Pea : cups) IS
	  BEGIN
   	  New_Line;
   	  put( "Here is the pea ");
   	  case pea is
     	  when 1 => put_line( "[*] [] []" );
     	  when 2 => put_line( "[] [*] []" );
     	  when 3 => put_line( "[] [] [*]" );
   		  END CASE;
	    END;


   package CupNum is new Ada.Numerics.Discrete_Random(Cups);
   USE CupNum;
   
   G : Generator;
   C : Character;
   
	 BEGIN
	   reset (G);  
     -- initiaise random number generator
		 instructions;		
     -- Give user some instructions
     loop
			  choice := whereis;  
        -- Ask user where is the pea
			  exit when choice = 0;  
        -- exit game loop if user wants to quit
			  games := games + 1;
			  pea := random(G);		
        -- pea = 1, 2 or 3
		    if pea = choice then
		        put_line( "Congratulations, you won!" );
	          New_Line;
	          won := won + 1;
				  else
			      Put_Line ( "Sorry, you lost.");
			      New_Line;
			    	end if;

		    showpea(pea);		
        -- Show pea to user
		    New_Line(2);
		    Put("Pause "); Get_immediate(C);	
        -- Wait for user to hit a key
		    new_line(3);		
        -- Clear screen
			  End Loop;

	    Put( "You won " ); 
      put( won, 1 ); 
      put (" of "); 
      put( games, 1 ); 
      put_line( " games" );

		end;
