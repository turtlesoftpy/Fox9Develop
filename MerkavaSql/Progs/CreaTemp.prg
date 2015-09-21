*
* CreaTemp.prg
*
* Copyright (c) 2000-2008 by José Acuña. All Rights Reserved.
* Acosta Ñu Nº 143
* Tres Bocas, Villa Elisa, Paraguay
* Telephone: 021 943125 / Mobile: 0985 943522 or 0961 512679
* E-Mail..: turtlesoftpy@gmail.com
*
* Description:
* Returns a unique 8-character file name that begins with 'tm' followed by a combination of letters and numbers.
*
* History:
* September 21, 2008   José Acuña   Program creation
*
LOCAL lcReturn

DO WHILE .T.
   lcReturn = 'tm' + RIGHT(SYS(2015), 6)
   IF !FILE(lcReturn + '.dbf') AND ;
      !FILE(lcReturn + '.cdx') AND ;
      !FILE(lcReturn + '.txt') AND ;
      !FILE(lcReturn + '.rtf') AND ;
      !FILE(lcReturn + '.doc') AND ;
      !FILE(lcReturn + '.xls') AND ;
      !FILE(lcReturn + '.pdf') THEN
      EXIT
   ENDIF
ENDDO

RETURN lcReturn