DEFINE CLASS Familia AS CUSTOM
   * Propiedades.
   PROTECTED nBandera
   PROTECTED cTabla           && Nombre de la tabla a la cual hace referencia el modelo.
   PROTECTED cClavePrimaria   && Nombre de la clave primaria de la tabla.
   PROTECTED cClaveForanea    && Nombre con el cual se hace referencia a la clave primaria en otras tablas.

   * Campos.
   PROTECTED nCodigo
   PROTECTED cNombre
   PROTECTED nP1
   PROTECTED nP2
   PROTECTED nP3
   PROTECTED nP4
   PROTECTED nP5
   PROTECTED lVigente

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Init
      WITH THIS
         .nBandera = 0
         .cTabla = 'familias'
         .cClavePrimaria = 'codigo'
         .cClaveForanea = 'familia'

         .nCodigo = 0
         .cNombre = ''
         .nP1 = 0
         .nP2 = 0
         .nP3 = 0
         .nP4 = 0
         .nP5 = 0
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
   FUNCTION SetP1
      LPARAMETER tnP1

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnP1) <> 'N' THEN
         MESSAGEBOX([El par�metro 'tnP1' debe ser de tipo num�rico.], 0+16, THIS.Name + '.SetP1()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.nP1 = tnP1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetP2
      LPARAMETER tnP2

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnP2) <> 'N' THEN
         MESSAGEBOX([El par�metro 'tnP2' debe ser de tipo num�rico.], 0+16, THIS.Name + '.SetP2()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.nP2 = tnP2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetP3
      LPARAMETER tnP3

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnP3) <> 'N' THEN
         MESSAGEBOX([El par�metro 'tnP3' debe ser de tipo num�rico.], 0+16, THIS.Name + '.SetP3()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.nP3 = tnP3
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetP4
      LPARAMETER tnP4

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnP4) <> 'N' THEN
         MESSAGEBOX([El par�metro 'tnP4' debe ser de tipo num�rico.], 0+16, THIS.Name + '.SetP4()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.nP4 = tnP4
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetP5
      LPARAMETER tnP5

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnP5) <> 'N' THEN
         MESSAGEBOX([El par�metro 'tnP5' debe ser de tipo num�rico.], 0+16, THIS.Name + '.SetP5()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.nP5 = tnP5
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
   FUNCTION GetP1
      RETURN THIS.nP1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetP2
      RETURN THIS.nP2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetP3
      RETURN THIS.nP3
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetP4
      RETURN THIS.nP4
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetP5
      RETURN THIS.nP5
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
         IF tnCodigo > 9999 THEN
            MESSAGEBOX([El par�metro 'tnCodigo' debe ser menor o igual que 9999.], 0+16, THIS.Name + '.BuscarPorCodigo()')
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
            .nP1 = p1
            .nP2 = p2
            .nP3 = p3
            .nP4 = p4
            .nP5 = p5
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
            .nP1 = p1
            .nP2 = p2
            .nP3 = p3
            .nP4 = p4
            .nP5 = p5
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
      IF !BETWEEN(THIS.nCodigo, 1, 9999) THEN
         MESSAGEBOX([El c�digo debe ser un valor entre 1 y 9999.], 0+16, THIS.Name + '.ValidarCodigo()')
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
   FUNCTION ValidarP1()
      IF !BETWEEN(THIS.nP1, 0, 999.99) THEN
         MESSAGEBOX([El %1 debe ser un valor entre 0 y 999.99.], 0+16, THIS.Name + '.ValidarP1()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarP2()
      IF !BETWEEN(THIS.nP2, 0, 999.99) THEN
         MESSAGEBOX([El %2 debe ser un valor entre 0 y 999.99.], 0+16, THIS.Name + '.ValidarP2()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarP3()
      IF !BETWEEN(THIS.nP3, 0, 999.99) THEN
         MESSAGEBOX([El %3 debe ser un valor entre 0 y 999.99.], 0+16, THIS.Name + '.ValidarP3()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarP4()
      IF !BETWEEN(THIS.nP4, 0, 999.99) THEN
         MESSAGEBOX([El %4 debe ser un valor entre 0 y 999.99.], 0+16, THIS.Name + '.ValidarP4()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarP5()
      IF !BETWEEN(THIS.nP5, 0, 999.99) THEN
         MESSAGEBOX([El %5 debe ser un valor entre 0 y 999.99.], 0+16, THIS.Name + '.ValidarP5()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Validar
      IF !THIS.ValidarCodigo() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarNombre() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarP1() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarP2() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarP3() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarP4() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarP5() THEN
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
         INSERT INTO (THIS.cTabla) (codigo, nombre, p1, p2, p3, p4, p5, vigente) ;
            VALUES (THIS.nCodigo, THIS.cNombre, THIS.nP1, THIS.nP2, THIS.nP3, THIS.nP4, THIS.nP5, THIS.lVigente)

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
            p1 = THIS.nP1, ;
            p2 = THIS.nP2, ;
            p3 = THIS.nP3, ;
            p4 = THIS.nP4, ;
            p5 = THIS.nP5, ;
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
         IF !BETWEEN(tnCodigo, 1, 9999) THEN
            MESSAGEBOX([El par�metro 'tnCodigo' debe ser un valor entre 1 y 9999.], 0+16, THIS.Name + '.Borrar()')
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

      * Art�culos.
      IF llRetorno THEN
         lcSQL = 'SELECT TOP 1 ' + THIS.cClaveForanea + ' FROM maesprod ORDER BY ' + THIS.cClaveForanea + ' WHERE ' + THIS.cClaveForanea + ' = ' + ALLTRIM(STR(lnCodigo)) + ' INTO CURSOR ' + lcCursor
         &lcSQL
         IF _TALLY > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Art�culos', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
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