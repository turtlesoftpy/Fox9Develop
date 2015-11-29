CLEAR ALL
PUBLIC goCapaDatos
*!*	goCapaDatos = NEWOBJECT('CapaDatos', 'CapaDatos.prg', NULL, ;
*!*	                        'MySQL ODBC 5.2w Driver', ;
*!*	                        'localhost', ;
*!*	                        '3306', ;
*!*	                        'merkava_80004234_001', ;
*!*	                        'root', ;
*!*	                        'masterkey')

goCapaDatos = NEWOBJECT('CapaDatos', 'CapaDatos.prg', NULL, ;
                        'PostgreSQL Unicode', ;
                        'localhost', ;
                        '5432', ;
                        'merkava_80004234_001', ;
                        'postgres', ;
                        'masterkey')

IF VARTYPE(goCapaDatos) <> 'O' THEN
? "error"
   RETURN .F.
ELSE
? "exito"
ENDIF


SET CENTURY on
SET DATE BRITISH
SET deleted ON
SET exact ON
SET SAFETY off
