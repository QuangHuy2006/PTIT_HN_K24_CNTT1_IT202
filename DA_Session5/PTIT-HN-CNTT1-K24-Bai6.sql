create database session5;
use session5;

create table Products(
	product_id int primary key,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2),
    stock int,
    sold_quantity int,
    status ENUM('active','inactive')
);

insert into Products (product_id, product_name, price, stock, sold_quantity, status) values
(1, 'Laptop Dell Inspiron', 15000000.00, 10, 5, 'active'),
(2, 'Laptop HP Pavilion', 16500000.00, 8, 3, 'active'),
(3, 'Laptop Asus Vivobook', 14000000.00, 12, 6, 'active');
    select * from products
    where status = 'active' and price between 1000000 and 3000000
    order by price asc
    limit 10 ;
	select * from products
    where status = 'active' and price between 1000000 and 3000000
    order by price asc
    limit 10 offset 10;