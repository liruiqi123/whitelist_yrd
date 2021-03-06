#设置时间参数 保证每天取当前最新的数据表信息
#设置创建表的参数，不要将代码写死，创建的新表和来源表名称


CREATE TABLE  whitelist_yrd_source_1 AS
select * from (
select
row_number() over(partition by id_number order by apply_time desc) as sort_id,
uuid	,
source	,
transport_id	,
name,
user_id	,
id_number	,
mobile	,
mobile2	,
apply_time	,
apply_device_id	,
apply_id	,
apply_ip	,
apply_department_name	,
apply_department_city	,
apply_latitude	,
apply_longitude	,
bank_card_num	,
bank_name	,
invite_code	,
invite_code_data	,
invite_mobile	,
is_expand	,
amortisation	,
product_type	,
loan_purpose	,
loan_type	,
register_time	,
register_city	,
register_detail_address	,
register_latitude	,
register_longitude	,
register_province	,
register_device_id	,
register_ip	,
resident_duration	,
resident_city	,
resident_detail_address	,
resident_district	,
resident_province	,
resident_area_code	,
resident_full_number	,
resident_number	,
resident_status	,
sales_person_name	,
sfz_edit_count	,
sfz_error_count	,
org_name	,
org_detail_address	,
org_provice	,
org_city	,
org_district	,
org_area_code	,
org_full_number	,
org_number	,
occupation	,
salary	,
credit_card_or_load	,
domicile_city	,
domicile_detail_address	,
domicile_district	,
domicile_provice	,
email	,
house_city	,
house_detail_address	,
house_district	,
house_province	,
marriage	,
max_diploma	,
qq	,
social_insurance	,
total_amount	,
process_status	,
borrow_amount	,
borrow_status	,
contract_id	,
end_date	,
decision_desc	,
decision_inhand_amount	,
decision_amount	,
decision_month_return	,
decision_loan_term	,
cashier_time	,
month_return	,
paid_amount	,
refuse_code	,
repay_time	,
complete_type	,
return_list	,
current_overdue_days	,
current_term_expect_amount	,
last_term_status	,
max_overdue_days	,
owed_contract_amount	,
owed_contract_corpus	,
recent_12_terms	,
recent_24_terms	,
returned_terms	,
total_overdue_count	,
kg.total_overdue_days(return_list) as total_overdue_days,
contacts
from kg.mortgagor_20180716 t3
where id_number is not null
and   source = 'ce_yrd'
and   (1=1
or product_type = '金卡贷0.78',
or product_type = '金卡贷0.78-B',
or product_type = '房贷129',
or product_type = '房贷专案(旧)',
or product_type = '信用卡129',
or product_type = '信用卡189',
or product_type = '信用卡专案(旧)',
or product_type = '风险定价1.29',
or product_type = '风险定价1.59',
or product_type = '风险定价1.77',
or product_type = '风险定价1.89',
or product_type = '风险定价2.19',
or product_type = '线下追加贷款0.78',
or product_type = '线下追加贷款1.29',
or product_type = '线下追加贷款1.59',
or product_type = '线下追加贷款1.77',
or product_type = '线下追加贷款1.89',
or product_type = '线下追加贷款2.19')
)a
where a.sort_id = 1;







CREATE TABLE  whitelist_yrd_source_2 AS
select i.* from
(select * from (
select
row_number() over(partition by id_number order by apply_time desc) as sort_id,
uuid	,
source	,
transport_id	,
name,
user_id	,
id_number	,
mobile	,
mobile2	,
apply_time	,
apply_device_id	,
apply_id	,
apply_ip	,
apply_department_name	,
apply_department_city	,
apply_latitude	,
apply_longitude	,
bank_card_num	,
bank_name	,
invite_code	,
invite_code_data	,
invite_mobile	,
is_expand	,
amortisation	,
product_type	,
loan_purpose	,
loan_type	,
register_time	,
register_city	,
register_detail_address	,
register_latitude	,
register_longitude	,
register_province	,
register_device_id	,
register_ip	,
resident_duration	,
resident_city	,
resident_detail_address	,
resident_district	,
resident_province	,
resident_area_code	,
resident_full_number	,
resident_number	,
resident_status	,
sales_person_name	,
sfz_edit_count	,
sfz_error_count	,
org_name	,
org_detail_address	,
org_provice	,
org_city	,
org_district	,
org_area_code	,
org_full_number	,
org_number	,
occupation	,
salary	,
credit_card_or_load	,
domicile_city	,
domicile_detail_address	,
domicile_district	,
domicile_provice	,
email	,
house_city	,
house_detail_address	,
house_district	,
house_province	,
marriage	,
max_diploma	,
qq	,
social_insurance	,
total_amount	,
process_status	,
borrow_amount	,
borrow_status	,
contract_id	,
end_date	,
decision_desc	,
decision_inhand_amount	,
decision_amount	,
decision_month_return	,
decision_loan_term	,
cashier_time	,
month_return	,
paid_amount	,
refuse_code	,
repay_time	,
complete_type	,
return_list	,
current_overdue_days	,
current_term_expect_amount	,
last_term_status	,
max_overdue_days	,
owed_contract_amount	,
owed_contract_corpus	,
recent_12_terms	,
recent_24_terms	,
returned_terms	,
total_overdue_count	,
kg.total_overdue_days(return_list) as total_overdue_days,
contacts
from kg.mortgagor_20180716 t3
where id_number is not null
and   source = 'ce_yrd' )a
where a.sort_id = 1)i,
(select n.old_transport_id   as transport_id from
ys_raw.clic_t_c_risk_price_info m,
ys_raw.clic_t_c_old_control n
where m.transport_id  = n.new_transport_id
and  m.con_lending_source = '6'
group by n.old_transport_id)j
where i.transport_id = j.transport_id;




CREATE TABLE  whitelist_yrd_source_all AS
select * from whitelist_yrd_source_1
union
select * from whitelist_yrd_source_2;


CREATE TABLE  whitelist_yrd_source_total AS
select k.* from
(select
row_number() over(partition by id_number order by cashier_time desc) as sort2_id,
*
from whitelist_yrd_source_all)k
where k.sort2_id=1





