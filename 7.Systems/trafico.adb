with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Trafico is

    	--Renames--
    	package T_IO renames Ada.Text_IO;
        package I_IO renames Ada.Integer_Text_IO;

        --Types--
    	type Tipo_Trafico is (Lento, Moderado, Correcto, Rapido, Punible);


function Clasifica (Speed: integer) return Tipo_Trafico is

  begin --Clasifica

	case Speed is
		when 0..60 =>
			return Lento;
		when 61..70 =>
			return Moderado;
		when 71..90 =>
			return Correcto;
		when 91..100 =>
			return Rapido;
		when others =>
			return Punible;
	end case;


  exception
	when constraint_error => return Punible;
  end Clasifica;

  --Variables--
  Speed: integer;
  Trafico: Tipo_Trafico;

begin --Trafico
    T_IO.Put_Line("Hey! Qué tal el trafico? A qué velocidad vas?");
    I_IO.Get(Speed);
    Trafico:=Clasifica(Speed);
    T_IO.Put_Line("Wow! Eso es tráfico " & Tipo_Trafico'Image(Trafico));




end Trafico;
