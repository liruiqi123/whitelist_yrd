#对应规则：间隔6个月以内（含），拒绝  （7做6不做）
#应该设置表名的参数

select
k.*,
months_between('2018-07-06',substr(k.cashier_time,0,10)) AS tmp_old_2_1,
months_between('2018-07-06',substr(k.due_date,0,10)) AS tmp_old_2_2
from
(SELECT  a.*,b.due_date  from
whitelist_yrd_step_old_1 a
LEFT  JOIN
whitelist_yrd_source_firstReturn b
on
a.transport_id = b.transport_id)k

