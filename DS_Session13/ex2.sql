create database ex2_ss13;
use ex2_ss13;
set foreign_key_checks = 0;
create table users (
	user_id int auto_increment primary key,
    username varchar(50) not null unique,
    email varchar(50) not null unique,
    created_at date,
    follower_count int default 0,
    post_count int default 0
);

create table posts(
	post_id int auto_increment primary key,
    user_id int ,
    content text,
    created_at datetime,
    like_count int default 0,
    foreign key (user_id) references users(user_id)
);

create table likes(
	like_id INT PRIMARY KEY auto_increment,
    user_id INT,
    post_id INT,
    liked_at DATETIME default(current_time()),
    foreign key(user_id) references
    users(user_id),
    foreign key(post_id) references
    posts(post_id)
); 

INSERT INTO users (username, email, created_at) VALUES
('alice', 'alice@example.com', '2025-01-01'),
('bob', 'bob@example.com', '2025-01-02'),
('charlie', 'charlie@example.com', '2025-01-03');

INSERT INTO posts (user_id, content, created_at) VALUES
(1, 'Hello world from Alice!', '2025-01-10 10:00:00'),
(1, 'Second post by Alice', '2025-01-10 12:00:00'),
(2, 'Bob first post', '2025-01-11 09:00:00'),
(3, 'Charlie sharing thoughts', '2025-01-12 15:00:00');

INSERT INTO likes (user_id, post_id, liked_at) VALUES
(2, 1, '2025-01-10 11:00:00'),
(3, 1, '2025-01-10 13:00:00'),
(1, 3, '2025-01-11 10:00:00'),
(3, 4, '2025-01-12 16:00:00');

delimiter $$
create trigger  trigger_AFTER_INSERT 
after insert on likes
for each row
begin
	update posts set like_count = like_count + 1
    where post_id = new.post_id;
end $$
delimiter ;

delimiter $$
create trigger  trigger_AFTER_DELETE 
after delete on likes
for each row
begin
	update posts set like_count = like_count - 1
    where post_id = old.post_id;
end $$
delimiter ;

delimiter //
create trigger trigger_AFTER_INSERT 
after insert on posts
for each row
begin
	update users set post_count = post_count +1
    where user_id = new.user_id;
end //
delimiter ;

delimiter //
create trigger trigger_AFTER_DELETE
after delete on posts
for each row
begin
	update users set post_count = post_count -1
    where user_id = old.user_id;
end //
delimiter ;

create or replace view user_statistics as
select  u.user_id, u.username, u.post_count, p.like_count
from users u
join posts p on p.user_id = u.user_id;

INSERT INTO likes (user_id, post_id, liked_at) VALUES (2, 4, NOW());

SELECT * FROM posts WHERE post_id = 4;

SELECT * FROM user_statistics;