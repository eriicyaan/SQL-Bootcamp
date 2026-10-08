--- SESSION 1 --- 

BEGIN; -- Начало транзакции

SELECT SUM(rating) FROM pizzeria; -- Select на таблицу pizzeria. Значение - 21.9

SELECT SUM(rating) FROM pizzeria; -- Select на таблицу pizzeria, после коммита транзакции во второй сесии. Значение - 26.9

COMMIT; -- Коммит текущей транзакции

SELECT SUM(rating) FROM pizzeria; -- Select на таблицу pizzeria. Значение - 26.9


--- SESSION 2 ---
BEGIN; -- Начало транзакции

INSERT INTO pizzeria(id, name, rating) VALUES (10, 'Kazan Pizza', 5); -- Вставка записи в таблицу pizzeria
COMMIT; -- Коммит транзакции

SELECT SUM(rating) FROM pizzeria; -- Select на таблицу pizzeria. Значение - 26.9
