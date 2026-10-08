-- SESSION 1 ---
BEGIN TRANSACTION; -- Начало транзакции
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Меняем уровень изолированности транзакции

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Select таблицы pizzeria

UPDATE pizzeria
SET rating = 4.0
WHERE name = 'Pizza Hut'; -- Обновление рейтинга на 4 в таблице pizzeria

COMMIT; -- Коммит транзакции


--- SESSION 2 ---
BEGIN TRANSACTION; -- Начало транзакции
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Меняем уровень изолированности транзакции


SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Select таблицы pizzeria

UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut'; -- Обновление рейтинга на 4 в таблице pizzeria


-- Сразу же после Update, получем ошибку, из за того, что уже кто то поменял значение нашей записи(session1).
-- Таким образом проблема lost update - решена