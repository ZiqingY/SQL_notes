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
    (default, 'Postgraduate_Year3'
    );
select * from grade;

INSERT INTO `mydatabase`.`subject` VALUES
	(default, '美国宪法','36',1),
    (default, '美国秩序的根基','45',1),
    (default, '宪法第二修正案','28',2),
    (default, '赤裸的共产党人','180',1),
    (default, '撒切尔夫人传','180',2),
    (default, '通往奴役之路','180',3),
    (default, '哈耶克传','36',1),
    (default, '美丽新世界','36',2),
    (default, '圣经','36',3);
select * from subject;


# 提取数据用来创建新的表格
create TABLE if not exists adressbook(
	select StuName as 'Name', Address as 'living address' FROM students
);
select * from adressbook;


# 按关键字查询数据，排序
SELECT StuId, StuName, Sex, GradeID, Address FROM students 
WHERE StuName LIKE 'D' or sex like '%l%'
order by StuId desc; 

SELECT StuId, StuName, Sex, GradeID, Address FROM students 
WHERE sex<>'ml'
order by StuId desc; 


# 给列起别名，用as; 不改变原名
select StuId as '学号', StuName as '学生姓名' from students;
select S.StuId as '学号', S.StuName as '学生姓名', G.GradeName as '年纪名' from students as S, Grade as G;  # 用于多表查询


# 提取并拼接clomuns，适用于字符串; 数字列可以相加
select concat(SubjectName,'_',CourseHours) as 'Course and Hours' from subject; 
select StuId, GradeId, (StuId + GradeId) as 'IDsum' from students;


# 聚合函数示例
select avg(CourseHours) as '给定年级的平均学时', GradeID from subject group by GradeID;
select MAX(CourseHours) AS '最长学时' from subject;
INSERT INTO `mydatabase`.`scores` VALUES 
(default, '1', 	'1', now(), 98), 
(default, '2', 	'1', now(), 99),
(default, '3', 	'1', now(), 95),
(default, '4', 	'1', now(), 90),
(default, '5', 	'1', now(), 100
);
select max(score) as 最高分, min(score) as 最低分, avg(score) as 平均分 from scores 
where datediff(now(), ExamDate)=0; 				# 求在某天参加考试的最高分对低分平均分


# 时间函数
select concat(curDate(), ' ', curTime());
select now();
select concat('今年是2021年的第', week(now()), '个操蛋的周');
select datediff(now(), '1972-11-23');
select timestampdiff(hour, '1972-11-23', now());
select adddate('2021-3-31', 12), date_add('2021-3-31', interval '-100' day);


# 数学函数
select ceil(1.2) as '上取整';
select ceil(-1.2);
select floor(1.9) as '下取整';
select (round(rand() * 1000) % 11 + 5) as '5到15之间的随机数';


# 在临时表里面演示字符串修改
select insert ('zac prays everyday', 1, 3, 'Donald J Trump'); 
select (upper('zac'));
SELECT str_to_date(substring('510333199503034444', 7, 8), '%Y%m%d'); 	#截取年月日，组成日期


# 查询与DJT Email相同的同学信息：
SELECT Email FROM students WHERE StuName='DTJ'; 						# 代入下面
SELECT * FROM students 
WHERE Email = (SELECT Email FROM students WHERE StuName='DTJ'); 		# 会先执行子查询，再执行外面的查询；子查询前面用in表示多个结果，=表示唯一结果