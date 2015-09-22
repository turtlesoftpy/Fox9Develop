LPARAMETERS tcUnidad

* inicio { validaci�n de par�metro }
IF PARAMETERS() < 1 THEN
   MESSAGEBOX('Muy pocos argumentos.', 0+16, 'NroSerieDisco()')
   RETURN .F.
ENDIF

IF VARTYPE(tcUnidad) <> 'C' THEN
   MESSAGEBOX([El par�metro 'tcUnidad' debe ser de tipo texto.], 0+16, 'NroSerieDisco()')
   RETURN .F.
ENDIF

IF EMPTY(tcUnidad) THEN
   MESSAGEBOX([El par�metro 'tcUnidad' no puede estar vac�o.], 0+16, 'NroSerieDisco()')
   RETURN .F.
ENDIF

IF LEN(tcUnidad) <> 1 THEN
   MESSAGEBOX([La longitud del par�metro 'tcUnidad' debe ser de uno.], 0+16, 'NroSerieDisco()')
   RETURN .F.
ENDIF

IF !ISALPHA(tcUnidad) THEN
   MESSAGEBOX([El par�metro 'tcUnidad' debe ser una letra de la 'A' a la 'Z'.], 0+16, 'NroSerieDisco()')
   RETURN .F.
ENDIF

tcUnidad = UPPER(tcUnidad) + ':'
* fin { validaci�n de par�metro }

LOCAL lcNombreArchivo, lnArchivo, lcLinea, lcNroSerieDisco

lcNombreArchivo = SYS(3) + '.tmp'

! VOL &tcUnidad > &lcNombreArchivo

lnArchivo = FOPEN(lcNombreArchivo)

IF lnArchivo = -1 THEN
   MESSAGEBOX([No se pudo obtener el n�mero de serie del volumen de la unidad.], 0+16, 'NroSerieDisco()')
   RETURN .F.
ELSE
   DO WHILE !FEOF(lnArchivo)
      lcLinea = UPPER(TRIM(FGETS(lnArchivo)))
      DO CASE
      CASE 'SERIAL NUMBER' $ lcLinea
         lcNroSerieDisco = RIGHT(lcLinea, 9)
      CASE 'SERIE DEL VOLUMEN' $ lcLinea
         lcNroSerieDisco = RIGHT(lcLinea, 9)
      ENDCASE
   ENDDO
   FCLOSE(lnArchivo)
   DELETE FILE (lcNombreArchivo)
ENDIF

RETURN lcNroSerieDisco