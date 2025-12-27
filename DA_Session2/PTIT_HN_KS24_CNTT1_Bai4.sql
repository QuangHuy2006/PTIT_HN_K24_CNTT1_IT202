create database k24_cntt1_session02;
use k24_cntt1_session02;
create table Subject(
	subject_id int auto_increment primary key,
    subject_name varchar(20) unique not null,
    credit_hours int not null CHECK (credit_hours > 0),
    teacher_id int not null unique,
    foreign key(teacher_id) references
    Teacher(teacher_id)
);
create table Teacher(
	teacher_id int auto_increment primary key,
    teacher_name varchar(30) not null unique,
    teacher_email varchar(20) not null,
    subject_id int not null,
    foreign key(subject_id) references
    Subject(subject_id)
)