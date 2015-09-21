*
* borraTemp.prg
*
* Copyright (c) 2000-2008 by José Acuña. All Rights Reserved.
* Acosta Ñu Nº 143
* Tres Bocas, Villa Elisa, Paraguay
* Telephone: 021 943125 / Mobile: 0985 943522 or 0961 512679
* E-Mail..: turtlesoftpy@gmail.com
*
* Description:
* Deletes temporary files.
*
* History:
* September 21, 2008   José Acuña   Program creation
*
LPARAMETERS tcFileName

* begin { parameters validation }
IF PARAMETERS() < 1 THEN
   MESSAGEBOX('Too few arguments.', 0+48, 'borraTemp')
   RETURN .F.
ENDIF

IF VARTYPE(tcFileName) <> 'C' THEN
   MESSAGEBOX([The parameter 'tcFileName' must be character type.], 0+48, 'borraTemp')
   RETURN .F.
ENDIF
* end { parameters validation }

LOCAL lcFileName, lnCounter

DIMENSION laFileType[1]

AddFileType(@laFileType, 'cdx')
AddFileType(@laFileType, 'dbf')
AddFileType(@laFileType, 'doc')
AddFileType(@laFileType, 'htm')
AddFileType(@laFileType, 'html')
AddFileType(@laFileType, 'idx')
AddFileType(@laFileType, 'pdf')
AddFileType(@laFileType, 'txt')
AddFileType(@laFileType, 'xls')
AddFileType(@laFileType, 'xlsx')

FOR lnCounter = 1 TO ALEN(laFileType)
   lcFileName = ALLTRIM(tcFileName) + '.' + laFileType[lnCounter]

   IF FILE(lcFileName) THEN
? LCFILENAME
      DELETE FILE (lcFileName)
   ENDIF
ENDFOR

*/ -------------------------------------------------------------------------- */
FUNCTION AddFileType
   LPARAMETERS taArray, tcFileType

   * begin { parameters validation }
   IF PARAMETERS() < 2 THEN
      MESSAGEBOX('Too few arguments.', 0+48, 'borraTemp.AddFileType()')
      RETURN .F.
   ENDIF

   IF TYPE('taArray', 1) <> 'A' THEN
      MESSAGEBOX([The parameter 'taArray' must be array type.], 0+48, 'borraTemp.AddFileType()')
      RETURN .F.
   ENDIF

   IF VARTYPE(tcFileType) <> 'C' THEN
      MESSAGEBOX([The parameter 'tcFileType' must be character type.], 0+48, 'borraTemp.AddFileType()')
      RETURN .F.
   ENDIF

   IF EMPTY(tcFileType) THEN
      MESSAGEBOX([The parameter 'tcFileType' must not be empty.], 0+48, 'borraTemp.AddFileType()')
      RETURN .F.
   ENDIF
   * end { parameters validation }

   LOCAL lnArrayRow
   lnArrayRow = IIF(VARTYPE(taArray) <> 'L', ALEN(taArray, 1) + 1, 1)

   DIMENSION taArray[lnArrayRow]
   taArray[lnArrayRow] = ALLTRIM(tcFileType)
ENDFUNC