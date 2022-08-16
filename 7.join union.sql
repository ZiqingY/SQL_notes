/*    inner join...on
 			INNER JOIN generates row number = multiplication of numbers of rows in 2 tables
 			INNER JOIN ON generates row number = SUM(表1各行乘以匹配行数)

 left join...on / left outer join on

 right join...on / right outer join on

 UNION:
		 	SELECT column1, column2,... FROM table1
		 	UNION
 		 	SELECT column_1, column_2,... FROM table2
 			note:两张表取出的columns数量要相同; UNION 会自动合并相同数据, UNION ALL不会, 所以更有效率 */


/* inner join例子及其collary */
SELECT * from students inner join scores on students.StuID=scores.StuID;
select * from students, scores where students.StuId=scores.StuId; 


/* 复杂的Inner join和复杂的collary达到多表连接 */
select StuName, GradeName, score, SubjectName from students
inner join scores 		on (students.StuId=scores.StuId)
inner join grade 		on (students.GradeId=grade.GradeId)
inner join `subject` 	on (scores.SubjectId=subject.SubjectId);

select StuName, GradeName, score, SubjectName 
from students, scores, grade, `subject` 
where students.StuId=scores.StuId and students.GradeId=grade.GradeId and scores.SubjectId=`subject`.SubjectId;


/* left join复杂例子 */
select StuId, StuName from(
select students.StuId, StuName, scores.score from students left join scores on students.StuId=scores.StuID)
as temp where score is null;
