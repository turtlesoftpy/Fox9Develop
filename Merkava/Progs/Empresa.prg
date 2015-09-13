DEFINE CLASS Empresa AS CUSTOM
   * Propiedades.
   PROTECTED nBandera
   PROTECTED cTabla           && Nombre de la tabla a la cual hace referencia el modelo.
   PROTECTED cClavePrimaria   && Nombre de la clave primaria de la tabla.
   PROTECTED cClaveForanea    && Nombre con el cual se hace referencia a la clave primaria en otras tablas.

   * Campos.
   PROTECTED cEmpresa
   PROTECTED nSucursal
   PROTECTED cRUC

   * Objetos.
   PROTECTED oSucursal

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Init
      WITH THIS
         .nBandera = 0
         .cTabla = 'control'
         .cClavePrimaria = 'ruc'
         .cClaveForanea = 'empresa'

         .cEmpresa = ''
         .nSucursal = 0
         .cRUC = ''

         .oSucursal = NEWOBJECT('Sucursal', 'Sucursal.prg')
      ENDWITH

      IF VARTYPE(THIS.oSucursal) <> 'O' THEN
         MESSAGEBOX([No se puede crear el objeto 'Sucursal'.], 0+16, THIS.Name + '.Init()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Destroy
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetBandera
      LPARAMETER tnBandera

      * inicio { validación de parámetro }
      IF VARTYPE(tnBandera) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnBandera' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetBandera()')
         RETURN .F.
      ENDIF

      IF !BETWEEN(tnBandera, 0, 2) THEN
         MESSAGEBOX([El parámetro 'tnBandera' debe ser un valor entre 0 y 2.], 0+16, THIS.Name + '.SetBandera()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nBandera = tnBandera
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetEmpresa
      LPARAMETER tcEmpresa

      * inicio { validación de parámetro }
      IF VARTYPE(tcEmpresa) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcEmpresa' debe ser de tipo texto.], 0+16, THIS.Name + '.SetEmpresa()')
         RETURN .F.
      ENDIF

      IF LEN(tcEmpresa) > 26 THEN
         MESSAGEBOX([La longitud del parámetro 'tcEmpresa' debe ser como máximo de 26 caracteres.], 0+16, THIS.Name + '.SetEmpresa()')
         RETURN .F.
      ENDIF

      IF AT('[', tcEmpresa) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetEmpresa()')
         RETURN .F.
      ENDIF

      IF AT(']', tcEmpresa) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetEmpresa()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cEmpresa = tcEmpresa
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetSucursal
      LPARAMETER tnSucursal

      * inicio { validación de parámetro }
      IF VARTYPE(tnSucursal) <> 'N' THEN
         MESSAGEBOX([El parámetro 'tnSucursal' debe ser de tipo numérico.], 0+16, THIS.Name + '.SetSucursal()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.nSucursal = tnSucursal

      IF !THIS.oSucursal.BuscarPorCodigo(THIS.nSucursal) THEN   && El registro no existe.
         WITH THIS.oSucursal
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetRUC
      LPARAMETER tcRUC

      * inicio { validación de parámetro }
      IF VARTYPE(tcRUC) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcRUC' debe ser de tipo texto.], 0+16, THIS.Name + '.SetRUC()')
         RETURN .F.
      ENDIF

      IF LEN(tcRUC) > 15 THEN
         MESSAGEBOX([La longitud del parámetro 'tcRUC' debe ser como máximo de 15 caracteres.], 0+16, THIS.Name + '.SetRUC()')
         RETURN .F.
      ENDIF

      IF AT('[', tcRUC) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetRUC()')
         RETURN .F.
      ENDIF

      IF AT(']', tcRUC) > 0 THEN
         MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.SetRUC()')
         RETURN .F.
      ENDIF
      * fin { validación de parámetro }

      THIS.cRUC = tcRUC
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetEmpresa
      RETURN THIS.cEmpresa
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetSucursal
      RETURN THIS.nSucursal
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetSucursalNombre
      RETURN THIS.oSucursal.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetRUC
      RETURN THIS.cRUC
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION RecuperarTodo
      LPARAMETER tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF VARTYPE(tcCursor) <> 'C' THEN
         MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.RecuperarTodo()')
         llRetorno = .F.
      ELSE
         IF EMPTY(tcCursor) THEN
            MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.RecuperarTodo()')
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
      * fin { validación de parámetro }

      LOCAL llRetorno, lcCursor, lcSQL
      llRetorno = .T.
      lcCursor = CreaTemp()

      IF ISNULL(tcCondicionFiltrado) THEN
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' ORDER BY empresa INTO CURSOR ' + lcCursor
      ELSE
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE ' + tcCondicionFiltrado + ' ORDER BY empresa INTO CURSOR ' + lcCursor
      ENDIF

      &lcSQL

      * Copia todos los registros al cursor que se ha pasado como parámetro.
      SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)

      SELECT (lcCursor)
      USE

      RETURN llRetorno
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION BuscarPorRUC
      LPARAMETER tcRUC, tcCondicionFiltrado, tcCursor

      * inicio { validación de parámetro }
      IF VARTYPE(tcRUC) = 'C' THEN
         IF LEN(tcRUC) > 15 THEN
            MESSAGEBOX([La longitud del parámetro 'tcRUC' debe ser como máximo de 15 caracteres.], 0+16, THIS.Name + '.BuscarPorRUC()')
            RETURN .F.
         ENDIF

         IF AT('[', tcRUC) > 0 THEN
            MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.BuscarPorRUC()')
            RETURN .F.
         ENDIF

         IF AT(']', tcRUC) > 0 THEN
            MESSAGEBOX('Los corchetes no están permitidos.', 0+16, THIS.Name + '.BuscarPorRUC()')
            RETURN .F.
         ENDIF
      ENDIF

      IF EMPTY(IIF(!INLIST(VARTYPE(tcRUC), 'L', 'X'), tcRUC, THIS.cRUC)) THEN
         RETURN .F.
      ENDIF

      IF VARTYPE(tcCondicionFiltrado) <> 'C' THEN
         tcCondicionFiltrado = NULL
      ELSE
         IF EMPTY(tcCondicionFiltrado) THEN
            tcCondicionFiltrado = NULL
         ENDIF
      ENDIF
      * fin { validación de parámetro }

      LOCAL llRetorno, lcCursor, lcRUC, lcSQL
      llRetorno = .T.
      lcCursor = CreaTemp()
      lcRUC = IIF(!INLIST(VARTYPE(tcRUC), 'L', 'X'), ALLTRIM(tcRUC), ALLTRIM(THIS.cRUC))

      IF ISNULL(tcCondicionFiltrado) THEN
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(ruc) LIKE [' + ALLTRIM(UPPER(lcRUC)) + '] INTO CURSOR ' + lcCursor
      ELSE
         lcSQL = 'SELECT * FROM ' + THIS.cTabla + ' WHERE UPPER(ruc) LIKE [' + ALLTRIM(UPPER(lcRUC)) + '] AND ' + tcCondicionFiltrado + ' INTO CURSOR ' + lcCursor
      ENDIF

      &lcSQL

      SELECT (lcCursor)
      DO CASE
      CASE _TALLY = 0   && No hay registros.
         llRetorno = .F.
      CASE _TALLY = 1   && Se ha encontrado un registro.
         WITH THIS
            .SetRUC(ruc)
            .SetEmpresa(empresa)
            .SetSucursal(local)
         ENDWITH

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorRUC()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE _TALLY > 1   && Se ha encontrado más de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El parámetro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.BuscarPorRUC()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El parámetro 'tcCursor' no debe estar vacío.], 0+16, THIS.Name + '.BuscarPorRUC()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como parámetro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      ENDCASE

      SELECT (lcCursor)
      USE

      RETURN llRetorno
   ENDFUNC
ENDDEFINE