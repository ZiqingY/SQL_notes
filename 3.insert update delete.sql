use mydatabase;

select * from students;
delete from students;											# 删除表格内全部数据，不删除auto_increment
truncate table students; 										# 会清空自动标识列中的起始数据,即auto_increment归0
																# 发现因为FK的存在,此表为主表，不能执行

alter table `students` rename column `StunName` to `StuName`; 	# 改变列名称
alter table `students` rename column `Moblie` to `Mobile`;


# 插入一条数据
INSERT INTO `mydatabase`.`students`
(`StuID`, `StuName`, `LoginPwd`, `Sex`, `GradeID`, `Mobile`, `Address`, `Email`, `IdentityCard`, `CDate`)
VALUES
(default, 'Trump', '123456', 'ml', 1, '123456789', 'america', 'maga@whitehouse.com', '999999999999', now());


# 删除FK关系, fk名称来自报错
alter table scores drop foreign key `scores_ibfk_1`;


# 批量insert
INSERT INTO `mydatabase`.`students` VALUES 
(default, 'Pence', 		'444444', 'ml', 1, '1234567891', 'america', 'maga@whitehouse.com', '999999999991', now()), 
(default, 'Ivanka', 	'555555', 'fm', 2, '1234567892', 'america', 'maga@whitehouse.com', '999999999992', now()),
(default, 'Melania', 	'666666', 'fm', 3, '1234567893', 'america', 'maga@whitehouse.com', '999999999993', now()),
(default, 'DTJ', 		'777777', 'ml', 4, '1234567894', 'america', 'maga@whitehouse.com', '999999999994', now()),
(default, 'Eric', 		'777777', 'ml', 4, '1234567894', 'america', 				 null, '999999999995', now()
);

# 填充scores表
INSERT INTO `mydatabase`.`scores` VALUES
	(default, 1, 1, now(), 100),
	(default, 1, 2, now(), 99),
    (default, 1, 4, now(), 99.5),
    (default, 1, 7, now(), 98),
    (default, 2, 1, now(), 98.5),
    (default, 2, 2, now(), 100),
	(default, 2, 4, now(), 99),
    (default, 2, 7, now(), 99.5),
    (default, 3, 1, now(), 98),
    (default, 3, 2, now(), 98.5),
    (default, 3, 4, now(), 100),
	(default, 3, 7, now(), 99),
    (default, 2, 7, now(), 99.5),
    (default, 3, 7, now(), 98
);


# 更新表格数据
UPDATE students set StuID=5 where StuID=16;
UPDATE students set StuName='DJ junior' where StuID=4 and Sex='ml';		# where条件很重要, 不然全删了


# 删除表格数据
DELETE FROM students WHERE StuName LIKE 'D_%'; 							# 删除D开头的，两个字及以上的名字的数据条


# 查询某column为/不为null的数据；查询某column值在某区间内的数据
select * FROM students where Email is null;								# 注：null和字符串为空不一样，后者用 where Email=""
SELECT * FROM students where Email is not null;
SELECT * FROM students where GradeID between 2 and 4;