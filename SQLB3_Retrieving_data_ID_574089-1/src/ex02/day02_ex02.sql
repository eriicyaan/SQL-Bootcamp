select 	coalesce(p.name, '-') as person_name,
		coalesce(visit_date, null) as visit_date,
		coalesce(pz.name, '-') as pizzeria_name
from person p
full join (
	select *
	from person_visits
	where visit_date between '2022-01-01' and '2022-01-03'
) pv
	on pv.person_id = p.id
full join pizzeria pz
	on pz.id = pv.pizzeria_id
order by person_name, visit_date, pizzeria_name;
