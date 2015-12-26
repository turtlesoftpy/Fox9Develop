* Esta versión del programa incluye registro que aunque no figuren en el listado de equivalencias del RUC cumplan
* con el formato valido del RUC.
CLOSE DATABASES
CLEAR
CLEAR ALL
CLOSE ALL

SET CENTURY ON
SET DATE BRITISH
SET DELETED ON
SET EXACT   ON
SET SAFETY  OFF
SET TALK    OFF

lnMes  = 11
lnAnio = 2015

CREATE CURSOR tm_detalle_hechauka ( ;
   tipo_registro N(1), ;
   ruc_cliente C(15), ;
   dv_cliente N(1), ;
   nombre_cliente C(80), ;
   tipo_documento N(2), ;
   numero_documento C(20), ;
   fecha_documento D(8), ;
   monto_venta_10 N(20), ;
   iva_debito_10 N(20), ;
   monto_venta_5 N(20), ;
   iva_debito_5 N(20), ;
   monto_venta_exenta N(20), ;
   monto_ingreso N(20), ;
   condicion_venta N(2), ;
   cantidad_cuota N(3), ;
   timbrado N(20) ;
)
INDEX ON STR(tipo_documento, 2) + numero_documento + DTOS(fecha_documento) TAG orden

CREATE CURSOR tm_detalle_hechauka2 ( ;
   tipo_registro N(1), ;
   ruc_cliente C(15), ;
   dv_cliente N(1), ;
   nombre_cliente C(80), ;
   tipo_documento N(2), ;
   numero_documento C(20), ;
   fecha_documento D(8), ;
   monto_venta_10 N(20), ;
   iva_debito_10 N(20), ;
   monto_venta_5 N(20), ;
   iva_debito_5 N(20), ;
   monto_venta_exenta N(20), ;
   monto_ingreso N(20), ;
   condicion_venta N(2), ;
   cantidad_cuota N(3), ;
   timbrado N(20) ;
)
INDEX ON DTOS(fecha_documento) TAG orden

IF !USED("clientes") THEN
   USE z:\turtle\aya\integrad.000\clientes IN 0 AGAIN ORDER 1 SHARED NOUPDATE
ENDIF

IF !USED("monedas") THEN
   USE z:\turtle\aya\integrad.000\monedas IN 0 AGAIN ORDER 1 SHARED NOUPDATE
ENDIF

IF !USED("maesprod") THEN
   USE z:\turtle\aya\integrad.000\maesprod IN 0 AGAIN ORDER 1 SHARED NOUPDATE
ENDIF

IF !USED("cabevent") THEN
   USE z:\turtle\aya\integrad.000\cabevent IN 0 AGAIN ORDER 1 SHARED NOUPDATE
ENDIF

IF !USED("cabeven2") THEN
   USE z:\turtle\aya\integrad.000\cabeven2 IN 0 AGAIN ORDER 1 SHARED NOUPDATE
ENDIF

IF !USED("plazos") THEN
   USE z:\turtle\aya\integrad.000\plazos IN 0 AGAIN ORDER 1 SHARED NOUPDATE
ENDIF

IF !USED("cabenotc") THEN
   USE z:\turtle\aya\integrad.000\cabenotc IN 0 AGAIN ORDER 1 SHARED NOUPDATE
ENDIF

IF !USED("detanotc") THEN
   USE z:\turtle\aya\integrad.000\detanotc IN 0 AGAIN ORDER 1 SHARED NOUPDATE
ENDIF





* -- procesa el archivo de ventas -----------------------------------------*
WAIT "CONSULTANDO ARCHIVO DE VENTAS..." WINDOW NOWAIT

SELECT;
   tipodocu,;
   nrodocu,;
   fechadocu;
FROM;
   cabevent;
WHERE;
   MONTH(fechadocu) = lnMes AND ;
   YEAR(fechadocu) = lnAnio AND ;
   INLIST(tipodocu, 7, 8) ;
ORDER BY;
   1, 2;
INTO CURSOR ;
   tm_cabevent

