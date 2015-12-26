*  COPY articulo FROM 'c:\exportar\articulo.txt';

CLEAR
CLEAR ALL
CLOSE ALL

SET POINT TO
SET SEPARATOR TO

#DEFINE CRLF CHR(13) + CHR(10)

USE c:\turtle\aya\integrad.000\maesprod

SELECT ;
   RECNO() AS codigo, ;
   nombre, ;
   codigo AS cod_articulo, ;
   '' AS cod_barra, ;
   codorig AS cod_original, ;
   codigo2 AS cod_alternativo, ;
   aplicacion, ;
   familia, ;
   rubro, ;
   subrubro, ;
   marca, ;
   unidad, ;
   proveedor, ;
   procedenci AS pais, ;
   ubicacion, ;
   1 AS vigente, ;
   IIF(lprecio, 1, 0) AS lprecio, ;
   IIF(impuesto, 1, 0) AS gravado, ;
   pimpuesto AS porc_iva, ;
   pcostog, ;
   pcostod, ;
   pventag1, ;
   pventag2, ;
   pventag3, ;
   pventag4, ;
   pventag5, ;
   pventad1, ;
   pventad2, ;
   pventad3, ;
   pventad4, ;
   pventad5, ;
   stock_min, ;
   stock_max, ;
   IIF(polinvsmin, 1, 0) AS polinvsmin, ;
   IIF(polinvsmax, 1, 0) AS polinvsmax, ;
   caracter1, ;
   caracter2, ;
   caracter3, ;
   otros1, ;
   otros2, ;
   fecucompra, ;
   {} AS fecuventa, ;
   0.00 AS stock_actual, ;
   0.00 AS stock_ot, ;
   0.00 AS stock_comprometido, ;
   0.00 AS stock_solicitado ;
FROM ;
   maesprod ;
INTO CURSOR ;
   tm_maesprod

SELECT nombre, COUNT(nombre) FROM maesprod GROUP BY nombre HAVING COUNT(nombre) > 1 INTO CURSOR tm_nombre
SELECT codigo2, COUNT(codigo2) FROM maesprod GROUP BY codigo2 HAVING COUNT(codigo2) > 1 INTO CURSOR tm_codigo2
SELECT codorig, COUNT(codorig) FROM maesprod GROUP BY codorig HAVING COUNT(codorig) > 1 INTO CURSOR tm_codorig

**********************************************************************************************
***        Generacion del archivo 'articulo.txt'
**********************************************************************************************
WAIT WINDOW "Generando archivo 'articulo.txt'..." NOWAIT 

SET TEXTMERGE ON NOSHOW
SET TEXTMERGE TO c:\exportar\articulo.txt

