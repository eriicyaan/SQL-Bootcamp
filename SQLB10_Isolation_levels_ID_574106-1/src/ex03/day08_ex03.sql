--- SESSION 1 --- 

BEGIN TRANSACTION; -- Начало транзакции
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Select на таблицу pizzeria. Значение - 4

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Select на таблицу pizzeria, после коммита транзакции во второй сесии. Значение - 3.6

COMMIT; -- Коммит текущей транзакции

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Select на таблицу pizzeria. Значение - 3.6


--- SESSION 2 ---
BEGIN; -- Начало транзакции

UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; -- Обновление поля у таблицы pizzeria
COMMIT; -- Коммит транзакции

SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Select на таблицу pizzeria. Значение - 3.6
