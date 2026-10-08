select m.pizza_name,
		pz.name as pizzeria_name,
		price
from pizzeria pz
full join menu m
	on pz.id = m.pizzeria_id
where pizza_name like 'pepperoni%' or pizza_name like 'mushroom%'
order by pizza_name, pizzeria_name;