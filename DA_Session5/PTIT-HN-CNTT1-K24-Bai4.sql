create database session5;
use session5;


create table products(
	product_id int primary key,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2),
    stock int,
    sold_quantity int,
    status ENUM('active','inactive')
);

insert into products (product_id, product_name, price, stock, sold_quantity, status) values
(1, 'Laptop Dell', 36363636.00, 10, 5, 'active'),
(2, 'Laptop HP', 18181818.00, 8, 3, 'active');


select * from products 
order by sold_quantity desc
limit 10;
select * from products
order by sold_quantity desc
limit 5 offset 10;
select * from products
where price < 2000000
order by sold_quantity desc;