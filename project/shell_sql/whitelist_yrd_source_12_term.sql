#设置时间参数 保证每天取当前最新的数据表信息
#设置创建表的参数，不要将代码写死，创建的新表和来源表名称


db=whitelist_yrd


#db=$2
#sre_db=$3

table1=
table2=ys_raw.yrd_overdue_responsibility


hive -e " use $db;

CREATE TABLE  $table1 AS
select * from (
select
row_number() over(partition by apply_id order by  cast(period_num as int) desc) as sort_id,period_num,
*
from
$2
)a
where a.sort_id < 13;

"
