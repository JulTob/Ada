--  {{Ada/Sourceforge|attributes_size.adb}}

with Ada.Text_IO;

procedure Attributes_Size is

   package T_IO renames Ada.Text_IO;
   package I_IO is new Ada.Text_IO.Integer_IO (Integer);

   B : constant Boolean := True;

begin
   T_IO.Put ("Size of Boolean Type   = ");   --  An enumeration
                                             --  with
   I_IO.Put (Boolean'Size);                  --  2 values
                                             --  fitsinto
   T_IO.New_Line;                            --  1 bit.

   T_IO.Put ("Size of Boolean Object = ");   --  However it is
                                             --  more
   I_IO.Put (B'Size);                        --  efficient to
                                             --  store a
   T_IO.New_Line;                            --  boolean as an
                                             --  entire byte
   return;
end Attributes_Size;

-----------------------------------------------------------------
--  $Log: attributes_size.adb,v $
--  Revision 2.2  2005/09/15 17:34:47  krischik
--  paranoia checkin
--
-----------------------------------------------------------------
--  vim: textwidth=0 nowrap                             :
--  vim: tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--  vim: filetype=ada encoding=latin1 fileformat=unix   :
