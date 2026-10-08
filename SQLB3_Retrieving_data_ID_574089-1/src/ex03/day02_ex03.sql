with date_series as (
    select day::date as day
    from generate_series(
	'2022-01-01'::date,
	'2022-01-10'::date,
	interval '1 day'
    ) as d(day)
)

select ds.day
from date_series as ds
left join person_visits pv
	on pv.visit_date = ds.day
	and (pv.person_id = 1 or pv.person_id = 2)
where pv.id is null
order by ds.day;