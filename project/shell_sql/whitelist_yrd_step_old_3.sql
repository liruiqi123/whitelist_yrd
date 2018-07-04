#对应规则：借新还旧客户当前逾期或者上一期还款出现过逾期，拒绝 （还款中 and 近两期发生过逾期）
#应该设置表名的参数


CREATE TABLE  whitelist_yrd_step_old_3 AS
SELECT k.*,if(k.tmp_old_3 is null,1,0) as flag_old_3
FROM
(SELECT
a.*,b.transport_id as tmp_old_3
FROM
whitelist_yrd_step_old_1 a
LEFT JOIN
whitelist_yrd_source_isOverdue b
ON a.transport_id = b.transport_id)k