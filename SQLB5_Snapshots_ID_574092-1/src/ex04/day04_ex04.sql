CREATE VIEW R AS 
SELECT person_id
FROM person_visits
WHERE visit_date='2022-01-02';

CREATE VIEW S AS 
SELECT person_id
FROM person_visits
WHERE visit_date='2022-01-06';


CREATE VIEW v_symmetric_union AS (
SELECT * FROM (
    SELECT * FROM R
    EXCEPT
    SELECT * FROM S
)

UNION
SELECT * FROM (
    SELECT * FROM S
    EXCEPT
    SELECT * FROM R
)
ORDER BY person_id
);


SELECT *
FROM v_symmetric_union;