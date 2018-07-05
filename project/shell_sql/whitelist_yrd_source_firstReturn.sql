#创建数据表，沉淀近两期发生过逾期的客户
#设置创建表的参数，不要将代码写死，创建的新表和来源表名称


create table whitelist_yrd_source_firstReturn  AS
select k.*  from (
SELECT  row_number() over(partition by transport_id order by due_date desc) as sort_id,
*
FROM
whitelist_yrd_source_daihou)k
where k.sort_id <2