SELECT tm_cabevent
SCAN ALL
   WAIT "PROCESANDO ARCHIVO DE VENTAS: " + ALLTRIM(TRANSFORM(RECNO(), "999,999,999")) + "/" + ALLTRIM(TRANSFORM(RECCOUNT(), "999,999,999")) WINDOW NOWAIT

   lnTipoDocu = tipodocu
   lnNroDocu = nrodocu
   ldFechaDocumento = fechadocu

   lnTipoRegistro = 2
   lnTipoDocumento = 1
   lnCondicionVenta = IIF(lnTipoDocu = 7, 1, 2)


   * Determina el número del comprobante.
   lnTimbrado = 0
   DO CASE
      CASE BETWEEN(lnNroDocu, 1000000, 1999999)
         lcNumeroDocumento = "001-001-0" + TRANSFORM(lnNroDocu - 1000000, "@L 999999")
      CASE BETWEEN(lnNroDocu, 2000000, 2999999)
         lcNumeroDocumento = "001-002-0" + TRANSFORM(lnNroDocu - 2000000, "@L 999999")
      CASE BETWEEN(lnNroDocu, 3000000, 3999999)
         lcNumeroDocumento = "003-001-0" + TRANSFORM(lnNroDocu - 3000000, "@L 999999")
      CASE BETWEEN(lnNroDocu, 4000000, 4999999)
         lcNumeroDocumento = "001-001-0" + TRANSFORM(lnNroDocu - 4000000, "@L 999999")

         DO CASE
         CASE BETWEEN(lnNroDocu, 4030001, 4040000)   && Inicio: 01/12/2014 Fin: 31/12/2015
            lnTimbrado = 10830303
         CASE BETWEEN(lnNroDocu, 4040001, 4050000)   && Inicio: 12/03/2015 Fin: 31/03/2016
            lnTimbrado = 10980966
         CASE BETWEEN(lnNroDocu, 4050001, 4060000)   && Inicio: 07/09/2015 Fin: 30/09/2016
            lnTimbrado = 11231028
         ENDCASE
      CASE BETWEEN(lnNroDocu, 6000000, 6999999)
         lcNumeroDocumento = "006-001-0" + TRANSFORM(lnNroDocu - 6000000, "@L 999999")

         DO CASE
         CASE BETWEEN(lnNroDocu, 6000001, 6000500)   && Inicio: 26/05/2015 Fin: 31/05/2016
            lnTimbrado = 11083573
         CASE BETWEEN(lnNroDocu, 6000501, 6002500)   && Inicio: 07/10/2015 Fin: 31/10/2016
            lnTimbrado = 11269797
         ENDCASE
      OTHERWISE
         lcNumeroDocumento = STR(lnNroDocu, 15)
   ENDCASE


   SELECT cabevent
   SET ORDER TO 1
   IF SEEK(STR(lnTipoDocu, 1) + STR(lnNroDocu, 7)) THEN
      lnMontoFact = cabevent.monto_fact
      lnTipoCambio = cabevent.tipocambio
      lnCantidadCuota = 0

      SELECT clientes
      SET ORDER TO 1
      IF SEEK(cabevent.cliente) THEN
         SELECT cabeven2
         SET ORDER TO 1
         IF SEEK(STR(cabevent.tipodocu, 1) + STR(cabevent.nrodocu, 7)) THEN
            lcNombreCliente = ALLTRIM(nombre)
            lcRUC = ALLTRIM(documento)
         ELSE
            STORE '' TO lcNombreCliente, lcRUC
         ENDIF

         lcNombreCliente = IIF(EMPTY(lcNombreCliente), ALLTRIM(clientes.nombre), lcNombreCliente)
         lcNombreCliente = STRTRAN(lcNombreCliente, "¥", "Ñ")
         lcRUC = IIF(EMPTY(lcRUC), ALLTRIM(clientes.ruc), lcRUC)
      ELSE
         WAIT "EL CLIENTE: " + ALLTRIM(STR(cabevent.cliente)) + ", NO EXISTE." WINDOW
      ENDIF

      IF cabevent.tipodocu = 8 THEN   && Si es a crédito buscamos la cantidad de cuotas
         SELECT plazos
         SET ORDER TO 1
         IF SEEK(cabevent.id_plazo) THEN
            lnCantidadCuota = num_vtos
         ENDIF
      ENDIF
   ELSE
      WAIT "LA VENTA: " + ALLTRIM(STR(tm_cabevent.tipodocu)) + "/" + ALLTRIM(STR(tm_cabevent.nrodocu)) + ", NO EXISTE." WINDOW
   ENDIF

   DO vta_neta WITH tm_cabevent.tipodocu, tm_cabevent.nrodocu

   lnMontoVenta10 = tm_totales.grav_10
   lnIVADebito10  = tm_totales.iva_10
   lnMontoVenta5  = tm_totales.grav_5
   lnIVADebito5   = tm_totales.iva_5
   lnMontoVentaExenta = tm_totales.exenta
   lnTotalIngreso = tm_totales.exenta + tm_totales.grav_5 + tm_totales.grav_10 + tm_totales.iva_5 + tm_totales.iva_10

   INSERT INTO tm_detalle_hechauka VALUES (lnTipoRegistro, lcRUC, 0, lcNombreCliente, lnTipoDocumento, lcNumeroDocumento, ;
                                           ldFechaDocumento, lnMontoVenta10, lnIVADebito10, lnMontoVenta5, lnIVADebito5, ;
                                           lnMontoVentaExenta, lnTotalIngreso, lnCondicionVenta, lnCantidadCuota, lnTimbrado)
