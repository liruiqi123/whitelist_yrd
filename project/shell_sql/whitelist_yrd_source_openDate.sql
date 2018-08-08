#创建数据表，沉淀近两期发生过逾期的客户
#在八方征信数据中提取进件人的信用卡开发信息


db=whitelist_yrd
#db=$2
#sre_db=$3

table1=whitelist_yrd_source_openDate



hive -e " use $db;

drop table $table1;


create table $table1 as


select min(k.open_date) as  openDate,k.id_number
from
(
select a.pboc_rep_id,a.open_date,b.id_number
from
ys_dw.dw_crp_loan_detail a,
ys_dw.dw_crp_info b
where a.pboc_rep_id = b.pboc_rep_id)k
group by k.id_number
"