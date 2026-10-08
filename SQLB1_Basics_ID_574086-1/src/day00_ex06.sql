-- Используй конструкцию SQL из Задания 05 и добавь в оператор SELECT
-- новый вычисляемый столбец с именем check_name.
-- В этом столбце реализуй проверку по следующему псевдокоду:

-- if (person_name == 'Denis'), вернуть true,
-- иначе вернуть false.

select 
	(select name from person as p where person_id = p.id),
	(select name from person as p where person_id = p.id) = 'Denis' as check_name
from person_order
where (menu_id = 13 or menu_id = 14 or menu_id = 18) and order_date='2022-01-07';
