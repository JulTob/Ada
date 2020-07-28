--  {{Ada/Sourceforge|function_overloading.adb}}

with Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

procedure Function_Overloading is
   package T_IO renames Ada.Text_IO;
   package I_IO is new Ada.Text_IO.Integer_IO (Integer);

   function Generate_Number
     (MaxValue : in Integer)
      return     Integer;

   function Generate_Number
     (MinValue : Integer;
      MaxValue : Integer)
      return     Integer;

   function Generate_Number
     (MaxValue : in Integer)
      return     Integer
   is
      subtype Random_Type is Integer range 0 .. MaxValue;
      package Random_Pack is new Ada.Numerics.Discrete_Random (
         Random_Type);

      G : Random_Pack.Generator;
   begin
      Random_Pack.Reset (G);

      return Random_Pack.Random (G);
   end Generate_Number;

   function Generate_Number
     (MinValue : Integer;
      MaxValue : Integer)
      return     Integer
   is
      subtype Random_Type is Integer range MinValue .. MaxValue;
      package Random_Pack is new Ada.Numerics.Discrete_Random (
         Random_Type);

      G : Random_Pack.Generator;
   begin
      Random_Pack.Reset (G);

      return Random_Pack.Random (G);
   end Generate_Number;

   Number_1 : constant Integer := Generate_Number (10);
   Number_2 : constant Integer := Generate_Number (6, 10);

begin
   T_IO.Put ("Number 1 is ");
   I_IO.Put (Number_1);
   T_IO.New_Line;
   T_IO.Put ("Number 1 is ");
   I_IO.Put (Number_2);
   T_IO.New_Line;
end Function_Overloading;

-----------------------------------------------------------------
--  $Log: function_overloading.adb,v $
--  Revision 2.2  2005/09/15 17:34:47  krischik
--  paranoia checkin
--
-----------------------------------------------------------------
--  vim: textwidth=0 nowrap                             :
--  vim: tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--  vim: filetype=ada encoding=latin1 fileformat=unix   :
