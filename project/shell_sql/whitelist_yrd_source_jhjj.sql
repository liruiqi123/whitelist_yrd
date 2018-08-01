#沉淀江湖救急数据，且沉淀条件是 江湖救急业务线上，逾期或非正常结清的用户
#该脚本需要添加时间参数


create_day=`date +%Y%m%d`
db=whitelist_yrd
sre_db=kg

#create_day=$1
#db=$2
#sre_db=$3

table1=whitelist_yrd_source_jhjj
src_table=mortgagor_

hive -e " use $db;

drop table $table1;


CREATE TABLE   $table1  AS
select distinct id_number  from $sre_db.$src_table$create_day where source like '%jhjj%'
and  process_status not like '%已结清%'
union all
select distinct id_number from  $sre_db.$src_table$create_day where source like '%jhjj%'
and  total_overdue_days > 0
"

