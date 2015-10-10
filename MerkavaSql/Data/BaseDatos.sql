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
   p1 NUMERIC(6,2),
   p2 NUMERIC(6,2),
   p3 NUMERIC(6,2),
   p4 NUMERIC(6,2),
   p5 NUMERIC(6,2),
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
   saldo_actu NUMERIC(12),
   saldo_usd NUMERIC(12.2),
   vigente VARCHAR(1) NOT NULL
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
