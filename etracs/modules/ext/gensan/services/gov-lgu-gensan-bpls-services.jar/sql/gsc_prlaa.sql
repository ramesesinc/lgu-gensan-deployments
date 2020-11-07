[getLobGrossCap]
select 
	t2.businessid, t2.state, a.appyear, al.lobid, 
	lob.classification_objid as lobclassid, al.assessmenttype, 
	case 
		when sum(ai1.decimalvalue) > 0 then sum(ai1.decimalvalue) 
		else sum(ai2.decimalvalue) 
	end as grosscap 
from ( 
	select businessid, state, appyear, lobid, max(txndate) as txndate, sum(iflag) as iflag 
	from ( 
		select 
			a.business_objid as businessid, a.state, a.appyear, a.txndate, al.lobid, 
			(case when al.assessmenttype like 'RETIRE' then -1 else 1 end) as iflag 
		from ( 
			select business_objid, state, max(appyear) as appyear 
			from business_application 
			where business_objid = $P{businessid} 
				and state = 'COMPLETED' 
			group by business_objid, state 
		)bt, business_application a, business_application_lob al 
		where a.business_objid = bt.business_objid 
			and a.appyear = bt.appyear 
			and a.state = bt.state 
			and al.applicationid = a.objid 
	)t1 
	group by businessid, state, appyear, lobid 
	having sum(iflag) > 0 
)t2 
	inner join business_application a on (a.business_objid = t2.businessid and a.appyear = t2.appyear) 
	inner join business_application_lob al on (al.applicationid = a.objid and al.lobid = t2.lobid) 
	left join business_application_info ai1 on (ai1.applicationid = a.objid and ai1.lob_objid = al.lobid and ai1.attribute_objid in ('GROSS','CAPITAL'))
	left join business_application_info ai2 on (ai2.applicationid = a.objid and ai2.lob_objid = al.lobid and ai2.attribute_objid in ('DECLARED_GROSS','DECLARED_CAPITAL'))	
	left join lob on lob.objid = al.lobid 
where a.txndate = t2.txndate 
	and a.state = t2.state 
group by t2.businessid, t2.state, a.appyear, al.lobid, lob.classification_objid, al.assessmenttype  


[getLobGrossCap_bak1]
select t2.*, 
	( 
		select sum(decimalvalue) from business_application_info 
		where applicationid = t2.lastappid 
			and lob_objid = t2.lobid 
			and attribute_objid in ('CAPITAL','GROSS') 
	) as grosscap 
from ( 
	select t1.*, 
		( 
			select aa.objid from business_application aa 
				inner join business_application_lob bb on bb.applicationid = aa.objid  
			where aa.business_objid = t1.businessid 
				and aa.appyear = t1.appyear 
				and aa.state = t1.state 
				and bb.lobid = t1.lobid 
			order by aa.txndate desc limit 1 
		) as lastappid, 
		( 
			select bb.assessmenttype from business_application aa 
				inner join business_application_lob bb on bb.applicationid = aa.objid  
			where aa.business_objid = t1.businessid 
				and aa.appyear = t1.appyear 
				and aa.state = t1.state 
				and bb.lobid = t1.lobid 
			order by aa.txndate desc limit 1 
		) as assessmenttype 
	from ( 
		select distinct tt1.*, alob.lobid 
		from ( 
			select 
				business_objid as businessid, state, max(appyear) as appyear
			from business_application 
			where business_objid = $P{businessid} 
				and state = 'COMPLETED' 
			group by business_objid, state  
		)tt1 
			inner join business_application a on (a.business_objid = tt1.businessid and a.appyear = tt1.appyear) 
			inner join business_application_lob alob on alob.applicationid = a.objid 
		where a.state = tt1.state 
	)t1 
)t2 
where t2.assessmenttype in ('NEW','RENEW') 


[findAttribute]
select a.*, 
	case 
		when a.lobattributeid = 'PRLAA_0.05' then 1.05 
		when a.lobattributeid = 'PRLAA_0.00' then 1.00
	end as rate 
from lob_lobattribute a 
where a.lobid = $P{lobid} 
	and a.lobattributeid like 'PRLAA%' 
order by a.lobattributeid 


[getPRLAAGross]
select lob_objid as lobid, decimalvalue as gross 
from business_application_info 
where applicationid = $P{applicationid} 
	and attribute_objid = 'PRLAA_GROSS' 


[getGross]
select t1.*, 
	(
		select sum(decimalvalue) from business_application_info 
		where applicationid = t1.applicationid 
			and lob_objid = t1.lobid 
			and attribute_objid = 'DECLARED_GROSS' 
	) as declaredgross, 
	(
		select sum(decimalvalue) from business_application_info 
		where applicationid = t1.applicationid 
			and lob_objid = t1.lobid 
			and attribute_objid = 'PRLAA_GROSS' 
	) as gross  
from ( 
	select distinct applicationid, lob_objid as lobid 
	from business_application_info 
	where applicationid = $P{applicationid} 
		and lob_objid is not null 
)t1 


[findLob]
select * 
from lob 
where objid = $P{objid} 
