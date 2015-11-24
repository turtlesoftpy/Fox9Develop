/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *
 *                          BASE DE DATOS (DATABASE)                          *
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
DROP DATABASE merkava_80004234_001;

CREATE DATABASE IF NOT EXISTS merkava_80004234_001
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci';

USE merkava_80004234_001;

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *
 *                                TABLA (TABLE)                               *
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

/* -------------------------------------------------------------------------- */
CREATE TABLE articulo (
   codigo MEDIUMINT UNSIGNED NOT NULL,
   nombre VARCHAR(100) NOT NULL,
   cod_articulo VARCHAR(20) NOT NULL,
   cod_barra VARCHAR(20),
   cod_original VARCHAR(20),
   cod_alternativo VARCHAR(20),
   aplicacion VARCHAR(480),
   familia SMALLINT(5) UNSIGNED NOT NULL,
   rubro SMALLINT(5) UNSIGNED NOT NULL,
   subrubro SMALLINT(5) UNSIGNED NOT NULL,
   marca SMALLINT(5) UNSIGNED NOT NULL,
   unidad SMALLINT(5) UNSIGNED NOT NULL,
   proveedor SMALLINT(5) UNSIGNED NOT NULL,
   pais SMALLINT(5) UNSIGNED NOT NULL,
   ubicacion VARCHAR(20),
   vigente TINYINT(1) UNSIGNED NOT NULL,
   lprecio TINYINT(1) UNSIGNED NOT NULL,
   gravado TINYINT(1) UNSIGNED NOT NULL,
   porc_iva NUMERIC(19,6),
   pcostog NUMERIC(19,6),
   pcostod NUMERIC(19,6),
   pventag1 NUMERIC(19,6),
   pventag2 NUMERIC(19,6),
   pventag3 NUMERIC(19,6),
   pventag4 NUMERIC(19,6),
   pventag5 NUMERIC(19,6),
   pventad1 NUMERIC(19,6),
   pventad2 NUMERIC(19,6),
   pventad3 NUMERIC(19,6),
   pventad4 NUMERIC(19,6),
   pventad5 NUMERIC(19,6),
   stock_min NUMERIC(19,6),
   stock_max NUMERIC(19,6),
   polinvsmin TINYINT(1) UNSIGNED NOT NULL,
   polinvsmax TINYINT(1) UNSIGNED NOT NULL,
   caracter1 VARCHAR(60),
   caracter2 VARCHAR(60),
   caracter3 VARCHAR(60),
   otros1 VARCHAR(60),
   otros2 VARCHAR(60),
   fecucompra DATE,
   fecuventa DATE,
   stock_actual NUMERIC(19,6) NOT NULL,
   stock_ot NUMERIC(19,6) NOT NULL,
   stock_comprometido NUMERIC(19,6) NOT NULL,
   stock_solicitado NUMERIC(19,6) NOT NULL
);

