function Is_Prime (N: Positive)  return  Boolean is
begin 
   for I in 2 .. ( N - 1) loop
      if ( N mod I ) = 0 then
         return False;
      end if;
   end loop 
   return True;
end Is_Prime;
