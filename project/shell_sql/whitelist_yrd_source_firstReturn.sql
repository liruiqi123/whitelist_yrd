#创建数据表，沉淀近两期发生过逾期的客户
#设置创建表的参数，不要将代码写死，创建的新表和来源表名称
#算出最近两期的一起还款情况


db=whitelist_yrd


#db=$2
#sre_db=$3

table1=whitelist_yrd_source_firstReturn
table2=whitelist_yrd_source_daihou


hive -e " use $db;
drop table $table1;


create table $table1  AS


select m.*,n.overdue_no_responsibility
from
(
select k.*  from (
SELECT  row_number() over(partition by transport_id order by current_term) as sort_id,
*
FROM
$table2)k
where k.sort_id <2
)m
left join
ys_raw.yrd_overdue_responsibility n
on (
 concat('yrd', n.apply_id) = m.apply_id
 and a.current_term = b.period_num)

)





"