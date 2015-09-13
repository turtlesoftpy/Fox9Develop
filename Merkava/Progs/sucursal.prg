DEFINE CLASS Sucursal AS CUSTOM
   * Propiedades.
   PROTECTED nBandera
   PROTECTED cTabla           && Nombre de la tabla a la cual hace referencia el modelo.
   PROTECTED cClavePrimaria   && Nombre de la clave primaria de la tabla.
   PROTECTED cClaveForanea    && Nombre con el cual se hace referencia a la clave primaria en otras tablas.
   PROTECTED cClaveForanea2   && Nombre con el cual se hace referencia a la clave primaria en otras tablas.

   * Campos.
   PROTECTED nCodigo
   PROTECTED cNombre
   PROTECTED lVigente

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Init
      WITH THIS
         .nBandera = 0
         .cTabla = 'locales'
         .cClavePrimaria = 'codigo'
         .cClaveForanea = 'local'
         .cClaveForanea2 = 'sucursal'

         .nCodigo = 0
         .cNombre = ''
         .lVigente = .F.
      ENDWITH
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Destroy
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetBandera
      LPARAMETER tnBandera

      * inicio { validación de parámetro }
      IF VARTYPE(tnBandera) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnBandera' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetBandera()')
         RETURN .F.
      ENDIF

      IF !BETWEEN(tnBandera, 0, 2) THEN
         MESSAGEBOX([El parámetro 'tnBandera' debe ser un valor entre 0 y 2.], 0+16, THIS.Name + '.SetBandera()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nBandera = tnBandera
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetCodigo
      LPARAMETER tnCodigo

      * inicio { validación de parámetro }
      IF VARTYPE(tnCodigo) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnCodigo' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetCodigo()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nCodigo = tnCodigo
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetNombre
      LPARAMETER tcNombre

      * inicio { validación de parámetro }
      IF VARTYPE(tcNombre) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcNombre' debe ser de tipo texto.], 0+16, THIS.Name + '.SetNombre()')
         RETURN .F.
      ENDIF

      IF LEN(tcNombre) > 30 THEN
         MESSAGEBOX([La longitud del parámetro 'tcNombre' debe ser como máximo de 30 caracteres.], 0+16, THIS.Name + '.SetNombre()')
         RETURN .F.
      ENDIF

      IF AT('[', tcNombre) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetNombre()')
         RETURN .F.
      ENDIF

      IF AT(']', tcNombre) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetNombre()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cNombre = tcNombre
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetVigente
      LPARAMETER tlVigente

      * inicio { validación de parámetro }
      IF VARTYPE(tlVigente) <> 'L' THEN
         MESSAGEBOX([El parámetro 'tlVigente' debe ser de tipo lógico.], 0+16, THIS.Name + '.SetVigente()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

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

      * inicio { validación de parámetro }
      IF VARTYPE(tcCursor) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.RecuperarTodo()')
         llRetorno = .F.
      ELSE
         IF EMPTY(tcCursor) THEN
            MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.RecuperarTodo()')
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
      * fin { validación de parámetro }

      LOCAL llRetorno, lcCursor, lcSQL
      llRetorno = .T.
      lcCursor = CreaTemp()

      IF ISNULL(tcCondicionFiltrado) THEN
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' ORDER BY nombre INTO CURSOR ' + lcCursor
      ELSE
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE ' + tcCondicionFiltrado + ' ORDER BY nombre INTO CURSOR ' + lcCursor
      ENDIF

      &lcSQL

      * Copia todos los registros al cursor que se ha pasado como parámetro.
      SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)

      SELECT (lcCursor)
      USE

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION BuscarPorCodigo
      LPARAMETER tnCodigo, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF VARTYPE(tnCodigo) = 'N' THEN
         IF tnCodigo > 99 THEN
            MESSAGEBOX([El parámetro 'tnCodigo' debe ser menor o igual que 99.], 0+16, THIS.Name + '.BuscarPorCodigo()')
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
      * fin { validación de parámetro }

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
            .lVigente = vigente
         ENDWITH

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorCodigo()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE _TALLY > 1   && Se ha encontrado más de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorCodigo()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorCodigo()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
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

      * inicio { validación de parámetro }
      IF VARTYPE(tcNombre) = 'C' THEN
         IF LEN(tcNombre) > 30 THEN
            MESSAGEBOX([La longitud del parámetro 'tcNombre' debe ser como máximo de 30 caracteres.], 0+16, THIS.Name + '.BuscarPorNombre()')
            RETURN .F.
         ENDIF

         IF AT('[', tcNombre) > 0 THEN
            MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.BuscarPorNombre()')
            RETURN .F.
         ENDIF

         IF AT(']', tcNombre) > 0 THEN
            MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.BuscarPorNombre()')
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
      * fin { validación de parámetro }

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
            .lVigente = vigente
         ENDWITH

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorNombre()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE _TALLY > 1   && Se ha encontrado más de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorNombre()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorNombre()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
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
      IF !BETWEEN(THIS.nCodigo, 1, 99) THEN
         MESSAGEBOX([El código debe ser un valor entre 1 y 99.], 0+16, THIS.Name + '.ValidarCodigo()')
         RETURN .F.
      ENDIF

      LOCAL llRetorno, loModelo, llExiste
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorCodigo(THIS.nCodigo)

      DO CASE
      CASE THIS.nBandera = 1   && Agregar.
         IF llExiste THEN
            MESSAGEBOX('El código ya existe.', 0+16, THIS.Name + '.ValidarCodigo()')
            llRetorno = .F.
         ENDIF
      CASE THIS.nBandera = 2   && Modificar.
         IF !llExiste THEN
            MESSAGEBOX('El código no existe.', 0+16, THIS.Name + '.ValidarCodigo()')
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
   FUNCTION Validar
      IF !THIS.ValidarCodigo() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarNombre() THEN
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Agregar
      SELECT (THIS.cTabla)
      IF !FLOCK() THEN
         MESSAGEBOX('No se puede bloquear el archivo; inténtelo de nuevo más tarde.', 0+16, THIS.Name + '.Agregar()')
         RETURN .F.
      ENDIF

      LOCAL llRetorno
      llRetorno = .T.
      THIS.nBandera = 1

      IF THIS.Validar() THEN
         INSERT INTO (THIS.cTabla) (codigo, nombre, vigente) ;
            VALUES (THIS.nCodigo, THIS.cNombre, THIS.lVigente)

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
         MESSAGEBOX('No se puede bloquear el archivo; inténtelo de nuevo más tarde.', 0+16, THIS.Name + '.Modificar()')
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

      * inicio { validación de parámetro }
      IF VARTYPE(tnCodigo) = 'N' THEN
         IF !BETWEEN(tnCodigo, 1, 9999) THEN
            MESSAGEBOX([El parámetro 'tnCodigo' debe ser un valor entre 1 y 9999.], 0+16, THIS.Name + '.Borrar()')
            RETURN .F.
         ENDIF
      ENDIF
      * fin { validación de parámetro }

      SELECT (THIS.cTabla)
      IF !FLOCK() THEN
         MESSAGEBOX('No se puede bloquear el archivo; inténtelo de nuevo más tarde.', 0+16, THIS.Name + '.Borrar()')
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
         MESSAGEBOX([El código '] + ALLTRIM(STR(lnCodigo)) + [' no existe.], 0+16, THIS.Name + '.Borrar()')
         llRetorno = .F.
      ENDIF

      * Empresas.
      IF llRetorno THEN
         lcSQL = 'SELECT TOP 1 ' + THIS.cClaveForanea + ' FROM control ORDER BY ' + THIS.cClaveForanea + ' WHERE ' + THIS.cClaveForanea + ' = ' + ALLTRIM(STR(lnCodigo)) + ' INTO CURSOR ' + lcCursor
         &lcSQL
         IF _TALLY > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Empresas', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
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