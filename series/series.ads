-- Series Library for Integer Sums
-- Julio Toboso
-- BearBot

package series is

  subtype Number is Positive;


  function is_Even(n: in Number) return Boolean;
  function is_Odd(n: in Number) return Boolean;

  --Series of all numbers from 1 to n
  function Sum(n: in Number) return Number;

  --Series of all numbers from "From" to "To"
  function Sum(from: in Number; To: in Number ) return Number;

  procedure Sum_Interface; --Interface

end series;
