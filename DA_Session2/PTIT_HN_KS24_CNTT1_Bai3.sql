create database k24_cntt1_session02;
use k24_cntt1_session02;
create table Subject(
	subject_id int auto_increment primary key,
    subject_name varchar(20) unique not null,
    credit_hours int not null CHECK (credit_hours > 0)
);
create table Student(
	student_id int auto_increment primary key,
    student_name varchar(30) unique not null
);
create table Enrollment(
	student_id int not null,
    subject_id int not null,
    enroll_day date not null,
    primary key(student_id, subject_id),
    foreign key(student_id) references
    Student(student_id),
    foreign key(subject_id) references
    Subject(subject_id)
)