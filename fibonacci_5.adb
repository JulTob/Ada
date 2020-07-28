--  {{Ada/Sourceforge|fibonacci_2.adb}}

with Ada.Text_IO;
with Ada.Command_Line;

procedure Fibonacci_4 is

   type Cache_Type is range -1 .. 999_999_999_999_999_999;
   subtype Integer_Type is Cache_Type range
      0 .. Cache_Type'Last;

   package CL renames Ada.Command_Line;
   package T_IO renames Ada.Text_IO;
   package I_IO is new Ada.Text_IO.Integer_IO (Integer_Type);

   function Fib (N : Integer_Type) return Integer_Type;

   Value : constant Integer_Type :=
      Integer_Type'Value (CL.Argument (1));

   type Cache_Array is
      array (Integer_Type range 0 .. Value) of Cache_Type;

   protected Cache is

      function Get (N : Integer_Type) return Cache_Type;

      procedure Set (N : in Integer_Type; F : in Cache_Type);

   private

      Data : Cache_Array :=
         (0     => 0,
         1      => 1,
         others => Cache_Type'First);
   end Cache;

   task type Calculator
         (
         N      : Integer_Type;
         Result : access Integer_Type);

   protected body Cache is

      function Get (N : Integer_Type) return Cache_Type is
      begin
         return Data (N);
      end Get;

      procedure Set (N : in Integer_Type; F : in Cache_Type) is
      begin
         Data (N) := F;
      end Set;

   end Cache;

   task body Calculator is
   begin
      Result.all := Fib (N);
   end Calculator;

   function Fib (N : Integer_Type) return Integer_Type is
   begin
      if Cache.Get (N) /= Cache_Type'First then
         return Cache.Get (N);
      else
         Calculate : declare
            N1 : aliased Integer_Type;
            N2 : aliased Integer_Type;
         begin
            Call_Tasks : declare
               T1 : Calculator (N - 1, N1'Access);
               T2 : Calculator (N - 2, N2'Access);
            begin
               null; --  just wait for the tasks end
            end Call_Tasks;
            Cache.Set (N, N1 + N2);
         end Calculate;
         return Cache.Get (N);
      end if;
   end Fib;

begin
   T_IO.Put ("The Fibonacci of ");
   I_IO.Put
     (Item  => Value,
      Width => 3,
      Base  => I_IO.Default_Base);
   T_IO.Put (" is ");
   I_IO.Put
     (Item  => Fib (Value),
      Width => I_IO.Default_Width,
      Base  => I_IO.Default_Base);

   return;
end Fibonacci_4;

--------------------------------------------------------------------------------
--  $Log: fibonacci_5.adb,v $
--  Revision 2.2  2005/09/15 17:34:47  krischik
--  paranoia checkin
--
--------------------------------------------------------------------------------
--  vim: textwidth=0 nowrap                             :
--  vim: tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--  vim: filetype=ada encoding=latin1 fileformat=unix   :
