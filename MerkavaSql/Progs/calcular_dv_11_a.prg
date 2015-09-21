*
* calcular_dv_11_a.prg
*
* Derechos Reservados (c) 2000-2009 José Acuña
* Villa Elisa, Paraguay
*
* Descripción:
* Calcula el dígito verificador numérico con entrada alfanumérica y basemax 11.
*
* Compilador / Lenguaje:
* Microsoft Visual Foxpro 9.0 Service Pack 1.
*
* Historial de Modificación:
* Enero 03, 2009     Creación del Programa
*
FUNCTION calcular_dv_11_a
   LPARAMETERS p_numero, p_basemax

   * inicio { validación de parámetros }
   IF PARAMETERS() < 2 THEN
      MESSAGEBOX('Muy pocos argumentos.', 0+16, 'calcular_dv_11_a')
      RETURN .F.
   ENDIF

   IF VARTYPE(p_numero) <> 'C' THEN
      MESSAGEBOX([El parámetro 'p_numero' debe ser de tipo texto.], 0+16, 'calcular_dv_11_a')
      RETURN .F.
   ENDIF

   IF VARTYPE(p_basemax) <> 'N' THEN
      MESSAGEBOX([El parámetro 'p_basemax' debe ser de tipo numérico.], 0+16, 'calcular_dv_11_a')
      RETURN .F.
   ENDIF

   IF p_basemax <> 11 THEN
      MESSAGEBOX([El valor del parámetro 'p_basemax' debe ser 11.], 0+16, 'calcular_dv_11_a')
      RETURN .F.
   ENDIF
   * fin { validación de parámetros }

   LOCAL v_total      AS NUMERIC(6)
   LOCAL v_resto      AS NUMERIC(2)
   LOCAL k            AS NUMERIC(2)
   LOCAL v_numero_aux AS NUMERIC(1)
   LOCAL v_numero_al  AS VARCHAR(255)
   LOCAL v_caracter   AS VARCHAR(1)
   LOCAL v_digit      AS NUMERIC(1)

   * Cambia la última letra por ASCII en caso que la cédula termine en letra.
   v_numero_al = ''
   FOR i = 1 TO LEN(p_numero)
      v_caracter = UPPER(SUBSTR(p_numero, i, 1))
      IF !BETWEEN(ASC(v_caracter), 48, 57) THEN   && de 0 a 9
         v_numero_al = v_numero_al + ALLTRIM(STR(ASC(v_caracter)))
      ELSE
         v_numero_al = v_numero_al + v_caracter
      ENDIF
   ENDFOR

   * Calcula el DV.
   k       = 2
   v_total = 0

   FOR i = LEN(v_numero_al) TO 1 STEP -1
      IF k > p_basemax THEN
         k = 2
      ENDIF

      v_numero_aux = VAL(SUBSTR(v_numero_al, i, 1))
      v_total      = v_total + (v_numero_aux * k)
      k            = k + 1
   ENDFOR

   v_resto = MOD(v_total,11)

   IF v_resto > 1 THEN
      v_digit = 11 - v_resto
   ELSE
      v_digit = 0
   ENDIF

   RETURN v_digit
ENDFUNC