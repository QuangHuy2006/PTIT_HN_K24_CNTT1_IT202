DROP DATABASE IF EXISTS StudentManagement;
CREATE DATABASE StudentManagement;
USE StudentManagement;

-- =============================================
-- 1. TABLE STRUCTURE
-- =============================================

-- Table: Students
CREATE TABLE Students (
    StudentID CHAR(5) PRIMARY KEY,
    FullName VARCHAR(50) NOT NULL,
    TotalDebt DECIMAL(10,2) DEFAULT 0
);

-- Table: Subjects
CREATE TABLE Subjects (
    SubjectID CHAR(5) PRIMARY KEY,
    SubjectName VARCHAR(50) NOT NULL,
    Credits INT CHECK (Credits > 0)
);

-- Table: Grades
CREATE TABLE Grades (
    StudentID CHAR(5),
    SubjectID CHAR(5),
    Score DECIMAL(4,2) CHECK (Score BETWEEN 0 AND 10),
    PRIMARY KEY (StudentID, SubjectID),
    CONSTRAINT FK_Grades_Students FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    CONSTRAINT FK_Grades_Subjects FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);

-- Table: GradeLog
CREATE TABLE GradeLog (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID CHAR(5),
    OldScore DECIMAL(4,2),
    NewScore DECIMAL(4,2),
    ChangeDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- 2. SEED DATA
-- =============================================

-- Insert Students
INSERT INTO Students (StudentID, FullName, TotalDebt) VALUES 
('SV01', 'Ho Khanh Linh', 5000000),
('SV03', 'Tran Thi Khanh Huyen', 0);

-- Insert Subjects
INSERT INTO Subjects (SubjectID, SubjectName, Credits) VALUES 
('SB01', 'Co so du lieu', 3),
('SB02', 'Lap trinh Java', 4),
('SB03', 'Lap trinh C', 3);

-- Insert Grades
INSERT INTO Grades (StudentID, SubjectID, Score) VALUES 
('SV01', 'SB01', 8.5), -- Passed
('SV03', 'SB02', 3.0); -- Failed

-- Câu 1
Delimiter //
Create trigger tg_CheckScore 
BEFORE INSERT 
ON Grades
FOR EACH ROW
begin
	if new.score < 0 then set new.score = 0; end if;
    if new.score > 10 then set new.score = 10; end if;
end //
INSERT INTO Grades (StudentID, SubjectID, Score) VALUES ('SV01', 'SB03', 11.0);
select * from grades;

-- Câu 2
Start transaction;
INSERT INTO Students (StudentID, FullName) VALUES ('SV02', 'Ha Bich Ngoc');
select * from students;
UPDATE students set totalDebt = 5000000 where studentId = 'SV02';
commit;

-- Câu 3
Delimiter //
CREATE trigger tg_LogGradeUpdate
after update
on grades
for each row
begin
	INSERT INTO GradeLog(StudentID, OldScore, NewScore, ChangeDate) Value (old.studentID, old.score, new.score, NOW());
end //

UPDATE grades set score = 9.0 where studentid = 'SV01' and subjectid = 'SB01';
select * from grades;

-- Câu 4
Delimiter //
CREATE procedure sp_PayTuition(in p_student_id CHAR(5))
begin
	UPDATE students set totalDebt = totalDebt - 2000000 where studentId = p_student_id;
    if totalDebt < 0 then rollback; end if;
    commit;
end //
delimiter ;

call sp_PayTuition('SV01');
select * from students;

-- Câu 5
Delimiter //
CREATE trigger tg_PreventPassUpdate
before update
on grades
for each row
begin
	if old.score >= 0 then signal SQLSTATE '45000' set message_text = 'Lỗi'; 
    end if;
end //
delimiter ;
UPDATE grades set score = 9.0 where studentid = 'SV01' and subjectid = 'SB01';
select * from grades;

-- Câu 6
delimiter //
create procedure sp_DeleteStudentGrade(
	in p_StudentID char(5),
    in p_SubjectID char(5))
begin
	declare current_score decimal(10,2);

	start transaction;
		select score into current_score
        from grades
        where StudentId = p_StudentID and SubjectID = p_SubjectId;

	insert into GradeLog(studentId, oldScore, newScore, changeDate)
    value(p_StudentID, current_score, null, now());

    delete from grades
    where studentID = p_studentID and subjectId = p_subjectID;

    if row_count() = 0 then
		rollback;
	else
		commit;
	end if;
end //
delimiter ;