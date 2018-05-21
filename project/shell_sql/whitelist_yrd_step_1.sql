select * from (
select
row_number() over(partition by id_number order by apply_time desc) as sort_id, 
uuid	,
source	,
transport_id	,
name	,
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



from mortgagor_20180520 t3

where id_number is not null)a
where a.sort_id = 1



limit 300;