ENDSCAN





* -- procesa el archivo de devoluciones de clientes -----------------------*
WAIT "CONSULTANDO ARCHIVO DE NOTAS DE DEBITOS Y CREDITOS..." WINDOW NOWAIT

SELECT;
   tiponota,;
   nronota,;
   fechanota,;
   tipodocu,;
   nrodocu;
FROM;
   cabenotc;
WHERE;
   MONTH(fechanota) = lnMes AND ;
   YEAR(fechanota) = lnAnio AND ;
   tiponota = 2 ;
ORDER BY;
   1, 2;
INTO CURSOR ;
   tm_cabenotc

SELECT tm_cabenotc
SCAN ALL
   WAIT "PROCESANDO ARCHIVO DE NOTAS DE DEBITOS Y CREDITOS: " + ALLTRIM(TRANSFORM(RECNO(), "999,999,999")) + "/" + ALLTRIM(TRANSFORM(RECCOUNT(), "999,999,999")) WINDOW NOWAIT

   lnTipoNota = tiponota
   lnNroNota  = nronota
   lnTipoDocu = tipodocu
   lnNroDocu  = nrodocu
   ldFechaDocumento = fechanota

   lnTipoRegistro = 2
   lnTipoDocumento = 3

   * Determina el número del comprobante.
   lnTimbrado = 0
   DO CASE
      CASE BETWEEN(lnNroNota, 1000000, 1999999)
         lcNumeroDocumento = "001-001-0" + TRANSFORM(lnNroNota - 1000000, "@L 999999")
      CASE BETWEEN(lnNroNota, 2000000, 2999999)
         lcNumeroDocumento = "001-002-0" + TRANSFORM(lnNroNota - 2000000, "@L 999999")
      CASE BETWEEN(lnNroNota, 3000000, 3999999)
         lcNumeroDocumento = "003-001-0" + TRANSFORM(lnNroNota - 3000000, "@L 999999")
      CASE BETWEEN(lnNroNota, 4000000, 4999999)
         lcNumeroDocumento = "001-001-0" + TRANSFORM(lnNroNota - 4000000, "@L 999999")
         DO CASE
         CASE BETWEEN(lnNroNota, 4000501, 4000850)   && Inicio: 22/04/2014 Fin: 30/04/2015
            lnTimbrado = 10535821
         CASE BETWEEN(lnNroNota, 4000851, 4001000)   && Inicio: 22/04/2015 Fin: 30/04/2016
            lnTimbrado = 11038213
         CASE BETWEEN(lnNroNota, 4001001, 4001250)   && Inicio: 09/11/2015 Fin: 30/11/2016
            lnTimbrado = 11315929
         ENDCASE
      CASE BETWEEN(lnNroNota, 6000000, 6999999)
         lcNumeroDocumento = "006-001-0" + TRANSFORM(lnNroNota - 6000000, "@L 999999")
         DO CASE
         CASE BETWEEN(lnNroNota, 6000001, 6000150)   && Inicio: 26/05/2015 Fin: 31/05/2016
            lnTimbrado = 11083573
         ENDCASE
      OTHERWISE
         lcNumeroDocumento = STR(lnNroNota, 15)
   ENDCASE


   SELECT cabenotc
   SET ORDER TO 1
   IF SEEK(STR(lnTipoNota, 1) + STR(lnNroNota, 7)) THEN
      lnCondicionVenta = IIF(aplicontra = 2, 2, 1)

      SELECT cabevent
      SET ORDER TO 1
      IF SEEK(STR(lnTipoDocu, 1) + STR(lnNroDocu, 7)) THEN
         lnCantidadCuota = 0

         SELECT clientes
         SET ORDER TO 1
         IF SEEK(cabevent.cliente) THEN
            SELECT cabeven2
            SET ORDER TO 1
            IF SEEK(STR(cabevent.tipodocu, 1) + STR(cabevent.nrodocu, 7)) THEN
               lcNombreCliente = ALLTRIM(nombre)
               lcRUC = ALLTRIM(documento)
            ELSE
               STORE '' TO lcNombreCliente, lcRUC
            ENDIF

            lcNombreCliente = IIF(EMPTY(lcNombreCliente), ALLTRIM(clientes.nombre), lcNombreCliente)
            lcNombreCliente = STRTRAN(lcNombreCliente, "¥", "Ñ")
            lcRUC = IIF(EMPTY(lcRUC), ALLTRIM(clientes.ruc), lcRUC)
         ELSE
            WAIT "EL CLIENTE: " + ALLTRIM(STR(cabevent.cliente)) + ", NO EXISTE." WINDOW
         ENDIF

         IF cabevent.tipodocu = 8 THEN   && Si es a crédito buscamos la cantidad de cuotas
            SELECT plazos
            SET ORDER TO 1
            IF SEEK(cabevent.id_plazo) THEN
               lnCantidadCuota = num_vtos
            ENDIF
         ENDIF
      ELSE
         WAIT "LA VENTA: " + ALLTRIM(STR(tm_cabevent.tipodocu)) + "/" + ALLTRIM(STR(tm_cabevent.nrodocu)) + ", NO EXISTE." WINDOW
      ENDIF
   ELSE
      WAIT "LA DEVOLUCION DE CLIENTE: " + ALLTRIM(STR(tm_cabenotc.tiponota)) + "/" + ALLTRIM(STR(tm_cabenotc.nronota)) + ", NO EXISTE." WINDOW
   ENDIF

   DO ncc_neta WITH tm_cabenotc.tiponota, tm_cabenotc.nronota

   lnMontoVenta10 = tm_totales.grav_10
   lnIVADebito10  = tm_totales.iva_10
   lnMontoVenta5  = tm_totales.grav_5
   lnIVADebito5   = tm_totales.iva_5
   lnMontoVentaExenta = tm_totales.exenta
   lnTotalIngreso = tm_totales.exenta + tm_totales.grav_5 + tm_totales.grav_10 + tm_totales.iva_5 + tm_totales.iva_10

   INSERT INTO tm_detalle_hechauka VALUES (lnTipoRegistro, lcRUC, 0, lcNombreCliente, lnTipoDocumento, lcNumeroDocumento, ;
                                           ldFechaDocumento, lnMontoVenta10, lnIVADebito10, lnMontoVenta5, lnIVADebito5, ;
                                           lnMontoVentaExenta, lnTotalIngreso, lnCondicionVenta, lnCantidadCuota, lnTimbrado)
