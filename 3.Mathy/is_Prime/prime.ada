With Ada.TextIO;
Use Ada.TextIO;

With Ada.IntegerTextIO ;
Use Ada.IntegerTextIO ;

procedure Prime is 
  Number : Integer ;
begin
  Put(”Enter an integer : ” );
  Get(Number);
  if Number<2 then
    Put(”The value ”);
    Put(Number, 0); 
    PutLine(” is bad.” );
  else
    Put(”The value ”); 
    Put(Number, 0);
  	for I in 2..(Number−1) loop
    	if Number rem I = 0 then
      	PutLine(” is not prime.” );
      	return;
    	end if;
  	end loop;
		PutLine(” is prime.” );
	end if;
endPrime;
