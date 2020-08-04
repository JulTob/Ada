--  {{Ada/Sourceforge|numeric_6.adb}}

with Ada.Numerics.Generic_Elementary_Functions;

separate (Numeric_8)
function Real_Vector_Calculator return Result is
   package Str renames Ada.Strings.Unbounded;
   package T_IO renames Ada.Text_IO;
   package Exept renames Ada.Exceptions;

   procedure Pop_Value;
   procedure Push_Value;

   type Value_Array is
      array (Natural range 1 .. 8) of Value_Type;

   package F_IO is new Ada.Text_IO.Float_IO (Value_Type);

   package Value_Functions is new
      Ada.Numerics.Generic_Elementary_Functions (
      Value_Type);

   procedure Put_Line (Value : in Value_Type);

   use Value_Functions;

   Values    : Value_Array := (others => 0.0);
   Cycle     : Value_Type  := Ada.Numerics.Pi;
   Operation : Str.Unbounded_String;
   Dummy     : Natural;
   Retval    : Result;

   procedure Pop_Value is
   begin
      Values (Values'First + 1 .. Values'Last) :=
         Values (Values'First + 2 .. Values'Last) & 0.0;
   end Pop_Value;

   procedure Push_Value is
   begin
      Values (Values'First + 1 .. Values'Last) :=
         Values (Values'First .. Values'Last - 1);
   end Push_Value;

   procedure Put_Line (Value : in Value_Type) is
   begin
      if abs Value_Type'Exponent (Value) >=
         abs Value_Type'Exponent (10.0 ** F_IO.Default_Aft)
      then
         F_IO.Put
           (Item => Value,
            Fore => F_IO.Default_Aft,
            Aft  => F_IO.Default_Aft,
            Exp  => 4);
      else
         F_IO.Put
           (Item => Value,
            Fore => F_IO.Default_Aft,
            Aft  => F_IO.Default_Aft,
            Exp  => 0);
      end if;
      T_IO.New_Line;

      return;
   end Put_Line;

begin
   Main_Loop : loop
      Try : begin
         Display_Loop : for I in reverse  Value_Array'Range loop
            Put_Line (Values (I));
         end loop Display_Loop;
         T_IO.Put (">");
         Operation := Get_Line;

         if Operation = "+" then
            --  addition
            Values (1) := Values (1) + Values (2);
            Pop_Value;
         elsif Operation = "-" then
            --  subtraction
            Values (1) := Values (1) + Values (2);
            Pop_Value;
         elsif Operation = "*" then
            --  multiplication
            Values (1) := Values (1) * Values (2);
            Pop_Value;
         elsif Operation = "/" then
            --  division
            Values (1) := Values (1) / Values (2);
            Pop_Value;
         elsif Operation = "e" then
            --  insert e
            Push_Value;
            Values (1) := Ada.Numerics.e;
         elsif Operation = "**" or else Operation = "^" then
            --  power of x^y
            Values (1) := Values (1) ** Values (2);
            Pop_Value;
         elsif Operation = "sqr" then
            --  square root
            Values (1) := Sqrt (Values (1));
         elsif Operation = "root" then
            --  arbritary root
            Values (1) :=
               Exp (Log (Values (2)) / Values (1));
            Pop_Value;
         elsif Operation = "ln" then
            --  natural logarithm
            Values (1) := Log (Values (1));
         elsif Operation = "log" then
            --  based logarithm
            Values (1) :=
               Log (Base => Values (1), X => Values (2));
            Pop_Value;
         elsif Operation = "deg" then
            --  switch to degrees
            Cycle := 360.0;
         elsif Operation = "rad" then
            --  switch to degrees
            Cycle := Ada.Numerics.Pi;
         elsif Operation = "grad" then
            --  switch to degrees
            Cycle := 400.0;
         elsif Operation = "pi" then
            --  insert pi
            Push_Value;
            Values (1) := Ada.Numerics.Pi;
         elsif Operation = "sin" then
            --  sinus
            Values (1) :=
               Sin (X => Values (1), Cycle => Cycle);
         elsif Operation = "cos" then
            --  cosinus
            Values (1) :=
               Cot (X => Values (1), Cycle => Cycle);
         elsif Operation = "tan" then
            --  tangents
            Values (1) :=
               Tan (X => Values (1), Cycle => Cycle);
         elsif Operation = "cot" then
            --  cotanents
            Values (1) :=
               Cot (X => Values (1), Cycle => Cycle);
         elsif Operation = "asin" then
            --  arc-sinus
            Values (1) :=
               Arcsin (X => Values (1), Cycle => Cycle);
         elsif Operation = "acos" then
            --  arc-cosinus
            Values (1) :=
               Arccos (X => Values (1), Cycle => Cycle);
         elsif Operation = "atan" then
            --  arc-tangents
            Values (1) :=
               Arctan (Y => Values (1), Cycle => Cycle);
         elsif Operation = "acot" then
            --  arc-cotanents
            Values (1) :=
               Arccot (X => Values (1), Cycle => Cycle);
         elsif Operation = "sinh" then
            --  sinus hyperbolic
            Values (1) := Sinh (Values (1));
         elsif Operation = "cosh" then
            --  cosinus hyperbolic
            Values (1) := Coth (Values (1));
         elsif Operation = "tanh" then
            --  tangents hyperbolic
            Values (1) := Tanh (Values (1));
         elsif Operation = "coth" then
            --  cotanents hyperbolic
            Values (1) := Coth (Values (1));
         elsif Operation = "asinh" then
            --  arc-sinus hyperbolic
            Values (1) := Arcsinh (Values (1));
         elsif Operation = "acosh" then
            --  arc-cosinus hyperbolic
            Values (1) := Arccosh (Values (1));
         elsif Operation = "atanh" then
            --  arc-tangents hyperbolic
            Values (1) := Arctanh (Values (1));
         elsif Operation = "acoth" then
            --  arc-cotanents hyperbolic
            Values (1) := Arccoth (Values (1));
         elsif Operation = "exit" then
            Retval := Exit_Calculator;
            exit Main_Loop;
         elsif Operation = "real" then
            Retval := Start_Real;
            exit Main_Loop;
         elsif Operation = "complex" then
            Retval := Start_Complex;
            exit Main_Loop;
         else
            Push_Value;
            F_IO.Get
              (From => Str.To_String (Operation),
               Item => Values (1),
               Last => Dummy);
         end if;
      exception
         when An_Exception : others =>
            T_IO.Put_Line
              (Exept.Exception_Information (An_Exception));
      end Try;
   end loop Main_Loop;

   return Retval;
end Real_Calculator;

--  vim: tabstop=8 softtabstop=3 shiftwidth=3 expandtab     :
--  vim: filetype=ada encoding=utf8                         :
