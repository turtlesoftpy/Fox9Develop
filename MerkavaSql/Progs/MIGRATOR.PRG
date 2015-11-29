*!*	DELETE FROM articulo;
*!*	DELETE FROM familia;
*!*	DELETE FROM rubro;
*!*	DELETE FROM subrubro;
*!*	DELETE FROM marca;
*!*	DELETE FROM modelo;
*!*	DELETE FROM maquina;
*!*	DELETE FROM marca_taller;

DO InicioDev.prg

**/
*   Familia
*/
loFamilia = NEWOBJECT('Familia', 'Familia.prg')
USE c:\turtle\aya\integrad.000\familias

SELECT familias
SCAN ALL
   WITH loFamilia
      .SetCodigo(codigo)
      .SetNombre(ALLTRIM(nombre))
      .SetP1(p1)
      .SetP2(p2)
      .SetP3(p3)
      .SetP4(p4)
      .SetP5(p5)
      .SetVigente(vigente)

      .Agregar()
   ENDWITH
ENDSCAN

RELEASE loFamilia
SELECT familias
USE

**/
*   Rubro
*/
loRubro = NEWOBJECT('Rubro', 'Rubro.prg')
USE c:\turtle\aya\integrad.000\rubros1

SELECT rubros1
SCAN ALL
   WITH loRubro
      .SetCodigo(codigo)
      .SetNombre(ALLTRIM(nombre))
      .SetVigente(vigente)

      .Agregar()
   ENDWITH
ENDSCAN

RELEASE loRubro
SELECT rubros1
USE

**/
*   Sub-Rubro
*/
loSubRubro = NEWOBJECT('SubRubro', 'SubRubro.prg')
USE c:\turtle\aya\integrad.000\rubros2

SELECT rubros2
SCAN ALL
   WITH loSubRubro
      .SetCodigo(codigo)
      .SetNombre(ALLTRIM(nombre))
      .SetVigente(vigente)

      .Agregar()
   ENDWITH
ENDSCAN

RELEASE loSubRubro
SELECT rubros2
USE

**/
*   Marca
*/
loMarca = NEWOBJECT('Marca', 'Marca.prg')
USE c:\turtle\aya\integrad.000\marcas1

SELECT marcas1
SCAN ALL
   WITH loMarca
      .SetCodigo(codigo)
      .SetNombre(ALLTRIM(nombre))
      .SetVigente(vigente)

      .Agregar()
   ENDWITH
ENDSCAN

RELEASE loMarca
SELECT marcas1
USE

**/
*   MarcaTaller
*/
loMarcaTaller = NEWOBJECT('MarcaTaller', 'MarcaTaller.prg')
USE c:\turtle\aya\integrad.000\marcas2

SELECT marcas2
SCAN ALL
   WITH loMarcaTaller
      .SetCodigo(codigo)
      .SetNombre(ALLTRIM(nombre))
      .SetVigente(vigente)

      .Agregar()
   ENDWITH
ENDSCAN

RELEASE loMarcaTaller
SELECT marcas2
USE

**/
*   Maquina
*/
loMaquina = NEWOBJECT('Maquina', 'Maquina.prg')
USE c:\turtle\aya\integrad.000\maquinas

SELECT maquinas
SCAN ALL
   WITH loMaquina
      .SetCodigo(codigo)
      .SetNombre(ALLTRIM(nombre))
      .SetVigente(vigente)

      .Agregar()
   ENDWITH
ENDSCAN

RELEASE loMaquina
SELECT maquinas
USE

*!*	**/
*!*	*   Modelo
*!*	*/
*!*	loModelo = NEWOBJECT('Modelo', 'Modelo.prg')

*!*	*****
*!*	USE c:\turtle\aya\integrad.000\modelos IN 0
*!*	USE c:\turtle\aya\integrad.000\maquinas IN 0
*!*	USE c:\turtle\aya\integrad.000\marcas2 IN 0
*!*	USE c:\turtle\aya\integrad.000\ot IN 0

*!*	SELECT ;
*!*	   b.nombre, ;
*!*	   a.maquina, ;
*!*	   a.marca ;
*!*	FROM ;
*!*	   ot a ;
*!*	   LEFT JOIN modelos b ;
*!*	      ON a.modelo = b.codigo ;
*!*	   LEFT JOIN maquinas c ;
*!*	      ON a.maquina = c.codigo ;
*!*	   LEFT JOIN marcas2 d ;
*!*	      ON a.marca = d.codigo ;
*!*	ORDER BY ;
*!*	   1, 2, 3 ;
*!*	INTO CURSOR ;
*!*	   tm_consulta

