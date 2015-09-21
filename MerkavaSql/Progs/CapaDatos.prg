DEFINE CLASS CapaDatos AS BaseDatos OF BaseDatos
   * Propiedades
   PROTECTED aPalabraReservada[1]

   */ -------------------------------------------------------------------------- */
   PROTECTED FUNCTION Init
      LPARAMETERS tcControlador, tcAnfitrion, tcPuerto, tcBaseDatos, tcUsuario, tcClave

      BaseDatos::Init()

      WITH THIS
         * Sets the parameters, return false (.F.) if one of them cannot be set.
         IF !.EstablecerControlador(tcControlador) THEN
            RETURN .F.
         ENDIF

         IF !.EstablecerAnfitrion(tcAnfitrion) THEN
            RETURN .F.
         ENDIF

         IF !.EstablecerPuerto(tcPuerto) THEN
            RETURN .F.
         ENDIF

         IF !.EstablecerBaseDatos(tcBaseDatos) THEN
            RETURN .F.
         ENDIF

         IF !.EstablecerUsuario(tcUsuario) THEN
            RETURN .F.
         ENDIF

         IF !.EstablecerClave(tcClave) THEN
            RETURN .F.
         ENDIF

         IF ATC('Firebird', THIS.cControlador) > 0 THEN
            IF !.EstablecerDialecto(tcDialecto) THEN
               RETURN .F.
            ENDIF
         ENDIF

         * Establishes a connection to a data source.
         .EstablecerConexion()

         * Creates the list of the SQL Server reserved words.
         .EstablecerPalabraReservada()
      ENDWITH

      IF THIS.ObtenerConexion() = 0 THEN
         RETURN .F.   && Returns false (.F.) if it cannot make the connection.
      ENDIF
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   PROTECTED PROCEDURE EstablecerPalabraReservada
      WITH THIS
         * DDL (Data Definition Language)
         .AgregarPalabraReservada('ALTER')
         .AgregarPalabraReservada('CREATE')
         .AgregarPalabraReservada('DROP')
         .AgregarPalabraReservada('RENAME')
         .AgregarPalabraReservada('TRUNCATE')

         * DML (Data Manipulation Language)
         .AgregarPalabraReservada('DELETE')
         .AgregarPalabraReservada('INSERT')
         .AgregarPalabraReservada('MERGE')
         .AgregarPalabraReservada('UPDATE')

         * DCL (Data Control Language)
         .AgregarPalabraReservada('COMMIT')
         .AgregarPalabraReservada('GRANT')
         .AgregarPalabraReservada('REVOKE')
         .AgregarPalabraReservada('ROLLBACK')
         .AgregarPalabraReservada('SAVEPOINT')
      ENDWITH
   ENDPROC

   */ -------------------------------------------------------------------------- */
   PROTECTED FUNCTION MostrarMensaje
      LPARAMETERS tnNumeroErrorOdbc, tcMensajeErrorOdbc

      * inicio { validación de parámetros }
      IF PARAMETERS() < 2 THEN
         MESSAGEBOX('Muy pocos argumentos.', 0+48, 'CapaDatos.MostrarMensaje()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tnNumeroErrorOdbc) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnNumeroErrorOdbc' must be numeric type.], 0+48, 'CapaDatos.MostrarMensaje()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tcMensajeErrorOdbc) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcMensajeErrorOdbc' must be character type.], 0+48, 'CapaDatos.MostrarMensaje()')
         RETURN .F.
      ENDIF

      IF EMPTY(tcMensajeErrorOdbc) THEN
         MESSAGEBOX([El parámetro 'tcMensajeErrorOdbc' no debe estar vacío.], 0+48, 'CapaDatos.MostrarMensaje()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetros }

      * PostgreSQL Server.
      IF ATC('PostgreSQL', THIS.cControlador) > 0 THEN
         DO CASE
         CASE tnNumeroErrorOdbc = 7   && Exception
            LOCAL lnPosicionInicial, lnCaracterDevuelto

            lnPosicionInicial = AT('ERROR:', tcMensajeErrorOdbc) + 7
            lnCaracterDevuelto = ATC(';', tcMensajeErrorOdbc, 1) - lnPosicionInicial

            MESSAGEBOX(SUBSTR(tcMensajeErrorOdbc, lnPosicionInicial, lnCaracterDevuelto), 0+48, 'Excepción SQL')
         OTHERWISE
            MESSAGEBOX(tcMensajeErrorOdbc, 0+48, 'Error de conectividad')
         ENDCASE
      ENDIF

      * Firebird SQL Server.
      IF ATC('Firebird', THIS.cControlador) > 0 THEN
         DO CASE
         CASE tnNumeroErrorOdbc = -836   && Exception
            MESSAGEBOX(SUBSTR(tcMensajeErrorOdbc, AT(CHR(10), tcMensajeErrorOdbc, 2) + 1, AT(CHR(10), tcMensajeErrorOdbc, 3) - AT(CHR(10), tcMensajeErrorOdbc, 2) - 1), 0+48, 'Excepción SQL')
         CASE tnNumeroErrorOdbc = -551   && no permission for read/select access or no permission for update/write access or no permission for delete/write access
            DO CASE
            CASE 'read/select' $ tcMensajeErrorOdbc
               MESSAGEBOX('No tiene permiso para leer datos del archivo.', 0+48, 'Aviso')
            CASE 'insert/write' $ tcMensajeErrorOdbc
               MESSAGEBOX('No tiene permiso para agregar datos al archivo.', 0+48, 'Aviso')
            CASE 'update/write' $ tcMensajeErrorOdbc
               MESSAGEBOX('No tiene permiso para modificar datos del archivo.', 0+48, 'Aviso')
            CASE 'delete/write' $ tcMensajeErrorOdbc
               MESSAGEBOX('No tiene permiso para borrar datos del archivo.', 0+48, 'Aviso')
            ENDCASE
         OTHERWISE
            MESSAGEBOX(tcMensajeErrorOdbc, 0+48, 'Error de conectividad')
         ENDCASE
      ENDIF
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   PROTECTED FUNCTION AgregarPalabraReservada
      LPARAMETERS tcPalabraReservada

      LOCAL lnFilaMatriz

      IF VARTYPE(tcPalabraReservada) = 'C' THEN
         IF !EMPTY(tcPalabraReservada) THEN
            lnFilaMatriz = IIF(VARTYPE(THIS.aPalabraReservada) <> 'L', ALEN(THIS.aPalabraReservada, 1) + 1, 1)

            DIMENSION THIS.aPalabraReservada[lnFilaMatriz]
            THIS.aPalabraReservada[lnFilaMatriz] = ALLTRIM(tcPalabraReservada) + ' '
         ELSE
            MESSAGEBOX([El parámetro 'tcPalabraReservada' no debe estar vacío.], 0+48, 'CapaDatos.AgregarPalabraReservada()')
            RETURN .F.
         ENDIF
      ELSE
         MESSAGEBOX([El parámetro 'tcPalabraReservada' debe ser de tipo carácter.], 0+48, 'CapaDatos.AgregarPalabraReservada()')
         RETURN .F.
      ENDIF
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION LlamarConsulta
      LPARAMETERS tcComandoSQL, tcCursor

      LOCAL lnContador

      * inicio { validación de parámetros }
      IF PARAMETERS() < 2 THEN
         MESSAGEBOX('Muy pocos argumentos.', 0+48, 'CapaDatos.LlamarConsulta()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tcComandoSQL) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcComandoSQL' debe ser de tipo carácter.], 0+48, 'CapaDatos.LlamarConsulta()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tcCursor) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo carácter.], 0+48, 'CapaDatos.LlamarConsulta()')
         RETURN .F.
      ENDIF

      IF EMPTY(tcComandoSQL) THEN
         MESSAGEBOX([El parámetro 'tcComandoSQL' no debe estar vacío.], 0+48, 'CapaDatos.LlamarConsulta()')
         RETURN .F.
      ENDIF

      IF EMPTY(tcCursor) THEN
         MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+48, 'CapaDatos.LlamarConsulta()')
         RETURN .F.
      ENDIF

      FOR lnContador = 1 TO ALEN(THIS.aPalabraReservada, 1)
         IF ATC(THIS.aPalabraReservada[lnContador], tcComandoSQL) > 0 THEN
            MESSAGEBOX([El parámetro 'tcComandoSQL' no puede contener la palabra reservada ] + THIS.aPalabraReservada[lnContador], 0+48, 'CapaDatos.LlamarConsulta()')
            RETURN .F.
         ENDIF
      ENDFOR

      * Verifica si existe actualmente una conexión, si no es así entonces intenta conectar.
      IF THIS.ObtenerConexion() = 0 THEN
         IF !THIS.EstablecerConexion() THEN
            RETURN .F.
         ENDIF
      ENDIF
      * fin { validación de parámetros }

      IF SQLEXEC(THIS.ObtenerConexion(), tcComandoSQL, tcCursor) < 0 THEN
         AERROR(aMatrizError)
         MESSAGEBOX('Error de conectividad: ' + aMatrizError[3] , 0+48, 'CapaDatos.LlamarConsulta()')
         THIS.TerminarConexion()
         RETURN .F.
      ENDIF
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION EjecutarProcedimiento
      LPARAMETERS tcComandoSQL

      LOCAL lnContador

      * begin { parameter validation }
      IF PARAMETERS() < 1 THEN
         MESSAGEBOX('Muy pocos argumentos.', 0+48, 'CapaDatos.EjecutarProcedimiento()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tcComandoSQL) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcComandoSQL' debe ser de tipo carácter.], 0+48, 'CapaDatos.EjecutarProcedimiento()')
         RETURN .F.
      ENDIF

      IF EMPTY(tcComandoSQL) THEN
         MESSAGEBOX([El parámetro 'tcComandoSQL' no debe estar vacío.], 0+48, 'CapaDatos.EjecutarProcedimiento()')
         RETURN .F.
      ENDIF

      FOR lnContador = 1 TO ALEN(THIS.aPalabraReservada, 1)
         IF ATC(THIS.aPalabraReservada[lnContador], tcComandoSQL) > 0 THEN
            MESSAGEBOX([El parámetro 'tcComandoSQL' no puede contener la palabra reservada ] + THIS.aPalabraReservada[lnContador], 0+48, 'CapaDatos.EjecutarProcedimiento()')
            RETURN .F.
         ENDIF
      ENDFOR

      * Verifica si existe actualmente una conexión, si no es así entonces intenta conectar.
      IF THIS.ObtenerConexion() = 0 THEN
         IF !THIS.EstablecerConexion() THEN
            RETURN .F.
         ENDIF
      ENDIF
      * fin { validación de parámetros }

      LOCAL lnAreaTrabajo, lcCursor
      lnAreaTrabajo = SELECT()
      lcCursor = CreaTemp()

      IF SQLEXEC(THIS.ObtenerConexion(), tcComandoSQL, lcCursor) < 0 THEN
         AERROR(aMatrizError)
         THIS.MostrarMensaje(aMatrizError[5], aMatrizError[2])
         THIS.TerminarConexion()
         RETURN .F.
      ENDIF

      IF USED(lcCursor) THEN
         SELECT (lcCursor)
         USE
      ENDIF

      IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
         SELECT (lnAreaTrabajo)
      ENDIF
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION RecuperarValor
      LPARAMETERS tcTabla, tcCampo, tcCondicionFiltrado

      LOCAL lnContador

      * inicio { validación de parámetros }
      IF PARAMETERS() < 2 THEN
         MESSAGEBOX('Muy pocos argumentos.', 0+48, 'CapaDatos.RecuperarValor()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tcTabla) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcTabla' debe ser de tipo carácter.], 0+48, 'CapaDatos.RecuperarValor()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tcCampo) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcCampo' debe ser de tipo carácter.], 0+48, 'CapaDatos.RecuperarValor()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tcCondicionFiltrado) <> 'L' THEN
         IF VARTYPE(tcCondicionFiltrado) <> 'C' THEN
            MESSAGEBOX([El parámetro 'tcCondicionFiltrado' debe ser de tipo carácter.], 0+48, 'CapaDatos.RecuperarValor()')
            RETURN .F.
         ENDIF
      ENDIF

      IF EMPTY(tcTabla) THEN
         MESSAGEBOX([El parámetro 'tcTabla' no debe estar vacío.], 0+48, 'CapaDatos.RecuperarValor()')
         RETURN .F.
      ENDIF

      IF EMPTY(tcCampo) THEN
         MESSAGEBOX([El parámetro 'tcCampo' no debe estar vacío.], 0+48, 'CapaDatos.RecuperarValor()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tcCondicionFiltrado) <> 'L' THEN
         IF EMPTY(tcCondicionFiltrado) THEN
            MESSAGEBOX([El parámetro 'tcCondicionFiltrado' no debe estar vacío.], 0+48, 'CapaDatos.RecuperarValor()')
            RETURN .F.
         ENDIF
      ENDIF

      * Verifica si existe actualmente una conexión, si no es así entonces intenta conectar.
      IF THIS.ObtenerConexion() = 0 THEN
         IF !THIS.EstablecerConexion() THEN
            RETURN .F.
         ENDIF
      ENDIF
      * fin { validación de parámetros }

      LOCAL lnAreaTrabajo, lcOrden, lcCursor, lcSQL, lnRetorno, luRetorno
      lnAreaTrabajo = SELECT()
      lcOrden = ORDER()
      lcCursor = CreaTemp()

      IF VARTYPE(tcCondicionFiltrado) <> 'C' THEN
         lcSQL = 'SELECT ' + ;
                     tcCampo + ' ' + ;
                 'FROM ' + ;
                     tcTabla
      ELSE
         lcSQL = 'SELECT ' + ;
                     tcCampo + ' ' + ;
                 'FROM ' + ;
                     tcTabla + ' ' + ;
                 'WHERE ' + ;
                     tcCondicionFiltrado
      ENDIF

      lnRetorno = SQLEXEC(THIS.ObtenerConexion(), lcSQL, lcCursor)

      IF lnRetorno > 0 THEN
         IF ATC('COALESCE', tcCampo) > 0 THEN
            tcCampo = SUBSTR(tcCampo, AT(')', tcCampo) + 5)
         ENDIF

         tcCampo = STRTRAN(STRTRAN(STRTRAN(STRTRAN(STRTRAN(STRTRAN(tcCampo, 'COUNT(*) AS ', ''), 'MIN', ''), 'MAX', ''), 'SUM', ''), '(', ''), ')', '')
         tcCampo = IIF(AT(' ', tcCampo) > 0, ALLTRIM(SUBSTR(tcCampo, 1, AT(' ', tcCampo))), tcCampo)

         IF USED(lcCursor) THEN
            SELECT (lcCursor)
            luRetorno = &tcCampo

            IF ISNULL(luRetorno) THEN
               DO CASE
               CASE TYPE(tcCampo) = 'C'
                  luRetorno = ''
               CASE TYPE(tcCampo) = 'D'
                  luRetorno = CTOD('  /  /    ')
               CASE TYPE(tcCampo) = 'L'  OR TYPE(tcCampo) = 'U'
                  luRetorno = .F.
               CASE TYPE(tcCampo) = 'N'
                  luRetorno = 0
               CASE TYPE(tcCampo) = 'T'
                  luRetorno = CTOT('  /  /       :  :  ')
               ENDCASE
            ENDIF
            USE
         ENDIF

         IF !EMPTY(ALIAS(lnAreaTrabajo)) THEN
            SELECT (lnAreaTrabajo)
            SET ORDER TO (lcOrden)
         ENDIF

         RETURN luRetorno
      ELSE
         AERROR(aMatrizError)
         MESSAGEBOX('Error de conectividad: ' + aMatrizError[3] , 0+48, 'CapaDatos.RecuperarValor()')
         THIS.TerminarConexion()
         RETURN .F.
      ENDIF
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION AgregarRegistro
      LPARAMETERS tcTabla, tcCampos, tcValores

      * inicio { validación de parámetros }
      IF PARAMETERS() < 3 THEN
         MESSAGEBOX('Muy pocos argumentos.', 0+48, 'CapaDatos.AgregarRegistro()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tcTabla) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcTabla' debe ser de tipo carácter.], 0+48, 'CapaDatos.AgregarRegistro()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tcCampos) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcCampos' debe ser de tipo carácter.], 0+48, 'CapaDatos.AgregarRegistro()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tcValores) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcValores' debe ser de tipo carácter.], 0+48, 'CapaDatos.AgregarRegistro()')
         RETURN .F.
      ENDIF

      IF EMPTY(tcTabla) THEN
         MESSAGEBOX([El parámetro 'tcTabla' no debe estar vacío.], 0+48, 'CapaDatos.AgregarRegistro()')
         RETURN .F.
      ENDIF

      IF EMPTY(tcCampos) THEN
         MESSAGEBOX([El parámetro 'tcCampos' no debe estar vacío.], 0+48, 'CapaDatos.AgregarRegistro()')
         RETURN .F.
      ENDIF

      IF EMPTY(tcValores) THEN
         MESSAGEBOX([El parámetro 'tcValores' no debe estar vacío.], 0+48, 'CapaDatos.AgregarRegistro()')
         RETURN .F.
      ENDIF

      * Verifica si existe actualmente una conexión, si no es así entonces intenta conectar.
      IF THIS.ObtenerConexion() = 0 THEN
         IF !THIS.EstablecerConexion() THEN
            RETURN .F.
         ENDIF
      ENDIF
      * fin { validación de parámetros }

      LOCAL lcSQL, lnRetorno
      lcSQL = 'INSERT INTO ' + ALLTRIM(tcTabla) + ' (' + ALLTRIM(tcCampos) + ') VALUES (' + ALLTRIM(tcValores) + ')'
      lnRetorno = SQLEXEC(THIS.ObtenerConexion(), lcSQL)

      IF lnRetorno < 0 THEN   && si falla muestra un mensaje de error.
         AERROR(aMatrizError)
         MESSAGEBOX('Error de conectividad: ' + aMatrizError[3] , 0+48, 'CapaDatos.AgregarRegistro()')
         THIS.TerminarConexion()
         RETURN .F.
      ENDIF
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION ModificarRegistro
      LPARAMETERS tcTabla, tcCampos, tcCondicionFiltrado

      * inicio { validación de parámetros }
      IF PARAMETERS() < 3 THEN
         MESSAGEBOX('Muy pocos argumentos.', 0+48, 'CapaDatos.ModificarRegistro()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tcTabla) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcTabla' debe ser de tipo carácter.], 0+48, 'CapaDatos.ModificarRegistro()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tcCampos) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcCampos' debe ser de tipo carácter.], 0+48, 'CapaDatos.ModificarRegistro()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tcCondicionFiltrado) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcCondicionFiltrado' debe ser de tipo carácter.], 0+48, 'CapaDatos.ModificarRegistro()')
         RETURN .F.
      ENDIF

      IF EMPTY(tcTabla) THEN
         MESSAGEBOX([El parámetro 'tcTabla' no debe estar vacío.], 0+48, 'CapaDatos.ModificarRegistro()')
         RETURN .F.
      ENDIF

      IF EMPTY(tcCampos) THEN
         MESSAGEBOX([El parámetro 'tcCampos' no debe estar vacío.], 0+48, 'CapaDatos.ModificarRegistro()')
         RETURN .F.
      ENDIF

      IF EMPTY(tcCondicionFiltrado) THEN
         MESSAGEBOX([El parámetro 'tcCondicionFiltrado' no debe estar vacío.], 0+48, 'CapaDatos.ModificarRegistro()')
         RETURN .F.
      ENDIF

      * Verifica si existe actualmente una conexión, si no es así entonces intenta conectar.
      IF THIS.ObtenerConexion() = 0 THEN
         IF !THIS.EstablecerConexion() THEN
            RETURN .F.
         ENDIF
      ENDIF
      * fin { validación de parámetros }

      LOCAL lcSQL, lnRetorno
      lcSQL = 'UPDATE ' + ALLTRIM(tcTabla) + ' SET ' + ALLTRIM(tcCampos) + ' WHERE ' + ALLTRIM(tcCondicionFiltrado)
      lnRetorno = SQLEXEC(THIS.ObtenerConexion(), lcSQL)

      IF lnRetorno < 0 THEN   && si falla muestra un mensaje de error.
         AERROR(aMatrizError)
         MESSAGEBOX('Error de conectividad: ' + aMatrizError[3] , 0+48, 'CapaDatos.ModificarRegistro()')
         THIS.TerminarConexion()
         RETURN .F.
      ENDIF
    ENDFUNC


   */ -------------------------------------------------------------------------- */
   FUNCTION BorrarRegistro
      LPARAMETERS tcTabla, tcCondicionFiltrado

      * inicio { validación de parámetros }
      IF PARAMETERS() < 2 THEN
         MESSAGEBOX('Muy pocos argumentos.', 0+48, 'CapaDatos.BorrarRegistro()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tcTabla) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcTabla' debe ser de tipo carácter.], 0+48, 'CapaDatos.BorrarRegistro()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tcCondicionFiltrado) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcCondicionFiltrado' debe ser de tipo carácter.], 0+48, 'CapaDatos.BorrarRegistro()')
         RETURN .F.
      ENDIF

      IF EMPTY(tcTabla) THEN
         MESSAGEBOX([El parámetro 'tcTabla' no debe estar vacío.], 0+48, 'CapaDatos.BorrarRegistro()')
         RETURN .F.
      ENDIF

      IF EMPTY(tcCondicionFiltrado) THEN
         MESSAGEBOX([El parámetro 'tcCondicionFiltrado' no debe estar vacío.], 0+48, 'CapaDatos.BorrarRegistro()')
         RETURN .F.
      ENDIF

      * Verifica si existe actualmente una conexión, si no es así entonces intenta conectar.
      IF THIS.ObtenerConexion() = 0 THEN
         IF !THIS.EstablecerConexion() THEN
            RETURN .F.
         ENDIF
      ENDIF
      * fin { validación de parámetros }

      LOCAL lcSQL, lnRetorno
      lcSQL = 'DELETE FROM ' + ALLTRIM(tcTabla) + ' WHERE ' + ALLTRIM(tcCondicionFiltrado)
      lnRetorno = SQLEXEC(THIS.ObtenerConexion(), lcSQL)

      IF lnRetorno < 0 THEN   && si falla muestra un mensaje de error.
         AERROR(aMatrizError)
         MESSAGEBOX('Error de conectividad: ' + aMatrizError[3] , 0+48, 'CapaDatos.ModificarRegistro()')
         THIS.TerminarConexion()
         RETURN .F.
      ENDIF
   ENDFUNC
ENDDEFINE