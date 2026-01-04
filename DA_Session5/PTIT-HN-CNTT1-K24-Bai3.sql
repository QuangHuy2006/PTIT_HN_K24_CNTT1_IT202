create database session5;
use session5;

create table orders (
	order_id int ,
    customer_id int ,
    total_amount decimal(10,2) ,
    order_date date,
    status enum('pending' , 'completed' , 'cancelled')
);

insert into orders (order_id, customer_id, total_amount, order_date, status) VALUES
(1, 1, 3636363636.00, '2025-01-05', 'completed'),
(2, 2, 1818181818.00, '2025-01-06', 'pending');


select * from orders where status = 'completed';
select * from orders where total_amount > 5000000;
select * from orders
order by  order_date desc
limit 5;
select * from orders where status = 'completed' 
order by total_amount desc;