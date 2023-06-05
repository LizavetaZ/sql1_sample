--  Используя операторы языка SQL, создайте таблицу “sales”. 
-- Заполните ее данными. Справа располагается рисунок к первому заданию.
DROP DATABASE IF EXISTS lesson_2;
CREATE DATABASE lesson_2;
USE lesson_2;

DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
	id SERIAL PRIMARY KEY,
	order_date DATE NOT NULL,
	count_product  INT
);
	
INSERT INTO `sales` (order_date, count_product)
VALUES 
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-04', 341);

-- Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : меньше 100  
-- Маленький заказ от 100 до 300 -Средний заказ больше 300  -Большой заказ
SELECT 
	id AS 'id заказа',
	CASE 
		WHEN count_product < 100 THEN 'Маленький заказ'
		WHEN count_product BETWEEN 100 AND 300 THEN 'Средний заказ'
		WHEN count_product > 300 THEN 'Большой заказ'
        ELSE 'Не определено'
	END AS 'Тип заказа'	
FROM sales;

-- Создайте таблицу “orders”, заполните ее значениями
-- Выберите все заказы. В зависимости от поля order_statusвыведите столбецfull_order_status: 
-- OPEN –«Order is in open state»; CLOSED -«Order isclosed»; CANCELLED -«Order is cancelled»

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
	employee_id VARCHAR(56) NOT NULL UNIQUE,
	amount  DOUBLE,
    order_status text
);

INSERT INTO `orders` (employee_id, amount, order_status)
VALUES 
('e03', 15.00, 'OPEN'),
('e01', 25.20, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

SELECT 
	id AS 'id заказа',
	CASE order_status
		WHEN 'OPEN' THEN '«Order is in open state»'
		WHEN 'CLOSED' THEN '«Order isclosed»'
		WHEN 'CANCELLED' THEN '«Order is cancelled»'
        ELSE 'Не определено'
	END AS 'Тип заказа'	
FROM orders;

-- Чем 0 отличается от NULL?
/*NULL отличается от 0 тем, что NULL не представляет никакое значение, позволяет описывать отсутствие данных,
в то время как 0 представляет арифметическое значение нуля.*/




