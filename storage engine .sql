show engines;
# 发现只有InnoDB支持事物(transactions)
# 默认InnoDB，MyISAM查询较快

show variables like '%storage_engine%';
# 查看引擎

use mydatabase;

create table test_engine(
	`id` int primary key auto_increment,
    `name` varchar(50)
) engine=InnoDB;

alter table test_engine engine=MyISAM;
describe test_engine; #看不出存储引擎

SELECT * FROM information_schema.tables WHERE Table_name='test_engine'; #可以看到表格的属性，包括engine
#或者
SELECT * FROM information_schema.tables WHERE Table_Schema='mydatabase' and Table_name='test_engine';
