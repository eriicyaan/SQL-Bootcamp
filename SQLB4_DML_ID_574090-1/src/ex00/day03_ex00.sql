SELECT  m.pizza_name,
        m.price,
        pz.name as pizzeria_name,
        pv.visit_date
FROM menu m
INNER JOIN pizzeria pz
    ON m.pizzeria_id = pz.id
INNER JOIN person_visits pv
    ON pv.pizzeria_id = m.pizzeria_id
INNER JOIN person p
    ON p.id = pv.person_id
INNER JOIN person_order po
    ON po.person_id = p.id
WHERE   p.name = 'Kate'
        AND m.price BETWEEN 800 and 1000
ORDER BY m.pizza_name, m.price, pizzeria_name;

