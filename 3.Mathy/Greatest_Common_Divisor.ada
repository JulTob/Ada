with  Ada.Integer_IO;

procedure Greatest_Common_Divisor is

   function Greatest_Common_Divisor(X : Natural; Y : Natural) return Natural is
      Remainder : Natural;
      A         : Natural;
      B         : Natural;
   begin
      A := X;
      B := Y;

      while B > 0 loop
         pragma Loop_Invariant(A >= 0 and B > 0);
         Remainder := A rem B;
         A := B;
         B := Remainder;
      end loop;
      return A;
   end Greatest_Common_Divisor;
   
   
begin
  
  Ada.Integer_IO.put( Greatest_Common_Divisor(12,6);

end Greatest_Common_Divisor;
