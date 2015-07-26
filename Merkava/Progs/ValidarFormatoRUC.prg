LPARAMETERS tcRUC

* inicio { validación de parámetro }
IF PARAMETERS() < 1 THEN
   MESSAGEBOX('Muy pocos argumentos.', 0+16, 'ValidarFormatoRUC()')
   RETURN .F.
ENDIF

IF VARTYPE(tcRUC) <> 'C' THEN
   MESSAGEBOX([El parámetro 'tcRUC' debe ser de tipo texto.], 0+16, 'ValidarFormatoRUC()')
   RETURN .F.
ENDIF

IF EMPTY(tcRUC) THEN
*!*	   MESSAGEBOX([El parámetro 'tcRUC' no puede estar en blanco.], 0+16, 'ValidarFormatoRUC()')
   RETURN .F.
ENDIF
* fin { validación de parámetro }

LOCAL llRetorno, lnNumero, lnLetra, lnSimbolo, lnContador, lcCaracter
llRetorno = .T.
lnNumero = 0
lnLetra = 0
lnSimbolo = 0

FOR lnContador = 1 TO LEN(tcRUC)
   lcCaracter = SUBSTR(tcRUC, lnContador, 1)
   IF ISDIGIT(lcCaracter) THEN
      lnNumero = lnNumero + 1
   ELSE
      IF ISALPHA(lcCaracter) THEN
         lnLetra = lnLetra + 1
      ELSE
         lnSimbolo = lnSimbolo + 1 
      ENDIF
   ENDIF
ENDFOR

IF lnSimbolo > 0 THEN
   llRetorno = .F.
ENDIF

IF llRetorno THEN
   IF lnLetra > 1 THEN
      llRetorno = .F.
   ENDIF
ENDIF

IF llRetorno THEN
   IF lnNumero = 0 THEN
      llRetorno = .F.
   ENDIF
ENDIF

IF llRetorno THEN
   IF lnLetra > 0 THEN
      IF !ISALPHA(RIGHT(tcRUC, 1)) THEN
         llRetorno = .F.
      ELSE
         IF !BETWEEN(ASC(RIGHT(tcRUC, 1)), 65, 90) THEN   && A-Z
            llRetorno = .F.
         ENDIF
      ENDIF
   ENDIF
ENDIF

IF llRetorno THEN
   IF !BETWEEN(VAL(tcRUC), 1, 9999999) AND ;
      !BETWEEN(VAL(tcRUC), 50000000, 59999999) AND ;
      !BETWEEN(VAL(tcRUC), 80000000, 89999999) THEN
      llRetorno = .F.
   ENDIF
ENDIF

RETURN llRetorno