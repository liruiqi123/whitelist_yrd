#设置时间参数 保证每天取当前最新的数据表信息
#设置创建表的参数，不要将代码写死，创建的新表和来源表名称

db=whitelist_yrd
sre_db=kg

#db=$2
#sre_db=$3

table1=whitelist_yrd_source_daihou
table2=whitelist_yrd_source_all


hive -e " use $db;
drop table $table1;


CREATE TABLE  $table1  AS
select
transport_id,
apply_id, 
borrow_status,
return_info['current_term'] as current_term,
return_info['due_date'] as due_date,
return_info['return_tim'] as return_time,
return_info['overdue_days'] as overdue_days,
return_info['is_returned'] as is_returned,
return_info['is_overdue'] as is_overdue,
return_info['owed_amount'] as owed_amount,
return_info['owed_corpus'] as owed_corpus,
return_info['overdue_terms'] as overdue_terms
from table2 lateral view explode(kg.return_stat_for_antifraud(return_list)) return_table as return_info;
"
