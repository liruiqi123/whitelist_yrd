#对应规则：近6个月有申请授薪or自雇（包含追加贷）被拒贷记录，拒绝


create_day=`date +%Y%m%d`
db=whitelist_yrd



table1=whitelist_yrd_step_new_5
table2=whitelist_yrd_step_new_4



hive -e " use $db;

drop table $table1;

CREATE TABLE  $table1 AS
SELECT k.*,if(k.tmp_1 is null,1,0) as flag_new_5
FROM
(SELECT
a.*,b.transport_id as tmp_5
FROM
$table2 a
LEFT JOIN
(select transport_id from
$table2
WHERE 1=1
and product_type IN  ('授薪','自雇')
and process_status like '%拒%') b
ON a.transport_id = b.transport_id)k
"