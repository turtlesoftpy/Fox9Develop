DEFINE CLASS Mecanico AS CUSTOM
   * Propiedades.
   PROTECTED nBandera
   PROTECTED cTabla           && Nombre de la tabla a la cual hace referencia el modelo.
   PROTECTED cClavePrimaria   && Nombre de la clave primaria de la tabla.
   PROTECTED cClaveForanea    && Nombre con el cual se hace referencia a la clave primaria en otras tablas.

   * Campos.
   PROTECTED nCodigo
   PROTECTED cNombre
   PROTECTED cDocumento
   PROTECTED lVigente

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Init
      WITH THIS
         .nBandera = 0
         .cTabla = 'mecanico'
         .cClavePrimaria = 'codigo'
         .cClaveForanea = 'mecanico'

         .nCodigo = 0
         .cNombre = ''
         .cDocumento = ''
         .lVigente = .F.
      ENDWITH
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Destroy
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetBandera
      LPARAMETER tnBandera

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnBandera) <> 'N' THEN
         MESSAGEBOX([El par�metro 'tnBandera' debe ser de tipo num�rico.], 0+16, THIS.Name + '.SetBandera()')
         RETURN .F.
      ENDIF

      IF !BETWEEN(tnBandera, 0, 2) THEN
         MESSAGEBOX([El par�metro 'tnBandera' debe ser un valor entre 0 y 2.], 0+16, THIS.Name + '.SetBandera()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.nBandera = tnBandera
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetCodigo
      LPARAMETER tnCodigo

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnCodigo) <> 'N' THEN
         MESSAGEBOX([El par�metro 'tnCodigo' debe ser de tipo num�rico.], 0+16, THIS.Name + '.SetCodigo()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.nCodigo = tnCodigo
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetNombre
      LPARAMETER tcNombre

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tcNombre) <> 'C' THEN
         MESSAGEBOX([El par�metro 'tcNombre' debe ser de tipo texto.], 0+16, THIS.Name + '.SetNombre()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.cNombre = tcNombre
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetDocumento
      LPARAMETER tcDocumento

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tcDocumento) <> 'C' THEN
         MESSAGEBOX([El par�metro 'tcDocumento' debe ser de tipo texto.], 0+16, THIS.Name + '.SetDocumento()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.cDocumento = tcDocumento
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetVigente
      LPARAMETER tlVigente

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tlVigente) <> 'L' THEN
         MESSAGEBOX([El par�metro 'tlVigente' debe ser de tipo l�gico.], 0+16, THIS.Name + '.SetVigente()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.lVigente = tlVigente
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
   FUNCTION GetDocumento
      RETURN THIS.cDocumento
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetVigente
      RETURN THIS.lVigente
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

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tcCursor) <> 'C' THEN
         MESSAGEBOX([El par�metro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.RecuperarTodo()')
         llRetorno = .F.
      ELSE
         IF EMPTY(tcCursor) THEN
            MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.RecuperarTodo()')
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
      * fin { validaci�n de par�metro }

      LOCAL llRetorno, lcCursor, lnAreaTrabajo, lcOrden
      llRetorno = .T.
      lcCursor = CreaTemp()

      * Guarda el �rea de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' ORDER BY nombre', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE ' + tcCondicionFiltrado + ' ORDER BY nombre', lcCursor)
      ENDIF

      * Copia todos los registros al cursor que se ha pasado como par�metro.
      SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)

      SELECT (lcCursor)
      USE

      * Restaura el �rea de trabajo original.
      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
         SET ORDER TO (lcOrden)
      ENDIF

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION BuscarPorCodigo
      LPARAMETER tnCodigo, tcCondicionFiltrado, tcCursor

      * inicio { validaci�n de par�metro }
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
      * fin { validaci�n de par�metro }

      LOCAL llRetorno, lcCursor, lnAreaTrabajo, lcOrden
      llRetorno = .T.
      lcCursor = CreaTemp()

      * Guarda el �rea de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

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
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.BuscarPorCodigo()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado m�s de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El par�metro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorCodigo()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.BuscarPorCodigo()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO TABLE (tcCursor)
            ENDIF
         ENDIF
      ENDCASE

      SELECT (lcCursor)
      USE

      * Restaura el �rea de trabajo original.
      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
         SET ORDER TO (lcOrden)
      ENDIF

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION BuscarPorNombre
      LPARAMETER tcNombre, tcCondicionFiltrado, tcCursor

      * inicio { validaci�n de par�metro }
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
      * fin { validaci�n de par�metro }

      LOCAL llRetorno, lcCursor, lnAreaTrabajo, lcOrden
      llRetorno = .T.
      lcCursor = CreaTemp()

      * Guarda el �rea de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

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
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.BuscarPorNombre()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado m�s de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El par�metro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorNombre()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.BuscarPorNombre()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      ENDCASE

      SELECT (lcCursor)
      USE

      * Restaura el �rea de trabajo original.
      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
         SET ORDER TO (lcOrden)
      ENDIF

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION BuscarPorDocumento
      LPARAMETER tcDocumento, tcCondicionFiltrado, tcCursor

      * inicio { validaci�n de par�metro }
      IF EMPTY(IIF(!INLIST(VARTYPE(tcDocumento), 'L', 'X'), tcDocumento, THIS.cDocumento)) THEN
         RETURN .F.
      ENDIF

      IF VARTYPE(tcCondicionFiltrado) <> 'C' THEN
         tcCondicionFiltrado = NULL
      ELSE
         IF EMPTY(tcCondicionFiltrado) THEN
            tcCondicionFiltrado = NULL
         ENDIF
      ENDIF
      * fin { validaci�n de par�metro }

      LOCAL llRetorno, lcCursor, lnAreaTrabajo, lcOrden
      llRetorno = .T.
      lcCursor = CreaTemp()

      * Guarda el �rea de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

      PRIVATE pcDocumento
      pcDocumento = UPPER(IIF(!INLIST(VARTYPE(tcDocumento), 'L', 'X'), ALLTRIM(tcDocumento), ALLTRIM(THIS.cDocumento)))

      IF ISNULL(tcCondicionFiltrado) THEN
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(documento) LIKE ?pcDocumento', lcCursor)
      ELSE
         goCapaDatos.LlamarConsulta('SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(documento) LIKE ?pcDocumento AND ' + tcCondicionFiltrado, lcCursor)
      ENDIF

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.BuscarPorDocumento()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado m�s de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El par�metro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorDocumento()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.BuscarPorDocumento()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      ENDCASE

      SELECT (lcCursor)
      USE

      * Restaura el �rea de trabajo original.
      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
         SET ORDER TO (lcOrden)
      ENDIF

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarCodigo()
      IF !BETWEEN(THIS.nCodigo, 1, 32767) THEN
         MESSAGEBOX([El c�digo debe ser un valor entre 1 y 32767.], 0+16, THIS.Name + '.ValidarCodigo()')
         RETURN .F.
      ENDIF

      LOCAL llRetorno, loModelo, llExiste
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorCodigo(THIS.nCodigo)

      DO CASE
      CASE THIS.nBandera = 1   && Agregar.
         IF llExiste THEN
            MESSAGEBOX('El c�digo ya existe.', 0+16, THIS.Name + '.ValidarCodigo()')
            llRetorno = .F.
         ENDIF
      CASE THIS.nBandera = 2   && Modificar.
         IF !llExiste THEN
            MESSAGEBOX('El c�digo no existe.', 0+16, THIS.Name + '.ValidarCodigo()')
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
         MESSAGEBOX([La longitud del par�metro 'tcNombre' debe ser como m�ximo de 50 caracteres.], 0+16, THIS.Name + '.ValidarNombre()')
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
   FUNCTION ValidarDocumento()
      IF EMPTY(THIS.cDocumento) THEN
         RETURN .T.
      ENDIF

      IF LEN(THIS.cDocumento) > 15 THEN
         MESSAGEBOX([La longitud del par�metro 'tcDocumento' debe ser como m�ximo de 15 caracteres.], 0+16, THIS.Name + '.ValidarDocumento()')
         RETURN .F.
      ENDIF

      LOCAL llRetorno, loModelo, llExiste
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')
      llExiste = loModelo.BuscarPorDocumento(THIS.cDocumento)

      DO CASE
      CASE THIS.nBandera = 1   && Agregar.
         IF llExiste THEN
            MESSAGEBOX('El documento ya existe.', 0+16, THIS.Name + '.ValidarDocumento()')
            llRetorno = .F.
         ENDIF
      CASE THIS.nBandera = 2   && Modificar.
         IF llExiste AND loModelo.GetCodigo() <> THIS.nCodigo THEN
            MESSAGEBOX('El documento ya existe.', 0+16, THIS.Name + '.ValidarDocumento()')
            llRetorno = .F.
         ENDIF
      ENDCASE

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Validar
      IF !THIS.ValidarCodigo() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarNombre() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDocumento() THEN
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION CargarDatos
      WITH THIS
         .SetCodigo(codigo)
         .SetNombre(nombre)
         .SetDocumento(documento)
         .SetVigente(IIF(vigente = '0', .F., .T.))
      ENDWITH
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Agregar
      LOCAL llRetorno, lnAreaTrabajo, lcOrden
      llRetorno = .T.

      * Guarda el �rea de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

      THIS.nBandera = 1

      IF THIS.Validar() THEN
         PRIVATE pnCodigo, pcNombre, pcDocumento, plVigente
         pnCodigo = THIS.nCodigo
         pcNombre = THIS.cNombre
         pcDocumento = IIF(!EMPTY(THIS.cDocumento), THIS.cDocumento, NULL)
         plVigente = IIF(!THIS.lVigente, '0', '1')

         IF goCapaDatos.AgregarRegistro(THIS.cTabla, ;
                                        'codigo, nombre, documento, vigente', ;
                                        '?pnCodigo, ?pcNombre, ?pcDocumento, ?plVigente')
            WAIT 'Registro almacenado correctamente.' WINDOW NOWAIT
         ENDIF
      ELSE
         llRetorno = .F.
      ENDIF

      * Restaura el �rea de trabajo original.
      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
         SET ORDER TO (lcOrden)
      ENDIF

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Modificar
      LOCAL llRetorno, lnAreaTrabajo, lcOrden
      llRetorno = .T.

      * Guarda el �rea de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

      THIS.nBandera = 2

      IF THIS.Validar() THEN
         PRIVATE pnCodigo, pcNombre, pcDocumento, plVigente
         pnCodigo = THIS.nCodigo
         pcNombre = THIS.cNombre
         pcDocumento = IIF(!EMPTY(THIS.cDocumento), THIS.cDocumento, NULL)
         plVigente = IIF(!THIS.lVigente, '0', '1')

         IF goCapaDatos.ModificarRegistro(THIS.cTabla, ;
                                          'nombre = ?pcNombre, documento = ?pcDocumento, vigente = ?plVigente', ;
                                          THIS.cClavePrimaria + ' = ?pnCodigo')
            WAIT 'Registro almacenado correctamente.' WINDOW NOWAIT
         ENDIF
      ELSE
         llRetorno = .F.
      ENDIF

      * Restaura el �rea de trabajo original.
      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
         SET ORDER TO (lcOrden)
      ENDIF

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Borrar
      LPARAMETER tnCodigo

      * inicio { integridad referencial }
      WAIT 'Comprobando integridad referencial, por favor espere...' WINDOW NOWAIT

      LOCAL llRetorno, loModelo, lnAreaTrabajo, lcOrden, llExiste, lcTablaRelacionada, lnCantidadRegistro
      llRetorno = .T.
      loModelo = NEWOBJECT(THIS.Name, THIS.Name + '.prg')

      * Guarda el �rea de trabajo original.
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()

      PRIVATE pnCodigo
      pnCodigo = IIF(!INLIST(VARTYPE(tnCodigo), 'L', 'X'), tnCodigo, THIS.nCodigo)
      llExiste = loModelo.BuscarPorCodigo(pnCodigo)

      IF !llExiste THEN
         WAIT CLEAR
         MESSAGEBOX([El c�digo '] + ALLTRIM(STR(pnCodigo)) + [' no existe.], 0+16, THIS.Name + '.Borrar()')
         llRetorno = .F.
      ENDIF

      * Configuraci�n de Mec�nicos.
      IF llRetorno THEN
         lcTablaRelacionada = 'mecancfg'
         lnCantidadRegistro = goCapaDatos.RecuperarValor(lcTablaRelacionada, ;
                                                         'COUNT(*) AS cantidad', ;
                                                         THIS.cClaveForanea + ' = ?pnCodigo')
         IF VARTYPE(lnCantidadRegistro) = 'C' THEN
            lnCantidadRegistro = VAL(lnCantidadRegistro)
         ENDIF

         IF lnCantidadRegistro > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Configuraci�n de Mec�nicos', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF

      * �rdenes de Trabajo.
      IF llRetorno THEN
         lcTablaRelacionada = 'ot'
         lnCantidadRegistro = goCapaDatos.RecuperarValor(lcTablaRelacionada, ;
                                                         'COUNT(*) AS cantidad', ;
                                                         THIS.cClaveForanea + ' = ?pnCodigo')
         IF VARTYPE(lnCantidadRegistro) = 'C' THEN
            lnCantidadRegistro = VAL(lnCantidadRegistro)
         ENDIF

         IF lnCantidadRegistro > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de '�rdenes de Trabajo', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF

      * Presupuestos de Clientes.
      IF llRetorno THEN
         lcTablaRelacionada = 'cabepresc'
         lnCantidadRegistro = goCapaDatos.RecuperarValor(lcTablaRelacionada, ;
                                                         'COUNT(*) AS cantidad', ;
                                                         THIS.cClaveForanea + ' = ?pnCodigo')
         IF VARTYPE(lnCantidadRegistro) = 'C' THEN
            lnCantidadRegistro = VAL(lnCantidadRegistro)
         ENDIF

         IF lnCantidadRegistro > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Presupuestos de Clientes', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF

      * Pedidos de Clientes.
      IF llRetorno THEN
         lcTablaRelacionada = 'cabepedc'
         lnCantidadRegistro = goCapaDatos.RecuperarValor(lcTablaRelacionada, ;
                                                         'COUNT(*) AS cantidad', ;
                                                         THIS.cClaveForanea + ' = ?pnCodigo')
         IF VARTYPE(lnCantidadRegistro) = 'C' THEN
            lnCantidadRegistro = VAL(lnCantidadRegistro)
         ENDIF

         IF lnCantidadRegistro > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Pedidos de Clientes', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF

      * Ventas.
      IF llRetorno THEN
         lcTablaRelacionada = 'cabevent'
         lnCantidadRegistro = goCapaDatos.RecuperarValor(lcTablaRelacionada, ;
                                                         'COUNT(*) AS cantidad', ;
                                                         THIS.cClaveForanea + ' = ?pnCodigo')
         IF VARTYPE(lnCantidadRegistro) = 'C' THEN
            lnCantidadRegistro = VAL(lnCantidadRegistro)
         ENDIF

         IF lnCantidadRegistro > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Ventas', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF

      * Presupuestos de �rdenes de Trabajo.
      IF llRetorno THEN
         lcTablaRelacionada = 'cabemotp'
         lnCantidadRegistro = goCapaDatos.RecuperarValor(lcTablaRelacionada, ;
                                                         'COUNT(*) AS cantidad', ;
                                                         THIS.cClaveForanea + ' = ?pnCodigo')
         IF VARTYPE(lnCantidadRegistro) = 'C' THEN
            lnCantidadRegistro = VAL(lnCantidadRegistro)
         ENDIF

         IF lnCantidadRegistro > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'Presupuestos de �rdenes de Trabajo', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
            llRetorno = .F.
         ENDIF
      ENDIF

      * M�quinas Terminadas.
      IF llRetorno THEN
         lcTablaRelacionada = 'cabemot'
         lnCantidadRegistro = goCapaDatos.RecuperarValor(lcTablaRelacionada, ;
                                                         'COUNT(*) AS cantidad', ;
                                                         THIS.cClaveForanea + ' = ?pnCodigo')
         IF VARTYPE(lnCantidadRegistro) = 'C' THEN
            lnCantidadRegistro = VAL(lnCantidadRegistro)
         ENDIF

         IF lnCantidadRegistro > 0 THEN
            WAIT CLEAR
            MESSAGEBOX([El registro figura en el archivo de 'M�quinas Terminadas', imposible borrarlo.], 0+16, THIS.Name + '.Borrar()')
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

      * Restaura el �rea de trabajo original.
      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
         SET ORDER TO (lcOrden)
      ENDIF

      RETURN llRetorno
   ENDFUNC
ENDDEFINE