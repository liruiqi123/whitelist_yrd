#涉及规则：在除宜人贷以外的其他业务线有还款中
#设置添加的标签flag


CREATE TABLE  whitelist_yrd_step_new_1 AS
SELECT k.*,if(k.tmp_1 is null,1,0) as flag_new_1
FROM
(SELECT
a.*,b.id_number as tmp_1
FROM
whitelist_yrd_source_all a
LEFT JOIN
(select k.* from  whitelist_yrd_other_product_source k where borrow_status = '还款中') b
ON a.id_number = b.id_number)k