#对应规则：借新还旧客户当前逾期或者上一期还款出现过逾期，拒绝 （还款中 and 近两期发生过逾期）
#应该设置表名的参数


CREATE  TABLE  whitelist_yrd_step_old_3 as






SELECT *, if(max_overdue_days>= 8,1,0) as flag_old_1
FROM whitelist_yrd_step_new_5