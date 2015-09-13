DEFINE CLASS Articulo AS CUSTOM
   * Propiedades.
   PROTECTED nBandera
   PROTECTED cTabla           && Nombre de la tabla a la cual hace referencia el modelo.
   PROTECTED cClavePrimaria   && Nombre de la clave primaria de la tabla.
   PROTECTED cClaveForanea    && Nombre con el cual se hace referencia a la clave primaria en otras tablas.

   * Campos.
   PROTECTED cCodigo
   PROTECTED cCodAltern
   PROTECTED cCodOrig
   PROTECTED cNombre
   PROTECTED mAplicacion
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
   PROTECTED LGravado 
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
   PROTECTED nStockActu
   PROTECTED nStockOt

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
         .cTabla = 'maesprod'
         .cClavePrimaria = 'codigo'
         .cClaveForanea = 'articulo'

         .cCodigo = ''
         .cCodAltern = ''
         .cCodOrig = ''
         .cNombre = ''
         .mAplicacion = ''
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
         .LGravado  = .F.
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
         .nStockActu = 0
         .nStockOt = 0

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
      LPARAMETER tcCodigo

      * inicio { validación de parámetro }
      IF VARTYPE(tcCodigo) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcCodigo' debe ser de tipo texto.], 0+16, THIS.Name + '.SetCodigo()')
         RETURN .F.
      ENDIF

      IF LEN(tcCodigo) > 15 THEN
         MESSAGEBOX([La longitud del parámetro 'tcCodigo' debe ser como máximo de 15 caracteres.], 0+16, THIS.Name + '.SetCodigo()')
         RETURN .F.
      ENDIF

      IF AT('[', tcCodigo) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetCodigo()')
         RETURN .F.
      ENDIF

      IF AT(']', tcCodigo) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetCodigo()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cCodigo = tcCodigo
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetCodAltern
      LPARAMETER tcCodAltern

      * inicio { validación de parámetro }
      IF VARTYPE(tcCodAltern) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcCodAltern' debe ser de tipo texto.], 0+16, THIS.Name + '.SetCodAltern()')
         RETURN .F.
      ENDIF

      IF LEN(tcCodAltern) > 15 THEN
         MESSAGEBOX([La longitud del parámetro 'tcCodAltern' debe ser como máximo de 15 caracteres.], 0+16, THIS.Name + '.SetCodAltern()')
         RETURN .F.
      ENDIF

      IF AT('[', tcCodAltern) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetCodAltern()')
         RETURN .F.
      ENDIF

      IF AT(']', tcCodAltern) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetCodAltern()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cCodAltern = tcCodAltern
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetCodOrig
      LPARAMETER tcCodOrig

      * inicio { validación de parámetro }
      IF VARTYPE(tcCodOrig) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcCodOrig' debe ser de tipo texto.], 0+16, THIS.Name + '.SetCodOrig()')
         RETURN .F.
      ENDIF

      IF LEN(tcCodOrig) > 15 THEN
         MESSAGEBOX([La longitud del parámetro 'tcCodOrig' debe ser como máximo de 15 caracteres.], 0+16, THIS.Name + '.SetCodOrig()')
         RETURN .F.
      ENDIF

      IF AT('[', tcCodOrig) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetCodOrig()')
         RETURN .F.
      ENDIF

      IF AT(']', tcCodOrig) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetCodOrig()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cCodOrig = tcCodOrig
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetNombre
      LPARAMETER tcNombre

      * inicio { validación de parámetro }
      IF VARTYPE(tcNombre) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcNombre' debe ser de tipo texto.], 0+16, THIS.Name + '.SetNombre()')
         RETURN .F.
      ENDIF

      IF LEN(tcNombre) > 40 THEN
         MESSAGEBOX([La longitud del parámetro 'tcNombre' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.SetNombre()')
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
   FUNCTION SetAplicacion
      LPARAMETER tmAplicacion

      * inicio { validación de parámetro }
      IF VARTYPE(tmAplicacion) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcAplicacion' debe ser de tipo texto.], 0+16, THIS.Name + '.SetAplicacion()')
         RETURN .F.
      ENDIF

      IF LEN(tmAplicacion) > 254 THEN
         MESSAGEBOX([La longitud del parámetro 'tcAplicacion' debe ser como máximo de 254 caracteres.], 0+16, THIS.Name + '.SetAplicacion()')
         RETURN .F.
      ENDIF

      IF AT('[', tmAplicacion) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetAplicacion()')
         RETURN .F.
      ENDIF

      IF AT(']', tmAplicacion) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetAplicacion()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.mAplicacion = tmAplicacion
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

      IF LEN(tcUbicacion) > 10 THEN
         MESSAGEBOX([La longitud del parámetro 'tcUbicacion' debe ser como máximo de 10 caracteres.], 0+16, THIS.Name + '.SetUbicacion()')
         RETURN .F.
      ENDIF

      IF AT('[', tcUbicacion) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetUbicacion()')
         RETURN .F.
      ENDIF

      IF AT(']', tcUbicacion) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetUbicacion()')
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
      IF VARTYPE(tllGravado) <> 'L' THEN
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

      IF LEN(tcCaracter1) > 60 THEN
         MESSAGEBOX([La longitud del parámetro 'tcCaracter1' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.SetCaracter1()')
         RETURN .F.
      ENDIF

      IF AT('[', tcCaracter1) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetCaracter1()')
         RETURN .F.
      ENDIF

      IF AT(']', tcCaracter1) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetCaracter1()')
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

      IF LEN(tcCaracter2) > 60 THEN
         MESSAGEBOX([La longitud del parámetro 'tcCaracter2' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.SetCaracter2()')
         RETURN .F.
      ENDIF

      IF AT('[', tcCaracter2) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetCaracter2()')
         RETURN .F.
      ENDIF

      IF AT(']', tcCaracter2) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetCaracter2()')
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

      IF LEN(tcCaracter3) > 60 THEN
         MESSAGEBOX([La longitud del parámetro 'tcCaracter3' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.SetCaracter3()')
         RETURN .F.
      ENDIF

      IF AT('[', tcCaracter3) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetCaracter3()')
         RETURN .F.
      ENDIF

      IF AT(']', tcCaracter3) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetCaracter3()')
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

      IF LEN(tcOtros1) > 60 THEN
         MESSAGEBOX([La longitud del parámetro 'tcOtros1' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.SetOtros1()')
         RETURN .F.
      ENDIF

      IF AT('[', tcOtros1) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetOtros1()')
         RETURN .F.
      ENDIF

      IF AT(']', tcOtros1) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetOtros1()')
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

      IF LEN(tcOtros2) > 60 THEN
         MESSAGEBOX([La longitud del parámetro 'tcOtros2' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.SetOtros2()')
         RETURN .F.
      ENDIF

      IF AT('[', tcOtros2) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetOtros2()')
         RETURN .F.
      ENDIF

      IF AT(']', tcOtros2) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetOtros2()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cOtros2 = tcOtros2
   ENDFUNC

  * ---------------------------------------------------------------------------- *
   FUNCTION SetFecUCompra
      LPARAMETER tdFecUCompra

      * inicio { validación de parámetro }
      IF VARTYPE(tdFecUCompra) <> 'L' THEN
         MESSAGEBOX([El parámetro 'tdFecUCompra' debe ser de tipo lógico.], 0+16, THIS.Name + '.SetFecUCompra()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.dFecUCompra = tdFecUCompra
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetCodigo
      RETURN THIS.cCodigo
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetCodAltern
      RETURN THIS.cCodAltern
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetCodOrig
      RETURN THIS.cCodOrig
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetNombre
      RETURN THIS.cNombre
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetAplicacion
      RETURN THIS.mAplicacion
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
   FUNCTION GetStockActu
      RETURN THIS.nStockActu
   ENDFUNC

  * ---------------------------------------------------------------------------- *
   FUNCTION GetStockOT
      RETURN THIS.nStockOT
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetNuevoCodigo()
      LOCAL lnCodigo
      lnCodigo = 1

      SELECT (THIS.cTabla)
      SET ORDER TO indice8   && VAL(codigo)
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
      LPARAMETER tcCodigo, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF VARTYPE(tcCodigo) = 'C' THEN
         IF LEN(tcCodigo) > 15 THEN
            MESSAGEBOX([La longitud del parámetro 'tcCodigo' debe ser como máximo de 15 caracteres.], 0+16, THIS.Name + '.BuscarPorCodigo()')
            RETURN .F.
         ENDIF

         IF AT('[', tcCodigo) > 0 THEN
            MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.BuscarPorCodigo()')
            RETURN .F.
         ENDIF

         IF AT(']', tcCodigo) > 0 THEN
            MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.BuscarPorCodigo()')
            RETURN .F.
         ENDIF
      ENDIF

      IF EMPTY(IIF(!INLIST(VARTYPE(tcCodigo), 'L', 'X'), tcCodigo, THIS.cCodigo)) THEN
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

      LOCAL llRetorno, lcCursor, lcCodigo, lcSQL
      llRetorno = .T.
      lcCursor = CreaTemp()
      lcCodigo = IIF(!INLIST(VARTYPE(tcCodigo), 'L', 'X'), ALLTRIM(tcCodigo), ALLTRIM(THIS.cCodigo))

      IF ISNULL(tcCondicionFiltrado) THEN
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(codigo) LIKE [' + ALLTRIM(UPPER(lcCodigo)) + '] INTO CURSOR ' + lcCursor
      ELSE
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(codigo) LIKE [' + ALLTRIM(UPPER(lcCodigo)) + '] AND ' + tcCondicionFiltrado + ' INTO CURSOR ' + lcCursor
      ENDIF

      &lcSQL

      SELECT (lcCursor)
      DO CASE
      CASE _TALLY = 0   && No hay registros.
         llRetorno = .F.
      CASE _TALLY = 1   && Se ha encontrado un registro.
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
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      ENDCASE

      SELECT (lcCursor)
      USE

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION BuscarPorCodAltern
      LPARAMETER tcCodAltern, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF VARTYPE(tcCodAltern) = 'C' THEN
         IF LEN(tcCodAltern) > 15 THEN
            MESSAGEBOX([La longitud del parámetro 'tcCodAltern' debe ser como máximo de 15 caracteres.], 0+16, THIS.Name + '.BuscarPorCodAltern()')
            RETURN .F.
         ENDIF

         IF AT('[', tcCodAltern) > 0 THEN
            MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.BuscarPorCodAltern()')
            RETURN .F.
         ENDIF

         IF AT(']', tcCodAltern) > 0 THEN
            MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.BuscarPorCodAltern()')
            RETURN .F.
         ENDIF
      ENDIF

      IF EMPTY(IIF(!INLIST(VARTYPE(tcCodAltern), 'L', 'X'), tcCodAltern, THIS.cCodAltern)) THEN
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

      LOCAL llRetorno, lcCursor, lcCodAltern, lcSQL
      llRetorno = .T.
      lcCursor = CreaTemp()
      lcCodAltern = IIF(!INLIST(VARTYPE(tcCodAltern), 'L', 'X'), ALLTRIM(tcCodAltern), ALLTRIM(THIS.cCodAltern))

      IF ISNULL(tcCondicionFiltrado) THEN
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(codigo2) LIKE [' + ALLTRIM(UPPER(lcCodAltern)) + '] INTO CURSOR ' + lcCursor
      ELSE
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(codigo2) LIKE [' + ALLTRIM(UPPER(lcCodAltern)) + '] AND ' + tcCondicionFiltrado + ' INTO CURSOR ' + lcCursor
      ENDIF

      &lcSQL

      SELECT (lcCursor)
      DO CASE
      CASE _TALLY = 0   && No hay registros.
         llRetorno = .F.
      CASE _TALLY = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorCodAltern()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE _TALLY > 1   && Se ha encontrado más de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorCodAltern()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorCodAltern()')
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
   FUNCTION BuscarPorCodOrig
      LPARAMETER tcCodOrig, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF VARTYPE(tcCodOrig) = 'C' THEN
         IF LEN(tcCodOrig) > 15 THEN
            MESSAGEBOX([La longitud del parámetro 'tcCodOrig' debe ser como máximo de 15 caracteres.], 0+16, THIS.Name + '.BuscarPorCodOrig()')
            RETURN .F.
         ENDIF

         IF AT('[', tcCodOrig) > 0 THEN
            MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.BuscarPorCodOrig()')
            RETURN .F.
         ENDIF

         IF AT(']', tcCodOrig) > 0 THEN
            MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.BuscarPorCodOrig()')
            RETURN .F.
         ENDIF
      ENDIF

      IF EMPTY(IIF(!INLIST(VARTYPE(tcCodOrig), 'L', 'X'), tcCodOrig, THIS.cCodOrig)) THEN
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

      LOCAL llRetorno, lcCursor, lcCodOrig, lcSQL
      llRetorno = .T.
      lcCursor = CreaTemp()
      lcCodOrig = IIF(!INLIST(VARTYPE(tcCodOrig), 'L', 'X'), ALLTRIM(tcCodOrig), ALLTRIM(THIS.cCodOrig))

      IF ISNULL(tcCondicionFiltrado) THEN
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(codorig) LIKE [' + ALLTRIM(UPPER(lcCodOrig)) + '] INTO CURSOR ' + lcCursor
      ELSE
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(codorig) LIKE [' + ALLTRIM(UPPER(lcCodOrig)) + '] AND ' + tcCondicionFiltrado + ' INTO CURSOR ' + lcCursor
      ENDIF

      &lcSQL

      SELECT (lcCursor)
      DO CASE
      CASE _TALLY = 0   && No hay registros.
         llRetorno = .F.
      CASE _TALLY = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorCodOrig()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE _TALLY > 1   && Se ha encontrado más de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorCodOrig()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorCodOrig()')
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
   FUNCTION BuscarPorNombre
      LPARAMETER tcNombre, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF VARTYPE(tcNombre) = 'C' THEN
         IF LEN(tcNombre) > 40 THEN
            MESSAGEBOX([La longitud del parámetro 'tcNombre' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.BuscarPorNombre()')
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
      IF EMPTY(THIS.cCodigo) THEN
         MESSAGEBOX('El codigo no puede quedar en blanco.', 0+16, THIS.Name + '.ValidarCodigo()')
         RETURN .F.
      ENDIF

      LOCAL llRetorno, loModelo, llExiste
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorCodigo(THIS.cCodigo)

      DO CASE
      CASE THIS.nBandera = 1   && Agregar.
         IF llExiste THEN
            MESSAGEBOX('El codigo ya existe.', 0+16, THIS.Name + '.ValidarCodigo()')
            llRetorno = .F.
         ENDIF
      CASE THIS.nBandera = 2   && Modificar.
         IF !llExiste THEN
            MESSAGEBOX('El codigo no existe.', 0+16, THIS.Name + '.ValidarCodigo()')
            llRetorno = .F.
         ENDIF
      ENDCASE

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarCodAltern()
      IF EMPTY(THIS.cCodAltern) THEN
         RETURN .T.
      ENDIF

      LOCAL llRetorno, loModelo, llExiste
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorCodAltern(THIS.cCodAltern)

      DO CASE
      CASE THIS.nBandera = 1   && Agregar.
         IF llExiste THEN
            MESSAGEBOX('El código alternativo ya existe.', 0+16, THIS.Name + '.ValidarCodAltern()')
            llRetorno = .F.
         ENDIF
      CASE THIS.nBandera = 2   && Modificar.
         IF llExiste AND loModelo.GetCodigo() <> THIS.nCodigo THEN
            MESSAGEBOX('El código alternativo ya existe.', 0+16, THIS.Name + '.ValidarCodAltern()')
            llRetorno = .F.
         ENDIF
      ENDCASE

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarCodOrig()
      IF EMPTY(THIS.cCodOrig) THEN
         RETURN .T.
      ENDIF

      LOCAL llRetorno, loModelo, llExiste
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorCodOrig(THIS.cCodOrig)

      DO CASE
      CASE THIS.nBandera = 1   && Agregar.
         IF llExiste THEN
            MESSAGEBOX('El código original ya existe.', 0+16, THIS.Name + '.ValidarCodOrig()')
            llRetorno = .F.
         ENDIF
      CASE THIS.nBandera = 2   && Modificar.
         IF llExiste AND loModelo.GetCodigo() <> THIS.nCodigo THEN
            MESSAGEBOX('El código original ya existe.', 0+16, THIS.Name + '.ValidarCodOrig()')
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
   FUNCTION ValidarFamilia()
      IF !BETWEEN(THIS.nFamilia, 1, 9999) THEN
         MESSAGEBOX([La familia debe ser un valor entre 1 y 9999.], 0+16, THIS.Name + '.ValidarFamilia()')
         RETURN .F.
      ENDIF

      IF THIS.nFamilia <> 0 THEN
         IF EMPTY(THIS.oFamilia.GetNombre()) THEN
            MESSAGEBOX('La familia no existe.', 0+16, THIS.Name + '.ValidarFamilia()')
            RETURN .F.
         ENDIF

         IF !THIS.oFamilia.GetVigente() THEN
            MESSAGEBOX('La familia no está vigente.', 0+16, THIS.Name + '.ValidarFamilia()')
            RETURN .F.
         ENDIF
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarRubro()
      IF !BETWEEN(THIS.nRubro, 1, 9999) THEN
         MESSAGEBOX([El rubro debe ser un valor entre 1 y 9999.], 0+16, THIS.Name + '.ValidarRubro()')
         RETURN .F.
      ENDIF

      IF THIS.nRubro <> 0 THEN
         IF EMPTY(THIS.oRubro.GetNombre()) THEN
            MESSAGEBOX('El rubro no existe.', 0+16, THIS.Name + '.ValidarRubro()')
            RETURN .F.
         ENDIF

         IF !THIS.oRubro.GetVigente() THEN
            MESSAGEBOX('El rubro no está vigente.', 0+16, THIS.Name + '.ValidarRubro()')
            RETURN .F.
         ENDIF
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarSubRubro()
      IF !BETWEEN(THIS.nSubRubro, 1, 9999) THEN
         MESSAGEBOX([El sub-rubro debe ser un valor entre 1 y 9999.], 0+16, THIS.Name + '.ValidarSubRubro()')
         RETURN .F.
      ENDIF

      IF THIS.nSubRubro <> 0 THEN
         IF EMPTY(THIS.oSubRubro.GetNombre()) THEN
            MESSAGEBOX('El sub-rubro no existe.', 0+16, THIS.Name + '.ValidarSubRubro()')
            RETURN .F.
         ENDIF

         IF !THIS.oSubRubro.GetVigente() THEN
            MESSAGEBOX('El sub-rubro no está vigente.', 0+16, THIS.Name + '.ValidarSubRubro()')
            RETURN .F.
         ENDIF
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarMarca()
      IF !BETWEEN(THIS.nMarca, 1, 9999) THEN
         MESSAGEBOX([La marca debe ser un valor entre 1 y 9999.], 0+16, THIS.Name + '.ValidarMarca()')
         RETURN .F.
      ENDIF

      IF THIS.nMarca <> 0 THEN
         IF EMPTY(THIS.oMarca.GetNombre()) THEN
            MESSAGEBOX('La marca no existe.', 0+16, THIS.Name + '.ValidarMarca()')
            RETURN .F.
         ENDIF

         IF !THIS.oMarca.GetVigente() THEN
            MESSAGEBOX('La marca no está vigente.', 0+16, THIS.Name + '.ValidarMarca()')
            RETURN .F.
         ENDIF
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarUnidadMedida()
      IF !BETWEEN(THIS.nUnidadMedida, 1, 999) THEN
         MESSAGEBOX([La unidad de medida debe ser un valor entre 1 y 999.], 0+16, THIS.Name + '.ValidarUnidadMedida()')
         RETURN .F.
      ENDIF

      IF THIS.nUnidadMedida <> 0 THEN
         IF EMPTY(THIS.oUnidadMedida.GetNombre()) THEN
            MESSAGEBOX('La unidad de medida no existe.', 0+16, THIS.Name + '.ValidarUnidadMedida()')
            RETURN .F.
         ENDIF

         IF !THIS.oUnidadMedida.GetVigente() THEN
            MESSAGEBOX('La unidad de medida no está vigente.', 0+16, THIS.Name + '.ValidarUnidadMedida()')
            RETURN .F.
         ENDIF
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPais()
      IF !BETWEEN(THIS.nPais, 1, 9999) THEN
         MESSAGEBOX([El país debe ser un valor entre 1 y 9999.], 0+16, THIS.Name + '.ValidarPais()')
         RETURN .F.
      ENDIF

      IF THIS.nPais <> 0 THEN
         IF EMPTY(THIS.oPais.GetNombre()) THEN
            MESSAGEBOX('El país no existe.', 0+16, THIS.Name + '.ValidarPais()')
            RETURN .F.
         ENDIF

         IF !THIS.oPais.GetVigente() THEN
            MESSAGEBOX('El país no está vigente.', 0+16, THIS.Name + '.ValidarPais()')
            RETURN .F.
         ENDIF
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarProveedor()
      IF !BETWEEN(THIS.nProveedor, 1, 99999) THEN
         MESSAGEBOX([El proveedor debe ser un valor entre 1 y 99999.], 0+16, THIS.Name + '.ValidarProveedor()')
         RETURN .F.
      ENDIF

      IF THIS.nProveedor <> 0 THEN
         IF EMPTY(THIS.oProveedor.GetNombre()) THEN
            MESSAGEBOX('El proveedor no existe.', 0+16, THIS.Name + '.ValidarProveedor()')
            RETURN .F.
         ENDIF

         IF !THIS.oProveedor.GetVigente() THEN
            MESSAGEBOX('El proveedor no está vigente.', 0+16, THIS.Name + '.ValidarProveedor()')
            RETURN .F.
         ENDIF
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPorcIVA()
      IF !BETWEEN(THIS.nPorcIVA, 0, 999.99) THEN
         MESSAGEBOX('El porcentaje del IVA debe ser un valor entre 0 y 999.99.', 0+16, THIS.Name + '.ValidarPorcIVA()')
         RETURN .F.
      ENDIF

      IF !INLIST(THIS.nPorcIVA, 0, 5, 10) THEN
         MESSAGEBOX('El porcentaje del IVA debe ser uno de los siguientes valores: 0, 5 ó 10.', 0+16, THIS.Name + '.ValidarPorcIVA()')
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
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPCostoG()
      IF THIS.nPCostoG < 0 THEN
         MESSAGEBOX('El precio de costo en guaraníes (PYG) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPCostoG()')
         RETURN .F.
      ENDIF

      IF THIS.nPCostoG > 99999999.9999 THEN
         MESSAGEBOX('El precio de costo en guaraníes (PYG) debe ser menor o igual a 99999999.9999.', 0+16, THIS.Name + '.ValidarPCostoG()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPcostoD()
      IF THIS.nPcostoD < 0 THEN
         MESSAGEBOX('El precio de costo en dólares (USD) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPcostoD()')
         RETURN .F.
      ENDIF

      IF THIS.nPcostoD > 99999999.9999 THEN
         MESSAGEBOX('El precio de costo en dólares (USD) debe ser menor o igual a 99999999.9999.', 0+16, THIS.Name + '.ValidarPcostoD()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPVentaG1()
      IF THIS.nPVentaG1 < 0 THEN
         MESSAGEBOX('El precio de venta 1 en guaraníes (PYG) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPVentaG1()')
         RETURN .F.
      ENDIF

      IF THIS.nPVentaG1 > 99999999.9999 THEN
         MESSAGEBOX('El precio de venta 1 en guaraníes (PYG) debe ser menor o igual a 99999999.9999.', 0+16, THIS.Name + '.ValidarPVentaG1()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPVentaG2()
      IF THIS.nPVentaG2 < 0 THEN
         MESSAGEBOX('El precio de venta 2 en guaraníes (PYG) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPVentaG2()')
         RETURN .F.
      ENDIF

      IF THIS.nPVentaG2 > 99999999.9999 THEN
         MESSAGEBOX('El precio de venta 2 en guaraníes (PYG) debe ser menor o igual a 99999999.9999.', 0+16, THIS.Name + '.ValidarPVentaG2()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPVentaG3()
      IF THIS.nPVentaG3 < 0 THEN
         MESSAGEBOX('El precio de venta 3 en guaraníes (PYG) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPVentaG3()')
         RETURN .F.
      ENDIF

      IF THIS.nPVentaG3 > 99999999.9999 THEN
         MESSAGEBOX('El precio de venta 3 en guaraníes (PYG) debe ser menor o igual a 99999999.9999.', 0+16, THIS.Name + '.ValidarPVentaG3()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPVentaG4()
      IF THIS.nPVentaG4 < 0 THEN
         MESSAGEBOX('El precio de venta 4 en guaraníes (PYG) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPVentaG4()')
         RETURN .F.
      ENDIF

      IF THIS.nPVentaG4 > 99999999.9999 THEN
         MESSAGEBOX('El precio de venta 4 en guaraníes (PYG) debe ser menor o igual a 99999999.9999.', 0+16, THIS.Name + '.ValidarPVentaG4()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPVentaG5()
      IF THIS.nPVentaG5 < 0 THEN
         MESSAGEBOX('El precio de venta 5 en guaraníes (PYG) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPVentaG5()')
         RETURN .F.
      ENDIF

      IF THIS.nPVentaG5 > 99999999.9999 THEN
         MESSAGEBOX('El precio de venta 5 en guaraníes (PYG) debe ser menor o igual a 99999999.9999.', 0+16, THIS.Name + '.ValidarPVentaG5()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPVentaD1()
      IF THIS.nPVentaD1 < 0 THEN
         MESSAGEBOX('El precio de venta 1 en dólares (USD) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPVentaD1()')
         RETURN .F.
      ENDIF

      IF THIS.nPVentaD1 > 99999999.9999 THEN
         MESSAGEBOX('El precio de venta 1 en dólares (USD) debe ser menor o igual a 99999999.9999.', 0+16, THIS.Name + '.ValidarPVentaD1()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPVentaD2()
      IF THIS.nPVentaD2 < 0 THEN
         MESSAGEBOX('El precio de venta 2 en dólares (USD) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPVentaD2()')
         RETURN .F.
      ENDIF

      IF THIS.nPVentaD2 > 99999999.9999 THEN
         MESSAGEBOX('El precio de venta 2 en dólares (USD) debe ser menor o igual a 99999999.9999.', 0+16, THIS.Name + '.ValidarPVentaD2()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPVentaD3()
      IF THIS.nPVentaD3 < 0 THEN
         MESSAGEBOX('El precio de venta 3 en dólares (USD) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPVentaD3()')
         RETURN .F.
      ENDIF

      IF THIS.nPVentaD3 > 99999999.9999 THEN
         MESSAGEBOX('El precio de venta 3 en dólares (USD) debe ser menor o igual a 99999999.9999.', 0+16, THIS.Name + '.ValidarPVentaD3()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPVentaD4()
      IF THIS.nPVentaD4 < 0 THEN
         MESSAGEBOX('El precio de venta 4 en dólares (USD) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPVentaD4()')
         RETURN .F.
      ENDIF

      IF THIS.nPVentaD4 > 99999999.9999 THEN
         MESSAGEBOX('El precio de venta 4 en dólares (USD) debe ser menor o igual a 99999999.9999.', 0+16, THIS.Name + '.ValidarPVentaD4()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPVentaD5()
      IF THIS.nPVentaD5 < 0 THEN
         MESSAGEBOX('El precio de venta 5 en dólares (USD) debe ser mayor o igual a cero.', 0+16, THIS.Name + '.ValidarPVentaD5()')
         RETURN .F.
      ENDIF

      IF THIS.nPVentaD5 > 99999999.9999 THEN
         MESSAGEBOX('El precio de venta 5 en dólares (USD) debe ser menor o igual a 99999999.9999.', 0+16, THIS.Name + '.ValidarPVentaD5()')
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
         MESSAGEBOX('El stock mínimo debe ser menor o igual a 99999999.99.', 0+16, THIS.Name + '.ValidarStockMin()')
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
         MESSAGEBOX('El stock máximo debe ser menor o igual a 99999999.99.', 0+16, THIS.Name + '.ValidarStockMax()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION CargarDatos
      WITH THIS
         .cCodigo = codigo
         .cCodAltern = codigo2
         .cCodOrig = codorig
         .cNombre = nombre
         .mAplicacion = aplicacion
         .nFamilia = familia
         .nRubro = rubro
         .nSubRubro = subrubro
         .nMarca = marca
         .nUnidadMedida = unidad
         .nProveedor = proveedor
         .nPais = procedenci
         .cUbicacion = ubicacion
         .lVigente = vigente
         .lLPrecio = lprecio
         .lGravado = impuesto
         .nPorcIVA = pimpuesto
         .nPCostoG = pcostog
         .nPCostoD = pcostod
         .nPVentaG1 = pventag1
         .nPVentaG2 = pventag2
         .nPVentaG3 = pventag3
         .nPVentaG4 = pventag4
         .nPVentaG5 = pventag5
         .nPVentaD1 = pventad1
         .nPVentaD2 = pventad2
         .nPVentaD3 = pventad3
         .nPVentaD4 = pventad4
         .nPVentaD5 = pventad5
         .nStockMin = stock_min
         .nStockMax = stock_max
         .lPolInvSMin = polinvsmin
         .lPolInvSMax = polinvsmax
         .cCaracter1 = caracter1
         .cCaracter2 = caracter2
         .cCaracter3 = caracter3
         .cOtros1 = otros1
         .cOtros2 = otros2
         .dFecUCompra = fecucompra
         .nStockActu = stock_actu
         .nStockOt = stock_ot
      ENDWITH
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Validar
      IF !THIS.ValidarCodigo() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarCodAltern() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarCodOrig() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarNombre() THEN
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

      IF !THIS.ValidarPais() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarProveedor() THEN
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
         INSERT INTO (THIS.cTabla) (codigo, codigo2, codorig, nombre, aplicacion, familia, rubro, subrubro, marca, unidad, ;
                                    proveedor, procedenci, ubicacion, vigente, lprecio, impuesto, pimpuesto, pcostog, pcostod, ;
                                    pventag1, pventag2, pventag3, pventag4, pventag5, pventad1, pventad2, pventad3, pventad4, ;
                                    pventad5, stock_min, stock_max, polinvsmin, polinvsmax, caracter1, caracter2, caracter3, ;
                                    otros1, otros2, fecucompra, stock_actu, stock_ot) ;
            VALUES (THIS.cCodigo, THIS.cCodAltern, THIS.cCodOrig, THIS.cNombre, THIS.mAplicacion, THIS.nFamilia, THIS.nRubro, ;
                    THIS.nSubRubro, THIS.nMarca, THIS.nUnidadMedida, THIS.nProveedor, THIS.nPais, THIS.cUbicacion, THIS.lVigente, ;
                    THIS.lLPrecio, THIS.lGravado, THIS.nPorcIVA, THIS.nPCostoG, THIS.nPCostoD, THIS.nPVentaG1, THIS.nPVentaG2, ;
                    THIS.nPVentaG3, THIS.nPVentaG4, THIS.nPVentaG5, THIS.nPVentaD1, THIS.nPVentaD2, THIS.nPVentaD3, THIS.nPVentaD4, ;
                    THIS.nPVentaD5, THIS.nStockMin, THIS.nStockMax, THIS.lPolInvSMin, THIS.lPolInvSMax, THIS.cCaracter1, ;
                    THIS.cCaracter2, THIS.cCaracter3, THIS.cOtros1, THIS.cOtros2, THIS.dFecUCompra, THIS.nStockActu, THIS.nStockOt)

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
            codigo2 = THIS.cCodAltern, ;
            codorig = THIS.cCodOrig, ;
            nombre = THIS.cNombre, ;
            aplicacion = THIS.mAplicacion, ;
            familia = THIS.nFamilia, ;
            rubro = THIS.nRubro, ;
            subrubro = THIS.nSubRubro, ;
            marca = THIS.nMarca, ;
            unidad = THIS.nUnidad, ;
            proveedor = THIS.nProveedor, ;
            procedenci = THIS.nPais, ;
            ubicacion = THIS.cUbicacion, ;
            vigente = THIS.lVigente, ;
            lprecio = THIS.lLPrecio, ;
            impuesto = THIS.lGravado , ;
            pimpuesto = THIS.nPorcIVA, ;
            pcostog = THIS.nPCostoG, ;
            pcostod = THIS.nPCostoD, ;
            pventag1 = THIS.nPVentaG1, ;
            pventag2 = THIS.nPVentaG2, ;
            pventag3 = THIS.nPVentaG3, ;
            pventag4 = THIS.nPVentaG4, ;
            pventag5 = THIS.nPVentaG5, ;
            pventad1 = THIS.nPVentaD1, ;
            pventad2 = THIS.nPVentaD2, ;
            pventad3 = THIS.nPVentaD3, ;
            pventad4 = THIS.nPVentaD4, ;
            pventad5 = THIS.nPVentaD5, ;
            stock_min = THIS.nStockMin, ;
            stock_max = THIS.nStockMax, ;
            polinvsmin = THIS.lPolInvSMin, ;
            polinvsmax = THIS.lPolInvSMax, ;
            caracter1 = THIS.cCaracter1, ;
            caracter2 = THIS.cCaracter2, ;
            caracter3 = THIS.cCaracter3, ;
            otros1 = THIS.cOtros1, ;
            otros2 = THIS.cOtros2, ;
            fecucompra = THIS.dFecUCompra ;
         WHERE ;
            EVALUATE(THIS.cClavePrimaria) = THIS.cCodigo

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

      * Compras.
      IF llRetorno THEN
         lcSQL = 'SELECT TOP 1 ' + THIS.cClaveForanea + ' FROM detacomp ORDER BY ' + THIS.cClaveForanea + ' WHERE ' + THIS.cClaveForanea + ' = ' + ALLTRIM(STR(lnCodigo)) + ' INTO CURSOR ' + lcCursor
         &lcSQL
         IF _TALLY > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Compras', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF

      * Devoluciones a Proveedores.
      IF llRetorno THEN
         lcSQL = 'SELECT TOP 1 ' + THIS.cClaveForanea + ' FROM detanotp ORDER BY ' + THIS.cClaveForanea + ' WHERE ' + THIS.cClaveForanea + ' = ' + ALLTRIM(STR(lnCodigo)) + ' INTO CURSOR ' + lcCursor
         &lcSQL
         IF _TALLY > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Devoluciones a Proveedores', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF

      * Pedido de Clientes.
      IF llRetorno THEN
         lcSQL = 'SELECT TOP 1 ' + THIS.cClaveForanea + ' FROM detapedc ORDER BY ' + THIS.cClaveForanea + ' WHERE ' + THIS.cClaveForanea + ' = ' + ALLTRIM(STR(lnCodigo)) + ' INTO CURSOR ' + lcCursor
         &lcSQL
         IF _TALLY > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Pedidos de Clientes', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF

      * Pedido de Clientes en Dólares Estadounidenses (USD).
      IF llRetorno THEN
         lcSQL = 'SELECT TOP 1 ' + THIS.cClaveForanea + ' FROM detapusd ORDER BY ' + THIS.cClaveForanea + ' WHERE ' + THIS.cClaveForanea + ' = ' + ALLTRIM(STR(lnCodigo)) + ' INTO CURSOR ' + lcCursor
         &lcSQL
         IF _TALLY > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Pedidos de Clientes en USD', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF

      * Ventas.
      IF llRetorno THEN
         lcSQL = 'SELECT TOP 1 ' + THIS.cClaveForanea + ' FROM detavent ORDER BY ' + THIS.cClaveForanea + ' WHERE ' + THIS.cClaveForanea + ' = ' + ALLTRIM(STR(lnCodigo)) + ' INTO CURSOR ' + lcCursor
         &lcSQL
         IF _TALLY > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Ventas', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF

      * Devoluciones de Clientes.
      IF llRetorno THEN
         lcSQL = 'SELECT TOP 1 ' + THIS.cClaveForanea + ' FROM detanotc ORDER BY ' + THIS.cClaveForanea + ' WHERE ' + THIS.cClaveForanea + ' = ' + ALLTRIM(STR(lnCodigo)) + ' INTO CURSOR ' + lcCursor
         &lcSQL
         IF _TALLY > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Devoluciones de Clientes', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF

      * Presupuestos de Órdenes de Trabajo.
      IF llRetorno THEN
         lcSQL = 'SELECT TOP 1 ' + THIS.cClaveForanea + ' FROM detamot2 ORDER BY ' + THIS.cClaveForanea + ' WHERE ' + THIS.cClaveForanea + ' = ' + ALLTRIM(STR(lnCodigo)) + ' INTO CURSOR ' + lcCursor
         &lcSQL
         IF _TALLY > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Presupuestos de Órdenes de Trabajo', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF

      * Máquinas Terminadas.
      IF llRetorno THEN
         lcSQL = 'SELECT TOP 1 ' + THIS.cClaveForanea + ' FROM detamot ORDER BY ' + THIS.cClaveForanea + ' WHERE ' + THIS.cClaveForanea + ' = ' + ALLTRIM(STR(lnCodigo)) + ' INTO CURSOR ' + lcCursor
         &lcSQL
         IF _TALLY > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Máquinas Terminadas', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
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