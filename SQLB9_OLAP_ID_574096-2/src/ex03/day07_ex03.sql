SELECT  name,
        SUM(count) AS total_count
FROM (
    SELECT *
    FROM (
        SELECT  pz.name AS name, 
                COUNT(pz.name) AS count
        FROM pizzeria pz
        JOIN menu m
            ON m.pizzeria_id = pz.id
        JOIN person_order po
            ON po.menu_id = m.id
        GROUP BY pz.name
    )

    UNION ALL

    SELECT *
    FROM (
        SELECT  pz.name AS name, 
                COUNT(pz.name) AS count
        FROM pizzeria pz
        JOIN person_visits pv
            ON pv.pizzeria_id = pz.id
        GROUP BY pz.name
    )
)
GROUP BY name
ORDER BY total_count DESC, name ASC;