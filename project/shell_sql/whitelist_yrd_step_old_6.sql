#对应规则：年龄小于22（不含）大于60（含）周岁拒绝


db=whitelist_yrd


table1=whitelist_yrd_step_old_6_1_grade
table2=whitelist_yrd_step_old_6_2_grade
table3=whitelist_yrd_step_old_6_3_grade

table4=whitelist_yrd_step_old_6





source_table=whitelist_yrd_step_old_5_1_cr_grade
source_table2=whitelist_yrd_source_crInfo
source_table3=table1=whitelist_yrd_reloanrepayinfo





hive -e " use $db;


drop table $table1;




create table $table1 as
select a.*,b.grade as cr_level_grade,b.rmb as cr_rmb
from
$source_table a
left join
$source_table2 b
on a.CR_grade = b.cr;



create  table $table2 as
select a.*,if(b.reloanrepay is null ,0, b.reloanrepay) as reloanrepay
from
$table1
left join
$source_table3
on a.apply_id = b.apply_id;

create table $table3 as
select
(decision_inhand_amount*cr_level_grade-reloanrepay) as cr_tmp1,
(cr_rmb-reloanrepay) as cr_tmp2,
(190000-reloanrepay) as cr_tmp3
from
$table2;



create table  $table4
as
select decision_inhand_amount,
cr_tmp1,cr_tmp2,cr_tmp3,
if (decision_inhand_amount <150000 , if(cr_tmp1<cr_tmp2,cr_tmp1,cr_tmp2),if(cr_tmp1<cr_tmp3,cr_tmp1,cr_tmp3))
 as flag_old_6
from whitelist_yrd_step_old_6_3_grade







"





