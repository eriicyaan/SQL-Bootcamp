--- SESSION 1 --- 

BEGIN; -- Начало транзакции
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- Меняем уровень изолированности транзакции

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Select на таблицу pizzeria. Значение - 3.6

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Select на таблицу pizzeria, после коммита транзакции во второй сесии. Значение - 3.6

COMMIT; -- Коммит текущей транзакции

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Select на таблицу pizzeria. Значение - 3.0


--- SESSION 2 ---
BEGIN; -- Начало транзакции
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- Меняем уровень изолированности транзакции

UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut'; -- Обновление поля у таблицы pizzeria
COMMIT; -- Коммит транзакции

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Select на таблицу pizzeria. Значение - 3.0
