srctable = whitelist_yrd_step_2_years
newtable = whitelist_yrd_step_old_1_MaxOverdueDays

CREATE  TABLE  $newtable as
SELECT *, if(max_overdue_days>= 8,1,0) as max_overdue_days_flag
FROM $srctable