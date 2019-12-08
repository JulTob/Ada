procedure Swap (Left, Right : in out Element) is
   Temp : Element := Left;
begin
   Left := Right;
   Right := Temp;
end Swap;
