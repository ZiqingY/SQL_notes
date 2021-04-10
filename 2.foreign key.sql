use mydatabase;

# 后面被引用，是主表；前面是子表
# 例1：scores表引用了students(StuID), subject(SubjectID)，那么主表是students和subject，子表是scores
# 例2：students表引用了Grade(GradeId)，那么Grade是主表，studnets是子表
# 先创建主表，后创建子表；先插入主表数据，后插入子表数据；先删除子表数据，再删除主数据

DROP TABLE IF EXISTS scores;
CREATE TABLE `scores`(
	scoreid 	int(5) primary key auto_increment		comment'primary key',
    StuID 		int(4) not null							comment'ID of the student',
	SubjectId 	int(4) not null							comment'ID of the subject',
    ExamDate 	datetime not null						comment'date of the exam',
    score 		float(4) not null						comment'exam results',
	foreign key(StuID) references students(StuID)		# 添加外键的方式一
);
describe `scores`;

# 添加外键的方式二。最终scores表格有两个外键（MUL）
alter table `scores` add constraint `fk_subjectid` foreign key (`SubjectId`) references `Subject`(`SubjectId`);


# 以上的两个方式就完成了 scores表的外键：students(StuID), subject(SubjectID)
# 方式一是自带约束，方式二是自己定义约束constraint
# 此后不能从子表的foreign key column直接插入数据了


# help用法
help contents; 			#相当于help主菜单
help `auto_increment`;

