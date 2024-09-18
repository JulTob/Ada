WITH Text_Io;  -- For standard text input/output
USE Text_Io;

PROCEDURE UsingSpices IS
   -- Define an enumeration type for different spices
   TYPE Spices IS (Basil, Cayenne, Coriander, Rosemary);
   
   -- Create an I/O package for the Spices enumeration
   PACKAGE Spice_Io IS NEW Enumeration_Io(Spices); 
   USE Spice_Io;

   BEGIN
     -- Print the list of all spices
     Put_Line("My spices are:");
     
     -- Loop through all values of the Spices enumeration
     FOR I IN Spices'RANGE LOOP  -- 'RANGE returns all values of the enum
        Put(I);  -- Print each spice name
        Put("  ");  -- Add a space between the spices
       END LOOP;
     
     New_Line(2);  -- Insert two new lines for better readability
  
     -- Print uses for each spice
     Put_Line("Here are some uses for my spices.");
     
     FOR I IN Spices'RANGE LOOP
        Put(I); Put(" is ");
        CASE I IS
           WHEN Basil => Put_Line("great in pesto");
           WHEN Cayenne => Put_Line("hot and spicy, works well with meat");
           WHEN Coriander => Put_Line("excellent in soups");
           WHEN Rosemary => Put_Line("a subtle taste in sauces");
          END CASE;
       END LOOP;
    END UsingSpices;
