/* -------------------------------------------------------------------------- */
/* PA para calcular el dígito verificador numérico con entrada alfanumérica   */
/* y basemax 11.                                                              */
/* -------------------------------------------------------------------------- */
CREATE OR REPLACE FUNCTION pa_calcular_dv_11_a (p_numero IN VARCHAR, p_basemax IN NUMERIC DEFAULT 11) RETURNS NUMERIC AS $$
DECLARE
   v_total      NUMERIC(6);
   v_resto      NUMERIC(2);
   k            NUMERIC(2);
   v_numero_aux NUMERIC(1);
   v_numero_al  VARCHAR(255) DEFAULT '';
   v_caracter   VARCHAR(1);
   v_digit      NUMERIC;
BEGIN
   -- Cambia la última letra por ASCII en caso que la cédula termine en letra.
   FOR i IN 1..LENGTH(p_numero) LOOP
      v_caracter := UPPER(SUBSTR(p_numero, i, 1));
      IF ASCII(v_caracter) NOT BETWEEN 48 AND 57 THEN   -- de 0 a 9.
         v_numero_al := v_numero_al || ASCII(v_caracter);
      ELSE
         v_numero_al := v_numero_al || v_caracter;
      END IF;
   END LOOP;

   -- Calcula el DV.
   k       := 2;
   v_total := 0;

   FOR i IN REVERSE LENGTH(v_numero_al)..1 LOOP
      IF k > p_basemax THEN
         k := 2;
      END IF;

      v_numero_aux := TO_NUMBER(SUBSTR(v_numero_al, i, 1), '99G999D9S');
      v_total      := v_total + (v_numero_aux * k);
      k            := k + 1;
   END LOOP;

   v_resto := MOD(v_total,11);

   IF v_resto > 1 THEN
      v_digit := 11 - v_resto;
   ELSE
      v_digit := 0;
   END IF;

   RETURN v_digit;
END;
$$ LANGUAGE plpgsql;