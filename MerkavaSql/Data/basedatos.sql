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
