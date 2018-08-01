#对应规则
#有“江湖救急”产品有 除结清状态以外的其他申请记录/
#在“江湖救急”产品已结（状态为已结清），但还款出现过逾期


create_day=`date +%Y%m%d`
db=whitelist_yrd



table1=whitelist_yrd_step_new_2
table2=whitelist_yrd_step_new_1
table3=whitelist_yrd_source_jhjj


hive -e " use $db;

drop table $table1;

CREATE TABLE  $table1 AS
SELECT k.*,if(k.tmp_2 is null,1,0) as flag_new_2
FROM
(SELECT
a.*,b.id_number as tmp_2
FROM
$table2 a
LEFT JOIN
$table3 b
ON a.id_number = b.id_number)k"