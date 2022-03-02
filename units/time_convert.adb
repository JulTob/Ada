with Ada.Integer_Text_IO;
procedure Time_Convert is

   -- Conversion factors
   Seconds_Per_Minute : constant Integer := 60;
   Seconds_Per_Hour   : constant Integer := 60 * Seconds_Per_Minute;
   Seconds_Per_Day    : constant Integer := 24 * Seconds_Per_Hour;

   -- Data to convert
   Initial_Seconds : constant Integer := 106_582;

   Remaining : Integer; -- Seconds left after removing some
   Seconds   : Integer; -- Equivalent seconds
   Minutes   : Integer; -- Equivalent minutes
   Hours     : Integer; -- Equivalent hours
   Days      : Integer; -- Equivalent days

begin
   Days      := Initial_Seconds / Seconds_Per_Day;   -- Number of days
   Remaining := Initial_Seconds rem Seconds_Per_Day; -- Remaining seconds

   Hours     := Remaining / Seconds_Per_Hour;        -- Number of hours
   Remaining := Remaining rem Seconds_Per_Hour;      -- Remaining seconds

   Minutes   := Remaining / Seconds_Per_Minute;      -- Number of minutes
   Remaining := Remaining rem Seconds_Per_Minute;    -- Remaining seconds

   Seconds   := Remaining;                           -- Number of seconds

   -- Display results
   Ada.Integer_Text_IO.Put (Item  => Initial_Seconds,
                            Width => 10);
   Ada.Integer_Text_IO.Put (Item  => Days,
                            Width => 8);
   Ada.Integer_Text_IO.Put (Item  => Hours,
                            Width => 8);
   Ada.Integer_Text_IO.Put (Item  => Minutes,
                            Width => 8);
   Ada.Integer_Text_IO.Put (Item  => Seconds,
                            Width => 8);
end Time_Convert;
