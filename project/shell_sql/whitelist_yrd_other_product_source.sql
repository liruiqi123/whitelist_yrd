#沉淀非宜人贷，其他业务线的数据
#设置时间参数 保证每天取当前最新的数据表信息
#设置创建表的参数，不要将代码写死，创建的新表和来源表名称

CREATE  TABLE  whitelist_yrd_other_product_source as
select a.* from kg.mortgagor_20180624  a
where a.source != 'ce_yrd'