ENDSCAN





* Cierra los archivos del sistema de gestión.
IF USED("clientes") THEN
   SELECT clientes
   USE
ENDIF

IF USED("monedas") THEN
   SELECT monedas
   USE
ENDIF

IF USED("maesprod") THEN
   SELECT maesprod
   USE
ENDIF

IF USED("cabevent") THEN
   SELECT cabevent
   USE
ENDIF

IF USED("cabeven2") THEN
   SELECT cabeven2
   USE
ENDIF

IF USED("plazos") THEN
   SELECT plazos
   USE
ENDIF

IF USED("detavent") THEN
   SELECT detavent
   USE
ENDIF

IF USED("tm_detalle") THEN
   SELECT tm_detalle
   USE
ENDIF

IF USED("tm_totales") THEN
   SELECT tm_totales
   USE
ENDIF

IF USED("tm_cabevent") THEN
   SELECT tm_cabevent
   USE
ENDIF

IF USED("cabenotc") THEN
   SELECT cabenotc
   USE
ENDIF

IF USED("detanotc") THEN
   SELECT detanotc
   USE
ENDIF





OPEN DATABASE contabilidad SHARED
USE proveedor IN 0 SHARED NOUPDATE

WAIT 'Espere...' WINDOW NOWAIT

SELECT tm_detalle_hechauka
SCAN ALL
   * Recupera el nombre del proveedor.
   lcRucCliente = ALLTRIM(UPPER(STRTRAN(STRTRAN(STRTRAN(STRTRAN(ruc_cliente, '/', '-'), '*', '-'), '+', '-'), '.', '')))
   lcNombreCliente = ALLTRIM(nombre_cliente)

   IF ValidarRUC(lcRucCliente) THEN
      lcRUC = SUBSTR(lcRucCliente, 1, ATC('-', lcRucCliente) - 1)   && Obtiene el RUC sin el DV.
      lnDV  = VAL(RIGHT(lcRucCliente, 1))

      SELECT proveedor
      SET ORDER TO ruc
      IF SEEK(lcRUC) THEN
         IF tipo = 'F' THEN
            lcNombreCliente = ALLTRIM(apellido) + ', ' + ALLTRIM(nombre)
         ELSE
            lcNombreCliente = ALLTRIM(nombre)
         ENDIF
      ENDIF
   ELSE
      lcRUC = '44444401'
      lnDV = 7
      lcNombreCliente = 'IMPORTES CONSOLIDADOS'
   ENDIF


   SELECT tm_detalle_hechauka
   REPLACE ruc_cliente WITH lcRUC, ;
           dv_cliente  WITH lnDV, ;
           nombre_cliente WITH lcNombreCliente
