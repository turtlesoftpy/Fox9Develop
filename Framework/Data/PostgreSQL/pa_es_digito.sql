/* -------------------------------------------------------------------------- */
/* Determina si la cadena de caracteres especificada está compuesta solo por  */
/* los dígitos del 0 al 9.                                                    */
/* -------------------------------------------------------------------------- */
CREATE OR REPLACE FUNCTION pa_es_digito (TEXT) RETURNS BOOLEAN AS
   'SELECT $1 ~ ''^(-)?[0-9]+$'' AS resultado;'
LANGUAGE SQL;