[getItems]
select t1.* 
from ( 
	select 
		pl.lobid, pl.name as lobname, pl.txndate, a.txndate as apptxndate, bal.assessmenttype, 
		(
			select sum(decimalvalue) from business_application_info 
			where applicationid = a.objid and lob_objid = pl.lobid and attribute_objid = 'CAPITAL' 
		) as capital, 
		(
			select sum(decimalvalue) from business_application_info 
			where applicationid = a.objid and lob_objid = pl.lobid and attribute_objid = 'GROSS' 
		) as gross, 
		(
			select sum(decimalvalue) from business_application_info 
			where applicationid = a.objid and lob_objid = pl.lobid and attribute_objid = 'ACTUAL_GROSS' 
		) as actualgross, 
		(
			select sum(amount) from business_receivable 
			where applicationid = a.objid and lob_objid = pl.lobid and taxfeetype = 'TAX'
		) as tax, 
		(
			select sum(amount) from business_receivable 
			where applicationid = a.objid and lob_objid = pl.lobid and taxfeetype = 'REGFEE'
		) as fee 
	from business_permit p 
		inner join business_permit_lob pl on pl.parentid = p.objid 
		inner join business_application a on (a.business_objid = p.businessid and a.appyear = p.activeyear) 
		inner join business_application_lob bal on (bal.applicationid = a.objid and bal.lobid = pl.lobid) 
	where p.objid = $P{permitid}
)t1 
where t1.txndate = t1.apptxndate 
order by t1.txndate, t1.lobname  
