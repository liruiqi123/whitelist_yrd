#创建数据表，沉淀近两期发生过逾期的客户
#在八方征信数据中提取进件人的信用卡开发信息


db=whitelist_yrd
#db=$2
#sre_db=$3

table1=whitelist_yrd_source_openDate



hive -e " use $db;

drop table $table1;


create table $table1 as

select
a.id_number,
b.bs_client_id,
b.credentials_number,
d.open_date
from
whitelist_yrd_source_all a,
ys_raw.clic_tc_customer b,
ys_dw.dw_crp_info c,
ys_dw.dw_crp_loan_detail d
where 1=1
and a.id_number = b.credentials_number
and b.bs_client_id=c.bs_client_id
and d.pboc_rep_id = c.pboc_rep_id



"





