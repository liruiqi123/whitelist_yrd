#对应规则：原借款单次最高逾期天数大于等于8天，拒绝
#应该设置表名的参数


create_day=`date +%Y%m%d`
db=whitelist_yrd



table1=whitelist_yrd_step_old_1
table2=whitelist_yrd_step_new_5



hive -e " use $db;

drop table $table1;



CREATE  TABLE $table1  as
SELECT *, if(max_overdue_days>= 8,1,0) as flag_old_1
FROM $table2