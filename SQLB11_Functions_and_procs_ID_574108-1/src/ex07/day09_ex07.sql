CREATE FUNCTION func_minimum(arr NUMERIC[]) RETURNS NUMERIC
LANGUAGE SQL
AS $$
    SELECT MIN(val) FROM unnest(arr) val;
$$;



SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);