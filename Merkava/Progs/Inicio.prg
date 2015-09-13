PUBLIC glAccesoConcedido, goAplicacion
glAccesoConcedido = .F.
goAplicacion = NEWOBJECT('Aplicacion', 'Aplicacion.prg')

IF VARTYPE(goAplicacion) = 'O' THEN
   DO FORM frmEscritorio
   DO MenuPrincipal.mpr
ENDIF

CLEAR DLLS
RELEASE ALL EXTENDED
CLEAR ALL