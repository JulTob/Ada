WITH Ada.Text_IO;        -- For text input and output
WITH Ada.Integer_Text_IO; -- For handling integer input and output
USE  Ada.Text_IO, Ada.Integer_Text_IO;

-- This program calculates the day of the week for any given date
-- using Zeller's Congruence formula.

PROCEDURE Weekday IS
   -- Declare the necessary variables for day, month, year, century, and the resulting day of the week
   Day       : Integer;                     -- Day of the month
   Month     : Integer;                     -- Month of the year (1-12)
   Year      : Integer;                     -- Full year (e.g., 2024)
   Century   : Integer;                     -- Century (first two digits of Year)
   DayOfWeek : Integer range 0..6;          -- Resulting day of the week (0 = Sunday, 1 = Monday, ..., 6 = Saturday)

  BEGIN
     -- Prompt the user to input the date
     Put("Enter a date as day month year (e.g., 18 9 2024): ");
     Get(Day);   -- Read the day
     Get(Month); -- Read the month
     Get(Year);  -- Read the year
  
     -- Adjust the month and year based on the algorithm's requirement
     -- January and February are treated as the 13th and 14th months of the previous year
     IF Month < 3 THEN
        Year  := Year - 1;  -- For Jan and Feb, we subtract one year
        Month := Month + 10; -- January becomes 13, February becomes 14
     ELSE
        Month := Month - 2; -- March becomes 1, April becomes 2, ..., December becomes 10
        END IF;
  
     -- Calculate the century and the last two digits of the year
     Century := Year / 100;      -- Extract the first two digits (Century part)
     Year    := Year mod 100;    -- Extract the last two digits (Year part within the century)
  
     -- Zeller's Congruence formula to calculate the day of the week
     -- The formula gives a result between 0 and 6 where 0 = Sunday, 1 = Monday, ..., 6 = Saturday
     DayOfWeek := (((26 * Month - 2) / 10 + Day + Year + Year / 4 + Century / 4 - 2 * Century) mod 7);
  
     -- Output the result: Print the corresponding day of the week based on the calculation
     Put("That date falls on a ");
     CASE DayOfWeek IS
        WHEN 0 => Put_Line("Sunday");
        WHEN 1 => Put_Line("Monday");
        WHEN 2 => Put_Line("Tuesday");
        WHEN 3 => Put_Line("Wednesday");
        WHEN 4 => Put_Line("Thursday");
        WHEN 5 => Put_Line("Friday");
        WHEN 6 => Put_Line("Saturday");
        END CASE;
     
      END Weekday;
