LPARAMETERS tcRUC

* inicio { validaci�n de par�metro }
IF PARAMETERS() < 1 THEN
   MESSAGEBOX('Muy pocos argumentos.', 0+16, 'ValidarRUC()')
   RETURN .F.
ENDIF

IF VARTYPE(tcRUC) <> 'C' THEN
   MESSAGEBOX([El par�metro 'tcRUC' debe ser de tipo texto.], 0+16, 'ValidarRUC()')
   RETURN .F.
ENDIF

* RUC vac�o.
IF EMPTY(tcRUC) THEN
   RETURN .F.
ENDIF

* Hay m�s de un gui�n.
IF OCCURS('-', tcRUC) <> 1 THEN
   RETURN .F.
ENDIF

* La longitud del DV es distinto de uno.
IF LEN(SUBSTR(tcRUC, ATC('-', tcRUC) + 1)) <> 1 THEN
   RETURN .F.
ENDIF

* El DV no es un n�merico.
IF !ISDIGIT(SUBSTR(tcRUC, ATC('-', tcRUC) + 1)) THEN
   RETURN .F.
ENDIF
* fin { validaci�n de par�metro }

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