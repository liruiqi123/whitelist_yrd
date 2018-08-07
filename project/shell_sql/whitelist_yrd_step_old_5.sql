#对应规则：年龄小于22（不含）大于60（含）周岁拒绝

srctable = whitelist_yrd_step_2_years
newtable = whitelist_yrd_step_old_1_MaxOverdueDays



create_day=`date +%Y-%m-%d`
db=whitelist_yrd

max_re_s

table1=whitelist_yrd_step_old_5_1_rec_ov_days
table2=whitelist_yrd_step_old_5_1_rec_ov_days
table3=whitelist_yrd_step_old_5_3_max_re_st

source_table=whitelist_yrd_source_12_term



hive -e " use $db;

drop table $table1;
drop table $table2;
drop table $table3;


CREATE  TABLE   $table1 as
select if (if(max(overdue_days) = 'null',0, max(overdue_days))>10,10,if(max(overdue_days) = 'null',0, max(overdue_days))),apply_id
from $source_table
group by
apply_id;



CREATE  TABLE   $table3 as
select  * ,months_between('2018-07-06',substr(apply_time,0,10)) as max_re_st
from whitelist_yrd_source_all;





"
