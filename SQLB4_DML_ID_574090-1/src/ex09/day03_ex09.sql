INSERT INTO person_visits
VALUES (
    (SELECT max(id) FROM person_visits) + 1, -- 20
    (SELECT id FROM person WHERE name='Denis'), -- 4
    (SELECT id FROM pizzeria WHERE name='Dominos'), -- 2
    '2022-02-24'
    ),
    (
    (SELECT max(id) FROM person_visits) + 2, -- 21
    (SELECT id FROM person WHERE name='Irina'), -- 6
    (SELECT id FROM pizzeria WHERE name='Dominos'), -- 2
    '2022-02-24'
    );

SELECT count(*)=2 AS CHECK
 FROM person_visits
 WHERE visit_date = '2022-02-24'
   AND person_id IN (6, 4)
   AND pizzeria_id = 2;