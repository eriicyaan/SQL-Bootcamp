CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pz.name AS pizzeria_name
FROM pizzeria pz
JOIN person_visits pv
	ON pv.pizzeria_id = pz.id
JOIN person p
	ON pv.person_id = p.id
JOIN menu m 
	ON m.pizzeria_id = pz.id
WHERE visit_date = '2022-01-08'
	AND p.name='Dmitriy'
	AND price < 800;


SELECT *
FROM mv_dmitriy_visits_and_eats;