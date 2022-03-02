package Primes is

    subtype Number is Natural;
    type List is array (Natural range <>) of Number;
    function "&"(Left: List; Right: Number) return List;
    procedure Put(L : List);
    small_Primes_List: List := (2,3,5,7,13,17);
    function Is_Prime(n: Number) return Boolean;
end Primes;
