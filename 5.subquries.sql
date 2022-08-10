use mydatabase;

/* subquery simple example */ 
SELECT * FROM students
WHERE LoginPwd = (SELECT LoginPwd from students where StunName='Katie');

SELECT * FROM subject;
select * from scores;


/* Limit syntax */
select * from students limit 3;
select * from students order by GradeID desc limit 3;  /* 3 highest year students */


/* Example 1; inquire info of students who took systematic theology exam */
/* Step 1: select sujectID by suject names in suject table */
select SubjectId from `subject` where SubjectName='systematic theology';
/* Step 2: select student ID by suject ID in scores table */
select StuId from Scores where SubjectId=(select SubjectId from `subject` where SubjectName='systematic theology');
/* Step 3: select rows by student ID in student info table*/
select * from Students where StuId in (select StuId from Scores where SubjectId=(select SubjectId from `subject` where SubjectName='systematic theology'));


/* Example 1.1: can substitue StuID IN with EXISTS */
SELECT * FROM students WHERE exists (
SELECT StuID FROM scores WHERE StuId=Students.StuId and SubjectId=(SELECT SubjectId FROM `subject` WHERE SubjectName='美国宪法'));


/* Example 2 inquire info of the student who took systematic theology exam most recently */
/* Step 1: select subject ID by sbuject name in subject table */
SELECT SubjectId FROM `subject` WHERE SubjectName='systematic theology';
/* Step 2: select student ID by subject ID in scores table, with the closest exam date */
SELECT StuID FROM `scores` WHERE SubjectId = (SELECT SubjectId FROM `subject` WHERE SubjectName='systematic theology') ORDER BY ExamDate DESC LIMIT 1;
/* Step 3: select row of student info by student ID in student table*/
SELECT * FROM `students` WHERE StuID = 
(SELECT StuID FROM `scores` WHERE SubjectId = 
	(SELECT SubjectId FROM `subject` WHERE SubjectName='systematic theology' ) ORDER BY ExamDate DESC LIMIT 1
);	
/* Note: if 'WHERE xxx=' follows mutiple rows then use 'IN' ratehr than =
