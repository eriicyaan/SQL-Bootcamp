select p.name as person_name, m.pizza_name, pz.name as pizzeria_name
from person_order as po
inner join person as p
	on po.person_id = p.id
inner join menu as m
	on po.menu_id = m.id
inner join pizzeria as pz
	on m.pizzeria_id = pz.id
order by person_name, pizza_name, pizzeria_name;