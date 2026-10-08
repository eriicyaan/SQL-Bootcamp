
INSERT INTO menu
VALUES ((SELECT max(id) FROM menu) + 1, 2, 'sicilian pizza', 900);


SELECT count(*) = 1 AS CHECK
 FROM menu
 WHERE id = 20
   AND pizzeria_id = 2
   AND pizza_name = 'sicilian pizza'
   AND price = 900