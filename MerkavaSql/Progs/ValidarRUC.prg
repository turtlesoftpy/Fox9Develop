LPARAMETERS tcRUC

* inicio { validación de parámetro }
IF PARAMETERS() < 1 THEN
   MESSAGEBOX('Muy pocos argumentos.', 0+16, 'ValidarRUC()')
   RETURN .F.
ENDIF

IF VARTYPE(tcRUC) <> 'C' THEN
   MESSAGEBOX([El parámetro 'tcRUC' debe ser de tipo texto.], 0+16, 'ValidarRUC()')
   RETURN .F.
ENDIF

* RUC vacío.
IF EMPTY(tcRUC) THEN
   RETURN .F.
ENDIF

* Hay más de un guión.
IF OCCURS('-', tcRUC) <> 1 THEN
   RETURN .F.
ENDIF

* La longitud del DV es distinto de uno.
IF LEN(SUBSTR(tcRUC, ATC('-', tcRUC) + 1)) <> 1 THEN
   RETURN .F.
ENDIF

* El DV no es un númerico.
IF !ISDIGIT(SUBSTR(tcRUC, ATC('-', tcRUC) + 1)) THEN
   RETURN .F.
ENDIF
* fin { validación de parámetro }

LOCAL llRetorno, lcRUC, lnDV
llRetorno = .T.
lcRUC = LEFT(tcRUC, ATC('-', tcRUC) - 1)   && Obtiene el RUC sin el DV.
lnDV  = VAL(RIGHT(tcRUC, 1))

IF !ValidarFormatoRUC(lcRUC) THEN
   llRetorno = .F.
ENDIF

IF calcular_dv_11_a(lcRUC, 11) <> lnDV THEN
   llRetorno = .F.
ENDIF

RETURN llRetorno