*!*	SELECT DISTINCT ;
*!*	   nombre, ;
*!*	   maquina, ;
*!*	   marca ;
*!*	FROM ;
*!*	   tm_consulta ;
*!*	INTO CURSOR ;
*!*	   tm_modelo
*!*	*****

*!*	SELECT tm_modelo
*!*	SCAN ALL
*!*	   lnCodigo = RECNO()
*!*	   lcNombre = ALLTRIM(nombre)
*!*	   lnMaquina = maquina
*!*	   lnMarca = marca
*!*	   llVigente = .T.

*!*	   WITH loModelo
*!*	      .SetCodigo(lnCodigo)
*!*	      .SetNombre(lcNombre)
*!*	      .SetMaquina(lnMaquina)
*!*	      .SetMarca(lnMarca)
*!*	      .SetVigente(llVigente)

*!*	      .Agregar()
*!*	   ENDWITH
*!*	ENDSCAN

*!*	RELEASE loModelo
*!*	SELECT modelos
*!*	USE
*!*	SELECT maquinas
*!*	USE
*!*	SELECT marcas2
*!*	USE
*!*	SELECT ot
*!*	USE
*!*	SELECT tm_consulta
*!*	USE
*!*	SELECT tm_modelo
*!*	USE

**/
*   UnidadMedida
*/
loUnidadMedida = NEWOBJECT('UnidadMedida', 'UnidadMedida.prg')
USE c:\turtle\aya\integrad.000\unidad

SELECT unidad
SCAN ALL
   WITH loUnidadMedida
      .SetCodigo(codigo)
      .SetNombre(ALLTRIM(nombre))
      .SetSimbolo(ALLTRIM(STR(codigo)))
      .SetDivisible(.F.)
      .SetVigente(vigente)

      .Agregar()
   ENDWITH
ENDSCAN

RELEASE loUnidadMedida
SELECT unidad
USE

**/
*   Pais
*/
loPais = NEWOBJECT('Pais', 'Pais.prg')
USE c:\turtle\aya\integrad.000\proceden

SELECT proceden
SCAN ALL
   WITH loPais
      .SetCodigo(codigo)
      .SetNombre(ALLTRIM(nombre))
      .SetVigente(vigente)

      .Agregar()
   ENDWITH
ENDSCAN

RELEASE loPais
SELECT proceden
USE

**/
*   Proveedor
*/
loProveedor = NEWOBJECT('Proveedor', 'Proveedor.prg')
USE c:\turtle\aya\integrad.000\proveedo IN 0
USE c:\turtle\aya\integrad.000\ruc IN 0

SELECT proveedo
SCAN ALL
   WITH loProveedor
      .SetCodigo(codigo)
      .SetNombre(ALLTRIM(nombre))
      .SetDirec1(ALLTRIM(direc1))
      .SetDirec2(ALLTRIM(direc2))
      .SetCiudad(ALLTRIM(ciudad))
      .SetTelefono(ALLTRIM(telefono))
      .SetFax(ALLTRIM(fax))
      .SetEMail(ALLTRIM(e_mail))
      IF ValidarRUC(ALLTRIM(ruc)) THEN
         .SetRUC(SUBSTR(ALLTRIM(ruc), 1, ATC('-', ALLTRIM(ruc)) - 1))
         .SetDV(RIGHT(ALLTRIM(ruc), 1))
      ELSE
         IF EMPTY(ruc) THEN
            .SetRUC('99999901')
            .SetDV('0')
         ELSE
            SELECT ruc
            LOCATE FOR ruc2 = proveedo.ruc
            IF FOUND() THEN
               .SetRUC(ALLTRIM(ruc))
               .SetDV(STR(calcular_dv_11_a(ALLTRIM(ruc), 11), 1))
            ELSE
               .SetRUC('99999901')
               .SetDV('0')
            ENDIF
            SELECT proveedo
         ENDIF
      ENDIF
      .SetDiasPlazo(dias_plazo)
      .SetDueno(ALLTRIM(dueno))
      .SetTelDueno(ALLTRIM(teldueno))
      .SetGteGral(ALLTRIM(gtegral))
      .SetTelGG(ALLTRIM(telgg))
      .SetGteVentas(ALLTRIM(gteventas))
      .SetTelGV(ALLTRIM(telgv))
      .SetGteMkg(ALLTRIM(gtemkg))
      .SetTelGM(ALLTRIM(telgm))
      .SetSTecnico(ALLTRIM(stecnico))
      .SetSTDirec1(ALLTRIM(stdirec1))
      .SetSTDirec2(ALLTRIM(stdirec2))
      .SetSTTel(ALLTRIM(sttel))
      .SetSTHablar1(ALLTRIM(sthablar1))
      .SetVendedor1(ALLTRIM(vendedor1))
      .SetLArti1(ALLTRIM(larti1))
      .SetTVend1(ALLTRIM(tvend1))
      .SetVendedor2(ALLTRIM(vendedor2))
      .SetLArti2(ALLTRIM(larti2))
      .SetTVend2(ALLTRIM(tvend2))
      .SetVendedor3(ALLTRIM(vendedor3))
      .SetLArti3(ALLTRIM(larti3))
      .SetTVend3(ALLTRIM(tvend3))
      .SetVendedor4(ALLTRIM(vendedor4))
      .SetLArti4(ALLTRIM(larti4))
      .SetTVend4(ALLTRIM(tvend4))
      .SetVendedor5(ALLTRIM(vendedor5))
      .SetLArti5(ALLTRIM(larti5))
      .SetTVend5(ALLTRIM(tvend5))
      .SetVigente('S')

      IF proveedo.codigo <> 39 THEN
         IF !.Agregar() THEN
            ? 'El proveedor con código: ' + ALLTRIM(STR(proveedo.codigo)) + ' no pudo ser migrado.'
         ENDIF
      ENDIF
   ENDWITH
