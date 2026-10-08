select name
from person p
join person_order po
	on po.person_id = p.id
join menu m
	on po.menu_id = m.id
where gender='female'
	and (pizza_name like 'cheese%' or pizza_name like 'pepperoni%')
group by name
having count(name) = 2
order by name;