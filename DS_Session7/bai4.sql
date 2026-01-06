create database ss7_b4;
use ss7_b4;
create table Customers(
	customer_id int auto_increment primary key,
    customer_name varchar(255) not null,
    customer_email varchar(255) not null unique
);
create table Orders(
	order_id int auto_increment primary key,
    customer_id int,
    order_date date default(current_date()),
    total_amount decimal(10,2)
);
-- Dữ liệu bảng Customers
INSERT INTO Customers (customer_name, customer_email) VALUES
('Nguyễn Văn An', 'an.nguyen@gmail.com'),
('Trần Thị Bình', 'binh.tran@gmail.com'),
('Lê Hoàng Cường', 'cuong.le@gmail.com'),
('Phạm Minh Đức', 'duc.pham@gmail.com'),
('Vũ Thị Hạnh', 'hanh.vu@gmail.com'),
('Đặng Quốc Khánh', 'khanh.dang@gmail.com'),
('Bùi Thanh Long', 'long.bui@gmail.com');

-- Dữ liệu bảng Orders
INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2025-12-01', 1500000.00),
(2, '2025-12-02', 2350000.50),
(3, '2025-12-03', 890000.00),
(1, '2025-12-04', 420000.75),
(4, '2025-12-05', 3100000.00),
(5, '2025-12-06', 1250000.00),
(6, '2025-12-07', 560000.00);
-- Danh sách khách hàng đã đặt đơn
select customer_id, count(*)
from Orders
where customer_id in (select customer_id from Customers)
group by customer_id
