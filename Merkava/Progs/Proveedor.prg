DEFINE CLASS Proveedor AS CUSTOM
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
   PROTECTED cCiudad
   PROTECTED cTelefono
   PROTECTED cFax
   PROTECTED cEMail
   PROTECTED cRUC
   PROTECTED cDV
   PROTECTED nDiasPlazo
   PROTECTED cDueno
   PROTECTED cTelDueno
   PROTECTED cGteGral
   PROTECTED cTelGG
   PROTECTED cGteVentas
   PROTECTED cTelGV
   PROTECTED cGteMkg
   PROTECTED cTelGM
   PROTECTED cSTecnico
   PROTECTED cSTDirec1
   PROTECTED cSTDirec2
   PROTECTED cSTTel
   PROTECTED cSTHablar1
   PROTECTED cVendedor1
   PROTECTED cLArti1
   PROTECTED cTVend1
   PROTECTED cVendedor2
   PROTECTED cLArti2
   PROTECTED cTVend2
   PROTECTED cVendedor3
   PROTECTED cLArti3
   PROTECTED cTVend3
   PROTECTED cVendedor4
   PROTECTED cLArti4
   PROTECTED cTVend4
   PROTECTED cVendedor5
   PROTECTED cLArti5
   PROTECTED cTVend5
   PROTECTED nSaldoActu
   PROTECTED nSaldoUSD
   PROTECTED cVigente

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Init
      WITH THIS
         .nBandera = 0
         .cTabla = 'proveedo'
         .cClavePrimaria = 'codigo'
         .cClaveForanea = 'proveedor'

         .nCodigo = 0
         .cNombre = ''
         .cDirec1 = ''
         .cDirec2 = ''
         .cCiudad = ''
         .cTelefono = ''
         .cFax = ''
         .cEMail = ''
         .cRUC = ''
         .cDV = ''
         .nDiasPlazo = 0
         .cDueno = ''
         .cTelDueno = ''
         .cGteGral = ''
         .cTelGG = ''
         .cGteVentas = ''
         .cTelGV = ''
         .cGteMkg = ''
         .cTelGM = ''
         .cSTecnico = ''
         .cSTDirec1 = ''
         .cSTDirec2 = ''
         .cSTTel = ''
         .cSTHablar1 = ''
         .cVendedor1 = ''
         .cLArti1 = ''
         .cTVend1 = ''
         .cVendedor2 = ''
         .cLArti2 = ''
         .cTVend2 = ''
         .cVendedor3 = ''
         .cLArti3 = ''
         .cTVend3 = ''
         .cVendedor4 = ''
         .cLArti4 = ''
         .cTVend4 = ''
         .cVendedor5 = ''
         .cLArti5 = ''
         .cTVend5 = ''
         .nSaldoActu = 0
         .nSaldoUSD = 0
         .cVigente = ''
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
   FUNCTION SetCiudad
      LPARAMETER tcCiudad

      * inicio { validación de parámetro }
      IF VARTYPE(tcCiudad) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcCiudad' debe ser de tipo texto.], 0+16, THIS.Name + '.SetCiudad()')
         RETURN .F.
      ENDIF

      IF LEN(tcCiudad) > 60 THEN
         MESSAGEBOX([La longitud del parámetro 'tcCiudad' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.SetCiudad()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cCiudad = tcCiudad
   ENDFUNC

  * ---------------------------------------------------------------------------- *
   FUNCTION SetTelefono
      LPARAMETER tcTelefono

      * inicio { validación de parámetro }
      IF VARTYPE(tcTelefono) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcTelefono' debe ser de tipo texto.], 0+16, THIS.Name + '.SetTelefono()')
         RETURN .F.
      ENDIF

      IF LEN(tcTelefono) > 40 THEN
         MESSAGEBOX([La longitud del parámetro 'tcTelefono' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.SetTelefono()')
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

      IF LEN(tcFax) > 25 THEN
         MESSAGEBOX([La longitud del parámetro 'tcFax' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.SetFax()')
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

      IF LEN(tcEMail) > 60 THEN
         MESSAGEBOX([La longitud del parámetro 'tcEMail' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.SetEMail()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cEMail = LOWER(tcEMail)
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
   FUNCTION SetDiasPlazo
      LPARAMETER tnDiasPlazo

      * inicio { validación de parámetro }
      IF VARTYPE(tnDiasPlazo) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnDiasPlazo' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetDiasPlazo()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nDiasPlazo = tnDiasPlazo
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetDueno
      LPARAMETER tcDueno

      * inicio { validación de parámetro }
      IF VARTYPE(tcDueno) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcDueno' debe ser de tipo texto.], 0+16, THIS.Name + '.SetDueno()')
         RETURN .F.
      ENDIF

      IF LEN(tcDueno) > 40 THEN
         MESSAGEBOX([La longitud del parámetro 'tcDueno' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.SetDueno()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cDueno = tcDueno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetTelDueno
      LPARAMETER tcTelDueno

      * inicio { validación de parámetro }
      IF VARTYPE(tcTelDueno) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcTelDueno' debe ser de tipo texto.], 0+16, THIS.Name + '.SetTelDueno()')
         RETURN .F.
      ENDIF

      IF LEN(tcTelDueno) > 25 THEN
         MESSAGEBOX([La longitud del parámetro 'tcTelDueno' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.SetTelDueno()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cTelDueno = tcTelDueno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetGteGral
      LPARAMETER tcGteGral

      * inicio { validación de parámetro }
      IF VARTYPE(tcGteGral) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcGteGral' debe ser de tipo texto.], 0+16, THIS.Name + '.SetGteGral()')
         RETURN .F.
      ENDIF

      IF LEN(tcGteGral) > 40 THEN
         MESSAGEBOX([La longitud del parámetro 'tcGteGral' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.SetGteGral()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cGteGral = tcGteGral
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetTelGG
      LPARAMETER tcTelGG

      * inicio { validación de parámetro }
      IF VARTYPE(tcTelGG) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcTelGG' debe ser de tipo texto.], 0+16, THIS.Name + '.SetTelGG()')
         RETURN .F.
      ENDIF

      IF LEN(tcTelGG) > 25 THEN
         MESSAGEBOX([La longitud del parámetro 'tcTelGG' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.SetTelGG()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cTelGG = tcTelGG
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetGteVentas
      LPARAMETER tcGteVentas

      * inicio { validación de parámetro }
      IF VARTYPE(tcGteVentas) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcGteVentas' debe ser de tipo texto.], 0+16, THIS.Name + '.SetGteVentas()')
         RETURN .F.
      ENDIF

      IF LEN(tcGteVentas) > 40 THEN
         MESSAGEBOX([La longitud del parámetro 'tcGteVentas' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.SetGteVentas()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cGteVentas = tcGteVentas
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetTelGV
      LPARAMETER tcTelGV

      * inicio { validación de parámetro }
      IF VARTYPE(tcTelGV) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcTelGV' debe ser de tipo texto.], 0+16, THIS.Name + '.SetTelGV()')
         RETURN .F.
      ENDIF

      IF LEN(tcTelGV) > 25 THEN
         MESSAGEBOX([La longitud del parámetro 'tcTelGV' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.SetTelGV()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cTelGV = tcTelGV
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetGteMkg
      LPARAMETER tcGteMkg

      * inicio { validación de parámetro }
      IF VARTYPE(tcGteMkg) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcGteMkg' debe ser de tipo texto.], 0+16, THIS.Name + '.SetGteMkg()')
         RETURN .F.
      ENDIF

      IF LEN(tcGteMkg) > 40 THEN
         MESSAGEBOX([La longitud del parámetro 'tcGteMkg' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.SetGteMkg()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cGteMkg = tcGteMkg
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetTelGM
      LPARAMETER tcTelGM

      * inicio { validación de parámetro }
      IF VARTYPE(tcTelGM) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcTelGM' debe ser de tipo texto.], 0+16, THIS.Name + '.SetTelGM()')
         RETURN .F.
      ENDIF

      IF LEN(tcTelGM) > 25 THEN
         MESSAGEBOX([La longitud del parámetro 'tcTelGM' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.SetTelGM()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cTelGM = tcTelGM
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetSTecnico
      LPARAMETER tcSTecnico

      * inicio { validación de parámetro }
      IF VARTYPE(tcSTecnico) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcSTecnico' debe ser de tipo texto.], 0+16, THIS.Name + '.SetSTecnico()')
         RETURN .F.
      ENDIF

      IF LEN(tcSTecnico) > 40 THEN
         MESSAGEBOX([La longitud del parámetro 'tcSTecnico' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.SetSTecnico()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cSTecnico = tcSTecnico
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetSTDirec1
      LPARAMETER tcSTDirec1

      * inicio { validación de parámetro }
      IF VARTYPE(tcSTDirec1) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcSTDirec1' debe ser de tipo texto.], 0+16, THIS.Name + '.SetSTDirec1()')
         RETURN .F.
      ENDIF

      IF LEN(tcSTDirec1) > 60 THEN
         MESSAGEBOX([La longitud del parámetro 'tcSTDirec1' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.SetSTDirec1()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cSTDirec1 = tcSTDirec1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetSTDirec2
      LPARAMETER tcSTDirec2

      * inicio { validación de parámetro }
      IF VARTYPE(tcSTDirec2) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcSTDirec2' debe ser de tipo texto.], 0+16, THIS.Name + '.SetSTDirec2()')
         RETURN .F.
      ENDIF

      IF LEN(tcSTDirec2) > 60 THEN
         MESSAGEBOX([La longitud del parámetro 'tcSTDirec2' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.SetSTDirec2()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cSTDirec2 = tcSTDirec2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetSTTel
      LPARAMETER tcSTTel

      * inicio { validación de parámetro }
      IF VARTYPE(tcSTTel) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcSTTel' debe ser de tipo texto.], 0+16, THIS.Name + '.SetSTTel()')
         RETURN .F.
      ENDIF

      IF LEN(tcSTTel) > 25 THEN
         MESSAGEBOX([La longitud del parámetro 'tcSTTel' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.SetSTTel()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cSTTel = tcSTTel
   ENDFUNC

  * ---------------------------------------------------------------------------- *
   FUNCTION SetSTHablar1
      LPARAMETER tcSTHablar1

      * inicio { validación de parámetro }
      IF VARTYPE(tcSTHablar1) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcSTHablar1' debe ser de tipo texto.], 0+16, THIS.Name + '.SetSTHablar1()')
         RETURN .F.
      ENDIF

      IF LEN(tcSTHablar1) > 60 THEN
         MESSAGEBOX([La longitud del parámetro 'tcSTHablar1' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.SetSTHablar1()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cSTHablar1 = LOWER(tcSTHablar1)
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetVendedor1
      LPARAMETER tcVendedor1

      * inicio { validación de parámetro }
      IF VARTYPE(tcVendedor1) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcVendedor1' debe ser de tipo texto.], 0+16, THIS.Name + '.SetVendedor1()')
         RETURN .F.
      ENDIF

      IF LEN(tcVendedor1) > 40 THEN
         MESSAGEBOX([La longitud del parámetro 'tcVendedor1' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.SetVendedor1()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cVendedor1 = tcVendedor1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetLArti1
      LPARAMETER tcLArti1

      * inicio { validación de parámetro }
      IF VARTYPE(tcLArti1) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcLArti1' debe ser de tipo texto.], 0+16, THIS.Name + '.SetLArti1()')
         RETURN .F.
      ENDIF

      IF LEN(tcLArti1) > 25 THEN
         MESSAGEBOX([La longitud del parámetro 'tcLArti1' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.SetLArti1()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cLArti1 = tcLArti1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetTVend1
      LPARAMETER tcTVend1

      * inicio { validación de parámetro }
      IF VARTYPE(tcTVend1) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcTVend1' debe ser de tipo texto.], 0+16, THIS.Name + '.SetTVend1()')
         RETURN .F.
      ENDIF

      IF LEN(tcTVend1) > 25 THEN
         MESSAGEBOX([La longitud del parámetro 'tcTVend1' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.SetTVend1()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cTVend1 = tcTVend1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetVendedor2
      LPARAMETER tcVendedor2

      * inicio { validación de parámetro }
      IF VARTYPE(tcVendedor2) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcVendedor2' debe ser de tipo texto.], 0+16, THIS.Name + '.SetVendedor2()')
         RETURN .F.
      ENDIF

      IF LEN(tcVendedor2) > 40 THEN
         MESSAGEBOX([La longitud del parámetro 'tcVendedor2' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.SetVendedor2()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cVendedor2 = tcVendedor2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetLArti2
      LPARAMETER tcLArti2

      * inicio { validación de parámetro }
      IF VARTYPE(tcLArti2) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcLArti2' debe ser de tipo texto.], 0+16, THIS.Name + '.SetLArti2()')
         RETURN .F.
      ENDIF

      IF LEN(tcLArti2) > 25 THEN
         MESSAGEBOX([La longitud del parámetro 'tcLArti2' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.SetLArti2()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cLArti2 = tcLArti2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetTVend2
      LPARAMETER tcTVend2

      * inicio { validación de parámetro }
      IF VARTYPE(tcTVend2) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcTVend2' debe ser de tipo texto.], 0+16, THIS.Name + '.SetTVend2()')
         RETURN .F.
      ENDIF

      IF LEN(tcTVend2) > 25 THEN
         MESSAGEBOX([La longitud del parámetro 'tcTVend2' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.SetTVend2()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cTVend2 = tcTVend2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetVendedor3
      LPARAMETER tcVendedor3

      * inicio { validación de parámetro }
      IF VARTYPE(tcVendedor3) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcVendedor3' debe ser de tipo texto.], 0+16, THIS.Name + '.SetVendedor3()')
         RETURN .F.
      ENDIF

      IF LEN(tcVendedor3) > 40 THEN
         MESSAGEBOX([La longitud del parámetro 'tcVendedor3' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.SetVendedor3()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cVendedor3 = tcVendedor3
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetLArti3
      LPARAMETER tcLArti3

      * inicio { validación de parámetro }
      IF VARTYPE(tcLArti3) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcLArti3' debe ser de tipo texto.], 0+16, THIS.Name + '.SetLArti3()')
         RETURN .F.
      ENDIF

      IF LEN(tcLArti3) > 25 THEN
         MESSAGEBOX([La longitud del parámetro 'tcLArti3' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.SetLArti3()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cLArti3 = tcLArti3
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetTVend3
      LPARAMETER tcTVend3

      * inicio { validación de parámetro }
      IF VARTYPE(tcTVend3) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcTVend3' debe ser de tipo texto.], 0+16, THIS.Name + '.SetTVend3()')
         RETURN .F.
      ENDIF

      IF LEN(tcTVend3) > 25 THEN
         MESSAGEBOX([La longitud del parámetro 'tcTVend3' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.SetTVend3()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cTVend3 = tcTVend3
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetVendedor4
      LPARAMETER tcVendedor4

      * inicio { validación de parámetro }
      IF VARTYPE(tcVendedor4) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcVendedor4' debe ser de tipo texto.], 0+16, THIS.Name + '.SetVendedor4()')
         RETURN .F.
      ENDIF

      IF LEN(tcVendedor4) > 40 THEN
         MESSAGEBOX([La longitud del parámetro 'tcVendedor4' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.SetVendedor4()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cVendedor4 = tcVendedor4
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetLArti4
      LPARAMETER tcLArti4

      * inicio { validación de parámetro }
      IF VARTYPE(tcLArti4) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcLArti4' debe ser de tipo texto.], 0+16, THIS.Name + '.SetLArti4()')
         RETURN .F.
      ENDIF

      IF LEN(tcLArti4) > 25 THEN
         MESSAGEBOX([La longitud del parámetro 'tcLArti4' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.SetLArti4()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cLArti4 = tcLArti4
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetTVend4
      LPARAMETER tcTVend4

      * inicio { validación de parámetro }
      IF VARTYPE(tcTVend4) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcTVend4' debe ser de tipo texto.], 0+16, THIS.Name + '.SetTVend4()')
         RETURN .F.
      ENDIF

      IF LEN(tcTVend4) > 25 THEN
         MESSAGEBOX([La longitud del parámetro 'tcTVend4' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.SetTVend4()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cTVend4 = tcTVend4
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetVendedor5
      LPARAMETER tcVendedor5

      * inicio { validación de parámetro }
      IF VARTYPE(tcVendedor5) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcVendedor5' debe ser de tipo texto.], 0+16, THIS.Name + '.SetVendedor5()')
         RETURN .F.
      ENDIF

      IF LEN(tcVendedor5) > 40 THEN
         MESSAGEBOX([La longitud del parámetro 'tcVendedor5' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.SetVendedor5()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cVendedor5 = tcVendedor5
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetLArti5
      LPARAMETER tcLArti5

      * inicio { validación de parámetro }
      IF VARTYPE(tcLArti5) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcLArti5' debe ser de tipo texto.], 0+16, THIS.Name + '.SetLArti5()')
         RETURN .F.
      ENDIF

      IF LEN(tcLArti5) > 25 THEN
         MESSAGEBOX([La longitud del parámetro 'tcLArti5' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.SetLArti5()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cLArti5 = tcLArti5
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetTVend5
      LPARAMETER tcTVend5

      * inicio { validación de parámetro }
      IF VARTYPE(tcTVend5) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcTVend5' debe ser de tipo texto.], 0+16, THIS.Name + '.SetTVend5()')
         RETURN .F.
      ENDIF

      IF LEN(tcTVend5) > 25 THEN
         MESSAGEBOX([La longitud del parámetro 'tcTVend5' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.SetTVend5()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cTVend5 = tcTVend5
   ENDFUNC

  * ---------------------------------------------------------------------------- *
   FUNCTION SetVigente
      LPARAMETER tcVigente

      * inicio { validación de parámetro }
      IF VARTYPE(tcVigente) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcVigente' debe ser de tipo texto.], 0+16, THIS.Name + '.SetVigente()')
         RETURN .F.
      ENDIF

      IF LEN(tcVigente) > 1 THEN
         MESSAGEBOX([La longitud del parámetro 'tcVigente' debe ser como máximo de 1 caracter.], 0+16, THIS.Name + '.SetVigente()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cVigente = tcVigente
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
   FUNCTION GetCiudad
      RETURN THIS.cCiudad
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
   FUNCTION GetRUC
      RETURN THIS.cRUC
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetDV
      RETURN THIS.cDV
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetDiasPlazo
      RETURN THIS.nDiasPlazo
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetDueno
      RETURN THIS.cDueno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetTelDueno
      RETURN THIS.cTelDueno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetGteGral
      RETURN THIS.cGteGral
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetTelGG
      RETURN THIS.cTelGG
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetGteVentas
      RETURN THIS.cGteVentas
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetTelGV
      RETURN THIS.cTelGV
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetGteMkg
      RETURN THIS.cGteMkg
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetTelGM
      RETURN THIS.cTelGM
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetSTecnico
      RETURN THIS.cSTecnico
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetSTDirec1
      RETURN THIS.cSTDirec1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetSTDirec2
      RETURN THIS.cSTDirec2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetSTTel
      RETURN THIS.cSTTel
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetSTHablar1
      RETURN THIS.cSTHablar1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetVendedor1
      RETURN THIS.cVendedor1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetLArti1
      RETURN THIS.cLArti1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetTVend1
      RETURN THIS.cTVend1
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetVendedor2
      RETURN THIS.cVendedor2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetLArti2
      RETURN THIS.cLArti2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetTVend2
      RETURN THIS.cTVend2
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetVendedor3
      RETURN THIS.cVendedor3
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetLArti3
      RETURN THIS.cLArti3
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetTVend3
      RETURN THIS.cTVend3
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetVendedor4
      RETURN THIS.cVendedor4
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetLArti4
      RETURN THIS.cLArti4
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetTVend4
      RETURN THIS.cTVend4
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetVendedor5
      RETURN THIS.cVendedor5
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetLArti5
      RETURN THIS.cLArti5
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetTVend5
      RETURN THIS.cTVend5
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
   FUNCTION GetVigente
      RETURN THIS.cVigente
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
   FUNCTION ValidarRUC()
      IF EMPTY(THIS.cRUC) THEN
         MESSAGEBOX('El RUC no puede quedar en blanco.', 0+16, THIS.Name + '.ValidarRUC()')
         RETURN .F.
      ENDIF

      IF !ValidarFormatoRUC(THIS.cRUC) THEN
         MESSAGEBOX('El RUC digitado es incorrecto, debe ser numérico, solo se permite una letra cuando se trata de cédula de identidad.', 0+16, THIS.Name + '.ValidarRUC()')
         RETURN .F.
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
   FUNCTION ValidarDiasPlazo()
      IF !BETWEEN(THIS.nDiasPlazo, 0, 999) THEN
         MESSAGEBOX([Días de plazo debe ser un valor entre 0 y 999.], 0+16, THIS.Name + '.ValidarDiasPlazo()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarVigente()
      IF !INLIST(THIS.cVigente, 'S', 'N') THEN
         MESSAGEBOX([Vigente puede ser 'S' para Sí o 'N' para No.], 0+16, THIS.Name + '.ValidarVigente()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION CargarDatos
      WITH THIS
         .nCodigo = codigo
         .cNombre = nombre
         .cDirec1 = direc1
         .cDirec2 = direc2
         .cCiudad = ciudad
         .cTelefono = telefono
         .cFax = fax
         .cEMail = e_mail

         IF OCCURS('-', ruc) = 1 THEN
            .cRUC = LEFT(ruc, ATC('-', ruc) - 1)   && Obtiene el RUC sin el DV.
            .cDV = RIGHT(RTRIM(ruc), 1)
         ELSE
            .cRUC = ruc
            .cDV = ''
         ENDIF

         .nDiasPlazo = dias_plazo
         .cDueno = dueno
         .cTelDueno = teldueno
         .cGteGral = gtegral
         .cTelGG = telgg
         .cGteVentas = gteventas
         .cTelGV = telgv
         .cGteMkg = gtemkg
         .cTelGM = telgm
         .cSTecnico = stecnico
         .cSTDirec1 = stdirec1
         .cSTDirec2 = stdirec2
         .cSTTel = sttel
         .cSTHablar1 = sthablar1
         .cVendedor1 = vendedor1
         .cLArti1 = larti1
         .cTVend1 = tvend1
         .cVendedor2 = vendedor2
         .cLArti2 = larti2
         .cTVend2 = tvend2
         .cVendedor3 = vendedor3
         .cLArti3 = larti3
         .cTVend3 = tvend3
         .cVendedor4 = vendedor4
         .cLArti4 = larti4
         .cTVend4 = tvend4
         .cVendedor5 = vendedor5
         .cLArti5 = larti5
         .cTVend5 = tvend5
         .nSaldoActu = saldo_actu
         .nSaldoUSD = saldo_usd
         .cVigente = vigente
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

      IF !THIS.ValidarRUC() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDV() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDiasPlazo() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarVigente() THEN
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
         INSERT INTO (THIS.cTabla) (codigo, nombre, direc1, direc2, ciudad, telefono, fax, e_mail, ruc, dias_plazo, dueno, ;
                                    teldueno,gtegral, telgg, gteventas, telgv, gtemkg, telgm, stecnico, stdirec1, stdirec2, ;
                                    sttel,  sthablar1, vendedor1, larti1, tvend1, vendedor2, larti2, tvend2, vendedor3, ;
                                    larti3, tvend3, vendedor4, larti4, tvend4, vendedor5, larti5, tvend5, saldo_actu, ;
                                    saldo_usd, vigente) ;
            VALUES (THIS.nCodigo, THIS.cNombre, THIS.cDirec1, THIS.cDirec2, THIS.cCiudad, THIS.cTelefono, ;
                    THIS.cFax, THIS.cEMail,  IIF(!EMPTY(THIS.cRUC), ALLTRIM(THIS.cRUC) + '-' + THIS.cDV, ALLTRIM(THIS.cRUC)), ;
                    THIS.nDiasPlazo, THIS.cDueno, THIS.cTelDueno, THIS.cGteGral, THIS.cTelGG, THIS.cGteVentas, THIS.cTelGV, ;
                    THIS.cGteMkg, THIS.cTelGM, THIS.cSTecnico,  THIS.cSTDirec1, THIS.cSTDirec2, THIS.cSTTel, THIS.cSTHablar1, ;
                    THIS.cVendedor1, THIS.cLArti1, THIS.cTVend1, THIS.cVendedor2, THIS.cLArti2, THIS.cTVend2, THIS.cVendedor3, ;
                    THIS.cLArti3, THIS.cTVend3, THIS.cVendedor4, THIS.cLArti4, THIS.cTVend4, THIS.cVendedor5, THIS.cLArti5, ;
                    THIS.cTVend5, THIS.nSaldoActu, THIS.nSaldoUSD, THIS.cVigente)

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
            ciudad = THIS.cCiudad, ;
            telefono = THIS.cTelefono, ;
            fax = THIS.cFax, ;
            e_mail = THIS.cEMail, ;
            ruc = IIF(!EMPTY(THIS.cRUC), ALLTRIM(THIS.cRUC) + '-' + THIS.cDV, ALLTRIM(THIS.cRUC)), ;
            dias_plazo = THIS.nDiasPlazo, ;
            dueno = THIS.cDueno, ;
            teldueno = THIS.cTelDueno, ;
            gtegral = THIS.cGteGral, ;
            telgg = THIS.cTelGG, ;
            gteventas = THIS.cGteVentas, ;
            telgv = THIS.cTelGV, ;
            gtemkg = THIS.cGteMkg, ;
            telgm = THIS.cTelGM, ;
            stecnico = THIS.cSTecnico, ;
            stdirec1 = THIS.cSTDirec1, ;
            stdirec2 = THIS.cSTDirec2, ;
            sttel = THIS.cSTTel, ;
            sthablar1 = THIS.cSTHablar1, ;
            vendedor1 = THIS.cVendedor1, ;
            larti1 = THIS.cLArti1, ;
            tvend1 = THIS.cTVend1, ;
            vendedor2 = THIS.cVendedor2, ;
            larti2 = THIS.cLArti2, ;
            tvend2 = THIS.cTVend2, ;
            vendedor3 = THIS.cVendedor3, ;
            larti3 = THIS.cLArti3, ;
            tvend3 = THIS.cTVend3, ;
            vendedor4 = THIS.cVendedor4, ;
            larti4 = THIS.cLArti4, ;
            tvend4 = THIS.cTVend4, ;
            vendedor5 = THIS.cVendedor5, ;
            larti5 = THIS.cLArti5, ;
            tvend5 = THIS.cTVend5, ;
            vigente = THIS.cVigente ;
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

      * Compras.
      IF llRetorno THEN
         lcSQL = 'SELECT TOP 1 ' + THIS.cClaveForanea + ' FROM cabecomp ORDER BY ' + THIS.cClaveForanea + ' WHERE ' + THIS.cClaveForanea + ' = ' + ALLTRIM(STR(lnCodigo)) + ' INTO CURSOR ' + lcCursor
         &lcSQL
         IF _TALLY > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Compras', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
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