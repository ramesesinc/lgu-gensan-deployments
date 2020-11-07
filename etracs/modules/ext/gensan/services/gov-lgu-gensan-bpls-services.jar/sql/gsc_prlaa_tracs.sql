[getLobGrossCap]
select 
   ta.objid as applicationid, ta.strbusinessid as businessid, ta.intYear as appyear, 
   (abo.curDeclaredEssGross + abo.curDeclaredNonEssGross) as declaredgross, 
   (abo.curRevisedEssGross + abo.curRevisedNonEssGross) as gross, 
   abo.curCapital as capital, 
   case stat.strtype 
      WHEN 'RENEWAL' THEN 'RENEW'
			when 'REASSESSED (RENEW)' then 'RENEW'
      ELSE stat.strtype 
   end AS apptype, 
   ta.inttype, 
   bl.strbusinessline as lobname, 
   bl.objid as lobid 
from ( 
   select aa.strBusinessID, max(aa.intYear) as intYear 
   from etracs25_capture_business bb 
       inner join tblassessment aa on aa.strBusinessID = bb.oldbusinessid 
   where bb.businessid = $P{businessid} 
   group by aa.strBusinessID 
)t1 
   inner join tblassessment ta on (ta.strBusinessID = t1.strBusinessID and ta.intYear = t1.intYear) 
   inner join sysTblAssessmentType stat ON ta.inttype = stat.objid 
   inner join tblAssessmentBO abo on abo.parentid = ta.objid 
   inner join tblBusinessLine bl ON bl.objid = abo.strBusinessLineID 
where ta.inttype in (0,1,4,6,7) 
order by bl.objid, ta.dtAssessmentDate desc 


[getLobGrossCap.bak]
select distinct 
	ta.objid as applicationid, cb.businessid, ta.intYear as appyear, cl.lob_objid as lobid, 
	(abo.curDeclaredEssGross + abo.curDeclaredNonEssGross) as declaredgross, 
	(abo.curRevisedEssGross + abo.curRevisedNonEssGross) as gross, 
	abo.curCapital as capital, 
	case stat.strtype 
		WHEN 'RENEWAL' THEN 'RENEW'
		when 'REASSESSED (RENEW)' then 'RENEW'
		ELSE stat.strtype 
	end AS apptype 
from ( 
	select aa.strBusinessID, max(aa.intYear) as intYear 
	from etracs25_capture_business bb 
		inner join tblassessment aa on aa.strBusinessID = bb.oldbusinessid 
	where bb.businessid = $P{businessid} 
	group by aa.strBusinessID 
)t1 
	inner join tblassessment ta on (ta.strBusinessID = t1.strBusinessID and ta.intYear = t1.intYear) 
	inner join tblBPLedgerBill tb ON tb.strassessmentid = ta.objid  
	inner join tblAssessmentBO abo on (abo.parentid = ta.objid and abo.strBusinessLineID = tb.strBusinessLineID)
	inner join tblBPLedger b ON b.objid = tb.parentid 
	inner join tblTaxFeeAccount tfa ON tfa.objid = tb.strAcctID 
	inner join sysTblAssessmentType stat ON ta.inttype = stat.objid 
	inner join etracs25_capture_business cb on cb.oldbusinessid = b.strbusinessid 
	inner join etracs25_capture_lob cl on cl.oldlob_objid = tb.strBusinessLineID 
where ta.inttype in (0,1,7)
