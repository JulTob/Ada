--  {{Ada/Sourceforge|test-meta_echo-impl.adb}}

with Test.Echo;
with PortableServer;

package Test.Meta_Echo.Impl
is
   --
   --  a Test Module to test the basic PolyORB functions
   --

--------------------------------------------------------------------------------

   --
   --  The Meta Class for the echo test.
   --
   type Object
   is new
      PortableServer.Servant_Base
   with private;

   type Object_Ptr is access Object'Class;

--------------------------------------------------------------------------------

   --
   --  Create a new instance of the echo object
   --
   function New_Echo (
      --  The Object itself
      Self : access Object)
   return
      --  newly created Echo object
      Test.Echo.Ref;

private  --  -------------------------------------------------------------------

   --
   --  The Meta Class for the echo test.
   --
   type Object
   is new
      PortableServer.Servant_Base
   with null record;

--------------------------------------------------------------------------------

end Test.Meta_Echo.Impl;

