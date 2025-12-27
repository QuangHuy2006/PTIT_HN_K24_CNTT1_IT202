create database k24_cntt1_session02;
use k24_cntt1_session02;
create table result(
	student_id int not null unique,
    subject_id int not null unique,
    progress_mark decimal not null CHECK (progress_mark >= 0 && progress_mark <= 10),
    primary key(student_id, subject_id),
    foreign key(student_id) references
    student(student_id),
    foreign key(subject_id) references
    subject(subject_id)
);
create table class(
	class_id int auto_increment primary key,
    class_name varchar(20) unique not null,
    class_year int not null,
    student_id int not null,
    foreign key(student_id) references
    student(student_id)
);
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
);
create table Teacher(
	teacher_id int auto_increment primary key,
    teacher_name varchar(30) not null unique,
    teacher_email varchar(20) not null,
    subject_id int not null,
    foreign key(subject_id) references
    Subject(subject_id)
)