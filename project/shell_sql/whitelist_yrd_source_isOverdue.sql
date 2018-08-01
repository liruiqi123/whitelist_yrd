#创建数据表，沉淀近两期发生过逾期的客户
#设置创建表的参数，不要将代码写死，创建的新表和来源表名称


db=whitelist_yrd
#db=$2
#sre_db=$3

table1=whitelist_yrd_source_isOverdue
table2=whitelist_yrd_source_daihou


hive -e " use $db;
drop table $table1;

create table $table1  AS
select k.*  from (
SELECT  row_number() over(partition by transport_id order by due_date desc) as sort_id,
*
FROM $table2
)k
where k.sort_id <3
and k.is_overdue = 'true'
and k.borrow_status = '还款中'
"