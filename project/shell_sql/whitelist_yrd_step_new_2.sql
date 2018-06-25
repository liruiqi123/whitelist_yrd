#对应规则
#有“江湖救急”产品有 除结清状态以外的其他申请记录/ 在“江湖救急”产品已结（状态为已结清），但还款出现过逾期



CREATE TABLE  whitelist_yrd_step_new_2 AS
SELECT k.*,if(k.tmp_2 is null,1,0) as flag_new_2
FROM
(SELECT
a.*,b.id_number as tmp_2
FROM
whitelist_yrd_step_new_1 a
LEFT JOIN
whitelist_yrd_source_jhjj b
ON a.id_number = b.id_number)k