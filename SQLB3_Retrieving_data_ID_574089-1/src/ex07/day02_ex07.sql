select pz.name as pizzeria_name
from pizzeria pz
join person_visits pv
	on pv.pizzeria_id = pz.id
join person p
	on pv.person_id = p.id
join menu m 
	on m.pizzeria_id = pz.id
where visit_date = '2022-01-08'
	and p.name='Dmitriy'
	and price < 800;