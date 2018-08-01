#对应规则：年龄小于22（不含）大于60（含）周岁拒绝

srctable = whitelist_yrd_step_2_years
newtable = whitelist_yrd_step_old_1_MaxOverdueDays



create_day=`date +%Y%m%d`
db=whitelist_yrd



table1=whitelist_yrd_step_old_4
table2=whitelist_yrd_step_old_3
table3=whitelist_yrd_source_isOverdue



hive -e " use $db;

drop table $table1;



CREATE  TABLE   $table1 as
SELECT *, if(k.years> 22 and k.years <= 60,1,0) as flag_old_4
FROM (
SELECT cast(int('2018' - substr(id_number, 7, 4))  as  string) as years,  *
from $table2
)k

