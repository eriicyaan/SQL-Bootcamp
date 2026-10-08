-- SESSION 1 ---
BEGIN TRANSACTION; -- Начало транзакции

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Select таблицы pizzeria

UPDATE pizzeria
SET rating = 4.0
WHERE name = 'Pizza Hut'; -- Обновление рейтинга на 4 в таблице pizzeria

COMMIT; -- Коммит транзакции


--- SESSION 2 ---
BEGIN TRANSACTION; -- Начало транзакции

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Select таблицы pizzeria

UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut'; -- Обновление рейтинга на 4 в таблице pizzeria

COMMIT; -- Коммит транзакции


-- В итоге у нас lost update, т.к уровень изолированности транзакции - read commited 