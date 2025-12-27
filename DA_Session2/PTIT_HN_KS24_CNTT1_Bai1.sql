create database k24_cntt1_session02;
use k24_cntt1_session02;
create table class(
	class_id int auto_increment primary key,
    class_name varchar(20) unique not null,
    class_year int not null,
    student_id int not null,
    foreign key(student_id) references
    student(student_id)
);
create table student(
	student_id int auto_increment primary key,
    student_name varchar(30) unique not null,
    date_of_birth date not null,
    class_id int not null unique,
    foreign key(class_id) references
    class(class_id)
) 