with Ada.Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Float_Text_IO;

procedure ReadFile is

   Float_File : File_Type;
   Float_Datum  : Float;

begin

   Open( 
      Float_File, 
      In_File, 
      "FLOAT_DATA.TXT"
    );

   while not End_Of_File(Float_File) loop
      if End_Of_Line(Float_File) then
         New_Line;
         Skip_Line(Float_File);
      else
         Get( 
            Float_File, 
            Float_Datum 
          );
         Put( 
            "The value read in is"  );
         Put( 
              Float_Datum
         );
         
         New_Line;
         
      end if;
   end loop;

   Close( Float_File );

end ReadFile;

