use mydatabase;

select * from students;
delete from students;				/* will delete all data from the table but not the auto-increment */
truncate table students; 			/* will clear auto columns' data
						   but since this is a parent table, cannot be truncated */

/* correcting column names in students table*/
alter table `students` rename column `StunName` to `StuName`;
alter table `students` rename column `Moblie` to `Mobile`;


/* insert a row of data */
INSERT INTO `mydatabase`.`students`
(`StuID`, `StuName`, `LoginPwd`, `Sex`, `GradeID`, `Mobile`, `Address`, `Email`, `IdentityCard`, `CDate`)
VALUES
(default, 'Ziqing', '123456', 'ml', 1, '123456789', 'United Kingdom', 'ziqing@ac.uk.com', '999999999999', now());


/* drop forigen key */
alter table scores drop foreign key `scores_ibfk_1`;


/* insert data in batch */
INSERT INTO `mydatabase`.`students` VALUES 
(default, 'Will', 		'444444', 'ml', 1, '1234567891', 'England', 'will@redland.com', '999999999991', now()), 
(default, 'Katie', 		'555555', 'fm', 2, '1234567892', 'Wales', 'katie@redland.com', '999999999992', now()),
(default, 'Imogen', 		'666666', 'fm', 3, '1234567893', 'Scotland', 'imogen@redland.com', '999999999993', now()),
(default, 'Edward', 		'777777', 'ml', 4, '1234567894', 'England', 'edward@redland.com', '999999999994', now()),
(default, 'Robbie', 		'777777', 'ml', 4, '1234567894', 'England', null, '999999999995', now()
);

/* insert for socres table */
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


/* Update some table data under certain conditions */
UPDATE students set StuID=5 where StuID=16;
UPDATE students set StunName='Chole' where StuID=4 and Sex='ml';		


/* Delete table data: where names start with D and have more than 2 characters */
DELETE FROM students WHERE StunName LIKE 'D_%'; 							


/* Inquire regarding null value & value ranges */
select * FROM students where Email is null;			/* Note：null is different from empty-cell，use where Email="" for latter */
SELECT * FROM students where Email is not null;
SELECT * FROM students where GradeID between 2 and 4;
