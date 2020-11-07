[getList]
select t2.*, 
	case when t2.migrationcount=0 then null else 'MIGRATED' end as migrationstatus
from ( 
	select t1.*, 
		(select count(*) from etracs25_capture_business where oldbusinessid = t1.objid) as migrationcount
	from ( 
		select top 100 
			b.ObjID AS objid, 
			ta.intyear AS appyear, 
			ta.inttype, 
			case stat.strtype 
				WHEN 'RENEWAL' THEN 'RENEW'
				ELSE stat.strtype 
			end AS apptype, 
			b.strTradeName AS tradename, 
			strBusinessAddress AS address,
			t.strTaxpayerID AS ownerid, 
			t.strTaxpayer AS ownername, 
			t.strTaxpayerAddress AS owneraddress, 
			ta.dtassessmentdate as dtfiled, 
			ta.objid as applicationid 
		from ( 
			select strBusinessID, max(intYear) as maxYear 
			from tblAssessment 
			group by strBusinessID 
		)t1 
			inner join tblAssessment ta on (ta.strBusinessID = t1.strBusinessID and ta.intYear = t1.maxYear) 
			inner join tblBusiness b on b.ObjID = ta.strBusinessID 
			inner join tblTaxpayer t on t.strTaxpayerID = b.strTaxpayerID 
			inner join tblBPLedger bpl on bpl.strBusinessID = b.ObjID 
			inner join sysTblAssessmentType stat ON stat.objid = ta.inttype 
		where 1=1 and ${filter} 
		order by ta.intyear desc, b.strTradeName, ta.dtassessmentdate 
	)t1  
)t2 


[removeCaptureBusiness]
delete from etracs25_capture_business where oldbusinessid = $P{objid} 


[findApplication]
select 
	b.ObjID AS objid, 
	ta.intyear AS appyear, 
	stat.strtype as apptype,  
	ta.inttype, 
	b.strTradeName AS tradename, 
	strBusinessAddress AS address,
	t.strTaxpayerID AS ownerid, 
	t.strTaxpayer AS ownername, 
	t.strTaxpayerAddress AS owneraddress, 
	ta.dtassessmentdate as dtfiled, 
	ta.objid as applicationid, 
	b.intYearStarted as yearstarted, 
	b.strOrganizationTypeID as orgtype, 
	b.lngBIN as bin 
from tblAssessment ta 
	inner join tblBusiness b on b.ObjID = ta.strBusinessID 
	inner join tblTaxpayer t on t.strTaxpayerID = b.strTaxpayerID 
	inner join tblBPLedger bpl on bpl.strBusinessID = b.ObjID 
	inner join sysTblAssessmentType stat ON stat.objid = ta.inttype 
where ta.objid = $P{applicationid} 


[getApplicationLobs]
select 
	ta.objid as applicationid, ta.intYear as appyear, 
	bl.objid as lobid, bl.strbusinessline as lobname, 
	ta.inttype, stat.strtype as apptype, abo.curCapital as capital, 
	(abo.curDeclaredEssGross + abo.curDeclaredNonEssGross) as declaredgross, 
	(abo.curRevisedEssGross + abo.curRevisedNonEssGross) as gross 
from tblassessment ta 
   inner join sysTblAssessmentType stat ON ta.inttype = stat.objid 
   inner join tblAssessmentBO abo on abo.parentid = ta.objid 
   inner join tblBusinessLine bl ON bl.objid = abo.strBusinessLineID 
where ta.objid = $P{applicationid} 
