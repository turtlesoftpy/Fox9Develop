DEFINE CLASS Pais AS CUSTOM
   * Propiedades.
   PROTECTED nBandera
   PROTECTED cTabla           && Nombre de la tabla a la cual hace referencia el modelo.
   PROTECTED cClavePrimaria   && Nombre de la clave primaria de la tabla.
   PROTECTED cClaveForanea    && Nombre con el cual se hace referencia a la clave primaria en otras tablas.

   * Campos.
   PROTECTED nCodigo
   PROTECTED cNombre
   PROTECTED lVigente

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Init
      WITH THIS
         .nBandera = 0
         .cTabla = 'pais'
         .cClavePrimaria = 'codigo'
         .cClaveForanea = 'pais'

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
      LOCAL lnCodigo, loModelo, llExiste
      lnCodigo = 1
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorCodigo(lnCodigo)

      DO WHILE llExiste
         lnCodigo = lnCodigo + 1
         llExiste = loModelo.BuscarPorCodigo(lnCodigo)
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

      LOCAL llRetorno, lcCursor
      llRetorno = .T.
      lcCursor = CreaTemp()

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' ORDER BY nombre', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE ' + tcCondicionFiltrado + ' ORDER BY nombre', lcCursor)
      ENDIF

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

      LOCAL llRetorno, lcCursor
      llRetorno = .T.
      lcCursor = CreaTemp()

      PRIVATE pnCodigo
      pnCodigo = IIF(!INLIST(VARTYPE(tnCodigo), 'L', 'X'), tnCodigo, THIS.nCodigo)

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE ' + THIS.cClavePrimaria + ' = ?pnCodigo', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE ' + THIS.cClavePrimaria + ' = ?pnCodigo AND ' + tcCondicionFiltrado, lcCursor)
      ENDIF

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         WITH THIS
            .nCodigo = codigo
            .cNombre = nombre
            .lVigente = IIF(vigente = '0', .F., .T.)
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
      CASE RECCOUNT() > 1   && Se ha encontrado más de un registro.
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

      LOCAL llRetorno, lcCursor
      llRetorno = .T.
      lcCursor = CreaTemp()

      PRIVATE pcNombre
      pcNombre = UPPER(IIF(!INLIST(VARTYPE(tcNombre), 'L', 'X'), ALLTRIM(tcNombre), ALLTRIM(THIS.cNombre)))

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(nombre) LIKE ?pcNombre', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(nombre) LIKE ?pcNombre AND ' + tcCondicionFiltrado, lcCursor)
      ENDIF

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         WITH THIS
            .nCodigo = codigo
            .cNombre = nombre
            .lVigente = IIF(vigente = '0', .F., .T.)
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
      CASE RECCOUNT() > 1   && Se ha encontrado más de un registro.
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
      IF !BETWEEN(THIS.nCodigo, 1, 32767) THEN
         MESSAGEBOX([El código debe ser un valor entre 1 y 32767.], 0+16, THIS.Name + '.ValidarCodigo()')
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

      IF LEN(THIS.cNombre) > 50 THEN
         MESSAGEBOX([La longitud del parámetro 'tcNombre' debe ser como máximo de 50 caracteres.], 0+16, THIS.Name + '.ValidarNombre()')
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
      LOCAL llRetorno
      llRetorno = .T.
      THIS.nBandera = 1

      IF THIS.Validar() THEN
         PRIVATE pnCodigo, pcNombre, plVigente
         pnCodigo = THIS.nCodigo
         pcNombre = THIS.cNombre
         plVigente = IIF(!THIS.lVigente, '0', '1')

         IF goCapaDatos.AgregarRegistro(THIS.cTabla, ;
                                        'codigo, nombre, vigente', ;
                                        '?pnCodigo, ?pcNombre, ?plVigente')
            WAIT 'Registro almacenado correctamente.' WINDOW NOWAIT
         ENDIF
      ELSE
         llRetorno = .F.
      ENDIF

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Modificar
      LOCAL llRetorno
      llRetorno = .T.
      THIS.nBandera = 2

      IF THIS.Validar() THEN
         PRIVATE pnCodigo, pcNombre, plVigente
         pnCodigo = THIS.nCodigo
         pcNombre = THIS.cNombre
         plVigente = IIF(!THIS.lVigente, '0', '1')

         IF goCapaDatos.ModificarRegistro(THIS.cTabla, ;
                                          'nombre = ?pcNombre, vigente = ?plVigente', ;
                                          THIS.cClavePrimaria + ' = ?pnCodigo')
            WAIT 'Registro almacenado correctamente.' WINDOW NOWAIT
         ENDIF
      ELSE
         llRetorno = .F.
      ENDIF

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Borrar
      LPARAMETER tnCodigo

      * inicio { integridad referencial }
      WAIT 'Comprobando integridad referencial, por favor espere...' WINDOW NOWAIT

      LOCAL llRetorno, loModelo, llExiste, lcTablaRelacionada, lnCantidadRegistro
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')

      PRIVATE pnCodigo
      pnCodigo = IIF(!INLIST(VARTYPE(tnCodigo), 'L', 'X'), tnCodigo, THIS.nCodigo)
      llExiste = loModelo.BuscarPorCodigo(pnCodigo)

      IF !llExiste THEN
         WAIT CLEAR
         MESSAGEBOX([El código '] + ALLTRIM(STR(pnCodigo)) + [' no existe.], 0+16, THIS.Name + '.Borrar()')
         llRetorno = .F.
      ENDIF

      * Artículos.
      IF llRetorno THEN
         lcTablaRelacionada = 'articulo'
         lnCantidadRegistro = goCapaDatos.RecuperarValor(lcTablaRelacionada, ;
                                                         'COUNT(*) AS cantidad', ;
                                                         THIS.cClaveForanea + ' = ?pnCodigo')
         IF VARTYPE(lnCantidadRegistro) = 'C' THEN
            lnCantidadRegistro = VAL(lnCantidadRegistro)
         ENDIF

         IF lnCantidadRegistro > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Artículos', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF
      * fin { integridad referencial }

      IF llRetorno THEN
         IF goCapaDatos.BorrarRegistro(THIS.cTabla, ;
                                       THIS.cClavePrimaria + ' = ?pnCodigo')
            WAIT 'Registro borrado exitosamente.' WINDOW NOWAIT
         ENDIF
      ENDIF

      RETURN llRetorno
   ENDFUNC
ENDDEFINE