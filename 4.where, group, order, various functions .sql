use mydatabase;

show tables;
select * FROM students;
select * FROM grade;
select * from scores;
select* FROM subject;

delete from subject;
UPDATE grade set GradeName='Postgraduate_Year3' where GradeID=7;

INSERT INTO `mydatabase`.`grade` VALUES
	(default, 'Undergraduate_Year1'),
    	(default, 'Undergraduate_Year2'),
   	(default, 'Undergraduate_Year3'),
    	(default, 'Undergraduate_Year4'),
    	(default, 'Postgraduate_Year1'),
    	(default, 'Postgraduate_Year2'),
    	(default, 'Postgraduate_Year3');
select * from grade;

INSERT INTO `mydatabase`.`subject` VALUES
	(default, 'Systematic Theology','36',1),
    	(default, 'Church History','45',1),
    	(default, 'Biblical hermeneutics','28',2),
    	(default, 'Biblical studies','180',1),
    	(default, 'Biblical theology','180',2),
    	(default, 'Dogmatic theology','180',3),
    	(default, 'Historical theology','36',1),
    	(default, 'Natural theology','36',2),
    	(default, 'Philosophical theology','36',3);
select * from subject;


/* extract data and use it to create a new table */
create TABLE if not exists adressbook(
	select StunName as 'Name', Address as 'living address' FROM students
);
select * from adressbook;


/* search by key words or conditions, and order results */ 
SELECT StuId, StunName, Sex, GradeID, Address FROM students 
WHERE StunName LIKE 'D' or sex like '%l%'
order by StuId desc; 

SELECT StuId, StunName, Sex, GradeID, Address FROM students 
WHERE sex<>'ml' 			/* <> stands for non */
order by StuId desc; 


/* select while renaming the data; multi-table inquiry */
select StuId as 'studentID', StunName as 'StudentsName' from students;
select S.StuId as 'studentID', 
S.StunName as 'StudentsName', 
G.GradeName as 'Name of Grade' from students as S, Grade as G; 


/* select and concate data, applied to characters; numeric data can be added */
select concat(SubjectName,'_',CourseHours) as 'Course and Hours' from subject; 
select StuId, GradeId, (StuId + GradeId) as 'IDsum' from students;


/* Examples for aggregate functions */
select avg(CourseHours) as 'average study range', GradeID from subject group by GradeID;
select MAX(CourseHours) AS 'longest study range' from subject;
INSERT INTO `mydatabase`.`scores` VALUES 
(default, '1', 	'1', now(), 98), 
(default, '2', 	'1', now(), 99),
(default, '3', 	'1', now(), 95),
(default, '4', 	'1', now(), 90),
(default, '5', 	'1', now(), 100
);
/* solve for highest, lowest, agerage exam marks for today*/
select max(score) as highest, min(score) as lowest, avg(score) as average from scores 
where datediff(now(), ExamDate)=0;


/* Time functions */
select concat(curDate(), ' ', curTime());
select now();
select concat('This week is the ', week(now()), 'th week of 2022');
select datediff(now(), '1972-11-23');
select timestampdiff(hour, '1972-11-23', now());
select adddate('2021-3-31', 100), date_add('2021-3-31', interval '+100' day);


/* Maths functions */
select ceil(-1.2);
select ceil(1.2) as 'round up';
select floor(1.9) as 'round down';
select (round(rand() * 1000) % 11 + 5) as 'a random number between 5 and 15';


/* Modifying characters in temporary tables */
select insert ('Ziqing reads books everyday', 1, 6, 'Ziqing Yan'); 
select (upper('zac')) as name_in_capital;
/* extract date and year: 7th letter with 8-length to compose into proper form */
SELECT str_to_date(substring('510333199503034444', 7, 8), '%Y%m%d') as date;


/* Subquery: Inquire data from students having same email */
SELECT Email FROM students WHERE StunName='Will';
/* SQL will first excute subquery, then outterquery; in means multiple results，= means single result */
SELECT * FROM students 
WHERE Email = (SELECT Email FROM students WHERE StunName='Will');
