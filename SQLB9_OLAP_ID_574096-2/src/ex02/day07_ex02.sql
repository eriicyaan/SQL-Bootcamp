SELECT *
FROM (
    SELECT  pz.name, 
            COUNT(pz.name) AS count,
            'order' AS action_type
    FROM pizzeria pz
    JOIN menu m
        ON m.pizzeria_id = pz.id
    JOIN person_order po
        ON po.menu_id = m.id
    GROUP BY pz.name
    ORDER BY action_type, count DESC
    LIMIT 3
)

UNION ALL

SELECT *
FROM (
    SELECT  pz.name, 
            COUNT(pz.name) AS count,
            'visit' AS action_type
    FROM pizzeria pz
    JOIN person_visits pv
        ON pv.pizzeria_id = pz.id
    GROUP BY pz.name
    ORDER BY action_type, count DESC
    LIMIT 3
);