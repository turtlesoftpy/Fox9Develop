LPARAMETERS tdFecha

* inicio { validación de parámetro }
IF PARAMETERS() < 1 THEN
   MESSAGEBOX('Muy pocos argumentos.', 0+16, '_CDOW()')
   RETURN .F.
ENDIF

IF VARTYPE(tdFecha) <> 'D' THEN
   MESSAGEBOX([El parámetro 'tdFecha' deben ser de tipo fecha.], 0+16, '_CDOW()')
   RETURN .F.
ENDIF

IF EMPTY(tdFecha) THEN
   MESSAGEBOX([El parámetro 'tdFecha'  no debe estar vacío.], 0+16, '_CDOW()')
   RETURN .F.
ENDIF
* fin { validación de parámetro }

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
   lcRetorno = 'Miércoles'
CASE DOW(tdFecha) = 5
   lcRetorno = 'Jueves'
CASE DOW(tdFecha) = 6
   lcRetorno = 'Viernes'
CASE DOW(tdFecha) = 7
   lcRetorno = 'Sábado'
ENDCASE

RETURN lcRetorno