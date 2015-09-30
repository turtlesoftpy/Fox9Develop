DEFINE CLASS Modelo AS CUSTOM
   * Propiedades.
   PROTECTED nBandera
   PROTECTED cTabla           && Nombre de la tabla a la cual hace referencia el modelo.
   PROTECTED cClavePrimaria   && Nombre de la clave primaria de la tabla.
   PROTECTED cClaveForanea    && Nombre con el cual se hace referencia a la clave primaria en otras tablas.
   PROTECTED cSql             && Contiene la consulta personalizada a la base de datos.

   * Campos.
   PROTECTED nCodigo
   PROTECTED cNombre
   PROTECTED cNombre2         && nombre_completo = nombre_máquina + nombre_marca + nombre_modelo.
   PROTECTED nMaquina
   PROTECTED nMarca
   PROTECTED lVigente

   * Objetos.
   PROTECTED oMaquina
   PROTECTED oMarca

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Init
      WITH THIS
         .nBandera = 0
         .cTabla = 'modelo'
         .cClavePrimaria = 'codigo'
         .cClaveForanea = 'modelo'
         .cSql = 'SELECT ' + ;
                    'a.codigo, ' + ;
                    'a.nombre, ' + ;
                    [CONCAT(RTRIM(LTRIM(b.nombre)), ' ', RTRIM(LTRIM(c.nombre)), ' ', RTRIM(LTRIM(a.nombre))) AS nombre2, ] + ;
                    'a.maquina, ' + ;
                    'a.marca, ' + ;
                    'a.vigente ' + ;
                 'FROM ' + ;
                     .cTabla + ' a ' + ;
                    'LEFT JOIN maquina b ' + ;
                       'ON a.maquina = b.codigo ' + ;
                    'LEFT JOIN marca_taller c ' + ;
                       'ON a.marca = c.codigo'

         .nCodigo = 0
         .cNombre = ''
         .cNombre2 = ''
         .nMaquina = 0
         .nMarca = 0
         .lVigente = .F.

         .oMaquina = NEWOBJECT('Maquina', 'Maquina.prg')
         .oMarca = NEWOBJECT('MarcaTaller', 'MarcaTaller.prg')
      ENDWITH

      IF VARTYPE(THIS.oMaquina) <> 'O' THEN
         MESSAGEBOX([No se puede crear el objeto 'Maquina'.], 0+16, THIS.Name + '.Init()')
         RETURN .F.
      ENDIF

      IF VARTYPE(THIS.oMarca) <> 'O' THEN
         MESSAGEBOX([No se puede crear el objeto 'Marca'.], 0+16, THIS.Name + '.Init()')
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
   FUNCTION SetMaquina
      LPARAMETER tnMaquina

      * inicio { validación de parámetro }
      IF VARTYPE(tnMaquina) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnMaquina' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetMaquina()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nMaquina = tnMaquina

      WITH THIS
         .nMaquina = tnMaquina
         .ActualizarNombre2()
      ENDWITH
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetMarca
      LPARAMETER tnMarca

      * inicio { validación de parámetro }
      IF VARTYPE(tnMarca) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnMarca' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetMarca()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      WITH THIS
         .nMarca = tnMarca
         .ActualizarNombre2()
      ENDWITH
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
   FUNCTION GetNombre2
      RETURN THIS.cNombre2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetMaquina
      RETURN THIS.nMaquina
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetMaquinaNombre
      RETURN THIS.oMaquina.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetMaquinaVigente
      RETURN THIS.oMaquina.GetVigente()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetMarca
      RETURN THIS.nMarca
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetMarcaNombre
      RETURN THIS.oMarca.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetMarcaVigente
      RETURN THIS.oMarca.GetVigente()
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

      LOCAL llRetorno, lcCursor, lcSql
      llRetorno = .T.
      lcCursor = CreaTemp()

      goCapaDatos.LlamarConsulta(THIS.cSql, lcCursor)

      IF ISNULL(tcCondicionFiltrado) THEN
         lcSql = 'SELECT * FROM ' + lcCursor + ' ORDER BY nombre2 INTO CURSOR ' + lcCursor
      ELSE
         lcSql = 'SELECT * FROM ' + lcCursor + ' WHERE ' + tcCondicionFiltrado + ' ORDER BY nombre2 INTO CURSOR ' + lcCursor
      ENDIF

      &lcSql

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

      LOCAL llRetorno, lcCursor, lcSql
      llRetorno = .T.
      lcCursor = CreaTemp()

      PRIVATE pnCodigo
      pnCodigo = IIF(!INLIST(VARTYPE(tnCodigo), 'L', 'X'), tnCodigo, THIS.nCodigo)

      goCapaDatos.LlamarConsulta(THIS.cSql, lcCursor)

      IF ISNULL(tcCondicionFiltrado) THEN
         lcSql = 'SELECT * FROM ' + lcCursor + ' WHERE ' + THIS.cClavePrimaria + ' = ' + ALLTRIM(STR(pnCodigo)) + ' INTO CURSOR ' + lcCursor
      ELSE
         lcSql = 'SELECT * FROM ' + lcCursor + ' WHERE ' + THIS.cClavePrimaria + ' = ' + ALLTRIM(STR(pnCodigo)) + ' AND ' + tcCondicionFiltrado + ' INTO CURSOR ' + lcCursor
      ENDIF

      &lcSql

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         WITH THIS
            .nCodigo = codigo
            .cNombre = nombre
            .cNombre2 = nombre2
            .nMaquina = maquina
            .nMarca = marca
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

      LOCAL llRetorno, lcCursor, lcSql
      llRetorno = .T.
      lcCursor = CreaTemp()

      PRIVATE pcNombre
      pcNombre = UPPER(IIF(!INLIST(VARTYPE(tcNombre), 'L', 'X'), ALLTRIM(tcNombre), ALLTRIM(THIS.cNombre)))

      goCapaDatos.LlamarConsulta(THIS.cSql, lcCursor)

      IF ISNULL(tcCondicionFiltrado) THEN
         lcSql = 'SELECT * FROM ' + lcCursor + ' WHERE UPPER(nombre) LIKE [' + ALLTRIM(UPPER(pcNombre)) + '] INTO CURSOR ' + lcCursor
      ELSE
         lcSql = 'SELECT * FROM ' + lcCursor + ' WHERE UPPER(nombre) LIKE [' + ALLTRIM(UPPER(pcNombre)) + '] AND ' + tcCondicionFiltrado + ' INTO CURSOR ' + lcCursor
      ENDIF

      &lcSql

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         WITH THIS
            .nCodigo = codigo
            .cNombre = nombre
            .cNombre2 = nombre2
            .nMaquina = maquina
            .nMarca = marca
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
   FUNCTION BuscarPorNombre2
      LPARAMETER tcNombre2, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF EMPTY(IIF(!INLIST(VARTYPE(tcNombre2), 'L', 'X'), tcNombre2, THIS.cNombre2)) THEN
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

      LOCAL llRetorno, lcCursor, lcSql
      llRetorno = .T.
      lcCursor = CreaTemp()

      PRIVATE pcNombre2
      pcNombre2 = UPPER(IIF(!INLIST(VARTYPE(tcNombre2), 'L', 'X'), ALLTRIM(tcNombre2), ALLTRIM(THIS.cNombre2)))

      goCapaDatos.LlamarConsulta(THIS.cSql, lcCursor)

      IF ISNULL(tcCondicionFiltrado) THEN
         lcSql = 'SELECT * FROM ' + lcCursor + ' WHERE UPPER(nombre2) LIKE [' + ALLTRIM(UPPER(pcNombre2)) + '] INTO CURSOR ' + lcCursor
      ELSE
         lcSql = 'SELECT * FROM ' + lcCursor + ' WHERE UPPER(nombre2) LIKE [' + ALLTRIM(UPPER(pcNombre2)) + '] AND ' + tcCondicionFiltrado + ' INTO CURSOR ' + lcCursor
      ENDIF

      &lcSql

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         WITH THIS
            .nCodigo = codigo
            .cNombre = nombre
            .cNombre2 = nombre2
            .nMaquina = maquina
            .nMarca = marca
            .lVigente = IIF(vigente = 0, .F., .T.)
         ENDWITH

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorNombre2()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado más de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorNombre2()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorNombre2()')
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
      llExiste = loModelo.BuscarPorNombre(THIS.cNombre, 'maquina = ' + ALLTRIM(STR(THIS.nMaquina)) + ' AND marca = ' + ALLTRIM(STR(THIS.nMarca)))

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
   FUNCTION ValidarMaquina()
      IF !BETWEEN(THIS.nMaquina, 1, 65535) THEN
         MESSAGEBOX([El maquinato debe ser un valor entre 1 y 65535.], 0+16, THIS.Name + '.ValidarMaquina()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.oMaquina.GetNombre()) THEN
         MESSAGEBOX('El maquinato no existe.', 0+16, THIS.Name + '.ValidarMaquina()')
         RETURN .F.
      ENDIF

      LOCAL llRetorno, loModelo, llExiste
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorNombre(THIS.cNombre, 'maquina = ' + ALLTRIM(STR(THIS.nMaquina)) + ' AND marca = ' + ALLTRIM(STR(THIS.nMarca)))

      DO CASE
      CASE THIS.nBandera = 1   && Agregar.
         IF llExiste THEN
            MESSAGEBOX('El modelo ya existe.', 0+16, THIS.Name + '.ValidarMaquina()')
            llRetorno = .F.
         ENDIF
      CASE THIS.nBandera = 2   && Modificar.
         IF llExiste AND loModelo.GetCodigo() <> THIS.nCodigo THEN
            MESSAGEBOX('El modelo ya existe.', 0+16, THIS.Name + '.ValidarMaquina()')
            llRetorno = .F.
         ENDIF
      ENDCASE

      IF !THIS.oMaquina.GetVigente() THEN
         MESSAGEBOX('El maquinato no está vigente.', 0+16, THIS.Name + '.ValidarMaquina()')
         llRetorno = .F.
      ENDIF

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarMarca()
      IF !BETWEEN(THIS.nMarca, 1, 65535) THEN
         MESSAGEBOX([La marca debe ser un valor entre 1 y 65535.], 0+16, THIS.Name + '.ValidarMarca()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.oMarca.GetNombre()) THEN
         MESSAGEBOX('La marca no existe.', 0+16, THIS.Name + '.ValidarMarca()')
         RETURN .F.
      ENDIF

      LOCAL llRetorno, loModelo, llExiste
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorNombre(THIS.cNombre, 'maquina = ' + ALLTRIM(STR(THIS.nMaquina)) + ' AND marca = ' + ALLTRIM(STR(THIS.nMarca)))

      DO CASE
      CASE THIS.nBandera = 1   && Agregar.
         IF llExiste THEN
            MESSAGEBOX('El modelo ya existe.', 0+16, THIS.Name + '.ValidarMarca()')
            llRetorno = .F.
         ENDIF
      CASE THIS.nBandera = 2   && Modificar.
         IF llExiste AND loModelo.GetCodigo() <> THIS.nCodigo THEN
            MESSAGEBOX('El modelo ya existe.', 0+16, THIS.Name + '.ValidarMarca()')
            llRetorno = .F.
         ENDIF
      ENDCASE

      IF !THIS.oMarca.GetVigente() THEN
         MESSAGEBOX('La marca no está vigente.', 0+16, THIS.Name + '.ValidarMarca()')
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

      IF !THIS.ValidarMaquina() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarMarca() THEN
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Agregar
      LOCAL llRetorno
      llRetorno = .T.
      THIS.nBandera = 1

      IF THIS.Validar() THEN
         PRIVATE pnCodigo, pcNombre, pnMaquina, pnMarca, plVigente
         pnCodigo = THIS.nCodigo
         pcNombre = THIS.cNombre
         pnMaquina = THIS.nMaquina
         pnMarca = THIS.nMarca
         plVigente = IIF(!THIS.lVigente, 0, 1)

         IF goCapaDatos.AgregarRegistro(THIS.cTabla, ;
                                        'codigo, nombre, maquina, marca, vigente', ;
                                        '?pnCodigo, ?pcNombre, ?pnMaquina, ?pnMarca, ?plVigente')
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
         PRIVATE pnCodigo, pcNombre, pnMaquina, pnMarca, plVigente
         pnCodigo = THIS.nCodigo
         pcNombre = THIS.cNombre
         pnMaquina = THIS.nMaquina
         pnMarca = THIS.nMarca
         plVigente = IIF(!THIS.lVigente, 0, 1)

         IF goCapaDatos.ModificarRegistro(THIS.cTabla, ;
                                          'nombre = ?pcNombre, maquina = ?pnMaquina, marca = ?pnMarca, vigente = ?plVigente', ;
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

      * Órdenes de Trabajo.
      IF llRetorno THEN
         lcTablaRelacionada = 'ot'
         lnCantidadRegistro = goCapaDatos.RecuperarValor(lcTablaRelacionada, ;
                                                         'COUNT(*) AS cantidad', ;
                                                         THIS.cClaveForanea + ' = ?pnCodigo')
         IF VARTYPE(lnCantidadRegistro) = 'C' THEN
            lnCantidadRegistro = VAL(lnCantidadRegistro)
         ENDIF

         IF lnCantidadRegistro > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Órdenes de Trabajo', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
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
   PROTECTED FUNCTION ActualizarNombre2
      IF !THIS.oMaquina.BuscarPorCodigo(THIS.nMaquina) THEN   && El registro no existe.
         WITH THIS.oMaquina
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF

      IF !THIS.oMarca.BuscarPorCodigo(THIS.nMarca) THEN   && El registro no existe.
         WITH THIS.oMarca
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF

      THIS.cNombre2 = ALLTRIM(ALLTRIM(THIS.oMaquina.GetNombre()) + ' ' + ALLTRIM(THIS.oMarca.GetNombre())) + ' ' + THIS.cNombre
   ENDFUNC
ENDDEFINE