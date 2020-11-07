insert into sys_rule_fact_field (
	objid, parentid, `name`, title, datatype, sortorder, `handler`, vardatatype 
)
select * 
from ( 
	select 
		concat(a.parentid,'-violatortype') as objid, a.parentid, 'violatortype' as `name`, 
		'Violator Type' as title, 'string' as datatype, 3 as sortorder, 
		'string' as `handler`, 'string' as vardatatype 
	from ( 
		select objid as parentid 
		from sys_rule_fact 
		where factclass like 'ovs.facts.ViolationTicket' 
	)a
)aa
where (
	select count(*) from sys_rule_fact_field 
	where parentid = aa.parentid and `name` = aa.name 
) = 0 
;
