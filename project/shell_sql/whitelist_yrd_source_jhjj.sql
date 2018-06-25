#沉淀江湖救急数据，且沉淀条件是 江湖救急业务线上，逾期或非正常结清的用户
#该脚本需要添加时间参数

CREATE TABLE  whitelist_yrd_source_jhjj AS
select distinct id_number  from kg.mortgagor_20180613 where source like '%jhjj%'
and  process_status not like '%已结清%'
union all
select distinct id_number from  kg.mortgagor_20180613 where source like '%jhjj%'
and  total_overdue_days > 0

