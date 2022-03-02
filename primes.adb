with Ada.Text_IO;
with Ada.Integer_Text_IO;

package body Primes is

  function "&"(Left: List; Right: in Number)
    return List is
      result: List(1 .. (Left'size+1));
    begin -- &
      for n in Left'range loop
        result(n) := Left(n);
      end loop;
      result(result'last) := Right;
      return Result;
    end "&";

  procedure Put(L: List) is
       use Ada.Text_IO;
       use Ada.Integer_Text_IO;
    begin
      Put("{");
      for n in L'range loop
        Put(L(n));
        if not(n=L'last) then
          Put(",");
        end if;
      end loop;
      Put("}");
    end Put;

  function Is_Prime(n: Number) return Boolean is
  begin --is_prime
  if  Is_In_List(n, small_Primes_List) then return true; end if;
    for i in small_Primes_List'Last..(n/small_Primes_List'Last + 1) loop
      if  Is_Prime(i) and then
          (n mod i) = 0 then
        return False;
      end if;
    end loop;
    return True;
  end simple_Is_Prime;

  function Is_Prime(n: Number; L: List := small_Primes_List)
    return Boolean is
    begin --is_prime
      if is_in_List(n,L) then return true;
     return simple_Is_Prime(n);
    end Is_prime;

    function Is_In_List(n: Number; L: List) return Boolean is
    begin --is_prime
      for i in List'range loop
        if n = L(i) then
          return True;
        end if;
      end loop;
      return False;
    end Is_In_List;

    function Checked_Is_Prime(n: Number; L: List := small_Primes_List) return Boolean is
    begin --is_prime
      if Is_In_List(n,L) then return true;
      end if;

      return True;
    end simple_Is_Prime;



end Primes;
