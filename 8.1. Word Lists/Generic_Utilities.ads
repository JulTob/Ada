-- Generic_Utilities.ads
-- A generic utilities package offering a variety of procedures for sorting, swapping,
-- array display, and conversions between degrees and radians.

package Generic_Utilities is

   -- Display attributes of a floating-point number
   generic
      type Float_Type is digits <>;
      procedure Display_Attributes (Float_Name : in String; Data : in Float_Type);

   -- Swap two items of any type
   generic
      type Item is private;
      procedure Swap (Left, Right : in out Item);

   -- Bubble sort for an array of items
   generic
      type Item is private;
      type Index is (<>);          -- Index is an enumerated type or integer
      type Data_Set is array(Index range <>) of Item;  -- An unconstrained array of items
      with function ">" (Left, Right : Item) return Boolean;  -- Comparison function for sorting
      procedure Bubble_Sort(In_Data : in Data_Set; Out_Data : out Data_Set);

   -- Get the next item in an enumerated type or integer set
   generic
      type Item is (<>);
      function Next(The_Data : in Item) return Item;

   -- Get the previous item in an enumerated type or integer set
   generic
      type Item is (<>);
      function Prev(The_Data : in Item) return Item;

   -- Display a 2D array on the console
   generic
      type Item is private;
      type Index_1 is (<>);
      type Index_2 is (<>);
      type TwoD_Array_Type is array(Index_1 range <>, Index_2 range <>) of Item;
      procedure Display_2D_Array_On_Console(The_Array : in TwoD_Array_Type);

   -- Apply a method to modify each item in a dataset
   generic
      type Item is private;
      type Index is (<>);
      type Data_Set is array(Index range <>) of Item;
      with procedure Method (Data : in out Item);
      procedure Modify_By_Method(The_Data : in out Data_Set);

   -- Convert radians to degrees
   generic
      type Degree is digits <>;
      type Radian is digits <>;
      function To_Degrees(R : in Radian) return Degree;

   -- Convert degrees to radians
   generic
      type Degree is digits <>;
      type Radian is digits <>;
      function To_Radians(D : in Degree) return Radian;

   end Generic_Utilities;
