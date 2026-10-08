select order_date,
	p.name || ' (age:' || p.age || ')' as person_information
from (
	select order_date, person_id as id
	from person_order
) as po
natural join person as p
order by order_date, person_information;
