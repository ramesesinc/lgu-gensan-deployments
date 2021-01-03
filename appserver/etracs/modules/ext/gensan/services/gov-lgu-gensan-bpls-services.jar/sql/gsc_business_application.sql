[getLobGrossCap]
select alob.applicationid, alob.lobid, alob.assessmenttype, 
	(
		select sum(decimalvalue) from business_application_info 
		where applicationid = alob.applicationid 
			and lob_objid = alob.lobid 
			and attribute_objid = 'CAPITAL' 
	) as capital, 
	(
		select sum(decimalvalue) from business_application_info 
		where applicationid = alob.applicationid 
			and lob_objid = alob.lobid 
			and attribute_objid = 'GROSS' 
	) as gross, 
	(
		select sum(decimalvalue) from business_application_info 
		where applicationid = alob.applicationid 
			and lob_objid = alob.lobid 
			and attribute_objid = 'ACTUAL_GROSS' 
	) as actualgross 
from business_application_lob alob 
where alob.applicationid = $P{applicationid}


[findApplication]
select * from business_application where objid = $P{objid}

[updateAppState]
update business_application set state = $P{state} where objid = $P{objid} 