SELECT tm_maesprod
SCAN ALL
   lcNombre         = ALLTRIM(STRTRAN(STRTRAN(STRTRAN(nombre, CHR(0), ''), CHR(9), ''), CHR(13), ''))
   lcCodOriginal    = ALLTRIM(STRTRAN(STRTRAN(STRTRAN(cod_original, CHR(0), ''), CHR(9), ''), CHR(13), ''))
   lcCodAlternativo = ALLTRIM(STRTRAN(STRTRAN(STRTRAN(cod_alternativo, CHR(0), ''), CHR(9), ''), CHR(13), ''))
   lcAplicacion     = ALLTRIM(STRTRAN(STRTRAN(STRTRAN(aplicacion, CHR(0), ''), CHR(9), ''), CHR(13), ''))
   lcCaracter1      = ALLTRIM(STRTRAN(STRTRAN(STRTRAN(caracter1, CHR(0), ''), CHR(9), ''), CHR(13), ''))
   lcCaracter2      = ALLTRIM(STRTRAN(STRTRAN(STRTRAN(caracter2, CHR(0), ''), CHR(9), ''), CHR(13), ''))
   lcCaracter3      = ALLTRIM(STRTRAN(STRTRAN(STRTRAN(caracter3, CHR(0), ''), CHR(9), ''), CHR(13), ''))
   ldFecUCompra     = IIF(YEAR(fecucompra) <= YEAR(DATE()), fecucompra, {})
   lnPorcIVA        = IIF(INLIST(porc_iva, 0, 5, 10), porc_iva, 10)
   lnMarca          = IIF(marca > 0, marca, 1)

   SELECT tm_nombre
   LOCATE FOR nombre = lcNombre
   IF FOUND() THEN
      lcNombre = lcNombre + ' {' + ALLTRIM(STR(tm_maesprod.codigo)) + '}'
   ENDIF

   SELECT tm_codorig
   IF !EMPTY(lcCodOriginal) THEN
      LOCATE FOR codorig = lcCodOriginal
      IF FOUND() THEN
         lcCodOriginal = lcCodOriginal + ' {' + ALLTRIM(STR(tm_maesprod.codigo)) + '}'
      ENDIF
   ENDIF

   SELECT tm_codigo2
   IF !EMPTY(lcCodAlternativo) THEN
      LOCATE FOR codigo2 = lcCodAlternativo
      IF FOUND() THEN
         lcCodAlternativo = lcCodAlternativo + ' {' + ALLTRIM(STR(tm_maesprod.codigo)) + '}'
      ENDIF
   ENDIF

   SELECT tm_maesprod

   \\<<codigo>>
   \\<<CHR(9)>>
   \\<<ALLTRIM(lcNombre)>>
   \\<<CHR(9)>>
   \\<<ALLTRIM(cod_articulo)>>
   \\<<CHR(9)>>
   \\<<'\N'>>
   \\<<CHR(9)>>
   \\<<IIF(!EMPTY(lcCodOriginal), ALLTRIM(lcCodOriginal), '\N')>>
   \\<<CHR(9)>>
   \\<<IIF(!EMPTY(lcCodAlternativo), ALLTRIM(lcCodAlternativo), '\N')>>
   \\<<CHR(9)>>
   \\<<IIF(!EMPTY(lcAplicacion), ALLTRIM(lcAplicacion), '\N')>>
   \\<<CHR(9)>>
   \\<<familia>>
   \\<<CHR(9)>>
   \\<<rubro>>
   \\<<CHR(9)>>
   \\<<subrubro>>
   \\<<CHR(9)>>
   \\<<lnMarca>>
   \\<<CHR(9)>>
   \\<<unidad>>
   \\<<CHR(9)>>
   \\<<proveedor>>
   \\<<CHR(9)>>
   \\<<pais>>
   \\<<CHR(9)>>
   \\<<IIF(!EMPTY(ubicacion), ALLTRIM(ubicacion), '\N')>>
   \\<<CHR(9)>>
   \\<<vigente>>
   \\<<CHR(9)>>
   \\<<lprecio>>
   \\<<CHR(9)>>
   \\<<gravado>>
   \\<<CHR(9)>>
   \\<<IIF(lnPorcIVA <> 0, lnPorcIVA, '\N')>>
   \\<<CHR(9)>>
   \\<<IIF(pcostog <> 0, pcostog, '\N')>>
   \\<<CHR(9)>>
   \\<<IIF(pcostod <> 0, pcostod, '\N')>>
   \\<<CHR(9)>>
   \\<<IIF(pventag1 <> 0, pventag1, '\N')>>
   \\<<CHR(9)>>
   \\<<IIF(pventag2 <> 0, pventag2, '\N')>>
   \\<<CHR(9)>>
   \\<<IIF(pventag3 <> 0, pventag3, '\N')>>
   \\<<CHR(9)>>
   \\<<IIF(pventag4 <> 0, pventag4, '\N')>>
   \\<<CHR(9)>>
   \\<<IIF(pventag5 <> 0, pventag5, '\N')>>
   \\<<CHR(9)>>
   \\<<IIF(pventad1 <> 0, pventad1, '\N')>>
   \\<<CHR(9)>>
   \\<<IIF(pventad2 <> 0, pventad2, '\N')>>
   \\<<CHR(9)>>
   \\<<IIF(pventad3 <> 0, pventad3, '\N')>>
   \\<<CHR(9)>>
   \\<<IIF(pventad4 <> 0, pventad4, '\N')>>
   \\<<CHR(9)>>
   \\<<IIF(pventad5 <> 0, pventad5, '\N')>>
   \\<<CHR(9)>>
   \\<<IIF(stock_min <> 0, stock_min, '\N')>>
   \\<<CHR(9)>>
   \\<<IIF(stock_max <> 0, stock_max, '\N')>>
   \\<<CHR(9)>>
   \\<<polinvsmin>>
   \\<<CHR(9)>>
   \\<<polinvsmax>>
   \\<<CHR(9)>>
   \\<<IIF(!EMPTY(lcCaracter1), ALLTRIM(lcCaracter1), '\N')>>
   \\<<CHR(9)>>
   \\<<IIF(!EMPTY(lcCaracter2), ALLTRIM(lcCaracter2), '\N')>>
   \\<<CHR(9)>>
   \\<<IIF(!EMPTY(lcCaracter3), ALLTRIM(lcCaracter3), '\N')>>
   \\<<CHR(9)>>
   \\<<IIF(!EMPTY(otros1), ALLTRIM(otros1), '\N')>>
   \\<<CHR(9)>>
   \\<<IIF(!EMPTY(otros2), ALLTRIM(otros2), '\N')>>
   \\<<CHR(9)>>
   \\<<IIF(!EMPTY(ldFecUCompra), STR(YEAR(ldFecUCompra), 4) + '-' + ALLTRIM(STR(MONTH(ldFecUCompra))) + '-' + ALLTRIM(STR(DAY(ldFecUCompra))), '\N')>>
   \\<<CHR(9)>>
   \\<<IIF(!EMPTY(fecuventa), STR(YEAR(fecuventa), 4) + '-' + ALLTRIM(STR(MONTH(fecuventa))) + '-' + ALLTRIM(STR(DAY(fecuventa))), '\N')>>
   \\<<CHR(9)>>
   \\<<stock_actual>>
   \\<<CHR(9)>>
   \\<<stock_ot>>
   \\<<CHR(9)>>
   \\<<stock_comprometido>>
   \\<<CHR(9)>>
   \\<<stock_solicitado>>
   \\<<CRLF>>
ENDSCAN

SET TEXTMERGE OFF
SET TEXTMERGE TO

WAIT WINDOW 'Listo.' NOWAIT
MODIFY FILE articulo.txt NOEDIT