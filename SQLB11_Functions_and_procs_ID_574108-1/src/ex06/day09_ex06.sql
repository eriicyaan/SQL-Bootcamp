CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson VARCHAR DEFAULT 'Dmitriy',
    pprice INT DEFAULT 500,
    pdate DATE DEFAULT '2022-01-08') RETURNS TABLE(pizzeria_name VARCHAR)
AS $$
    BEGIN
        RETURN QUERY
        SELECT pz.name
        FROM pizzeria pz
        JOIN person_visits pv
            ON pv.pizzeria_id = pz.id
        JOIN person p
            ON p.id = pv.person_id
        JOIN menu m
            ON m.pizzeria_id = pz.id
        WHERE p.name = pperson AND m.price < pprice AND pv.visit_date = pdate;
    END;
$$
LANGUAGE PLPGSQL;


select *  
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *  
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');