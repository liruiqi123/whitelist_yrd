#对应规则：年龄小于22（不含）大于60（含）周岁拒绝

srctable = whitelist_yrd_step_2_years
newtable = whitelist_yrd_step_old_1_MaxOverdueDays



CREATE  TABLE  whitelist_yrd_step_old_4 as
SELECT *, if(k.years> 22 and k.years <= 60,1,0) as flag_old_4
FROM (
SELECT cast(int('2018' - substr(id_number, 7, 4))  as  string) as years,  *
from whitelist_yrd_step_old_1
)k