ENDSCAN





***********************
* genera resumen
***********************
SELECT tm_detalle_hechauka
STORE 0 TO lnMontoVenta10, lnIVADebito10, lnMontoVenta5, lnIVADebito5, lnMontoVentaExenta, lnTotalIngreso
SCAN ALL
   SCATTER MEMVAR MEMO
   IF ruc_cliente <> '44444401' THEN
      INSERT INTO tm_detalle_hechauka2 FROM MEMVAR
   ELSE
      lnMontoVenta10 = lnMontoVenta10 + monto_venta_10 + iva_debito_10
      lnMontoVenta5  = lnMontoVenta5  + monto_venta_5  + iva_debito_5
      lnMontoVentaExenta = lnMontoVentaExenta + monto_venta_exenta
      lnTotalIngreso = lnTotalIngreso + monto_ingreso
   ENDIF
ENDSCAN

lnMonto10 = ROUND(lnMontoVenta10 / 1.1, 0)
lnIVA10   = lnMontoVenta10 - lnMonto10
lnMonto5  = ROUND(lnMontoVenta5 / 1.05, 0)
lnIVA5    = lnMontoVenta5 - lnMonto5
CALCULATE MAX(fecha_documento) TO m.fecha_documento

INSERT INTO tm_detalle_hechauka2 ;
   (tipo_registro, ruc_cliente, dv_cliente, nombre_cliente, tipo_documento, ;
    numero_documento, fecha_documento, monto_venta_10, iva_debito_10, ;
    monto_venta_5, iva_debito_5, monto_venta_exenta, monto_ingreso, ;
    condicion_venta, cantidad_cuota, timbrado) ;
