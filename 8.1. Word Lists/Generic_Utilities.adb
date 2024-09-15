-- Generic_Utilities.adb
-- Implementation of the Generic_Utilities package procedures and functions

with Ada.Text_IO;
with Ada.Float_Text_IO;
with Numerics; -- For Pi constant

package body Generic_Utilities is

   -- Display attributes of a floating-point number
   procedure Display_Attributes (Float_Name : in String; Data : in Float_Type) is
   begin
      Ada.Text_IO.Put_Line(Float_Name & " = " & Float_Type'Image(Data));
   end Display_Attributes;

   -- Swap two items
   procedure Swap (Left, Right : in out Item) is
      Temp : Item;
   begin
      Temp := Left;
      Left := Right;
      Right := Temp;
   end Swap;

   -- Bubble sort implementation
   procedure Bubble_Sort(In_Data : in Data_Set; Out_Data : out Data_Set) is
   begin
      -- Bubble sort logic here, simplified for readability
      Out_Data := In_Data;
      for I in Out_Data'Range loop
         for J in I + 1 .. Out_Data'Last loop
            if Out_Data(J) > Out_Data(I) then
               Swap(Out_Data(J), Out_Data(I));
            end if;
         end loop;
      end loop;
   end Bubble_Sort;

   -- Get the next item in an enumerated type or integer set
   function Next(The_Data : in Item) return Item is
   begin
      if The_Data = Item'Last then
         return Item'First;
      else
         return Item'Succ(The_Data);
      end if;
   end Next;

   -- Get the previous item in an enumerated type or integer set
   function Prev(The_Data : in Item) return Item is
   begin
      if The_Data = Item'First then
         return Item'Last;
      else
         return Item'Pred(The_Data);
      end if;
   end Prev;

   -- Display a 2D array on the console
   procedure Display_2D_Array_On_Console(The_Array : in TwoD_Array_Type) is
   begin
      for I in The_Array'Range(1) loop
         for J in The_Array'Range(2) loop
            Ada.Text_IO.Put(Item'Image(The_Array(I, J)) & " ");
         end loop;
         Ada.Text_IO.New_Line;
      end loop;
   end Display_2D_Array_On_Console;

   -- Apply a method to modify each item in a dataset
   procedure Modify_By_Method(The_Data : in out Data_Set) is
      I : Index := The_Data'First;
   begin
      while I /= The_Data'Last loop
         Method(The_Data(I));
         I := Index'Succ(I);
      end loop;
   end Modify_By_Method;

   -- Convert radians to degrees
   function To_Degrees(R : in Radian) return Degree is
      Result : Degree := Degree(180.0 * R) / Numerics.Pi;
   begin
      return Result;
   end To_Degrees;

   -- Convert degrees to radians
   function To_Radians(D : in Degree) return Radian is
      Work_1 : Long_Float := (Numerics.Pi * Long_Float(D)) / 180.0;
      Result : Radian := Radian(Work_1);
   begin
      return Result;
   end To_Radians;

end Generic_Utilities;
