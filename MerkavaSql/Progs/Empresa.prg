DEFINE CLASS Empresa AS CUSTOM
   * Propiedades.
   PROTECTED cTabla           && Nombre de la tabla a la cual hace referencia el modelo.

   * Campos.
   PROTECTED cNombre
   PROTECTED cRazonSocial
   PROTECTED cRUC
   PROTECTED cDV
   PROTECTED cSitioWeb
   PROTECTED cEMail
   PROTECTED nSucursal
   PROTECTED nEjercicio

   * Objetos.
   PROTECTED oSucursal
   PROTECTED oEjercicio

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Init
      WITH THIS
         .cTabla = 'empresa'

         .cNombre = ''
         .cRazonSocial = ''
         .cRUC = ''
         .cDV = ''
         .cSitioWeb = ''
         .cEMail = ''
         .nSucursal = 0
         .nEjercicio = 0

         .oSucursal = NEWOBJECT('Sucursal', 'Sucursal.prg')
         .oEjercicio = NEWOBJECT('Ejercicio', 'Ejercicio.prg')

         .RecuperarTodo()
      ENDWITH
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION Destroy
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
   FUNCTION SetRazonSocial
      LPARAMETER tcRazonSocial

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tcRazonSocial) <> 'C' THEN
         MESSAGEBOX([El par�metro 'tcRazonSocial' debe ser de tipo texto.], 0+16, THIS.Name + '.SetRazonSocial()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.cRazonSocial = tcRazonSocial
   ENDFUNC

  * ---------------------------------------------------------------------------- *
   FUNCTION SetRUC
      LPARAMETER tcRUC

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tcRUC) <> 'C' THEN
         MESSAGEBOX([El par�metro 'tcRUC' debe ser de tipo texto.], 0+16, THIS.Name + '.SetRUC()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.cRUC = ALLTRIM(tcRUC)
   ENDFUNC

  * ---------------------------------------------------------------------------- *
   FUNCTION SetDV
      LPARAMETER tcDV

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tcDV) <> 'C' THEN
         MESSAGEBOX([El par�metro 'tcDV' debe ser de tipo texto.], 0+16, THIS.Name + '.SetDV()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.cDV = tcDV
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetSitioWeb
      LPARAMETER tcSitioWeb

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tcSitioWeb) <> 'C' THEN
         MESSAGEBOX([El par�metro 'tcSitioWeb' debe ser de tipo texto.], 0+16, THIS.Name + '.SetSitioWeb()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.cSitioWeb = tcSitioWeb
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetEMail
      LPARAMETER tcEMail

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tcEMail) <> 'C' THEN
         MESSAGEBOX([El par�metro 'tcEMail' debe ser de tipo texto.], 0+16, THIS.Name + '.SetEMail()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.cEMail = tcEMail
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetSucursal
      LPARAMETER tnSucursal

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnSucursal) <> 'N' THEN
         MESSAGEBOX([El par�metro 'tnSucursal' debe ser de tipo num�rico.], 0+16, THIS.Name + '.SetSucursal()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.nSucursal = tnSucursal

      IF !THIS.oSucursal.BuscarPorCodigo(THIS.nSucursal) THEN   && El registro no existe.
         WITH THIS.oSucursal
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION SetEjercicio
      LPARAMETER tnEjercicio

      * inicio { validaci�n de par�metro }
      IF VARTYPE(tnEjercicio) <> 'N' THEN
         MESSAGEBOX([El par�metro 'tnEjercicio' debe ser de tipo num�rico.], 0+16, THIS.Name + '.SetEjercicio()')
         RETURN .F.
      ENDIF
      * fin { validaci�n de par�metro }

      THIS.nEjercicio = tnEjercicio

      IF !THIS.oEjercicio.BuscarPorCodigo(THIS.nEjercicio) THEN   && El registro no existe.
         WITH THIS.oEjercicio
            .SetNombre('')
            .SetVigente(.F.)
         ENDWITH
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetNombre
      RETURN THIS.cNombre
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetRazonSocial
      RETURN THIS.cRazonSocial
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetRUC
      RETURN THIS.cRUC
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetDV
      RETURN THIS.cDV
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetSitioWeb
      RETURN THIS.cSitioWeb
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetEMail
      RETURN THIS.cEMail
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
   FUNCTION GetSucursalVigente
      RETURN THIS.oSucursal.GetVigente()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetEjercicio
      RETURN THIS.nEjercicio
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetEjercicioNombre
      RETURN THIS.oEjercicio.GetNombre()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION GetEjercicioVigente
      RETURN THIS.oEjercicio.GetVigente()
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION RecuperarTodo
      LPARAMETER tcCondicionFiltrado, tcCursor

      * inicio { validaci�n de par�metro }
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

      SELECT (lcCursor)
      DO CASE
      CASE RECCOUNT() = 0   && No hay registros.
         llRetorno = .F.
      CASE RECCOUNT() = 1   && Se ha encontrado un registro.
         THIS.CargarDatos()

         IF VARTYPE(tcCursor) = 'C' THEN
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.RecuperarTodo()')
               llRetorno = .F.
            ELSE
               * Copia todos los registros al cursor que se ha pasado como par�metro.
               SELECT * FROM (lcCursor) INTO CURSOR (tcCursor)
            ENDIF
         ENDIF
      CASE RECCOUNT() > 1   && Se ha encontrado m�s de un registro.
         IF VARTYPE(tcCursor) <> 'C' THEN
            MESSAGEBOX([El par�metro 'tcCursor' debe ser de tipo texto.], 0+16, THIS.Name + '.RecuperarTodo()')
            llRetorno = .F.
         ELSE
            IF EMPTY(tcCursor) THEN
               MESSAGEBOX([El par�metro 'tcCursor' no debe estar vac�o.], 0+16, THIS.Name + '.RecuperarTodo()')
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
   FUNCTION ValidarNombre()
      IF EMPTY(THIS.cNombre) THEN
         MESSAGEBOX('El nombre no puede quedar en blanco.', 0+16, THIS.Name + '.ValidarNombre()')
         RETURN .F.
      ENDIF

      IF LEN(THIS.cNombre) > 100 THEN
         MESSAGEBOX([La longitud del par�metro 'tcNombre' debe ser como m�ximo de 100 caracteres.], 0+16, THIS.Name + '.ValidarNombre()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarRazonSocial()
      IF LEN(THIS.cRazonSocial) > 100 THEN
         MESSAGEBOX([La longitud del par�metro 'tcRazonSocial' debe ser como m�ximo de 100 caracteres.], 0+16, THIS.Name + '.ValidarRazonSocial()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarRUC()
      IF EMPTY(THIS.cRUC) THEN
         MESSAGEBOX('El RUC no puede quedar en blanco.', 0+16, THIS.Name + '.ValidarRUC()')
         RETURN .F.
      ENDIF

      IF LEN(THIS.cRUC) > 15 THEN
         MESSAGEBOX([La longitud del campo 'cRUC' debe ser como m�ximo de 15 caracteres.], 0+16, THIS.Name + '.ValidarRUC()')
         RETURN .F.
      ENDIF

      IF !ValidarFormatoRUC(THIS.cRUC) THEN
         MESSAGEBOX('El RUC digitado es incorrecto, debe ser num�rico, solo se permite una letra cuando se trata de c�dula de identidad.', 0+16, THIS.Name + '.ValidarRUC()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarDV()
      IF EMPTY(THIS.cDV) THEN
         MESSAGEBOX('El DV no puede quedar en blanco.', 0+16, THIS.Name + '.ValidarDV()')
         RETURN .F.
      ENDIF

      IF LEN(THIS.cDV) > 1 THEN
         MESSAGEBOX([La longitud del campo 'cDV' debe ser como m�ximo de 1 caracter.], 0+16, THIS.Name + '.ValidarDV()')
         RETURN .F.
      ENDIF

      IF !ValidarFormatoRUC(THIS.cRUC) THEN
         MESSAGEBOX('El RUC digitado es incorrecto, debe ser num�rico, solo se permite una letra cuando se trata de c�dula de identidad.', 0+16, THIS.Name + '.ValidarDV()')
         RETURN .F.
      ENDIF

      IF STR(calcular_dv_11_a(THIS.cRUC, 11), 1) <> THIS.cDV THEN
         MESSAGEBOX('El D�gito Verificador no corresponde.', 0+16, THIS.Name + '.ValidarDV()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarSitioWeb()
      IF LEN(THIS.cSitioWeb) > 100 THEN
         MESSAGEBOX([La longitud del par�metro 'tcSitioWeb' debe ser como m�ximo de 100 caracteres.], 0+16, THIS.Name + '.ValidarSitioWeb()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarEMail()
      IF LEN(THIS.cEMail) > 100 THEN
         MESSAGEBOX([La longitud del par�metro 'tcEMail' debe ser como m�ximo de 100 caracteres.], 0+16, THIS.Name + '.ValidarEMail()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarSucursal()
      IF !BETWEEN(THIS.nSucursal, 1, 32767) THEN
         MESSAGEBOX([La sucursal debe ser un valor entre 1 y 32767.], 0+16, THIS.Name + '.ValidarSucursal()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.oSucursal.GetNombre()) THEN
         MESSAGEBOX('La sucursal no existe.', 0+16, THIS.Name + '.ValidarSucursal()')
         RETURN .F.
      ENDIF

      IF !THIS.oSucursal.GetVigente() THEN
         MESSAGEBOX('La sucursal no est� vigente.', 0+16, THIS.Name + '.ValidarSucursal()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION ValidarEjercicio()
      IF !BETWEEN(THIS.nEjercicio, 2000, 2038) THEN
         MESSAGEBOX([El ejercicio debe ser un valor entre 2000 y 2038.], 0+16, THIS.Name + '.ValidarEjercicio()')
         RETURN .F.
      ENDIF

      IF EMPTY(THIS.oEjercicio.GetNombre()) THEN
         MESSAGEBOX('El ejercicio no existe.', 0+16, THIS.Name + '.ValidarEjercicio()')
         RETURN .F.
      ENDIF

      IF !THIS.oEjercicio.GetVigente() THEN
         MESSAGEBOX('El ejercicio no est� vigente.', 0+16, THIS.Name + '.ValidarEjercicio()')
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   FUNCTION Validar
      IF !THIS.ValidarNombre() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarRazonSocial() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarRUC() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarDV() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarSitioWeb() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarEMail() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarSucursal() THEN
         RETURN .F.
      ENDIF

      IF !THIS.ValidarEjercicio() THEN
         RETURN .F.
      ENDIF
   ENDFUNC

   * ---------------------------------------------------------------------------- *
   PROTECTED FUNCTION CargarDatos
      WITH THIS
         .SetNombre(nombre)
         .SetRazonSocial(razon_social)
         .SetRUC(ruc)
         .SetDV(dv)
         .SetSitioWeb(sitio_web)
         .SetEMail(e_mail)
         .SetSucursal(sucursal)
         .SetEjercicio(ejercicio)
      ENDWITH
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
         PRIVATE pcNombre, pcRazonSocial, pcRUC, pcDV, pcSitioWeb, pcEMail, pnSucursal, pnEjercicio
         pcNombre = THIS.cNombre
         pcRazonSocial = THIS.cRazonSocial
         pcRUC = THIS.cRUC
         pcDV = THIS.cDV
         pcSitioWeb = THIS.cSitioWeb
         pcEMail = THIS.cEMail
         pnSucursal = THIS.nSucursal
         pnEjercicio = THIS.nEjercicio

         IF goCapaDatos.ModificarRegistro(THIS.cTabla, ;
                                          'nombre = ?pcNombre, razon_social = ?pcRazonSocial, ruc = ?pcRUC, dv = ?pcDV, sitio_web = ?pcSitioWeb, e_mail = ?pcEMail, sucursal = ?pnSucursal, ejercicio = ?pnEjercicio', ;
                                          'ruc LIKE ?pcRUC AND dv LIKE ?pcDV')
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
ENDDEFINE