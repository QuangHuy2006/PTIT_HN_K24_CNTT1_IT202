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
)