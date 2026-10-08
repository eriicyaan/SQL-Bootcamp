--- SESSION 1 --- 

BEGIN; -- Начало транзакции
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Меняем уровень изолированности транзакции

SELECT SUM(rating) FROM pizzeria; -- Select на таблицу pizzeria. Значение - 26.9

SELECT SUM(rating) FROM pizzeria; -- Select на таблицу pizzeria, после коммита транзакции во второй сесии. Значение - 26.9

COMMIT; -- Коммит текущей транзакции

SELECT SUM(rating) FROM pizzeria; -- Select на таблицу pizzeria. Значение - 30.9


--- SESSION 2 ---
BEGIN; -- Начало транзакции
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Меняем уровень изолированности транзакции

INSERT INTO pizzeria(id, name, rating) VALUES (11, 'Kazan Pizza 2', 4); -- Вставка записи в таблицу pizzeria
COMMIT; -- Коммит транзакции

SELECT SUM(rating) FROM pizzeria; -- Select на таблицу pizzeria. Значение - 30.9
