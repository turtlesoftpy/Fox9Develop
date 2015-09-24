DEFINE CLASS Barrio AS CUSTOM
   * Propiedades.
   PROTECTED nBandera
   PROTECTED cTabla           && Nombre de la tabla a la cual hace referencia el modelo.
   PROTECTED cClavePrimaria   && Nombre de la clave primaria de la tabla.
   PROTECTED cClaveForanea    && Nombre con el cual se hace referencia a la clave primaria en otras tablas.

   * Campos.
   PROTECTED nCodigo
   PROTECTED cNombre
   PROTECTED nDepartamen
   PROTECTED nCiudad
   PROTECTED lVigente

   * Objetos.
   PROTECTED oDepartamen
   PROTECTED oCiudad

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Init
      WITH THIS
         .nBandera = 0
         .cTabla = 'barrio'
         .cClavePrimaria = 'codigo'
         .cClaveForanea = 'barrio'

         .nCodigo = 0
         .cNombre = ''
         .nDepartamen = 0
         .nCiudad = 0
         .lVigente = .F.

         .oDepartamen = NEWOBJECT('Depar', 'Depar.prg')
         .oCiudad = NEWOBJECT('Ciudad', 'Ciudad.prg')
      ENDWITH

      IF VARTYPE(THIS.oDepartamen) <> 'O' THEN
         MESSAGEBOX([No se puede crear el objeto 'Departamen'.], 0+16, THIS.Name + '.Init()')
         RETURN .F.
      ENDIF

      IF VARTYPE(THIS.oCiudad) <> 'O' THEN
         MESSAGEBOX([No se puede crear el objeto 'Ciudad'.], 0+16, THIS.Name + '.Init()')
         RETURN .F.
      ENDIF
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
   FUNCTION SetDepartamen
      LPARAMETER tnDepartamen

      * inicio { validación de parámetro }
      IF VARTYPE(tnDepartamen) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnDepartamen' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetDepartamen()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nDepartamen = tnDepartamen

      IF !THIS.oDepartamen.BuscarPorCodigo(THIS.nDepartamen) THEN   && El registro no existe.
         WITH THIS.oDepartamen
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetCiudad
      LPARAMETER tnCiudad

      * inicio { validación de parámetro }
      IF VARTYPE(tnCiudad) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnCiudad' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetCiudad()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nCiudad = tnCiudad

      IF !THIS.oCiudad.BuscarPorCodigo(THIS.nCiudad) THEN   && El registro no existe.
         WITH THIS.oCiudad
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
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
   FUNCTION GetDepartamen
      RETURN THIS.nDepartamen
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetDepartamenNombre
      RETURN THIS.oDepartamen.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetDepartamenVigente
      RETURN THIS.oDepartamen.GetVigente()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetCiudad
      RETURN THIS.nCiudad
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetCiudadNombre
      RETURN THIS.oCiudad.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetCiudadVigente
      RETURN THIS.oCiudad.GetVigente()
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
            .nDepartamen = departamen
            .nCiudad = ciudad
            .lVigente = IIF(vigente = 0, .F., .T.)
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
            .nDepartamen = departamen
            .nCiudad = ciudad
            .lVigente = IIF(vigente = 0, .F., .T.)
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
      IF !BETWEEN(THIS.nCodigo, 1, 65535) THEN
         MESSAGEBOX([El código debe ser un valor entre 1 y 65535.], 0+16, THIS.Name + '.ValidarCodigo()')
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
      llExiste = loModelo.BuscarPorNombre(THIS.cNombre, 'departamen = ' + ALLTRIM(STR(THIS.nDepartamen)) + ' AND ciudad = ' + ALLTRIM(STR(THIS.nCiudad)))

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
   FUNCTION ValidarDepartamen()
      IF !BETWEEN(THIS.nDepartamen, 1, 65535) THEN
         MESSAGEBOX([El departamento debe ser un valor entre 1 y 65535.], 0+16, THIS.Name + '.ValidarDepartamen()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.oDepartamen.GetNombre()) THEN
         MESSAGEBOX('El departamento no existe.', 0+16, THIS.Name + '.ValidarDepartamen()')
         RETURN .F.
      ENDIF

      LOCAL llRetorno, loModelo, llExiste
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorNombre(THIS.cNombre, 'departamen = ' + ALLTRIM(STR(THIS.nDepartamen)) + ' AND ciudad = ' + ALLTRIM(STR(THIS.nCiudad)))

      DO CASE
      CASE THIS.nBandera = 1   && Agregar.
         IF llExiste THEN
            MESSAGEBOX('El barrio ya existe.', 0+16, THIS.Name + '.ValidarDepartamen()')
            llRetorno = .F.
         ENDIF
      CASE THIS.nBandera = 2   && Modificar.
         IF llExiste AND loModelo.GetCodigo() <> THIS.nCodigo THEN
            MESSAGEBOX('El barrio ya existe.', 0+16, THIS.Name + '.ValidarDepartamen()')
            llRetorno = .F.
         ENDIF
      ENDCASE

      IF !THIS.oDepartamen.GetVigente() THEN
         MESSAGEBOX('El departamento no está vigente.', 0+16, THIS.Name + '.ValidarDepartamen()')
         llRetorno = .F.
      ENDIF

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarCiudad()
      IF !BETWEEN(THIS.nCiudad, 1, 65535) THEN
         MESSAGEBOX([La ciudad debe ser un valor entre 1 y 65535.], 0+16, THIS.Name + '.ValidarCiudad()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.oCiudad.GetNombre()) THEN
         MESSAGEBOX('La ciudad no existe.', 0+16, THIS.Name + '.ValidarCiudad()')
         RETURN .F.
      ENDIF

      LOCAL llRetorno, loModelo, llExiste
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorNombre(THIS.cNombre, 'departamen = ' + ALLTRIM(STR(THIS.nDepartamen)) + ' AND ciudad = ' + ALLTRIM(STR(THIS.nCiudad)))

      DO CASE
      CASE THIS.nBandera = 1   && Agregar.
         IF llExiste THEN
            MESSAGEBOX('El barrio ya existe.', 0+16, THIS.Name + '.ValidarCiudad()')
            llRetorno = .F.
         ENDIF
      CASE THIS.nBandera = 2   && Modificar.
         IF llExiste AND loModelo.GetCodigo() <> THIS.nCodigo THEN
            MESSAGEBOX('El barrio ya existe.', 0+16, THIS.Name + '.ValidarCiudad()')
            llRetorno = .F.
         ENDIF
      ENDCASE

      IF !THIS.oCiudad.GetVigente() THEN
         MESSAGEBOX('La ciudad no está vigente.', 0+16, THIS.Name + '.ValidarCiudad()')
         llRetorno = .F.
      ENDIF

      IF !THIS.CiudadPerteneceDepartamen() THEN
         MESSAGEBOX([La ciudad '] + ALLTRIM(STR(THIS.nCiudad)) + [ - ] + ALLTRIM(THIS.GetCiudadNombre()) + [' no pertenece al departamento '] + ALLTRIM(STR(THIS.nDepartamen)) + [ - ] + ALLTRIM(THIS.GetDepartamenNombre()) + ['.], 0+16, THIS.Name + '.ValidarCiudad()')
         llRetorno = .F.
      ENDIF

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

      IF !THIS.ValidarDepartamen() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarCiudad() THEN
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Agregar
      LOCAL llRetorno
      llRetorno = .T.
      THIS.nBandera = 1

      IF THIS.Validar() THEN
         PRIVATE pnCodigo, pcNombre, pnDepartamen, pnCiudad, plVigente
         pnCodigo = THIS.nCodigo
         pcNombre = THIS.cNombre
         pnDepartamen = THIS.nDepartamen
         pnCiudad = THIS.nCiudad
         plVigente = IIF(!THIS.lVigente, 0, 1)

         IF goCapaDatos.AgregarRegistro(THIS.cTabla, ;
                                        'codigo, nombre, departamen, ciudad, vigente', ;
                                        '?pnCodigo, ?pcNombre, ?pnDepartamen, ?pnCiudad, ?plVigente')
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
         PRIVATE pnCodigo, pcNombre, pnDepartamen, pnCiudad, plVigente
         pnCodigo = THIS.nCodigo
         pcNombre = THIS.cNombre
         pnDepartamen = THIS.nDepartamen
         pnCiudad = THIS.nCiudad
         plVigente = IIF(!THIS.lVigente, 0, 1)

         IF goCapaDatos.ModificarRegistro(THIS.cTabla, ;
                                          'nombre = ?pcNombre, departamen = ?pnDepartamen, ciudad = ?pnCiudad, vigente = ?plVigente', ;
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

      * Clientes.
      IF llRetorno THEN
         lcTablaRelacionada = 'cliente'
         lnCantidadRegistro = goCapaDatos.RecuperarValor(lcTablaRelacionada, ;
                                                         'COUNT(*) AS cantidad', ;
                                                         THIS.cClaveForanea + ' = ?pnCodigo')
         IF VARTYPE(lnCantidadRegistro) = 'C' THEN
            lnCantidadRegistro = VAL(lnCantidadRegistro)
         ENDIF

         IF lnCantidadRegistro > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Clientes', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
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

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION CiudadPerteneceDepartamen
      loModelo = NEWOBJECT('Ciudad', 'Ciudad.prg')
      RETURN loModelo.BuscarPorCodigo(THIS.nCiudad, 'departamen = ' + ALLTRIM(STR(THIS.nDepartamen)))
   ENDFUNC
ENDDEFINE