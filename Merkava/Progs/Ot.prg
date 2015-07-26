DEFINE CLASS OT AS CUSTOM
   PROTECTED cSerie
   PROTECTED nNroOT
   PROTECTED nCliente
   PROTECTED cNombreOT
   PROTECTED cContacto
   PROTECTED cDirecOT
   PROTECTED cTelefOT
   PROTECTED cCedulaOT
   PROTECTED nDepartamen
   PROTECTED nCiudad
   PROTECTED nBarrio
   PROTECTED nMaquina
   PROTECTED nMarca
   PROTECTED nModelo
   PROTECTED cAccesorio
   PROTECTED cMotor
   PROTECTED cChasis
   PROTECTED nMecanico
   PROTECTED cChapa
   PROTECTED cColor
   PROTECTED cKM
   PROTECTED dFRecepcion
   PROTECTED dFPEntrega
   PROTECTED cTrabajo1
   PROTECTED cTrabajo2
   PROTECTED cTrabajo3
   PROTECTED dFEntrega
   PROTECTED nEstadoOT
   PROTECTED nTipoDocu
   PROTECTED nNroDocu
   PROTECTED cReferencia
   PROTECTED nLocalRep
   PROTECTED nIDLocal

   FUNCTION Init
      IF !USED('ot') THEN
         USE ot IN 0 AGAIN ORDER 0 SHARED
      ENDIF

      IF !USED('mecanico') THEN
         USE mecanico IN 0 AGAIN ORDER 0 SHARED
      ENDIF

      IF !USED('clientes') THEN
         USE clientes IN 0 AGAIN ORDER 0 SHARED
      ENDIF

      IF !USED('depar') THEN
         USE depar IN 0 AGAIN ORDER 0 SHARED
      ENDIF

      IF !USED('ciudades') THEN
         USE ciudades IN 0 AGAIN ORDER 0 SHARED
      ENDIF

      IF !USED('barrios') THEN
         USE barrios IN 0 AGAIN ORDER 0 SHARED
      ENDIF

      IF !USED('maquinas') THEN
         USE maquinas IN 0 AGAIN ORDER 0 SHARED
      ENDIF

      IF !USED('marcas2') THEN
         USE marcas2 IN 0 AGAIN ORDER 0 SHARED
      ENDIF

      IF !USED('modelos') THEN
         USE modelos IN 0 AGAIN ORDER 0 SHARED
      ENDIF

      IF !USED('estadoot') THEN
         USE estadoot IN 0 AGAIN ORDER 0 SHARED
      ENDIF
   ENDFUNC

   FUNCTION Destroy
   ENDFUNC
ENDDEFINE