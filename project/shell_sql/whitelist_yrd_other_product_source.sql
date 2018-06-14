CREATE  TABLE  whitelist_yrd_other_product_source as
select a.* from kg.mortgagor_20180613  a
left join
(select transport_id from whitelist_yrd_source_all) b
on a.transport_id = b.transport_id
where b.transport_id is null



CREATE  TABLE  whitelist_yrd_other_product_source as
select a.* from kg.mortgagor_20180613  a
where a.source != 'ce_yrd'
and borrow_status = '还款中'


select a.* , if(transport_id in (select transport_id from whitelist_yrd_other_product_source ),1,0) as new_1_flag
from
whitelist_yrd_source_all a


SELECT k.*,if(tmp_1 is null,1,0) as new_1_flag
(SELECT
whitelist_yrd_source_all a,b.id_number as tmp_1
LEFT JOIN
whitelist_yrd_other_product_source b
ON a.id_number = b.id_number)k
