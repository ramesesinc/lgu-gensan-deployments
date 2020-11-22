/* Post Tax Adjustment */
delete from rptledger_item where objid like 'EO%'
;

INSERT INTO rptledger_item (
	objid, 
	parentid, 
	rptledgerfaasid, 
	remarks, 
	basicav, 
	sefav, 
	av, 
	revtype, 
	year, 
	amount, 
	amtpaid, 
	priority, 
	taxdifference, 
	system, 
	fromqtr, 
	toqtr
) 
select 
	concat('EO', rlf.objid, '-basic') as objid, 
	rl.objid as parentid, 
	rlf.objid as rptledgerfaasid, 
	'NEW RATE EO #30, S2020 WITH 50% DISCOUNT' as remarks, 
	rlf.assessedvalue as basicav, 
	rlf.assessedvalue as sefav, 
	rlf.assessedvalue as av, 
	'basic' as revtype, 
	2020 as year, 
	case 
		when rl.rputype = 'land' then round(rlf.assessedvalue * 0.00375 / 4 / 2, 2)
		else round(rlf.assessedvalue * 0.0005 / 4 / 2, 2)
	end as amount, 
	0 as amtpaid, 
	15000 as priority, 
	1 as taxdifference, 
	1 as system, 
	4 as fromqtr, 
	4 as toqtr
from rptledger rl 
inner join rptledgerfaas rlf on rl.objid = rlf.rptledgerid 
where rl.state = 'APPROVED' 
and rlf.state = 'APPROVED'
and 2020 >= rlf.fromyear AND (2020 <= rlf.toyear or rlf.toyear = 0)
;
