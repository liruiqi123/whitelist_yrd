#对应规则：年龄小于22（不含）大于60（含）周岁拒绝

srctable = whitelist_yrd_step_2_years
newtable = whitelist_yrd_step_old_1_MaxOverdueDays



create_day=`date +%Y%m%d`
db=whitelist_yrd



table1=whitelist_yrd_step_old_5_1_rec_ov_days
table2=whitelist_yrd_step_old_3
table3=whitelist_yrd_source_isOverdue



hive -e " use $db;

drop table $table1;

CREATE  TABLE   $table1 as

)k

