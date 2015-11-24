PUBLIC goAplicacion, goCapaDatos, glAccesoConcedido
LOCAL llRetorno

goAplicacion = NEWOBJECT('Aplicacion', 'Aplicacion.prg')
goCapaDatos  = NEWOBJECT('CapaDatos', 'CapaDatos.prg', NULL, ;
                         'MySQL ODBC 5.2w Driver', ;
                         'localhost', ;
                         '3306', ;
                         'merkava_80004234_001', ;
                         'root', ;
                         'masterkey')
glAccesoConcedido = .F.
llRetorno = .T.

IF VARTYPE(goAplicacion) <> 'O' THEN
   MESSAGEBOX([El objeto 'goAplicacion' no existe.], 0+16, 'System.Init()')
   llRetorno = .F.
ENDIF

IF VARTYPE(goCapaDatos) <> 'O' THEN
   MESSAGEBOX([El objeto 'goCapaDatos' no existe.], 0+16, 'System.Init()')
   llRetorno = .F.
ENDIF

IF llRetorno THEN
   DO FORM frmEscritorio
   DO MenuPrincipal.mpr
ENDIF

CLEAR DLLS
RELEASE ALL EXTENDED
CLEAR ALL