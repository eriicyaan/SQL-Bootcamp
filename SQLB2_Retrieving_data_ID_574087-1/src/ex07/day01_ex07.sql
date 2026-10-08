select order_date,
	p.name || ' (age:' || p.age || ')' as person_information
from person_order as po
inner join person as p
	on p.id = po.person_id
order by order_date, person_information;