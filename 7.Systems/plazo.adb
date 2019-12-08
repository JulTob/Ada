with Ada.Text_IO;
with Ada.Calendar;
with Gnat.Calendar.Time_IO;


procedure Plazo is
   use type Ada.Calendar.Time;


   function Time_Image (T: Ada.Calendar.Time) return String is
   begin
      return Gnat.Calendar.Time_IO.Image(T, "%d-%b-%y %T.%i");
   end Time_Image;


   Plazo: constant Duration := 3.0;
   Intervalo: constant Duration := 0.2;
   Hora_Inicio, Hora_Fin: Ada.Calendar.Time;
   Hora_Actual, Hora_Anterior: Ada.Calendar.Time;

begin

   Hora_Inicio := Ada.Calendar.Clock;
   Hora_Fin := Hora_Inicio + Plazo;
   Hora_Anterior := Ada.Calendar.Clock;
   Hora_Actual := Ada.Calendar.Clock;

   Ada.Text_IO.Put_Line("Hora de inicio: " & Time_Image(Hora_Inicio));
   Ada.Text_IO.Put_Line("Hora de fin:    " & Time_Image(Hora_Fin));

   while Hora_Actual < Hora_Fin loop
      if Hora_Actual - Hora_Anterior > Intervalo then
         Ada.Text_IO.Put ("Hora actual:    " & Time_Image(Hora_Actual));
         Ada.Text_IO.Put_Line (", han pasado ya: " &
                                 Duration'Image(Hora_Actual - Hora_Inicio) &
                                 " segundos");
         Hora_Anterior := Hora_Actual;
      end if;
      Hora_Actual := Ada.Calendar.Clock;
   end loop;

   Ada.Text_IO.Put_Line("Saliendo:       " & Time_Image(Hora_Actual));

end Plazo;
