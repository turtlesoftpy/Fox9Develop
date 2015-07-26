DEFINE CLASS Mecanico AS CUSTOM
   * Propiedades.
   PROTECTED nBandera
   PROTECTED cTabla           && Nombre de la tabla a la cual hace referencia el modelo.
   PROTECTED cClavePrimaria   && Nombre de la clave primaria de la tabla.
   PROTECTED cClaveForanea    && Nombre con el cual se hace referencia a la clave primaria en otras tablas.

   * Campos.
   PROTECTED nCodigo
   PROTECTED cNombre
   PROTECTED cDocumento
   PROTECTED nPComisRpto
   PROTECTED lVigente

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Init
      WITH THIS
         .nBandera = 0
         .cTabla = 'mecanico'
         .cClavePrimaria = 'codigo'
         .cClaveForanea = 'mecanico'

         .nCodigo = 0
         .cNombre = ''
         .cDocumento =  ''
         .nPComisRpto = 0
         .lVigente = .F.
      ENDWITH
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Destroy
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetBandera
      LPARAMETER tnBandera

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnBandera) <> 'N' THEN
         MESSAGEBOX([El par�metro 'tnBandera' debe ser de tipo num�rico.], 0+16, THIS.Name + '.SetBandera()')
         RETURN .F.
      ENDIF

      IF !BETWEEN(tnBandera, 0, 2) THEN
         MESSAGEBOX([El par�metro 'tnBandera' debe ser un valor entre 0 y 2.], 0+16, THIS.Name + '.SetBandera()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.nBandera = tnBandera
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetCodigo
      LPARAMETER tnCodigo

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnCodigo) <> 'N' THEN
         MESSAGEBOX([El par�metro 'tnCodigo' debe ser de tipo num�rico.], 0+16, THIS.Name + '.SetCodigo()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.nCodigo = tnCodigo
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetNombre
      LPARAMETER tcNombre

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tcNombre) <> 'C' THEN
         MESSAGEBOX([El par�metro 'tcNombre' debe ser de tipo texto.], 0+16, THIS.Name + '.SetNombre()')
         RETURN .F.
      ENDIF

      IF LEN(tcNombre) > 30 THEN
         MESSAGEBOX([La longitud del par�metro 'tcNombre' debe ser como m�ximo de 30 caracteres.], 0+16, THIS.Name + '.SetNombre()')
         RETURN .F.
      ENDIF

      IF AT('[', tcNombre) > 0 THEN
         MESSAGEBOX('Los corchetes no est�n permitidos.', 0+16, THIS.Name + '.SetNombre()')
         RETURN .F.
      ENDIF

      IF AT(']', tcNombre) > 0 THEN
         MESSAGEBOX('Los corchetes no est�n permitidos.', 0+16, THIS.Name + '.SetNombre()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.cNombre = tcNombre
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetDocumento
      LPARAMETER tcDocumento

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tcDocumento) <> 'C' THEN
         MESSAGEBOX([El par�metro 'tcDocumento' debe ser de tipo texto.], 0+16, THIS.Name + '.SetDocumento()')
         RETURN .F.
      ENDIF

      IF LEN(tcDocumento) > 15 THEN
         MESSAGEBOX([La longitud del par�metro 'tcDocumento' debe ser como m�ximo de 15 caracteres.], 0+16, THIS.Name + '.SetDocumento()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.cDocumento = tcDocumento
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetPComisRpto
      LPARAMETER tnPComisRpto

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnPComisRpto) <> 'N' THEN
         MESSAGEBOX([El par�metro 'tnPComisRpto' debe ser de tipo num�rico.], 0+16, THIS.Name + '.SetPComisRpto()')
         RETURN .F.
      ENDIF

      IF !BETWEEN(tnPComisRpto, 0, 999.99) THEN
         MESSAGEBOX([El par�metro 'tnPComisRpto' debe ser un valor entre 0 y 999.99.], 0+16, THIS.Name + '.SetPComisRpto()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.nPComisRpto = tnPComisRpto
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetVigente
      LPARAMETER tlVigente

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tlVigente) <> 'L' THEN
         MESSAGEBOX([El par�metro 'tlVigente' debe ser de tipo l�gico.], 0+16, THIS.Name + '.SetVigente()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.lVigente = tlVigente
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetCodigo
      RETURN THIS.nCodigo
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetNombre
      RETURN THIS.cNombre
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetDocumento
      RETURN THIS.cDocumento
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPComisRpto
      RETURN THIS.nPComisRpto
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetVigente
      RETURN THIS.lVigente
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetNuevoCodigo()
      LOCAL lnCodigo
      lnCodigo = 1

      SELECT (THIS.cTabla)
      SET ORDER TO 1   && codigo
      SEEK (lnCodigo)
      DO WHILE FOUND()
         lnCodigo = lnCodigo + 1
         SEEK (lnCodigo)
      ENDDO

      RETURN lnCodigo
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION RecuperarTodo
      LPARAMETER tcCondicionFiltrado, tcCursor

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tcCursor) <> 'C' THEN
         MESSAGEBOX([El par�metro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.RecuperarTodo()')
         llRetorno = .F.
      ELSE
         IF EMPTY(tcCursor) THEN
            MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.RecuperarTodo()')
            llRetorno = .F.
         ENDIF
      ENDIF

      IF VARTYPE(tcCondicionFiltrado) <> 'C' THEN
         tcCondicionFiltrado = NULL
      ELSE
         IF EMPTY(tcCondicionFiltrado) THEN
            tcCondicionFiltrado = NULL
         ENDIF
      ENDIF
      * fin { validaci�n de par�metro }

      LOCAL llRetorno, lcCursor, lcSQL
      llRetorno = .T.
      lcCursor = CreaTemp()

      IF ISNULL(tcCondicionFiltrado) THEN
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' ORDER BY nombre INTO CURSOR ' + lcCursor
      ELSE
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE ' + tcCondicionFiltrado + ' ORDER BY nombre INTO CURSOR ' + lcCursor
      ENDIF

      &lcSQL

      * Copia todos los registros al cursor que se ha pasado como par�metro.
      SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)

      SELECT (lcCursor)
      USE

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION BuscarPorCodigo
      LPARAMETER tnCodigo, tcCondicionFiltrado, tcCursor

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnCodigo) = 'N' THEN
         IF tnCodigo > 999 THEN
            MESSAGEBOX([El par�metro 'tnCodigo' debe ser menor o igual que 999.], 0+16, THIS.Name + '.BuscarPorCodigo()')
            RETURN .F.
         ENDIF
      ENDIF

      IF EMPTY(IIF(!INLIST(VARTYPE(tnCodigo), 'L', 'X'), tnCodigo, THIS.nCodigo)) THEN
         RETURN .F.
      ENDIF

      IF VARTYPE(tcCondicionFiltrado) <> 'C' THEN
         tcCondicionFiltrado = NULL
      ELSE
         IF EMPTY(tcCondicionFiltrado) THEN
            tcCondicionFiltrado = NULL
         ENDIF
      ENDIF
      * fin { validaci�n de par�metro }

      LOCAL llRetorno, lcCursor, lnCodigo, lcSQL
      llRetorno = .T.
      lcCursor = CreaTemp()
      lnCodigo = IIF(!INLIST(VARTYPE(tnCodigo), 'L', 'X'), tnCodigo, THIS.nCodigo)

      IF ISNULL(tcCondicionFiltrado) THEN
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE ' + THIS.cClavePrimaria + ' = ' + ALLTRIM(STR(lnCodigo)) + ' INTO CURSOR ' + lcCursor
      ELSE
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE ' + THIS.cClavePrimaria + ' = ' + ALLTRIM(STR(lnCodigo)) + ' AND ' + tcCondicionFiltrado + ' INTO CURSOR ' + lcCursor
      ENDIF

      &lcSQL

      SELECT (lcCursor)
      DO CASE
      CASE _TALLY = 0   && No hay registros.
         llRetorno = .F.
      CASE _TALLY = 1   && Se ha encontrado un registro.
         WITH THIS
            .nCodigo = codigo
            .cNombre = nombre
            .cDocumento = documento
            .nPComisRpto = pcomisrpto
            .lVigente = vigente
         ENDWITH

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.BuscarPorCodigo()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE _TALLY > 1   && Se ha encontrado m�s de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El par�metro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorCodigo()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.BuscarPorCodigo()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO TABLE (tcCursor)
            ENDIF
         ENDIF
      ENDCASE

      SELECT (lcCursor)
      USE

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION BuscarPorDocumento
      LPARAMETER tcDocumento, tcCondicionFiltrado, tcCursor

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tcDocumento) = 'C' THEN
         IF LEN(tcDocumento) > 15 THEN
            MESSAGEBOX([La longitud del par�metro 'tcDocumento' debe ser como m�ximo de 15 caracteres.], 0+16, THIS.Name + '.BuscarPorDocumento()')
            RETURN .F.
         ENDIF

         IF AT('[', tcDocumento) > 0 THEN
            MESSAGEBOX('Los corchetes no est�n permitidos.', 0+16, THIS.Name + '.BuscarPorDocumento()')
            RETURN .F.
         ENDIF

         IF AT(']', tcDocumento) > 0 THEN
            MESSAGEBOX('Los corchetes no est�n permitidos.', 0+16, THIS.Name + '.BuscarPorDocumento()')
            RETURN .F.
         ENDIF
      ENDIF

      IF EMPTY(IIF(!INLIST(VARTYPE(tcDocumento), 'L', 'X'), tcDocumento, THIS.cDocumento)) THEN
         RETURN .F.
      ENDIF

      IF VARTYPE(tcCondicionFiltrado) <> 'C' THEN
         tcCondicionFiltrado = NULL
      ELSE
         IF EMPTY(tcCondicionFiltrado) THEN
            tcCondicionFiltrado = NULL
         ENDIF
      ENDIF
      * fin { validaci�n de par�metro }

      LOCAL llRetorno, lcCursor, lcDocumento, lcSQL
      llRetorno = .T.
      lcCursor = CreaTemp()
      lcDocumento = IIF(!INLIST(VARTYPE(tcDocumento), 'L', 'X'), ALLTRIM(tcDocumento), ALLTRIM(THIS.cDocumento))

      IF ISNULL(tcCondicionFiltrado) THEN
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(documento) LIKE [' + ALLTRIM(UPPER(lcDocumento)) + '] INTO CURSOR ' + lcCursor
      ELSE
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(documento) LIKE [' + ALLTRIM(UPPER(lcDocumento)) + '] AND ' + tcCondicionFiltrado + ' INTO CURSOR ' + lcCursor
      ENDIF

      &lcSQL

      SELECT (lcCursor)
      DO CASE
      CASE _TALLY = 0   && No hay registros.
         llRetorno = .F.
      CASE _TALLY = 1   && Se ha encontrado un registro.
         WITH THIS
            .nCodigo = codigo
            .cNombre = nombre
            .cDocumento = documento
            .nPComisRpto = pcomisrpto
            .lVigente = vigente
         ENDWITH

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.BuscarPorDocumento()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE _TALLY > 1   && Se ha encontrado m�s de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El par�metro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorDocumento()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.BuscarPorDocumento()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      ENDCASE

      SELECT (lcCursor)
      USE

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION BuscarPorNombre
      LPARAMETER tcNombre, tcCondicionFiltrado, tcCursor

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tcNombre) = 'C' THEN
         IF LEN(tcNombre) > 30 THEN
            MESSAGEBOX([La longitud del par�metro 'tcNombre' debe ser como m�ximo de 30 caracteres.], 0+16, THIS.Name + '.BuscarPorNombre()')
            RETURN .F.
         ENDIF

         IF AT('[', tcNombre) > 0 THEN
            MESSAGEBOX('Los corchetes no est�n permitidos.', 0+16, THIS.Name + '.BuscarPorNombre()')
            RETURN .F.
         ENDIF

         IF AT(']', tcNombre) > 0 THEN
            MESSAGEBOX('Los corchetes no est�n permitidos.', 0+16, THIS.Name + '.BuscarPorNombre()')
            RETURN .F.
         ENDIF
      ENDIF

      IF EMPTY(IIF(!INLIST(VARTYPE(tcNombre), 'L', 'X'), tcNombre, THIS.cNombre)) THEN
         RETURN .F.
      ENDIF

      IF VARTYPE(tcCondicionFiltrado) <> 'C' THEN
         tcCondicionFiltrado = NULL
      ELSE
         IF EMPTY(tcCondicionFiltrado) THEN
            tcCondicionFiltrado = NULL
         ENDIF
      ENDIF
      * fin { validaci�n de par�metro }

      LOCAL llRetorno, lcCursor, lcNombre, lcSQL
      llRetorno = .T.
      lcCursor = CreaTemp()
      lcNombre = IIF(!INLIST(VARTYPE(tcNombre), 'L', 'X'), ALLTRIM(tcNombre), ALLTRIM(THIS.cNombre))

      IF ISNULL(tcCondicionFiltrado) THEN
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(nombre) LIKE [' + ALLTRIM(UPPER(lcNombre)) + '] INTO CURSOR ' + lcCursor
      ELSE
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(nombre) LIKE [' + ALLTRIM(UPPER(lcNombre)) + '] AND ' + tcCondicionFiltrado + ' INTO CURSOR ' + lcCursor
      ENDIF

      &lcSQL

      SELECT (lcCursor)
      DO CASE
      CASE _TALLY = 0   && No hay registros.
         llRetorno = .F.
      CASE _TALLY = 1   && Se ha encontrado un registro.
         WITH THIS
            .nCodigo = codigo
            .cNombre = nombre
            .cDocumento = documento
            .nPComisRpto = pcomisrpto
            .lVigente = vigente
         ENDWITH

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.BuscarPorNombre()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE _TALLY > 1   && Se ha encontrado m�s de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El par�metro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorNombre()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.BuscarPorNombre()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      ENDCASE

      SELECT (lcCursor)
      USE

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarCodigo()
      IF !BETWEEN(THIS.nCodigo, 1, 999) THEN
         MESSAGEBOX([El c�digo debe ser un valor entre 1 y 999.], 0+16, THIS.Name + '.ValidarCodigo()')
         RETURN .F.
      ENDIF

      LOCAL llRetorno, loModelo, llExiste
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorCodigo(THIS.nCodigo)

      DO CASE
      CASE THIS.nBandera = 1   && Agregar.
         IF llExiste THEN
            MESSAGEBOX('El c�digo ya existe.', 0+16, THIS.Name + '.ValidarCodigo()')
            llRetorno = .F.
         ENDIF
      CASE THIS.nBandera = 2   && Modificar.
         IF !llExiste THEN
            MESSAGEBOX('El c�digo no existe.', 0+16, THIS.Name + '.ValidarCodigo()')
            llRetorno = .F.
         ENDIF
      ENDCASE

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarNombre()
      IF EMPTY(THIS.cNombre) THEN
         MESSAGEBOX('El nombre no puede quedar en blanco.', 0+16, THIS.Name + '.ValidarNombre()')
         RETURN .F.
      ENDIF

      LOCAL llRetorno, loModelo, llExiste
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorNombre(THIS.cNombre)

      DO CASE
      CASE THIS.nBandera = 1   && Agregar.
         IF llExiste THEN
            MESSAGEBOX('El nombre ya existe.', 0+16, THIS.Name + '.ValidarNombre()')
            llRetorno = .F.
         ENDIF
      CASE THIS.nBandera = 2   && Modificar.
         IF llExiste AND loModelo.GetCodigo() <> THIS.nCodigo THEN
            MESSAGEBOX('El nombre ya existe.', 0+16, THIS.Name + '.ValidarNombre()')
            llRetorno = .F.
         ENDIF
      ENDCASE

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarDocumento
      IF EMPTY(THIS.cDocumento) THEN
         RETURN .T.
      ENDIF

      LOCAL llRetorno, loModelo, llExiste
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorDocumento(THIS.cDocumento)

      DO CASE
      CASE THIS.nBandera = 1   && Agregar.
         IF llExiste THEN
            MESSAGEBOX('El documento ya existe.', 0+16, THIS.Name + '.ValidarDocumento()')
            llRetorno = .F.
         ENDIF
      CASE THIS.nBandera = 2   && Modificar.
         IF llExiste AND loModelo.GetCodigo() <> THIS.nCodigo THEN
            MESSAGEBOX('El documento ya existe.', 0+16, THIS.Name + '.ValidarDocumento()')
            llRetorno = .F.
         ENDIF
      ENDCASE

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Validar
      IF !THIS.ValidarCodigo() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarNombre() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDocumento() THEN
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Agregar
      SELECT (THIS.cTabla)
      IF !FLOCK() THEN
         MESSAGEBOX('No se puede bloquear el archivo; int�ntelo de nuevo m�s tarde.', 0+16, THIS.Name + '.Agregar()')
         RETURN .F.
      ENDIF

      LOCAL llRetorno
      llRetorno = .T.
      THIS.nBandera = 1

      IF THIS.Validar() THEN
         INSERT INTO (THIS.cTabla) (codigo, nombre, documento, pcomisrpto, vigente) ;
            VALUES (THIS.nCodigo, THIS.cNombre, THIS.cDocumento, THIS.nPComisRpto, THIS.lVigente)

         WAIT 'Registro almacenado correctamente.' WINDOW NOWAIT
      ELSE
         llRetorno = .F.
      ENDIF

      SELECT (THIS.cTabla)
      UNLOCK

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Modificar
      SELECT (THIS.cTabla)
      IF !FLOCK() THEN
         MESSAGEBOX('No se puede bloquear el archivo; int�ntelo de nuevo m�s tarde.', 0+16, THIS.Name + '.Modificar()')
         RETURN .F.
      ENDIF

      LOCAL llRetorno
      llRetorno = .T.
      THIS.nBandera = 2

      IF THIS.Validar() THEN
         UPDATE ;
            (THIS.cTabla) ;
         SET ;
            nombre = THIS.cNombre, ;
            documento = THIS.cDocumento, ;
            pcomisrpto = THIS.nPComisRpto, ;
            vigente = THIS.lVigente ;
         WHERE ;
            EVALUATE(THIS.cClavePrimaria) = THIS.nCodigo

         WAIT 'Registro almacenado correctamente.' WINDOW NOWAIT
      ELSE
         llRetorno = .F.
      ENDIF

      SELECT (THIS.cTabla)
      UNLOCK

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Borrar
      LPARAMETER tnCodigo

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnCodigo) = 'N' THEN
         IF !BETWEEN(tnCodigo, 1, 999) THEN
            MESSAGEBOX([El par�metro 'tnCodigo' debe ser un valor entre 1 y 999.], 0+16, THIS.Name + '.Borrar()')
            RETURN .F.
         ENDIF
      ENDIF
      * fin { validaci�n de par�metro }

      SELECT (THIS.cTabla)
      IF !FLOCK() THEN
         MESSAGEBOX('No se puede bloquear el archivo; int�ntelo de nuevo m�s tarde.', 0+16, THIS.Name + '.Borrar()')
         RETURN .F.
      ENDIF

      * inicio { integridad referencial }
      WAIT 'Comprobando integridad referencial, por favor espere...' WINDOW NOWAIT
      LOCAL llRetorno, lcCursor, lnCodigo, loModelo, llExiste, lcSQL
      llRetorno = .T.
      lcCursor = CreaTemp()
      lnCodigo = IIF(!INLIST(VARTYPE(tnCodigo), 'L', 'X'), tnCodigo, THIS.nCodigo)
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorCodigo(lnCodigo)

      IF !llExiste THEN
         WAIT CLEAR
         MESSAGEBOX([El c�digo '] + ALLTRIM(STR(lnCodigo)) + [' no existe.], 0+16, THIS.Name + '.Borrar()')
         llRetorno = .F.
      ENDIF

      * Configuraci�n de Mec�nicos.
      IF llRetorno THEN
         lcSQL = 'SELECT TOP 1 ' + THIS.cClaveForanea + ' FROM mecancfg ORDER BY ' + THIS.cClaveForanea + ' WHERE ' + THIS.cClaveForanea + ' = ' + ALLTRIM(STR(lnCodigo)) + ' INTO CURSOR ' + lcCursor
         &lcSQL
         IF _TALLY > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Configuraci�n de Mec�nicos', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF

      * �rdenes de Trabajo.
      IF llRetorno THEN
         lcSQL = 'SELECT TOP 1 ' + THIS.cClaveForanea + ' FROM ot ORDER BY ' + THIS.cClaveForanea + ' WHERE ' + THIS.cClaveForanea + ' = ' + ALLTRIM(STR(lnCodigo)) + ' INTO CURSOR ' + lcCursor
         &lcSQL
         IF _TALLY > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de '�rdenes de Trabajo', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF

      * Presupuestos.
      IF llRetorno THEN
         lcSQL = 'SELECT TOP 1 ' + THIS.cClaveForanea + ' FROM detamot2 ORDER BY ' + THIS.cClaveForanea + ' WHERE ' + THIS.cClaveForanea + ' = ' + ALLTRIM(STR(lnCodigo)) + ' INTO CURSOR ' + lcCursor
         &lcSQL
         IF _TALLY > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Presupuestos', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF

      * M�quinas Terminadas.
      IF llRetorno THEN
         lcSQL = 'SELECT TOP 1 ' + THIS.cClaveForanea + ' FROM detamot ORDER BY ' + THIS.cClaveForanea + ' WHERE ' + THIS.cClaveForanea + ' = ' + ALLTRIM(STR(lnCodigo)) + ' INTO CURSOR ' + lcCursor
         &lcSQL
         IF _TALLY > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'M�quinas Terminadas', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF

      * Pedido de Clientes.
      IF llRetorno THEN
         lcSQL = 'SELECT TOP 1 ' + THIS.cClaveForanea + ' FROM detapedc ORDER BY ' + THIS.cClaveForanea + ' WHERE ' + THIS.cClaveForanea + ' = ' + ALLTRIM(STR(lnCodigo)) + ' INTO CURSOR ' + lcCursor
         &lcSQL
         IF _TALLY > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Pedidos de Clientes', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF

      * Pedido de Clientes en D�lares Estadounidenses (USD).
      IF llRetorno THEN
         lcSQL = 'SELECT TOP 1 ' + THIS.cClaveForanea + ' FROM detapusd ORDER BY ' + THIS.cClaveForanea + ' WHERE ' + THIS.cClaveForanea + ' = ' + ALLTRIM(STR(lnCodigo)) + ' INTO CURSOR ' + lcCursor
         &lcSQL
         IF _TALLY > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Pedidos de clientes en USD', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF

      * Ventas.
      IF llRetorno THEN
         lcSQL = 'SELECT TOP 1 ' + THIS.cClaveForanea + ' FROM detavent ORDER BY ' + THIS.cClaveForanea + ' WHERE ' + THIS.cClaveForanea + ' = ' + ALLTRIM(STR(lnCodigo)) + ' INTO CURSOR ' + lcCursor
         &lcSQL
         IF _TALLY > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Ventas', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF

      IF USED(lcCursor) THEN
         SELECT (lcCursor)
         USE
      ENDIF
      * fin { integridad referencial }

      IF llRetorno THEN
         DELETE FROM (THIS.cTabla) WHERE EVALUATE(THIS.cClavePrimaria) = lnCodigo
         WAIT 'Registro borrado exitosamente.' WINDOW NOWAIT
      ENDIF

      SELECT (THIS.cTabla)
      UNLOCK

      RETURN llRetorno
   ENDFUNC
ENDDEFINE