show databases;
create database mydatabase;
use mydatabase;

create table if not exists `Students`(
	`StuId` 		int primary key auto_increment			comment 'student ID',
        `StunName` 		varchar(20) not null				comment 'student name',
        `LoginPwd`		varchar(50) not null				comment 'log-in password',
        `Sex`			char(2) not null default('female')		comment 'gender',
        `GradeID`		int						comment 'Grade',
        `Moblie` 		varchar(30)					comment 'phone number',
        `Address`		varchar(200) default('unkown')			comment 'home address',
        `Email`			varchar(50),
        `IdentityCard`		char(19) unique					comment'identity card number, unique',
        `CDate`			datetime	default(now())			comment 'created time'
)charset=utf8mb4 engine=InnoDB
        
select * FROM Students;
describe Students;

/*View the default character set of the current server*/
show global variables like '%character_set%';

insert into Students values(default, 
			    'Zac', 
			    'makeamericagreatagain', 
			    'Ml', 
			    '12', 
			    '18251850321', 
			    'BS8 4NU', 
			    'YANKTDA1997@GMAIL.COM', 
			    '123456789', 
			    DEFAULT);
/* Note: If inserted wrongly, auto-increment column keeps the order*/



/* Creating another three tables*/
DROP TABLE IF EXISTS `Grade`;
CREATE TABLE `grade`(
	`GradeID` 		int(4) primary key auto_increment		comment'grade id',
    	`GradeName` 		varchar(50) 					comment'name of grade'
);

DROP TABLE IF EXISTS `Subject`;
CREATE TABLE `Subject`(
	`SubjectId` 		int(4) primary key auto_increment		comment'id of the subject',
    	`SubjectName` 		varchar(50)					comment'name of subject',
    	`CourseHours` 		int(4)						comment'hours of the course',
    	`GradeID` 		int(4)						comment'ID of the grade'
) ;

DROP TABLE IF EXISTS `Score`;
CREATE TABLE `Score`(
	`scoreid` 		int(5) primary key auto_increment		comment'students can be repeatable, so create this primary key',
    	`Stuld` 		int(4) not null					comment'ID of the student',
	`SubjectId` 		int(4) not null					comment'ID of the subject',
    	`ExamDate` 		datetime not null				comment'date of the exam',
    	`score` 		float(4) not null				comment'exam results'
);

SHOW TABLES;


/* Starting the auto-increment column in 'score' from 10 */
ALTER TABLE `score` auto_increment=10;
insert into `score` values(default, 1, 1, now(), 98);
SELECT * from `score`;

/* Changing tables' names */
alter table `score` rename to `scores`;
show tables;

/* Adding columns to tables */	
alter table `grade` add `nickname` varchar(20) default('grade nicknames');
select * from grade;
DESCRIBE `grade`;

/* Alter columns' attributes of a table */
alter table `grade` change `nickname` `newnick` varchar(50) default('changed grade nicnames');
select * from grade;
describe `grade`;

/* Delete tables */
alter table `grade` drop `newnick`;
select * from grade;

/* Creating another three tables */
ALTER TABLE `scores` add constraint `pk_score` primary key `scores`(`scoreid`);
describe `scores`; 




