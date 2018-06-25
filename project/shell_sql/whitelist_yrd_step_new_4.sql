#对应规则：在所有业务线条出现过最高逾期天数（单次最高非累加）≥30天的逾期
#设置来源表参数，不要写死

CREATE TABLE  whitelist_yrd_step_new_4 AS
SELECT k.*,if(k.tmp_4 is null,1,0) as flag_new_4
FROM
(SELECT
a.*,b.id_number as tmp_4
FROM
whitelist_yrd_step_new_2  a
LEFT JOIN
(select k.* from  whitelist_yrd_source_other_product k where  max_overdue_days >= 30) b
ON a.id_number = b.id_number)k
