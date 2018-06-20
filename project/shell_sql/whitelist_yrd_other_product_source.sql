CREATE  TABLE  whitelist_yrd_other_product_source as
select a.* from kg.mortgagor_20180613  a
where a.source != 'ce_yrd'
