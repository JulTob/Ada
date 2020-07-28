with Lower_Layer_UDP;
with Ada.Strings.Unbounded;
with Ada.Text_IO;
with Ada.Exceptions;

procedure Server is
   package LLU renames Lower_Layer_UDP;
   package ASU renames Ada.Strings.Unbounded;

   Server_EP: LLU.End_Point_Type;
   Client_EP: LLU.End_Point_Type;
   Buffer:    aliased LLU.Buffer_Type(1024);
   Request: ASU.Unbounded_String;
   Reply: ASU.Unbounded_String := ASU.To_Unbounded_String ("¡Bienvenido!");
   Expired : Boolean;

begin

   -- construye un End_Point en una dirección y puerto concretos
   Server_EP := LLU.Build ("427.0.0.1", 6123);

   -- se ata al End_Point para poder recibir en él
   LLU.Bind (Server_EP);

   -- bucle infinito
   loop
      -- reinicializa (vacía) el buffer para ahora recibir en él
      LLU.Reset(Buffer);

      -- espera 1000.0 segundos a recibir algo dirigido al Server_EP
      --   . si llega antes, los datos recibidos van al Buffer
      --     y Expired queda a False
      --   . si pasados los 1000.0 segundos no ha llegado nada, se abandona
      --     la espera y Expired queda a True
      LLU.Receive (Server_EP, Buffer'Access, 1000.0, Expired);

      if Expired then
         Ada.Text_IO.Put_Line ("Plazo expirado, vuelvo a intentarlo");
      else
         -- saca
         Client_EP := LLU.End_Point_Type'Input (Buffer'Access);
         Request := ASU.Unbounded_String'Input (Buffer'Access);
         Ada.Text_IO.Put ("Petición: ");
         Ada.Text_IO.Put_Line (ASU.To_String(Request));

         -- reinicializa (vacía) el buffer
         LLU.Reset (Buffer);

         --  introduce el Unbounded_String en el Buffer
         ASU.Unbounded_String'Output (Buffer'Access, Reply);

         -- envía el contenido del Buffer
         LLU.Send (Client_EP, Buffer'Access);
      end if;
   end loop;

   -- nunca se alcanza este punto
   -- si se alcanzara, habría que llamar a LLU.Finalize;

exception
   when Ex:others =>
      Ada.Text_IO.Put_Line ("Excepción imprevista: " &
                            Ada.Exceptions.Exception_Name(Ex) & " en: " &
                            Ada.Exceptions.Exception_Message(Ex));
      LLU.Finalize;

end Server;
