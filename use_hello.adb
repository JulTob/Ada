with Ada.Text_IO;		--Uso de la libreria estandar de Texto In/Out
with hello_world;		--Uso de un módulo propio (WTF!)

procedure Use_Hello is
begin
    for ii in 1..10 loop	--ii es un index, declaracion implicita
	hello_world;		--Usamos un programa de OTRO MODULO! :D
    end loop;			--El fin de la estructura de control se identifica
end Use_Hello;
