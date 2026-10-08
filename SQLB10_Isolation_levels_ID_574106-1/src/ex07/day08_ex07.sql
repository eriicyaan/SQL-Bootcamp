--- SESSION 1 ---

BEGIN; -- Начало транзакции
UPDATE pizzeria SET rating = 4 WHERE id = 10; -- Обновляем рейтинг для пицерии с id = 10
UPDATE pizzeria SET rating = 3 WHERE id = 11; -- Обновляем рейтинг для пицерии с id = 11 после обновления рейтинга с id = 11 во 2 сессии
COMMIT; -- Вместо commit мы видим rollback данной транзакции


--- SESSION 2 ---
BEGIN; -- Начало транзакции
UPDATE pizzeria SET rating = 5 WHERE id = 11; -- Обновляем рейтинг для пицерии с id = 11
UPDATE pizzeria SET rating = 5 WHERE id = 10; -- Обновляем рейтинг для пицерии с id = 10
COMMIT; -- Коммит транзакции после автоматического Rollback первой транзакции