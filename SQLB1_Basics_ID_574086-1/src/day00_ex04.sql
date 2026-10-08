-- Составь запрос SELECT, который вернет одно вычисляемое поле
-- с именем person_information в виде одной строки, как показано в примере:
-- Anna (age:16,gender:'female',address:'Moscow')
-- В конце добавь сортировку по этому вычисляемому полю в порядке возрастания.
-- Обрати особое внимание на правильное использование кавычек в формуле!

select 
	(name || ' (age:' || age || ',gender:''' || gender || ''',address:''' || address || ''')') as person_information
from person
order by person_information;
