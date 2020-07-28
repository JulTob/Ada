with Ada.Text_IO;

procedure Convert_Address_Mapping is
   type Short is range -128 .. +127;
   type Byte is mod 256;

   package T_IO renames Ada.Text_IO;
   package M_IO is new Ada.Text_IO.Modular_IO (Byte);

   A : aliased Short;
   B : aliased Byte;

   for B'Address use A'Address;

  begin
     A := -1;
     T_IO.Put ("B = ");
     M_IO.Put (Item => B, Width => 5, Base => 10);
    end Convert_Address_Mapping;
