with Ada.Text_IO;
with Ada.Unchecked_Deallocation;

package body Ordered_Maps_G is
   
   procedure Free is new Ada.Unchecked_Deallocation (Tree_Node, Map);

   procedure Get (M       : Map;
                  Key     : in  Key_Type;
                  Value   : out Value_Type;
                  Success : out Boolean) is
   begin

      If M = null then
         Success := False;
      elsif M.Key = Key then
         Value := M.Value;
         Success := True;
      elsif Key > M.Key then
         Get (M.Right, Key, Value, Success);
      else
         Get (M.Left, Key, Value, Success);
      end if;
   end Get;




   procedure Put (M     : in out Map;
                  Key   : Key_Type;
                  Value : Value_Type) is
   begin
      if M = null then
         M := new Tree_Node'(Key, Value, null, null);
      else
         if Key = M.Key then
            M.Value := Value;
         elsif Key < M.Key then
            Put (M.Left, Key, Value);
         elsif Key > M.Key then
            Put (M.Right, Key, Value);
         end if;
      end if;
   end Put;


   function Min (M : Map) return Map is
   begin

      if M.Left = null then
         return M;
      else
         return Min (M.Left);
      end if;

   end Min;


   function Delete_Min (M : Map)  return Map  is
      P_Aux: Map;
      P : Map;
   begin

      P_Aux := M;

      if P_Aux = null then
         return null;
      end if;

      if P_Aux.Left = null then
         P := P_Aux.Right;
         Free(P_Aux);
         return P;
      else
         P_Aux.Left := Delete_Min (P_Aux.Left);
         return P_Aux;
      end if;

   end Delete_Min;


   procedure Delete (M       : in out Map;
                     Key     : in  Key_Type;
                     Success : out Boolean) is
      Min : Map;
      P_Aux : Map;
      P_Free : Map;
   begin
      Success := True;

      if M = null then
         Success := False;
         return;
      end if;

      if Key < M.Key and then M.Left /= null Then
         Delete (M.Left, Key, Success);
         return;
      end if;

      if Key > M.Key and then M.Right /= null then
         Delete (M.Right, Key, Success);
         return;
      end if;


      if M.Key = Key then
         if M.Left = null then
            P_Aux := M.Right;
            P_Free := M;
            Free(P_Free);
            M := P_Aux;
         elsif M.Right = null then
            P_Aux := M.Left;
            P_Free := M;
            Free(P_Free);
            M := P_Aux;
         else
            Min := Ordered_Maps_G.Min (M.Right);
            if Min /= null then
               M.Key := Min.key;
               M.Value := Min.Value;
            end if;
            M.Right := Delete_Min (M.Right);
         end if;
      end if;
   end Delete;


   function Map_Length (M : Map) return Natural is
   begin
      if M /= null then
         return 1 + Map_Length (M.Left) + Map_Length (M.Right);
      else
         return 0;
      end if;
   end Map_Length;


   procedure Print_Tree (M : Map) is
   begin
      if M /= null then
         if M.Left /= null then
            Print_Tree (M.Left);
         end if;

         Ada.Text_IO.Put_Line ("(" &
                                 Key_To_String(M.Key) & ", " &
                                 Value_To_String(M.Value) & ")");


         if M.Right /= null then
            Print_Tree (M.Right);
         end if;
      end if;
   end Print_Tree;

   procedure Print_Map (M : Map) is
   begin
      Print_Tree (M);
   end Print_Map;






end Ordered_Maps_G;
