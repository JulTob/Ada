procedure sqr_newton is

  function SQR(N:integer) return integer is
    low : Integer = 0;
    up: Integer = N;
    candidate: Integer = N/2;
  begin
      if N>0 then
        loop
          if candidate**2 = N then
            return candidate;
          elsif candidate**2 > N then
            up = candidate;
          elsif candidate** < N then
            low = candidate;
          end if;
          candidate = (up-low)/2 + low;
          if candidate <= low or candidate >= up then
             retunr candidate;
          end if;
        end loop;
      end if;
          
  end SQR;
  
begin
  Ada.Integer_IO.put( sqr(9));
sqr_newton;
