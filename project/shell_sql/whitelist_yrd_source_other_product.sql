#沉淀非宜人贷，其他业务线的数据
#设置时间参数 保证每天取当前最新的数据表信息
#设置创建表的参数，不要将代码写死，创建的新表和来源表名称



create_day=`date +%Y%m%d`
db=whitelist_yrd
sre_db=kg

#create_day=$1
#db=$2
#sre_db=$3

table1=whitelist_yrd_source_other_product
src_table=mortgagor_

hive -e " use $db;

drop table $table1;

CREATE  TABLE  $table1 as
select a.* from  $sre_db.$src_table$create_day  a
where a.source != 'ce_yrd'
"
