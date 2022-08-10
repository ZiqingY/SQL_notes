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


/* Example 2 inquire info of students who took systematic theology exam most recently */
# 1. 从subject表中查询美国宪法这一门课的Id
SELECT SubjectId FROM `subject` WHERE SubjectName='美国宪法';
# 2. 根据课程ID从Score中查询对应学生ID
SELECT StuID FROM `scores` WHERE SubjectId = (SELECT SubjectId FROM `subject` WHERE SubjectName='美国宪法') ORDER BY ExamDate DESC LIMIT 1;
# 3. 根据学生ID查询对应学生信息
SELECT * FROM `students` WHERE StuID IN 
(SELECT StuID FROM `scores` WHERE SubjectId = 
	(SELECT SubjectId FROM `subject` WHERE SubjectName='美国宪法' ORDER BY ExamDate DESC LIMIT 1)
);														# 注意: WHERE xxx=的地方若是跟多个row, 则不用=, 用IN
