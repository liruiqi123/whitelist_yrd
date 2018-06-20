CREATE TABLE  whitelist_yrd_step_new_1 AS
SELECT k.*,if(k.tmp_1 is null,1,0) as new_1_flag
FROM
(SELECT
a.*,b.transport_id as tmp_1
FROM
(select transport_id from
whitelist_yrd_source_all
WHERE 1=1
and product_type IN  ('授薪','自雇')
and process_status like '%拒%')a
LEFT JOIN
whitelist_yrd_source_all b
ON a.transport_id = b.transport_id)k