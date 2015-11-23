DEFINE CLASS Cliente AS CUSTOM
   * Propiedades.
   PROTECTED nBandera
   PROTECTED cTabla           && Nombre de la tabla a la cual hace referencia el modelo.
   PROTECTED cClavePrimaria   && Nombre de la clave primaria de la tabla.
   PROTECTED cClaveForanea    && Nombre con el cual se hace referencia a la clave primaria en otras tablas.

   * Campos.
   PROTECTED nCodigo
   PROTECTED cNombre
   PROTECTED cDirec1
   PROTECTED cDirec2
   PROTECTED cDirec3
   PROTECTED cDirec4
   PROTECTED cDirec5
   PROTECTED cDirec6
   PROTECTED cDirec7
   PROTECTED cDirec8
   PROTECTED cDirec9
   PROTECTED nDepartamen
   PROTECTED nCiudad
   PROTECTED nBarrio
   PROTECTED nRuta
   PROTECTED cTelefono
   PROTECTED cFax
   PROTECTED cEMail
   PROTECTED cContacto
   PROTECTED dFechaNac
   PROTECTED cDocumento
   PROTECTED cRUC
   PROTECTED cDV
   PROTECTED cEstado
   PROTECTED nPlazo
   PROTECTED nVendedor
   PROTECTED nLista
   PROTECTED nLimiteCre
   PROTECTED nSaldoActu
   PROTECTED nSaldoUSD
   PROTECTED lFacturar
   PROTECTED dFecIOper
   PROTECTED nMotivoClie
   PROTECTED cODatosClie
   PROTECTED cObs1
   PROTECTED cObs2
   PROTECTED cObs3
   PROTECTED cObs4
   PROTECTED cObs5
   PROTECTED cObs6
   PROTECTED cObs7
   PROTECTED cObs8
   PROTECTED cObs9
   PROTECTED cObs10
   PROTECTED cRef1
   PROTECTED cRef2
   PROTECTED cRef3
   PROTECTED cRef4
   PROTECTED cRef5
   PROTECTED cCuenta

   * Objetos.
   PROTECTED oDepartamen
   PROTECTED oCiudad
   PROTECTED oBarrio
   PROTECTED oRuta
   PROTECTED oPlazo
   PROTECTED oVendedor
   PROTECTED oMotivoClie

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Init
      WITH THIS
         .nBandera = 0
         .cTabla = 'cliente'
         .cClavePrimaria = 'codigo'
         .cClaveForanea = 'cliente'

         .nCodigo = 0
         .cNombre = ''
         .cDirec1 = ''
         .cDirec2 = ''
         .cDirec3 = ''
         .cDirec4 = ''
         .cDirec5 = ''
         .cDirec6 = ''
         .cDirec7 = ''
         .cDirec8 = ''
         .cDirec9 = ''
         .nDepartamen = 0
         .nCiudad = 0
         .nBarrio = 0
         .nRuta = 0
         .cTelefono = ''
         .cFax = ''
         .cEMail = ''
         .cContacto = ''
         .dFechaNac = {}
         .cDocumento = ''
         .cRUC = ''
         .cDV = ''
         .cEstado = ''
         .nPlazo = 0
         .nVendedor = 0
         .nLista = 0
         .nLimiteCre = 0
         .nSaldoActu = 0
         .nSaldoUSD = 0
         .lFacturar = .F.
         .dFecIOper = {}
         .nMotivoClie = 0
         .cODatosClie = ''
         .cObs1 = ''
         .cObs2 = ''
         .cObs3 = ''
         .cObs4 = ''
         .cObs5 = ''
         .cObs6 = ''
         .cObs7 = ''
         .cObs8 = ''
         .cObs9 = ''
         .cObs10 = ''
         .cRef1 = ''
         .cRef2 = ''
         .cRef3 = ''
         .cRef4 = ''
         .cRef5 = ''
         .cCuenta = ''

         .oDepartamen = NEWOBJECT('Depar', 'Depar.prg')
         .oCiudad = NEWOBJECT('Ciudad', 'Ciudad.prg')
         .oBarrio = NEWOBJECT('Barrio', 'Barrio.prg')
         .oRuta = NEWOBJECT('Ruta', 'Ruta.prg')
         .oPlazo = NEWOBJECT('Plazo', 'Plazo.prg')
         .oVendedor = NEWOBJECT('Vendedor', 'Vendedor.prg')
         .oMotivoClie = NEWOBJECT('MotivoCliente', 'MotivoCliente.prg')
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
   FUNCTION SetDirec1
      LPARAMETER tcDirec1

      * inicio { validación de parámetro }
      IF VARTYPE(tcDirec1) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcDirec1' debe ser de tipo texto.], 0+16, THIS.Name + '.SetDirec1()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cDirec1 = tcDirec1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetDirec2
      LPARAMETER tcDirec2

      * inicio { validación de parámetro }
      IF VARTYPE(tcDirec2) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcDirec2' debe ser de tipo texto.], 0+16, THIS.Name + '.SetDirec2()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cDirec2 = tcDirec2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetDirec3
      LPARAMETER tcDirec3

      * inicio { validación de parámetro }
      IF VARTYPE(tcDirec3) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcDirec3' debe ser de tipo texto.], 0+16, THIS.Name + '.SetDirec3()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cDirec3 = tcDirec3
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetDirec4
      LPARAMETER tcDirec4

      * inicio { validación de parámetro }
      IF VARTYPE(tcDirec4) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcDirec4' debe ser de tipo texto.], 0+16, THIS.Name + '.SetDirec4()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cDirec4 = tcDirec4
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetDirec5
      LPARAMETER tcDirec5

      * inicio { validación de parámetro }
      IF VARTYPE(tcDirec5) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcDirec5' debe ser de tipo texto.], 0+16, THIS.Name + '.SetDirec5()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cDirec5 = tcDirec5
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetDirec6
      LPARAMETER tcDirec6

      * inicio { validación de parámetro }
      IF VARTYPE(tcDirec6) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcDirec6' debe ser de tipo texto.], 0+16, THIS.Name + '.SetDirec6()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cDirec6 = tcDirec6
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetDirec7
      LPARAMETER tcDirec7

      * inicio { validación de parámetro }
      IF VARTYPE(tcDirec7) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcDirec7' debe ser de tipo texto.], 0+16, THIS.Name + '.SetDirec7()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cDirec7 = tcDirec7
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetDirec8
      LPARAMETER tcDirec8

      * inicio { validación de parámetro }
      IF VARTYPE(tcDirec8) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcDirec8' debe ser de tipo texto.], 0+16, THIS.Name + '.SetDirec8()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cDirec8 = tcDirec8
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetDirec9
      LPARAMETER tcDirec9

      * inicio { validación de parámetro }
      IF VARTYPE(tcDirec9) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcDirec9' debe ser de tipo texto.], 0+16, THIS.Name + '.SetDirec9()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cDirec9 = tcDirec9
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
   FUNCTION SetBarrio
      LPARAMETER tnBarrio

      * inicio { validación de parámetro }
      IF VARTYPE(tnBarrio) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnBarrio' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetBarrio()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nBarrio = tnBarrio

      IF !THIS.oBarrio.BuscarPorCodigo(THIS.nBarrio) THEN   && El registro no existe.
         WITH THIS.oBarrio
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetRuta
      LPARAMETER tnRuta

      * inicio { validación de parámetro }
      IF VARTYPE(tnRuta) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnRuta' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetRuta()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nRuta = tnRuta

      IF !THIS.oRuta.BuscarPorCodigo(THIS.nRuta) THEN   && El registro no existe.
         WITH THIS.oRuta
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetTelefono
      LPARAMETER tcTelefono

      * inicio { validación de parámetro }
      IF VARTYPE(tcTelefono) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcTelefono' debe ser de tipo texto.], 0+16, THIS.Name + '.SetTelefono()')
         RETURN .F.
      ENDIF

      IF LEN(tcTelefono) > 30 THEN
         MESSAGEBOX([La longitud del parámetro 'tcTelefono' debe ser como máximo de 30 caracteres.], 0+16, THIS.Name + '.SetTelefono()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cTelefono = tcTelefono
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetFax
      LPARAMETER tcFax

      * inicio { validación de parámetro }
      IF VARTYPE(tcFax) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcFax' debe ser de tipo texto.], 0+16, THIS.Name + '.SetFax()')
         RETURN .F.
      ENDIF

      IF LEN(tcFax) > 30 THEN
         MESSAGEBOX([La longitud del parámetro 'tcFax' debe ser como máximo de 30 caracteres.], 0+16, THIS.Name + '.SetFax()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cFax = tcFax
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetEMail
      LPARAMETER tcEMail

      * inicio { validación de parámetro }
      IF VARTYPE(tcEMail) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcEMail' debe ser de tipo texto.], 0+16, THIS.Name + '.SetEMail()')
         RETURN .F.
      ENDIF

      IF LEN(tcEMail) > 40 THEN
         MESSAGEBOX([La longitud del parámetro 'tcEMail' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.SetEMail()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cEMail = LOWER(tcEMail)
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetContacto
      LPARAMETER tcContacto

      * inicio { validación de parámetro }
      IF VARTYPE(tcContacto) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcContacto' debe ser de tipo texto.], 0+16, THIS.Name + '.SetContacto()')
         RETURN .F.
      ENDIF

      IF LEN(tcContacto) > 30 THEN
         MESSAGEBOX([La longitud del parámetro 'tcContacto' debe ser como máximo de 30 caracteres.], 0+16, THIS.Name + '.SetContacto()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cContacto = tcContacto
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetFechaNac
      LPARAMETER tdFechaNac

      * inicio { validación de parámetro }
      IF VARTYPE(tdFechaNac) <> 'D' THEN
         MESSAGEBOX([El parámetro 'tdFechaNac' debe ser de tipo fecha.], 0+16, THIS.Name + '.SetFechaNac()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.dFechaNac = tdFechaNac
   ENDFUNC

  * ---------------------------------------------------------------------------- *
   FUNCTION SetDocumento
      LPARAMETER tcDocumento

      * inicio { validación de parámetro }
      IF VARTYPE(tcDocumento) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcDocumento' debe ser de tipo texto.], 0+16, THIS.Name + '.SetDocumento()')
         RETURN .F.
      ENDIF

      IF LEN(tcDocumento) > 15 THEN
         MESSAGEBOX([La longitud del parámetro 'tcDocumento' debe ser como máximo de 15 caracteres.], 0+16, THIS.Name + '.SetDocumento()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cDocumento = ALLTRIM(tcDocumento)
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetRUC
      LPARAMETER tcRUC

      * inicio { validación de parámetro }
      IF VARTYPE(tcRUC) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcRUC' debe ser de tipo texto.], 0+16, THIS.Name + '.SetRUC()')
         RETURN .F.
      ENDIF

      IF LEN(tcRUC) > 15 THEN
         MESSAGEBOX([La longitud del parámetro 'tcRUC' debe ser como máximo de 15 caracteres.], 0+16, THIS.Name + '.SetRUC()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cRUC = ALLTRIM(tcRUC)
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetDV
      LPARAMETER tcDV

      * inicio { validación de parámetro }
      IF VARTYPE(tcDV) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcDV' debe ser de tipo texto.], 0+16, THIS.Name + '.SetDV()')
         RETURN .F.
      ENDIF

      IF LEN(tcDV) > 1 THEN
         MESSAGEBOX([La longitud del parámetro 'tcDV' debe ser como máximo de 1 caracter.], 0+16, THIS.Name + '.SetDV()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cDV = tcDV
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetEstado
      LPARAMETER tcEstado

      * inicio { validación de parámetro }
      IF VARTYPE(tcEstado) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcEstado' debe ser de tipo texto.], 0+16, THIS.Name + '.SetEstado()')
         RETURN .F.
      ENDIF

      IF LEN(tcEstado) > 1 THEN
         MESSAGEBOX([La longitud del parámetro 'tcEstado' debe ser como máximo de 1 caracter.], 0+16, THIS.Name + '.SetEstado()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cEstado = tcEstado
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
   FUNCTION SetVendedor
      LPARAMETER tnVendedor

      * inicio { validación de parámetro }
      IF VARTYPE(tnVendedor) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnVendedor' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetVendedor()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nVendedor = tnVendedor

      IF !THIS.oVendedor.BuscarPorCodigo(THIS.nVendedor) THEN   && El registro no existe.
         WITH THIS.oVendedor
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetLista
      LPARAMETER tnLista

      * inicio { validación de parámetro }
      IF VARTYPE(tnLista) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnLista' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetLista()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nLista = tnLista
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetLimiteCre
      LPARAMETER tnLimiteCre

      * inicio { validación de parámetro }
      IF VARTYPE(tnLimiteCre) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnLimiteCre' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetLimiteCre()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nLimiteCre = tnLimiteCre
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetFacturar
      LPARAMETER tlFacturar

      * inicio { validación de parámetro }
      IF VARTYPE(tlFacturar) <> 'L' THEN
         MESSAGEBOX([El parámetro 'tlFacturar' debe ser de tipo lógico.], 0+16, THIS.Name + '.SetFacturar()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.lFacturar = tlFacturar
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetFecIOper
      LPARAMETER tdFecIOper

      * inicio { validación de parámetro }
      IF VARTYPE(tdFecIOper) <> 'D' THEN
         MESSAGEBOX([El parámetro 'tdFecIOper' debe ser de tipo fecha.], 0+16, THIS.Name + '.SetFecIOper()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.dFecIOper = tdFecIOper
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetMotivoClie
      LPARAMETER tnMotivoClie

      * inicio { validación de parámetro }
      IF VARTYPE(tnMotivoClie) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnMotivoClie' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetMotivoClie()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nMotivoClie = tnMotivoClie

      IF !THIS.oMotivoClie.BuscarPorCodigo(THIS.nMotivoClie) THEN   && El registro no existe.
         WITH THIS.oMotivoClie
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetODatosClie
      LPARAMETER tcODatosClie

      * inicio { validación de parámetro }
      IF VARTYPE(tcODatosClie) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcODatosClie' debe ser de tipo texto.], 0+16, THIS.Name + '.SetODatosClie()')
         RETURN .F.
      ENDIF

      IF LEN(tcODatosClie) > 40 THEN
         MESSAGEBOX([La longitud del parámetro 'tcODatosClie' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.SetODatosClie()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cODatosClie = tcODatosClie
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetObs1
      LPARAMETER tcObs1

      * inicio { validación de parámetro }
      IF VARTYPE(tcObs1) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcObs1' debe ser de tipo texto.], 0+16, THIS.Name + '.SetObs1()')
         RETURN .F.
      ENDIF

      IF LEN(tcObs1) > 72 THEN
         MESSAGEBOX([La longitud del parámetro 'tcObs1' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.SetObs1()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cObs1 = tcObs1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetObs2
      LPARAMETER tcObs2

      * inicio { validación de parámetro }
      IF VARTYPE(tcObs2) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcObs2' debe ser de tipo texto.], 0+16, THIS.Name + '.SetObs2()')
         RETURN .F.
      ENDIF

      IF LEN(tcObs2) > 72 THEN
         MESSAGEBOX([La longitud del parámetro 'tcObs2' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.SetObs2()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cObs2 = tcObs2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetObs3
      LPARAMETER tcObs3

      * inicio { validación de parámetro }
      IF VARTYPE(tcObs3) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcObs3' debe ser de tipo texto.], 0+16, THIS.Name + '.SetObs3()')
         RETURN .F.
      ENDIF

      IF LEN(tcObs3) > 72 THEN
         MESSAGEBOX([La longitud del parámetro 'tcObs3' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.SetObs3()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cObs3 = tcObs3
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetObs4
      LPARAMETER tcObs4

      * inicio { validación de parámetro }
      IF VARTYPE(tcObs4) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcObs4' debe ser de tipo texto.], 0+16, THIS.Name + '.SetObs4()')
         RETURN .F.
      ENDIF

      IF LEN(tcObs4) > 72 THEN
         MESSAGEBOX([La longitud del parámetro 'tcObs4' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.SetObs4()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cObs4 = tcObs4
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetObs5
      LPARAMETER tcObs5

      * inicio { validación de parámetro }
      IF VARTYPE(tcObs5) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcObs5' debe ser de tipo texto.], 0+16, THIS.Name + '.SetObs5()')
         RETURN .F.
      ENDIF

      IF LEN(tcObs5) > 72 THEN
         MESSAGEBOX([La longitud del parámetro 'tcObs5' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.SetObs5()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cObs5 = tcObs5
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetObs6
      LPARAMETER tcObs6

      * inicio { validación de parámetro }
      IF VARTYPE(tcObs6) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcObs6' debe ser de tipo texto.], 0+16, THIS.Name + '.SetObs6()')
         RETURN .F.
      ENDIF

      IF LEN(tcObs6) > 72 THEN
         MESSAGEBOX([La longitud del parámetro 'tcObs6' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.SetObs6()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cObs6 = tcObs6
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetObs7
      LPARAMETER tcObs7

      * inicio { validación de parámetro }
      IF VARTYPE(tcObs7) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcObs7' debe ser de tipo texto.], 0+16, THIS.Name + '.SetObs7()')
         RETURN .F.
      ENDIF

      IF LEN(tcObs7) > 72 THEN
         MESSAGEBOX([La longitud del parámetro 'tcObs7' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.SetObs7()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cObs7 = tcObs7
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetObs8
      LPARAMETER tcObs8

      * inicio { validación de parámetro }
      IF VARTYPE(tcObs8) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcObs8' debe ser de tipo texto.], 0+16, THIS.Name + '.SetObs8()')
         RETURN .F.
      ENDIF

      IF LEN(tcObs8) > 72 THEN
         MESSAGEBOX([La longitud del parámetro 'tcObs8' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.SetObs8()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cObs8 = tcObs8
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetObs9
      LPARAMETER tcObs9

      * inicio { validación de parámetro }
      IF VARTYPE(tcObs9) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcObs9' debe ser de tipo texto.], 0+16, THIS.Name + '.SetObs9()')
         RETURN .F.
      ENDIF

      IF LEN(tcObs9) > 72 THEN
         MESSAGEBOX([La longitud del parámetro 'tcObs9' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.SetObs9()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cObs9 = tcObs9
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetObs10
      LPARAMETER tcObs10

      * inicio { validación de parámetro }
      IF VARTYPE(tcObs10) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcObs10' debe ser de tipo texto.], 0+16, THIS.Name + '.SetObs9()')
         RETURN .F.
      ENDIF

      IF LEN(tcObs10) > 72 THEN
         MESSAGEBOX([La longitud del parámetro 'tcObs10' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.SetObs9()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cObs10 = tcObs10
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetRef1
      LPARAMETER tcRef1

      * inicio { validación de parámetro }
      IF VARTYPE(tcRef1) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcRef1' debe ser de tipo texto.], 0+16, THIS.Name + '.SetRef1()')
         RETURN .F.
      ENDIF

      IF LEN(tcRef1) > 72 THEN
         MESSAGEBOX([La longitud del parámetro 'tcRef1' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.SetRef1()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cRef1 = tcRef1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetRef2
      LPARAMETER tcRef2

      * inicio { validación de parámetro }
      IF VARTYPE(tcRef2) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcRef2' debe ser de tipo texto.], 0+16, THIS.Name + '.SetRef2()')
         RETURN .F.
      ENDIF

      IF LEN(tcRef2) > 72 THEN
         MESSAGEBOX([La longitud del parámetro 'tcRef2' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.SetRef2()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cRef2 = tcRef2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetRef3
      LPARAMETER tcRef3

      * inicio { validación de parámetro }
      IF VARTYPE(tcRef3) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcRef3' debe ser de tipo texto.], 0+16, THIS.Name + '.SetRef3()')
         RETURN .F.
      ENDIF

      IF LEN(tcRef3) > 72 THEN
         MESSAGEBOX([La longitud del parámetro 'tcRef3' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.SetRef3()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cRef3 = tcRef3
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetRef4
      LPARAMETER tcRef4

      * inicio { validación de parámetro }
      IF VARTYPE(tcRef4) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcRef4' debe ser de tipo texto.], 0+16, THIS.Name + '.SetRef4()')
         RETURN .F.
      ENDIF

      IF LEN(tcRef4) > 72 THEN
         MESSAGEBOX([La longitud del parámetro 'tcRef4' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.SetRef4()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cRef4 = tcRef4
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetRef5
      LPARAMETER tcRef5

      * inicio { validación de parámetro }
      IF VARTYPE(tcRef5) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcRef5' debe ser de tipo texto.], 0+16, THIS.Name + '.SetRef5()')
         RETURN .F.
      ENDIF

      IF LEN(tcRef5) > 72 THEN
         MESSAGEBOX([La longitud del parámetro 'tcRef5' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.SetRef5()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cRef5 = tcRef5
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
   FUNCTION GetDirec1
      RETURN THIS.cDirec1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetDirec2
      RETURN THIS.cDirec2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetDirec3
      RETURN THIS.cDirec3
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetDirec4
      RETURN THIS.cDirec4
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetDirec5
      RETURN THIS.cDirec5
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetDirec6
      RETURN THIS.cDirec6
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetDirec7
      RETURN THIS.cDirec7
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetDirec8
      RETURN THIS.cDirec8
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetDirec9
      RETURN THIS.cDirec9
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
   FUNCTION GetBarrio
      RETURN THIS.nBarrio
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetBarrioNombre
      RETURN THIS.oBarrio.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetBarrioVigente
      RETURN THIS.oBarrio.GetVigente()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetRuta
      RETURN THIS.nRuta
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetRutaNombre
      RETURN THIS.oRuta.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetRutaVigente
      RETURN THIS.oRuta.GetVigente()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetTelefono
      RETURN THIS.cTelefono
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetFax
      RETURN THIS.cFax
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetEMail
      RETURN THIS.cEMail
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetContacto
      RETURN THIS.cContacto
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetFechaNac
      RETURN THIS.dFechaNac
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetDocumento
      RETURN THIS.cDocumento
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetRUC
      RETURN THIS.cRUC
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetDV
      RETURN THIS.cDV
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetEstado
      RETURN THIS.cEstado
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetEstadoNombre
      LOCAL lcRetorno
      lcRetorno = ''

      DO CASE
      CASE THIS.cEstado = 'A'
         lcRetorno = 'ACTIVO'
      CASE THIS.cEstado = 'I'
         lcRetorno = 'INACTIVO'
      ENDCASE

      RETURN lcRetorno
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
   FUNCTION GetVendedor
      RETURN THIS.nVendedor
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetVendedorNombre
      RETURN THIS.oVendedor.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetVendedorVigente
      RETURN THIS.oVendedor.GetVigente()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetLista
      RETURN THIS.nLista
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetLimiteCre
      RETURN THIS.nLimiteCre
   ENDFUNC
   
   * ---------------------------------------------------------------------------- *
   FUNCTION GetSaldoActu
      RETURN THIS.nSaldoActu
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetSaldoUSD
      RETURN THIS.nSaldoUSD
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetFacturar
      RETURN THIS.lFacturar
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetFecIOper
      RETURN THIS.dFecIOper
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetMotivoClie
      RETURN THIS.nMotivoClie
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetMotivoClieNombre
      RETURN THIS.oMotivoClie.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetMotivoClieVigente
      RETURN THIS.oMotivoClie.GetVigente()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetODatosClie
      RETURN THIS.cODatosClie
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetObs1
      RETURN THIS.cObs1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetObs2
      RETURN THIS.cObs2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetObs3
      RETURN THIS.cObs3
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetObs4
      RETURN THIS.cObs4
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetObs5
      RETURN THIS.cObs5
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetObs6
      RETURN THIS.cObs6
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetObs7
      RETURN THIS.cObs7
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetObs8
      RETURN THIS.cObs8
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetObs9
      RETURN THIS.cObs9
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetObs10
      RETURN THIS.cObs10
   ENDFUNC

  * ---------------------------------------------------------------------------- *
   FUNCTION GetRef1
      RETURN THIS.cRef1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetRef2
      RETURN THIS.cRef2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetRef3
      RETURN THIS.cRef3
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetRef4
      RETURN THIS.cRef4
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetRef5
      RETURN THIS.cRef5
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
   FUNCTION BuscarPorDocumento
      LPARAMETER tcDocumento, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF EMPTY(IIF(!INLIST(VARTYPE(tcDocumento), 'L', 'X'), tcDocumento, THIS.cDocumento)) THEN
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

      PRIVATE pcDocumento
      pcDocumento = UPPER(IIF(!INLIST(VARTYPE(tcDocumento), 'L', 'X'), ALLTRIM(tcDocumento), ALLTRIM(THIS.cDocumento)))

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(documento) LIKE ?pcDocumento', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(documento) LIKE ?pcDocumento AND ' + tcCondicionFiltrado, lcCursor)
      ENDIF

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorDocumento()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado más de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorDocumento()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorDocumento()')
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
   FUNCTION BuscarPorRUC
      LPARAMETER tcRUC, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF EMPTY(IIF(!INLIST(VARTYPE(tcRUC), 'L', 'X'), tcRUC, THIS.cRUC)) THEN
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

      PRIVATE pcRUC
      pcRUC = UPPER(IIF(!INLIST(VARTYPE(tcRUC), 'L', 'X'), ALLTRIM(tcRUC), ALLTRIM(THIS.cRUC)))

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(ruc) LIKE ?pcRUC', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(ruc) LIKE ?pcRUC AND ' + tcCondicionFiltrado, lcCursor)
      ENDIF

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorRUC()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado más de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorRUC()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorRUC()')
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
   FUNCTION BuscarPorRUCyDV
      LPARAMETER tcRUC, tcDV, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF EMPTY(IIF(!INLIST(VARTYPE(tcRUC), 'L', 'X'), tcRUC, THIS.cRUC)) THEN
         RETURN .F.
      ENDIF

      IF EMPTY(IIF(!INLIST(VARTYPE(tcDV), 'L', 'X'), tcDV, THIS.cDV)) THEN
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

      PRIVATE pcRUC, pcDV
      pcRUC = UPPER(IIF(!INLIST(VARTYPE(tcRUC), 'L', 'X'), ALLTRIM(tcRUC), ALLTRIM(THIS.cRUC)))
      pcDV = UPPER(IIF(!INLIST(VARTYPE(tcDV), 'L', 'X'), ALLTRIM(tcDV), ALLTRIM(THIS.cDV)))

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(ruc) LIKE ?pcRUC AND UPPER(dv) LIKE ?pcDV', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(ruc) LIKE ?pcRUC AND UPPER(dv) LIKE ?pcDV AND ' + tcCondicionFiltrado, lcCursor)
      ENDIF

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorRUC()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado más de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorRUC()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorRUC()')
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
   FUNCTION ValidarDirec1()
      IF LEN(THIS.cDirec1) > 60 THEN
         MESSAGEBOX([La longitud del campo 'cDirec1' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.ValidarDirec1()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarDirec2()
      IF LEN(THIS.cDirec2) > 60 THEN
         MESSAGEBOX([La longitud del campo 'cDirec2' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.ValidarDirec2()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarDirec3()
      IF LEN(THIS.cDirec3) > 60 THEN
         MESSAGEBOX([La longitud del campo 'cDirec3' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.ValidarDirec3()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarDirec4()
      IF LEN(THIS.cDirec4) > 60 THEN
         MESSAGEBOX([La longitud del campo 'cDirec4' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.ValidarDirec4()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarDirec5()
      IF LEN(THIS.cDirec5) > 60 THEN
         MESSAGEBOX([La longitud del campo 'cDirec5' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.ValidarDirec5()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarDirec6()
      IF LEN(THIS.cDirec6) > 60 THEN
         MESSAGEBOX([La longitud del campo 'cDirec6' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.ValidarDirec6()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarDirec7()
      IF LEN(THIS.cDirec7) > 60 THEN
         MESSAGEBOX([La longitud del campo 'cDirec7' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.ValidarDirec7()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarDirec8()
      IF LEN(THIS.cDirec8) > 60 THEN
         MESSAGEBOX([La longitud del campo 'cDirec8' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.ValidarDirec8()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarDirec9()
      IF LEN(THIS.cDirec9) > 60 THEN
         MESSAGEBOX([La longitud del campo 'cDirec9' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.ValidarDirec9()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarDepartamen()
      IF !BETWEEN(THIS.nDepartamen, 0, 65535) THEN
         MESSAGEBOX([El departamento debe ser un valor entre 0 y 65535.], 0+16, THIS.Name + '.ValidarDepartamen()')
         RETURN .F.
      ENDIF

      IF THIS.nDepartamen <> 0 THEN
         IF EMPTY(THIS.oDepartamen.GetNombre()) THEN
            MESSAGEBOX('El departamento no existe.', 0+16, THIS.Name + '.ValidarDepartamen()')
            RETURN .F.
         ENDIF

         IF !THIS.oDepartamen.GetVigente() THEN
            MESSAGEBOX('El departamento no está vigente.', 0+16, THIS.Name + '.ValidarDepartamen()')
            RETURN .F.
         ENDIF
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarCiudad()
      IF !BETWEEN(THIS.nCiudad, 0, 65535) THEN
         MESSAGEBOX([La ciudad debe ser un valor entre 0 y 65535.], 0+16, THIS.Name + '.ValidarCiudad()')
         RETURN .F.
      ENDIF

      IF THIS.nCiudad <> 0 THEN
         IF THIS.nDepartamen = 0 THEN
            THIS.SetDepartamen(THIS.oCiudad.getDepartamen())
         ENDIF

         IF EMPTY(THIS.oCiudad.GetNombre()) THEN
            MESSAGEBOX('La ciudad no existe.', 0+16, THIS.Name + '.ValidarCiudad()')
            RETURN .F.
         ENDIF

         IF !THIS.oCiudad.GetVigente() THEN
            MESSAGEBOX('La ciudad no está vigente.', 0+16, THIS.Name + '.ValidarCiudad()')
            RETURN .F.
         ENDIF

         IF !THIS.CiudadPerteneceDepartamen() THEN
            MESSAGEBOX([La ciudad '] + ALLTRIM(STR(THIS.nCiudad)) + [ - ] + ALLTRIM(THIS.GetCiudadNombre()) + [' no pertenece al departamento '] + ALLTRIM(STR(THIS.nDepartamen)) + [ - ] + ALLTRIM(THIS.GetDepartamenNombre()) + ['.], 0+16, THIS.Name + '.ValidarCiudad()')
            RETURN .F.
         ENDIF
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarBarrio()
      IF !BETWEEN(THIS.nBarrio, 0, 65535) THEN
         MESSAGEBOX([El barrio debe ser un valor entre 0 y 65535.], 0+16, THIS.Name + '.ValidarBarrio()')
         RETURN .F.
      ENDIF

      IF THIS.nBarrio <> 0 THEN
         IF THIS.nDepartamen = 0 AND THIS.nCiudad = 0 THEN
            WITH THIS
               .SetDepartamen(.oBarrio.GetDepartamen())
               .SetCiudad(.oBarrio.GetCiudad())
            ENDWITH
         ENDIF

         IF EMPTY(THIS.oBarrio.GetNombre()) THEN
            MESSAGEBOX('El barrio no existe.', 0+16, THIS.Name + '.ValidarBarrio()')
            RETURN .F.
         ENDIF

         IF !THIS.oBarrio.GetVigente() THEN
            MESSAGEBOX('El barrio no está vigente.', 0+16, THIS.Name + '.ValidarBarrio()')
            RETURN .F.
         ENDIF

         IF !THIS.BarrioPerteneceCiudad() THEN
            MESSAGEBOX([El barrio '] + ALLTRIM(STR(THIS.nBarrio)) + [ - ] + ALLTRIM(THIS.GetBarrioNombre()) + [' no pertenece a la ciudad '] + ALLTRIM(STR(THIS.nCiudad)) + [ - ] + ALLTRIM(THIS.GetCiudadNombre()) + ['.], 0+16, THIS.Name + '.ValidarBarrio()')
            RETURN .F.
         ENDIF

         IF !THIS.CiudadPerteneceDepartamen() THEN
            MESSAGEBOX([La ciudad '] + ALLTRIM(STR(THIS.nCiudad)) + [ - ] + ALLTRIM(THIS.GetCiudadNombre()) + [' no pertenece al departamento '] + ALLTRIM(STR(THIS.nDepartamen)) + [ - ] + ALLTRIM(THIS.GetDepartamenNombre()) + ['.], 0+16, THIS.Name + '.ValidarBarrio()')
            RETURN .F.
         ENDIF
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarRuta()
      IF !BETWEEN(THIS.nRuta, 1, 65535) THEN
         MESSAGEBOX([La ruta debe ser un valor entre 1 y 65535.], 0+16, THIS.Name + '.ValidarRuta()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.oRuta.GetNombre()) THEN
         MESSAGEBOX('La ruta no existe.', 0+16, THIS.Name + '.ValidarRuta()')
         RETURN .F.
      ENDIF

      IF !THIS.oRuta.GetVigente() THEN
         MESSAGEBOX('La ruta no está vigente.', 0+16, THIS.Name + '.ValidarRuta()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarTelefono()
      IF LEN(THIS.cTelefono) > 30 THEN
         MESSAGEBOX([La longitud del campo 'cTelefono' debe ser como máximo de 30 caracteres.], 0+16, THIS.Name + '.ValidarTelefono()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarFax()
      IF LEN(THIS.cFax) > 30 THEN
         MESSAGEBOX([La longitud del campo 'cFax' debe ser como máximo de 30 caracteres.], 0+16, THIS.Name + '.ValidarFax()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarEMail()
      IF LEN(THIS.cEMail) > 40 THEN
         MESSAGEBOX([La longitud del campo 'cEMail' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.ValidarEMail()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarContacto()
      IF LEN(THIS.cContacto) > 30 THEN
         MESSAGEBOX([La longitud del campo 'cContacto' debe ser como máximo de 30 caracteres.], 0+16, THIS.Name + '.ValidarContacto()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarFechaNac()
      IF !EMPTY(THIS.dFechaNac) THEN
         IF THIS.dFechaNac > _DATE() THEN
            MESSAGEBOX([La fecha de nacimiento debe ser menor o igual que la fecha actual.], 0+16, THIS.Name + '.ValidarFechaNac()')
            RETURN .F.
         ENDIF
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarDocumento()
      IF EMPTY(THIS.cDocumento) THEN
         MESSAGEBOX('El documento no puede quedar en blanco.', 0+16, THIS.Name + '.ValidarDocumento()')
         RETURN .F.
      ENDIF

      IF !ValidarFormatoCedula(THIS.cDocumento) THEN
         MESSAGEBOX('El documento digitado es incorrecto, debe ser numérico, solo se permite una letra cuando se trata de cédula de identidad.', 0+16, THIS.Name + '.ValidarDocumento()')
         RETURN .F.
      ENDIF

      **/
      *   RUC genérico habilitado para el libro ventas:
      *      Importes Consolidados – RUC 44444401 DV 7: Para consumidores finales o personas no solicitantes de crédito fiscal o no contribuyentes.
      */
      IF THIS.cDocumento = '44444401' THEN
         RETURN .T.
      ENDIF

      LOCAL llRetorno, loModelo, llExiste
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorDocumento(THIS.cDocumento)

      DO CASE
      CASE THIS.nBandera = 1   && Agregar.
         IF llExiste THEN
            MESSAGEBOX('El documento ya existe.', 0+16, THIS.Name + '.ValidarDocumento()')
            llRetorno = .F.
         ENDIF
      CASE THIS.nBandera = 2   && Modificar.
         IF llExiste AND loModelo.GetCodigo() <> THIS.nCodigo THEN
            MESSAGEBOX('El documento ya existe.', 0+16, THIS.Name + '.ValidarDocumento()')
            llRetorno = .F.
         ENDIF
      ENDCASE

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarRUC()
      IF EMPTY(THIS.cRUC) THEN
         RETURN .T.
      ENDIF

      IF !ValidarFormatoRUC(THIS.cRUC) THEN
         MESSAGEBOX('El RUC digitado es incorrecto, debe ser numérico, solo se permite una letra cuando se trata de cédula de identidad.', 0+16, THIS.Name + '.ValidarRUC()')
         RETURN .F.
      ENDIF

      IF !BETWEEN(VAL(THIS.cRUC), 50000000, 59999999) THEN
         IF THIS.cRUC <> THIS.cDocumento THEN
            MESSAGEBOX('El RUC debe coincidir con el Documento.', 0+16, THIS.Name + '.ValidarRUC()')
            RETURN .F.
         ENDIF
      ENDIF

      LOCAL llRetorno, loModelo, llExiste
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorRUC(THIS.cRUC)

      DO CASE
      CASE THIS.nBandera = 1   && Agregar.
         IF llExiste THEN
            MESSAGEBOX('El RUC ya existe.', 0+16, THIS.Name + '.ValidarRUC()')
            llRetorno = .F.
         ENDIF
      CASE THIS.nBandera = 2   && Modificar.
         IF llExiste AND loModelo.GetCodigo() <> THIS.nCodigo THEN
            MESSAGEBOX('El RUC ya existe.', 0+16, THIS.Name + '.ValidarRUC()')
            llRetorno = .F.
         ENDIF
      ENDCASE

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarDV()
      IF EMPTY(THIS.cRUC) AND EMPTY(THIS.cDV) THEN
         RETURN .T.
      ELSE
         IF !EMPTY(THIS.cRUC) AND EMPTY(THIS.cDV) THEN
            MESSAGEBOX('Debe ingresar el Dígito Verificador.', 0+16, THIS.Name + '.ValidarDV()')
            RETURN .F.
         ELSE
            IF EMPTY(THIS.cRUC) AND !EMPTY(THIS.cDV) THEN
               MESSAGEBOX('Debe ingresar el RUC.', 0+16, THIS.Name + '.ValidarDV()')
               RETURN .F.
            ENDIF
         ENDIF
      ENDIF

      IF !ValidarFormatoRUC(THIS.cRUC) THEN
         MESSAGEBOX('El RUC digitado es incorrecto, debe ser numérico, solo se permite una letra cuando se trata de cédula de identidad.', 0+16, THIS.Name + '.ValidarDV()')
         RETURN .F.
      ENDIF

      IF STR(calcular_dv_11_a(THIS.cRUC, 11), 1) <> THIS.cDV THEN
         MESSAGEBOX('El Dígito Verificador no corresponde.', 0+16, THIS.Name + '.ValidarDV()')
         RETURN .F.
      ENDIF

      LOCAL llRetorno, loModelo, llExiste
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorRUCyDV(THIS.cRUC, THIS.cDV)

      DO CASE
      CASE THIS.nBandera = 1   && Agregar.
         IF llExiste THEN
            MESSAGEBOX('El RUC ya existe.', 0+16, THIS.Name + '.ValidarDV()')
            llRetorno = .F.
         ENDIF
      CASE THIS.nBandera = 2   && Modificar.
         IF llExiste AND loModelo.GetCodigo() <> THIS.nCodigo THEN
            MESSAGEBOX('El RUC ya existe.', 0+16, THIS.Name + '.ValidarDV()')
            llRetorno = .F.
         ENDIF
      ENDCASE

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarEstado()
      IF !INLIST(THIS.cEstado, 'A', 'I') THEN
         MESSAGEBOX([El estado puede ser 'A' para activo o 'I' para inactivo.], 0+16, THIS.Name + '.ValidarEstado()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarPlazo()
      IF !BETWEEN(THIS.nPlazo, 0, 65535) THEN
         MESSAGEBOX([El plazo debe ser un valor entre 0 y 65535.], 0+16, THIS.Name + '.ValidarPlazo()')
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
   FUNCTION ValidarVendedor()
      IF !BETWEEN(THIS.nVendedor, 0, 65535) THEN
         MESSAGEBOX([El vendedor debe ser un valor entre 0 y 65535.], 0+16, THIS.Name + '.ValidarVendedor()')
         RETURN .F.
      ENDIF

      IF THIS.nVendedor <> 0 THEN
         IF EMPTY(THIS.oVendedor.GetNombre()) THEN
            MESSAGEBOX('El vendedor no existe.', 0+16, THIS.Name + '.ValidarVendedor()')
            RETURN .F.
         ENDIF

         IF !THIS.oVendedor.GetVigente() THEN
            MESSAGEBOX('El vendedor no está vigente.', 0+16, THIS.Name + '.ValidarVendedor()')
            RETURN .F.
         ENDIF
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarLista()
      IF !BETWEEN(THIS.nLista, 1, 5) THEN
         MESSAGEBOX([La lista de precios debe ser un valor entre 1 y 5.], 0+16, THIS.Name + '.ValidarLista()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarLimiteCre()
      IF THIS.nLimiteCre < 0 THEN
         MESSAGEBOX([El límite de crédito debe ser mayor o igual que cero.], 0+16, THIS.Name + '.ValidarLimiteCre()')
         RETURN .F.
      ENDIF

      IF THIS.nLimiteCre > 999999999 THEN
         MESSAGEBOX([El límite de crédito debe ser menor que un billón], 0+16, THIS.Name + '.ValidarLimiteCre()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarFecIOper()
      IF !EMPTY(THIS.dFecIOper) THEN
         IF THIS.dFecIOper > _DATE() THEN
            MESSAGEBOX([La fecha desde cuando es cliente debe ser menor o igual que la fecha actual.], 0+16, THIS.Name + '.ValidarFecIOper()')
            RETURN .F.
         ENDIF
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarMotivoClie()
      IF !BETWEEN(THIS.nMotivoClie, 1, 65535) THEN
         MESSAGEBOX([El motivo de ser cliente debe ser un valor entre 1 y 65535.], 0+16, THIS.Name + '.ValidarMotivoClie()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.oMotivoClie.GetNombre()) THEN
         MESSAGEBOX('El motivo de ser cliente no existe.', 0+16, THIS.Name + '.ValidarMotivoClie()')
         RETURN .F.
      ENDIF

      IF !THIS.oMotivoClie.GetVigente() THEN
         MESSAGEBOX('El motivo de ser cliente no está vigente.', 0+16, THIS.Name + '.ValidarMotivoClie()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarODatosClie()
      IF LEN(THIS.cODatosClie) > 40 THEN
         MESSAGEBOX([La longitud del campo 'cODatosClie' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.ValidarODatosClie()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarObs1()
      IF LEN(THIS.cObs1) > 72 THEN
         MESSAGEBOX([La longitud del campo 'cObs1' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.ValidarObs1()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarObs2()
      IF LEN(THIS.cObs2) > 72 THEN
         MESSAGEBOX([La longitud del campo 'cObs2' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.ValidarObs2()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarObs3()
      IF LEN(THIS.cObs3) > 72 THEN
         MESSAGEBOX([La longitud del campo 'cObs3' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.ValidarObs3()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarObs4()
      IF LEN(THIS.cObs4) > 72 THEN
         MESSAGEBOX([La longitud del campo 'cObs4' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.ValidarObs4()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarObs5()
      IF LEN(THIS.cObs5) > 72 THEN
         MESSAGEBOX([La longitud del campo 'cObs5' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.ValidarObs5()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarObs6()
      IF LEN(THIS.cObs6) > 72 THEN
         MESSAGEBOX([La longitud del campo 'cObs6' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.ValidarObs6()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarObs7()
      IF LEN(THIS.cObs7) > 72 THEN
         MESSAGEBOX([La longitud del campo 'cObs7' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.ValidarObs7()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarObs8()
      IF LEN(THIS.cObs8) > 72 THEN
         MESSAGEBOX([La longitud del campo 'cObs8' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.ValidarObs8()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarObs9()
      IF LEN(THIS.cObs9) > 72 THEN
         MESSAGEBOX([La longitud del campo 'cObs9' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.ValidarObs9()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarObs10()
      IF LEN(THIS.cObs10) > 72 THEN
         MESSAGEBOX([La longitud del campo 'cObs10' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.ValidarObs10()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarRef1()
      IF LEN(THIS.cRef1) > 72 THEN
         MESSAGEBOX([La longitud del campo 'cRef1' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.ValidarRef1()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarRef2()
      IF LEN(THIS.cRef2) > 72 THEN
         MESSAGEBOX([La longitud del campo 'cRef2' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.ValidarRef2()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarRef3()
      IF LEN(THIS.cRef3) > 72 THEN
         MESSAGEBOX([La longitud del campo 'cRef3' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.ValidarRef3()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarRef4()
      IF LEN(THIS.cRef4) > 72 THEN
         MESSAGEBOX([La longitud del campo 'cRef4' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.ValidarRef4()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarRef5()
      IF LEN(THIS.cRef5) > 72 THEN
         MESSAGEBOX([La longitud del campo 'cRef5' debe ser como máximo de 72 caracteres.], 0+16, THIS.Name + '.ValidarRef5()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION CiudadPerteneceDepartamen
      loModelo = NEWOBJECT('Ciudad', 'Ciudad.prg')
      RETURN loModelo.BuscarPorCodigo(THIS.nCiudad, 'departamen = ' + ALLTRIM(STR(THIS.nDepartamen)))
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION BarrioPerteneceCiudad
      loModelo = NEWOBJECT('Barrio', 'Barrio.prg')
      RETURN loModelo.BuscarPorCodigo(THIS.nBarrio, 'ciudad = ' + ALLTRIM(STR(THIS.nCiudad)))
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION CargarDatos
      WITH THIS
         .nCodigo = codigo
         .cNombre = nombre
         .cDirec1 = IIF(!ISNULL(direc1), direc1, '')
         .cDirec2 = IIF(!ISNULL(direc2), direc2, '')
         .cDirec3 = IIF(!ISNULL(direc3), direc3, '')
         .cDirec4 = IIF(!ISNULL(direc4), direc4, '')
         .cDirec5 = IIF(!ISNULL(direc5), direc5, '')
         .cDirec6 = IIF(!ISNULL(direc6), direc6, '')
         .cDirec7 = IIF(!ISNULL(direc7), direc7, '')
         .cDirec8 = IIF(!ISNULL(direc8), direc8, '')
         .cDirec9 = IIF(!ISNULL(direc9), direc9, '')
         .nDepartamen = IIF(!ISNULL(departamen), departamen, 0)
         .nCiudad = IIF(!ISNULL(ciudad), ciudad, 0)
         .nBarrio = IIF(!ISNULL(barrio), barrio, 0)
         .nRuta = ruta
         .cTelefono = IIF(!ISNULL(telefono), telefono, '')
         .cFax = IIF(!ISNULL(fax), fax, '')
         .cEMail = IIF(!ISNULL(e_mail), e_mail, '')
         .cContacto = IIF(!ISNULL(contacto), contacto, '')
         .dFechaNac = IIF(!ISNULL(fechanac), fechanac, {})
         .cDocumento = documento
         .cRUC = IIF(!ISNULL(ruc), ruc, '')
         .cDV = IIF(!ISNULL(dv), dv, '')
         .cEstado = estado
         .nPlazo = IIF(!ISNULL(plazo), plazo, 0)
         .nVendedor = IIF(!ISNULL(vendedor), vendedor, 0)
         .nLista = lista
         .nLimiteCre = limite_cre
         .nSaldoActu = saldo_actu
         .nSaldoUSD = saldo_usd
         .lFacturar = IIF(facturar = 0, .F., .T.)
         .dFecIOper = IIF(!ISNULL(fec_ioper), fec_ioper, {})
         .nMotivoClie = motivoclie
         .cODatosClie = IIF(!ISNULL(odatosclie), odatosclie, '')
         .cObs1 = IIF(!ISNULL(obs1), obs1, '')
         .cObs2 = IIF(!ISNULL(obs2), obs2, '')
         .cObs3 = IIF(!ISNULL(obs3), obs3, '')
         .cObs4 = IIF(!ISNULL(obs4), obs4, '')
         .cObs5 = IIF(!ISNULL(obs5), obs5, '')
         .cObs6 = IIF(!ISNULL(obs6), obs6, '')
         .cObs7 = IIF(!ISNULL(obs7), obs7, '')
         .cObs8 = IIF(!ISNULL(obs8), obs8, '')
         .cObs9 = IIF(!ISNULL(obs9), obs9, '')
         .cObs10 = IIF(!ISNULL(obs10), obs10, '')
         .cRef1 = IIF(!ISNULL(ref1), ref1, '')
         .cRef2 = IIF(!ISNULL(ref2), ref2, '')
         .cRef3 = IIF(!ISNULL(ref3), ref3, '')
         .cRef4 = IIF(!ISNULL(ref4), ref4, '')
         .cRef5 = IIF(!ISNULL(ref5), ref5, '')
         .cCuenta = IIF(!ISNULL(cuenta), cuenta, '')
      ENDWITH
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Validar
      IF !THIS.ValidarCodigo() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarNombre() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDirec1() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDirec2() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDirec3() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDirec4() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDirec5() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDirec6() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDirec7() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDirec8() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDirec9() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDepartamen() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarCiudad() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarBarrio() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarRuta() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarTelefono() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarFax() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarEMail() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarContacto() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarFechaNac() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDocumento() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarRUC() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDV() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarEstado() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarPlazo() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarVendedor() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarLista() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarLimiteCre() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarFecIOper() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarMotivoClie() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarODatosClie() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarObs1() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarObs2() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarObs3() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarObs4() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarObs5() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarObs6() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarObs7() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarObs8() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarObs9() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarObs10() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarRef1() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarRef2() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarRef3() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarRef4() THEN
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Agregar
      LOCAL llRetorno
      llRetorno = .T.
      THIS.nBandera = 1

      IF THIS.Validar() THEN
         PRIVATE pnCodigo, pcNombre, pcDirec1, pcDirec2, pcDirec3, pcDirec4, pcDirec5, pcDirec6, pcDirec7, pcDirec8, pcDirec9, ;
                 pnDepartamen, pnCiudad, pnBarrio, pnRuta, pcTelefono, pcFax, pcEMail, pcContacto, pdFechaNac, pcDocumento, ;
                 pcRUC, pcDV, pcEstado, pnPlazo, pnVendedor, pnLista, pnLimiteCre, pnSaldoActu, pnSaldoUSD, plFacturar, pdFecIOper, ;
                 pnMotivoClie, pcODatosClie, pcObs1, pcObs2, pcObs3, pcObs4, pcObs5, pcObs6, pcObs7, pcObs8, pcObs9, pcObs10, ;
                 pcRef1, pcRef2, pcRef3, pcRef4, pcRef5, pcCuenta

         pnCodigo = THIS.nCodigo
         pcNombre = THIS.cNombre
         pcDirec1 = IIF(!EMPTY(THIS.cDirec1), THIS.cDirec1, NULL)
         pcDirec2 = IIF(!EMPTY(THIS.cDirec2), THIS.cDirec2, NULL)
         pcDirec3 = IIF(!EMPTY(THIS.cDirec3), THIS.cDirec3, NULL)
         pcDirec4 = IIF(!EMPTY(THIS.cDirec4), THIS.cDirec4, NULL)
         pcDirec5 = IIF(!EMPTY(THIS.cDirec5), THIS.cDirec5, NULL)
         pcDirec6 = IIF(!EMPTY(THIS.cDirec6), THIS.cDirec6, NULL)
         pcDirec7 = IIF(!EMPTY(THIS.cDirec7), THIS.cDirec7, NULL)
         pcDirec8 = IIF(!EMPTY(THIS.cDirec8), THIS.cDirec8, NULL)
         pcDirec9 = IIF(!EMPTY(THIS.cDirec9), THIS.cDirec9, NULL)
         pnDepartamen = IIF(!EMPTY(THIS.nDepartamen), THIS.nDepartamen, NULL)
         pnCiudad = IIF(!EMPTY(THIS.nCiudad), THIS.nCiudad, NULL)
         pnBarrio = IIF(!EMPTY(THIS.nBarrio), THIS.nBarrio, NULL)
         pnRuta = THIS.nRuta
         pcTelefono = IIF(!EMPTY(THIS.cTelefono), THIS.cTelefono, NULL)
         pcFax = IIF(!EMPTY(THIS.cFax), THIS.cFax, NULL)
         pcEMail = IIF(!EMPTY(THIS.cEMail), THIS.cEMail, NULL)
         pcContacto = IIF(!EMPTY(THIS.cContacto), THIS.cContacto, NULL)
         pdFechaNac = IIF(!EMPTY(THIS.dFechaNac), THIS.dFechaNac, NULL)
         pcDocumento = THIS.cDocumento
         pcRUC = IIF(!EMPTY(THIS.cRUC), THIS.cRUC, NULL)
         pcDV = IIF(!EMPTY(THIS.cDV), THIS.cDV, NULL)
         pcEstado = THIS.cEstado
         pnPlazo = IIF(!EMPTY(THIS.nPlazo), THIS.nPlazo, NULL)
         pnVendedor = IIF(!EMPTY(THIS.nVendedor), THIS.nVendedor, NULL)
         pnLista = THIS.nLista
         pnLimiteCre = THIS.nLimiteCre
         pnSaldoActu = THIS.nSaldoActu
         pnSaldoUSD = THIS.nSaldoUSD
         plFacturar = IIF(!THIS.lFacturar, 0, 1)
         pdFecIOper = IIF(!EMPTY(THIS.dFecIOper), THIS.dFecIOper, NULL)
         pnMotivoClie = THIS.nMotivoClie
         pcODatosClie = IIF(!EMPTY(THIS.cODatosClie), THIS.cODatosClie, NULL)
         pcObs1 = IIF(!EMPTY(THIS.cObs1), THIS.cObs1, NULL)
         pcObs2 = IIF(!EMPTY(THIS.cObs2), THIS.cObs2, NULL)
         pcObs3 = IIF(!EMPTY(THIS.cObs3), THIS.cObs3, NULL)
         pcObs4 = IIF(!EMPTY(THIS.cObs4), THIS.cObs4, NULL)
         pcObs5 = IIF(!EMPTY(THIS.cObs5), THIS.cObs5, NULL)
         pcObs6 = IIF(!EMPTY(THIS.cObs6), THIS.cObs6, NULL)
         pcObs7 = IIF(!EMPTY(THIS.cObs7), THIS.cObs7, NULL)
         pcObs8 = IIF(!EMPTY(THIS.cObs8), THIS.cObs8, NULL)
         pcObs9 = IIF(!EMPTY(THIS.cObs9), THIS.cObs9, NULL)
         pcObs10 = IIF(!EMPTY(THIS.cObs10), THIS.cObs10, NULL)
         pcRef1 = IIF(!EMPTY(THIS.cRef1), THIS.cRef1, NULL)
         pcRef2 = IIF(!EMPTY(THIS.cRef2), THIS.cRef2, NULL)
         pcRef3 = IIF(!EMPTY(THIS.cRef3), THIS.cRef3, NULL)
         pcRef4 = IIF(!EMPTY(THIS.cRef4), THIS.cRef4, NULL)
         pcRef5 = IIF(!EMPTY(THIS.cRef5), THIS.cRef5, NULL)
         pcCuenta = IIF(!EMPTY(THIS.cCuenta), THIS.cCuenta, NULL)

         IF goCapaDatos.AgregarRegistro(THIS.cTabla, ;
                                        'codigo, nombre, direc1, direc2, direc3, direc4, direc5, direc6, direc7, direc8, direc9, ' + ;
                                        'departamen, ciudad, barrio, ruta, telefono, fax, e_mail, contacto, fechanac, documento, ' + ;
                                        'ruc, dv, estado, plazo, vendedor, lista, limite_cre, saldo_actu, saldo_usd, facturar, ' + ;
                                        'fec_ioper, motivoclie, odatosclie, obs1, obs2, obs3, obs4, obs5, obs6, obs7, obs8, obs9, ' + ;
                                        'obs10, ref1, ref2, ref3, ref4, ref5, cuenta', ;
                                        '?pnCodigo, ?pcNombre, ?pcDirec1, ?pcDirec2, ?pcDirec3, ?pcDirec4, ?pcDirec5, ?pcDirec6, ?pcDirec7, ?pcDirec8, ?pcDirec9, ' + ;
                                        '?pnDepartamen, ?pnCiudad, ?pnBarrio, ?pnRuta, ?pcTelefono, ?pcFax, ?pcEMail, ?pcContacto, ?pdFechaNac, ?pcDocumento, ' + ;
                                        '?pcRUC, ?pcDV, ?pcEstado, ?pnPlazo, ?pnVendedor, ?pnLista, ?pnLimiteCre, ?pnSaldoActu, ?pnSaldoUSD, ?plFacturar, ' + ;
                                        '?pdFecIOper, ?pnMotivoClie, ?pcODatosClie, ?pcObs1, ?pcObs2, ?pcObs3, ?pcObs4, ?pcObs5, ?pcObs6, ?pcObs7, ?pcObs8, ?pcObs9, ' + ;
                                        '?pcObs10, ?pcRef1, ?pcRef2, ?pcRef3, ?pcRef4, ?pcRef5, ?pcCuenta')
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
         PRIVATE pnCodigo, pcNombre, pcDirec1, pcDirec2, pcDirec3, pcDirec4, pcDirec5, pcDirec6, pcDirec7, pcDirec8, pcDirec9, ;
                 pnDepartamen, pnCiudad, pnBarrio, pnRuta, pcTelefono, pcFax, pcEMail, pcContacto, pdFechaNac, pcDocumento, ;
                 pcRUC, pcDV, pcEstado, pnPlazo, pnVendedor, pnLista, pnLimiteCre, pnSaldoActu, pnSaldoUSD, plFacturar, pdFecIOper, ;
                 pnMotivoClie, pcODatosClie, pcObs1, pcObs2, pcObs3, pcObs4, pcObs5, pcObs6, pcObs7, pcObs8, pcObs9, pcObs10, ;
                 pcRef1, pcRef2, pcRef3, pcRef4, pcRef5, pcCuenta

         pnCodigo = THIS.nCodigo
         pcNombre = THIS.cNombre
         pcDirec1 = IIF(!EMPTY(THIS.cDirec1), THIS.cDirec1, NULL)
         pcDirec2 = IIF(!EMPTY(THIS.cDirec2), THIS.cDirec2, NULL)
         pcDirec3 = IIF(!EMPTY(THIS.cDirec3), THIS.cDirec3, NULL)
         pcDirec4 = IIF(!EMPTY(THIS.cDirec4), THIS.cDirec4, NULL)
         pcDirec5 = IIF(!EMPTY(THIS.cDirec5), THIS.cDirec5, NULL)
         pcDirec6 = IIF(!EMPTY(THIS.cDirec6), THIS.cDirec6, NULL)
         pcDirec7 = IIF(!EMPTY(THIS.cDirec7), THIS.cDirec7, NULL)
         pcDirec8 = IIF(!EMPTY(THIS.cDirec8), THIS.cDirec8, NULL)
         pcDirec9 = IIF(!EMPTY(THIS.cDirec9), THIS.cDirec9, NULL)
         pnDepartamen = IIF(!EMPTY(THIS.nDepartamen), THIS.nDepartamen, NULL)
         pnCiudad = IIF(!EMPTY(THIS.nCiudad), THIS.nCiudad, NULL)
         pnBarrio = IIF(!EMPTY(THIS.nBarrio), THIS.nBarrio, NULL)
         pnRuta = THIS.nRuta
         pcTelefono = IIF(!EMPTY(THIS.cTelefono), THIS.cTelefono, NULL)
         pcFax = IIF(!EMPTY(THIS.cFax), THIS.cFax, NULL)
         pcEMail = IIF(!EMPTY(THIS.cEMail), THIS.cEMail, NULL)
         pcContacto = IIF(!EMPTY(THIS.cContacto), THIS.cContacto, NULL)
         pdFechaNac = IIF(!EMPTY(THIS.dFechaNac), THIS.dFechaNac, NULL)
         pcDocumento = THIS.cDocumento
         pcRUC = IIF(!EMPTY(THIS.cRUC), THIS.cRUC, NULL)
         pcDV = IIF(!EMPTY(THIS.cDV), THIS.cDV, NULL)
         pcEstado = THIS.cEstado
         pnPlazo = IIF(!EMPTY(THIS.nPlazo), THIS.nPlazo, NULL)
         pnVendedor = IIF(!EMPTY(THIS.nVendedor), THIS.nVendedor, NULL)
         pnLista = THIS.nLista
         pnLimiteCre = THIS.nLimiteCre
         pnSaldoActu = THIS.nSaldoActu
         pnSaldoUSD = THIS.nSaldoUSD
         plFacturar = IIF(!THIS.lFacturar, 0, 1)
         pdFecIOper = IIF(!EMPTY(THIS.dFecIOper), THIS.dFecIOper, NULL)
         pnMotivoClie = THIS.nMotivoClie
         pcODatosClie = IIF(!EMPTY(THIS.cODatosClie), THIS.cODatosClie, NULL)
         pcObs1 = IIF(!EMPTY(THIS.cObs1), THIS.cObs1, NULL)
         pcObs2 = IIF(!EMPTY(THIS.cObs2), THIS.cObs2, NULL)
         pcObs3 = IIF(!EMPTY(THIS.cObs3), THIS.cObs3, NULL)
         pcObs4 = IIF(!EMPTY(THIS.cObs4), THIS.cObs4, NULL)
         pcObs5 = IIF(!EMPTY(THIS.cObs5), THIS.cObs5, NULL)
         pcObs6 = IIF(!EMPTY(THIS.cObs6), THIS.cObs6, NULL)
         pcObs7 = IIF(!EMPTY(THIS.cObs7), THIS.cObs7, NULL)
         pcObs8 = IIF(!EMPTY(THIS.cObs8), THIS.cObs8, NULL)
         pcObs9 = IIF(!EMPTY(THIS.cObs9), THIS.cObs9, NULL)
         pcObs10 = IIF(!EMPTY(THIS.cObs10), THIS.cObs10, NULL)
         pcRef1 = IIF(!EMPTY(THIS.cRef1), THIS.cRef1, NULL)
         pcRef2 = IIF(!EMPTY(THIS.cRef2), THIS.cRef2, NULL)
         pcRef3 = IIF(!EMPTY(THIS.cRef3), THIS.cRef3, NULL)
         pcRef4 = IIF(!EMPTY(THIS.cRef4), THIS.cRef4, NULL)
         pcRef5 = IIF(!EMPTY(THIS.cRef5), THIS.cRef5, NULL)
         pcCuenta = IIF(!EMPTY(THIS.cCuenta), THIS.cCuenta, NULL)

         IF goCapaDatos.ModificarRegistro(THIS.cTabla, ;
                                          'nombre = ?pcNombre, direc1 = ?pcDirec1, direc2 = ?pcDirec2, direc3 = ?pcDirec3, direc4 = ?pcDirec4, direc5 = ?pcDirec5, ' + ;
                                          'direc6 = ?pcDirec6, direc7 = ?pcDirec7, direc8 = ?pcDirec8, direc9 = ?pcDirec9, departamen = ?pnDepartamen, ' + ;
                                          'ciudad = ?pnCiudad, barrio = ?pnBarrio, ruta = ?pnRuta, telefono = ?pcTelefono, fax = ?pcFax, e_mail = ?pcEMail, ' + ;
                                          'contacto = ?pcContacto, fechanac = ?pdFechaNac, documento = ?pcDocumento, ruc = ?pcRUC, dv = ?pcDV, estado = ?pcEstado, ' + ;
                                          'plazo = ?pnPlazo, vendedor = ?pnVendedor, lista = ?pnLista, limite_cre = ?pnLimiteCre, facturar = ?plFacturar, ' + ;
                                          'fec_ioper = ?pdFecIOper, motivoclie = ?pnMotivoClie, odatosclie = ?pcODatosClie, obs1 = ?pcObs1, obs2 = ?pcObs2, ' + ;
                                          'obs3 = ?pcObs3, obs4 = ?pcObs4, obs5 = ?pcObs5, obs6 = ?pcObs6, obs7 = ?pcObs7, obs8 = ?pcObs8, obs9 = ?pcObs9, ' + ;
                                          'obs10 = ?pcObs10, ref1 = ?pcRef1, ref2 = ?pcRef2, ref3 = ?pcRef3, ref4 = ?pcRef4, ref5 = ?pcRef5, cuenta = ?pcCuenta', ; 
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