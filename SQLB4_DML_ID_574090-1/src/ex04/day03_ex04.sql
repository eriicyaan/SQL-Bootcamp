WITH pizzeria_gender_visits AS (
    SELECT
        pz.name AS pizzeria_name,
        COUNT(CASE WHEN p.gender = 'male' THEN 1 END) AS male_cnt,
        COUNT(CASE WHEN p.gender = 'female' THEN 1 END) AS female_cnt
    FROM pizzeria pz
    LEFT JOIN menu m
        ON m.pizzeria_id = pz.id
    LEFT JOIN person_order po
        ON po.menu_id = m.id
    LEFT JOIN person p
        ON p.id = po.person_id
    GROUP BY pz.name
)
SELECT pizzeria_name    
FROM pizzeria_gender_visits
WHERE male_cnt > 0 AND female_cnt = 0   -- только мужчины

UNION

SELECT pizzeria_name
FROM pizzeria_gender_visits
WHERE female_cnt > 0 AND male_cnt = 0   -- только женщины

ORDER BY pizzeria_name;