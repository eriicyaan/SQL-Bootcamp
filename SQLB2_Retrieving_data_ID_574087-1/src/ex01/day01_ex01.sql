select object_name
from (
	select name as object_name
	from person
	order by object_name)
union all
select object_name
	from (
	select pizza_name as object_name
	from menu
	order by object_name);