SELECT  m.pizza_name,
        price,
        pz.name  
FROM menu m
LEFT JOIN pizzeria pz
    ON pz.id = m.pizzeria_id
LEFT JOIN person_order po
    ON po.menu_id = m.id
WHERE po.person_id IS NULL
ORDER BY m.pizza_name, price;