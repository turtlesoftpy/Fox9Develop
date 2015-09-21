DEFINE CLASS Aplicacion AS CUSTOM
   PROTECTED oBaseDatos
   PROTECTED cVersion
   PROTECTED cCompilacion
   PROTECTED dFechaUltimaModificacion

   */ -------------------------------------------------------------------------- */
   PROTECTED FUNCTION Init
      * Establece el entorno de trabajo.
      THIS.SetEntorno()

      * Abre los arhivos de datos e �ndices.
      THIS.oBaseDatos = NEWOBJECT('BaseDatos', 'BaseDatos.prg')
      IF VARTYPE(THIS.oBaseDatos) <> 'O' THEN
         RETURN .F.
      ENDIF

*!*	      THIS.oBaseDatos = NEWOBJECT('CapaDatosSql', 'CapaDatosSql.prg', NULL, ;
*!*	                                  'MySQL ODBC 5.2w Driver', ;
*!*	                                  'localhost', ;
*!*	                                  '3306', ;
*!*	                                  'Merkava.80004234.001', ;
*!*	                                  'root', ;
*!*	                                  'masterkey')
*!*	      IF VARTYPE(THIS.oBaseDatos) <> 'O' THEN
*!*	         RETURN .F.
*!*	      ENDIF

      * Obtiene la versi�n del archivo ejecutable y su compilaci�n.
      AGETFILEVERSION(aVersionPuntoEXE, 'Merkava.exe')
      IF VARTYPE(aVersionPuntoEXE) <> 'C' THEN
         RETURN .F.
      ENDIF
      WITH THIS
         .SetVersion(LEFT(aVersionPuntoEXE[4], AT('.', aVersionPuntoEXE[4], 2) - 1))
         .SetCompilacion(SUBSTR(aVersionPuntoEXE[4], AT('.', aVersionPuntoEXE[4], 2) + 1))
      ENDWITH

      * Obtiene la fecha de �ltima modificaci�n del archivo ejecutable.
      ADIR(aVersionPuntoEXE, 'Merkava.exe', 'S', 1)
      IF VARTYPE(aVersionPuntoEXE) <> 'C' THEN
         RETURN .F.
      ENDIF
      THIS.SetFechaUltimaModificacion(aVersionPuntoEXE[1, 3])
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   PROTECTED FUNCTION SetEntorno
      CLEAR

      SET CENTURY ON
      SET COLLATE TO 'GENERAL'
      SET DATE BRITISH
      SET DELETED ON
      SET ESCAPE OFF
      SET EXACT ON
      SET EXCLUSIVE ON
      SET HOURS TO 24
      SET MULTILOCKS ON
      SET OPTIMIZE ON
      SET POINT TO ','
      SET REFRESH TO 1
      SET REPROCESS TO AUTOMATIC
      SET SAFETY OFF
      SET SEPARATOR TO '.'
      SET STATUS BAR OFF
      SET SYSMENU TO DEFAULT
      SET TALK OFF
      SET VIEW OFF
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION SetVersion
      LPARAMETERS tcVersion

      * inicio { validaci�n de par�metro }
      IF PARAMETERS() < 1 THEN
         MESSAGEBOX('Muy pocos argumentos.', 0+16, THIS.Name + '.SetVersion()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tcVersion) <> 'C' THEN
         MESSAGEBOX([El par�metro 'tcVersion' debe ser de tipo texto.], 0+16, THIS.Name + '.SetVersion()')
         RETURN .F.
      ENDIF

      IF EMPTY(tcVersion) THEN
         MESSAGEBOX([El par�metro 'tcVersion' no debe estar vac�o.], 0+16, THIS.Name + '.SetVersion()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.cVersion = ALLTRIM(tcVersion)
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION SetCompilacion
      LPARAMETERS tcCompilacion

      * inicio { validaci�n de par�metro }
      IF PARAMETERS() < 1 THEN
         MESSAGEBOX('Muy pocos argumentos.', 0+16, THIS.Name + '.SetCompilacion()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tcCompilacion) <> 'C' THEN
         MESSAGEBOX([El par�metro 'tcCompilacion' debe ser de tipo texto.], 0+16, THIS.Name + '.SetCompilacion()')
         RETURN .F.
      ENDIF

      IF EMPTY(tcCompilacion) THEN
         MESSAGEBOX([El par�metro 'tcCompilacion' no debe estar vac�o.], 0+16, THIS.Name + '.SetCompilacion()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.cCompilacion = ALLTRIM(tcCompilacion)
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION SetFechaUltimaModificacion
      LPARAMETERS tdFechaUltimaModificacion

      * inicio { validaci�n de par�metro }
      IF PARAMETERS() < 1 THEN
         MESSAGEBOX('Muy pocos argumentos.', 0+16, THIS.Name + '.SetFechaUltimaModificacion()')
         RETURN .F.
      ENDIF

      IF VARTYPE(tdFechaUltimaModificacion) <> 'D' THEN
         MESSAGEBOX([El par�metro 'tdFechaUltimaModificacion' debe ser de tipo fecha.], 0+16, THIS.Name + '.SetFechaUltimaModificacion()')
         RETURN .F.
      ENDIF

      IF EMPTY(tdFechaUltimaModificacion) THEN
         MESSAGEBOX([El par�metro 'tdFechaUltimaModificacion' no debe estar vac�o.], 0+16, THIS.Name + '.SetFechaUltimaModificacion()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.dFechaUltimaModificacion = tdFechaUltimaModificacion
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION GetVersion
      RETURN THIS.cVersion
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION GetCompilacion
      RETURN THIS.cCompilacion
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION GetFechaUltimaModificacion
      RETURN THIS.dFechaUltimaModificacion
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION GetRuta
      RETURN THIS.oBaseDatos.GetRuta()
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION GetRUC
      RETURN THIS.oBaseDatos.GetRUC()
   ENDFUNC

   */ -------------------------------------------------------------------------- */
   FUNCTION GetSucursal
      RETURN THIS.oBaseDatos.GetSucursal()
   ENDFUNC
ENDDEFINE