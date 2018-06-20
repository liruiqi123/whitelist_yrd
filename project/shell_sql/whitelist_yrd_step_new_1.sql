CREATE TABLE  whitelist_yrd_step_new_1 AS
SELECT k.*,if(k.tmp_1 is null,1,0) as new_1_flag
FROM
(SELECT
a.*,b.id_number as tmp_1
FROM
(select k.* from  whitelist_yrd_source_all k where  borrow_status = '还款中')  a
LEFT JOIN
whitelist_yrd_other_product_source b
ON a.id_number = b.id_number)k