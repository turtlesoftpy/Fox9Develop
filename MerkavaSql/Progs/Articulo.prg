DEFINE CLASS Articulo AS CUSTOM
   * Propiedades.
   PROTECTED nBandera
   PROTECTED cTabla           && Nombre de la tabla a la cual hace referencia el modelo.
   PROTECTED cClavePrimaria   && Nombre de la clave primaria de la tabla.
   PROTECTED cClaveForanea    && Nombre con el cual se hace referencia a la clave primaria en otras tablas.

   * Campos.
   PROTECTED nCodigo
   PROTECTED cNombre
   PROTECTED cCodArticulo
   PROTECTED cCodBarra
   PROTECTED cCodOriginal
   PROTECTED cCodAlternativo
   PROTECTED cAplicacion
   PROTECTED nFamilia
   PROTECTED nRubro
   PROTECTED nSubRubro
   PROTECTED nMarca
   PROTECTED nUnidadMedida
   PROTECTED nProveedor
   PROTECTED nPais
   PROTECTED cUbicacion
   PROTECTED lVigente
   PROTECTED lLPrecio
   PROTECTED lGravado
   PROTECTED nPorcIVA
   PROTECTED nPCostoG
   PROTECTED nPCostoD
   PROTECTED nPVentaG1
   PROTECTED nPVentaG2
   PROTECTED nPVentaG3
   PROTECTED nPVentaG4
   PROTECTED nPVentaG5
   PROTECTED nPVentaD1
   PROTECTED nPVentaD2
   PROTECTED nPVentaD3
   PROTECTED nPVentaD4
   PROTECTED nPVentaD5
   PROTECTED nStockMin
   PROTECTED nStockMax
   PROTECTED lPolInvSMin
   PROTECTED lPolInvSMax
   PROTECTED cCaracter1
   PROTECTED cCaracter2
   PROTECTED cCaracter3
   PROTECTED cOtros1
   PROTECTED cOtros2
   PROTECTED dFecUCompra
   PROTECTED dFecUVenta
   PROTECTED nStockActual
   PROTECTED nStockOt
   PROTECTED nStockComprometido
   PROTECTED nStockSolicitado

   * Objetos.
   PROTECTED oFamilia
   PROTECTED oRubro
   PROTECTED oSubRubro
   PROTECTED oMarca
   PROTECTED oUnidadMedida
   PROTECTED oProveedor
   PROTECTED oPais

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Init
      WITH THIS
         .nBandera = 0
         .cTabla = 'articulo'
         .cClavePrimaria = 'codigo'
         .cClaveForanea = 'articulo'

         .nCodigo = 0
         .cNombre = ''
         .cCodArticulo = ''
         .cCodBarra = ''
         .cCodOriginal = ''
         .cCodAlternativo = ''
         .cAplicacion = ''
         .nFamilia = 0
         .nRubro = 0
         .nSubRubro = 0
         .nMarca = 0
         .nUnidadMedida = 0
         .nProveedor = 0
         .nPais = 0
         .cUbicacion = ''
         .lVigente = .F.
         .lLPrecio = .F.
         .lGravado  = .F.
         .nPorcIVA = 0
         .nPCostoG = 0
         .nPCostoD = 0
         .nPVentaG1 = 0
         .nPVentaG2 = 0
         .nPVentaG3 = 0
         .nPVentaG4 = 0
         .nPVentaG5 = 0
         .nPVentaD1 = 0
         .nPVentaD2 = 0
         .nPVentaD3 = 0
         .nPVentaD4 = 0
         .nPVentaD5 = 0
         .nStockMin = 0
         .nStockMax = 0
         .lPolInvSMin = .F.
         .lPolInvSMax = .F.
         .cCaracter1 = ''
         .cCaracter2 = ''
         .cCaracter3 = ''
         .cOtros1 = ''
         .cOtros2 = ''
         .dFecUCompra = {}
         .dFecUVenta = {}
         .nStockActual = 0
         .nStockOt = 0
         .nStockComprometido = 0
         .nStockSolicitado = 0

         .oFamilia = NEWOBJECT('Familia', 'Familia.prg')
         .oRubro = NEWOBJECT('Rubro', 'Rubro.prg')
         .oSubRubro = NEWOBJECT('SubRubro', 'SubRubro.prg')
         .oMarca = NEWOBJECT('Marca', 'Marca.prg')
         .oUnidadMedida = NEWOBJECT('UnidadMedida', 'UnidadMedida.prg')
         .oProveedor = NEWOBJECT('Proveedor', 'Proveedor.prg')
         .oPais = NEWOBJECT('Pais', 'Pais.prg')
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
   FUNCTION SetCodArticulo
      LPARAMETER tcCodArticulo

      * inicio { validación de parámetro }
      IF VARTYPE(tcCodArticulo) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcCodArticulo' debe ser de tipo texto.], 0+16, THIS.Name + '.SetCodArticulo()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cCodArticulo = tcCodArticulo
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetCodBarra
      LPARAMETER tcCodBarra

      * inicio { validación de parámetro }
      IF VARTYPE(tcCodBarra) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcCodBarra' debe ser de tipo texto.], 0+16, THIS.Name + '.SetCodBarra()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cCodBarra = tcCodBarra
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetCodOriginal
      LPARAMETER tcCodOriginal

      * inicio { validación de parámetro }
      IF VARTYPE(tcCodOriginal) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcCodOriginal' debe ser de tipo texto.], 0+16, THIS.Name + '.SetCodOriginal()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cCodOriginal = tcCodOriginal
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetCodAlternativo
      LPARAMETER tcCodAlternativo

      * inicio { validación de parámetro }
      IF VARTYPE(tcCodAlternativo) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcCodAlternativo' debe ser de tipo texto.], 0+16, THIS.Name + '.SetCodAlternativo()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cCodAlternativo = tcCodAlternativo
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetAplicacion
      LPARAMETER tcAplicacion

      * inicio { validación de parámetro }
      IF VARTYPE(tcAplicacion) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcAplicacion' debe ser de tipo texto.], 0+16, THIS.Name + '.SetAplicacion()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cAplicacion = tcAplicacion
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetFamilia
      LPARAMETER tnFamilia

      * inicio { validación de parámetro }
      IF VARTYPE(tnFamilia) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnFamilia' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetFamilia()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nFamilia = tnFamilia

      IF !THIS.oFamilia.BuscarPorCodigo(THIS.nFamilia) THEN   && El registro no existe.
         WITH THIS.oFamilia
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetRubro
      LPARAMETER tnRubro

      * inicio { validación de parámetro }
      IF VARTYPE(tnRubro) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnRubro' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetRubro()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nRubro = tnRubro

      IF !THIS.oRubro.BuscarPorCodigo(THIS.nRubro) THEN   && El registro no existe.
         WITH THIS.oRubro
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetSubRubro
      LPARAMETER tnSubRubro

      * inicio { validación de parámetro }
      IF VARTYPE(tnSubRubro) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnSubRubro' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetSubRubro()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nSubRubro = tnSubRubro

      IF !THIS.oSubRubro.BuscarPorCodigo(THIS.nSubRubro) THEN   && El registro no existe.
         WITH THIS.oSubRubro
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
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

      THIS.nMarca = tnMarca

      IF !THIS.oMarca.BuscarPorCodigo(THIS.nMarca) THEN   && El registro no existe.
         WITH THIS.oMarca
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetUnidadMedida
      LPARAMETER tnUnidadMedida

      * inicio { validación de parámetro }
      IF VARTYPE(tnUnidadMedida) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnUnidadMedida' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetUnidadMedida()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nUnidadMedida = tnUnidadMedida

      IF !THIS.oUnidadMedida.BuscarPorCodigo(THIS.nUnidadMedida) THEN   && El registro no existe.
         WITH THIS.oUnidadMedida
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
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
   FUNCTION SetPais
      LPARAMETER tnPais

      * inicio { validación de parámetro }
      IF VARTYPE(tnPais) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnPais' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetPais()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nPais = tnPais

      IF !THIS.oPais.BuscarPorCodigo(THIS.nPais) THEN   && El registro no existe.
         WITH THIS.oPais
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetUbicacion
      LPARAMETER tcUbicacion

      * inicio { validación de parámetro }
      IF VARTYPE(tcUbicacion) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcUbicacion' debe ser de tipo texto.], 0+16, THIS.Name + '.SetUbicacion()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cUbicacion = tcUbicacion
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
   FUNCTION SetLPrecio
      LPARAMETER tlLPrecio

      * inicio { validación de parámetro }
      IF VARTYPE(tlLPrecio) <> 'L' THEN
         MESSAGEBOX([El parámetro 'tlLPrecio' debe ser de tipo lógico.], 0+16, THIS.Name + '.SetLPrecio()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.lLPrecio = tlLPrecio
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetGravado
      LPARAMETER tlGravado

      * inicio { validación de parámetro }
      IF VARTYPE(tlGravado) <> 'L' THEN
         MESSAGEBOX([El parámetro 'tlGravado' debe ser de tipo lógico.], 0+16, THIS.Name + '.SetGravado()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.lGravado = tlGravado
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetPorcIVA
      LPARAMETER tnPorcIVA

      * inicio { validación de parámetro }
      IF VARTYPE(tnPorcIVA) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnPorcIVA' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetPorcIVA()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nPorcIVA = tnPorcIVA
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetPCostoG
      LPARAMETER tnPCostoG

      * inicio { validación de parámetro }
      IF VARTYPE(tnPCostoG) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnPCostoG' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetPCostoG()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nPCostoG = tnPCostoG
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetPCostoD
      LPARAMETER tnPCostoD

      * inicio { validación de parámetro }
      IF VARTYPE(tnPCostoD) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnPCostoD' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetPCostoD()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nPCostoD = tnPCostoD
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetPVentaG1
      LPARAMETER tnPVentaG1

      * inicio { validación de parámetro }
      IF VARTYPE(tnPVentaG1) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnPVentaG1' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetPVentaG1()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nPVentaG1 = tnPVentaG1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetPVentaG2
      LPARAMETER tnPVentaG2

      * inicio { validación de parámetro }
      IF VARTYPE(tnPVentaG2) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnPVentaG2' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetPVentaG2()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nPVentaG2 = tnPVentaG2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetPVentaG3
      LPARAMETER tnPVentaG3

      * inicio { validación de parámetro }
      IF VARTYPE(tnPVentaG3) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnPVentaG3' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetPVentaG3()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nPVentaG3 = tnPVentaG3
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetPVentaG4
      LPARAMETER tnPVentaG4

      * inicio { validación de parámetro }
      IF VARTYPE(tnPVentaG4) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnPVentaG4' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetPVentaG4()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nPVentaG4 = tnPVentaG4
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetPVentaG5
      LPARAMETER tnPVentaG5

      * inicio { validación de parámetro }
      IF VARTYPE(tnPVentaG5) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnPVentaG5' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetPVentaG5()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nPVentaG5 = tnPVentaG5
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetPVentaD1
      LPARAMETER tnPVentaD1

      * inicio { validación de parámetro }
      IF VARTYPE(tnPVentaD1) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnPVentaD1' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetPVentaD1()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nPVentaD1 = tnPVentaD1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetPVentaD2
      LPARAMETER tnPVentaD2

      * inicio { validación de parámetro }
      IF VARTYPE(tnPVentaD2) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnPVentaD2' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetPVentaD2()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nPVentaD2 = tnPVentaD2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetPVentaD3
      LPARAMETER tnPVentaD3

      * inicio { validación de parámetro }
      IF VARTYPE(tnPVentaD3) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnPVentaD3' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetPVentaD3()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nPVentaD3 = tnPVentaD3
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetPVentaD4
      LPARAMETER tnPVentaD4

      * inicio { validación de parámetro }
      IF VARTYPE(tnPVentaD4) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnPVentaD4' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetPVentaD4()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nPVentaD4 = tnPVentaD4
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetPVentaD5
      LPARAMETER tnPVentaD5

      * inicio { validación de parámetro }
      IF VARTYPE(tnPVentaD5) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnPVentaD5' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetPVentaD5()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nPVentaD5 = tnPVentaD5
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetStockMin
      LPARAMETER tnStockMin

      * inicio { validación de parámetro }
      IF VARTYPE(tnStockMin) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnStockMin' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetStockMin()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nStockMin = tnStockMin
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetStockMax
      LPARAMETER tnStockMax

      * inicio { validación de parámetro }
      IF VARTYPE(tnStockMax) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnStockMax' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetStockMax()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nStockMax = tnStockMax
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetPolInvSMin
      LPARAMETER tlPolInvSMin

      * inicio { validación de parámetro }
      IF VARTYPE(tlPolInvSMin) <> 'L' THEN
         MESSAGEBOX([El parámetro 'tlPolInvSMin' debe ser de tipo lógico.], 0+16, THIS.Name + '.SetPolInvSMin()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.lPolInvSMin = tlPolInvSMin
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetPolInvSMax
      LPARAMETER tlPolInvSMax

      * inicio { validación de parámetro }
      IF VARTYPE(tlPolInvSMax) <> 'L' THEN
         MESSAGEBOX([El parámetro 'tlPolInvSMax' debe ser de tipo lógico.], 0+16, THIS.Name + '.SetPolInvSMax()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.lPolInvSMax = tlPolInvSMax
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetCaracter1
      LPARAMETER tcCaracter1

      * inicio { validación de parámetro }
      IF VARTYPE(tcCaracter1) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcCaracter1' debe ser de tipo texto.], 0+16, THIS.Name + '.SetCaracter1()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cCaracter1 = tcCaracter1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetCaracter2
      LPARAMETER tcCaracter2

      * inicio { validación de parámetro }
      IF VARTYPE(tcCaracter2) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcCaracter2' debe ser de tipo texto.], 0+16, THIS.Name + '.SetCaracter2()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cCaracter2 = tcCaracter2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetCaracter3
      LPARAMETER tcCaracter3

      * inicio { validación de parámetro }
      IF VARTYPE(tcCaracter3) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcCaracter3' debe ser de tipo texto.], 0+16, THIS.Name + '.SetCaracter3()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cCaracter3 = tcCaracter3
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetOtros1
      LPARAMETER tcOtros1

      * inicio { validación de parámetro }
      IF VARTYPE(tcOtros1) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcOtros1' debe ser de tipo texto.], 0+16, THIS.Name + '.SetOtros1()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cOtros1 = tcOtros1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetOtros2
      LPARAMETER tcOtros2

      * inicio { validación de parámetro }
      IF VARTYPE(tcOtros2) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcOtros2' debe ser de tipo texto.], 0+16, THIS.Name + '.SetOtros2()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cOtros2 = tcOtros2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetFecUCompra
      LPARAMETER tdFecUCompra

      * inicio { validación de parámetro }
      IF VARTYPE(tdFecUCompra) <> 'D' THEN
         MESSAGEBOX([El parámetro 'tdFecUCompra' debe ser de tipo fecha.], 0+16, THIS.Name + '.SetFecUCompra()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.dFecUCompra = tdFecUCompra
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetFecUVenta
      LPARAMETER tdFecUVenta

      * inicio { validación de parámetro }
      IF VARTYPE(tdFecUVenta) <> 'D' THEN
         MESSAGEBOX([El parámetro 'tdFecUVenta' debe ser de tipo fecha.], 0+16, THIS.Name + '.SetFecUVenta()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.dFecUVenta = tdFecUVenta
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
   FUNCTION GetCodArticulo
      RETURN THIS.cCodArticulo
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetCodBarra
      RETURN THIS.cCodBarra
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetCodOriginal
      RETURN THIS.cCodOriginal
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetCodAlternativo
      RETURN THIS.cCodAlternativo
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetAplicacion
      RETURN THIS.cAplicacion
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetFamilia
      RETURN THIS.nFamilia
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetFamiliaNombre
      RETURN THIS.oFamilia.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetFamiliaVigente
      RETURN THIS.oFamilia.GetVigente()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetRubro
      RETURN THIS.nRubro
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetRubroNombre
      RETURN THIS.oRubro.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetRubroVigente
      RETURN THIS.oRubro.GetVigente()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetSubRubro
      RETURN THIS.nSubRubro
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetSubRubroNombre
      RETURN THIS.oSubRubro.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetSubRubroVigente
      RETURN THIS.oSubRubro.GetVigente()
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
   FUNCTION GetUnidadMedida
      RETURN THIS.nUnidadMedida
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetUnidadMedidaNombre
      RETURN THIS.oUnidadMedida.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetUnidadMedidaVigente
      RETURN THIS.oUnidadMedida.GetVigente()
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
   FUNCTION GetPais
      RETURN THIS.nPais
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPaisNombre
      RETURN THIS.oPais.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPaisVigente
      RETURN THIS.oPais.GetVigente()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetUbicacion
      RETURN THIS.cUbicacion
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetVigente
      RETURN THIS.lVigente
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetLPrecio
      RETURN THIS.lLPrecio
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetGravado
      RETURN THIS.lGravado
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPorcIVA
      RETURN THIS.nPorcIVA
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPCostoG
      RETURN THIS.nPCostoG
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPCostoD
      RETURN THIS.nPCostoD
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPVentaG1
      RETURN THIS.nPVentaG1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPVentaG2
      RETURN THIS.nPVentaG2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPVentaG3
      RETURN THIS.nPVentaG3
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPVentaG4
      RETURN THIS.nPVentaG4
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPVentaG5
      RETURN THIS.nPVentaG5
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPVentaD1
      RETURN THIS.nPVentaD1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPVentaD2
      RETURN THIS.nPVentaD2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPVentaD3
      RETURN THIS.nPVentaD3
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPVentaD4
      RETURN THIS.nPVentaD4
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPVentaD5
      RETURN THIS.nPVentaD5
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetStockMin
      RETURN THIS.nStockMin
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetStockMax
      RETURN THIS.nStockMax
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPolInvSMin
      RETURN THIS.lPolInvSMin
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetPolInvSMax
      RETURN THIS.lPolInvSMax
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetCaracter1
      RETURN THIS.cCaracter1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetCaracter2
      RETURN THIS.cCaracter2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetCaracter3
      RETURN THIS.cCaracter3
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetOtros1
      RETURN THIS.cOtros1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetOtros2
      RETURN THIS.cOtros2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetFecUCompra
      RETURN THIS.dFecUCompra
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetFecUVenta
      RETURN THIS.dFecUVenta
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetStockActual
      RETURN THIS.nStockActual
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetStockOt
      RETURN THIS.nStockOt
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetStockComprometido
      RETURN THIS.nStockComprometido
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetStockSolicitado
      RETURN THIS.nStockSolicitado
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
   FUNCTION GetNuevoCodArticulo()
      LOCAL lnCodArticulo, loModelo, llExiste
      lnCodArticulo = 1
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorCodArticulo(ALLTRIM(STR(lnCodArticulo)))

      DO WHILE llExiste
         lnCodArticulo = lnCodArticulo + 1
         llExiste = loModelo.BuscarPorCodArticulo(ALLTRIM(STR(lnCodArticulo)))
      ENDDO

      RETURN ALLTRIM(STR(lnCodArticulo))
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
         THIS.CargarDatos()

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
   FUNCTION BuscarPorCodArticulo
      LPARAMETER tcCodArticulo, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF EMPTY(IIF(!INLIST(VARTYPE(tcCodArticulo), 'L', 'X'), tcCodArticulo, THIS.cCodArticulo)) THEN
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

      PRIVATE pcCodArticulo
      pcCodArticulo = UPPER(IIF(!INLIST(VARTYPE(tcCodArticulo), 'L', 'X'), ALLTRIM(tcCodArticulo), ALLTRIM(THIS.cCodArticulo)))

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(cod_articulo) LIKE ?pcCodArticulo', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(cod_articulo) LIKE ?pcCodArticulo AND ' + tcCondicionFiltrado, lcCursor)
      ENDIF

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorCodigo)')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado más de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorCodigo)')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorCodigo)')
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
   FUNCTION BuscarPorCodBarra
      LPARAMETER tcCodBarra, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF EMPTY(IIF(!INLIST(VARTYPE(tcCodBarra), 'L', 'X'), tcCodBarra, THIS.cCodBarra)) THEN
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

      PRIVATE pcCodBarra
      pcCodBarra = UPPER(IIF(!INLIST(VARTYPE(tcCodBarra), 'L', 'X'), ALLTRIM(tcCodBarra), ALLTRIM(THIS.cCodBarra)))

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(cod_barra) LIKE ?pcCodBarra', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(cod_barra) LIKE ?pcCodBarra AND ' + tcCondicionFiltrado, lcCursor)
      ENDIF

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorCodBarra()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado más de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorCodBarra()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorCodBarra()')
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
   FUNCTION BuscarPorCodOriginal
      LPARAMETER tcCodOriginal, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF EMPTY(IIF(!INLIST(VARTYPE(tcCodOriginal), 'L', 'X'), tcCodOriginal, THIS.cCodOriginal)) THEN
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

      PRIVATE pcCodOriginal
      pcCodOriginal = UPPER(IIF(!INLIST(VARTYPE(tcCodOriginal), 'L', 'X'), ALLTRIM(tcCodOriginal), ALLTRIM(THIS.cCodOriginal)))

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(cod_original) LIKE ?pcCodOriginal', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(cod_original) LIKE ?pcCodOriginal AND ' + tcCondicionFiltrado, lcCursor)
      ENDIF

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorCodOriginal()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado más de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorCodOriginal()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorCodOriginal()')
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
   FUNCTION BuscarPorCodAlternativo
      LPARAMETER tcCodAlternativo, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF EMPTY(IIF(!INLIST(VARTYPE(tcCodAlternativo), 'L', 'X'), tcCodAlternativo, THIS.cCodAlternativo)) THEN
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

      PRIVATE pcCodAlternativo
      pcCodAlternativo = UPPER(IIF(!INLIST(VARTYPE(tcCodAlternativo), 'L', 'X'), ALLTRIM(tcCodAlternativo), ALLTRIM(THIS.cCodAlternativo)))

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(cod_alternativo) LIKE ?pcCodAlternativo', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(cod_alternativo) LIKE ?pcCodAlternativo AND ' + tcCondicionFiltrado, lcCursor)
      ENDIF

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorCodAlternativo()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado más de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorCodAlternativo()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorCodAlternativo()')
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
      IF !BETWEEN(THIS.nCodigo, 1, 16777215) THEN
         MESSAGEBOX([El código debe ser un valor entre 1 y 16777215.], 0+16, THIS.Name + '.ValidarCodigo()')
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

      IF LEN(THIS.cNombre) > 100 THEN
         MESSAGEBOX([La longitud del parámetro 'tcNombre' debe ser como máximo de 100 caracteres.], 0+16, THIS.Name + '.ValidarNombre()')
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
   FUNCTION ValidarCodArticulo()
      IF EMPTY(THIS.cCodArticulo) THEN
         MESSAGEBOX('El código de artículo no puede quedar en blanco.', 0+16, THIS.Name + '.ValidarCodArticulo()')
         RETURN .F.
      ENDIF

      IF LEN(THIS.cCodArticulo) > 20 THEN
         MESSAGEBOX([La longitud del parámetro 'tcCodArticulo' debe ser como máximo de 20 caracteres.], 0+16, THIS.Name + '.ValidarCodArticulo()')
         RETURN .F.
      ENDIF

      LOCAL llRetorno, loModelo, llExiste
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorCodArticulo(THIS.cCodArticulo)

      DO CASE
      CASE THIS.nBandera = 1   && Agregar.
         IF llExiste THEN
            MESSAGEBOX('El código de artículo ya existe.', 0+16, THIS.Name + '.ValidarCodArticulo()')
            llRetorno = .F.
         ENDIF
      CASE THIS.nBandera = 2   && Modificar.
         IF llExiste AND loModelo.GetCodigo() <> THIS.nCodigo THEN
            MESSAGEBOX('El código de artículo ya existe.', 0+16, THIS.Name + '.ValidarCodArticulo()')
            llRetorno = .F.
         ENDIF
      ENDCASE

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarCodBarra()
      IF EMPTY(THIS.cCodBarra) THEN
         RETURN .T.
      ENDIF

      IF LEN(THIS.cCodBarra) > 20 THEN
         MESSAGEBOX([La longitud del parámetro 'tcCodBarra' debe ser como máximo de 20 caracteres.], 0+16, THIS.Name + '.ValidarCodBarra()')
         RETURN .F.
      ENDIF

      LOCAL llRetorno, loModelo, llExiste
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorCodBarra(THIS.cCodBarra)

      DO CASE
      CASE THIS.nBandera = 1   && Agregar.
         IF llExiste THEN
            MESSAGEBOX('El código de barras ya existe.', 0+16, THIS.Name + '.ValidarCodBarra()')
            llRetorno = .F.
         ENDIF
      CASE THIS.nBandera = 2   && Modificar.
         IF llExiste AND loModelo.GetCodigo() <> THIS.nCodigo THEN
            MESSAGEBOX('El código de barras ya existe.', 0+16, THIS.Name + '.ValidarCodBarra()')
            llRetorno = .F.
         ENDIF
      ENDCASE

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarCodOriginal()
      IF EMPTY(THIS.cCodOriginal) THEN
         RETURN .T.
      ENDIF

      IF LEN(THIS.cCodOriginal) > 20 THEN
         MESSAGEBOX([La longitud del parámetro 'tcCodOriginal' debe ser como máximo de 20 caracteres.], 0+16, THIS.Name + '.ValidarCodOriginal()')
         RETURN .F.
      ENDIF

      LOCAL llRetorno, loModelo, llExiste
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorCodOriginal(THIS.cCodOriginal)

      DO CASE
      CASE THIS.nBandera = 1   && Agregar.
         IF llExiste THEN
            MESSAGEBOX('El código original ya existe.', 0+16, THIS.Name + '.ValidarCodOriginal()')
            llRetorno = .F.
         ENDIF
      CASE THIS.nBandera = 2   && Modificar.
         IF llExiste AND loModelo.GetCodigo() <> THIS.nCodigo THEN
            MESSAGEBOX('El código original ya existe.', 0+16, THIS.Name + '.ValidarCodOriginal()')
            llRetorno = .F.
         ENDIF
      ENDCASE

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarCodAlternativo()
      IF EMPTY(THIS.cCodAlternativo) THEN
         RETURN .T.
      ENDIF

      IF LEN(THIS.cCodAlternativo) > 20 THEN
         MESSAGEBOX([La longitud del parámetro 'tcCodAlternativo' debe ser como máximo de 20 caracteres.], 0+16, THIS.Name + '.ValidarCodAlternativo()')
         RETURN .F.
      ENDIF

      LOCAL llRetorno, loModelo, llExiste
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorCodAlternativo(THIS.cCodAlternativo)

      DO CASE
      CASE THIS.nBandera = 1   && Agregar.
         IF llExiste THEN
            MESSAGEBOX('El código alternativo ya existe.', 0+16, THIS.Name + '.ValidarCodAlternativo()')
            llRetorno = .F.
         ENDIF
      CASE THIS.nBandera = 2   && Modificar.
         IF llExiste AND loModelo.GetCodigo() <> THIS.nCodigo THEN
            MESSAGEBOX('El código alternativo ya existe.', 0+16, THIS.Name + '.ValidarCodAlternativo()')
            llRetorno = .F.
         ENDIF
      ENDCASE

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarAplicacion()
      IF LEN(THIS.cAplicacion) > 480 THEN
         MESSAGEBOX([La longitud del campo 'cAplicacion' debe ser como máximo de 480 caracteres.], 0+16, THIS.Name + '.ValidarAplicacion()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarFamilia()
      IF !BETWEEN(THIS.nFamilia, 1, 65535) THEN
         MESSAGEBOX([La familia debe ser un valor entre 1 y 65535.], 0+16, THIS.Name + '.ValidarFamilia()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.oFamilia.GetNombre()) THEN
         MESSAGEBOX('La familia no existe.', 0+16, THIS.Name + '.ValidarFamilia()')
         RETURN .F.
      ENDIF

      IF !THIS.oFamilia.GetVigente() THEN
         MESSAGEBOX('La familia no está vigente.', 0+16, THIS.Name + '.ValidarFamilia()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarRubro()
      IF !BETWEEN(THIS.nRubro, 1, 65535) THEN
         MESSAGEBOX([El rubro debe ser un valor entre 1 y 65535.], 0+16, THIS.Name + '.ValidarRubro()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.oRubro.GetNombre()) THEN
         MESSAGEBOX('El rubro no existe.', 0+16, THIS.Name + '.ValidarRubro()')
         RETURN .F.
      ENDIF

      IF !THIS.oRubro.GetVigente() THEN
         MESSAGEBOX('El rubro no está vigente.', 0+16, THIS.Name + '.ValidarRubro()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarSubRubro()
      IF !BETWEEN(THIS.nSubRubro, 1, 65535) THEN
         MESSAGEBOX([El sub-rubro debe ser un valor entre 1 y 65535.], 0+16, THIS.Name + '.ValidarSubRubro()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.oSubRubro.GetNombre()) THEN
         MESSAGEBOX('El sub-rubro no existe.', 0+16, THIS.Name + '.ValidarSubRubro()')
         RETURN .F.
      ENDIF

      IF !THIS.oSubRubro.GetVigente() THEN
         MESSAGEBOX('El sub-rubro no está vigente.', 0+16, THIS.Name + '.ValidarSubRubro()')
         RETURN .F.
      ENDIF
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

      IF !THIS.oMarca.GetVigente() THEN
         MESSAGEBOX('La marca no está vigente.', 0+16, THIS.Name + '.ValidarMarca()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarUnidadMedida()
      IF !BETWEEN(THIS.nUnidadMedida, 1, 65535) THEN
         MESSAGEBOX([La unidad de medida debe ser un valor entre 1 y 65535.], 0+16, THIS.Name + '.ValidarUnidadMedida()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.oUnidadMedida.GetNombre()) THEN
         MESSAGEBOX('La unidad de medida no existe.', 0+16, THIS.Name + '.ValidarUnidadMedida()')
         RETURN .F.
      ENDIF

      IF !THIS.oUnidadMedida.GetVigente() THEN
         MESSAGEBOX('La unidad de medida no está vigente.', 0+16, THIS.Name + '.ValidarUnidadMedida()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarProveedor()
      IF !BETWEEN(THIS.nProveedor, 1, 65535) THEN
         MESSAGEBOX([El proveedor debe ser un valor entre 1 y 65535.], 0+16, THIS.Name + '.ValidarProveedor()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.oProveedor.GetNombre()) THEN
         MESSAGEBOX('El proveedor no existe.', 0+16, THIS.Name + '.ValidarProveedor()')
         RETURN .F.
      ENDIF

      IF THIS.oProveedor.GetVigente() <> 'S' THEN
         MESSAGEBOX('El proveedor no está vigente.', 0+16, THIS.Name + '.ValidarProveedor()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPais()
      IF !BETWEEN(THIS.nPais, 1, 65535) THEN
         MESSAGEBOX([El país debe ser un valor entre 1 y 65535.], 0+16, THIS.Name + '.ValidarPais()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.oPais.GetNombre()) THEN
         MESSAGEBOX('El país no existe.', 0+16, THIS.Name + '.ValidarPais()')
         RETURN .F.
      ENDIF

      IF !THIS.oPais.GetVigente() THEN
         MESSAGEBOX('El país no está vigente.', 0+16, THIS.Name + '.ValidarPais()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarUbicacion()
      IF LEN(THIS.cUbicacion) > 20 THEN
         MESSAGEBOX([La longitud del campo 'cUbicacion' debe ser como máximo de 20 caracteres.], 0+16, THIS.Name + '.ValidarUbicacion()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPorcIVA()
      IF !BETWEEN(THIS.nPorcIVA, 0, 999.99) THEN
         MESSAGEBOX('El porcentaje del IVA debe ser un valor entre 0 y 999.99.', 0+16, THIS.Name + '.ValidarPorcIVA()')
         RETURN .F.
      ENDIF

      IF !THIS.lGravado AND THIS.nPorcIVA <> 0 THEN
         MESSAGEBOX('El artículo debe ser gravado para que el porcentaje del IVA sea mayor que cero.', 0+16, THIS.Name + '.ValidarPorcIVA()')
         RETURN .F.
      ENDIF

      IF THIS.lGravado AND THIS.nPorcIVA = 0 THEN
         MESSAGEBOX('El artículo debe ser exento para que el porcentaje del IVA sea igual a cero.', 0+16, THIS.Name + '.ValidarPorcIVA()')
         RETURN .F.
      ENDIF

      IF THIS.lGravado AND !INLIST(THIS.nPorcIVA, 5, 10) THEN
         MESSAGEBOX('El porcentaje del IVA debe ser uno de los siguientes valores: 5 ó 10.', 0+16, THIS.Name + '.ValidarPorcIVA()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPCostoG()
      IF THIS.nPCostoG < 0 THEN
         MESSAGEBOX('El precio de costo en guaraníes (PYG) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPCostoG()')
         RETURN .F.
      ENDIF

      IF THIS.nPCostoG > 999999999.9999 THEN
         MESSAGEBOX('El precio de costo en guaraníes (PYG) debe ser menor a 1 billón.', 0+16, THIS.Name + '.ValidarPCostoG()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPcostoD()
      IF THIS.nPcostoD < 0 THEN
         MESSAGEBOX('El precio de costo en dólares (USD) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPcostoD()')
         RETURN .F.
      ENDIF

      IF THIS.nPcostoD > 999999999.9999 THEN
         MESSAGEBOX('El precio de costo en dólares (USD) debe ser menor a 1 billón.', 0+16, THIS.Name + '.ValidarPcostoD()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPVentaG1()
      IF THIS.nPVentaG1 < 0 THEN
         MESSAGEBOX('El precio de venta 1 en guaraníes (PYG) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPVentaG1()')
         RETURN .F.
      ENDIF

      IF THIS.nPVentaG1 > 999999999.9999 THEN
         MESSAGEBOX('El precio de venta 1 en guaraníes (PYG) debe ser menor a 1 billón.', 0+16, THIS.Name + '.ValidarPVentaG1()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPVentaG2()
      IF THIS.nPVentaG2 < 0 THEN
         MESSAGEBOX('El precio de venta 2 en guaraníes (PYG) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPVentaG2()')
         RETURN .F.
      ENDIF

      IF THIS.nPVentaG2 > 999999999.9999 THEN
         MESSAGEBOX('El precio de venta 2 en guaraníes (PYG) debe ser menor a 1 billón.', 0+16, THIS.Name + '.ValidarPVentaG2()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPVentaG3()
      IF THIS.nPVentaG3 < 0 THEN
         MESSAGEBOX('El precio de venta 3 en guaraníes (PYG) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPVentaG3()')
         RETURN .F.
      ENDIF

      IF THIS.nPVentaG3 > 999999999.9999 THEN
         MESSAGEBOX('El precio de venta 3 en guaraníes (PYG) debe ser menor a 1 billón.', 0+16, THIS.Name + '.ValidarPVentaG3()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPVentaG4()
      IF THIS.nPVentaG4 < 0 THEN
         MESSAGEBOX('El precio de venta 4 en guaraníes (PYG) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPVentaG4()')
         RETURN .F.
      ENDIF

      IF THIS.nPVentaG4 > 999999999.9999 THEN
         MESSAGEBOX('El precio de venta 4 en guaraníes (PYG) debe ser menor a 1 billón.', 0+16, THIS.Name + '.ValidarPVentaG4()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPVentaG5()
      IF THIS.nPVentaG5 < 0 THEN
         MESSAGEBOX('El precio de venta 5 en guaraníes (PYG) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPVentaG5()')
         RETURN .F.
      ENDIF

      IF THIS.nPVentaG5 > 999999999.9999 THEN
         MESSAGEBOX('El precio de venta 5 en guaraníes (PYG) debe ser menor a 1 billón.', 0+16, THIS.Name + '.ValidarPVentaG5()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPVentaD1()
      IF THIS.nPVentaD1 < 0 THEN
         MESSAGEBOX('El precio de venta 1 en dólares (USD) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPVentaD1()')
         RETURN .F.
      ENDIF

      IF THIS.nPVentaD1 > 999999999.9999 THEN
         MESSAGEBOX('El precio de venta 1 en dólares (USD) debe ser menor a 1 billón.', 0+16, THIS.Name + '.ValidarPVentaD1()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPVentaD2()
      IF THIS.nPVentaD2 < 0 THEN
         MESSAGEBOX('El precio de venta 2 en dólares (USD) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPVentaD2()')
         RETURN .F.
      ENDIF

      IF THIS.nPVentaD2 > 999999999.9999 THEN
         MESSAGEBOX('El precio de venta 2 en dólares (USD) debe ser menor a 1 billón.', 0+16, THIS.Name + '.ValidarPVentaD2()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPVentaD3()
      IF THIS.nPVentaD3 < 0 THEN
         MESSAGEBOX('El precio de venta 3 en dólares (USD) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPVentaD3()')
         RETURN .F.
      ENDIF

      IF THIS.nPVentaD3 > 999999999.9999 THEN
         MESSAGEBOX('El precio de venta 3 en dólares (USD) debe ser menor a 1 billón.', 0+16, THIS.Name + '.ValidarPVentaD3()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPVentaD4()
      IF THIS.nPVentaD4 < 0 THEN
         MESSAGEBOX('El precio de venta 4 en dólares (USD) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPVentaD4()')
         RETURN .F.
      ENDIF

      IF THIS.nPVentaD4 > 999999999.9999 THEN
         MESSAGEBOX('El precio de venta 4 en dólares (USD) debe ser menor a 1 billón.', 0+16, THIS.Name + '.ValidarPVentaD4()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPVentaD5()
      IF THIS.nPVentaD5 < 0 THEN
         MESSAGEBOX('El precio de venta 5 en dólares (USD) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPVentaD5()')
         RETURN .F.
      ENDIF

      IF THIS.nPVentaD5 > 999999999.9999 THEN
         MESSAGEBOX('El precio de venta 5 en dólares (USD) debe ser menor a 1 billón.', 0+16, THIS.Name + '.ValidarPVentaD5()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarStockMin()
      IF THIS.nStockMin < 0 THEN
         MESSAGEBOX('El stock mínimo debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarStockMin()')
         RETURN .F.
      ENDIF

      IF THIS.nStockMin > 99999999.99 THEN
         MESSAGEBOX('El stock mínimo debe ser menor a 100 millones.', 0+16, THIS.Name + '.ValidarStockMin()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarStockMax()
      IF THIS.nStockMax < 0 THEN
         MESSAGEBOX('El stock máximo debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarStockMax()')
         RETURN .F.
      ENDIF

      IF THIS.nStockMax > 99999999.99 THEN
         MESSAGEBOX('El stock máximo debe ser menor a 100 millones.', 0+16, THIS.Name + '.ValidarStockMax()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarCaracter1()
      IF LEN(THIS.cCaracter1) > 60 THEN
         MESSAGEBOX([La longitud del campo 'cCaracter1' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.ValidarCaracter1()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarCaracter2()
      IF LEN(THIS.cCaracter2) > 60 THEN
         MESSAGEBOX([La longitud del campo 'cCaracter2' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.ValidarCaracter2()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarCaracter3()
      IF LEN(THIS.cCaracter3) > 60 THEN
         MESSAGEBOX([La longitud del campo 'cCaracter3' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.ValidarCaracter3()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarOtros1()
      IF LEN(THIS.cOtros1) > 60 THEN
         MESSAGEBOX([La longitud del campo 'cOtros1' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.ValidarOtros1()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarOtros2()
      IF LEN(THIS.cOtros2) > 60 THEN
         MESSAGEBOX([La longitud del campo 'cOtros2' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.ValidarOtros2()')
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

      IF !THIS.ValidarCodArticulo() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarCodBarra() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarCodOriginal() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarCodAlternativo() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarAplicacion() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarFamilia() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarRubro() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarSubRubro() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarMarca() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarUnidadMedida() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarProveedor() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarPais() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarUbicacion() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarPorcIVA() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarPCostoG() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarPcostoD() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarPVentaG1() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarPVentaG2() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarPVentaG3() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarPVentaG4() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarPVentaG5() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarPVentaD1() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarPVentaD2() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarPVentaD3() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarPVentaD4() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarPVentaD5() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarStockMin() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarStockMax() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarCaracter1() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarCaracter2() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarCaracter3() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarOtros1() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarOtros2() THEN
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION CargarDatos
      WITH THIS
         .nCodigo = codigo
         .cNombre = nombre
         .cCodArticulo = cod_articulo
         .cCodBarra = IIF(!ISNULL(cod_barra), cod_barra, '')
         .cCodOriginal = IIF(!ISNULL(cod_original), cod_original, '')
         .cCodAlternativo = IIF(!ISNULL(cod_alternativo), cod_alternativo, '')
         .cAplicacion = IIF(!ISNULL(aplicacion), aplicacion, '')
         .nFamilia = familia
         .nRubro = rubro
         .nSubRubro = subrubro
         .nMarca = marca
         .nUnidadMedida = unidad
         .nProveedor = proveedor
         .nPais = pais
         .cUbicacion = IIF(!ISNULL(ubicacion), ubicacion, '')
         .lVigente = IIF(vigente = '0', .F., .T.)
         .lLPrecio = IIF(lprecio = '0', .F., .T.)
         .lGravado = IIF(gravado = '0', .F., .T.)
         .nPorcIVA = IIF(!ISNULL(porc_iva), porc_iva, 0)
         .nPCostoG = IIF(!ISNULL(pcostog), pcostog, 0)
         .nPCostoD = IIF(!ISNULL(pcostod), pcostod, 0)
         .nPVentaG1 = IIF(!ISNULL(pventag1), pventag1, 0)
         .nPVentaG2 = IIF(!ISNULL(pventag2), pventag2, 0)
         .nPVentaG3 = IIF(!ISNULL(pventag3), pventag3, 0)
         .nPVentaG4 = IIF(!ISNULL(pventag4), pventag4, 0)
         .nPVentaG5 = IIF(!ISNULL(pventag5), pventag5, 0)
         .nPVentaD1 = IIF(!ISNULL(pventad1), pventad1, 0)
         .nPVentaD2 = IIF(!ISNULL(pventad2), pventad2, 0)
         .nPVentaD3 = IIF(!ISNULL(pventad3), pventad3, 0)
         .nPVentaD4 = IIF(!ISNULL(pventad4), pventad4, 0)
         .nPVentaD5 = IIF(!ISNULL(pventad5), pventad5, 0)
         .nStockMin = IIF(!ISNULL(stock_min), stock_min, 0)
         .nStockMax = IIF(!ISNULL(stock_max), stock_max, 0)
         .lPolInvSMin = IIF(polinvsmin = 0, .F., .T.)
         .lPolInvSMax = IIF(polinvsmax = 0, .F., .T.)
         .cCaracter1 = IIF(!ISNULL(caracter1), caracter1, '')
         .cCaracter2 = IIF(!ISNULL(caracter2), caracter2, '')
         .cCaracter3 = IIF(!ISNULL(caracter3), caracter3, '')
         .cOtros1 = IIF(!ISNULL(otros1), otros1, '')
         .cOtros2 = IIF(!ISNULL(otros2), otros2, '')
         .dFecUCompra = IIF(!ISNULL(fecucompra), fecucompra, {})
         .dFecUVenta = IIF(!ISNULL(fecuventa), fecuventa, {})
         .nStockActual = stock_actual
         .nStockOt = stock_ot
         .nStockComprometido = stock_comprometido
         .nStockSolicitado = stock_solicitado
      ENDWITH
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Agregar
      LOCAL llRetorno
      llRetorno = .T.
      THIS.nBandera = 1

      IF THIS.Validar() THEN
         PRIVATE pnCodigo, pcNombre, pcCodArticulo, pcCodBarra, pcCodOriginal, pcCodAlternativo, pcAplicacion, pnFamilia, ;
                 pnRubro, pnSubRubro, pnMarca, pnUnidadMedida, pnProveedor, pnPais, pcUbicacion, plVigente, plLPrecio, ;
                 plGravado, pnPorcIVA, pnPCostoG, pnPCostoD, pnPVentaG1, pnPVentaG2, pnPVentaG3, pnPVentaG4, pnPVentaG5, ;
                 pnPVentaD1, pnPVentaD2, pnPVentaD3, pnPVentaD4, pnPVentaD5, pnStockMin, pnStockMax,plPolInvSMin, plPolInvSMax, ;
                 pcCaracter1, pcCaracter2, pcCaracter3, pcOtros1, pcOtros2, pdFecUCompra, pdFecUVenta, pnStockActual, ;
                 pnStockOt, pnStockComprometido, pnStockSolicitado

         pnCodigo = THIS.GetNuevoCodigo()
         pcNombre = THIS.cNombre
         pcCodArticulo = THIS.cCodArticulo
         pcCodBarra = IIF(!EMPTY(THIS.cCodBarra), THIS.cCodBarra, NULL)
         pcCodOriginal = IIF(!EMPTY(THIS.cCodOriginal), THIS.cCodOriginal, NULL)
         pcCodAlternativo = IIF(!EMPTY(THIS.cCodAlternativo), THIS.cCodAlternativo, NULL)
         pcAplicacion = IIF(!EMPTY(THIS.cAplicacion), THIS.cAplicacion, NULL)
         pnFamilia = THIS.nFamilia
         pnRubro = THIS.nRubro
         pnSubRubro = THIS.nSubRubro
         pnMarca = THIS.nMarca
         pnUnidadMedida = THIS.nUnidadMedida
         pnProveedor = THIS.nProveedor
         pnPais = THIS.nPais
         pcUbicacion = IIF(!EMPTY(THIS.cUbicacion), THIS.cUbicacion, NULL)
         plVigente = IIF(!THIS.lVigente, '0', '1')
         plLPrecio = IIF(!THIS.lLPrecio, '0', '1')
         plGravado = IIF(!THIS.lGravado, '0', '1')
         pnPorcIVA = IIF(THIS.nPorcIVA > 0, THIS.nPorcIVA, NULL)
         pnPCostoG = IIF(THIS.nPCostoG > 0, THIS.nPCostoG, NULL)
         pnPCostoD = IIF(THIS.nPCostoD > 0, THIS.nPCostoD, NULL)
         pnPVentaG1 = IIF(THIS.nPVentaG1 > 0, THIS.nPVentaG1, NULL)
         pnPVentaG2 = IIF(THIS.nPVentaG2 > 0, THIS.nPVentaG2, NULL)
         pnPVentaG3 = IIF(THIS.nPVentaG3 > 0, THIS.nPVentaG3, NULL)
         pnPVentaG4 = IIF(THIS.nPVentaG4 > 0, THIS.nPVentaG4, NULL)
         pnPVentaG5 = IIF(THIS.nPVentaG5 > 0, THIS.nPVentaG5, NULL)
         pnPVentaD1 = IIF(THIS.nPVentaD1 > 0, THIS.nPVentaD1, NULL)
         pnPVentaD2 = IIF(THIS.nPVentaD2 > 0, THIS.nPVentaD2, NULL)
         pnPVentaD3 = IIF(THIS.nPVentaD3 > 0, THIS.nPVentaD3, NULL)
         pnPVentaD4 = IIF(THIS.nPVentaD4 > 0, THIS.nPVentaD4, NULL)
         pnPVentaD5 = IIF(THIS.nPVentaD5 > 0, THIS.nPVentaD5, NULL)
         pnStockMin = IIF(THIS.nStockMin > 0, THIS.nStockMin, NULL)
         pnStockMax = IIF(THIS.nStockMax > 0, THIS.nStockMax, NULL)
         plPolInvSMin = IIF(!THIS.lPolInvSMin, 0, 1)
         plPolInvSMax = IIF(!THIS.lPolInvSMax, 0, 1)
         pcCaracter1 = IIF(!EMPTY(THIS.cCaracter1), THIS.cCaracter1, NULL)
         pcCaracter2 = IIF(!EMPTY(THIS.cCaracter2), THIS.cCaracter2, NULL)
         pcCaracter3 = IIF(!EMPTY(THIS.cCaracter3), THIS.cCaracter3, NULL)
         pcOtros1 = IIF(!EMPTY(THIS.cOtros1), THIS.cOtros1, NULL)
         pcOtros2 = IIF(!EMPTY(THIS.cOtros2), THIS.cOtros2, NULL)
         pdFecUCompra = IIF(!EMPTY(THIS.dFecUCompra), THIS.dFecUCompra, NULL)
         pdFecUVenta = IIF(!EMPTY(THIS.dFecUVenta), THIS.dFecUVenta, NULL)
         pnStockActual = THIS.nStockActual
         pnStockOt = THIS.nStockOt
         pnStockComprometido = THIS.nStockComprometido
         pnStockSolicitado = THIS.nStockSolicitado

         IF goCapaDatos.AgregarRegistro(THIS.cTabla, ;
                                        'codigo, nombre, cod_articulo, cod_barra, cod_original, cod_alternativo, aplicacion, ' + ;
                                        'familia, rubro, subrubro, marca, unidad, proveedor, pais, ubicacion, vigente, lprecio, ' + ;
                                        'gravado, porc_iva, pcostog, pcostod, pventag1, pventag2, pventag3, pventag4, pventag5, ' + ;
                                        'pventad1, pventad2, pventad3, pventad4, pventad5, stock_min, stock_max, polinvsmin, ' + ;
                                        'polinvsmax, caracter1, caracter2, caracter3, otros1, otros2, fecucompra, fecuventa, ' + ;
                                        'stock_actual, stock_ot, stock_comprometido, stock_solicitado', ;
                                        '?pnCodigo, ?pcNombre, ?pcCodArticulo, ?pcCodBarra, ?pcCodOriginal, ?pcCodAlternativo, ?pcAplicacion, ' + ;
                                        '?pnFamilia, ?pnRubro, ?pnSubRubro, ?pnMarca, ?pnUnidadMedida, ?pnProveedor, ?pnPais, ?pcUbicacion, ?plVigente, ?plLPrecio, ' + ;
                                        '?plGravado, ?pnPorcIVA, ?pnPCostoG, ?pnPCostoD, ?pnPVentaG1, ?pnPVentaG2, ?pnPVentaG3, ?pnPVentaG4, ?pnPVentaG5, ' + ;
                                        '?pnPVentaD1, ?pnPVentaD2, ?pnPVentaD3, ?pnPVentaD4, ?pnPVentaD5, ?pnStockMin, ?pnStockMax, ?plPolInvSMin, ' + ;
                                        '?plPolInvSMax, ?pcCaracter1, ?pcCaracter2, ?pcCaracter3, ?pcOtros1, ?pcOtros2, ?pdFecUCompra, ?pdFecUVenta, ' + ;
                                        '?pnStockActual, ?pnStockOt, ?pnStockComprometido, ?pnStockSolicitado')
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
         PRIVATE pnCodigo, pcNombre, pcCodArticulo, pcCodBarra, pcCodOriginal, pcCodAlternativo, pcAplicacion, pnFamilia, ;
                 pnRubro, pnSubRubro, pnMarca, pnUnidadMedida, pnProveedor, pnPais, pcUbicacion, plVigente, plLPrecio, ;
                 plGravado, pnPorcIVA, pnPCostoG, pnPCostoD, pnPVentaG1, pnPVentaG2, pnPVentaG3, pnPVentaG4, pnPVentaG5, ;
                 pnPVentaD1, pnPVentaD2, pnPVentaD3, pnPVentaD4, pnPVentaD5, pnStockMin, pnStockMax,plPolInvSMin, plPolInvSMax, ;
                 pcCaracter1, pcCaracter2, pcCaracter3, pcOtros1, pcOtros2, pdFecUCompra, pdFecUVenta, pnStockActual, ;
                 pnStockOt, pnStockComprometido, pnStockSolicitado

         pnCodigo = THIS.nCodigo
         pcNombre = THIS.cNombre
         pcCodArticulo = THIS.cCodArticulo
         pcCodBarra = IIF(!EMPTY(THIS.cCodBarra), THIS.cCodBarra, NULL)
         pcCodOriginal = IIF(!EMPTY(THIS.cCodOriginal), THIS.cCodOriginal, NULL)
         pcCodAlternativo = IIF(!EMPTY(THIS.cCodAlternativo), THIS.cCodAlternativo, NULL)
         pcAplicacion = IIF(!EMPTY(THIS.cAplicacion), THIS.cAplicacion, NULL)
         pnFamilia = THIS.nFamilia
         pnRubro = THIS.nRubro
         pnSubRubro = THIS.nSubRubro
         pnMarca = THIS.nMarca
         pnUnidadMedida = THIS.nUnidadMedida
         pnProveedor = THIS.nProveedor
         pnPais = THIS.nPais
         pcUbicacion = IIF(!EMPTY(THIS.cUbicacion), THIS.cUbicacion, NULL)
         plVigente = IIF(!THIS.lVigente, '0', '1')
         plLPrecio = IIF(!THIS.lLPrecio, '0', '1')
         plGravado = IIF(!THIS.lGravado, '0', '1')
         pnPorcIVA = IIF(THIS.nPorcIVA > 0, THIS.nPorcIVA, NULL)
         pnPCostoG = IIF(THIS.nPCostoG > 0, THIS.nPCostoG, NULL)
         pnPCostoD = IIF(THIS.nPCostoD > 0, THIS.nPCostoD, NULL)
         pnPVentaG1 = IIF(THIS.nPVentaG1 > 0, THIS.nPVentaG1, NULL)
         pnPVentaG2 = IIF(THIS.nPVentaG2 > 0, THIS.nPVentaG2, NULL)
         pnPVentaG3 = IIF(THIS.nPVentaG3 > 0, THIS.nPVentaG3, NULL)
         pnPVentaG4 = IIF(THIS.nPVentaG4 > 0, THIS.nPVentaG4, NULL)
         pnPVentaG5 = IIF(THIS.nPVentaG5 > 0, THIS.nPVentaG5, NULL)
         pnPVentaD1 = IIF(THIS.nPVentaD1 > 0, THIS.nPVentaD1, NULL)
         pnPVentaD2 = IIF(THIS.nPVentaD2 > 0, THIS.nPVentaD2, NULL)
         pnPVentaD3 = IIF(THIS.nPVentaD3 > 0, THIS.nPVentaD3, NULL)
         pnPVentaD4 = IIF(THIS.nPVentaD4 > 0, THIS.nPVentaD4, NULL)
         pnPVentaD5 = IIF(THIS.nPVentaD5 > 0, THIS.nPVentaD5, NULL)
         pnStockMin = IIF(THIS.nStockMin > 0, THIS.nStockMin, NULL)
         pnStockMax = IIF(THIS.nStockMax > 0, THIS.nStockMax, NULL)
         plPolInvSMin = IIF(!THIS.lPolInvSMin, 0, 1)
         plPolInvSMax = IIF(!THIS.lPolInvSMax, 0, 1)
         pcCaracter1 = IIF(!EMPTY(THIS.cCaracter1), THIS.cCaracter1, NULL)
         pcCaracter2 = IIF(!EMPTY(THIS.cCaracter2), THIS.cCaracter2, NULL)
         pcCaracter3 = IIF(!EMPTY(THIS.cCaracter3), THIS.cCaracter3, NULL)
         pcOtros1 = IIF(!EMPTY(THIS.cOtros1), THIS.cOtros1, NULL)
         pcOtros2 = IIF(!EMPTY(THIS.cOtros2), THIS.cOtros2, NULL)
         pdFecUCompra = IIF(!EMPTY(THIS.dFecUCompra), THIS.dFecUCompra, NULL)
         pdFecUVenta = IIF(!EMPTY(THIS.dFecUVenta), THIS.dFecUVenta, NULL)
         pnStockActual = THIS.nStockActual
         pnStockOt = THIS.nStockOt
         pnStockComprometido = THIS.nStockComprometido
         pnStockSolicitado = THIS.nStockSolicitado


         IF goCapaDatos.ModificarRegistro(THIS.cTabla, ;
                                          'nombre = ?pcNombre, cod_articulo = ?pcCodArticulo, cod_barra = ?pcCodBarra, ' + ;
                                          'cod_original = ?pcCodOriginal, cod_alternativo = ?pcCodAlternativo, ' + ;
                                          'aplicacion = ?pcAplicacion, familia = ?pnFamilia, rubro = ?pnRubro, ' + ;
                                          'subrubro = ?pnSubRubro, marca = ?pnMarca, unidad = ?pnUnidadMedida, ' + ;
                                          'proveedor = ?pnProveedor, pais = ?pnPais, ubicacion = ?pcUbicacion, ' + ;
                                          'vigente = ?plVigente, lprecio = ?plLPrecio, gravado = ?plGravado, ' + ;
                                          'porc_iva = ?pnPorcIVA, pcostog = ?pnPCostoG, pcostod = ?pnPCostoD, ' + ;
                                          'pventag1 = ?pnPVentaG1, pventag2 = ?pnPVentaG2, pventag3 = ?pnPVentaG3, ' + ;
                                          'pventag4 = ?pnPVentaG4, pventag5 = ?pnPVentaG5, pventad1 = ?pnPVentaD1, ' + ;
                                          'pventad2 = ?pnPVentaD2, pventad3 = ?pnPVentaD3, pventad4 = ?pnPVentaD4, ' + ;
                                          'pventad5 = ?pnPVentaD5, stock_min = ?pnStockMin, stock_max = ?pnStockMax, ' + ;
                                          'polinvsmin = ?plPolInvSMin, polinvsmax = ?plPolInvSMax, caracter1 = ?pcCaracter1, ' + ;
                                          'caracter2 = ?pcCaracter2, caracter3 = ?pcCaracter3, otros1 = ?pcOtros1, ' + ;
                                          'otros2 = ?pcOtros2', ;
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
ENDDEFINE