[getLobs]
select t2.*, 
	( 
		select sum(decimalvalue) from business_application_info 
		where applicationid = t2.lastappid 
			and lob_objid = t2.lobid 
			and attribute_objid = 'DECLARED_CAPITAL'
	) as declaredcapital, 
	( 
		select sum(decimalvalue) from business_application_info 
		where applicationid = t2.lastappid 
			and lob_objid = t2.lobid 
			and attribute_objid = 'DECLARED_GROSS'
	) as declaredgross, 
	( 
		select sum(decimalvalue) from business_application_info 
		where applicationid = t2.lastappid 
			and lob_objid = t2.lobid 
			and attribute_objid = 'PRLAA_GROSS'
	) as prlaagross 
from ( 
	select t1.*, 
		( 
			select aa.objid from business_application aa 
				inner join business_application_lob bb on bb.applicationid = aa.objid  
			where aa.business_objid = t1.businessid 
				and aa.appyear = t1.appyear 
				and bb.lobid = t1.lobid 
			order by aa.txndate desc limit 1 
		) as lastappid, 
		( 
			select bb.assessmenttype from business_application aa 
				inner join business_application_lob bb on bb.applicationid = aa.objid  
			where aa.business_objid = t1.businessid 
				and aa.appyear = t1.appyear 
				and bb.lobid = t1.lobid 
			order by aa.txndate desc limit 1 
		) as assessmenttype 
	from ( 
		select distinct 
			a.business_objid as businessid, a.appyear, alob.lobid 
		from business_application a 
			inner join business_application_lob alob on alob.applicationid = a.objid 
		where a.business_objid = $P{businessid} 
			and a.appyear = $P{appyear} 
	)t1 
)t2 
where t2.assessmenttype in ('NEW','RENEW') 
