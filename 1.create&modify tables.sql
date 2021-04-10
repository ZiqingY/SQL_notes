create database mydatabase;
show databases;
use mydatabase;

create table if not exists `Students`(
		`StuId` 		int primary key auto_increment			comment 'student ID',
        `StunName` 		varchar(20) not null					comment 'student name',
        `LoginPwd`		varchar(50) not null						comment 'log-in password',
        `Sex`			char(2) not null default('female')		comment 'gender',
        `GradeID`		int										comment 'Grade',
        `Moblie` 		varchar(30)								comment 'phone number',
        `Address`		varchar(200) default('unkown')			comment 'home address',
        `Email`			varchar(50),
        `IdentityCard`	char(19) unique							comment'identity card number, unique',
        `CDate`			datetime	default(now())				comment 'created time'
)charset=utf8mb4 engine=InnoDB
        
select * FROM Students;
describe Students;

# 查看当前服务器的默认字符集
show global variables like '%character_set%';

insert into Students values(default, 'Zac', 'makeamericagreatagain', 'Ml', '12', '18251850321', 'BS8 4NU', 'YANKTDA1997@GMAIL.COM', '123456789', DEFAULT);
# 注：要是插入错误，自增列还会保留错误序号



# 再创建三个Table
DROP TABLE IF EXISTS `Grade`;
CREATE TABLE `grade`(
	`GradeID` 		int(4) primary key auto_increment		comment'grade id',
    `GradeName` 	varchar(50) 							comment'name of grade'
);

DROP TABLE IF EXISTS `Subject`;
CREATE TABLE `Subject`(
	`SubjectId` 	int(4) primary key auto_increment		comment'id of the subject',
    `SubjectName` 	varchar(50)								comment'name of subject',
    `CourseHours` 	int(4)									comment'hours of the course',
    `GradeID` 		int(4)									comment'ID of the grade'
) ;

DROP TABLE IF EXISTS `Score`;
CREATE TABLE `Score`(
	`scoreid` 		int(5) primary key auto_increment		comment'students can be repeatable, so create this primary key',
    `Stuld` 		int(4) not null							comment'ID of the student',
	`SubjectId` 	int(4) not null							comment'ID of the subject',
    `ExamDate` 		datetime not null						comment'date of the exam',
    `score` 		float(4) not null						comment'exam results'
);

SHOW TABLES;


#使score表格里面的自增列：从10开始+
ALTER TABLE `score` auto_increment=10;
insert into `score` values(default, 1, 1, now(), 98);
SELECT * from `score`;

#修改表的名称
alter table `score` rename to `scores`;
show tables;

#为表格增加cloumns	
alter table `grade` add `nickname` varchar(20) default('grade nicknames');
select * from grade;
DESCRIBE `grade`;

# 修改表格中cloumns的属性
alter table `grade` change `nickname` `newnick` varchar(50) default('changed grade nicnames');
select * from grade;
describe `grade`;

# 删除columns
alter table `grade` drop `newnick`;
select * from grade;

# 单独为某个表增加primary key constraint,可以为其单独起名字
ALTER TABLE `scores` add constraint `pk_score` primary key `scores`(`scoreid`);
describe `scores`; #这里已经是pk了，所以会报错




