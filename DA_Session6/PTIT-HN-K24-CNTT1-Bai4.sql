create database session6_bai4;
use session6_bai4;
create table Products(
	product_id int auto_increment primary key,
    product_name varchar(255) not null,
    price decimal(10,2) not null
);
create table Order_items(
	order_id int auto_increment primary key,
    product_id int,
    quantity int not null,
    foreign key(product_id) references
    Products(product_id)
);
INSERT INTO Products (product_name, price) VALUES
('Bàn phím cơ', 1200000.00),
('Chuột gaming', 450000.00),
('Tai nghe', 850000.00),
('Màn hình 24 inch', 3200000.00),
('Laptop văn phòng', 15000000.00);
INSERT INTO Order_items (product_id, quantity) VALUES
(1, 2),   
(2, 1),  
(3, 3),  
(1, 1),   
(5, 1);  

select g1.product_id, g2.product_name , sum(quantity) as 'Tong so don'
from Order_items g1
left join Products g2 on g2.product_id = g1.product_id
group by g1.product_id;

select g1.product_id, g2.product_name , sum(quantity * price) as 'Doanh thu'
from Order_items g1
left join Products g2 on g2.product_id = g1.product_id
group by g1.product_id;

select g1.product_id, g2.product_name , sum(quantity * price) as 'Doanh thu'
from Order_items g1
left join Products g2 on g2.product_id = g1.product_id
group by g1.product_id
having sum(quantity * price) > 5000000