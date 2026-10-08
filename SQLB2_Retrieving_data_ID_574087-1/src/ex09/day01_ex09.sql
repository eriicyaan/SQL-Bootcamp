select * from pizzeria as p
where p.id not in (
	select pizzeria_id from person_visits
);


select * from pizzeria as p
where not exists (
	select pizzeria_id 
    from person_visits pv
    where pv.pizzeria_id = p.id
);
