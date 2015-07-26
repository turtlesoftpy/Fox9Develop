*/ -------------------------------------------------------------------------- */
CREATE TABLE barrios ( ;
   codigo NUMERIC(5), ;
   nombre CHARACTER(30), ;
   departamen NUMERIC(3), ;
   ciudad NUMERIC(5), ;
   vigente LOGICAL ;
);

INDEX ON codigo TAG indice1
INDEX ON nombre TAG indice2

*/ -------------------------------------------------------------------------- */
CREATE TABLE ciudades ( ;
   codigo NUMERIC(5), ;
   nombre CHARACTER(30), ;
   departamen NUMERIC(3), ;
   vigente LOGICAL ;
);

INDEX ON codigo TAG indice1
INDEX ON nombre TAG indice2

*/ -------------------------------------------------------------------------- */
CREATE TABLE cobrador ( ;
   codigo NUMERIC(3), ;
   nombre CHARACTER(30), ;
   vigente LOGICAL ;
);

INDEX ON codigo TAG indice1
INDEX ON nombre TAG indice2

*/ -------------------------------------------------------------------------- */
CREATE TABLE depar ( ;
   codigo NUMERIC(3), ;
   nombre CHARACTER(30), ;
   vigente LOGICAL ;
);

INDEX ON codigo TAG indice1
INDEX ON nombre TAG indice2

*/ -------------------------------------------------------------------------- */
CREATE TABLE familias ( ;
   codigo NUMERIC(4), ;
   nombre CHARACTER(30), ;
   p1 NUMERIC(6,2), ;
   p2 NUMERIC(6,2), ;
   p3 NUMERIC(6,2), ;
   p4 NUMERIC(6,2), ;
   p5 NUMERIC(6,2), ;
   vigente LOGICAL ;
);

INDEX ON codigo TAG indice1
INDEX ON nombre TAG indice2

*/ -------------------------------------------------------------------------- */
CREATE TABLE maquinas ( ;
   codigo NUMERIC(3), ;
   nombre CHARACTER(30), ;
   vigente LOGICAL ;
);

INDEX ON codigo TAG indice1
INDEX ON nombre TAG indice2

*/ -------------------------------------------------------------------------- */
CREATE TABLE marcas1 ( ;
   codigo NUMERIC(4), ;
   nombre CHARACTER(30), ;
   vigente LOGICAL ;
);

INDEX ON codigo TAG indice1
INDEX ON nombre TAG indice2

*/ -------------------------------------------------------------------------- */
CREATE TABLE marcas2 ( ;
   codigo NUMERIC(4), ;
   nombre CHARACTER(30), ;
   vigente LOGICAL ;
);

INDEX ON codigo TAG indice1
INDEX ON nombre TAG indice2

*/ -------------------------------------------------------------------------- */
CREATE TABLE mecanico ( ;
   codigo NUMERIC(3), ;
   nombre CHARACTER(30), ;
   vigente LOGICAL ;
);

INDEX ON codigo TAG indice1
INDEX ON nombre TAG indice2

*/ -------------------------------------------------------------------------- */
CREATE TABLE modelos ( ;
   codigo NUMERIC(4), ;
   nombre CHARACTER(30), ;
   maquina NUMERIC(3), ;
   marca NUMERIC(4), ;
   vigente LOGICAL ;
);

INDEX ON codigo TAG indice1
INDEX ON nombre TAG indice2

*/ -------------------------------------------------------------------------- */
CREATE TABLE unidad ( ;
   codigo NUMERIC(4), ;
   nombre CHARACTER(30), ;
   simbolo CHARACTER(5), ;
   divisible LOGICAL, ;
   vigente LOGICAL ;
);

INDEX ON codigo TAG indice1
INDEX ON nombre TAG indice2