-- 1 Создание таблицы users

create table users(
id integer primary key,
name varchar(100) not null,
email varchar(150) not null unique,
created_at timestamp default current_timestamp
);

insert into users(id, name, email, created_at) values 
(1, 'Иван Иванов', 'ivan@example.com', '2023-01-15 10:00:00'),
(2, 'Петр Петров', 'petr@example.com', '2023-02-10 11:00:00'),
(3, 'Сидор Сидоров', 'sidor@example.com', '2023-03-05 12:00:00'),
(4, 'Анна Аннова', 'anna@example.com', '2023-04-20 13:00:00'),
(5, 'Мария Морина', 'maria@example.com', '2023-05-25 14:00:00'),
(6, 'Дементий Деменьтев', 'dementiy@example.com', '2023-01-07 17:00:00');

-- таблица categories
create table categories(
id integer primary key,
name varchar(100) not null
);

INSERT INTO categories (id, name) values
(1, 'Электроника'),
(2, 'Одежда'),
(3, 'Книги'),
(4, 'Мебель'),
(5, 'Спорт');

-- таблица products
create table products(
id integer primary key,
name varchar(100) not null,
price numeric(10,2) not null,
category_id integer references categories(id)
);

INSERT INTO products (id, name, price, category_id) values
(1, 'Смартфон', 29999.99, 1),
(2, 'Ноутбук', 59999.99, 1),
(3, 'Футболка', 1999.99, 2),
(4, 'Джинсы', 4999.99, 2),
(5, 'Книга "SQL для начинающих"', 999.99, 3),
(6, 'Книга "Python для профессионалов"', 1499.99, 3),
(7, 'Диван', 29999.99, 4),
(8, 'Стул', 4999.99, 4),
(9, 'Велосипед', 19999.99, 5),
(10, 'Гантели', 2999.99, 5);

-- таблица orders
create table orders(
id integer primary key,
user_id integer references users(id),
status character(50) not null,
created_at timestamp default current_timestamp
);

INSERT INTO orders (id, user_id, status, created_at) VALUES
(1, 1, 'Оплачен', '2023-01-20 10:00:00'),
(2, 2, 'Ожидает оплаты', '2023-02-15 11:00:00'),
(3, 3, 'Доставлен', '2023-03-10 12:00:00'),
(4, 4, 'Оплачен', '2023-04-05 13:00:00'),
(5, 5, 'Ожидает оплаты', '2023-05-01 14:00:00'),
(6, 1, 'Доставлен', '2023-01-25 15:00:00'),
(7, 2, 'Оплачен', '2023-02-20 16:00:00'),
(8, 3, 'Ожидает оплаты', '2023-03-15 17:00:00'),
(9, 4, 'Доставлен', '2023-04-10 18:00:00'),
(10, 5, 'Оплачен', '2023-05-05 19:00:00'),
(11, 1, 'Ожидает оплаты', '2023-01-30 20:00:00'),
(12, 2, 'Доставлен', '2023-03-25 21:00:00'),
(13, 3, 'Оплачен', '2023-03-20 22:00:00'),
(14, 4, 'Ожидает оплаты', '2023-04-15 23:00:00'),
(15, 5, 'Доставлен', '2023-05-10 10:00:00'),
(16, 1, 'Оплачен', '2023-01-05 11:00:00'),
(17, 2, 'Ожидает оплаты', '2023-02-28 12:00:00'),
(18, 3, 'Доставлен', '2023-03-25 13:00:00'),
(19, 4, 'Оплачен', '2023-04-20 14:00:00'),
(20, 5, 'Ожидает оплаты', '2023-06-15 15:00:00');


-- таблица order_items
create table order_items(
id integer primary key,
order_id integer references orders(id),
product_id integer references products(id),
quantity integer not null
);

INSERT INTO order_items(id, order_id, product_id, quantity) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 3, 2),
(4, 2, 4, 1),
(5, 3, 5, 1),
(6, 3, 6, 1),
(7, 4, 7, 1),
(8, 4, 8, 2),
(9, 5, 9, 1),
(10, 5, 10, 1),
(11, 6, 1, 1),
(12, 6, 3, 1),
(13, 7, 2, 1),
(14, 7, 4, 1),
(15, 8, 5, 1),
(16, 8, 7, 1),
(17, 9, 6, 1),
(18, 9, 8, 1),
(19, 10, 9, 1),
(20, 10, 10, 1),
(21, 11, 1, 1),
(22, 11, 2, 1),
(23, 12, 3, 1),
(24, 12, 4, 1),
(25, 13, 5, 1),
(26, 13, 6, 1),
(27, 14, 7, 1),
(28, 14, 8, 1),
(29, 15, 9, 1),
(30, 15, 10, 1),
(31, 16, 1, 1),
(32, 16, 3, 1),
(33, 17, 2, 1),
(34, 17, 4, 1),
(35, 18, 5, 1),
(36, 18, 7, 1),
(37, 19, 6, 1),
(38, 19, 8, 1),
(39, 20, 9, 1),
(40, 20, 10, 1);

