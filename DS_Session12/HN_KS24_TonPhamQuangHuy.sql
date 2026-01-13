USE StudentDB;
-- Phần A:
-- Câu 1:
create or replace view view_studentBasic as select
	s.studentID,
	s.fullName, 
	d.deptName
from Student s
join Department d on d.deptid = s.deptid;
select * from view_studentBasic;
-- Câu 2
create index idx on Student(fullName);
-- Câu 3
delimiter $$
create procedure getStudentsIT()
begin 
select s.studentID, s.fullName, d.deptName
from Student s
join Department d on d.deptid = s.deptid
where d.deptid = 'IT';
end $$
delimiter ;
call getStudentsIT();
-- Phần B
-- Câu 4
-- a)
create or replace view view_studentCountByDept as
select d.deptName, count(s.deptID) as totalStudents
from Department d
join Student s on s.deptID = d.deptID
group by s.deptID;
select * from view_studentCountByDept;
-- b)
select deptName, totalStudents from view_studentCountByDept
having totalStudents = (select max(cnt) from (select count(*) as cnt from department d join student s on s.deptId = d.deptID group by s.deptID)t);
-- Câu 5
delimiter $$
create procedure getTopScoreStudent(p_courseID char(6))
begin 
select e.courseID, e.score, s.fullName
from Course c
join Enrollment e on e.courseID = c.courseID
join Student s on s.studentID = e.studentID
where e.courseID = p_courseID and e.score = (select max(score) from Enrollment where courseID = p_courseID group by deptID);
end $$
delimiter ;
call getTopScoreStudent('C00002');
-- Phần C
-- Câu 6
create or replace view view_IT_Enrollment_DB as
select s.studentID, s.fullName, d.deptName
from Student s
join Department d on d.deptid = s.deptid
join course
where d.deptid = 'IT' and ;