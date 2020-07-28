--  {{Ada/Sourceforge|test-echo-impl.adb}}

with CORBA;
with PortableServer;

package Test.Echo.Impl
is

--------------------------------------------------------------------------------

   --
   --  A simple CORBA Test class which just echos the a string.
   --
   type Object
   is new
      PortableServer.Servant_Base
   with private;

   type Object_Ptr is access Object'Class;

--------------------------------------------------------------------------------

   --
   --  Echo the given string back to the client.
   --
   function Echo_String (
      --  The Object itself
      Self : access Object;
      --  The string which should be echoed.
      Message : in CORBA.String)
   return
      --  The returned string - which is the same as Message
      CORBA.String;

private  --  -------------------------------------------------------------------

   --
   --  A simple CORBA Test class which just echos the a string.
   --
   type Object
   is new
       PortableServer.Servant_Base
   with null record;

--------------------------------------------------------------------------------

end Test.Echo.Impl;
