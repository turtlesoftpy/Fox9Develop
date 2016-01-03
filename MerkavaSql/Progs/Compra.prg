DEFINE CLASS Compra AS CUSTOM
   * Propiedades.
   PROTECTED nBandera
   PROTECTED cTabla           && Nombre de la tabla a la cual hace referencia el modelo.
   PROTECTED cClavePrimaria   && Nombre de la clave primaria de la tabla.
   PROTECTED cClaveForanea    && Nombre con el cual se hace referencia a la clave primaria en otras tablas.

   * Campos.
   PROTECTED nCodCompra
   PROTECTED nTipoDocu
   PROTECTED nEstablecimiento
   PROTECTED nPuntoExpedicion
   PROTECTED nNroDocu
   PROTECTED nProveedor
   PROTECTED cCondicionCompra
   PROTECTED dFechaDocu
   PROTECTED nMoneda
   PROTECTED nTipoCambio
   PROTECTED nTipoCambioSet
   PROTECTED nPlazo
   PROTECTED nCantidadCuota
   PROTECTED nSucursal
   PROTECTED nDeposito
   PROTECTED nTimbrado
   PROTECTED nPorcDesc
   PROTECTED nImportDesc
   PROTECTED nMontoDocu
   PROTECTED nMontoNDeb
   PROTECTED nMontoNCre
   PROTECTED nMontoPago
   PROTECTED cComentario

   * Objetos.
   PROTECTED oTipoDocu
   PROTECTED oProveedor
   PROTECTED oMoneda
   PROTECTED oPlazo
   PROTECTED oSucursal
   PROTECTED oDeposito
   PROTECTED oTimbrado

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Init
      WITH THIS
         .nBandera = 0
         .cTabla = 'cabecomp'
         .cClavePrimaria = 'codcompra'
         .cClaveForanea = 'codcompra'

         .nCodCompra = 0
         .nTipoDocu = 0
         .nEstablecimiento = 0
         .nPuntoExpedicion = 0
         .nNroDocu = 0
         .nProveedor = 0
         .cCondicionCompra = ''
         .dFechaDocu = {}
         .nMoneda = 0
         .nTipoCambio = 0
         .nTipoCambioSet = 0
         .nPlazo = 0
         .nCantidadCuota = 0
         .nSucursal = 0
         .nDeposito = 0
         .nTimbrado = 0
         .nPorcDesc = 0
         .nImportDesc = 0
         .nMontoDocu = 0
         .nMontoNDeb = 0
         .nMontoNCre = 0
         .nMontoPago = 0
         .cComentario = ''

         .oTipoDocu = NEWOBJECT('TipoDocuComp', 'TipoDocuComp.prg')
         .oProveedor = NEWOBJECT('Proveedor', 'Proveedor.prg')
         .oMoneda = NEWOBJECT('Moneda', 'Moneda.prg')
         .oPlazo = NEWOBJECT('Plazo', 'Plazo.prg')
         .oSucursal = NEWOBJECT('Sucursal', 'Sucursal.prg')
         .oDeposito = NEWOBJECT('Deposito', 'Deposito.prg')
         .oTimbrado = NEWOBJECT('TimbradoCompra', 'TimbradoCompra.prg')
      ENDWITH

      IF VARTYPE(THIS.oTipoDocu) <> 'O' THEN
         MESSAGEBOX([No se puede crear el objeto 'TipoDocu'.], 0+16, THIS.Name + '.Init()')
         RETURN .F.
      ENDIF

      IF VARTYPE(THIS.oProveedor) <> 'O' THEN
         MESSAGEBOX([No se puede crear el objeto 'Proveedor'.], 0+16, THIS.Name + '.Init()')
         RETURN .F.
      ENDIF

      IF VARTYPE(THIS.oMoneda) <> 'O' THEN
         MESSAGEBOX([No se puede crear el objeto 'Moneda'.], 0+16, THIS.Name + '.Init()')
         RETURN .F.
      ENDIF

      IF VARTYPE(THIS.oPlazo) <> 'O' THEN
         MESSAGEBOX([No se puede crear el objeto 'Plazo'.], 0+16, THIS.Name + '.Init()')
         RETURN .F.
      ENDIF

      IF VARTYPE(THIS.oSucursal) <> 'O' THEN
         MESSAGEBOX([No se puede crear el objeto 'Sucursal'.], 0+16, THIS.Name + '.Init()')
         RETURN .F.
      ENDIF

      IF VARTYPE(THIS.oDeposito) <> 'O' THEN
         MESSAGEBOX([No se puede crear el objeto 'Deposito'.], 0+16, THIS.Name + '.Init()')
         RETURN .F.
      ENDIF

      IF VARTYPE(THIS.oTimbrado) <> 'O' THEN
         MESSAGEBOX([No se puede crear el objeto 'Timbrado'.], 0+16, THIS.Name + '.Init()')
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
      LPARAMETER tnCodCompra

      * inicio { validación de parámetro }
      IF VARTYPE(tnCodCompra) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnCodCompra' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetCodigo()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nCodCompra = tnCodCompra
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetTipoDocu
      LPARAMETER tnTipoDocu

      * inicio { validación de parámetro }
      IF VARTYPE(tnTipoDocu) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnTipoDocu' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetTipoDocu()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nTipoDocu = tnTipoDocu

      IF !THIS.oTipoDocu.BuscarPorCodigo(THIS.nTipoDocu) THEN   && El registro no existe.
         WITH THIS.oTipoDocu
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
   FUNCTION SetNroDocu
      LPARAMETER tnNroDocu

      * inicio { validación de parámetro }
      IF VARTYPE(tnNroDocu) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnNroDocu' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetNroDocu()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nNroDocu = tnNroDocu
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
   FUNCTION SetCondicionCompra
      LPARAMETER tcCondicionCompra

      * inicio { validación de parámetro }
      IF VARTYPE(tcCondicionCompra) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcCondicionCompra' debe ser de tipo texto.], 0+16, THIS.Name + '.SetCondicionCompra()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cCondicionCompra = tcCondicionCompra
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetFechaDocu
      LPARAMETER tdFechaDocu

      * inicio { validación de parámetro }
      IF VARTYPE(tdFechaDocu) <> 'D' THEN
         MESSAGEBOX([El parámetro 'tdFechaDocu' debe ser de tipo fecha.], 0+16, THIS.Name + '.SetFechaDocu()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.dFechaDocu = tdFechaDocu
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetMoneda
      LPARAMETER tnMoneda

      * inicio { validación de parámetro }
      IF VARTYPE(tnMoneda) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnMoneda' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetMoneda()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nMoneda = tnMoneda

      IF !THIS.oMoneda.BuscarPorCodigo(THIS.nMoneda) THEN   && El registro no existe.
         WITH THIS.oMoneda
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetTipoCambio
      LPARAMETER tnTipoCambio

      * inicio { validación de parámetro }
      IF VARTYPE(tnTipoCambio) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnTipoCambio' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetTipoCambio()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nTipoCambio = tnTipoCambio
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetTipoCambioSet
      LPARAMETER tnTipoCambioSet

      * inicio { validación de parámetro }
      IF VARTYPE(tnTipoCambioSet) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnTipoCambioSet' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetTipoCambioSet()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nTipoCambioSet = tnTipoCambioSet
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetPlazo
      LPARAMETER tnPlazo

      * inicio { validación de parámetro }
      IF VARTYPE(tnPlazo) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnPlazo' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetPlazo()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nPlazo = tnPlazo

      IF !THIS.oPlazo.BuscarPorCodigo(THIS.nPlazo) THEN   && El registro no existe.
         WITH THIS.oPlazo
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetCantidadCuota
      LPARAMETER tnCantidadCuota

      * inicio { validación de parámetro }
      IF VARTYPE(tnCantidadCuota) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnCantidadCuota' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetCantidadCuota()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nCantidadCuota = tnCantidadCuota
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
   FUNCTION SetPorcDesc
      LPARAMETER tnPorcDesc

      * inicio { validación de parámetro }
      IF VARTYPE(tnPorcDesc) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnPorcDesc' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetPorcDesc()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nPorcDesc = tnPorcDesc
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetImportDesc
      LPARAMETER tnImportDesc

      * inicio { validación de parámetro }
      IF VARTYPE(tnImportDesc) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnImportDesc' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetImportDesc()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nImportDesc = tnImportDesc
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetMontoDocu
      LPARAMETER tnMontoDocu

      * inicio { validación de parámetro }
      IF VARTYPE(tnMontoDocu) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnMontoDocu' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetMontoDocu()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nMontoDocu = tnMontoDocu
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetMontoNDeb
      LPARAMETER tnMontoNDeb

      * inicio { validación de parámetro }
      IF VARTYPE(tnMontoNDeb) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnMontoNDeb' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetMontoNDeb()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nMontoNDeb = tnMontoNDeb
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetMontoNCre
      LPARAMETER tnMontoNCre

      * inicio { validación de parámetro }
      IF VARTYPE(tnMontoNCre) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnMontoNCre' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetMontoNCre()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nMontoNCre = tnMontoNCre
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetMontoPago
      LPARAMETER tnMontoPago

      * inicio { validación de parámetro }
      IF VARTYPE(tnMontoPago) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnMontoPago' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetMontoPago()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nMontoPago = tnMontoPago
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
   FUNCTION GetCodigo
      RETURN THIS.nCodCompra
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetTipoDocu
      RETURN THIS.nTipoDocu
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetTipoDocuNombre
      RETURN THIS.oTipoDocu.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetTipoDocuVigente
      RETURN THIS.oTipoDocu.GetVigente()
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
   FUNCTION GetNroDocu
      RETURN THIS.nNroDocu
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetProveedor
      RETURN THIS.nProveedor
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetProveedorNombre
      RETURN THIS.oProveedor.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetProveedorVigente
      RETURN THIS.oProveedor.GetVigente()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetCondicionCompra
      RETURN THIS.cCondicionCompra
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetCondicionCompraNombre
      LOCAL lcRetorno

      DO CASE
      CASE THIS.cCondicionCompra = '1'
         lcRetorno = 'CONTADO'
      CASE THIS.cCondicionCompra = '2'
         lcRetorno = 'CREDITO'
      OTHERWISE
         lcRetorno = ''
      ENDCASE

      RETURN lcRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetFechaDocu
      RETURN THIS.dFechaDocu
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetMoneda
      RETURN THIS.nMoneda
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetMonedaNombre
      RETURN THIS.oMoneda.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetMonedaVigente
      RETURN THIS.oMoneda.GetVigente()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetTipoCambio
      RETURN THIS.nTipoCambio
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetTipoCambioSet
      RETURN THIS.nTipoCambioSet
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPlazo
      RETURN THIS.nPlazo
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPlazoNombre
      RETURN THIS.oPlazo.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPlazoVigente
      RETURN THIS.oPlazo.GetVigente()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetCantidadCuota
      RETURN THIS.nCantidadCuota
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPlazoCantidadCuota
      RETURN THIS.oPlazo.GetNumVtos()
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
   FUNCTION GetTimbrado
      RETURN THIS.nTimbrado
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPorcDesc
      RETURN THIS.nPorcDesc
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetImportDesc
      RETURN THIS.nImportDesc
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetMontoDocu
      RETURN THIS.nMontoDocu
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetMontoNDeb
      RETURN THIS.nMontoNDeb
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetMontoNCre
      RETURN THIS.nMontoNCre
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetMontoPago
      RETURN THIS.nMontoPago
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetMontoPago
      RETURN THIS.nMontoPago
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetComentario
      RETURN THIS.cComentario
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetNuevoCodigo()
      LOCAL lnRetorno, lnAreaTrabajo, lcOrden

      * Guarda el área de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

      lnRetorno = goCapaDatos.RecuperarValor(THIS.cTabla, 'COALESCE(MAX(codcompra), 0) + 1 AS codcompra')

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
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' ORDER BY nombre', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE ' + tcCondicionFiltrado + ' ORDER BY nombre', lcCursor)
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
      LPARAMETER tnCodCompra, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF EMPTY(IIF(!INLIST(VARTYPE(tnCodCompra), 'L', 'X'), tnCodCompra, THIS.nCodCompra)) THEN
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

      PRIVATE pnCodCompra
      pnCodCompra = IIF(!INLIST(VARTYPE(tnCodCompra), 'L', 'X'), tnCodCompra, THIS.nCodCompra)

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE ' + THIS.cClavePrimaria + ' = ?pnCodCompra', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE ' + THIS.cClavePrimaria + ' = ?pnCodCompra AND ' + tcCondicionFiltrado, lcCursor)
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
   FUNCTION BuscarPorNroDocu
      LPARAMETER tnNroDocu, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF EMPTY(IIF(!INLIST(VARTYPE(tnNroDocu), 'L', 'X'), tnNroDocu, THIS.nNroDocu)) THEN
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

      PRIVATE pnNroDocu
      pnNroDocu = UPPER(IIF(!INLIST(VARTYPE(tnNroDocu), 'L', 'X'), ALLTRIM(tnNroDocu), ALLTRIM(THIS.nNroDocu)))

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE nrodocu = ?pnNroDocu', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE nrodocu = ?pnNroDocu AND ' + tcCondicionFiltrado, lcCursor)
      ENDIF

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorNroDocu()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado más de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorNroDocu()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorNroDocu()')
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

      LOCAL llRetorno, lcCursor, lnAreaTrabajo, lcOrden
      llRetorno = .T.
      lcCursor = CreaTemp()

      * Guarda el área de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

      PRIVATE pnProveedor
      pnProveedor = UPPER(IIF(!INLIST(VARTYPE(tnProveedor), 'L', 'X'), ALLTRIM(tnProveedor), ALLTRIM(THIS.nProveedor)))

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE proveedor = ?pnProveedor', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE proveedor = ?pnProveedor AND ' + tcCondicionFiltrado, lcCursor)
      ENDIF

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
      pdFechaDocu = UPPER(IIF(!INLIST(VARTYPE(tdFechaDocu), 'L', 'X'), ALLTRIM(tdFechaDocu), ALLTRIM(THIS.dFechaDocu)))

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE fechadocu = ?pdFechaDocu', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE fechadocu = ?pdFechaDocu AND ' + tcCondicionFiltrado, lcCursor)
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
   FUNCTION ValidarCodigo()
      IF !BETWEEN(THIS.nCodCompra, 1, 2147483647) THEN
         MESSAGEBOX([El código debe ser un valor entre 1 y 2147483647.], 0+16, THIS.Name + '.ValidarCodigo()')
         RETURN .F.
      ENDIF

      LOCAL llRetorno, loModelo, llExiste
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorCodigo(THIS.nCodCompra)

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
   FUNCTION ValidarTipoDocu()
      IF !BETWEEN(THIS.nTipoDocu, 1, 32767) THEN
         MESSAGEBOX([La tipo de documento debe ser un valor entre 1 y 32767.], 0+16, THIS.Name + '.ValidarTipoDocu()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.oTipoDocu.GetNombre()) THEN
         MESSAGEBOX('La tipo de documento no existe.', 0+16, THIS.Name + '.ValidarTipoDocu()')
         RETURN .F.
      ENDIF

      IF !THIS.oTipoDocu.GetVigente() THEN
         MESSAGEBOX('La tipo de documento no está vigente.', 0+16, THIS.Name + '.ValidarTipoDocu()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarEstablecimiento()
      IF THIS.oTipoDocu.GetTimbrado() THEN
         IF THIS.nEstablecimiento < 1 THEN
            MESSAGEBOX('El establecimiento debe ser mayor que cero.', 0+16, THIS.Name + '.ValidarEstablecimiento()')
            RETURN .F.
         ENDIF

         IF THIS.nEstablecimiento > 999 THEN
            MESSAGEBOX('El establecimiento debe ser menor que 1 mil.', 0+16, THIS.Name + '.ValidarEstablecimiento()')
            RETURN .F.
         ENDIF
      ELSE
         IF THIS.nEstablecimiento <> 0 THEN
            MESSAGEBOX([El establecimiento debe ser igual a cero.], 0+16, THIS.Name + '.ValidarEstablecimiento()')
            RETURN .F.
         ENDIF
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPuntoExpedicion()
      IF THIS.oTipoDocu.GetTimbrado() THEN
         IF THIS.nPuntoExpedicion < 1 THEN
            MESSAGEBOX('El punto de expedición debe ser mayor que cero.', 0+16, THIS.Name + '.ValidarPuntoExpedicion()')
            RETURN .F.
         ENDIF

         IF THIS.nPuntoExpedicion > 999 THEN
            MESSAGEBOX('El punto de expedición debe ser menor que 1 mil.', 0+16, THIS.Name + '.ValidarPuntoExpedicion()')
            RETURN .F.
         ENDIF
      ELSE
         IF THIS.nPuntoExpedicion <> 0 THEN
            MESSAGEBOX([El punto de expedición debe ser igual a cero.], 0+16, THIS.Name + '.ValidarPuntoExpedicion()')
            RETURN .F.
         ENDIF
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarNroDocu()
      IF THIS.nNroDocu < 1 THEN
         MESSAGEBOX('El número del documento debe ser mayor que cero.', 0+16, THIS.Name + '.ValidarNroDocu()')
         RETURN .F.
      ENDIF

      IF THIS.nNroDocu > 9999999 THEN
         MESSAGEBOX('El número del documento debe ser menor que 10 millones.', 0+16, THIS.Name + '.ValidarNroDocu()')
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
   FUNCTION ValidarCondicionCompra()
      IF LEN(THIS.cCondicionCompra) > 1 THEN
         MESSAGEBOX([La longitud del parámetro 'tcCondicionCompra' debe ser como máximo de 1 caracter.], 0+16, THIS.Name + '.ValidarCondicionCompra()')
         RETURN .F.
      ENDIF

      IF !INLIST(THIS.cCondicionCompra, '1', '2') THEN
         MESSAGEBOX([La condición de compra puede ser '1' para CONTADO o '2' para CRÉDITO.], 0+16, THIS.Name + '.ValidarCondicionCompra()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarFechaDocu()
      IF !EMPTY(THIS.dFechaDocu) THEN
         IF THIS.dFechaDocu > _DATE() THEN
            MESSAGEBOX([La fecha del documento debe ser menor o igual que la fecha actual.], 0+16, THIS.Name + '.ValidarFechaDocu()')
            RETURN .F.
         ENDIF
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarMoneda()
      IF !BETWEEN(THIS.nMoneda, 1, 32767) THEN
         MESSAGEBOX([La moneda debe ser un valor entre 1 y 32767.], 0+16, THIS.Name + '.ValidarMoneda()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.oMoneda.GetNombre()) THEN
         MESSAGEBOX('La moneda no existe.', 0+16, THIS.Name + '.ValidarMoneda()')
         RETURN .F.
      ENDIF

      IF !THIS.oMoneda.GetVigente() THEN
         MESSAGEBOX('La moneda no está vigente.', 0+16, THIS.Name + '.ValidarMoneda()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarTipoCambio()
      IF THIS.nTipoCambio < 1 THEN
         MESSAGEBOX('El tipo de cambio debe ser mayor que cero.', 0+16, THIS.Name + '.ValidarTipoCambio()')
         RETURN .F.
      ENDIF

      IF THIS.nTipoCambio > 999999.9999 THEN
         MESSAGEBOX('El tipo de cambio debe ser menor que 1 millón.', 0+16, THIS.Name + '.ValidarTipoCambio()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarTipoCambioSet()
      IF THIS.nTipoCambioSet < 0 THEN
         MESSAGEBOX('El tipo de cambio de la SET debe ser mayor o igual que cero.', 0+16, THIS.Name + '.ValidarTipoCambioSet()')
         RETURN .F.
      ENDIF

      IF THIS.nTipoCambioSet > 999999.9999 THEN
         MESSAGEBOX('El tipo de cambio de la SET debe ser menor que 1 millón.', 0+16, THIS.Name + '.ValidarTipoCambioSet()')
         RETURN .F.
      ENDIF
   ENDFUNC
   
   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPlazo()
      IF !BETWEEN(THIS.nPlazo, 0, 32767) THEN
         MESSAGEBOX([El plazo debe ser un valor entre 0 y 32767.], 0+16, THIS.Name + '.ValidarPlazo()')
         RETURN .F.
      ENDIF

      IF THIS.nPlazo <> 0 THEN
         IF EMPTY(THIS.oPlazo.GetNombre()) THEN
            MESSAGEBOX('El plazo no existe.', 0+16, THIS.Name + '.ValidarPlazo()')
            RETURN .F.
         ENDIF

         IF !THIS.oPlazo.GetVigente() THEN
            MESSAGEBOX('El plazo no está vigente.', 0+16, THIS.Name + '.ValidarPlazo()')
            RETURN .F.
         ENDIF
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarCantidadCuota()
      IF THIS.cCondicionCompra = '2' THEN
         IF THIS.nCantidadCuota < 1 THEN
            MESSAGEBOX('La cantidad de cuotas debe ser mayor que cero.', 0+16, THIS.Name + '.ValidarCantidadCuota()')
            RETURN .F.
         ENDIF

         IF THIS.nCantidadCuota > 999 THEN
            MESSAGEBOX('La cantidad de cuotas debe ser menor que 1 mil.', 0+16, THIS.Name + '.ValidarCantidadCuota()')
            RETURN .F.
         ENDIF
      ELSE
         IF THIS.nCantidadCuota <> 0 THEN
            MESSAGEBOX([La cantidad de cuotas debe ser igual a cero.], 0+16, THIS.Name + '.ValidarCantidadCuota()')
            RETURN .F.
         ENDIF
      ENDIF
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
   PROTECTED FUNCTION DepositoPerteneceSucursal
      loModelo = NEWOBJECT('Deposito', 'Deposito.prg')
      RETURN loModelo.BuscarPorCodigo(THIS.nDeposito, 'sucursal = ' + ALLTRIM(STR(THIS.nSucursal)))
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Validar
      IF !THIS.ValidarCodigo() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarTipoDocu() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarEstablecimiento() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarPuntoExpedicion() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarNroDocu() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarProveedor() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarCondicionCompra() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarFechaDocu() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarMoneda() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarTipoCambio() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarTipoCambioSet() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarPlazo() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarCantidadCuota() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarSucursal() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDeposito() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarTimbrado() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarPorcDesc() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarImportDesc() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarMontoDocu() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarMontoNDeb() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarMontoNCre() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarMontoPago() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarComentario() THEN
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION CargarDatos
      WITH THIS
         .SetCodCompra(codcompra)
         .SetTipoDocu(tipodocu)
         .SetEstablecimiento(IIF(!ISNULL(establecimiento), establecimiento, 0))
         .SetPuntoExpedicion(IIF(!ISNULL(punto_expedicion), punto_expedicion, 0))
         .SetNroDocu(nrodocu)
         .SetProveedor(proveedor)
         .SetCondicionCompra(condicion_compra)
         .SetFechaDocu(fechadocu)
         .SetMoneda(moneda)
         .SetTipoCambio(tipocambio)
         .SetTipoCambioSet(IIF(!ISNULL(tipocambio_set), tipocambio_set, 0))
         .SetPlazo(IIF(!ISNULL(plazo), plazo, 0))
         .SetCantidadCuota(IIF(!ISNULL(cantidad_cuota), cantidad_cuota, 0))
         .SetSucursal(sucursal)
         .SetDeposito(deposito)
         .SetTimbrado(IIF(!ISNULL(timbrado), timbrado, 0))
         .SetPorcDesc(porcdesc)
         .SetImportDesc(importdesc)
         .SetMontoDocu(monto_docu)
         .SetMontoNDeb(monto_ndeb)
         .SetMontoNCre(monto_ncre)
         .SetMontoPago(monto_pago)
         .SetComentario(IIF(!ISNULL(comentario), comentario, ''))
      ENDWITH
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Agregar
      LOCAL llRetorno, lnAreaTrabajo, lcOrden
      llRetorno = .T.
      
      * Guarda el área de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

      THIS.nBandera = 1

      IF THIS.Validar() THEN
         PRIVATE pnCodCompra, pcNombre, pnTipoDocu, plVigente
         pnCodCompra = THIS.nCodCompra
         pcNombre = THIS.cNombre
         pnTipoDocu = THIS.nTipoDocu
         plVigente = IIF(!THIS.lVigente, '0', '1')

         IF goCapaDatos.AgregarRegistro(THIS.cTabla, ;
                                        'codigo, nombre, departamen, vigente', ;
                                        '?pnCodCompra, ?pcNombre, ?pnTipoDocu, ?plVigente')
            WAIT 'Registro almacenado correctamente.' WINDOW NOWAIT
         ENDIF
      ELSE
         llRetorno = .F.
      ENDIF

      * Restaura el área de trabajo original.
      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
         SET ORDER TO (lcOrden)
      ENDIF

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Modificar
      LOCAL llRetorno, lnAreaTrabajo, lcOrden
      llRetorno = .T.

      * Guarda el área de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

      THIS.nBandera = 2

      IF THIS.Validar() THEN
         PRIVATE pnCodCompra, pcNombre, pnTipoDocu, plVigente
         pnCodCompra = THIS.nCodCompra
         pcNombre = THIS.cNombre
         pnTipoDocu = THIS.nTipoDocu
         plVigente = IIF(!THIS.lVigente, '0', '1')

         IF goCapaDatos.ModificarRegistro(THIS.cTabla, ;
                                          'nombre = ?pcNombre, departamen = ?pnTipoDocu, vigente = ?plVigente', ;
                                          THIS.cClavePrimaria + ' = ?pnCodCompra')
            WAIT 'Registro almacenado correctamente.' WINDOW NOWAIT
         ENDIF
      ELSE
         llRetorno = .F.
      ENDIF

      * Restaura el área de trabajo original.
      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
         SET ORDER TO (lcOrden)
      ENDIF

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Borrar
      LPARAMETER tnCodCompra

      * inicio { integridad referencial }
      WAIT 'Comprobando integridad referencial, por favor espere...' WINDOW NOWAIT

      LOCAL llRetorno, loModelo, lnAreaTrabajo, lcOrden, llExiste, lcTablaRelacionada, lnCantidadRegistro
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')

      * Guarda el área de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

      PRIVATE pnCodCompra
      pnCodCompra = IIF(!INLIST(VARTYPE(tnCodCompra), 'L', 'X'), tnCodCompra, THIS.nCodCompra)
      llExiste = loModelo.BuscarPorCodigo(pnCodCompra)

      IF !llExiste THEN
         WAIT CLEAR
         MESSAGEBOX([El código '] + ALLTRIM(STR(pnCodCompra)) + [' no existe.], 0+16, THIS.Name + '.Borrar()')
         llRetorno = .F.
      ENDIF

      * Barrios.
      IF llRetorno THEN
         lcTablaRelacionada = 'barrio'
         lnCantidadRegistro = goCapaDatos.RecuperarValor(lcTablaRelacionada, ;
                                                         'COUNT(*) AS cantidad', ;
                                                         THIS.cClaveForanea + ' = ?pnCodCompra')
         IF VARTYPE(lnCantidadRegistro) = 'C' THEN
            lnCantidadRegistro = VAL(lnCantidadRegistro)
         ENDIF

         IF lnCantidadRegistro > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Barrios', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF

      * Clientes.
      IF llRetorno THEN
         lcTablaRelacionada = 'cliente'
         lnCantidadRegistro = goCapaDatos.RecuperarValor(lcTablaRelacionada, ;
                                                         'COUNT(*) AS cantidad', ;
                                                         THIS.cClaveForanea + ' = ?pnCodCompra')
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
                                       THIS.cClavePrimaria + ' = ?pnCodCompra')
            WAIT 'Registro borrado exitosamente.' WINDOW NOWAIT
         ENDIF
      ENDIF

      * Restaura el área de trabajo original.
      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
         SET ORDER TO (lcOrden)
      ENDIF
      
      RETURN llRetorno
   ENDFUNC
ENDDEFINE