ALTER TABLE articulo
   ADD CONSTRAINT pk_ciudad_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT fk_articulo_familia
      FOREIGN KEY (familia) REFERENCES familia (cod_articulo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT fk_articulo_rubro
      FOREIGN KEY (rubro) REFERENCES rubro (cod_articulo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT fk_articulo_subrubro
      FOREIGN KEY (subrubro) REFERENCES subrubro (cod_articulo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT fk_articulo_marca
      FOREIGN KEY (marca) REFERENCES marca (cod_articulo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT fk_articulo_unidad
      FOREIGN KEY (unidad) REFERENCES unidad (cod_articulo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT fk_articulo_proveedor
      FOREIGN KEY (proveedor) REFERENCES proveedor (cod_articulo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT fk_articulo_pais
      FOREIGN KEY (pais) REFERENCES pais (cod_articulo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT unq_articulo_nombre
      UNIQUE (nombre),
   ADD CONSTRAINT unq_articulo_cod_articulo
      UNIQUE (cod_articulo),
   ADD CONSTRAINT unq_articulo_cod_barra
      UNIQUE (cod_barra),
   ADD CONSTRAINT unq_articulo_cod_original
      UNIQUE (cod_original),
   ADD CONSTRAINT unq_articulo_cod_alternativo
      UNIQUE (cod_alternativo),
   ADD CONSTRAINT chk_articulo_nombre
      CHECK (nombre <> ''),
   ADD CONSTRAINT chk_articulo_cod_articulo
      CHECK (cod_articulo <> ''),
   ADD CONSTRAINT chk_articulo_cod_barra
      CHECK (cod_barra IS NULL OR cod_barra <> ''),
   ADD CONSTRAINT chk_articulo_cod_original
      CHECK (cod_original IS NULL OR cod_original <> ''),
   ADD CONSTRAINT chk_articulo_cod_alternativo
      CHECK (cod_alternativo IS NULL OR cod_alternativo <> ''),
   ADD CONSTRAINT chk_articulo_aplicacion
      CHECK (aplicacion IS NULL OR aplicacion <> ''),
   ADD CONSTRAINT chk_articulo_ubicacion
      CHECK (ubicacion IS NULL OR ubicacion <> ''),
   ADD CONSTRAINT chk_articulo_porc_iva
      CHECK (porc_iva IS NULL OR porc_iva > 0),
   ADD CONSTRAINT chk_articulo_pcostog
      CHECK (pcostog IS NULL OR pcostog > 0),
   ADD CONSTRAINT chk_articulo_pcostod
      CHECK (pcostod IS NULL OR pcostod > 0),
   ADD CONSTRAINT chk_articulo_pventag1
      CHECK (pventag1 IS NULL OR pventag1 > 0),
   ADD CONSTRAINT chk_articulo_pventag2
      CHECK (pventag2 IS NULL OR pventag2 > 0),
   ADD CONSTRAINT chk_articulo_pventag3
      CHECK (pventag3 IS NULL OR pventag3 > 0),
   ADD CONSTRAINT chk_articulo_pventag4
      CHECK (pventag4 IS NULL OR pventag4 > 0),
   ADD CONSTRAINT chk_articulo_pventag5
      CHECK (pventag5 IS NULL OR pventag5 > 0),
   ADD CONSTRAINT chk_articulo_pventad1
      CHECK (pventad1 IS NULL OR pventad1 > 0),
   ADD CONSTRAINT chk_articulo_pventad2
      CHECK (pventad2 IS NULL OR pventad2 > 0),
   ADD CONSTRAINT chk_articulo_pventad3
      CHECK (pventad3 IS NULL OR pventad3 > 0),
   ADD CONSTRAINT chk_articulo_pventad4
      CHECK (pventad4 IS NULL OR pventad4 > 0),
   ADD CONSTRAINT chk_articulo_pventad5
      CHECK (pventad5 IS NULL OR pventad5 > 0),
   ADD CONSTRAINT chk_articulo_stock_min
      CHECK (stock_min IS NULL OR stock_min > 0),
   ADD CONSTRAINT chk_articulo_stock_max
      CHECK (stock_max IS NULL OR stock_max > 0),
   ADD CONSTRAINT chk_articulo_caracter1
      CHECK (caracter1 IS NULL OR caracter1 <> ''),
   ADD CONSTRAINT chk_articulo_caracter2
      CHECK (caracter2 IS NULL OR caracter2 <> ''),
   ADD CONSTRAINT chk_articulo_caracter3
      CHECK (caracter3 IS NULL OR caracter3 <> ''),
   ADD CONSTRAINT chk_articulo_otros1
      CHECK (otros1 IS NULL OR otros1 <> ''),
   ADD CONSTRAINT chk_articulo_otros2
      CHECK (otros2 IS NULL OR otros2 <> ''),
   ADD CONSTRAINT chk_articulo_stock_actual
      CHECK (stock_actual >= 0),
   ADD CONSTRAINT chk_articulo_stock_ot
      CHECK (stock_ot >= 0),
   ADD CONSTRAINT chk_articulo_stock_comprometido
      CHECK (stock_comprometido >= 0),
   ADD CONSTRAINT chk_articulo_stock_solicitado
      CHECK (stock_solicitado >= 0),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

/* -------------------------------------------------------------------------- */
CREATE TABLE depar (
   codigo SMALLINT(5) UNSIGNED NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   vigente TINYINT(1) UNSIGNED NOT NULL
);

ALTER TABLE depar
   ADD CONSTRAINT pk_depar_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT unq_depar_nombre
      UNIQUE (nombre),
   ADD CONSTRAINT chk_depar_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_depar_nombre
      CHECK (nombre <> ''),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

/* -------------------------------------------------------------------------- */
CREATE TABLE ciudad (
   codigo SMALLINT(5) UNSIGNED NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   departamen SMALLINT(5) UNSIGNED NOT NULL,
   vigente TINYINT(1) UNSIGNED NOT NULL
);

ALTER TABLE ciudad
   ADD CONSTRAINT pk_ciudad_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT fk_ciudad_departamen
      FOREIGN KEY (departamen) REFERENCES depar (codigo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT unq_ciudad_departamen_nombre
      UNIQUE (departamen, nombre),
   ADD CONSTRAINT unq_ciudad_departamen_codigo
      UNIQUE (departamen, codigo),
   ADD CONSTRAINT chk_ciudad_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_ciudad_nombre
      CHECK (nombre <> ''),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

/* -------------------------------------------------------------------------- */
CREATE TABLE barrio (
   codigo SMALLINT(5) UNSIGNED NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   departamen SMALLINT(5) UNSIGNED NOT NULL,
   ciudad SMALLINT(5) UNSIGNED NOT NULL,
   vigente TINYINT(1) UNSIGNED NOT NULL
);

ALTER TABLE barrio
   ADD CONSTRAINT pk_barrio_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT fk_barrio_departamen
      FOREIGN KEY (departamen) REFERENCES depar (codigo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT fk_barrio_ciudad
      FOREIGN KEY (ciudad) REFERENCES ciudad (codigo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT fk_barrio_departamen_ciudad
      FOREIGN KEY (departamen, ciudad) REFERENCES ciudad (departamen, codigo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT unq_barrio_departamen_ciudad_nombre
      UNIQUE (departamen, ciudad, nombre),
   ADD CONSTRAINT unq_barrio_departamen_ciudad_codigo
      UNIQUE (departamen, ciudad, codigo),
   ADD CONSTRAINT chk_barrio_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_barrio_nombre
      CHECK (nombre <> ''),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

/* -------------------------------------------------------------------------- */
CREATE TABLE cobrador (
   codigo SMALLINT(5) UNSIGNED NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   documento VARCHAR(15),
   vigente TINYINT(1) UNSIGNED NOT NULL
);

ALTER TABLE cobrador
   ADD CONSTRAINT pk_cobrador_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT unq_cobrador_nombre
      UNIQUE (nombre),
   ADD CONSTRAINT unq_cobrador_documento
      UNIQUE (documento),
   ADD CONSTRAINT chk_cobrador_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_cobrador_nombre
      CHECK (nombre <> ''),
   ADD CONSTRAINT chk_cobrador_documento
      CHECK (documento IS NULL OR documento <> ''),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

/* -------------------------------------------------------------------------- */
CREATE TABLE familia (
   codigo SMALLINT(5) UNSIGNED NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   p1 NUMERIC(19,6),
   p2 NUMERIC(19,6),
   p3 NUMERIC(19,6),
   p4 NUMERIC(19,6),
   p5 NUMERIC(19,6),
   vigente TINYINT(1) UNSIGNED NOT NULL
);

ALTER TABLE familia
   ADD CONSTRAINT pk_familia_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT unq_familia_nombre
      UNIQUE (nombre),
   ADD CONSTRAINT chk_familia_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_familia_nombre
      CHECK (nombre <> ''),
   ADD CONSTRAINT chk_familia_p1
      CHECK (p1 IS NULL OR p1 > 0),
   ADD CONSTRAINT chk_familia_p2
      CHECK (p2 IS NULL OR p2 > 0),
   ADD CONSTRAINT chk_familia_p3
      CHECK (p3 IS NULL OR p3 > 0),
   ADD CONSTRAINT chk_familia_p4
      CHECK (p4 IS NULL OR p4 > 0),
   ADD CONSTRAINT chk_familia_p5
      CHECK (p5 IS NULL OR p5 > 0),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

/* -------------------------------------------------------------------------- */
CREATE TABLE maquina (
   codigo SMALLINT(5) UNSIGNED NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   vigente TINYINT(1) UNSIGNED NOT NULL
);

ALTER TABLE maquina
   ADD CONSTRAINT pk_maquina_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT unq_maquina_nombre
      UNIQUE (nombre),
   ADD CONSTRAINT chk_maquina_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_maquina_nombre
      CHECK (nombre <> ''),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

/* -------------------------------------------------------------------------- */
CREATE TABLE marca (
   codigo SMALLINT(5) UNSIGNED NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   vigente TINYINT(1) UNSIGNED NOT NULL
);

ALTER TABLE marca
   ADD CONSTRAINT pk_marca_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT unq_marca_nombre
      UNIQUE (nombre),
   ADD CONSTRAINT chk_marca_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_marca_nombre
      CHECK (nombre <> ''),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

/* -------------------------------------------------------------------------- */
CREATE TABLE marca_taller (
   codigo SMALLINT(5) UNSIGNED NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   vigente TINYINT(1) UNSIGNED NOT NULL
);

ALTER TABLE marca_taller
   ADD CONSTRAINT pk_marca_taller_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT unq_marca_taller_nombre
      UNIQUE (nombre),
   ADD CONSTRAINT chk_marca_taller_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_marca_taller_nombre
      CHECK (nombre <> ''),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

/* -------------------------------------------------------------------------- */
CREATE TABLE mecanico (
   codigo SMALLINT(5) UNSIGNED NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   documento VARCHAR(15),
   vigente TINYINT(1) UNSIGNED NOT NULL
);

ALTER TABLE mecanico
   ADD CONSTRAINT pk_mecanico_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT unq_mecanico_nombre
      UNIQUE (nombre),
   ADD CONSTRAINT unq_mecanico_documento
      UNIQUE (documento),
   ADD CONSTRAINT chk_mecanico_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_mecanico_nombre
      CHECK (nombre <> ''),
   ADD CONSTRAINT chk_mecanico_documento
      CHECK (documento IS NULL OR documento <> ''),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

/* -------------------------------------------------------------------------- */
CREATE TABLE modelo (
   codigo SMALLINT(5) UNSIGNED NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   maquina SMALLINT(5) UNSIGNED NOT NULL,
   marca SMALLINT(5) UNSIGNED NOT NULL,
   vigente TINYINT(1) UNSIGNED NOT NULL
);

ALTER TABLE modelo
   ADD CONSTRAINT pk_modelo_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT fk_modelo_maquina
      FOREIGN KEY (maquina) REFERENCES maquina (codigo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT fk_modelo_marca
      FOREIGN KEY (marca) REFERENCES marca_taller (codigo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT unq_modelo_maquina_marca_nombre
      UNIQUE (maquina, marca, nombre),
   ADD CONSTRAINT chk_modelo_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_modelo_nombre
      CHECK (nombre <> ''),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

/* -------------------------------------------------------------------------- */
CREATE TABLE motivocl (
   codigo SMALLINT(5) UNSIGNED NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   vigente TINYINT(1) UNSIGNED NOT NULL
);

ALTER TABLE motivocl
   ADD CONSTRAINT pk_motivocl_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT unq_motivocl_nombre
      UNIQUE (nombre),
   ADD CONSTRAINT chk_motivocl_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_motivocl_nombre
      CHECK (nombre <> ''),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

/* -------------------------------------------------------------------------- */
CREATE TABLE pais (
   codigo SMALLINT(5) UNSIGNED NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   vigente TINYINT(1) UNSIGNED NOT NULL
);

ALTER TABLE pais
   ADD CONSTRAINT pk_pais_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT unq_pais_nombre
      UNIQUE (nombre),
   ADD CONSTRAINT chk_pais_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_pais_nombre
      CHECK (nombre <> ''),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

/* -------------------------------------------------------------------------- */
CREATE TABLE plazo (
   codigo SMALLINT(5) UNSIGNED NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   num_vtos SMALLINT(5) UNSIGNED NOT NULL,
   separacion CHAR(1) NOT NULL,
   primero SMALLINT(5) UNSIGNED NOT NULL,
   resto SMALLINT(5) UNSIGNED NOT NULL,
   vigente TINYINT(1) UNSIGNED NOT NULL
);

ALTER TABLE plazo
   ADD CONSTRAINT pk_plazo_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT unq_plazo_nombre
      UNIQUE (nombre),
   ADD CONSTRAINT chk_plazo_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_plazo_nombre
      CHECK (nombre <> ''),
   ADD CONSTRAINT chk_plazo_num_vtos
      CHECK (num_vtos >= 0),
   ADD CONSTRAINT chk_plazo_separacion
      CHECK (separacion IN ('D', 'M')),
   ADD CONSTRAINT chk_plazo_primero
      CHECK (primero >= 0),
   ADD CONSTRAINT chk_plazo_resto
      CHECK (resto >= 0),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

/* -------------------------------------------------------------------------- */
CREATE TABLE proveedor (
   codigo SMALLINT(5) UNSIGNED NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   direc1 VARCHAR(60),
   direc2 VARCHAR(60),
   ciudad VARCHAR(25),
   telefono VARCHAR(40),
   fax VARCHAR(25),
   e_mail VARCHAR(60),
   ruc VARCHAR(15),
   dv CHAR(1),
   dias_plazo SMALLINT(3) UNSIGNED,
   dueno VARCHAR(40),
   teldueno VARCHAR(25),
   gtegral VARCHAR(40),
   telgg VARCHAR(25),
   gteventas VARCHAR(40),
   telgv VARCHAR(25),
   gtemkg VARCHAR(40),
   telgm VARCHAR(25),
   stecnico VARCHAR(40),
   stdirec1 VARCHAR(60),
   stdirec2 VARCHAR(60),
   sttel VARCHAR(25),
   sthablar1 VARCHAR(60),
   vendedor1 VARCHAR(40),
   larti1 VARCHAR(25),
   tvend1 VARCHAR(25),
   vendedor2 VARCHAR(40),
   larti2 VARCHAR(25),
   tvend2 VARCHAR(25),
   vendedor3 VARCHAR(40),
   larti3 VARCHAR(25),
   tvend3 VARCHAR(25),
   vendedor4 VARCHAR(40),
   larti4 VARCHAR(25),
   tvend4 VARCHAR(25),
   vendedor5 VARCHAR(40),
   larti5 VARCHAR(25),
   tvend5 VARCHAR(25),
   saldo_actu NUMERIC(19,6) NOT NULL,
   saldo_usd NUMERIC(19,6) NOT NULL,
   vigente CHAR(1) NOT NULL
);

ALTER TABLE proveedor
   ADD CONSTRAINT pk_proveedor_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT unq_proveedor_nombre
      UNIQUE (nombre),
   ADD CONSTRAINT chk_proveedor_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_proveedor_nombre
      CHECK (nombre <> ''),
   ADD CONSTRAINT chk_proveedor_saldo_actu
      CHECK (saldo_actu >= 0),
   ADD CONSTRAINT chk_proveedor_saldo_usd
      CHECK (saldo_usd >= 0),
   ADD CONSTRAINT chk_proveedor_vigente
      CHECK (vigente IN ('S', 'N')),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

/* -------------------------------------------------------------------------- */
CREATE TABLE rubro (
   codigo SMALLINT(5) UNSIGNED NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   vigente TINYINT(1) UNSIGNED NOT NULL
);

ALTER TABLE rubro
   ADD CONSTRAINT pk_rubro_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT unq_rubro_nombre
      UNIQUE (nombre),
   ADD CONSTRAINT chk_rubro_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_rubro_nombre
      CHECK (nombre <> ''),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

/* -------------------------------------------------------------------------- */
CREATE TABLE ruta (
   codigo SMALLINT(5) UNSIGNED NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   vigente TINYINT(1) UNSIGNED NOT NULL
);

ALTER TABLE ruta
   ADD CONSTRAINT pk_ruta_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT unq_ruta_nombre
      UNIQUE (nombre),
   ADD CONSTRAINT chk_ruta_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_ruta_nombre
      CHECK (nombre <> ''),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

/* -------------------------------------------------------------------------- */
CREATE TABLE subrubro (
   codigo SMALLINT(5) UNSIGNED NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   vigente TINYINT(1) UNSIGNED NOT NULL
);

ALTER TABLE subrubro
   ADD CONSTRAINT pk_subrubro_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT unq_subrubro_nombre
      UNIQUE (nombre),
   ADD CONSTRAINT chk_subrubro_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_subrubro_nombre
      CHECK (nombre <> ''),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

/* -------------------------------------------------------------------------- */
CREATE TABLE sucursal (
   codigo SMALLINT(5) UNSIGNED NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   vigente TINYINT(1) UNSIGNED NOT NULL
);

ALTER TABLE sucursal
   ADD CONSTRAINT pk_sucursal_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT unq_sucursal_nombre
      UNIQUE (nombre),
   ADD CONSTRAINT chk_sucursal_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_sucursal_nombre
      CHECK (nombre <> ''),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

INSERT INTO sucursal (codigo, nombre, vigente)
   VALUES (1, 'CASA CENTRAL [001]', 1);
INSERT INTO sucursal (codigo, nombre, vigente)
   VALUES (2, 'SUCURSAL [002]', 0);
INSERT INTO sucursal (codigo, nombre, vigente)
   VALUES (3, 'SUCURSAL [003]', 0);
INSERT INTO sucursal (codigo, nombre, vigente)
   VALUES (4, 'DEPOSITO [004]', 1);
INSERT INTO sucursal (codigo, nombre, vigente)
   VALUES (5, 'SAN BERNARDINO [005]', 0);
INSERT INTO sucursal (codigo, nombre, vigente)
   VALUES (6, 'AVDA. EUSEBIO AYALA [006]', 1);

/* -------------------------------------------------------------------------- */
CREATE TABLE deposito (
   codigo SMALLINT(5) UNSIGNED NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   sucursal SMALLINT(5) UNSIGNED NOT NULL,
   venta TINYINT(1) UNSIGNED NOT NULL,
   vigente TINYINT(1) UNSIGNED NOT NULL
);

ALTER TABLE deposito
   ADD CONSTRAINT pk_deposito_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT fk_deposito_sucursal
      FOREIGN KEY (sucursal) REFERENCES sucursal (codigo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT unq_deposito_nombre
      UNIQUE (nombre),
   ADD CONSTRAINT chk_deposito_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_deposito_nombre
      CHECK (nombre <> ''),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

/* -------------------------------------------------------------------------- */
CREATE TABLE ejercicio (
   codigo SMALLINT(5) UNSIGNED NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   periodo SMALLINT(4) UNSIGNED NOT NULL,
   fecha_inicio DATE NOT NULL,
   fecha_fin DATE NOT NULL,
   vigente TINYINT(1) UNSIGNED NOT NULL
);

ALTER TABLE ejercicio
   ADD CONSTRAINT pk_ejercicio_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT unq_ejercicio_nombre
      UNIQUE (nombre),
   ADD CONSTRAINT chk_ejercicio_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_ejercicio_nombre
      CHECK (nombre <> ''),
   ADD CONSTRAINT chk_ejercicio_periodo
      CHECK (periodo >= 2000 AND periodo <= 2038),
   ADD CONSTRAINT chk_ejercicio_fecha_inicio
      CHECK (fecha_inicio <= fecha_fin),
   ADD CONSTRAINT chk_ejercicio_fecha_fin
      CHECK (fecha_fin >= fecha_inicio),
   ADD CONSTRAINT chk_ejercicio_fecha
      CHECK (DATEDIFF(fecha_fin, fecha_inicio) <= 365),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

INSERT INTO ejercicio (codigo, nombre, periodo, fecha_inicio, fecha_fin, vigente)
   VALUES (2015, 'EJERCICIO 2015', 2015, '2015-01-01', '2015-12-31', 1);

/* -------------------------------------------------------------------------- */
CREATE TABLE empresa (
   nombre VARCHAR(100) NOT NULL,
   razon_social VARCHAR(100),
   ruc VARCHAR(15) NOT NULL,
   dv CHAR(1) NOT NULL,
   sitio_web VARCHAR(100),
   e_mail VARCHAR(100),
   sucursal SMALLINT(5) UNSIGNED NOT NULL,
   ejercicio SMALLINT(5) UNSIGNED NOT NULL
);

ALTER TABLE empresa
   ADD CONSTRAINT pk_empresa_ruc_dv
      PRIMARY KEY (ruc, dv),
   ADD CONSTRAINT fk_empresa_sucursal
      FOREIGN KEY (sucursal) REFERENCES sucursal (codigo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT fk_empresa_ejercicio
      FOREIGN KEY (ejercicio) REFERENCES ejercicio (codigo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT chk_empresa_nombre
      CHECK (nombre <> ''),
   ADD CONSTRAINT chk_empresa_razon_social
      CHECK (razon_social IS NULL OR razon_social <> ''),
   ADD CONSTRAINT chk_empresa_ruc
      CHECK (ruc <> ''),
   ADD CONSTRAINT chk_empresa_dv
      CHECK (dv <> ''),
   ADD CONSTRAINT chk_empresa_sitio_web
      CHECK (sitio_web IS NULL OR sitio_web <> ''),
   ADD CONSTRAINT chk_empresa_e_mail
      CHECK (e_mail IS NULL OR e_mail <> ''),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

INSERT INTO empresa (nombre, razon_social, ruc, dv, sitio_web, e_mail, sucursal, ejercicio)
   VALUES ('A & A IMPORTACIONES S.R.L.', 'A & A IMPORTACIONES S.R.L.', '80004234', '4', 'www.ayaimportaciones.com.py', 'ayaimportaciones@gmail.com', 1, 2015);

/* -------------------------------------------------------------------------- */
CREATE TABLE unidad (
   codigo SMALLINT(5) UNSIGNED NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   simbolo VARCHAR(5) NOT NULL,
   divisible TINYINT(1) UNSIGNED NOT NULL,
   vigente TINYINT(1) UNSIGNED NOT NULL
);

ALTER TABLE unidad
   ADD CONSTRAINT pk_unidad_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT unq_unidad_nombre
      UNIQUE (nombre),
   ADD CONSTRAINT unq_unidad_simbolo
      UNIQUE (simbolo),
   ADD CONSTRAINT chk_unidad_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_unidad_nombre
      CHECK (nombre <> ''),
   ADD CONSTRAINT chk_unidad_simbolo
      CHECK (simbolo <> ''),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

/* -------------------------------------------------------------------------- */
CREATE TABLE vendedor (
   codigo SMALLINT(5) UNSIGNED NOT NULL,
   nombre VARCHAR(50) NOT NULL,
   documento VARCHAR(15),
   vigente TINYINT(1) UNSIGNED NOT NULL
);

ALTER TABLE vendedor
   ADD CONSTRAINT pk_vendedor_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT unq_vendedor_nombre
      UNIQUE (nombre),
   ADD CONSTRAINT unq_vendedor_documento
      UNIQUE (documento),
   ADD CONSTRAINT chk_vendedor_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_vendedor_nombre
      CHECK (nombre <> ''),
   ADD CONSTRAINT chk_vendedor_documento
      CHECK (documento IS NULL OR documento <> ''),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;

/* -------------------------------------------------------------------------- */
CREATE TABLE cliente (
   codigo MEDIUMINT UNSIGNED NOT NULL,
   nombre VARCHAR(100) NOT NULL,
   direc1 VARCHAR(60),
   direc2 VARCHAR(60),
   direc3 VARCHAR(60),
   direc4 VARCHAR(60),
   direc5 VARCHAR(60),
   direc6 VARCHAR(60),
   direc7 VARCHAR(60),
   direc8 VARCHAR(60),
   direc9 VARCHAR(60),
   departamen SMALLINT(5) UNSIGNED,
   ciudad SMALLINT(5) UNSIGNED,
   barrio SMALLINT(5) UNSIGNED,
   ruta SMALLINT(5) UNSIGNED NOT NULL,
   telefono VARCHAR(30),
   fax VARCHAR(30),
   e_mail VARCHAR(40),
   contacto VARCHAR(30),
   fechanac DATE,
   documento VARCHAR(15) NOT NULL,
   ruc VARCHAR(15),
   dv CHAR(1),
   estado CHAR(1) NOT NULL,
   plazo SMALLINT(5) UNSIGNED,
   vendedor SMALLINT(5) UNSIGNED,
   lista SMALLINT(5) UNSIGNED NOT NULL,
   limite_cre NUMERIC(19,6) NOT NULL,
   saldo_actu NUMERIC(19,6) NOT NULL,
   saldo_usd NUMERIC(19,6) NOT NULL,
   facturar TINYINT(1) UNSIGNED NOT NULL,
   fec_ioper DATE,
   motivoclie SMALLINT(5) UNSIGNED NOT NULL,
   odatosclie VARCHAR(40),
   obs1 VARCHAR(72),
   obs2 VARCHAR(72),
   obs3 VARCHAR(72),
   obs4 VARCHAR(72),
   obs5 VARCHAR(72),
   obs6 VARCHAR(72),
   obs7 VARCHAR(72),
   obs8 VARCHAR(72),
   obs9 VARCHAR(72),
   obs10 VARCHAR(72),
   ref1 VARCHAR(72),
   ref2 VARCHAR(72),
   ref3 VARCHAR(72),
   ref4 VARCHAR(72),
   ref5 VARCHAR(72),
   cuenta VARCHAR(18)
);

ALTER TABLE cliente
   ADD CONSTRAINT pk_cliente_codigo
      PRIMARY KEY (codigo),
   ADD CONSTRAINT fk_cliente_departamen
      FOREIGN KEY (departamen) REFERENCES depar (codigo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT fk_cliente_ciudad
      FOREIGN KEY (ciudad) REFERENCES ciudad (codigo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT fk_cliente_departamen_ciudad
      FOREIGN KEY (departamen, ciudad) REFERENCES ciudad (departamen, codigo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT fk_cliente_barrio
      FOREIGN KEY (barrio) REFERENCES barrio (codigo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT fk_cliente_departamen_ciudad_barrio
      FOREIGN KEY (departamen, ciudad, barrio) REFERENCES barrio (departamen, ciudad, codigo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT fk_cliente_ruta
      FOREIGN KEY (ruta) REFERENCES ruta (codigo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT fk_cliente_plazo
      FOREIGN KEY (plazo) REFERENCES plazo (codigo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT fk_cliente_vendedor
      FOREIGN KEY (vendedor) REFERENCES vendedor (codigo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT fk_cliente_motivoclie
      FOREIGN KEY (motivoclie) REFERENCES motivocl (codigo)
         ON DELETE NO ACTION
         ON UPDATE NO ACTION,
   ADD CONSTRAINT unq_cliente_nombre
      UNIQUE (nombre),
   ADD CONSTRAINT chk_cliente_codigo
      CHECK (codigo > 0),
   ADD CONSTRAINT chk_cliente_nombre
      CHECK (nombre <> ''),
   ADD CONSTRAINT chk_cliente_contacto
      CHECK (contacto <> ''),
   ADD CONSTRAINT chk_cliente_estado
      CHECK (estado IN ('A', 'I')),
   ADD CONSTRAINT chk_cliente_saldo_actu
      CHECK (saldo_actu >= 0),
   ADD CONSTRAINT chk_cliente_saldo_usd
      CHECK (saldo_usd >= 0),
   DEFAULT CHARACTER SET = 'latin1'
   DEFAULT COLLATE = 'latin1_swedish_ci',
   ENGINE=InnoDB;