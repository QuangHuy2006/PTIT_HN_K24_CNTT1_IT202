create database session6_bai3;
use session6_bai3;
create table Customer(
	customer_id int auto_increment primary key,
    full_name varchar(255) not null,
    city varchar(255)
);
create table Orders(
	order_id int auto_increment primary key,
    customer_id int,
    order_date date default(current_date()),
    total_amount decimal(10,2),
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
INSERT INTO Orders (customer_id, order_date, status, total_amount) VALUES
(1, '2025-01-01', 'pending', 36363636.00),
(2, '2025-01-02', 'completed',18181818.00),
(3, '2025-01-03', 'cancelled', 1111111.00),
(5, '2025-01-05', 'completed', 2222222.00),
(1, '2025-01-06', 'completed', 3333333.00),
(2, '2025-01-03', 'pending', 12345678.00);

select g1.order_date, sum(total_amount) as 'Tong tien'
from Orders g1
group by g1.order_date;

select g1.order_date, sum(total_amount) as 'Tong tien', count(*) as 'So Don Hang'
from Orders g1
group by g1.order_date;

select g1.order_date, sum(total_amount) as 'Tong tien', count(*) as 'So Don Hang'
from Orders g1
group by g1.order_date
having sum(total_amount) > 10000000