-- Составь запрос SELECT, который вернет имена людей и названия пиццерий
-- на основе таблицы person_visits с датами посещений
-- в период с 7 по 9 января 2022 года (включительно),
-- используя внутренний запрос в части FROM.

select
	(select name from person p where p.id = pv.person_id) as person_name,
	(select name from pizzeria pz where pz.id = pv.pizzeria_id) as pizzeria_name
from (
	select person_id, pizzeria_id from person_visits
	where visit_date between '2022-01-07' and '2022-01-09'
) as pv
order by person_name asc, pizzeria_name desc;