DEFINE CLASS BaseDatos AS CUSTOM
   * Propiedades
   PROTECTED cControlador
   PROTECTED cAnfitrion
   PROTECTED cPuerto
   PROTECTED cBaseDatos
   PROTECTED cUsuario
   PROTECTED cClave
   PROTECTED cDialecto
   PROTECTED nConexion

   */ -------------------------------------------------------------------------- */
   PROTECTED FUNCTION Init
      WITH THIS
         .cControlador = ''
         .cAnfitrion = ''
         .cPuerto = ''
         .cBaseDatos = ''
         .cUsuario = ''
         .cClave = ''
         .cDialecto = ''
         .nConexion = 0
      ENDWITH
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION EstablecerControlador
      LPARAMETERS tcControlador

      IF VARTYPE(tcControlador) = 'C' THEN
         IF !EMPTY(tcControlador) THEN
            THIS.cControlador = ALLTRIM(tcControlador)
         ELSE
            MESSAGEBOX([El parámetro 'tcControlador' no debe estar vacío.], 0+48, 'BaseDatosSQL.EstablecerControlador()')
            RETURN .F.
         ENDIF
      ELSE
         MESSAGEBOX([El parámetro 'tcControlador' debe ser de tipo carácter.], 0+48, 'BaseDatosSQL.EstablecerControlador()')
         RETURN .F.
      ENDIF
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION EstablecerAnfitrion
      LPARAMETERS tcAnfitrion

      IF VARTYPE(tcAnfitrion) = 'C' THEN
         IF !EMPTY(tcAnfitrion) THEN
            THIS.cAnfitrion = ALLTRIM(tcAnfitrion)
         ELSE
            MESSAGEBOX([El parámetro 'tcAnfitrion' no debe estar vacío.], 0+48, 'BaseDatosSQL.EstablecerAnfitrion()')
            RETURN .F.
         ENDIF
      ELSE
         MESSAGEBOX([El parámetro 'tcAnfitrion' debe ser de tipo carácter.], 0+48, 'BaseDatosSQL.EstablecerAnfitrion()')
         RETURN .F.
      ENDIF
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION EstablecerPuerto
      LPARAMETERS tcPuerto

      IF VARTYPE(tcPuerto) = 'C' THEN
         IF !EMPTY(tcPuerto) THEN
            THIS.cPuerto = ALLTRIM(tcPuerto)
         ELSE
            MESSAGEBOX([El parámetro 'tcPuerto' no debe estar vacío.], 0+48, 'BaseDatosSQL.EstablecerPuerto()')
            RETURN .F.
         ENDIF
      ELSE
         MESSAGEBOX([El parámetro 'tcPuerto' debe ser de tipo carácter.], 0+48, 'BaseDatosSQL.EstablecerPuerto()')
         RETURN .F.
      ENDIF
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION EstablecerBaseDatos
      LPARAMETERS tcBaseDatos

      IF VARTYPE(tcBaseDatos) = 'C' THEN
         IF !EMPTY(tcBaseDatos) THEN
            THIS.cBaseDatos = ALLTRIM(tcBaseDatos)
         ELSE
            MESSAGEBOX([El parámetro 'tcBaseDatos' no debe estar vacío.], 0+48, 'BaseDatosSQL.EstablecerBaseDatos()')
            RETURN .F.
         ENDIF
      ELSE
         MESSAGEBOX([El parámetro 'tcBaseDatos' debe ser de tipo carácter.], 0+48, 'BaseDatosSQL.EstablecerBaseDatos()')
         RETURN .F.
      ENDIF
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION EstablecerUsuario
      LPARAMETERS tcUsuario

      IF VARTYPE(tcUsuario) = 'C' THEN
         IF !EMPTY(tcUsuario) THEN
            THIS.cUsuario = ALLTRIM(tcUsuario)
         ELSE
            MESSAGEBOX([El parámetro 'tcUsuario' no debe estar vacío.], 0+48, 'BaseDatosSQL.EstablecerUsuario()')
            RETURN .F.
         ENDIF
      ELSE
         MESSAGEBOX([El parámetro 'tcUsuario' debe ser de tipo carácter.], 0+48, 'BaseDatosSQL.EstablecerUsuario()')
         RETURN .F.
      ENDIF
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION EstablecerClave
      LPARAMETERS tcClave

      IF VARTYPE(tcClave) = 'C' THEN
         IF !EMPTY(tcClave) THEN
            THIS.cClave = ALLTRIM(tcClave)
         ELSE
            MESSAGEBOX([El parámetro 'tcClave' no debe estar vacío.], 0+48, 'BaseDatosSQL.EstablecerClave()')
            RETURN .F.
         ENDIF
      ELSE
         MESSAGEBOX([El parámetro 'tcClave' debe ser de tipo carácter.], 0+48, 'BaseDatosSQL.EstablecerClave()')
         RETURN .F.
      ENDIF
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION EstablecerDialecto
      LPARAMETERS tcDialecto

      IF VARTYPE(tcDialecto) = 'C' THEN
         IF !EMPTY(tcDialecto) THEN
            THIS.cDialecto = ALLTRIM(tcDialecto)
         ELSE
            MESSAGEBOX([El parámetro 'tcDialecto' no debe estar vacío.], 0+48, 'BaseDatosSQL.EstablecerDialecto()')
            RETURN .F.
         ENDIF
      ELSE
         MESSAGEBOX([El parámetro 'tcDialecto' debe ser de tipo carácter.], 0+48, 'BaseDatosSQL.EstablecerDialecto()')
         RETURN .F.
      ENDIF
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION ObtenerConexion
      RETURN THIS.nConexion
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION EstablecerConexion
      LOCAL lcCadenaConexion, lnIdentificadorConexion

      * Validates the connection string parameters.
      IF EMPTY(THIS.cControlador) THEN
         MESSAGEBOX([La propiedad 'cControlador' no debe estar vacía.], 0+48, 'BaseDatosSQL.EstablecerConexion()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.cAnfitrion) THEN
         MESSAGEBOX([La propiedad 'cAnfitrion' no debe estar vacía.], 0+48, 'BaseDatosSQL.EstablecerConexion()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.cPuerto) THEN
         MESSAGEBOX([La propiedad 'cPuerto' no debe estar vacía.], 0+48, 'BaseDatosSQL.EstablecerConexion()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.cBaseDatos) THEN
         MESSAGEBOX([La propiedad 'cBaseDatos' no debe estar vacía.], 0+48, 'BaseDatosSQL.EstablecerConexion()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.cUsuario) THEN
         MESSAGEBOX([La propiedad 'cUsuario' no debe estar vacía.], 0+48, 'BaseDatosSQL.EstablecerConexion()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.cClave) THEN
         MESSAGEBOX([La propiedad 'cClave' no debe estar vacía.], 0+48, 'BaseDatosSQL.EstablecerConexion()')
         RETURN .F.
      ENDIF

      IF ATC('Firebird', THIS.cControlador) > 0 THEN
         IF EMPTY(THIS.cDialecto) THEN
            MESSAGEBOX([La propiedad 'cDialecto' no debe estar vacía.], 0+48, 'BaseDatosSQL.EstablecerConexion()')
            RETURN .F.
         ENDIF
      ENDIF

      * Cadena de conexión para PostgreSQL Server.
      IF ATC('PostgreSQL', THIS.cControlador) > 0 THEN
         lcCadenaConexion = 'DRIVER=' + THIS.cControlador + ;
                            ';SERVER=' + THIS.cAnfitrion + ;
                            ';PORT=' + THIS.cPuerto + ;
                            ';DATABASE=' + THIS.cBaseDatos + ;
                            ';UID=' + THIS.cUsuario + ;
                            ';PWD=' + THIS.cClave + ;
                            ';'
      ENDIF

      * Cadena de conexión para MySQL Server.
      IF ATC('MySQL', THIS.cControlador) > 0 THEN
         lcCadenaConexion = 'DRIVER=' + THIS.cControlador + ;
                            ';SERVER=' + THIS.cAnfitrion + ;
                            ';PORT=' + THIS.cPuerto + ;
                            ';DATABASE=' + THIS.cBaseDatos + ;
                            ';UID=' + THIS.cUsuario + ;
                            ';PWD=' + THIS.cClave + ;
                            ';CHARSET=LATIN1' + ;
                            ';OPTION=3;'
      ENDIF

      * Cadena de conexión para MySQL Server.
      IF ATC('MariaDB', THIS.cControlador) > 0 THEN
         lcCadenaConexion = 'DRIVER=' + THIS.cControlador + ;
                            ';SERVER=' + THIS.cAnfitrion + ;
                            ';PORT=' + THIS.cPuerto + ;
                            ';DATABASE=' + THIS.cBaseDatos + ;
                            ';UID=' + THIS.cUsuario + ;
                            ';PWD=' + THIS.cClave + ;
                            ';CHARSET=LATIN1' + ;
                            ';OPTION=3;'
      ENDIF

      * Cadena de conexión para Firebird SQL Server.
      IF ATC('Firebird', THIS.cControlador) > 0 THEN
         lcCadenaConexion = 'DRIVER=' + THIS.cControlador + ;
                              ';SERVER=' + THIS.cAnfitrion + ;
                              ';PORT=' + THIS.cPuerto + ;
                              ';DATABASE=' + THIS.cAnfitrion + ':' + THIS.cBaseDatos + ;
                              ';CLIENT=c:\foxdevelop\project\stock\bin\fbclient.dll' + ;
                              ';UID=' + THIS.cUsuario + ;
                              ';PWD=' + THIS.cClave + ;
                              ';DIALECT=' + THIS.cDialecto + ;
                              ';'
      ENDIF

      SQLSETPROP(0, 'DispLogin', 3)   && DispLogin; if 3 or DB_PROMPTNEVER is specified, the ODBC Login dialog box isn't displayed and Visual FoxPro generates an error if the required login information isn't available. Read/write.

      lnIdentificadorConexion = SQLSTRINGCONNECT(lcCadenaConexion, .F.)

      IF lnIdentificadorConexion > 0 THEN
         THIS.nConexion = lnIdentificadorConexion
      ELSE
         AERROR(aMatrizError)
         MESSAGEBOX('No se pudo conectar al servidor.', 0+16, 'Conexión fallida')
         MESSAGEBOX(aMatrizError[3], 0+16, 'Error')
         RETURN .F.
      ENDIF
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION TerminarConexion
      IF THIS.nConexion > 0 THEN
         IF SQLDISCONNECT(THIS.nConexion) = 1 THEN   && Returns 1 if the connection is successfully terminated.
            THIS.nConexion = 0
         ENDIF
      ENDIF
   ENDFUNC
ENDDEFINE

*!*	IBPhoenix Open Source ODBC Driver (aka Firebird ODBC driver)

*!*	Local database Firebird
*!*	DRIVER=Firebird/InterBase(r) driver;UID=SYSDBA;PWD=masterkey;
*!*	DBNAME=C:\database\myData.fdb;

*!*	Remote connection to Firebird
*!*	DRIVER=Firebird/InterBase(r) driver;UID=SYSDBA;PWD=masterkey;
*!*	DBNAME=MyServer:C:\database\myData.fdb;

*!*	Specifying TCP/IP port number
*!*	DRIVER=Firebird/InterBase(r) driver;UID=SYSDBA;PWD=masterkey;
*!*	DBNAME=MyServer/3051:C:\database\myData.fdb;

*!*	Specifying dialect Firebird
*!*	SQL dialects were introduced in InterBase 6.0, to support a number of new SQL features including delimited identifiers.
*!*	DRIVER=Firebird/InterBase(r) driver;UID=SYSDBA;PWD=masterkey;
*!*	DBNAME=C:\database\myData.fdb;DIALECT=3;
*!*	DIALECT=1 - Parser processes as it did in InterBase V5.
*!*	DIALECT=2 - Transitional flagger. InterBaseV6, and Firebird flags ambiguous SQL constructs and issues an error or warning message.
*!*	DIALECT=3 - Parser processes anything delimited by single quotes as string constants and any thing delimited by double quotes as SQL delimited identifiers.

*!*	MySQL Connector/ODBC 5.2 connection strings

*!*	Unicode version of the driver
*!*	Driver={MySQL ODBC 5.2 UNICODE Driver};Server=localhost;Database=myDataBase;
*!*	User=myUsername;Password=myPassword;Option=3;

*!*	"MySQL ODBC 5.2 UNICODE Driver" is the new name for "MySQL ODBC 5.1w Driver".
*!*	"MySQL ODBC 5.2 ANSI Driver" is the new name for "MySQL ODBC 5.1a Driver".

*!*	Local database
*!*	Driver={MySQL ODBC 5.2 ANSI Driver};Server=localhost;Database=myDataBase;
*!*	User=myUsername;Password=myPassword;Option=3;

*!*	On 64 bit machine

*!*	It seems we need to point on MSDASQL for the (32 bit) ODBC driver to work on 64 bit machines.
*!*	Provider=MSDASQL;Driver={MySQL ODBC 5.2 ANSI Driver};Server=localhost;
*!*	Database=myDataBase;User=myUsername;Password=myPassword;Option=3;

*!*	PostgreSQL ODBC Driver (psqlODBC) connection strings

*!*	Standard
*!*	Driver={PostgreSQL};Server=IP address;Port=5432;Database=myDataBase;
*!*	Uid=myUsername;Pwd=myPassword;

*!*	ANSI
*!*	Driver={PostgreSQL ANSI};Server=IP address;Port=5432;Database=myDataBase;
*!*	Uid=myUsername;Pwd=myPassword;

*!*	Unicode
*!*	Driver={PostgreSQL UNICODE};Server=IP address;Port=5432;Database=myDataBase;
*!*	Uid=myUsername;Pwd=myPassword;

*!*	SSL
*!*	Secure sockets layer for this driver only works from version 8.0 and above.
*!*	Driver={PostgreSQL ANSI};Server=IP address;Port=5432;Database=myDataBase;
*!*	Uid=myUsername;Pwd=myPassword;sslmode=require;

*!*	Please note that sslmode=require is case sensitive, it should be written in lower case letters.