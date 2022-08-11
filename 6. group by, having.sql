use mydatabase;
select * from scores;
/* Key take-ways: WHERE follows FROM，HAVING follows GROUP BY */


/* GROUP BY... : being grouped according to..., often follows aggregate functions */
select SubjectId, avg(Score), count(score) from scores group by SubjectId;

/* HAVING applies conditions for GROUP BY */
select SubjectId, avg(Score), count(score) from scores group by SubjectId having count(Score) >= 10;

/* select descriptive data for subjects whose exams have more than 4 participants */
select 
  (select SubjectName from subject where SubjectId=Scores.SubjectId) as Subject,
  round(avg(Score), 1) as Average_Mark, 
  count(score) as Participation_Rate 
FROM Scores GROUP BY SubjectId HAVING count(Score)>=4;


/* select numbers for males and females for grades above year 2, descending order by year */
select 
  (select Gradename from grade where GradeId=students.GradeId) as Year, 
  count(*) as Number, sex from students group by GradeId, sex 
having GradeId > 2
order by GradeId desc;


/* select subjects that have more than 2 people participate in the exams */
select SubjectId, count(StuId) from scores group by SubjectId
having count(StuId) >2
order by count(StuId) desc;
