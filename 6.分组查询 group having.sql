use mydatabase;
select * from scores;
# 本节核心：where放在from后，having放在group by后


# group by... 按照...分组，通常跟聚合函数
select SubjectId, avg(Score), count(score) from scores group by SubjectId;

# having适用于分组后的条件
select SubjectId, avg(Score), count(score) from scores group by SubjectId having count(Score) >= 4;

# 选取考试的学科、满足参考人数不少于四人的考试结果统计信息
select (select SubjectName from subject where SubjectId=Scores.SubjectId) as 学科名称,
round(avg(Score), 1) as 平均分, count(score) as 参考人数 from Scores
group by SubjectId
having count(Score)>=4;


# 选取年级的男女个数, 筛选大二以上的，按照年级降序
select (select Gradename from grade where GradeId=students.GradeId) as 年级, 
count(*) as 人数, sex from students group by GradeId, sex 
having GradeId > 2
order by GradeId desc;


# 练习：查询参考人数大于2人的科目
select SubjectId, count(StuId) from scores group by SubjectId
having count(StuId) >2
order by count(StuId) desc;