-- таблица payments
create table payments(
id integer primary key,
order_id integer references orders(id),
amount numeric (10,2) not null check (amount >= 0),
payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO payments (id, order_id, amount, payment_date) VALUES
(1, 1, 89999.98, '2023-01-20 10:05:00'),
(2, 2, 8999.97, NULL),
(3, 3, 2499.98, '2023-03-10 12:05:00'),
(4, 4, 39999.97, '2023-04-05 13:05:00'),
(5, 5, 22999.98, NULL),
(6, 6, 31999.98, '2023-01-25 15:05:00'),
(7, 7, 64999.98, '2023-02-20 16:05:00'),
(8, 8, 30999.98, NULL),
(9, 9, 6499.98, '2023-04-10 18:05:00'),
(10, 10, 22999.98, '2023-05-05 19:05:00'),
(11, 11, 89999.98, NULL),
(12, 12, 6999.98, '2023-02-25 21:05:00'),
(13, 13, 2499.98, '2023-03-20 22:05:00'),
(14, 14, 34999.98, NULL),
(15, 15, 22999.98, '2023-05-10 10:05:00'),
(16, 16, 31999.98, '2023-01-05 11:05:00'),
(17, 17, 64999.98, NULL),
(18, 18, 30999.98, '2023-03-25 13:05:00'),
(19, 19, 6499.98, '2023-04-20 14:05:00'),
(20, 20, 22999.98, NULL);


-- ### Задача 1 
-- Вывести ср суммарную стоимость товаров в заказе для каждой категории товаров
-- учитывать ток заказы, созд 2023 г март

SELECT 
    categories.name AS category_name,
    ROUND(AVG(order_total), 2) AS average_order_total
FROM (
    SELECT 
        orders.id AS order_id,
        products.category_id AS category_id,
        SUM(order_items.quantity * products.price) AS order_total
    FROM 
        orders
    JOIN 
        order_items ON orders.id = order_items.order_id
    JOIN 
        products ON order_items.product_id = products.id
    WHERE 
        orders.created_at >= '2023-03-01' AND orders.created_at < '2023-04-01'
    GROUP BY 
        orders.id, products.category_id
) AS order_totals
JOIN 
    categories ON order_totals.category_id = categories.id
GROUP BY 
    categories.name;


--- 2 Вывести топ-3 пользователей, которые потратили больше всего денег на оплаченные заказы. Учитывать только заказы со статусом "Оплачен".
-- В отдельном столбце указать, какое место пользователь занимает

-- вычислим сумму на заказы котрыую потратил каждый пользовательно
-- делаем внутр подзапрос 
SELECT 
    users.name AS user_name,
    SUM(order_items.quantity * products.price) AS total_spent
FROM 
    orders
JOIN 
    order_items ON orders.id = order_items.order_id
JOIN 
    products ON order_items.product_id = products.id
JOIN 
    users ON orders.user_id = users.id
WHERE 
    orders.status = 'Оплачен'
GROUP BY 
    users.id, users.name;


-- добавим ранги пользователям всем
-- у нас каждой строке присв номер и пол в табл по убыванию 
-- user_name, total_spent, user_rank
SELECT 
    user_name,
    total_spent,
    ROW_NUMBER() OVER (ORDER BY total_spent DESC) AS user_rank
    
FROM 
-- переписываем внутр подзапрос 1
(
    SELECT 
        users.name AS user_name,
        SUM(order_items.quantity * products.price) AS total_spent
    FROM 
        orders
    JOIN 
        order_items ON orders.id = order_items.order_id
    JOIN 
        products ON order_items.product_id = products.id
    JOIN 
        users ON orders.user_id = users.id
    WHERE 
        orders.status = 'Оплачен'
    GROUP BY 
        users.id, users.name
) AS user_spending;

-- выберем топ - 3 пользователя

SELECT 
    user_name,
    total_spent,
    user_rank

    -- переписываем шаг 2 (1/2 подзапросы)
FROM (
    SELECT 
        user_name,
        total_spent,
        ROW_NUMBER() OVER (ORDER BY total_spent DESC) AS user_rank
    FROM (
        SELECT 
            users.name AS user_name,
            SUM(order_items.quantity * products.price) AS total_spent
        FROM 
            orders
        JOIN 
            order_items ON orders.id = order_items.order_id
        JOIN 
            products ON order_items.product_id = products.id
        JOIN 
            users ON orders.user_id = users.id
        WHERE 
            orders.status = 'Оплачен'
        GROUP BY 
            users.id, users.name
    ) AS user_spending
) AS ranked_users
WHERE 
    user_rank <= 3;


-- ## Задание 3
-- Вывести количество заказов и общую 
-- сумму платежей по кол закаов по каждому месяцу в 2023 году.

 select 
 -- преобр дату в текст и определяем формат для года и месяца
to_char(orders.created_at, 'YYYY-MM') as month,
count (orders.id) as total_orders,
coalesce(SUM(payments.amount),0) as total_payments
from 
orders 
left join
payments on orders.id = payments.order_id
where 
orders.created_at >= '2023-01-01' and orders.created_at< '2024-01-01'
group by 
to_char(orders.created_at, 'YYYY-MM')
order by 
month;

--#Задание 4
--Вывести топ-5 товаров по количеству продаж, а также их долю в общем количестве продаж. 

   with product_sales as (
   select 
   products.name as product_name,
   sum(order_items.quantity) as total_sold
   from 
   order_items 
   join products on order_items.product_id = products.id
   group by
   products.id, products.name 
   ),
   -- узнаем общее кол-во проданных единиц
   total_sales as(
   select 
   sum(total_sold) as total
   from product_sales
   )
   select
   product_name,
   total_sold,
   round((total_sold / total_sales.total)* 100, 2) as 
   sales_percentage 
   from 
   product_sales,
   total_sales 
   order by 
   total_sold desc
   limit 5;
    
   -- #5 Вывести пользователей, общая сумма оплаченных заказов которых превышает 
-- среднюю сумму оплаченных заказов по всем пользователям.
    
  WITH user_spending AS (
    SELECT 
        users.name AS user_name,
        SUM(order_items.quantity * products.price) AS total_spent
    FROM 
        orders
    JOIN 
        order_items ON orders.id = order_items.order_id
    JOIN 
        products ON order_items.product_id = products.id
    JOIN 
        users ON orders.user_id = users.id
    WHERE 
        orders.status = 'Оплачен'
    GROUP BY 
        users.id, users.name
),
avg_spending AS (
    SELECT 
        AVG(total_spent) AS avg_total_spent
    FROM 
        user_spending
)
SELECT 
    user_name,
    total_spent
FROM 
    user_spending,
    avg_spending
WHERE 
    total_spent > avg_total_spent
ORDER BY 
    total_spent DESC;
  
 --#6 ейтинг товаров по количеству продаж в каждой категории
--Для каждой категории товаров вывести топ-3 товара по количеству проданных единиц. 
  WITH product_sales AS (
    SELECT 
        categories.name AS category_name,
        products.name AS product_name,
        SUM(order_items.quantity) AS total_sold,
        ROW_NUMBER() OVER (
            PARTITION BY categories.id 
            ORDER BY SUM(order_items.quantity) DESC
        ) AS rank
    FROM 
        order_items
    JOIN 
        products ON order_items.product_id = products.id
    JOIN 
        categories ON products.category_id = categories.id
    GROUP BY 
        categories.id, categories.name, products.id, products.name
)
SELECT 
    category_name,
    product_name,
    total_sold
FROM 
    product_sales
WHERE 
    rank <= 3
ORDER BY 
    category_name, total_sold DESC;

 
 --#7 Вывести категории товаров, которые принесли максимальную выручку 
--в каждом месяце первого полугодия 2023 года.

 WITH monthly_revenue AS (
    SELECT 
        TO_CHAR(orders.created_at, 'YYYY-MM') AS month,
        categories.name AS category_name,
        SUM(order_items.quantity * products.price) AS revenue,
        ROW_NUMBER() OVER (
            PARTITION BY TO_CHAR(orders.created_at, 'YYYY-MM')
            ORDER BY SUM(order_items.quantity * products.price) DESC
        ) AS rank
    FROM 
        orders
    JOIN 
        order_items ON orders.id = order_items.order_id
    JOIN 
        products ON order_items.product_id = products.id
    JOIN 
        categories ON products.category_id = categories.id
    WHERE 
        orders.created_at >= '2023-01-01' AND orders.created_at < '2023-07-01'
    GROUP BY 
        TO_CHAR(orders.created_at, 'YYYY-MM'), categories.id, categories.name
)
SELECT 
    month,
    category_name,
    revenue
FROM 
    monthly_revenue
WHERE 
    rank = 1
ORDER BY 
    month;
 
 --#8 
 --### Задача 8. Накопительная сумма платежей по месяцам
--Вывести накопительную сумму платежей по каждому месяцу в 2023 году. 
--Накопительная сумма должна рассчитываться нарастающим итогом. Подсказка: нужно понять, как работает ROWS BETWEEN,
--и какое ограничение используется по умолчанию для SUM BY

 WITH monthly_payments AS (
    SELECT 
        TO_CHAR(payments.payment_date, 'YYYY-MM') AS month,
        SUM(payments.amount) AS monthly_amount
    FROM 
        payments
    WHERE 
        payments.payment_date >= '2023-01-01' AND payments.payment_date < '2024-01-01'
    GROUP BY 
        TO_CHAR(payments.payment_date, 'YYYY-MM')
)
SELECT 
    month,
    monthly_amount,
    SUM(monthly_amount) OVER (
        ORDER BY month
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_amount
FROM 
    monthly_payments
ORDER BY 
    month;
 
 
 
 
 
 
 
 
 