#对应规则：近6个月有申请授薪or自雇（包含追加贷）被拒贷记录，拒绝


CREATE TABLE  whitelist_yrd_step_new_5 AS
SELECT k.*,if(k.tmp_1 is null,1,0) as new_1_flag
FROM
(SELECT
a.*,b.transport_id as tmp_5
FROM
whitelist_yrd_step_new_4 a
LEFT JOIN
(select transport_id from
whitelist_yrd_step_new_4
WHERE 1=1
and product_type IN  ('授薪','自雇')
and process_status like '%拒%') b
ON a.transport_id = b.transport_id)k