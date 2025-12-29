create database k24_cntt1_session03;
use k24_cntt1_session03;
create table Student(
	student_id int primary key,
	student_name varchar(30) not null,
    date_of_birth date not null,
    email varchar(30) not null unique
);
create table Subject(
	subject_id int primary key,
	subject_name varchar(30) not null,
    credit int not null check(credit > 0)
);
create table Enrollment(
	student_id int,
    subject_id int,
    enroll_date date not null,
	primary key(student_id, subject_id),
    foreign key(student_id) references
    Student(student_id),
    foreign key(subject_id) references
    Subject(subject_id)
);
create table Score(
	student_id int,
    subject_id int,
    mid_score float not null check(mid_score >=0 and mid_score <=10),
	final_score float not null check(final_score >=0 and final_score <=10),
	primary key(student_id, subject_id),
    foreign key(student_id) references
    Student(student_id),
    foreign key(subject_id) references
    Subject(subject_id)
);
insert into Student(student_id, student_name, date_of_birth, email) values
("ST01","Nguyễn Đăng Quang", "2006-09-04", "nguyendangquang0510@gmail.com");
insert into Subject(subject_id, subject_name, credit) values
("SJ01","Toán", 3),
("SJ02", "Văn", 2);
insert into Score(student_id, subject_id, final_score) values
("ST01","SJ01", 6.5),
("ST01","SJ02", 7);
insert into Enrollment(student_id, subject_id, enroll_date) values
("ST01","SJ01", "2025-12-29"),
("ST01","SJ02", "2025-12-29");
update Score set mid_score=5, final_score = 7.5 where student_id = "ST01" and subject_id = "SJ01";
delete from Score where student_id = "ST01" and subject_id = "SJ01";
delete from Enrollment where student_id = "ST01" and subject_id = "SJ01";
Select student_name, subject_name, mid_score, final_score from Student, Subject, Score where Student.student_id = Score.student_id and Subject.subject_id = Score.subject_id