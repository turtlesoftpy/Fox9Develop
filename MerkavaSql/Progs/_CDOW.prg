LPARAMETERS tdFecha

* inicio { validaci�n de par�metro }
IF PARAMETERS() < 1 THEN
   MESSAGEBOX('Muy pocos argumentos.', 0+16, '_CDOW()')
   RETURN .F.
ENDIF

IF VARTYPE(tdFecha) <> 'D' THEN
   MESSAGEBOX([El par�metro 'tdFecha' deben ser de tipo fecha.], 0+16, '_CDOW()')
   RETURN .F.
ENDIF

IF EMPTY(tdFecha) THEN
   MESSAGEBOX([El par�metro 'tdFecha'  no debe estar vac�o.], 0+16, '_CDOW()')
   RETURN .F.
ENDIF
* fin { validaci�n de par�metro }

LOCAL lcRetorno
lcRetorno = ''

DO CASE
CASE DOW(tdFecha) = 1
   lcRetorno = 'Domingo'
CASE DOW(tdFecha) = 2
   lcRetorno = 'Lunes'
CASE DOW(tdFecha) = 3
   lcRetorno = 'Martes'
CASE DOW(tdFecha) = 4
   lcRetorno = 'Mi�rcoles'
CASE DOW(tdFecha) = 5
   lcRetorno = 'Jueves'
CASE DOW(tdFecha) = 6
   lcRetorno = 'Viernes'
CASE DOW(tdFecha) = 7
   lcRetorno = 'S�bado'
ENDCASE

RETURN lcRetorno