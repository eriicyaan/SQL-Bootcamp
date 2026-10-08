DROP FUNCTION fnc_persons_male();
DROP FUNCTION fnc_persons_female();

CREATE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female') RETURNS SETOF person
LANGUAGE SQL
AS $$
    SELECT * FROM person WHERE gender = pgender;
$$;



select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();