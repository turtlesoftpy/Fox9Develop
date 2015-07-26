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
   PROTECTED cFacturar
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
         .cTabla = 'clientes'
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
         .cFacturar = ''
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

      IF LEN(tcNombre) > 56 THEN
         MESSAGEBOX([La longitud del parámetro 'tcNombre' debe ser como máximo de 56 caracteres.], 0+16, THIS.Name + '.SetNombre()')
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
   FUNCTION SetDirec1
      LPARAMETER tcDirec1

      * inicio { validación de parámetro }
      IF VARTYPE(tcDirec1) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcDirec1' debe ser de tipo texto.], 0+16, THIS.Name + '.SetDirec1()')
         RETURN .F.
      ENDIF

      IF LEN(tcDirec1) > 60 THEN
         MESSAGEBOX([La longitud del parámetro 'tcDirec1' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.SetDirec1()')
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

      IF LEN(tcDirec2) > 60 THEN
         MESSAGEBOX([La longitud del parámetro 'tcDirec2' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.SetDirec2()')
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

      IF LEN(tcDirec3) > 60 THEN
         MESSAGEBOX([La longitud del parámetro 'tcDirec3' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.SetDirec3()')
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

      IF LEN(tcDirec4) > 60 THEN
         MESSAGEBOX([La longitud del parámetro 'tcDirec4' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.SetDirec4()')
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

      IF LEN(tcDirec5) > 60 THEN
         MESSAGEBOX([La longitud del parámetro 'tcDirec5' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.SetDirec5()')
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

      IF LEN(tcDirec6) > 60 THEN
         MESSAGEBOX([La longitud del parámetro 'tcDirec6' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.SetDirec6()')
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

      IF LEN(tcDirec7) > 60 THEN
         MESSAGEBOX([La longitud del parámetro 'tcDirec7' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.SetDirec7()')
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

      IF LEN(tcDirec8) > 60 THEN
         MESSAGEBOX([La longitud del parámetro 'tcDirec8' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.SetDirec8()')
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

      IF LEN(tcDirec9) > 60 THEN
         MESSAGEBOX([La longitud del parámetro 'tcDirec9' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.SetDirec9()')
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
      LPARAMETER tcFacturar

      * inicio { validación de parámetro }
      IF VARTYPE(tcFacturar) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcFacturar' debe ser de tipo texto.], 0+16, THIS.Name + '.SetFacturar()')
         RETURN .F.
      ENDIF

      IF LEN(tcFacturar) > 1 THEN
         MESSAGEBOX([La longitud del parámetro 'tcFacturar' debe ser como máximo de 1 caracter.], 0+16, THIS.Name + '.SetFacturar()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cFacturar = tcFacturar
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
      RETURN THIS.cFacturar
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
      LOCAL lnCodigo
      lnCodigo = 1

      SELECT (THIS.cTabla)
      SET ORDER TO 1   && codigo
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
      LPARAMETER tnCodigo, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF VARTYPE(tnCodigo) = 'N' THEN
         IF tnCodigo > 99999 THEN
            MESSAGEBOX([El parámetro 'tnCodigo' debe ser menor o igual que 99999.], 0+16, THIS.Name + '.BuscarPorCodigo()')
            RETURN .F.
         ENDIF
      ENDIF

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

      LOCAL llRetorno, lcCursor, lnCodigo, lcSQL
      llRetorno = .T.
      lcCursor = CreaTemp()
      lnCodigo = IIF(!INLIST(VARTYPE(tnCodigo), 'L', 'X'), tnCodigo, THIS.nCodigo)

      IF ISNULL(tcCondicionFiltrado) THEN
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE ' + THIS.cClavePrimaria + ' = ' + ALLTRIM(STR(lnCodigo)) + ' INTO CURSOR ' + lcCursor
      ELSE
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE ' + THIS.cClavePrimaria + ' = ' + ALLTRIM(STR(lnCodigo)) + ' AND ' + tcCondicionFiltrado + ' INTO CURSOR ' + lcCursor
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
      IF VARTYPE(tcNombre) = 'C' THEN
         IF LEN(tcNombre) > 56 THEN
            MESSAGEBOX([La longitud del parámetro 'tcNombre' debe ser como máximo de 56 caracteres.], 0+16, THIS.Name + '.BuscarPorNombre()')
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
   FUNCTION BuscarPorDocumento
      LPARAMETER tcDocumento, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF VARTYPE(tcDocumento) = 'C' THEN
         IF LEN(tcDocumento) > 15 THEN
            MESSAGEBOX([La longitud del parámetro 'tcDocumento' debe ser como máximo de 15 caracteres.], 0+16, THIS.Name + '.BuscarPorDocumento()')
            RETURN .F.
         ENDIF

         IF AT('[', tcDocumento) > 0 THEN
            MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.BuscarPorDocumento()')
            RETURN .F.
         ENDIF

         IF AT(']', tcDocumento) > 0 THEN
            MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.BuscarPorDocumento()')
            RETURN .F.
         ENDIF
      ENDIF

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

      LOCAL llRetorno, lcCursor, lcDocumento, lcSQL
      llRetorno = .T.
      lcCursor = CreaTemp()
      lcDocumento = IIF(!INLIST(VARTYPE(tcDocumento), 'L', 'X'), ALLTRIM(tcDocumento), ALLTRIM(THIS.cDocumento))

      IF ISNULL(tcCondicionFiltrado) THEN
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(documento) LIKE [' + ALLTRIM(UPPER(lcDocumento)) + '] INTO CURSOR ' + lcCursor
      ELSE
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(documento) LIKE [' + ALLTRIM(UPPER(lcDocumento)) + '] AND ' + tcCondicionFiltrado + ' INTO CURSOR ' + lcCursor
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
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorDocumento()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE _TALLY > 1   && Se ha encontrado más de un registro.
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
      IF VARTYPE(tcRUC) = 'C' THEN
         IF LEN(tcRUC) > 15 THEN
            MESSAGEBOX([La longitud del parámetro 'tcRUC' debe ser como máximo de 15 caracteres.], 0+16, THIS.Name + '.BuscarPorRUC()')
            RETURN .F.
         ENDIF

         IF AT('[', tcRUC) > 0 THEN
            MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.BuscarPorRUC()')
            RETURN .F.
         ENDIF

         IF AT(']', tcRUC) > 0 THEN
            MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.BuscarPorRUC()')
            RETURN .F.
         ENDIF
      ENDIF

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

      LOCAL llRetorno, lcCursor, lcRUC, lcSQL
      llRetorno = .T.
      lcCursor = CreaTemp()
      lcRUC = IIF(!INLIST(VARTYPE(tcRUC), 'L', 'X'), ALLTRIM(tcRUC), ALLTRIM(THIS.cRUC))

      IF ISNULL(tcCondicionFiltrado) THEN
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + " WHERE UPPER(IIF(ValidarRUC(ALLTRIM(ruc)), LEFT(LEFT(ruc, ATC('-', ruc) - 1) + SPACE(15), 15), SPACE(15))) LIKE [" + ALLTRIM(UPPER(lcRUC)) + '] INTO CURSOR ' + lcCursor
      ELSE
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + " WHERE UPPER(IIF(ValidarRUC(ALLTRIM(ruc)), LEFT(LEFT(ruc, ATC('-', ruc) - 1) + SPACE(15), 15), SPACE(15))) LIKE [" + ALLTRIM(UPPER(lcRUC)) + '] AND ' + tcCondicionFiltrado + ' INTO CURSOR ' + lcCursor
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
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorRUC()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE _TALLY > 1   && Se ha encontrado más de un registro.
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
      IF VARTYPE(tcRUC) = 'C' THEN
         IF LEN(tcRUC) > 15 THEN
            MESSAGEBOX([La longitud del parámetro 'tcRUC' debe ser como máximo de 15 caracteres.], 0+16, THIS.Name + '.BuscarPorRUCyDV()')
            RETURN .F.
         ENDIF

         IF AT('[', tcRUC) > 0 THEN
            MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.BuscarPorRUCyDV()')
            RETURN .F.
         ENDIF

         IF AT(']', tcRUC) > 0 THEN
            MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.BuscarPorRUCyDV()')
            RETURN .F.
         ENDIF
      ENDIF

      IF VARTYPE(tcDV) = 'C' THEN
         IF LEN(tcDV) > 1 THEN
            MESSAGEBOX([La longitud del parámetro 'tcDV' debe ser como máximo de 1 caracter.], 0+16, THIS.Name + '.BuscarPorRUCyDV()')
            RETURN .F.
         ENDIF

         IF AT('[', tcDV) > 0 THEN
            MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.BuscarPorRUCyDV()')
            RETURN .F.
         ENDIF

         IF AT(']', tcDV) > 0 THEN
            MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.BuscarPorRUCyDV()')
            RETURN .F.
         ENDIF
      ENDIF

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

      LOCAL llRetorno, lcCursor, lcRUC, lcDV, lcSQL
      llRetorno = .T.
      lcCursor = CreaTemp()
      lcRUC = IIF(!INLIST(VARTYPE(tcRUC), 'L', 'X'), ALLTRIM(tcRUC), ALLTRIM(THIS.cRUC))
      lcDV = IIF(!INLIST(VARTYPE(tcDV), 'L', 'X'), ALLTRIM(tcDV), ALLTRIM(THIS.cDV))

      IF ISNULL(tcCondicionFiltrado) THEN
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(ruc) LIKE [' + ALLTRIM(UPPER(lcRUC)) + '-' + ALLTRIM(UPPER(lcDV)) + '] INTO CURSOR ' + lcCursor
      ELSE
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(ruc) LIKE [' + ALLTRIM(UPPER(lcRUC)) + '-' + ALLTRIM(UPPER(lcDV)) + '] AND ' + tcCondicionFiltrado + ' INTO CURSOR ' + lcCursor
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
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorRUCyDV()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE _TALLY > 1   && Se ha encontrado más de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorRUCyDV()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorRUCyDV()')
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
      IF !BETWEEN(THIS.nCodigo, 1, 99999) THEN
         MESSAGEBOX([El código debe ser un valor entre 1 y 99999.], 0+16, THIS.Name + '.ValidarCodigo()')
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
   FUNCTION ValidarDepartamen()
      IF !BETWEEN(THIS.nDepartamen, 0, 999) THEN
         MESSAGEBOX([El departamento debe ser un valor entre 0 y 999.], 0+16, THIS.Name + '.ValidarDepartamen()')
         RETURN .F.
      ENDIF

      IF THIS.nDepartamen <> 0 THEN
         IF EMPTY(THIS.oDepartamen.GetNombre()) THEN
            MESSAGEBOX('La departamento no existe.', 0+16, THIS.Name + '.ValidarDepartamen()')
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
      IF !BETWEEN(THIS.nCiudad, 0, 99999) THEN
         MESSAGEBOX([La ciudad debe ser un valor entre 0 y 99999.], 0+16, THIS.Name + '.ValidarCiudad()')
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
      IF !BETWEEN(THIS.nBarrio, 0, 99999) THEN
         MESSAGEBOX([El barrio debe ser un valor entre 0 y 99999.], 0+16, THIS.Name + '.ValidarBarrio()')
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
      IF !BETWEEN(THIS.nRuta, 1, 99999) THEN
         MESSAGEBOX([La ruta debe ser un valor entre 1 y 99999.], 0+16, THIS.Name + '.ValidarRuta()')
         RETURN .F.
      ENDIF

      IF THIS.nRuta <> 0 THEN
         IF EMPTY(THIS.oRuta.GetNombre()) THEN
            MESSAGEBOX('La ruta no existe.', 0+16, THIS.Name + '.ValidarRuta()')
            RETURN .F.
         ENDIF

         IF !THIS.oRuta.GetVigente() THEN
            MESSAGEBOX('La ruta no está vigente.', 0+16, THIS.Name + '.ValidarRuta()')
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
      IF !BETWEEN(THIS.nPlazo, 0, 99999) THEN
         MESSAGEBOX([El plazo debe ser un valor entre 0 y 99999.], 0+16, THIS.Name + '.ValidarPlazo()')
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
   FUNCTION ValidarLista()
      IF !BETWEEN(THIS.nLista, 1, 5) THEN
         MESSAGEBOX([La lista de precios debe ser un valor entre 1 y 5.], 0+16, THIS.Name + '.ValidarLista()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarVendedor()
      IF !BETWEEN(THIS.nVendedor, 0, 99999) THEN
         MESSAGEBOX([El vendedor debe ser un valor entre 0 y 99999.], 0+16, THIS.Name + '.ValidarVendedor()')
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
   FUNCTION ValidarMotivoClie()
      IF !BETWEEN(THIS.nMotivoClie, 1, 9999) THEN
         MESSAGEBOX([El motivo de ser cliente debe ser un valor entre 1 y 9999.], 0+16, THIS.Name + '.ValidarMotivoClie()')
         RETURN .F.
      ENDIF

      IF THIS.nMotivoClie <> 0 THEN
         IF EMPTY(THIS.oMotivoClie.GetNombre()) THEN
            MESSAGEBOX('El motivo de ser cliente no existe.', 0+16, THIS.Name + '.ValidarMotivoClie()')
            RETURN .F.
         ENDIF

         IF !THIS.oMotivoClie.GetVigente() THEN
            MESSAGEBOX('El motivo de ser cliente no está vigente.', 0+16, THIS.Name + '.ValidarMotivoClie()')
            RETURN .F.
         ENDIF
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
         .cDirec1 = direc1
         .cDirec2 = direc2
         .cDirec3 = direc3
         .cDirec4 = direc4
         .cDirec5 = direc5
         .cDirec6 = direc6
         .cDirec7 = direc7
         .cDirec8 = direc8
         .cDirec9 = direc9
         .nDepartamen = departamen
         .nCiudad = ciudad
         .nBarrio = barrio
         .nRuta = ruta
         .cTelefono = telefono
         .cFax = fax
         .cEMail = e_mail
         .cContacto = contacto
         .dFechaNac = fechanac
         .cDocumento = documento

         IF OCCURS('-', ruc) = 1 THEN
            .cRUC = LEFT(ruc, ATC('-', ruc) - 1)   && Obtiene el RUC sin el DV.
            .cDV = RIGHT(RTRIM(ruc), 1)
         ELSE
            .cRUC = ruc
            .cDV = ''
         ENDIF

         .cEstado = estado
         .nPlazo = plazo
         .nVendedor = vendedor
         .nLista = lista
         .nLimiteCre = limite_cre
         .nSaldoActu = saldo_actu
         .nSaldoUSD = saldo_usd
         .cFacturar = facturar
         .dFecIOper = fec_ioper
         .nMotivoClie = motivoclie
         .cODatosClie = odatosclie
         .cObs1 = obs1
         .cObs2 = obs2
         .cObs3 = obs3
         .cObs4 = obs4
         .cObs5 = obs5
         .cObs6 = obs6
         .cObs7 = obs7
         .cObs8 = obs8
         .cObs9 = obs9
         .cObs10 = obs10
         .cRef1 = ref1
         .cRef2 = ref2
         .cRef3 = ref3
         .cRef4 = ref4
         .cRef5 = ref5
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

      IF !THIS.ValidarLista() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarVendedor() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarLimiteCre() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarMotivoClie() THEN
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
         INSERT INTO (THIS.cTabla) (codigo, nombre, direc1, direc2, direc3, direc4, direc5, direc6, direc7, direc8, direc9, ;
                                    departamen, ciudad, barrio, ruta, telefono, fax, e_mail, contacto, fechanac, documento, ;
                                    ruc, estado, plazo, vendedor, lista, limite_cre, saldo_actu, saldo_usd, facturar, fec_ioper, ;
                                    motivoclie, odatosclie, obs1, obs2, obs3, obs4, obs5, obs6, obs7, obs8, obs9, obs10, ;
                                    ref1, ref2, ref3, ref4, ref5) ;
            VALUES (THIS.nCodigo, THIS.cNombre, THIS.cDirec1, THIS.cDirec2, THIS.cDirec3, THIS.cDirec4, ;
                    THIS.cDirec5, THIS.cDirec6, THIS.cDirec7, THIS.cDirec8, THIS.cDirec9, THIS.nDepartamen, ;
                    THIS.nCiudad, THIS.nBarrio, THIS.nRuta, THIS.cTelefono, THIS.cFax, THIS.cEMail, THIS.cContacto, ;
                    THIS.dFechaNac, THIS.cDocumento, IIF(!EMPTY(THIS.cRUC), ALLTRIM(THIS.cRUC) + '-' + THIS.cDV, ALLTRIM(THIS.cRUC)), THIS.cEstado, THIS.nPlazo, THIS.nVendedor, ;
                    THIS.nLista, THIS.nLimiteCre, THIS.nSaldoActu, THIS.nSaldoUSD, THIS.cFacturar, THIS.dFecIOper, THIS.nMotivoClie, ;
                    THIS.cODatosClie, THIS.cObs1, THIS.cObs2, THIS.cObs3, THIS.cObs4, THIS.cObs5, THIS.cObs6, ;
                    THIS.cObs7, THIS.cObs8, THIS.cObs9, THIS.cObs10, THIS.cRef1, THIS.cRef2, THIS.cRef3, THIS.cRef4, ;
                    THIS.cRef5)

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
            nombre = THIS.cNombre, ;
            direc1 = THIS.cDirec1, ;
            direc2 = THIS.cDirec2, ;
            direc3 = THIS.cDirec3, ;
            direc4 = THIS.cDirec4, ;
            direc5 = THIS.cDirec5, ;
            direc6 = THIS.cDirec6, ;
            direc7 = THIS.cDirec7, ;
            direc8 = THIS.cDirec8, ;
            direc9 = THIS.cDirec9, ;
            departamen = THIS.nDepartamen, ;
            ciudad = THIS.nCiudad, ;
            barrio = THIS.nBarrio, ;
            ruta = THIS.nRuta, ;
            telefono = THIS.cTelefono, ;
            fax = THIS.cFax, ;
            e_mail = THIS.cEMail, ;
            contacto = THIS.cContacto, ;
            fechanac = THIS.dFechaNac, ;
            documento = THIS.cDocumento, ;
            ruc = IIF(!EMPTY(THIS.cRUC), ALLTRIM(THIS.cRUC) + '-' + THIS.cDV, ALLTRIM(THIS.cRUC)), ;
            estado = THIS.cEstado, ;
            plazo = THIS.nPlazo, ;
            vendedor = THIS.nVendedor, ;
            lista = THIS.nLista, ;
            limite_cre = THIS.nLimiteCre, ;
            facturar = THIS.cFacturar, ;
            fec_ioper = THIS.dFecIOper, ;
            motivoclie = THIS.nMotivoClie, ;
            odatosclie = THIS.cODatosClie, ;
            obs1 = THIS.cObs1, ;
            obs2 = THIS.cObs2, ;
            obs3 = THIS.cObs3, ;
            obs4 = THIS.cObs4, ;
            obs5 = THIS.cObs5, ;
            obs6 = THIS.cObs6, ;
            obs7 = THIS.cObs7, ;
            obs8 = THIS.cObs8, ;
            obs9 = THIS.cObs9, ;
            obs10 = THIS.cObs10, ; 
            ref1 = THIS.cRef1, ;
            ref2 = THIS.cRef2, ;
            ref3 = THIS.cRef3, ;
            ref4 = THIS.cRef4, ;
            ref5 = THIS.cRef5 ;
         WHERE ;
            EVALUATE(THIS.cClavePrimaria) = THIS.nCodigo

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

      * Ventas.
      IF llRetorno THEN
         lcSQL = 'SELECT TOP 1 ' + THIS.cClaveForanea + ' FROM cabevent ORDER BY ' + THIS.cClaveForanea + ' WHERE ' + THIS.cClaveForanea + ' = ' + ALLTRIM(STR(lnCodigo)) + ' INTO CURSOR ' + lcCursor
         &lcSQL
         IF _TALLY > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Ventas', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
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