create database session5;
use session5;

create table Products(
	product_id int auto_increment primary key,
    product_name varchar(255) ,
    price decimal(10,2) ,
    stock int ,
    status enum('active' , 'inactive' )
);

INSERT INTO products (product_id, product_name, price, stock, status) VALUES
(1, 'Laptop', 15000000.00, 10, 'active'),
(2, 'Chuột', 350000.00, 50, 'active'),
(3, 'Bàn phím', 2200000.00, 20, 'active');

select * from Products;
select * from Products where status = 'active';
select * from Products where price > 1000000;
select * from Products where status = 'active' 
order by price asc;