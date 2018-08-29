#对应规则：间隔6个月以内（含），拒绝  （7做6不做）
#应该设置表名的参数



create_day=`date +%Y%m%d`
db=whitelist_yrd



table1=whitelist_yrd_step_old_2
table2=whitelist_yrd_step_old_1
table3=whitelist_yrd_source_firstReturn



hive -e " use $db;

drop table $table1;

CREATE  TABLE  $table1 as
select
k.*,
months_between('2018-07-06',substr(k.cashier_time,0,10)) AS tmp_old_2_1,
months_between('2018-07-06',substr(k.due_date,0,10)) AS tmp_old_2_2
from
(SELECT  a.*,b.due_date,b.overdue_no_responsibility  from
$table2 a
LEFT  JOIN
$table3 b
on
a.transport_id = b.transport_id)k;"

