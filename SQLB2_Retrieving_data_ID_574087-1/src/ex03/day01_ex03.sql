SELECT order_date as action_date, person_id
FROM person_order
INTERSECT
SELECT visit_date as action_date, person_id
FROM person_visits
order by action_date, person_id desc;