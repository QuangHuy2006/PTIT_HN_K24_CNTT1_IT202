create database session5;
use session5;

create table orders(
	order_id int primary key,
    customer_id int,
    total_amount DECIMAL(10,2),
    order_date DATE , 
    status ENUM('pending', 'completed', 'cancelled')
);

insert into orders (order_id, customer_id, total_amount, order_date, status) values
(1, 1, 36363636.00, '2025-01-01', 'completed'),
(2, 2, 18181818.00, '2025-01-02', 'pending');

select * from orders
where status <> cancelled
order by order_date desc
limit 5;
select * from orders
where status <> cancelled
order by order_date desc
limit 5 offset 5;
select * from orders
where status <> cancelled
order by order_date desc
limit 5 offset 10;