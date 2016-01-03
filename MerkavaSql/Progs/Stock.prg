DEFINE CLASS Stock AS CUSTOM
   * Propiedades.
   PROTECTED cTabla           && Nombre de la tabla a la cual hace referencia el modelo.

   * Campos.
   PROTECTED nSucursal
   PROTECTED nDeposito
   PROTECTED nArticulo
   PROTECTED nCantidad
   PROTECTED nServicio
   PROTECTED nComprometido
   PROTECTED nSolicitado
   PROTECTED cUbicacion
   PROTECTED nMinimo
   PROTECTED nMaximo

   * Objetos.
   PROTECTED oSucursal
   PROTECTED oDeposito
   PROTECTED oArticulo

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Init
      WITH THIS
         .cTabla = 'stock'

         .nSucursal = 0
         .nDeposito = 0
         .nArticulo = 0
         .nCantidad = 0
         .nServicio = 0
         .nComprometido = 0
         .nSolicitado = 0
         .cUbicacion = ''
         .nMinimo = 0
         .nMaximo = 0

         .oSucursal = NEWOBJECT('Sucursal', 'Sucursal.prg')
         .oDeposito = NEWOBJECT('Deposito', 'Deposito.prg')
         .oArticulo = NEWOBJECT('Articulo', 'Articulo.prg')
      ENDWITH

      IF VARTYPE(THIS.oSucursal) <> 'O' THEN
         MESSAGEBOX([No se puede crear el objeto 'Sucursal'.], 0+16, THIS.Name + '.Init()')
         RETURN .F.
      ENDIF

      IF VARTYPE(THIS.oDeposito) <> 'O' THEN
         MESSAGEBOX([No se puede crear el objeto 'Deposito'.], 0+16, THIS.Name + '.Init()')
         RETURN .F.
      ENDIF

      IF VARTYPE(THIS.oArticulo ) <> 'O' THEN
         MESSAGEBOX([No se puede crear el objeto 'Articulo'.], 0+16, THIS.Name + '.Init()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Destroy
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION SetSucursal
      LPARAMETER tnSucursal

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnSucursal) <> 'N' THEN
         MESSAGEBOX([El par�metro 'tnSucursal' debe ser de tipo num�rico.], 0+16, THIS.Name + '.SetSucursal()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.nSucursal = tnSucursal

      IF !THIS.oSucursal.BuscarPorCodigo(THIS.nSucursal) THEN   && El registro no existe.
         WITH THIS.oSucursal
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION SetDeposito
      LPARAMETER tnDeposito

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnDeposito) <> 'N' THEN
         MESSAGEBOX([El par�metro 'tnDeposito' debe ser de tipo num�rico.], 0+16, THIS.Name + '.SetDeposito()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.nDeposito = tnDeposito

      IF !THIS.oDeposito.BuscarPorCodigo(THIS.nDeposito) THEN   && El registro no existe.
         WITH THIS.oDeposito
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION SetArticulo
      LPARAMETER tnArticulo

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnArticulo) <> 'N' THEN
         MESSAGEBOX([El par�metro 'tnArticulo' debe ser de tipo num�rico.], 0+16, THIS.Name + '.SetArticulo()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.nArticulo = tnArticulo

      IF !THIS.oArticulo.BuscarPorCodigo(THIS.nArticulo) THEN   && El registro no existe.
         WITH THIS.oArticulo
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION SetCantidad
      LPARAMETER tnCantidad

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnCantidad) <> 'N' THEN
         MESSAGEBOX([El par�metro 'tnCantidad' debe ser de tipo num�rico.], 0+16, THIS.Name + '.SetCantidad()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.nCantidad = tnCantidad
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION SetServicio
      LPARAMETER tnServicio

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnServicio) <> 'N' THEN
         MESSAGEBOX([El par�metro 'tnServicio' debe ser de tipo num�rico.], 0+16, THIS.Name + '.SetServicio()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.nServicio = tnServicio
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION SetComprometido
      LPARAMETER tnComprometido

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnComprometido) <> 'N' THEN
         MESSAGEBOX([El par�metro 'tnComprometido' debe ser de tipo num�rico.], 0+16, THIS.Name + '.SetComprometido()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.nComprometido = tnComprometido
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION SetSolicitado
      LPARAMETER tnSolicitado

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnSolicitado) <> 'N' THEN
         MESSAGEBOX([El par�metro 'tnSolicitado' debe ser de tipo num�rico.], 0+16, THIS.Name + '.SetSolicitado()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.nSolicitado = tnSolicitado
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetUbicacion
      LPARAMETER tcUbicacion

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tcUbicacion) <> 'C' THEN
         MESSAGEBOX([El par�metro 'tcUbicacion' debe ser de tipo texto.], 0+16, THIS.Name + '.SetUbicacion()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.cUbicacion = tcUbicacion
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION SetMinimo
      LPARAMETER tnMinimo

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnMinimo) <> 'N' THEN
         MESSAGEBOX([El par�metro 'tnMinimo' debe ser de tipo num�rico.], 0+16, THIS.Name + '.SetMinimo()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.nMinimo = tnMinimo
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION SetMaximo
      LPARAMETER tnMaximo

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnMaximo) <> 'N' THEN
         MESSAGEBOX([El par�metro 'tnMaximo' debe ser de tipo num�rico.], 0+16, THIS.Name + '.SetMaximo()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.nMaximo = tnMaximo
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetSucursal
      RETURN THIS.nSucursal
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetSucursalNombre
      RETURN THIS.oSucursal.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetSucursalVigente
      RETURN THIS.oSucursal.GetVigente()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetDeposito
      RETURN THIS.nDeposito
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetDepositoNombre
      RETURN THIS.oDeposito.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetDepositoVigente
      RETURN THIS.oDeposito.GetVigente()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetArticulo
      RETURN THIS.nArticulo
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetArticuloNombre
      RETURN THIS.oArticulo.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetArticuloVigente
      RETURN THIS.oArticulo.GetVigente()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetCantidad
      RETURN THIS.nCantidad
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetServicio
      RETURN THIS.nServicio
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetComprometido
      RETURN THIS.nComprometido
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetSolicitado
      RETURN THIS.nSolicitado
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetEnStock
      RETURN THIS.nCantidad - THIS.nServicio
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetDisponible
      RETURN THIS.GetEnStock() + THIS.nSolicitado - THIS.nComprometido
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetUbicacion
      RETURN THIS.cUbicacion
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetMinimo
      RETURN THIS.nMinimo
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetMaximo
      RETURN THIS.nMaximo
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

      LOCAL llRetorno, lcCursor, lnAreaTrabajo, lcOrden
      llRetorno = .T.
      lcCursor = CreaTemp()

      * Guarda el �rea de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' ORDER BY nombre', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE ' + tcCondicionFiltrado + ' ORDER BY nombre', lcCursor)
      ENDIF

      * Copia todos los registros al cursor que se ha pasado como par�metro.
      SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)

      SELECT (lcCursor)
      USE

      * Restaura el �rea de trabajo original.
      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
         SET ORDER TO (lcOrden)
      ENDIF

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION BuscarPorSucursal
      LPARAMETER tnSucursal, tcCondicionFiltrado, tcCursor

      * inicio { validaci�n de par�metro }
      IF EMPTY(IIF(!INLIST(VARTYPE(tnSucursal), 'L', 'X'), tnSucursal, THIS.nSucursal)) THEN
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

      LOCAL llRetorno, lcCursor, lnAreaTrabajo, lcOrden
      llRetorno = .T.
      lcCursor = CreaTemp()

      * Guarda el �rea de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

      PRIVATE pnSucursal
      pnSucursal = IIF(!INLIST(VARTYPE(tnSucursal), 'L', 'X'), tnSucursal, THIS.nSucursal)

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE sucursal = ?pnSucursal', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE sucursal = ?pnSucursal AND ' + tcCondicionFiltrado, lcCursor)
      ENDIF

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.BuscarPorSucursal()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado m�s de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El par�metro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorSucursal()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.BuscarPorSucursal()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      ENDCASE

      SELECT (lcCursor)
      USE

      * Restaura el �rea de trabajo original.
      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
         SET ORDER TO (lcOrden)
      ENDIF

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION BuscarPorDeposito
      LPARAMETER tnDeposito, tcCondicionFiltrado, tcCursor

      * inicio { validaci�n de par�metro }
      IF EMPTY(IIF(!INLIST(VARTYPE(tnDeposito), 'L', 'X'), tnDeposito, THIS.nDeposito)) THEN
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

      LOCAL llRetorno, lcCursor, lnAreaTrabajo, lcOrden
      llRetorno = .T.
      lcCursor = CreaTemp()

      * Guarda el �rea de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

      PRIVATE pnDeposito
      pnDeposito = IIF(!INLIST(VARTYPE(tnDeposito), 'L', 'X'), tnDeposito, THIS.nDeposito)

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE deposito = ?pnDeposito', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE deposito = ?pnDeposito AND ' + tcCondicionFiltrado, lcCursor)
      ENDIF

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.BuscarPorDeposito()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado m�s de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El par�metro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorDeposito()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.BuscarPorDeposito()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      ENDCASE

      SELECT (lcCursor)
      USE

      * Restaura el �rea de trabajo original.
      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
         SET ORDER TO (lcOrden)
      ENDIF

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION BuscarPorArticulo
      LPARAMETER tnArticulo, tcCondicionFiltrado, tcCursor

      * inicio { validaci�n de par�metro }
      IF EMPTY(IIF(!INLIST(VARTYPE(tnArticulo), 'L', 'X'), tnArticulo, THIS.nArticulo)) THEN
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

      LOCAL llRetorno, lcCursor, lnAreaTrabajo, lcOrden
      llRetorno = .T.
      lcCursor = CreaTemp()

      * Guarda el �rea de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

      PRIVATE pnArticulo
      pnArticulo = IIF(!INLIST(VARTYPE(tnArticulo), 'L', 'X'), tnArticulo, THIS.nArticulo)

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE articulo = ?pnArticulo', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE articulo = ?pnArticulo AND ' + tcCondicionFiltrado, lcCursor)
      ENDIF

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.BuscarPorArticulo()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado m�s de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El par�metro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorArticulo()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.BuscarPorArticulo()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      ENDCASE

      SELECT (lcCursor)
      USE

      * Restaura el �rea de trabajo original.
      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
         SET ORDER TO (lcOrden)
      ENDIF

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION BuscarPorSucursalDeposito
      LPARAMETER tnSucursal, tnDeposito, tcCondicionFiltrado, tcCursor

      * inicio { validaci�n de par�metro }
      IF EMPTY(IIF(!INLIST(VARTYPE(tnSucursal), 'L', 'X'), tnSucursal, THIS.nSucursal)) THEN
         RETURN .F.
      ENDIF

      IF EMPTY(IIF(!INLIST(VARTYPE(tnDeposito), 'L', 'X'), tnDeposito, THIS.nDeposito)) THEN
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

      LOCAL llRetorno, lcCursor, lnAreaTrabajo, lcOrden
      llRetorno = .T.
      lcCursor = CreaTemp()

      * Guarda el �rea de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

      PRIVATE pnSucursal, pnDeposito
      pnSucursal = IIF(!INLIST(VARTYPE(tnSucursal), 'L', 'X'), tnSucursal, THIS.nSucursal)
      pnDeposito = IIF(!INLIST(VARTYPE(tnDeposito), 'L', 'X'), tnDeposito, THIS.nDeposito)

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE sucursal = ?pnSucursal AND deposito = ?pnDeposito', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE sucursal = ?pnSucursal AND deposito = ?pnDeposito AND ' + tcCondicionFiltrado, lcCursor)
      ENDIF

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.BuscarPorSucursalDeposito()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado m�s de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El par�metro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorSucursalDeposito()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.BuscarPorSucursalDeposito()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      ENDCASE

      SELECT (lcCursor)
      USE

      * Restaura el �rea de trabajo original.
      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
         SET ORDER TO (lcOrden)
      ENDIF

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION BuscarPorSucursalDepositoArticulo
      LPARAMETER tnSucursal, tnDeposito, tnArticulo, tcCondicionFiltrado, tcCursor

      * inicio { validaci�n de par�metro }
      IF EMPTY(IIF(!INLIST(VARTYPE(tnSucursal), 'L', 'X'), tnSucursal, THIS.nSucursal)) THEN
         RETURN .F.
      ENDIF

      IF EMPTY(IIF(!INLIST(VARTYPE(tnDeposito), 'L', 'X'), tnDeposito, THIS.nDeposito)) THEN
         RETURN .F.
      ENDIF

      IF EMPTY(IIF(!INLIST(VARTYPE(tnArticulo), 'L', 'X'), tnArticulo, THIS.nArticulo)) THEN
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

      LOCAL llRetorno, lcCursor, lnAreaTrabajo, lcOrden
      llRetorno = .T.
      lcCursor = CreaTemp()

      * Guarda el �rea de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

      PRIVATE pnSucursal, pnDeposito, pnArticulo
      pnSucursal = IIF(!INLIST(VARTYPE(tnSucursal), 'L', 'X'), tnSucursal, THIS.nSucursal)
      pnDeposito = IIF(!INLIST(VARTYPE(tnDeposito), 'L', 'X'), tnDeposito, THIS.nDeposito)
      pnArticulo = IIF(!INLIST(VARTYPE(tnArticulo), 'L', 'X'), tnArticulo, THIS.nArticulo)

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE sucursal = ?pnSucursal AND deposito = ?pnDeposito AND articulo = ?pnArticulo', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE sucursal = ?pnSucursal AND deposito = ?pnDeposito AND articulo = ?pnArticulo AND ' + tcCondicionFiltrado, lcCursor)
      ENDIF

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.BuscarPorSucursalDepositoArticulo()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado m�s de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El par�metro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorSucursalDepositoArticulo()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.BuscarPorSucursalDepositoArticulo()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      ENDCASE

      SELECT (lcCursor)
      USE

      * Restaura el �rea de trabajo original.
      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
         SET ORDER TO (lcOrden)
      ENDIF

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION CargarDatos
      WITH THIS
         .SetSucursal(sucursal)
         .SetDeposito(deposito)
         .SetArticulo(articulo)
         .SetCantidad(cantidad)
         .SetServicio(servicio)
         .SetComprometido(comprometido)
         .SetSolicitado(solicitado)
         .SetUbicacion(ubicacion)
         .SetMinimo(minimo)
         .SetMaximo(maximo)
      ENDWITH
   ENDFUNC
ENDDEFINE