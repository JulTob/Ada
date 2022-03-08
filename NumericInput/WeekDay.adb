WITH Ada.Text_IO, Ada.Integer_Text_IO;
USE  Ada.Text_IO, Ada.Integer_Text_IO;
PROCEDURE Weekday IS
   TYPE DayOfWeekT IS (Sunday, Monday, Tuesday, Wednesday, Thursday,
                       Friday, Saturday);
   Day       : Integer;
   Month     : Integer;
   Year      : Integer;
   Century   : Integer;
   DayOfWeek : DayOfWeekT;
BEGIN
   Put ("Enter a date as day month year: ");
   Get (Day);
   Get (Month);
   Get (Year);
   IF Month < 3 THEN
      Year  := Year - 1;
      Month := Month + 10;
   ELSE
      Month := Month - 2;
   END IF;
   Century := Year / 100;        -- first two digits of Year
   Year    := Year mod 100;      -- last two digits of Year
   DayOfWeek := DayofWeekT'Val((((26*Month - 2)/10 + Day + Year + Year/4
         + Century/4 - 2*Century) mod 7));
   Put("That date is a ");
   put_line(DayOfWeekT'image(dayofweek));
END Weekday;
