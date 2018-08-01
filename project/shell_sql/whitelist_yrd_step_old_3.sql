#对应规则：借新还旧客户当前逾期或者上一期还款出现过逾期，拒绝 （还款中 and 近两期发生过逾期）
#应该设置表名的参数


create_day=`date +%Y%m%d`
db=whitelist_yrd



table1=whitelist_yrd_step_old_3
table2=whitelist_yrd_step_old_2
table3=whitelist_yrd_source_isOverdue



hive -e " use $db;

drop table $table1;

CREATE TABLE  $table1 AS
SELECT k.*,if(k.tmp_old_3 is null,1,0) as flag_old_3
FROM
(SELECT
a.*,b.transport_id as tmp_old_3
FROM
$table2 a
LEFT JOIN
$table3 b
ON a.transport_id = b.transport_id)k
"