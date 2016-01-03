LOCAL ldRetorno, lcCursor
ldRetorno = CTOT('')
lcCursor = CreaTemp()

IF goCapaDatos.LlamarConsulta('SELECT CURRENT_TIMESTAMP AS fecha_hora_actual', lcCursor) THEN
   IF USED(lcCursor) THEN
      SELECT (lcCursor)
      ldRetorno = fecha_hora_actual
      USE
   ENDIF
ENDIF

RETURN ldRetorno