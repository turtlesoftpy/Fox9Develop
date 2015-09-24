LPARAMETERS tnFormato

* inicio { validación de parámetro }
IF PARAMETERS() < 1 THEN
   MESSAGEBOX('Muy pocos argumentos.', 0+16, 'FormatoFecha()')
   RETURN .F.
ENDIF

IF VARTYPE(tnFormato) <> 'N' THEN
   MESSAGEBOX([El parámetro 'tnFormato' deben ser de tipo numérico.], 0+16, 'FormatoFecha()')
   RETURN .F.
ENDIF

IF !BETWEEN(tnFormato, 1, 1) THEN
   MESSAGEBOX([El parámetro 'tnFormato' debe ser un valor entre 1 y 1.], 0+16, 'FormatoFecha()')
   RETURN .F.
ENDIF
* fin { validación de parámetro }
LOCAL lcRetorno, ldFecha
lcRetorno = ''
ldFecha = _DATE()

DO CASE
CASE tnFormato = 1
   lcRetorno = _CDOW(ldFecha) + ', ' + IIF(DAY(ldFecha) < 10, '0' + STR(DAY(ldFecha), 1), STR(DAY(ldFecha), 2)) + ' de ' + _CMONTH(ldFecha) + ' de ' + STR(YEAR(ldFecha), 4)
ENDCASE

RETURN lcRetorno