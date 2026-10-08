SELECT  p.name,
        m.pizza_name,
        m.price,
        ROUND((m.price * (1 - (SELECT discount
                    FROM person_discounts
                    WHERE person_id = p.id
                    AND pizzeria_id = pz.id
                    ) * 0.01))) as discount,
        pz.name
FROM person_order po
JOIN person p
    ON p.id = po.person_id
JOIN menu m
    ON m.id = po.menu_id
JOIN pizzeria pz
    ON pz.id = m.pizzeria_id
ORDER BY p.name, m.pizza_name;