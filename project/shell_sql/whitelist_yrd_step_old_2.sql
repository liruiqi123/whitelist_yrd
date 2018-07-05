#对应规则：间隔6个月以内（含），拒绝  （7做6不做）
#应该设置表名的参数



select months_between('2017-05-01','2017-03-01') ;


select *,months_between('2018-07-06',substr(cashier_time,0,10)) AS tmp_old_2_1,
from whitelist_yrd_step_old_1 ;



