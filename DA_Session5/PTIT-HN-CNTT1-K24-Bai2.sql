create database session5;
use session5;

create table customers (
	customer_id int auto_increment primary key,
    full_name varchar(255) not null,
    email varchar(255) unique,
    city varchar(255) ,
    status enum ('active' , 'inactive' )
);

insert into customers (customer_id, full_name, email, city, status) VALUES
(1, 'Nguyễn Đăng Quang', 'quangyeutuoi@gmail.com', 'Hà Nội', 'active'),
(2, 'Dương anime', 'toiyeuanime@gmail.com', 'TP. Hồ Chí Minh', 'active'),
(3, 'Quang', 'quangyeuthanhan@gmail.com', 'Cà Mau', 'active');

select * from customers;
select * from customers where city = 'TP. Hồ Chí Minh';
select * from customers where status = 'active ' and city = 'Hà Nội';
select * from customers order by full_name asc;