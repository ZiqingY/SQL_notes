use mydatabase;

/* subquery simple example */ 
SELECT * FROM StuInfo
WHERE LoginPwd = (SELECT LoginPwd from StuInfo where StunName='Katie');

SELECT * FROM subject;
select * from scores;


/* Limit syntax */
select * from students limit 3;
select * from students order by GradeID desc limit 3;  /* 3 highest grades */


# 例1：查询参加美国宪法考试的学生信息
# 1. 在subject表中查询美国宪法这门课的SubjectId
select SubjectId from `subject` where SubjectName='美国宪法';
# 2. 在scores表中查询出美国宪法SubjectId对应的StuId
select StuId from Scores where SubjectId=(select SubjectId from `subject` where SubjectName='美国宪法');
# 3. 根据StudId查询出对应的所有学生信息
select * from Students where StuId in (select StuId from Scores where SubjectId=(select SubjectId from `subject` where SubjectName='美国宪法'));


# 例1.1: 可以用 exists(只要后面括号里的命令有输出结果, 就执行前面的命令) 代替 StuID IN, 即:
SELECT * FROM students WHERE exists (
SELECT StuID FROM scores WHERE StuId=Students.StuId and SubjectId=(SELECT SubjectId FROM `subject` WHERE SubjectName='美国宪法'));


# 例2: 查询参加 "美国宪法"课程 最近一次考试的 学生名单
# 1. 从subject表中查询美国宪法这一门课的Id
SELECT SubjectId FROM `subject` WHERE SubjectName='美国宪法';
# 2. 根据课程ID从Score中查询对应学生ID
SELECT StuID FROM `scores` WHERE SubjectId = (SELECT SubjectId FROM `subject` WHERE SubjectName='美国宪法') ORDER BY ExamDate DESC LIMIT 1;
# 3. 根据学生ID查询对应学生信息
SELECT * FROM `students` WHERE StuID IN 
(SELECT StuID FROM `scores` WHERE SubjectId = 
	(SELECT SubjectId FROM `subject` WHERE SubjectName='美国宪法' ORDER BY ExamDate DESC LIMIT 1)
);														# 注意: WHERE xxx=的地方若是跟多个row, 则不用=, 用IN
