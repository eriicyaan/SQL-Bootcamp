--- SESSION 1 ---
BEGIN TRANSACTION; -- Начало транзакции

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Select таблицы

UPDATE pizzeria
SET rating = 5.0
WHERE name = 'Pizza Hut'; -- Обновление 

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Select таблицы

COMMIT; -- Коммит транзакции



--- SESSION 2 ---
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Select таблицы до коммита

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Select таблицы после коммита