VALUES ;
   (lnTipoRegistro, '44444401', 7, 'IMPORTES CONSOLIDADOS', 0, ;
    '0', m.fecha_documento, lnMonto10, lnIVA10, ;
    lnMonto5, lnIVA5, lnMontoVentaExenta, lnTotalIngreso, ;
    1, 0, 0)





**********************************************************************************************
***        Generacion del archivo Hechauka de ventas         
**********************************************************************************************
WAIT WINDOW 'Generando archivo Hechauka...' NOWAIT 

SET TEXTMERGE ON NOSHOW
SET TEXTMERGE TO letter.txt

* Encabezado
lnTipoRegistro = 1
lcPeriodo = STR(lnAnio,4) + IIF(lnMes < 10, '0' + ALLTRIM(STR(lnMes)), STR(lnMes, 2))
lnTipoReporte = 1   && Original.
lnCodigoObligacion = 921
lnCodigoFormulario = 221
lcRUCAgenteInformacion = '80004234'
lnDVAgenteInformacion = 4
lcNombreAgenteInformacion = 'A & A IMPORTACIONES SRL'
lcRUCRepresentanteLegal = '1846256'
lnDVRepresentanteLegal = 1
lcNombreRepresentanteLegal = 'ALVAREZ MEZA, RICARDO DANIEL'
lnCantidadRegistro = RECCOUNT('tm_detalle_hechauka2')
lnVersion = 2

SELECT tm_detalle_hechauka2
SUM(monto_venta_10 + iva_debito_10 + monto_venta_5 + iva_debito_5 + monto_venta_exenta) TO lnMontoTotal

\\<<lnTipoRegistro>>
\\<<CHR(9)>>
\\<<lcPeriodo)>>
\\<<CHR(9)>>
\\<<lnTipoReporte>>
\\<<CHR(9)>>
\\<<lnCodigoObligacion>>
\\<<CHR(9)>>
\\<<lnCodigoFormulario>>
\\<<CHR(9)>>
\\<<lcRUCAgenteInformacion>>
\\<<CHR(9)>>
\\<<lnDVAgenteInformacion>>
\\<<CHR(9)>>
\\<<lcNombreAgenteInformacion>>
\\<<CHR(9)>>
\\<<lcRUCRepresentanteLegal>>
\\<<CHR(9)>>
\\<<lnDVRepresentanteLegal>>
\\<<CHR(9)>>
\\<<lcNombreRepresentanteLegal>>
\\<<CHR(9)>>
\\<<lnCantidadRegistro>>
\\<<CHR(9)>>
\\<<ROUND(lnMontoTotal, 0)>>
\\<<CHR(9)>>
\\<<lnVersion >>

* Detalle
SCAN ALL
   \<<tipo_registro>>
   \\<<CHR(9)>>
   \\<<ALLTRIM(ruc_cliente)>>
   \\<<CHR(9)>>
   \\<<dv_cliente>>
   \\<<CHR(9)>>
   \\<<ALLTRIM(nombre_cliente)>>
   \\<<CHR(9)>>
   \\<<tipo_documento>>
   \\<<CHR(9)>>
   \\<<ALLTRIM(numero_documento)>>
   \\<<CHR(9)>>
   \\<<fecha_documento>>
   \\<<CHR(9)>>
   \\<<monto_venta_10>>
   \\<<CHR(9)>>
   \\<<iva_debito_10>>
   \\<<CHR(9)>>
   \\<<monto_venta_5>>
   \\<<CHR(9)>>
   \\<<iva_debito_5>>
   \\<<CHR(9)>>
   \\<<monto_venta_exenta>>
   \\<<CHR(9)>>
   \\<<monto_ingreso>>
   \\<<CHR(9)>>
   \\<<condicion_venta>>
   \\<<CHR(9)>>
   \\<<cantidad_cuota>>
   \\<<CHR(9)>>
   \\<<timbrado>>
ENDSCAN

SET TEXTMERGE OFF
SET TEXTMERGE TO

MODIFY FILE letter.txt NOEDIT
WAIT WINDOW 'Listo.' NOWAIT

SELECT tm_detalle_hechauka2
browse