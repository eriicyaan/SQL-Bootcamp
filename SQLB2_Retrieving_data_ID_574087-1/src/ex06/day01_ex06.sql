SELECT order_date as action_date,
		(SELECT name from person where person.id = person_id) as person_name
FROM person_order
INTERSECT
SELECT visit_date as action_date,
		(SELECT name from person where person.id = person_id) as person_name
FROM person_visits
order by action_date, person_name desc;