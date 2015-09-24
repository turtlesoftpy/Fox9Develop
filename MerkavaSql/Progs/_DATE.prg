LOCAL ldRetorno, lcCursor
ldRetorno = {}
lcCursor = CreaTemp()

IF goCapaDatos.LlamarConsulta('SELECT CURRENT_DATE AS fecha_actual', lcCursor) THEN
   IF USED(lcCursor) THEN
      SELECT (lcCursor)
      ldRetorno = fecha_actual
      USE
   ENDIF
ENDIF

RETURN ldRetorno