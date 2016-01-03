DEFINE CLASS EntradaMercancia AS CUSTOM
   * Propiedades.
   PROTECTED nBandera
   PROTECTED cMaestro         && Nombre de la tabla maestra.
   PROTECTED cMaestroTemp     && Nombre de la tabla maestra temporal.
   PROTECTED cTransaccion     && Número de transacción para la tabla temporal.
   PROTECTED cClavePrimaria   && Nombre de la clave primaria de la tabla.
   PROTECTED cClaveForanea    && Nombre con el cual se hace referencia a la clave primaria en otras tablas.
   PROTECTED aDetalle[1,5]    && codigo, sucursal, deposito, articulo, cantidad

   * Campos.
   PROTECTED nCodigo
   PROTECTED nSucursal
   PROTECTED nDeposito
   PROTECTED dFechaDocu
   PROTECTED cComentario
   PROTECTED cConceptoDiario

   * Objetos.
   PROTECTED oSucursal
   PROTECTED oDeposito

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Init
      WITH THIS
         .nBandera = 0
         .cMaestro = 'cabeentstk'
         .cMaestroTemp = 'tmp_cabeentstk'
         .cTransaccion = SYS(3)
         .cClavePrimaria = 'codigo'
         .cClaveForanea = 'codigo'

         .nCodigo = 0
         .nSucursal = 0
         .nDeposito = 0
         .dFechaDocu = CTOT('  /  /       :  :  ')
         .cComentario = ''
         .cConceptoDiario = ''

         .oSucursal = NEWOBJECT('Sucursal', 'Sucursal.prg')
         .oDeposito = NEWOBJECT('Deposito', 'Deposito.prg')
      ENDWITH

      IF VARTYPE(THIS.oSucursal) <> 'O' THEN
         MESSAGEBOX([No se puede crear el objeto 'Sucursal'.], 0+16, THIS.Name + '.Init()')
         RETURN .F.
      ENDIF

      IF VARTYPE(THIS.oDeposito) <> 'O' THEN
         MESSAGEBOX([No se puede crear el objeto 'Deposito'.], 0+16, THIS.Name + '.Init()')
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

      IF !BETWEEN(tnBandera, 0, 3) THEN
         MESSAGEBOX([El parámetro 'tnBandera' debe ser un valor entre 0 y 3.], 0+16, THIS.Name + '.SetBandera()')
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
   FUNCTION SetSucursal
      LPARAMETER tnSucursal

      * inicio { validación de parámetro }
      IF VARTYPE(tnSucursal) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnSucursal' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetSucursal()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nSucursal = tnSucursal

      IF !THIS.oSucursal.BuscarPorCodigo(THIS.nSucursal) THEN   && El registro no existe.
         WITH THIS.oSucursal
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetDeposito
      LPARAMETER tnDeposito

      * inicio { validación de parámetro }
      IF VARTYPE(tnDeposito) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnDeposito' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetDeposito()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nDeposito = tnDeposito

      IF !THIS.oDeposito.BuscarPorCodigo(THIS.nDeposito) THEN   && El registro no existe.
         WITH THIS.oDeposito
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetFechaDocu
      LPARAMETER tdFechaDocu

      * inicio { validación de parámetro }
      IF !INLIST(VARTYPE(tdFechaDocu), 'D', 'T') THEN
         MESSAGEBOX([El parámetro 'tdFechaDocu' debe ser de tipo fecha/hora.], 0+16, THIS.Name + '.SetFechaDocu()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.dFechaDocu = tdFechaDocu
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetComentario
      LPARAMETER tcComentario

      * inicio { validación de parámetro }
      IF VARTYPE(tcComentario) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcComentario' debe ser de tipo texto.], 0+16, THIS.Name + '.SetComentario()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cComentario = tcComentario
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetConceptoDiario
      LPARAMETER tcConceptoDiario

      * inicio { validación de parámetro }
      IF VARTYPE(tcConceptoDiario) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcConceptoDiario' debe ser de tipo texto.], 0+16, THIS.Name + '.SetConceptoDiario()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cConceptoDiario = tcConceptoDiario
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetCodigo
      RETURN THIS.nCodigo
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
   FUNCTION GetFechaDocu
      RETURN THIS.dFechaDocu
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetComentario
      RETURN THIS.cComentario
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetConceptoDiario
      RETURN THIS.cConceptoDiario
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetNuevoCodigo()
      LOCAL lnRetorno, lnAreaTrabajo, lcOrden

      * Guarda el área de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

      lnRetorno = goCapaDatos.RecuperarValor(THIS.cMaestro, 'COALESCE(MAX(codigo), 0) + 1 AS codigo')

      IF VARTYPE(lnRetorno) = 'C' THEN
         lnRetorno = VAL(lnRetorno)
      ENDIF

      * Restaura el área de trabajo original.
      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
         SET ORDER TO (lcOrden)
      ENDIF

      RETURN lnRetorno
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

      LOCAL llRetorno, lcCursor, lnAreaTrabajo, lcOrden
      llRetorno = .T.
      lcCursor = CreaTemp()

      * Guarda el área de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cMaestro + ' ORDER BY codigo', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cMaestro + ' WHERE ' + tcCondicionFiltrado + ' ORDER BY codigo', lcCursor)
      ENDIF

      * Copia todos los registros al cursor que se ha pasado como parámetro.
      SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)

      SELECT (lcCursor)
      USE

      * Restaura el área de trabajo original.
      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
         SET ORDER TO (lcOrden)
      ENDIF

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

      LOCAL llRetorno, lcCursor, lnAreaTrabajo, lcOrden
      llRetorno = .T.
      lcCursor = CreaTemp()

      * Guarda el área de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

      PRIVATE pnCodigo
      pnCodigo = IIF(!INLIST(VARTYPE(tnCodigo), 'L', 'X'), tnCodigo, THIS.nCodigo)

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cMaestro + ' WHERE ' + THIS.cClavePrimaria + ' = ?pnCodigo', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cMaestro + ' WHERE ' + THIS.cClavePrimaria + ' = ?pnCodigo AND ' + tcCondicionFiltrado, lcCursor)
      ENDIF

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

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
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      ENDCASE

      SELECT (lcCursor)
      USE

      * Restaura el área de trabajo original.
      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
         SET ORDER TO (lcOrden)
      ENDIF

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION BuscarPorFechaDocu
      LPARAMETER tdFechaDocu, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF EMPTY(IIF(!INLIST(VARTYPE(tdFechaDocu), 'L', 'X'), tdFechaDocu, THIS.dFechaDocu)) THEN
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

      LOCAL llRetorno, lcCursor, lnAreaTrabajo, lcOrden
      llRetorno = .T.
      lcCursor = CreaTemp()

      * Guarda el área de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

      PRIVATE pdFechaDocu
      pdFechaDocu = IIF(!INLIST(VARTYPE(tdFechaDocu), 'L', 'X'), tdFechaDocu, THIS.dFechaDocu)

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cMaestro + ' WHERE fechadocu = ?pdFechaDocu', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cMaestro + ' WHERE fechadocu = ?pdFechaDocu AND ' + tcCondicionFiltrado, lcCursor)
      ENDIF

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorFechaDocu()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado más de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorFechaDocu()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorFechaDocu()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      ENDCASE

      SELECT (lcCursor)
      USE

      * Restaura el área de trabajo original.
      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
         SET ORDER TO (lcOrden)
      ENDIF

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarTransaccion()
      IF INLIST(THIS.nBandera, 1, 2) THEN   && 1 - Agregar ó 2 - Modificar.
         IF EMPTY(THIS.cTransaccion) THEN
            MESSAGEBOX('El número de transacción no puede quedar en blanco.', 0+16, THIS.Name + '.ValidarTransaccion()')
            RETURN .F.
         ENDIF

         LOCAL loEntradaMercancia
         loEntradaMercancia = NEWOBJECT('EntradaMercancia', 'EntradaMercancia.prg')

         IF loEntradaMercancia.ExisteTransaccion(THIS.cTransaccion) THEN
            MESSAGEBOX('El número de transacción ya existe en la tabla maestra.', 0+16, THIS.Name + '.ValidarTransaccion()')
            RETURN .F.
         ENDIF
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarCodigo()
      IF !BETWEEN(THIS.nCodigo, 1, 2147483647) THEN
         MESSAGEBOX([El código debe ser un valor entre 1 y 2147483647.], 0+16, THIS.Name + '.ValidarCodigo()')
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
   FUNCTION ValidarSucursal()
      IF !BETWEEN(THIS.nSucursal, 1, 32767) THEN
         MESSAGEBOX([La sucursal debe ser un valor entre 1 y 32767.], 0+16, THIS.Name + '.ValidarSucursal()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.oSucursal.GetNombre()) THEN
         MESSAGEBOX('La sucursal no existe.', 0+16, THIS.Name + '.ValidarSucursal()')
         RETURN .F.
      ENDIF

      IF !THIS.oSucursal.GetVigente() THEN
         MESSAGEBOX('La sucursal no está vigente.', 0+16, THIS.Name + '.ValidarSucursal()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarDeposito()
      IF !BETWEEN(THIS.nDeposito, 1, 32767) THEN
         MESSAGEBOX([El depósito debe ser un valor entre 1 y 32767.], 0+16, THIS.Name + '.ValidarDeposito()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.oDeposito.GetNombre()) THEN
         MESSAGEBOX('El depósito no existe.', 0+16, THIS.Name + '.ValidarDeposito()')
         RETURN .F.
      ENDIF

      IF !THIS.oDeposito.GetVigente() THEN
         MESSAGEBOX('El depósito no está vigente.', 0+16, THIS.Name + '.ValidarDeposito()')
         RETURN .F.
      ENDIF

      IF !THIS.DepositoPerteneceSucursal() THEN
         MESSAGEBOX([El depósito '] + ALLTRIM(STR(THIS.nDeposito)) + [ - ] + ALLTRIM(THIS.GetDepositoNombre()) + [' no pertenece a la sucursal '] + ALLTRIM(STR(THIS.nSucursal)) + [ - ] + ALLTRIM(THIS.GetSucursalNombre()) + ['.], 0+16, THIS.Name + '.ValidarDeposito()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarFechaDocu()
      IF EMPTY(THIS.dFechaDocu) THEN
         MESSAGEBOX('La fecha del documento no puede quedar en blanco.', 0+16, THIS.Name + '.ValidarFechaDocu()')
         RETURN .F.
      ENDIF

      IF THIS.dFechaDocu > _DATETIME() THEN
         MESSAGEBOX([La fecha del documento debe ser menor o igual que la fecha actual.], 0+16, THIS.Name + '.ValidarFechaDocu()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarComentario()
      IF LEN(THIS.cComentario) > 254 THEN
         MESSAGEBOX([La longitud del campo 'cComentario' debe ser como máximo de 254 caracteres.], 0+16, THIS.Name + '.ValidarComentario()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarConceptoDiario()
      IF LEN(THIS.cConceptoDiario) > 254 THEN
         MESSAGEBOX([La longitud del campo 'cConceptoDiario' debe ser como máximo de 254 caracteres.], 0+16, THIS.Name + '.ValidarConceptoDiario()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION DepositoPerteneceSucursal
      loModelo = NEWOBJECT('Deposito', 'Deposito.prg')
      RETURN loModelo.BuscarPorCodigo(THIS.nDeposito, 'sucursal = ' + ALLTRIM(STR(THIS.nSucursal)))
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Validar
      IF !THIS.ValidarTransaccion() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarCodigo() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarSucursal() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDeposito() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarFechaDocu() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarComentario() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarConceptoDiario() THEN
         RETURN .F.
      ENDIF

      IF VARTYPE(THIS.aDetalle) = 'L' THEN
         MESSAGEBOX('El documento no posee detalle.', 0+16, THIS.Name + '.Validar()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION CargarDatos
      WITH THIS
         .SetCodigo(codigo)
         .SetSucursal(sucursal)
         .SetDeposito(deposito)
         .SetFechaDocu(fechadocu)
         .SetComentario(comentario)
         .SetConceptoDiario(concepto_diario)
      ENDWITH
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Agregar
      LOCAL llRetorno, lnAreaTrabajo, lcOrden, loDetalle, lnContador
      llRetorno = .T.

      * Guarda el área de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

      THIS.nBandera = 1

      IF THIS.Validar() THEN
         PRIVATE pcTransaccion, pnCodigo, pnSucursal, pnDeposito, pdFechaDocu, pcComentario, pcConceptoDiario, ;
                 pnArticulo, pnCantidad

         pcTransaccion = THIS.cTransaccion
         pnCodigo = THIS.nCodigo
         pnSucursal = THIS.nSucursal
         pnDeposito = THIS.nDeposito
         pdFechaDocu = THIS.dFechaDocu
         pcComentario = THIS.cComentario
         pcConceptoDiario = THIS.cConceptoDiario

         * Guarda el maestro.
         IF !goCapaDatos.AgregarRegistro(THIS.cMaestroTemp, ;
                                        'transaccion, codigo, sucursal, deposito, fechadocu, comentario, concepto_diario', ;
                                        '?pcTransaccion, ?pnCodigo, ?pnSucursal, ?pnDeposito, ?pdFechaDocu, ?pcComentario, ?pcConceptoDiario')
            llRetorno = .F.
         ENDIF

         * Guarda el detalle.
         loDetalle = NEWOBJECT('DetalleEntradaMercancia', 'DetalleEntradaMercancia.prg')

         IF VARTYPE(loDetalle) <> 'O' THEN
            MESSAGEBOX([No se puede crear el objeto 'DetalleEntradaMercancia'.], 0+16, THIS.Name + '.Agregar()')
            llRetorno = .F.
         ENDIF

         IF llRetorno THEN
            FOR lnContador = 1 TO ALEN(THIS.aDetalle, 1)
               WITH loDetalle
                  .SetTransaccion(pcTransaccion)
                  .SetCodigo(pnCodigo)
                  .SetSucursal(THIS.aDetalle[lnContador, 2])
                  .SetDeposito(THIS.aDetalle[lnContador, 3])
                  .SetArticulo(THIS.aDetalle[lnContador, 4])
                  .SetCantidad(THIS.aDetalle[lnContador, 5])
               ENDWITH

               IF !loDetalle.Agregar()
                  llRetorno = .F.
               ENDIF
            ENDFOR
         ENDIF
      ELSE
         llRetorno = .F.
      ENDIF

      IF llRetorno THEN
         WAIT 'Registro almacenado correctamente.' WINDOW NOWAIT
      ENDIF

      * Restaura el área de trabajo original.
      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
         SET ORDER TO (lcOrden)
      ENDIF

      RETURN llRetorno
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION AgregarDetalle
      LPARAMETERS tnCodigo, tnSucursal, tnDeposito, tnArticulo, tnCantidad

      * inicio { validación de parámetros }
      IF PARAMETERS() < 5 THEN
         MESSAGEBOX('Muy pocos argumentos.', 0+16, THIS.Name + '.AgregarDetalle()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tnCodigo) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnCodigo' debe ser de tipo numérico.], 0+16, THIS.Name + '.AgregarDetalle()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tnSucursal) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnSucursal' debe ser de tipo numérico.], 0+16, THIS.Name + '.AgregarDetalle()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tnDeposito) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnDeposito' debe ser de tipo numérico.], 0+16, THIS.Name + '.AgregarDetalle()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tnArticulo) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnArticulo' debe ser de tipo numérico.], 0+16, THIS.Name + '.AgregarDetalle()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tnCantidad) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnCantidad' debe ser de tipo numérico.], 0+16, THIS.Name + '.AgregarDetalle()')
         RETURN .F.
      ENDIF

      LOCAL loDetalle
      loDetalle = NEWOBJECT('DetalleEntradaMercancia', 'DetalleEntradaMercancia.prg')
      
      IF VARTYPE(loDetalle) <> 'O' THEN
         MESSAGEBOX([No se puede crear el objeto 'DetalleEntradaMercancia'.], 0+16, THIS.Name + '.Init()')
         RETURN .F.
      ENDIF

      WITH loDetalle
         .SetCodigo(tnCodigo)
         .SetSucursal(tnSucursal)
         .SetDeposito(tnDeposito)
         .SetArticulo(tnArticulo)
         .SetCantidad(tnCantidad)
      ENDWITH

      IF !loDetalle.Validar() THEN
         RETURN .F.
      ENDIF
      * fin { validación de parámetros }

      LOCAL lnFilaMatriz
      lnFilaMatriz = IIF(VARTYPE(THIS.aDetalle) <> 'L', ALEN(THIS.aDetalle, 1) + 1, 1)

      DIMENSION THIS.aDetalle[lnFilaMatriz, 5]

      WITH THIS
         .aDetalle[lnFilaMatriz, 1] = tnCodigo
         .aDetalle[lnFilaMatriz, 2] = tnSucursal
         .aDetalle[lnFilaMatriz, 3] = tnDeposito
         .aDetalle[lnFilaMatriz, 4] = tnArticulo
         .aDetalle[lnFilaMatriz, 5] = tnCantidad
      ENDWITH
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION ModificarDetalle
      LPARAMETERS tnCodigoViejo, tnSucursalViejo, tnDepositoViejo, tnArticuloViejo, tnCantidadViejo, ;
                  tnCodigoNuevo, tnSucursalNuevo, tnDepositoNuevo, tnArticuloNuevo, tnCantidadNuevo

      * inicio { validación de parámetros }
      IF PARAMETERS() < 10 THEN
         MESSAGEBOX('Muy pocos argumentos.', 0+16, THIS.Name + '.ModificarDetalle()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tnCodigoViejo) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnCodigoViejo' debe ser de tipo numérico.], 0+16, THIS.Name + '.ModificarDetalle()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tnSucursalViejo) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnSucursalViejo' debe ser de tipo numérico.], 0+16, THIS.Name + '.ModificarDetalle()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tnDepositoViejo) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnDepositoViejo' debe ser de tipo numérico.], 0+16, THIS.Name + '.ModificarDetalle()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tnArticuloViejo) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnArticuloViejo' debe ser de tipo numérico.], 0+16, THIS.Name + '.ModificarDetalle()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tnCantidadViejo) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnCantidadViejo' debe ser de tipo numérico.], 0+16, THIS.Name + '.ModificarDetalle()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tnCodigoNuevo) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnCodigoNuevo' debe ser de tipo numérico.], 0+16, THIS.Name + '.ModificarDetalle()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tnSucursalNuevo) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnSucursalNuevo' debe ser de tipo numérico.], 0+16, THIS.Name + '.ModificarDetalle()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tnDepositoNuevo) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnDepositoNuevo' debe ser de tipo numérico.], 0+16, THIS.Name + '.ModificarDetalle()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tnArticuloNuevo) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnArticuloNuevo' debe ser de tipo numérico.], 0+16, THIS.Name + '.ModificarDetalle()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tnCantidadNuevo) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnCantidadNuevo' debe ser de tipo numérico.], 0+16, THIS.Name + '.ModificarDetalle()')
         RETURN .F.
      ENDIF

      IF !THIS.ExisteDetalle(tnSucursalViejo, tnDepositoViejo, tnArticuloViejo) THEN
         MESSAGEBOX('El registro de detalle a ser modificado no existe.', 0+16, THIS.Name + '.ModificarDetalle()')
         RETURN .F.
      ENDIF

      IF !THIS.ExisteDetalle(tnSucursalNuevo, tnDepositoNuevo, tnArticuloNuevo) THEN
         MESSAGEBOX('El registro de detalle a ser modificado ya existe.', 0+16, THIS.Name + '.ModificarDetalle()')
         RETURN .F.
      ENDIF

      LOCAL loDetalle
      loDetalle = NEWOBJECT('DetalleEntradaMercancia', 'DetalleEntradaMercancia.prg')
      
      IF VARTYPE(loDetalle) <> 'O' THEN
         MESSAGEBOX([No se puede crear el objeto 'DetalleEntradaMercancia'.], 0+16, THIS.Name + '.Init()')
         RETURN .F.
      ENDIF

      WITH loDetalle
         .SetCodigo(tnCodigoNuevo)
         .SetSucursal(tnSucursalNuevo)
         .SetDeposito(tnDepositoNuevo)
         .SetArticulo(tnArticuloNuevo)
         .SetCantidad(tnCantidadNuevo)
      ENDWITH

      IF !loDetalle.Validar() THEN
         RETURN .F.
      ENDIF
      * fin { validación de parámetros }

      LOCAL lnContador

      FOR lnContador = 1 TO ALEN(THIS.aDetalle, 1)
         IF THIS.aDetalle[lnContador, 1] = tnCodigoViejo AND THIS.aDetalle[lnContador, 2] = tnSucursalViejo AND THIS.aDetalle[lnContador, 3] = tnDepositoViejo AND THIS.aDetalle[lnContador, 4] = tnArticuloViejo AND THIS.aDetalle[lnContador, 5] = tnCantidadViejo THEN
            WITH THIS
               .aDetalle[lnContador, 1] = tnCodigoNuevo
               .aDetalle[lnContador, 2] = tnSucursalNuevo
               .aDetalle[lnContador, 3] = tnDepositoNuevo
               .aDetalle[lnContador, 4] = tnArticuloNuevo
               .aDetalle[lnContador, 5] = tnCantidadNuevo
            ENDWITH
         ENDIF
      ENDFOR
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION BorrarDetalle
      LPARAMETERS tnSucursal, tnDeposito, tnArticulo

      * inicio { validación de parámetros }
      IF PARAMETERS() < 3 THEN
         MESSAGEBOX('Muy pocos argumentos.', 0+16, THIS.Name + '.BorrarDetalle()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tnSucursal) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnSucursal' debe ser de tipo numérico.], 0+16, THIS.Name + '.BorrarDetalle()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tnDeposito) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnDeposito' debe ser de tipo numérico.], 0+16, THIS.Name + '.BorrarDetalle()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tnArticulo) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnArticulo' debe ser de tipo numérico.], 0+16, THIS.Name + '.BorrarDetalle()')
         RETURN .F.
      ENDIF

      IF !THIS.ExisteDetalle(tnSucursal, tnDeposito, tnArticulo) THEN
         MESSAGEBOX('El registro de detalle a ser borrado no existe.', 0+16, THIS.Name + '.BorrarDetalle()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetros }

      LOCAL laDetalle, lnContador
      ACOPY(THIS.aDetalle, laDetalle)

      * inicializa la matriz 'aDetalle'.
      DIMENSION THIS.aDetalle[1,5]
      THIS.aDetalle = .F.

      FOR lnContador = 1 TO ALEN(laDetalle, 1)
         IF laDetalle[lnContador, 2] <> tnSucursal AND laDetalle[lnContador, 3] <> tnDeposito AND laDetalle[lnContador, 4] <> tnArticulo THEN
            IF !THIS.AgregarDetalle(laDetalle[lnContador, 1], laDetalle[lnContador, 2], laDetalle[lnContador, 3], laDetalle[lnContador, 4], laDetalle[lnContador, 5]) THEN
               MESSAGEBOX('Ha ocurrido un error al intentar borrar el detalle.', 0+16, THIS.Name + '.BorrarDetalle()')
               ACOPY(laDetalle, THIS.aDetalle)   && restaura la matriz 'aDetalle'.
               RETURN .F.
            ENDIF
         ENDIF
      ENDFOR
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   PROTECTED FUNCTION ExisteDetalle
      LPARAMETERS tnSucursal, tnDeposito, tnArticulo

      * inicio { validación de parámetros }
      IF PARAMETERS() < 3 THEN
         MESSAGEBOX('Muy pocos argumentos.', 0+16, THIS.Name + '.ExisteDetalle()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tnSucursal) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnSucursal' debe ser de tipo numérico.], 0+16, THIS.Name + '.ExisteDetalle()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tnDeposito) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnDeposito' debe ser de tipo numérico.], 0+16, THIS.Name + '.ExisteDetalle()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tnArticulo) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnArticulo' debe ser de tipo numérico.], 0+16, THIS.Name + '.ExisteDetalle()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetros }

      LOCAL llExiste, lnContador
      llExiste = .F.

      FOR lnContador = 1 TO ALEN(THIS.aDetalle, 1)
         IF THIS.aDetalle[lnContador, 2] = tnSucursal AND THIS.aDetalle[lnContador, 3] = tnDeposito AND THIS.aDetalle[lnContador, 4] = tnArticulo THEN
            llExiste = .T.
            EXIT
         ENDIF
      ENDFOR

      RETURN llExiste
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION ExisteTransaccion
      LPARAMETERS tcTransaccion

      * inicio { validación de parámetro }
      IF PARAMETERS() < 1 THEN
         MESSAGEBOX('Muy pocos argumentos.', 0+16, THIS.Name + '.ExisteTransaccion()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tcTransaccion) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcTransaccion' debe ser de tipo texto.], 0+16, THIS.Name + '.ExisteTransaccion()')
         RETURN .F.
      ENDIF

      IF EMPTY(tcTransaccion) THEN
         MESSAGEBOX([El parámetro 'tcTransaccion' no puede quedar en blanco..], 0+16, THIS.Name + '.ExisteTransaccion()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      LOCAL lnAreaTrabajo, lcOrden

      * Guarda el área de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

      PRIVATE pcTransaccion, pnCantidadRegistro
      pcTransaccion = UPPER(ALLTRIM(tcTransaccion))
      pnCantidadRegistro = goCapaDatos.RecuperarValor(THIS.cMaestroTemp, 'COUNT(*) AS cantidad', 'UPPER(transaccion) LIKE ?pcTransaccion')

      IF VARTYPE(pnCantidadRegistro) = 'C' THEN
         pnCantidadRegistro = VAL(pnCantidadRegistro)
      ENDIF

      * Restaura el área de trabajo original.
      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
         SET ORDER TO (lcOrden)
      ENDIF

      RETURN IIF(pnCantidadRegistro = 1, .T., .F.)
   ENDFUNC
ENDDEFINE