ENDSCAN

RELEASE loProveedor
SELECT proveedo
USE
SELECT ruc
USE

CLEAR ALL
CLEAR
DO INICIODEV

**/
*   Articulo
*/
loArticulo = NEWOBJECT('Articulo', 'Articulo.prg')
USE c:\turtle\aya\integrad.000\maesprod IN 0
lnCodigo = 1

SELECT maesprod
SCAN ALL
   WITH loArticulo
      .SetCodigo(lnCodigo)
      .SetNombre(ALLTRIM(maesprod.nombre))
      .SetCodArticulo(ALLTRIM(maesprod.codigo))
      .SetCodBarra('')
      .SetCodOriginal(ALLTRIM(maesprod.codorig))
      .SetCodAlternativo(ALLTRIM(maesprod.codigo2))
      .SetAplicacion(ALLTRIM(maesprod.aplicacion))
      .SetFamilia(maesprod.familia)
      .SetRubro(maesprod.rubro)
      .SetSubRubro(maesprod.subrubro)
      .SetMarca(maesprod.marca)
      .SetUnidadMedida(maesprod.unidad)
      .SetProveedor(maesprod.proveedor)
      .SetPais(maesprod.procedenci)
      .SetUbicacion(ALLTRIM(maesprod.ubicacion))
      .SetVigente(maesprod.vigente)
      .SetLPrecio(maesprod.lprecio)
      .SetGravado(maesprod.impuesto)
      .SetPorcIVA(maesprod.pimpuesto)
      .SetPCostoG(maesprod.pcostog)
      .SetPCostoD(maesprod.pcostod)
      .SetPVentaG1(maesprod.pventag1)
      .SetPVentaG2(maesprod.pventag2)
      .SetPVentaG3(maesprod.pventag3)
      .SetPVentaG4(maesprod.pventag4)
      .SetPVentaG5(maesprod.pventag5)
      .SetPVentaD1(maesprod.pventad1)
      .SetPVentaD2(maesprod.pventad2)
      .SetPVentaD3(maesprod.pventad3)
      .SetPVentaD4(maesprod.pventad4)
      .SetPVentaD5(maesprod.pventad5)
      .SetStockMin(maesprod.stock_min)
      .SetStockMax(maesprod.stock_max)
      .SetPolInvSMin(maesprod.polinvsmin)
      .SetPolInvSMax(maesprod.polinvsmax)
      .SetCaracter1(ALLTRIM(maesprod.caracter1))
      .SetCaracter2(ALLTRIM(maesprod.caracter2))
      .SetCaracter3(ALLTRIM(maesprod.caracter3))
      .SetOtros1(ALLTRIM(maesprod.otros1))
      .SetOtros2(ALLTRIM(maesprod.otros2))
      .SetFecUCompra(maesprod.fecucompra)
      .SetFecUVenta({})

      IF !.Agregar() THEN
         ? 'El articulo con código: ' + ALLTRIM(maesprod.codigo) + ' no pudo ser migrado.'
      ENDIF
      lnCodigo = lnCodigo + 1
   ENDWITH
ENDSCAN

RELEASE loArticulo
SELECT maesprod
USE
