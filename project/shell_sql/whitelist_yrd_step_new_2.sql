CREATE TABLE  whitelist_yrd_source_jhjj AS
select distinct id_number  from kg.mortgagor_20180613 where source like '%jhjj%'
and  process_status not like '%已结清%'
union all
select distinct id_number from  kg.mortgagor_20180613 where source like '%jhjj%'
and  total_overdue_days > 0





CREATE TABLE  whitelist_yrd_step_new_2 AS
SELECT k.*,if(k.tmp_2 is null,1,0) as new_2_flag
FROM
(SELECT
a.*,b.id_number as tmp_2
FROM
whitelist_yrd_step_new_1 a
LEFT JOIN
whitelist_yrd_source_jhjj b
ON a.id_number = b.id_number)k