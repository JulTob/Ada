procedure Hello_Vectors is

  --You can declare vectors with any type you have made
  type Day_Type is (Sun, Mon, Tue, Wed, Thu, Fri, Sat)
  Work_Hors: array(Day_Type) of Natural;
  
begin
  Work_Hours:= (0,8,8,8,8,8,0)
  
  Work_Hours:= (Sat=>0, Sun=>0, others=>8);
  for Day in Mon..Fri loop
    Work_Hours(Day):=8;
  end loop;



end Hello_Vectors;
