use mydatabase;

/* Parent table is referred. Child table refers
   Example 1：scores table cites students(StuID), subject(SubjectID), then parent tables are students & subject, child table is scores
   Example 2：students refers from Grade(GradeId)，thrn Grade is parent table, studnets is child table
   First create parentT, then childT; First insert for parentT, then childT; First delete childT data, then parentT data. */

DROP TABLE IF EXISTS scores;
CREATE TABLE `scores`(
	scoreid 	int(5) primary key auto_increment		comment'primary key',
    	StuID 		int(4) not null					comment'ID of the student',
	SubjectId 	int(4) not null					comment'ID of the subject',
   	ExamDate 	datetime not null				comment'date of the exam',
    	score 		float(4) not null				comment'exam results',
	foreign key(StuID) references students(StuID)			/* Method_1 for adding forigen key*/
);
describe `scores`;

/* Method_2 for forigen key */
alter table `scores` add constraint `fk_subjectid` foreign key (`SubjectId`) references `Subject`(`SubjectId`);

/* Above codes add 2 forigen keys to scores table: students(StuID), subject(SubjectID)
   Method_1 adds fkey when creating table; Method_2 adds fkey as constraint to table.
   After all these you can't add data to fkey column in child table. */


/* help usage */
help contents; 
help `auto_increment`;

