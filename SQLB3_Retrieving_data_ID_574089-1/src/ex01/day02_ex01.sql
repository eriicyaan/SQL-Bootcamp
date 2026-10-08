select day::date
from generate_series(
	'2022-01-01'::date,
	'2022-01-10'::date,
	interval '1 day'
) as d(day)
left join person_visits pv
	on pv.visit_date = d.day
	and (pv.person_id = 1 or pv.person_id = 2)
where pv.id is null
order by day;