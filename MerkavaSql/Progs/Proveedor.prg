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
         .cTabla = 'proveedor'
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
   FUNCTION SetCiudad
      LPARAMETER tcCiudad

      * inicio { validación de parámetro }
      IF VARTYPE(tcCiudad) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcCiudad' debe ser de tipo texto.], 0+16, THIS.Name + '.SetCiudad()')
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
      IF !BETWEEN(THIS.nCodigo, 1, 65535) THEN
         MESSAGEBOX([El código debe ser un valor entre 1 y 65535.], 0+16, THIS.Name + '.ValidarCodigo()')
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

      IF LEN(THIS.cNombre) > 50 THEN
         MESSAGEBOX([La longitud del campo 'cNombre' debe ser como máximo de 50 caracteres.], 0+16, THIS.Name + '.ValidarNombre()')
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
   FUNCTION ValidarCiudad()
      IF LEN(THIS.cCiudad) > 25 THEN
         MESSAGEBOX([La longitud del campo 'cCiudad' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.ValidarCiudad()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarTelefono()
      IF LEN(THIS.cTelefono) > 40 THEN
         MESSAGEBOX([La longitud del campo 'cTelefono' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.ValidarTelefono()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarFax()
      IF LEN(THIS.cFax) > 25 THEN
         MESSAGEBOX([La longitud del campo 'cFax' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.ValidarFax()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarEMail()
      IF LEN(THIS.cEMail) > 60 THEN
         MESSAGEBOX([La longitud del campo 'cEMail' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.ValidarEMail()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarRUC()
      IF EMPTY(THIS.cRUC) THEN
         MESSAGEBOX('El RUC no puede quedar en blanco.', 0+16, THIS.Name + '.ValidarRUC()')
         RETURN .F.
      ENDIF

      IF LEN(THIS.cRUC) > 15 THEN
         MESSAGEBOX([La longitud del campo 'cRUC' debe ser como máximo de 15 caracteres.], 0+16, THIS.Name + '.ValidarRUC()')
         RETURN .F.
      ENDIF

      IF !ValidarFormatoRUC(THIS.cRUC) THEN
         MESSAGEBOX('El RUC digitado es incorrecto, debe ser numérico, solo se permite una letra cuando se trata de cédula de identidad.', 0+16, THIS.Name + '.ValidarRUC()')
         RETURN .F.
      ENDIF

      **/
      *   RUC genérico habilitado para el libro compras:
      *      Proveedores del Exterior – RUC 99999901 DV 0: Para compras efectuadas de personas físicas o jurídicas residentes en el exterior.
      */
      IF THIS.cRUC = '99999901' THEN
         RETURN .T.
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

      IF LEN(THIS.cDV) > 1 THEN
         MESSAGEBOX([La longitud del campo 'cDV' debe ser como máximo de 1 caracter.], 0+16, THIS.Name + '.ValidarDV()')
         RETURN .F.
      ENDIF

      IF !ValidarFormatoRUC(THIS.cRUC) THEN
         MESSAGEBOX('El RUC digitado es incorrecto, debe ser numérico, solo se permite una letra cuando se trata de cédula de identidad.', 0+16, THIS.Name + '.ValidarDV()')
         RETURN .F.
      ENDIF

      IF STR(calcular_dv_11_a(THIS.cRUC, 11), 1) <> THIS.cDV THEN
         MESSAGEBOX('El Dígito Verificador no corresponde.', 0+16, THIS.Name + '.ValidarDV()')
         RETURN .F.
      ENDIF

      **/
      *   RUC genérico habilitado para el libro compras:
      *      Proveedores del Exterior – RUC 99999901 DV 0: Para compras efectuadas de personas físicas o jurídicas residentes en el exterior.
      */
      IF THIS.cRUC = '99999901' AND THIS.cDV = '0' THEN
         RETURN .T.
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
   FUNCTION ValidarDueno()
      IF LEN(THIS.cDueno) > 40 THEN
         MESSAGEBOX([La longitud del campo 'cDueno' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.ValidarDueno()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarTelDueno()
      IF LEN(THIS.cTelDueno) > 25 THEN
         MESSAGEBOX([La longitud del campo 'cTelDueno' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.ValidarTelDueno()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarGteGral()
      IF LEN(THIS.cGteGral) > 40 THEN
         MESSAGEBOX([La longitud del campo 'cGteGral' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.ValidarGteGral()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarTelGG()
      IF LEN(THIS.cTelGG) > 25 THEN
         MESSAGEBOX([La longitud del campo 'cTelGG' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.ValidarTelGG()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarGteVentas()
      IF LEN(THIS.cGteVentas) > 40 THEN
         MESSAGEBOX([La longitud del campo 'cGteVentas' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.ValidarGteVentas()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarTelGV()
      IF LEN(THIS.cTelGV) > 25 THEN
         MESSAGEBOX([La longitud del campo 'cTelGV' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.ValidarTelGV()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarGteMkg()
      IF LEN(THIS.cGteMkg) > 40 THEN
         MESSAGEBOX([La longitud del campo 'cGteMkg' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.ValidarGteMkg()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarTelGM()
      IF LEN(THIS.cTelGM) > 25 THEN
         MESSAGEBOX([La longitud del campo 'cTelGM' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.ValidarTelGM()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarSTecnico()
      IF LEN(THIS.cSTecnico) > 40 THEN
         MESSAGEBOX([La longitud del campo 'cSTecnico' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.ValidarSTecnico()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarSTDirec1()
      IF LEN(THIS.cSTDirec1) > 60 THEN
         MESSAGEBOX([La longitud del campo 'cSTDirec1' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.ValidarSTDirec1()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarSTDirec2()
      IF LEN(THIS.cSTDirec2) > 60 THEN
         MESSAGEBOX([La longitud del campo 'cSTDirec2' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.ValidarSTDirec2()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarSTTel()
      IF LEN(THIS.cSTTel) > 25 THEN
         MESSAGEBOX([La longitud del campo 'cSTTel' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.ValidarSTTel()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarSTHablar1()
      IF LEN(THIS.cSTHablar1) > 60 THEN
         MESSAGEBOX([La longitud del campo 'cSTHablar1' debe ser como máximo de 60 caracteres.], 0+16, THIS.Name + '.ValidarSTHablar1()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarVendedor1()
      IF LEN(THIS.cVendedor1) > 40 THEN
         MESSAGEBOX([La longitud del campo 'cVendedor1' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.ValidarVendedor1()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarLArti1()
      IF LEN(THIS.cLArti1) > 25 THEN
         MESSAGEBOX([La longitud del campo 'cLArti1' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.ValidarLArti1()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarTVend1()
      IF LEN(THIS.cTVend1) > 25 THEN
         MESSAGEBOX([La longitud del campo 'cTVend1' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.ValidarTVend1()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarVendedor2()
      IF LEN(THIS.cVendedor2) > 40 THEN
         MESSAGEBOX([La longitud del campo 'cVendedor2' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.ValidarVendedor2()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarLArti2()
      IF LEN(THIS.cLArti2) > 25 THEN
         MESSAGEBOX([La longitud del campo 'cLArti2' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.ValidarLArti2()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarTVend2()
      IF LEN(THIS.cTVend2) > 25 THEN
         MESSAGEBOX([La longitud del campo 'cTVend2' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.ValidarTVend2()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarVendedor3()
      IF LEN(THIS.cVendedor3) > 40 THEN
         MESSAGEBOX([La longitud del campo 'cVendedor3' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.ValidarVendedor3()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarLArti3()
      IF LEN(THIS.cLArti3) > 25 THEN
         MESSAGEBOX([La longitud del campo 'cLArti3' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.ValidarLArti3()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarTVend3()
      IF LEN(THIS.cTVend3) > 25 THEN
         MESSAGEBOX([La longitud del campo 'cTVend3' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.ValidarTVend3()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarVendedor4()
      IF LEN(THIS.cVendedor4) > 40 THEN
         MESSAGEBOX([La longitud del campo 'cVendedor4' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.ValidarVendedor4()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarLArti4()
      IF LEN(THIS.cLArti4) > 25 THEN
         MESSAGEBOX([La longitud del campo 'cLArti4' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.ValidarLArti4()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarTVend4()
      IF LEN(THIS.cTVend4) > 25 THEN
         MESSAGEBOX([La longitud del campo 'cTVend4' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.ValidarTVend4()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarVendedor5()
      IF LEN(THIS.cVendedor5) > 40 THEN
         MESSAGEBOX([La longitud del campo 'cVendedor5' debe ser como máximo de 40 caracteres.], 0+16, THIS.Name + '.ValidarVendedor5()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarLArti5()
      IF LEN(THIS.cLArti5) > 25 THEN
         MESSAGEBOX([La longitud del campo 'cLArti5' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.ValidarLArti5()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarTVend5()
      IF LEN(THIS.cTVend5) > 25 THEN
         MESSAGEBOX([La longitud del campo 'cTVend5' debe ser como máximo de 25 caracteres.], 0+16, THIS.Name + '.ValidarTVend5()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarVigente()
      IF LEN(THIS.cVigente) > 1 THEN
         MESSAGEBOX([La longitud del parámetro 'tcVigente' debe ser como máximo de 1 caracter.], 0+16, THIS.Name + '.ValidarVigente()')
         RETURN .F.
      ENDIF

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
         .cDirec1 = IIF(!ISNULL(direc1), direc1, '')
         .cDirec2 = IIF(!ISNULL(direc2), direc2, '')
         .cCiudad = IIF(!ISNULL(ciudad), ciudad, '')
         .cTelefono = IIF(!ISNULL(telefono), telefono, '')
         .cFax = IIF(!ISNULL(fax), fax, '')
         .cEMail = IIF(!ISNULL(e_mail), e_mail, '')
         .cRUC = IIF(!ISNULL(ruc), ruc, '')
         .cDV = IIF(!ISNULL(dv), dv, '')
         .nDiasPlazo = IIF(!ISNULL(dias_plazo), dias_plazo, 0)
         .cDueno = IIF(!ISNULL(dueno), dueno, '')
         .cTelDueno = IIF(!ISNULL(teldueno), teldueno, '')
         .cGteGral = IIF(!ISNULL(gtegral), gtegral, '')
         .cTelGG = IIF(!ISNULL(telgg), telgg, '')
         .cGteVentas = IIF(!ISNULL(gteventas), gteventas, '')
         .cTelGV = IIF(!ISNULL(telgv), telgv, '')
         .cGteMkg = IIF(!ISNULL(gtemkg), gtemkg, '')
         .cTelGM = IIF(!ISNULL(telgm), telgm, '')
         .cSTecnico = IIF(!ISNULL(stecnico), stecnico, '')
         .cSTDirec1 = IIF(!ISNULL(stdirec1), stdirec1, '')
         .cSTDirec2 = IIF(!ISNULL(stdirec2), stdirec2, '')
         .cSTTel = IIF(!ISNULL(sttel), sttel, '')
         .cSTHablar1 = IIF(!ISNULL(sthablar1), sthablar1, '')
         .cVendedor1 = IIF(!ISNULL(vendedor1), vendedor1, '')
         .cLArti1 = IIF(!ISNULL(larti1), larti1, '')
         .cTVend1 = IIF(!ISNULL(tvend1), tvend1, '')
         .cVendedor2 = IIF(!ISNULL(vendedor2), vendedor2, '')
         .cLArti2 = IIF(!ISNULL(larti2), larti2, '')
         .cTVend2 = IIF(!ISNULL(tvend2), tvend2, '')
         .cVendedor3 = IIF(!ISNULL(vendedor3), vendedor3, '')
         .cLArti3 = IIF(!ISNULL(larti3), larti3, '')
         .cTVend3 = IIF(!ISNULL(tvend3), tvend3, '')
         .cVendedor4 = IIF(!ISNULL(vendedor4), vendedor4, '')
         .cLArti4 = IIF(!ISNULL(larti4), larti4, '')
         .cTVend4 = IIF(!ISNULL(tvend4), tvend4, '')
         .cVendedor5 = IIF(!ISNULL(vendedor5), vendedor5, '')
         .cLArti5 = IIF(!ISNULL(larti5), larti5, '')
         .cTVend5 = IIF(!ISNULL(tvend5), tvend5, '')
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

      IF !THIS.ValidarDirec1() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDirec2() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarCiudad() THEN
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

      IF !THIS.ValidarRUC() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDV() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDiasPlazo() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDueno() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarTelDueno() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarGteGral() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarTelGG() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarGteVentas() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarTelGV() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarGteMkg() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarTelGM() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarSTecnico() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarSTDirec1() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarSTDirec2() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarSTTel() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarSTHablar1() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarVendedor1() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarLArti1() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarTVend1() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarVendedor2() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarLArti2() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarTVend2() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarVendedor3() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarLArti3() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarTVend3() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarVendedor4() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarLArti4() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarTVend4() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarVendedor5() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarLArti5() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarTVend5() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarVigente() THEN
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Agregar
      LOCAL llRetorno
      llRetorno = .T.
      THIS.nBandera = 1

      IF THIS.Validar() THEN
         PRIVATE pnCodigo, pcNombre, pcDirec1, pcDirec2, pcCiudad, pcTelefono, pcFax, pcEMail, pcRUC, pcDV, pnDiasPlazo, pcDueno, ;
                 pcTelDueno, pcGteGral, pcTelGG, pcGteVentas, pcTelGV, pcGteMkg, pcTelGM, pcSTecnico, pcSTDirec1, pcSTDirec2, ;
                 pcSTTel, pcSTHablar1, pcVendedor1, pcLArti1, pcTVend1, pcVendedor2, pcLArti2, pcTVend2, pcVendedor3, ;
                 pcLArti3, pcTVend3, pcVendedor4, pcLArti4, pcTVend4, pcVendedor5, pcLArti5, pcTVend5, pnSaldoActu, ;
                 pnSaldoUSD, pcVigente

         pnCodigo = THIS.nCodigo
         pcNombre = THIS.cNombre
         pcDirec1 = IIF(!EMPTY(THIS.cDirec1), THIS.cDirec1, NULL)
         pcDirec2 = IIF(!EMPTY(THIS.cDirec2), THIS.cDirec2, NULL)
         pcCiudad = IIF(!EMPTY(THIS.cCiudad), THIS.cCiudad, NULL)
         pcTelefono = IIF(!EMPTY(THIS.cTelefono), THIS.cTelefono, NULL)
         pcFax = IIF(!EMPTY(THIS.cFax), THIS.cFax, NULL)
         pcEMail = IIF(!EMPTY(THIS.cEMail), THIS.cEMail, NULL)
         pcRUC = IIF(!EMPTY(THIS.cRUC), THIS.cRUC, NULL)
         pcDV = IIF(!EMPTY(THIS.cDV), THIS.cDV, NULL)
         pnDiasPlazo = IIF(THIS.nDiasPlazo > 0, THIS.nDiasPlazo, NULL)
         pcDueno = IIF(!EMPTY(THIS.cDueno), THIS.cDueno, NULL)
         pcTelDueno = IIF(!EMPTY(THIS.cTelDueno), THIS.cTelDueno, NULL)
         pcGteGral = IIF(!EMPTY(THIS.cGteGral), THIS.cGteGral, NULL)
         pcTelGG = IIF(!EMPTY(THIS.cTelGG), THIS.cTelGG, NULL)
         pcGteVentas = IIF(!EMPTY(THIS.cGteVentas), THIS.cGteVentas, NULL)
         pcTelGV = IIF(!EMPTY(THIS.cTelGV), THIS.cTelGV, NULL)
         pcGteMkg = IIF(!EMPTY(THIS.cGteMkg), THIS.cGteMkg, NULL)
         pcTelGM = IIF(!EMPTY(THIS.cTelGM), THIS.cTelGM, NULL)
         pcSTecnico = IIF(!EMPTY(THIS.cSTecnico), THIS.cSTecnico, NULL)
         pcSTDirec1 = IIF(!EMPTY(THIS.cSTDirec1), THIS.cSTDirec1, NULL)
         pcSTDirec2 = IIF(!EMPTY(THIS.cSTDirec2), THIS.cSTDirec2, NULL)
         pcSTTel = IIF(!EMPTY(THIS.cSTTel), THIS.cSTTel, NULL)
         pcSTHablar1 = IIF(!EMPTY(THIS.cSTHablar1), THIS.cSTHablar1, NULL)
         pcVendedor1 = IIF(!EMPTY(THIS.cVendedor1), THIS.cVendedor1, NULL)
         pcLArti1 = IIF(!EMPTY(THIS.cLArti1), THIS.cLArti1, NULL)
         pcTVend1 = IIF(!EMPTY(THIS.cTVend1), THIS.cTVend1, NULL)
         pcVendedor2 = IIF(!EMPTY(THIS.cVendedor2), THIS.cVendedor2, NULL)
         pcLArti2 = IIF(!EMPTY(THIS.cLArti2), THIS.cLArti2, NULL)
         pcTVend2 = IIF(!EMPTY(THIS.cTVend2), THIS.cTVend2, NULL)
         pcVendedor3 = IIF(!EMPTY(THIS.cVendedor3), THIS.cVendedor3, NULL)
         pcLArti3 = IIF(!EMPTY(THIS.cLArti3), THIS.cLArti3, NULL)
         pcTVend3 = IIF(!EMPTY(THIS.cTVend3), THIS.cTVend3, NULL)
         pcVendedor4 = IIF(!EMPTY(THIS.cVendedor4), THIS.cVendedor4, NULL)
         pcLArti4 = IIF(!EMPTY(THIS.cLArti4), THIS.cLArti4, NULL)
         pcTVend4 = IIF(!EMPTY(THIS.cTVend4), THIS.cTVend4, NULL)
         pcVendedor5 = IIF(!EMPTY(THIS.cVendedor5), THIS.cVendedor5, NULL)
         pcLArti5 = IIF(!EMPTY(THIS.cLArti5), THIS.cLArti5, NULL)
         pcTVend5 = IIF(!EMPTY(THIS.cTVend5), THIS.cTVend5, NULL)
         pnSaldoActu = THIS.nSaldoActu
         pnSaldoUSD = THIS.nSaldoUSD
         pcVigente = THIS.cVigente

         IF goCapaDatos.AgregarRegistro(THIS.cTabla, ;
                                        'codigo, nombre, direc1, direc2, ciudad, telefono, fax, e_mail, ruc, dv, dias_plazo, dueno, ' + ;
                                        'teldueno, gtegral, telgg, gteventas, telgv, gtemkg, telgm, stecnico, stdirec1, stdirec2, ' + ;
                                        'sttel,  sthablar1, vendedor1, larti1, tvend1, vendedor2, larti2, tvend2, vendedor3, ' + ;
                                        'larti3, tvend3, vendedor4, larti4, tvend4, vendedor5, larti5, tvend5, saldo_actu, ' + ;
                                        'saldo_usd, vigente', ;
                                        '?pnCodigo, ?pcNombre, ?pcDirec1, ?pcDirec2, ?pcCiudad, ?pcTelefono, ?pcFax, ?pcEMail, ?pcRUC, ?pcDV, ?pnDiasPlazo, ?pcDueno, ' + ;
                                        '?pcTelDueno, ?pcGteGral, ?pcTelGG, ?pcGteVentas, ?pcTelGV, ?pcGteMkg, ?pcTelGM, ?pcSTecnico, ?pcSTDirec1, ?pcSTDirec2, ' + ;
                                        '?pcSTTel, ?pcSTHablar1, ?pcVendedor1, ?pcLArti1, ?pcTVend1, ?pcVendedor2, ?pcLArti2, ?pcTVend2, ?pcVendedor3, ' + ;
                                        '?pcLArti3, ?pcTVend3, ?pcVendedor4, ?pcLArti4, ?pcTVend4, ?pcVendedor5, ?pcLArti5, ?pcTVend5, ?pnSaldoActu, ' + ;
                                        '?pnSaldoUSD, ?pcVigente')
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
         PRIVATE pnCodigo, pcNombre, pcDirec1, pcDirec2, pcCiudad, pcTelefono, pcFax, pcEMail, pcRUC, pcDV, pnDiasPlazo, pcDueno, ;
                 pcTelDueno, pcGteGral, pcTelGG, pcGteVentas, pcTelGV, pcGteMkg, pcTelGM, pcSTecnico, pcSTDirec1, pcSTDirec2, ;
                 pcSTTel, pcSTHablar1, pcVendedor1, pcLArti1, pcTVend1, pcVendedor2, pcLArti2, pcTVend2, pcVendedor3, ;
                 pcLArti3, pcTVend3, pcVendedor4, pcLArti4, pcTVend4, pcVendedor5, pcLArti5, pcTVend5, pcVigente

         pnCodigo = THIS.nCodigo
         pcNombre = THIS.cNombre
         pcDirec1 = IIF(!EMPTY(THIS.cDirec1), THIS.cDirec1, NULL)
         pcDirec2 = IIF(!EMPTY(THIS.cDirec2), THIS.cDirec2, NULL)
         pcCiudad = IIF(!EMPTY(THIS.cCiudad), THIS.cCiudad, NULL)
         pcTelefono = IIF(!EMPTY(THIS.cTelefono), THIS.cTelefono, NULL)
         pcFax = IIF(!EMPTY(THIS.cFax), THIS.cFax, NULL)
         pcEMail = IIF(!EMPTY(THIS.cEMail), THIS.cEMail, NULL)
         pcRUC = IIF(!EMPTY(THIS.cRUC), THIS.cRUC, NULL)
         pcDV = IIF(!EMPTY(THIS.cDV), THIS.cDV, NULL)
         pnDiasPlazo = IIF(THIS.nDiasPlazo > 0, THIS.nDiasPlazo, NULL)
         pcDueno = IIF(!EMPTY(THIS.cDueno), THIS.cDueno, NULL)
         pcTelDueno = IIF(!EMPTY(THIS.cTelDueno), THIS.cTelDueno, NULL)
         pcGteGral = IIF(!EMPTY(THIS.cGteGral), THIS.cGteGral, NULL)
         pcTelGG = IIF(!EMPTY(THIS.cTelGG), THIS.cTelGG, NULL)
         pcGteVentas = IIF(!EMPTY(THIS.cGteVentas), THIS.cGteVentas, NULL)
         pcTelGV = IIF(!EMPTY(THIS.cTelGV), THIS.cTelGV, NULL)
         pcGteMkg = IIF(!EMPTY(THIS.cGteMkg), THIS.cGteMkg, NULL)
         pcTelGM = IIF(!EMPTY(THIS.cTelGM), THIS.cTelGM, NULL)
         pcSTecnico = IIF(!EMPTY(THIS.cSTecnico), THIS.cSTecnico, NULL)
         pcSTDirec1 = IIF(!EMPTY(THIS.cSTDirec1), THIS.cSTDirec1, NULL)
         pcSTDirec2 = IIF(!EMPTY(THIS.cSTDirec2), THIS.cSTDirec2, NULL)
         pcSTTel = IIF(!EMPTY(THIS.cSTTel), THIS.cSTTel, NULL)
         pcSTHablar1 = IIF(!EMPTY(THIS.cSTHablar1), THIS.cSTHablar1, NULL)
         pcVendedor1 = IIF(!EMPTY(THIS.cVendedor1), THIS.cVendedor1, NULL)
         pcLArti1 = IIF(!EMPTY(THIS.cLArti1), THIS.cLArti1, NULL)
         pcTVend1 = IIF(!EMPTY(THIS.cTVend1), THIS.cTVend1, NULL)
         pcVendedor2 = IIF(!EMPTY(THIS.cVendedor2), THIS.cVendedor2, NULL)
         pcLArti2 = IIF(!EMPTY(THIS.cLArti2), THIS.cLArti2, NULL)
         pcTVend2 = IIF(!EMPTY(THIS.cTVend2), THIS.cTVend2, NULL)
         pcVendedor3 = IIF(!EMPTY(THIS.cVendedor3), THIS.cVendedor3, NULL)
         pcLArti3 = IIF(!EMPTY(THIS.cLArti3), THIS.cLArti3, NULL)
         pcTVend3 = IIF(!EMPTY(THIS.cTVend3), THIS.cTVend3, NULL)
         pcVendedor4 = IIF(!EMPTY(THIS.cVendedor4), THIS.cVendedor4, NULL)
         pcLArti4 = IIF(!EMPTY(THIS.cLArti4), THIS.cLArti4, NULL)
         pcTVend4 = IIF(!EMPTY(THIS.cTVend4), THIS.cTVend4, NULL)
         pcVendedor5 = IIF(!EMPTY(THIS.cVendedor5), THIS.cVendedor5, NULL)
         pcLArti5 = IIF(!EMPTY(THIS.cLArti5), THIS.cLArti5, NULL)
         pcTVend5 = IIF(!EMPTY(THIS.cTVend5), THIS.cTVend5, NULL)
         pnSaldoActu = THIS.nSaldoActu
         pnSaldoUSD = THIS.nSaldoUSD
         pcVigente = THIS.cVigente

         IF goCapaDatos.ModificarRegistro(THIS.cTabla, ;
                                          'nombre = ?pcNombre, direc1 = ?pcDirec1, direc2 = ?pcDirec2, ciudad = ?pcCiudad, telefono = ?pcTelefono, fax = ?pcFax, ' + ;
                                          'e_mail = ?pcEMail, ruc = ?pcRUC, dv = ?pcDV, dias_plazo = ?pnDiasPlazo, dueno = ?pcDueno, teldueno = ?pcTelDueno, ' + ;
                                          'gtegral = ?pcGteGral, telgg = ?pcTelGG, gteventas = ?pcGteVentas, telgv = ?pcTelGV, gtemkg = ?pcGteMkg, ' + ;
                                          'telgm = ?pcTelGM, stecnico = ?pcSTecnico, stdirec1 = ?pcSTDirec1, stdirec2 = ?pcSTDirec2, sttel = ?pcSTTel, ' + ;
                                          'sthablar1 = ?pcSTHablar1, vendedor1 = ?pcVendedor1, larti1 = ?pcLArti1, tvend1 = ?pcTVend1, vendedor2 = ?pcVendedor2, ' + ;
                                          'larti2 = ?pcLArti2, tvend2 = ?pcTVend2, vendedor3 = ?pcVendedor3, larti3 = ?pcLArti3, tvend3 = ?pcTVend3, ' + ;
                                          'vendedor4 = ?pcVendedor4, larti4 = ?pcLArti4, tvend4 = ?pcTVend4, vendedor5 = ?pcVendedor5, larti5 = ?pcLArti5, ' + ;
                                          'tvend5 = ?pcTVend5, vigente = ?pcVigente', ;
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