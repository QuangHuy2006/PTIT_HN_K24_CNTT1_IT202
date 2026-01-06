create database ss7_b2;
use ss7_b2;
create table Products(
	product_id int auto_increment primary key,
    product_name varchar(255) not null,
    product_email varchar(255) not null unique
);
create table Order_items(
	order_id int auto_increment primary key,
    product_id int,
    quantity int not null,
    foreign key(product_id) references
    Products(product_id)
);
-- Dữ liệu bảng Products
INSERT INTO Products (product_name, product_email) VALUES
('Laptop Dell Inspiron', 'dell.inspiron@shop.com'),
('iPhone 15 Pro', 'iphone15@shop.com'),
('Samsung Galaxy S24', 'samsung.s24@shop.com'),
('Tai nghe Sony WH-1000XM5', 'sony.wh1000xm5@shop.com'),
('Chuột Logitech MX Master 3', 'logitech.mx3@shop.com'),
('Bàn phím Keychron K8', 'keychron.k8@shop.com'),
('Màn hình LG UltraGear 27"', 'lg.ultragear27@shop.com');

-- Dữ liệu bảng Order_items
INSERT INTO Order_items (product_id, quantity) VALUES
(1, 2),
(2, 1),
(3, 3),
(1, 1),
(4, 2),
(5, 5),
(6, 1);

select g2.product_id, g2.product_name, sum(quantity) as 'total'
from Order_items g1
left join Products g2 on g2.product_id = g1.product_id
group by g1.product_id;

select *
from Products
where product_id in (select product_id from Order_items)