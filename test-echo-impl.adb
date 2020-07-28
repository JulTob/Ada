--  {{Ada/Sourceforge|test-echo-impl.adb}}

with PolyORB.Log;

with Test.Echo.Skel;

--
--  The following packages are only initialized but not used otherwise.
--
pragma Warnings (Off, Test.Echo.Skel);

--
--  Test.Echo.Skel is only initialized but not used.
--
pragma Elaborate (Test.Echo.Skel);

package body Test.Echo.Impl
is
   --
   --  a Test Module to test the basic PolyORB functions
   --

--------------------------------------------------------------------------------

   --
   --  Initialize logging from confiuration file.
   --
   package Log is new  PolyORB.Log.Facility_Log ("test.echo");

--------------------------------------------------------------------------------

   --
   --  Log Message when Level is at least equal to the user-requested
   --  level for Facility.
   --
   procedure Put_Line (
      Message : in Standard.String;
      Level   : in PolyORB.Log.Log_Level := PolyORB.Log.Info)
   renames
      Log.Output;

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
      CORBA.String
   is
      pragma Unreferenced (Self);
   begin
      Put_Line (
         "Echoing string: « " &
         CORBA.To_Standard_String (Message) &
         " »");
      return Message;
   end Echo_String;

--------------------------------------------------------------------------------

end Test.Echo.Impl;

--------------------------------------------------------------------------------
--  $Log: test-echo-impl.adb,v $
--  Revision 2.2  2005/09/15 17:34:47  krischik
--  paranoia checkin
--
--------------------------------------------------------------------------------
--  vim: textwidth=0 nowrap                             :
--  vim: tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--  vim: filetype=ada encoding=latin1 fileformat=unix   :
