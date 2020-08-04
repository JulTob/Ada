--   {{Ada/Sourceforge|numeric_5.adb}}

with Ada.Text_IO;
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Strings.Unbounded;

procedure Numeric_5 is
   package Str renames Ada.Strings.Unbounded;
   package T_IO renames Ada.Text_IO;

   procedure Pop_Value;
   procedure Push_Value;
   function Get_Line return Str.Unbounded_String;

   type Value_Type is digits 12 range
      -999_999_999_999.0e999 .. 999_999_999_999.0e999;

   type Value_Array is
      array (Natural range 1 .. 4) of Value_Type;

   package F_IO is new Ada.Text_IO.Float_IO (Value_Type);

   package Value_Functions is new
      Ada.Numerics.Generic_Elementary_Functions (
      Value_Type);

   procedure Put_Line (Value : in Value_Type);

   use Value_Functions;
   use type Str.Unbounded_String;

   Values    : Value_Array := (others => 0.0);
   Cycle     : Value_Type  := Ada.Numerics.Pi;
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
         Values (1) := Ada.Numerics.e;
      elsif Operation = "**" or else Operation = "^" then
         --  power of x^y
         Values (1) := Values (2) ** Values (1);
         Pop_Value;
      elsif Operation = "sqr" then
         --  square root
         Values (1) := Sqrt (Values (1));
      elsif Operation = "root" then
         --  arbritary root
         Values (1) := Exp (Log (Values (2)) / Values (1));
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
         Values (1) := Sin (X => Values (1), Cycle => Cycle);
      elsif Operation = "cos" then
         --  cosinus
         Values (1) := Cot (X => Values (1), Cycle => Cycle);
      elsif Operation = "tan" then
         --  tangents
         Values (1) := Tan (X => Values (1), Cycle => Cycle);
      elsif Operation = "cot" then
         --  cotanents
         Values (1) := Cot (X => Values (1), Cycle => Cycle);
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
      elsif Operation = "exit" then
         exit Main_Loop;
      else
         Push_Value;
         F_IO.Get
           (From => Str.To_String (Operation),
            Item => Values (1),
            Last => Dummy);
      end if;
   end loop Main_Loop;

   return;
end Numeric_5;

-----------------------------------------------------------------
--  $Log: numeric_5.adb,v $
--  Revision 2.2  2005/09/15 17:34:47  krischik
--  paranoia checkin
--
-----------------------------------------------------------------
--  vim: textwidth=0 nowrap                             :
--  vim: tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--  vim: filetype=ada encoding=latin1 fileformat=unix   :
