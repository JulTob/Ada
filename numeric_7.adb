--  {{Ada/Sourceforge|numeric_7.adb}}

with Ada.Text_IO.Complex_IO;
with Ada.Numerics.Generic_Complex_Types;
with Ada.Numerics.Generic_Complex_Elementary_Functions;
with Ada.Strings.Unbounded;
with Ada.Exceptions;

procedure Numeric_7 is
   package Str renames Ada.Strings.Unbounded;
   package T_IO renames Ada.Text_IO;
   package Exept renames Ada.Exceptions;

   procedure Pop_Value;
   procedure Push_Value;
   function Get_Line return Str.Unbounded_String;

   type Value_Type is digits 12 range
      -999_999_999_999.0e999 .. 999_999_999_999.0e999;

   package Complex_Types is new
      Ada.Numerics.Generic_Complex_Types (
      Value_Type);
   package Complex_Functions is new
      Ada.Numerics.Generic_Complex_Elementary_Functions (
      Complex_Types);
   package C_IO is new Ada.Text_IO.Complex_IO (Complex_Types);

   type Value_Array is
      array (Natural range 1 .. 4) of Complex_Types.Complex;

   procedure Put_Line (Value : in Complex_Types.Complex);

   use type Complex_Types.Complex;
   use type Str.Unbounded_String;
   use Complex_Functions;

   Values    : Value_Array :=
      (others => Complex_Types.Complex'(Re => 0.0, Im => 0.0));
   Operation : Str.Unbounded_String;
   Dummy     : Natural;

   function Get_Line return Str.Unbounded_String is
      BufferSize : constant Natural     := 2000;
      Retval     : Str.Unbounded_String :=
         Str.Null_Unbounded_String;
      Item       : String (1 .. BufferSize);
      Last       : Natural;
   begin
      Get_Whole_Line : loop
         T_IO.Get_Line (Item => Item, Last => Last);

         Str.Append
           (Source   => Retval,
            New_Item => Item (1 .. Last));

         exit Get_Whole_Line when Last < Item'Last;
      end loop Get_Whole_Line;

      return Retval;
   end Get_Line;

   procedure Pop_Value is
   begin
      Values (Values'First + 1 .. Values'Last) :=
         Values (Values'First + 2 .. Values'Last) &
         Complex_Types.Complex'(Re => 0.0, Im => 0.0);
   end Pop_Value;

   procedure Push_Value is
   begin
      Values (Values'First + 1 .. Values'Last) :=
         Values (Values'First .. Values'Last - 1);
   end Push_Value;

   procedure Put_Line (Value : in Complex_Types.Complex) is
   begin
      if (abs Value_Type'Exponent (Value.Re) >=
          abs Value_Type'Exponent (10.0 ** C_IO.Default_Aft))
        or else (abs Value_Type'Exponent (Value.Im) >=
                 abs Value_Type'Exponent
                       (10.0 ** C_IO.Default_Aft))
      then
         C_IO.Put
           (Item => Value,
            Fore => C_IO.Default_Aft,
            Aft  => C_IO.Default_Aft,
            Exp  => 4);
      else
         C_IO.Put
           (Item => Value,
            Fore => C_IO.Default_Aft,
            Aft  => C_IO.Default_Aft,
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
            Values (1) := Values (2) + Values (1);
            Pop_Value;
         elsif Operation = "-" then
            --  subtraction
            Values (1) := Values (2) - Values (1);
            Pop_Value;
         elsif Operation = "*" then
            --  multiplication
            Values (1) := Values (2) * Values (1);
            Pop_Value;
         elsif Operation = "/" then
            --  division
            Values (1) := Values (2) / Values (1);
            Pop_Value;
         elsif Operation = "e" then
            --  insert e
            Push_Value;
            Values (1) :=
               Complex_Types.Complex'
               (Re=> Ada.Numerics.e,
               Im => 0.0);
         elsif Operation = "**" or else Operation = "^" then
            --  power of x^y
            Values (1) := Values (2) ** Values (2);
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
         elsif Operation = "pi" then
            --  insert pi
            Push_Value;
            Values (1) :=
               Complex_Types.Complex'
               (Re=> Ada.Numerics.Pi,
               Im => 0.0);
         elsif Operation = "sin" then
            --  sinus
            Values (1) := Sin (Values (1));
         elsif Operation = "cos" then
            --  cosinus
            Values (1) := Cot (Values (1));
         elsif Operation = "tan" then
            --  tangents
            Values (1) := Tan (Values (1));
         elsif Operation = "cot" then
            --  cotanents
            Values (1) := Cot (Values (1));
         elsif Operation = "asin" then
            --  arc-sinus
            Values (1) := Arcsin (Values (1));
         elsif Operation = "acos" then
            --  arc-cosinus
            Values (1) := Arccos (Values (1));
         elsif Operation = "atan" then
            --  arc-tangents
            Values (1) := Arctan (Values (1));
         elsif Operation = "acot" then
            --  arc-cotanents
            Values (1) := Arccot (Values (1));
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
            exit Main_Loop;
         else
            Push_Value;
            C_IO.Get
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

   return;
end Numeric_7;

-----------------------------------------------------------------
--  $Log: numeric_7.adb,v $
--  Revision 2.2  2005/09/15 17:34:47  krischik
--  paranoia checkin
--
-----------------------------------------------------------------
--  vim: textwidth=0 nowrap                             :
--  vim: tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--  vim: filetype=ada encoding=latin1 fileformat=unix   :
