select m.pizza_name,
		pz.name as pizzeria_name
from pizzeria pz
join menu m
	on m.pizzeria_id = pz.id
join person_order po
	on po.menu_id = m.id
join person p
	on p.id = po.person_id
where p.name = 'Anna' or p.name = 'Denis'
order by pizza_name, pizzeria_name;