#对应规则：年龄小于22（不含）大于60（含）周岁拒绝

srctable = whitelist_yrd_step_2_years
newtable = whitelist_yrd_step_old_1_MaxOverdueDays



create_day=`date +%Y-%m-%d`
db=whitelist_yrd


table1=whitelist_yrd_step_old_5_1_rec_ov_days
table2=whitelist_yrd_step_old_5_2_opendate
table3=whitelist_yrd_step_old_5_3_max_re_st
table4=whitelist_yrd_step_old_5_3_max_re_st_grade
table5=whitelist_yrd_step_old_5_2_opendate_grade


source_table=whitelist_yrd_source_12_term
source_table2=whitelist_yrd_source_all
source_table3=whitelist_yrd_source_opendate



hive -e " use $db;

drop table $table1;
drop table $table2;
drop table $table3;
drop table $table4;


CREATE  TABLE   $table1 as
select if (if(max(overdue_days) = 'null',0, max(overdue_days))>10,10,if(max(overdue_days) = 'null',0, max(overdue_days))) as rec_ov_days ,apply_id
from $source_table
group by
apply_id;





CREATE  TABLE   $table2 as
select a.* , months_between('2018-07-06',substr(b.open_date,0,10))  as open_date from
$source_table2 a
left join
(select id_number,min(open_date) as open_date  from
$source_table3  group by id_number)b
on a.id_number = b.id_number;




CREATE  TABLE   $table3 as
select  * ,months_between('2018-07-06',substr(apply_time,0,10)) as max_re_st
from $table2;






CREATE TABLE $table4 AS SELECT *,
    CASE
        WHEN floor(max_re_st) <= 12 THEN 0.33611
        WHEN floor(max_re_st) = 13 THEN 0.16843
        WHEN floor(max_re_st) = 14 THEN -0.15021
		WHEN (floor(max_re_st) >= 15 and floor(max_re_st)<=18)  THEN -0.18566
        WHEN floor(max_re_st) >= 19 THEN -0.5808
    END AS max_re_st_grade FROM
    $table3;






CREATE TABLE $table5 AS SELECT *,
    CASE
        WHEN floor(open_date) IS NULL THEN -0.14097
        WHEN floor(open_date) >= 0  and floor(open_date)<= 32 THEN 0.41466
         WHEN floor(open_date) >= 33  and floor(open_date)<= 56 THEN 0.03623
          WHEN floor(open_date) >= 57  and floor(open_date)<= 74 THEN 0.0779
          WHEN floor(open_date) >= 75  and floor(open_date)<= 94 THEN -0.12919
          WHEN floor(open_date) >= 95   THEN -0.16233
    END AS open_date_grade FROM
    $table4;




"
