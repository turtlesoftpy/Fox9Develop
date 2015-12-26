DEFINE CLASS TimbradoComp AS CUSTOM
   * Propiedades.
   PROTECTED nBandera
   PROTECTED cTabla           && Nombre de la tabla a la cual hace referencia el modelo.
   PROTECTED cSql             && Contiene la consulta personalizada a la base de datos.

   * Campos.
   PROTECTED nProveedor
   PROTECTED nTimbrado
   PROTECTED nTipoDocuCompSet
   PROTECTED nEstablecimiento
   PROTECTED nPuntoExpedicion
   PROTECTED dFechaDesde
   PROTECTED dFechaHasta
   PROTECTED nRangoDesde
   PROTECTED nRangoHasta

   * Objetos.
   PROTECTED oProveedor
   PROTECTED oTipoDocuCompSet

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Init
      WITH THIS
         .nBandera = 0
         .cTabla = 'timbradocomp'
         .cSql = 'SELECT ' + ;
                    'a.proveedor, ' + ;
                    'a.timbrado, ' + ;
                    'a.tipodocucomp_set, ' + ;
                    'a.establecimiento, ' + ;
                    'a.punto_expedicion, ' + ;
                    'a.fecha_desde, ' + ;
                    'a.fecha_hasta, ' + ;
                    'a.rango_desde, ' + ;
                    'a.rango_hasta, ' + ;
                    'b.ruc, ' + ;
                    'b.nombre, ' + ;
                    'c.nombre AS documento ' + ;
                 'FROM ' + ;
                     .cTabla + ' a ' + ;
                    'INNER JOIN proveedor b ' + ;
                       'ON a.proveedor = b.codigo ' + ;
                    'INNER JOIN tipodocucomp_set c ' + ;
                       'ON a.tipodocucomp_set = c.codigo'

         .nProveedor = 0
         .nTimbrado = 0
         .nTipoDocuCompSet = 0
         .nEstablecimiento = 0
         .nPuntoExpedicion = 0
         .dFechaDesde = 0
         .dFechaHasta = 0
         .nRangoDesde = 0
         .nRangoHasta = 0

         .oProveedor = NEWOBJECT('Proveedor', 'Proveedor.prg')
         .oTipoDocuCompSet = NEWOBJECT('TipoDocuCompSet', 'TipoDocuCompSet.prg')
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
   FUNCTION SetProveedor
      LPARAMETER tnProveedor

      * inicio { validación de parámetro }
      IF VARTYPE(tnProveedor) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnProveedor' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetProveedor()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nProveedor = tnProveedor

      IF !THIS.oProveedor.BuscarPorCodigo(THIS.nProveedor) THEN   && El registro no existe.
         WITH THIS.oProveedor
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetTimbrado
      LPARAMETER tnTimbrado

      * inicio { validación de parámetro }
      IF VARTYPE(tnTimbrado) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnTimbrado' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetTimbrado()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nTimbrado = tnTimbrado
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetTipoDocuCompSet
      LPARAMETER tnTipoDocuCompSet

      * inicio { validación de parámetro }
      IF VARTYPE(tnTipoDocuCompSet) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnTipoDocuCompSet' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetTipoDocuCompSet()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nTipoDocuCompSet = tnTipoDocuCompSet

      IF !THIS.oTipoDocuCompSet.BuscarPorCodigo(THIS.nTipoDocuCompSet) THEN   && El registro no existe.
         WITH THIS.oTipoDocuCompSet
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetEstablecimiento
      LPARAMETER tnEstablecimiento

      * inicio { validación de parámetro }
      IF VARTYPE(tnEstablecimiento) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnEstablecimiento' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetEstablecimiento()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nEstablecimiento = tnEstablecimiento
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetPuntoExpedicion
      LPARAMETER tnPuntoExpedicion

      * inicio { validación de parámetro }
      IF VARTYPE(tnPuntoExpedicion) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnPuntoExpedicion' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetPuntoExpedicion()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nPuntoExpedicion = tnPuntoExpedicion
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetFechaDesde
      LPARAMETER tdFechaDesde

      * inicio { validación de parámetro }
      IF VARTYPE(tdFechaDesde) <> 'D' THEN
         MESSAGEBOX([El parámetro 'tdFechaDesde' debe ser de tipo fecha.], 0+16, THIS.Name + '.SetFechaDesde()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.dFechaDesde = tdFechaDesde
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetFechaHasta
      LPARAMETER tdFechaHasta

      * inicio { validación de parámetro }
      IF VARTYPE(tdFechaHasta) <> 'D' THEN
         MESSAGEBOX([El parámetro 'tdFechaHasta' debe ser de tipo fecha.], 0+16, THIS.Name + '.SetFechaHasta()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.dFechaHasta = tdFechaHasta
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetRangoDesde
      LPARAMETER tnRangoDesde

      * inicio { validación de parámetro }
      IF VARTYPE(tnRangoDesde) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnRangoDesde' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetRangoDesde()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nRangoDesde = tnRangoDesde
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetRangoHasta
      LPARAMETER tnRangoHasta

      * inicio { validación de parámetro }
      IF VARTYPE(tnRangoHasta) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnRangoHasta' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetRangoHasta()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nRangoHasta = tnRangoHasta
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetProveedor
      RETURN THIS.nProveedor
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetProveedorCodigo
      LPARAMETER tcRuc, tcDV

      * inicio { validación de parámetro }
      IF VARTYPE(tcRuc) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcRuc' debe ser de tipo texto.], 0+16, THIS.Name + '.GetProveedorCodigo()')
         RETURN 0
      ENDIF

      IF VARTYPE(tcDV) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcDV' debe ser de tipo texto.], 0+16, THIS.Name + '.GetProveedorCodigo()')
         RETURN 0
      ENDIF
      * fin { validación de parámetro }

      LOCAL lnRetorno, loModelo
      lnRetorno = 0
      loModelo = NEWOBJECT('Proveedor', 'Proveedor.prg')

      IF loModelo.BuscarPorRUCyDV(tcRuc, tcDV) THEN
         lnRetorno = loModelo.GetCodigo()
      ENDIF

      RETURN lnRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetProveedorNombre
      RETURN THIS.oProveedor.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetProveedorRuc
      RETURN THIS.oProveedor.GetRuc()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetProveedorDV
      RETURN THIS.oProveedor.GetDV()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetProveedorVigente
      RETURN THIS.oProveedor.GetVigente()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetTimbrado
      RETURN THIS.nTimbrado
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetTipoDocuCompSet
      RETURN THIS.nTipoDocuCompSet
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetTipoDocuCompSetNombre
      RETURN THIS.oTipoDocuCompSet.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetTipoDocuCompSetVigente
      RETURN THIS.oTipoDocuCompSet.GetVigente()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetEstablecimiento
      RETURN THIS.nEstablecimiento
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPuntoExpedicion
      RETURN THIS.nPuntoExpedicion
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetFechaDesde
      RETURN THIS.dFechaDesde
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetFechaHasta
      RETURN THIS.dFechaHasta
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetRangoDesde
      RETURN THIS.nRangoDesde
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetRangoHasta
      RETURN THIS.nRangoHasta
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
         lcSql = 'SELECT * FROM ' + lcCursor + ' ORDER BY timbrado INTO CURSOR ' + lcCursor
      ELSE
         lcSql = 'SELECT * FROM ' + lcCursor + ' WHERE ' + tcCondicionFiltrado + ' ORDER BY timbrado INTO CURSOR ' + lcCursor
      ENDIF

      &lcSql

      * Copia todos los registros al cursor que se ha pasado como parámetro.
      SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)

      SELECT (lcCursor)
      USE

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION BuscarPorProveedor
      LPARAMETER tnProveedor, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF EMPTY(IIF(!INLIST(VARTYPE(tnProveedor), 'L', 'X'), tnProveedor, THIS.nProveedor)) THEN
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

      PRIVATE pnProveedor
      pnProveedor = IIF(!INLIST(VARTYPE(tnProveedor), 'L', 'X'), tnProveedor, THIS.nProveedor)

      goCapaDatos.LlamarConsulta(THIS.cSql, lcCursor)

      IF ISNULL(tcCondicionFiltrado) THEN
         lcSql = 'SELECT * FROM ' + lcCursor + ' WHERE proveedor = ' + ALLTRIM(STR(pnProveedor)) + ' INTO CURSOR ' + lcCursor
      ELSE
         lcSql = 'SELECT * FROM ' + lcCursor + ' WHERE proveedor = ' + ALLTRIM(STR(pnProveedor)) + ' AND ' + tcCondicionFiltrado + ' INTO CURSOR ' + lcCursor
      ENDIF

      &lcSql

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorProveedor()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado más de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorProveedor()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorProveedor()')
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
   FUNCTION BuscarPorTimbrado
      LPARAMETER tnTimbrado, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF EMPTY(IIF(!INLIST(VARTYPE(tnTimbrado), 'L', 'X'), tnTimbrado, THIS.nTimbrado)) THEN
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

      PRIVATE pnTimbrado
      pnTimbrado = IIF(!INLIST(VARTYPE(tnTimbrado), 'L', 'X'), tnTimbrado, THIS.nTimbrado)

      goCapaDatos.LlamarConsulta(THIS.cSql, lcCursor)

      IF ISNULL(tcCondicionFiltrado) THEN
         lcSql = 'SELECT * FROM ' + lcCursor + ' WHERE timbrado = ' + ALLTRIM(STR(pnTimbrado)) + ' INTO CURSOR ' + lcCursor
      ELSE
         lcSql = 'SELECT * FROM ' + lcCursor + ' WHERE timbrado = ' + ALLTRIM(STR(pnTimbrado)) + ' AND ' + tcCondicionFiltrado + ' INTO CURSOR ' + lcCursor
      ENDIF

      &lcSql

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorTimbrado()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado más de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorTimbrado()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorTimbrado()')
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
   FUNCTION BuscarPorTipoDocuCompSet
      LPARAMETER tnTipoDocuCompSet, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF EMPTY(IIF(!INLIST(VARTYPE(tnTipoDocuCompSet), 'L', 'X'), tnTipoDocuCompSet, THIS.nTipoDocuCompSet)) THEN
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

      PRIVATE pnTipoDocuCompSet
      pnTipoDocuCompSet = IIF(!INLIST(VARTYPE(tnTipoDocuCompSet), 'L', 'X'), tnTipoDocuCompSet, THIS.nTipoDocuCompSet)

      goCapaDatos.LlamarConsulta(THIS.cSql, lcCursor)

      IF ISNULL(tcCondicionFiltrado) THEN
         lcSql = 'SELECT * FROM ' + lcCursor + ' WHERE tipodocucomp_set = ' + ALLTRIM(STR(pnTipoDocuCompSet)) + ' INTO CURSOR ' + lcCursor
      ELSE
         lcSql = 'SELECT * FROM ' + lcCursor + ' WHERE tipodocucomp_set = ' + ALLTRIM(STR(pnTipoDocuCompSet)) + ' AND ' + tcCondicionFiltrado + ' INTO CURSOR ' + lcCursor
      ENDIF

      &lcSql

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorTipoDocuCompSet()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado más de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorTipoDocuCompSet()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorTipoDocuCompSet()')
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
   FUNCTION BuscarPorRuc
      LPARAMETER tcRuc, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF VARTYPE(tcRuc) <> 'C' THEN
         LOCAL loModelo
         loModelo = NEWOBJECT('Proveedor', 'Proveedor.prg')
         tcRuc = IIF(loModelo.BuscarPorCodigo(THIS.nProveedor), loModelo.GetRuc(), '')
         RELEASE loModelo
      ENDIF

      IF EMPTY(tcRuc) THEN
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

      PRIVATE pcRuc
      pcRuc = UPPER(ALLTRIM(tcRuc))

      goCapaDatos.LlamarConsulta(THIS.cSql, lcCursor)

      IF ISNULL(tcCondicionFiltrado) THEN
         lcSql = 'SELECT * FROM ' + lcCursor + ' WHERE UPPER(ruc) LIKE [' + pcRuc + '] INTO CURSOR ' + lcCursor
      ELSE
         lcSql = 'SELECT * FROM ' + lcCursor + ' WHERE UPPER(ruc) LIKE [' + pcRuc + '] AND ' + tcCondicionFiltrado + ' INTO CURSOR ' + lcCursor
      ENDIF

      &lcSql

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorRuc()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado más de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorTipoDocuCompSet()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorTipoDocuCompSet()')
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
   FUNCTION ValidarRuc()
      LPARAMETER tcRuc

      * inicio { validación de parámetro }
      IF VARTYPE(tcRuc) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcRuc' debe ser de tipo texto.], 0+16, THIS.Name + '.ValidarRuc()')
         RETURN .F.
      ENDIF

      IF EMPTY(tcRuc) THEN
         MESSAGEBOX('El RUC no puede quedar en blanco.', 0+16, THIS.Name + '.ValidarRuc()')
         RETURN .F.
      ENDIF

      IF LEN(tcRuc) > 15 THEN
         MESSAGEBOX([La longitud del parámetro 'tcRuc' debe ser como máximo de 15 caracteres.], 0+16, THIS.Name + '.ValidarRuc()')
         RETURN .F.
      ENDIF

      IF !ValidarFormatoRUC(tcRUC) THEN
         MESSAGEBOX('El RUC digitado es incorrecto, debe ser numérico, solo se permite una letra cuando se trata de cédula de identidad.', 0+16, THIS.Name + '.ValidarRuc()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarDV()
      LPARAMETER tcRuc, tcDV

      * inicio { validación de parámetro }
      IF !THIS.ValidarRuc(tcRuc) THEN
         RETURN .F.
      ENDIF

      IF VARTYPE(tcDV) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcDV' debe ser de tipo texto.], 0+16, THIS.Name + '.ValidarDV()')
         RETURN .F.
      ENDIF

      IF EMPTY(tcDV) THEN
         MESSAGEBOX('El DV no puede quedar en blanco.', 0+16, THIS.Name + '.ValidarDV()')
         RETURN .F.
      ENDIF

      IF LEN(tcDV) > 1 THEN
         MESSAGEBOX([La longitud del parámetro 'tcDV' debe ser como máximo de 1 caracter.], 0+16, THIS.Name + '.ValidarDV()')
         RETURN .F.
      ENDIF

      IF STR(calcular_dv_11_a(tcRUC, 11), 1) <> tcDV THEN
         MESSAGEBOX('El Dígito Verificador no corresponde.', 0+16, THIS.Name + '.ValidarDV()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      LOCAL loModelo
      loModelo = NEWOBJECT('Proveedor', 'Proveedor.prg')

      IF !loModelo.BuscarPorRUCyDV(tcRUC, tcDV) THEN
         MESSAGEBOX('El proveedor no existe.', 0+16, THIS.Name + '.ValidarDV()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarProveedor()
      IF !BETWEEN(THIS.nProveedor, 1, 32767) THEN
         MESSAGEBOX([El proveedor debe ser un valor entre 1 y 32767.], 0+16, THIS.Name + '.ValidarProveedor()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.oProveedor.GetNombre()) THEN
         MESSAGEBOX('El proveedor no existe.', 0+16, THIS.Name + '.ValidarProveedor()')
         RETURN .F.
      ENDIF

      IF !THIS.oProveedor.GetVigente() THEN
         MESSAGEBOX('El proveedor no está vigente.', 0+16, THIS.Name + '.ValidarProveedor()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarTimbrado()
      IF THIS.nTimbrado < 1 THEN
         MESSAGEBOX('El timbrado debe ser mayor que cero.', 0+16, THIS.Name + '.ValidarTimbrado()')
         RETURN .F.
      ENDIF

      IF THIS.nTimbrado > 2147483647 THEN
         MESSAGEBOX('El timbrado debe ser menor que 2147483647.', 0+16, THIS.Name + '.ValidarTimbrado()')
         RETURN .F.
      ENDIF

      IF !BETWEEN(THIS.nTimbrado, 10000000, 99999999) THEN
         MESSAGEBOX('El número de timbrado de poseer mínimamente 8 dígitos.', 0+16, THIS.Name + '.ValidarTimbrado()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarTipoDocuCompSet()
      IF !BETWEEN(THIS.nTipoDocuCompSet, 1, 32767) THEN
         MESSAGEBOX([El tipo de documento debe ser un valor entre 1 y 32767.], 0+16, THIS.Name + '.ValidarTipoDocuCompSet()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.oTipoDocuCompSet.GetNombre()) THEN
         MESSAGEBOX('El tipo de documento no existe.', 0+16, THIS.Name + '.ValidarTipoDocuCompSet()')
         RETURN .F.
      ENDIF

      IF !THIS.oTipoDocuCompSet.GetVigente() THEN
         MESSAGEBOX('El tipo de documento no está vigente.', 0+16, THIS.Name + '.ValidarTipoDocuCompSet()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarEstablecimiento()
      IF THIS.nEstablecimiento < 1 THEN
         MESSAGEBOX('El establecimiento debe ser mayor que cero.', 0+16, THIS.Name + '.ValidarEstablecimiento()')
         RETURN .F.
      ENDIF

      IF THIS.nEstablecimiento > 999 THEN
         MESSAGEBOX('El establecimiento debe ser menor que 1 mil.', 0+16, THIS.Name + '.ValidarEstablecimiento()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPuntoExpedicion()
      IF THIS.nPuntoExpedicion < 1 THEN
         MESSAGEBOX('El punto de expedición debe ser mayor que cero.', 0+16, THIS.Name + '.ValidarPuntoExpedicion()')
         RETURN .F.
      ENDIF

      IF THIS.nPuntoExpedicion > 999 THEN
         MESSAGEBOX('El punto de expedición debe ser menor que 1 mil.', 0+16, THIS.Name + '.ValidarPuntoExpedicion()')
         RETURN .F.
      ENDIF

      LOCAL llRetorno, loModelo, llExiste
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorTimbrado(THIS.nTimbrado, 'tipodocucomp_set = ' + ALLTRIM(STR(THIS.nTipoDocuCompSet)) + ' AND establecimiento = ' + ALLTRIM(STR(THIS.nEstablecimiento)) + ' AND punto_expedicion = ' + ALLTRIM(STR(THIS.nPuntoExpedicion)))

      DO CASE
      CASE THIS.nBandera = 1   && Agregar.
         IF llExiste THEN
            MESSAGEBOX('El timbrado ya existe.', 0+16, THIS.Name + '.ValidarPuntoExpedicion()')
            llRetorno = .F.
         ENDIF
      CASE THIS.nBandera = 2   && Modificar.
         IF !llExiste THEN
            MESSAGEBOX('El timbrado no existe.', 0+16, THIS.Name + '.ValidarPuntoExpedicion()')
            llRetorno = .F.
         ENDIF
      ENDCASE

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarFechaDesde()
      IF !EMPTY(THIS.dFechaDesde) THEN
         IF THIS.dFechaDesde > _DATE() THEN
            MESSAGEBOX([La fecha inicio vigencia debe ser menor o igual que la fecha actual.], 0+16, THIS.Name + '.ValidarFechaDesde()')
            RETURN .F.
         ENDIF
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarFechaHasta()
      IF EMPTY(THIS.dFechaHasta) THEN
         MESSAGEBOX([La fecha fin vigencia no puede quedar en blanco.], 0+16, THIS.Name + '.ValidarFechaHasta()')
         RETURN .F.
      ENDIF

      IF THIS.dFechaHasta < _DATE() THEN
         MESSAGEBOX([La fecha fin vigencia debe ser mayor que la fecha actual.], 0+16, THIS.Name + '.ValidarFechaHasta()')
         RETURN .F.
      ENDIF

      IF !EMPTY(THIS.dFechaDesde) THEN
         IF THIS.dFechaHasta < THIS.dFechaDesde THEN
            MESSAGEBOX([La fecha fin vigencia debe ser mayor que la fecha de inicio.], 0+16, THIS.Name + '.ValidarFechaHasta()')
            RETURN .F.
         ENDIF

         IF (THIS.dFechaHasta - THIS.dFechaDesde) > 396 THEN
            MESSAGEBOX([La vigencia del timbrado no puede exceder de un año.], 0+16, THIS.Name + '.ValidarFechaHasta()')
            RETURN .F.
         ENDIF
      ELSE
         IF (THIS.dFechaHasta - _DATE()) > 396 THEN
            MESSAGEBOX([La vigencia del timbrado no puede exceder de un año.], 0+16, THIS.Name + '.ValidarFechaHasta()')
            RETURN .F.
         ENDIF
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarRangoDesde()
      IF THIS.nRangoDesde < 0 THEN
         MESSAGEBOX([El 'rango desde' del documento debe ser mayor o igual que cero.], 0+16, THIS.Name + '.ValidarRangoDesde()')
         RETURN .F.
      ENDIF

      IF THIS.nRangoDesde > 9999999 THEN
         MESSAGEBOX([El 'rango desde' del documento debe ser menor que 10 millones.], 0+16, THIS.Name + '.ValidarRangoDesde()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarRangoHasta()
      IF THIS.nRangoHasta < 0 THEN
         MESSAGEBOX([El 'rango hasta' del documento debe ser mayor o igual que cero.], 0+16, THIS.Name + '.ValidarRangoHasta()')
         RETURN .F.
      ENDIF

      IF THIS.nRangoHasta > 9999999 THEN
         MESSAGEBOX([El 'rango hasta' del documento debe ser menor que 10 millones.], 0+16, THIS.Name + '.ValidarRangoHasta()')
         RETURN .F.
      ENDIF

      IF THIS.nRangoDesde > THIS.nRangoHasta THEN
         MESSAGEBOX([El 'rango hasta' del documento debe ser mayor que el 'rango desde'.], 0+16, THIS.Name + '.ValidarRangoHasta()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Validar
      IF !THIS.ValidarProveedor() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarTimbrado() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarTipoDocuCompSet() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarEstablecimiento() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarPuntoExpedicion() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarFechaDesde() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarFechaHasta() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarRangoDesde() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarRangoHasta() THEN
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION CargarDatos
      WITH THIS
         .nProveedor = proveedor
         .nTimbrado = timbrado
         .nTipoDocuCompSet = tipodocucomp_set
         .nEstablecimiento = establecimiento
         .nPuntoExpedicion = punto_expedicion
         .dFechaDesde = IIF(!ISNULL(fecha_desde), fecha_desde, {})
         .dFechaHasta = fecha_hasta
         .nRangoDesde = IIF(!ISNULL(rango_desde), rango_desde, 0)
         .nRangoHasta = IIF(!ISNULL(rango_hasta), rango_hasta, 0)
      ENDWITH
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Agregar
      LOCAL llRetorno
      llRetorno = .T.
      THIS.nBandera = 1

      IF THIS.Validar() THEN
         PRIVATE pnProveedor, pnTimbrado, pnTipoDocuCompSet, pnEstablecimiento, pnPuntoExpedicion, ;
                 pdFechaDesde, pdFechaHasta, pnRangoDesde, pnRangoHasta

         pnProveedor = THIS.nProveedor
         pnTimbrado = THIS.nTimbrado
         pnTipoDocuCompSet = THIS.nTipoDocuCompSet
         pnEstablecimiento = THIS.nEstablecimiento
         pnPuntoExpedicion = THIS.nPuntoExpedicion
         pdFechaDesde = IIF(!EMPTY(THIS.dFechaDesde), THIS.dFechaDesde, NULL)
         pdFechaHasta = THIS.dFechaHasta
         pnRangoDesde = IIF(!EMPTY(THIS.nRangoDesde), THIS.nRangoDesde, NULL)
         pnRangoHasta = IIF(!EMPTY(THIS.nRangoHasta), THIS.nRangoHasta, NULL)

         IF goCapaDatos.AgregarRegistro(THIS.cTabla, ;
                                        'proveedor, timbrado, tipodocucomp_set, establecimiento, punto_expedicion, ' + ;
                                        'fecha_desde, fecha_hasta, rango_desde, rango_hasta', ;
                                        '?pnProveedor, ?pnTimbrado, ?pnTipoDocuCompSet, ?pnEstablecimiento, ?pnPuntoExpedicion, ' + ;
                                        '?pdFechaDesde, ?pdFechaHasta, ?pnRangoDesde, ?pnRangoHasta')
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
         PRIVATE pnProveedor, pnTimbrado, pnTipoDocuCompSet, pnEstablecimiento, pnPuntoExpedicion, ;
                 pdFechaDesde, pdFechaHasta, pnRangoDesde, pnRangoHasta

         pnProveedor = THIS.nProveedor
         pnTimbrado = THIS.nTimbrado
         pnTipoDocuCompSet = THIS.nTipoDocuCompSet
         pnEstablecimiento = THIS.nEstablecimiento
         pnPuntoExpedicion = THIS.nPuntoExpedicion
         pdFechaDesde = IIF(!EMPTY(THIS.dFechaDesde), THIS.dFechaDesde, NULL)
         pdFechaHasta = THIS.dFechaHasta
         pnRangoDesde = IIF(!EMPTY(THIS.nRangoDesde), THIS.nRangoDesde, NULL)
         pnRangoHasta = IIF(!EMPTY(THIS.nRangoHasta), THIS.nRangoHasta, NULL)

         IF goCapaDatos.ModificarRegistro(THIS.cTabla, ;
                                          'fecha_desde = ?pdFechaDesde, fecha_hasta = ?pdFechaHasta, rango_desde = ?pnRangoDesde, rango_hasta = ?pnRangoHasta', ;
                                          'proveedor = ?pnProveedor AND timbrado = ?pnTimbrado AND tipodocucomp_set = ?pnTipoDocuCompSet AND establecimiento = ?pnEstablecimiento AND punto_expedicion = ?pnPuntoExpedicion')
            WAIT 'Registro almacenado correctamente.' WINDOW NOWAIT
         ENDIF
      ELSE
         llRetorno = .F.
      ENDIF

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Borrar
      LPARAMETER tnProveedor, tnTimbrado, tnTipoDocuCompSet, tnEstablecimiento, tnPuntoExpedicion

      * inicio { integridad referencial }
      WAIT 'Comprobando integridad referencial, por favor espere...' WINDOW NOWAIT

      LOCAL llRetorno, loModelo, llExiste, lcTablaRelacionada, lnCantidadRegistro
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')

      PRIVATE pnProveedor, pnTimbrado, pnTipoDocuCompSet, pnEstablecimiento, pnPuntoExpedicion
      pnProveedor = IIF(!INLIST(VARTYPE(tnProveedor), 'L', 'X'), tnProveedor, THIS.nProveedor)
      pnTimbrado = IIF(!INLIST(VARTYPE(tnTimbrado), 'L', 'X'), tnTimbrado, THIS.nTimbrado)
      pnTipoDocuCompSet = IIF(!INLIST(VARTYPE(tnTipoDocuCompSet), 'L', 'X'), tnTipoDocuCompSet, THIS.nTipoDocuCompSet)
      pnEstablecimiento = IIF(!INLIST(VARTYPE(tnEstablecimiento), 'L', 'X'), tnEstablecimiento, THIS.nEstablecimiento)
      pnPuntoExpedicion = IIF(!INLIST(VARTYPE(tnPuntoExpedicion), 'L', 'X'), tnPuntoExpedicion, THIS.nPuntoExpedicion)
      llExiste = loModelo.BuscarPorProveedor(pnProveedor, 'timbrado = ' + ALLTRIM(STR(pnTimbrado)) + ' AND tipodocucomp_set = ' + ALLTRIM(STR(pnTipoDocuCompSet)) + ' AND establecimiento = ' + ALLTRIM(STR(pnEstablecimiento)) + ' AND punto_expedicion = ' + ALLTRIM(STR(pnPuntoExpedicion)))

      IF !llExiste THEN
         WAIT CLEAR
         MESSAGEBOX([Timbrado  '] + ALLTRIM(STR(pnTimbrado)) + ['] + CHR(13) + ;
                    [Proveedor '] + ALLTRIM(STR(pnProveedor)) + [ - ] + ALLTRIM(THIS.GetProveedorNombre()) + ['] + CHR(13) + ;
                    [Tipo de Documento '] + ALLTRIM(STR(pnTipoDocuCompSet)) + [ - ] + ALLTRIM(THIS.GetTipoDocuCompSetNombre()) + ['] + CHR(13) + ;
                    [Establecimiento '] + ALLTRIM(STR(pnEstablecimiento)) + ['] + CHR(13) + ;
                    [Punto Expedición '] + ALLTRIM(STR(pnPuntoExpedicion)) + ['] + CHR(13) + ;
                    [¡ N O    E X I S T E !], 0+16, THIS.Name + '.Borrar()')
         llRetorno = .F.
      ENDIF

      * Compras.
      IF llRetorno THEN
         lcTablaRelacionada = 'cabecomp'
         lnCantidadRegistro = goCapaDatos.RecuperarValor(lcTablaRelacionada, ;
                                                         'COUNT(*) AS cantidad', ;
                                                         'proveedor = ?pnProveedor AND timbrado = ?pnTimbrado AND tipodocucomp_set = ?pnTipoDocuCompSet AND establecimiento = ?pnEstablecimiento AND punto_expedicion = ?pnPuntoExpedicion')
         IF VARTYPE(lnCantidadRegistro) = 'C' THEN
            lnCantidadRegistro = VAL(lnCantidadRegistro)
         ENDIF

         IF lnCantidadRegistro > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Compras', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF
      * fin { integridad referencial }

      IF llRetorno THEN
         IF goCapaDatos.BorrarRegistro(THIS.cTabla, ;
                                       proveedor = ?pnProveedor AND timbrado = ?pnTimbrado AND tipodocucomp_set = ?pnTipoDocuCompSet AND establecimiento = ?pnEstablecimiento AND punto_expedicion = ?pnPuntoExpedicion')
            WAIT 'Registro borrado exitosamente.' WINDOW NOWAIT
         ENDIF
      ENDIF

      RETURN llRetorno
   ENDFUNC
ENDDEFINE