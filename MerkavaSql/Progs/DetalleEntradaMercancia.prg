DEFINE CLASS DetalleEntradaMercancia AS CUSTOM
   * Propiedades.
   PROTECTED nBandera
   PROTECTED cDetalle         && Nombre de la tabla detalle.
   PROTECTED cDetalleTemp     && Nombre de la tabla detalle temporal.´
   PROTECTED cTransaccion     && Número de transacción para la tabla temporal.

   * Campos.
   PROTECTED nCodigo
   PROTECTED nSucursal
   PROTECTED nDeposito
   PROTECTED nArticulo
   PROTECTED nCantidad

   * Objetos.
   PROTECTED oSucursal
   PROTECTED oDeposito
   PROTECTED oArticulo
   PROTECTED oStock

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Init
      WITH THIS
         .nBandera = 0
         .cDetalle = 'detaentstk'
         .cDetalleTemp = 'tmp_detaentstk'

         .nCodigo = 0
         .nSucursal = 0
         .nDeposito = 0
         .nArticulo = 0
         .nCantidad = 0

         .oSucursal = NEWOBJECT('Sucursal', 'Sucursal.prg')
         .oDeposito = NEWOBJECT('Deposito', 'Deposito.prg')
         .oArticulo = NEWOBJECT('Articulo', 'Articulo.prg')
         .oStock = NEWOBJECT('Stock', 'Stock.prg')
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

      IF VARTYPE(THIS.oStock) <> 'O' THEN
         MESSAGEBOX([No se puede crear el objeto 'Stock'.], 0+16, THIS.Name + '.Init()')
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
   FUNCTION SetTransaccion
      LPARAMETER tcTransaccion

      * inicio { validación de parámetro }
      IF VARTYPE(tcTransaccion) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcTransaccion' debe ser de tipo texto.], 0+16, THIS.Name + '.SetTransaccion()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cTransaccion = tcTransaccion
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

      THIS.nCodigo= tnCodigo
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
   FUNCTION SetArticulo
      LPARAMETER tnArticulo

      * inicio { validación de parámetro }
      IF VARTYPE(tnArticulo) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnArticulo' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetArticulo()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nArticulo = tnArticulo

      IF !THIS.oArticulo.BuscarPorCodigo(THIS.nArticulo) THEN   && El registro no existe.
         WITH THIS.oArticulo
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetCantidad
      LPARAMETER tnCantidad

      * inicio { validación de parámetro }
      IF VARTYPE(tnCantidad) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnCantidad' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetCantidad()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nCantidad = tnCantidad
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
   FUNCTION GetArticulo
      RETURN THIS.nArticulo
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetCodArticulo()
      RETURN THIS.oArticulo.GetCodArticulo()
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
   FUNCTION ValidarTransaccion()
      IF INLIST(THIS.nBandera, 1, 2) THEN   && 1 - Agregar ó 2 - Modificar.
         IF EMPTY(THIS.cTransaccion) THEN
            MESSAGEBOX('El número de transacción no puede quedar en blanco.', 0+16, THIS.Name + '.ValidarTransaccion()')
            RETURN .F.
         ENDIF

         LOCAL loEntradaMercancia
         loEntradaMercancia = NEWOBJECT('EntradaMercancia', 'EntradaMercancia.prg')

         IF !loEntradaMercancia.ExisteTransaccion(THIS.cTransaccion) THEN
            MESSAGEBOX('El número de transacción no existe en la tabla maestra.', 0+16, THIS.Name + '.ValidarTransaccion()')
            RETURN .F.
         ENDIF
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarCodigo()
      IF INLIST(THIS.nBandera, 1, 2) THEN   && 1 - Agregar ó 2 - Modificar.
         IF !BETWEEN(THIS.nCodigo, 1, 2147483647) THEN
            MESSAGEBOX([El código debe ser un valor entre 1 y 2147483647.], 0+16, THIS.Name + '.ValidarCodigo()')
            RETURN .F.
         ENDIF
      ELSE
         IF !BETWEEN(THIS.nCodigo, 0, 2147483647) THEN
            MESSAGEBOX([El código debe ser un valor entre 0 y 2147483647.], 0+16, THIS.Name + '.ValidarCodigo()')
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
   FUNCTION ValidarArticulo()
      IF !BETWEEN(THIS.nArticulo, 1, 2147483647) THEN
         MESSAGEBOX([El artículo debe ser un valor entre 1 y 2147483647.], 0+16, THIS.Name + '.ValidarArticulo()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.oArticulo.GetNombre()) THEN
         MESSAGEBOX('El artículo no existe.', 0+16, THIS.Name + '.ValidarArticulo()')
         RETURN .F.
      ENDIF

      IF !THIS.oArticulo.GetVigente() THEN
         MESSAGEBOX('El artículo no está vigente.', 0+16, THIS.Name + '.ValidarArticulo()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarCantidad()
      IF THIS.nCantidad <= 0 THEN
         MESSAGEBOX('La cantidad debe ser mayor que cero.', 0+16, THIS.Name + '.ValidarCantidad()')
         RETURN .F.
      ENDIF

      IF THIS.nCantidad > 999999.99 THEN
         MESSAGEBOX('La cantidad debe ser menor que 1 millón.', 0+16, THIS.Name + '.ValidarCantidad()')
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

      IF !THIS.ValidarArticulo() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarCantidad() THEN
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION CargarDatos
      WITH THIS
         .SetCodigo(codigo)
         .SetSucursal(sucursal)
         .SetDeposito(deposito)
         .SetArticulo(articulo)
         .SetCantidad(cantidad)
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
         PRIVATE pcTransaccion, pnCodigo, pnSucursal, pnDeposito, pnArticulo, pnCantidad

         pcTransaccion = THIS.cTransaccion
         pnCodigo = THIS.nCodigo
         pnSucursal = THIS.nSucursal
         pnDeposito = THIS.nDeposito
         pnArticulo = THIS.nArticulo
         pnCantidad = THIS.nCantidad

         IF !goCapaDatos.AgregarRegistro(THIS.cDetalleTemp, ;
                                        'transaccion, codigo, sucursal, deposito, articulo, cantidad', ;
                                        '?pcTransaccion, ?pnCodigo, ?pnSucursal, ?pnDeposito, ?pnArticulo, ?pnCantidad')
            llRetorno = .F.
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
ENDDEFINE