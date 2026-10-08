WITH visits_by_gender AS (
    SELECT  pz.name pizzeria_name,
            COUNT(CASE WHEN p.gender = 'male' THEN 1 END) as male_cnt,
            COUNT(CASE WHEN p.gender = 'female' THEN 1 END) as female_cnt
    FROM pizzeria pz
    JOIN person_visits pv
        ON pv.pizzeria_id = pz.id
    JOIN person p
        ON p.id = pv.person_id
    GROUP BY pz.name
)

SELECT pizzeria_name
FROM visits_by_gender
WHERE male_cnt > female_cnt

UNION ALL

SELECT pizzeria_name
FROM visits_by_gender
WHERE female_cnt > male_cnt
ORDER BY pizzeria_name;
