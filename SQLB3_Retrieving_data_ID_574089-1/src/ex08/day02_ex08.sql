select p.name
from person p
join person_order po
	on po.person_id = p.id
join menu m
	on po.menu_id = m.id
where gender='male'
	and (address='Moscow' or address='Samara')
	and (pizza_name like 'mushroom%' or pizza_name like 'pepperoni%')
order by name desc;