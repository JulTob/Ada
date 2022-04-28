

package body Trafico is

 
function Clasifica (Speed: integer range 0..120) return Tipo_Trafico is
	
  begin --Clasifica

	case Speed is
		when 0..50 =>
			return Lento;
		when 51..70 =>
			return Moderado;
		when 71..90 =>
			return Correcto;
		when 91..120 =>
			return Rapido;	
		when others =>
			return Punible;
	end case;
		

  exception
	when constraint_error => return Punible;
  end Clasifica;

end Trafico;


