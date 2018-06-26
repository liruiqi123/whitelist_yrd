#对应规则：原借款单次最高逾期天数大于等于8天，拒绝
#应该设置表名的参数



CREATE  TABLE  whitelist_yrd_step_old_1 as
SELECT *, if(max_overdue_days>= 8,1,0) as flag_old_1
FROM whitelist_yrd_step_new_5