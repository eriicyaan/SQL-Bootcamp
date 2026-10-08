SELECT pz.name as pizzeria_name
FROM pizzeria pz
JOIN person_visits pv
    ON pv.pizzeria_id = pz.id
JOIN person p
    ON p.id = pv.person_id
LEFT JOIN person_order po
    ON po.person_id = p.id
    AND po.menu_id IN (SELECT id FROM menu WHERE pizzeria_id = pz.id)
WHERE p.name = 'Andrey' AND po.menu_id IS NULL;
