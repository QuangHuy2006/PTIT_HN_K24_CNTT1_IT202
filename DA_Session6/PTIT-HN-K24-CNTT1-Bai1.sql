create database session6_bai1;
use session6_bai1;
create table Customer(
	customer_id int auto_increment primary key,
    full_name varchar(255) not null,
    city varchar(255)
);
create table Orders(
	order_id int auto_increment primary key,
    customer_id int,
    order_date date default(current_date()),
    status enum('pending','completed','cancelled'),
    foreign key(customer_id) references
    Customer(customer_id)
);
INSERT INTO Customer (full_name, city) VALUES
('Nguyễn Văn An', 'Hà Nội'),
('Trần Thị Bình', 'TP HCM'),
('Lê Quốc Cường', 'Đà Nẵng'),
('Phạm Minh Đức', 'Hải Phòng'),
('Hoàng Thu Trang', 'Cần Thơ');
INSERT INTO Orders (customer_id, order_date, status) VALUES
(1, '2025-01-01', 'pending'),
(2, '2025-01-02', 'completed'),
(3, '2025-01-03', 'cancelled'),
(5, '2025-01-05', 'completed'),
(1, '2025-01-06', 'completed');
select g1.order_id, g2.full_name
from Orders g1
join Customer g2 on g2.customer_id = g1.customer_id;

select g2.customer_id, g1.full_name, count(*) 'So hang'
from Orders g2
join Customer g1 on g1.customer_id = g2.customer_id
group by g2.customer_id, g1.full_name;

select g2.customer_id, g1.full_name, count(*) 'So hang'
from Orders g2
join Customer g1 on g1.customer_id = g2.customer_id
group by g2.customer_id, g1.full_name
having count(*) >= 1
