LPARAMETERS tdFecha

* inicio { validaci�n de par�metro }
IF PARAMETERS() < 1 THEN
   MESSAGEBOX('Muy pocos argumentos.', 0+16, '_CMONTH()')
   RETURN .F.
ENDIF

IF VARTYPE(tdFecha) <> 'D' THEN
   MESSAGEBOX([El par�metro 'tdFecha' deben ser de tipo fecha.], 0+16, '_CMONTH()')
   RETURN .F.
ENDIF

IF EMPTY(tdFecha) THEN
   MESSAGEBOX([El par�metro 'tdFecha'  no debe estar vac�o.], 0+16, '_CMONTH()')
   RETURN .F.
ENDIF
* fin { validaci�n de par�metro }

LOCAL lcRetorno
lcRetorno = ''

DO CASE
CASE MONTH(tdFecha) = 1
   lcRetorno = 'Enero'
CASE MONTH(tdFecha) = 2
   lcRetorno = 'Febrero'
CASE MONTH(tdFecha) = 3
   lcRetorno = 'Marzo'
CASE MONTH(tdFecha) = 4
   lcRetorno = 'Abril'
CASE MONTH(tdFecha) = 5
   lcRetorno = 'Mayo'
CASE MONTH(tdFecha) = 6
   lcRetorno = 'Junio'
CASE MONTH(tdFecha) = 7
   lcRetorno = 'Julio'
CASE MONTH(tdFecha) = 8
   lcRetorno = 'Agosto'
CASE MONTH(tdFecha) = 9
   lcRetorno = 'Septiembre'
CASE MONTH(tdFecha) = 10
   lcRetorno = 'Octubre'
CASE MONTH(tdFecha) = 11
   lcRetorno = 'Noviembre'
CASE MONTH(tdFecha) = 12
   lcRetorno = 'Diciembre'
ENDCASE

RETURN lcRetorno