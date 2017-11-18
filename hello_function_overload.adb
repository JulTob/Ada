with Ada.Text_IO;

procedure hello_function_overload is

  function Func
      (N: in Integer) 
    return Integer;
  function Func
      (N: in Integer; 
       M: in Integer) 
    return Integer;


  function Func(N: in Integer) return Integer 
  begin
    return N+1;
  end Func;
  
    function Func(N: in Integer; M: in Integer) return Integer 
  begin
    return N+M;
  end Func;

  package T_IO renames Ada.Text_IO;

  N:Integer:=2;
  M:Integer:=3;
  
begin --hello_function_overload
  T_IO.Put_Line(Integer'Image(N));
  N:=Func(N);
  T_IO.Put_Line(Integer'Image(N));
  T_IO.Put_Line(Integer'Image(M));
  T_IO.Put_Line(Integer'Image( Func(N,M) ));


  
end hello_function_overload;
