/*================================
* ADVANCE PAYMENT: 2021
================================*/

drop table if exists tmp_ledger_with_2021_advance_payment
;

create table tmp_ledger_with_2021_advance_payment
as
select 
	rl.objid as rptledgerid
from rptledger rl
	inner join rptpayment rp on rl.objid = rp.refid 
	inner join cashreceipt cr on rp.receiptid = cr.objid 
	left join cashreceipt_void cv on cr.objid = cv.receiptid
where cr.receiptdate < '2020-11-01'
and rl.lastyearpaid = 2021
;

create index ix_rptledgerid on tmp_ledger_with_2021_advance_payment(rptledgerid)
;

-- insert tax adjustment 
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
	concat('AEO', rlf.objid, '-basic') as objid, 
	rl.objid as parentid, 
	rlf.objid as rptledgerfaasid, 
	'NEW RATE EO #30, S2020' as remarks, 
	rlf.assessedvalue as basicav, 
	rlf.assessedvalue as sefav, 
	rlf.assessedvalue as av, 
	'basic' as revtype, 
	2021 as year, 
	case 
		when rl.rputype = 'land' then round(rlf.assessedvalue * 0.00375 / 4, 2)
		else round(rlf.assessedvalue * 0.0005 / 4, 2)
	end as amount, 
	0 as amtpaid, 
	15000 as priority, 
	1 as taxdifference, 
	1 as system, 
	1 as fromqtr, 
	4 as toqtr
from rptledger rl 
inner join tmp_ledger_with_2021_advance_payment x on rl.objid = x.rptledgerid
inner join rptledgerfaas rlf on rl.objid = rlf.rptledgerid 
where rl.state = 'APPROVED' 
and rlf.state = 'APPROVED'
and 2020 >= rlf.fromyear AND (2020 <= rlf.toyear or rlf.toyear = 0)
;



/*================================
* ADVANCE PAYMENT: 2022
================================*/

drop table if exists tmp_ledger_with_2022_advance_payment
;

create table tmp_ledger_with_2022_advance_payment
as
select 
	rl.objid as rptledgerid,
	rl.tdno
from rptledger rl
	inner join rptpayment rp on rl.objid = rp.refid 
	inner join cashreceipt cr on rp.receiptid = cr.objid 
	left join cashreceipt_void cv on cr.objid = cv.receiptid
where cr.receiptdate < '2020-11-01'
and rl.lastyearpaid = 2022
;

create index ix_rptledgerid on tmp_ledger_with_2022_advance_payment(rptledgerid)
;

-- insert tax adjustment for 2021
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
	concat('AEO2021', rlf.objid, '-basic') as objid, 
	rl.objid as parentid, 
	rlf.objid as rptledgerfaasid, 
	'NEW RATE EO #30, S2020' as remarks, 
	rlf.assessedvalue as basicav, 
	rlf.assessedvalue as sefav, 
	rlf.assessedvalue as av, 
	'basic' as revtype, 
	2021 as year, 
	case 
		when rl.rputype = 'land' then round(rlf.assessedvalue * 0.00375 / 4, 2)
		else round(rlf.assessedvalue * 0.0005 / 4, 2)
	end as amount, 
	0 as amtpaid, 
	15000 as priority, 
	1 as taxdifference, 
	1 as system, 
	4 as fromqtr, 
	4 as toqtr
from rptledger rl 
inner join tmp_ledger_with_2022_advance_payment x on rl.objid = x.rptledgerid
inner join rptledgerfaas rlf on rl.objid = rlf.rptledgerid 
where rl.state = 'APPROVED' 
and rlf.state = 'APPROVED'
and 2020 >= rlf.fromyear AND (2020 <= rlf.toyear or rlf.toyear = 0)
and rl.objid = 'FRTD00145049'
;


-- insert tax adjustment for 2022
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
	concat('AEO2022', rlf.objid, '-basic') as objid, 
	rl.objid as parentid, 
	rlf.objid as rptledgerfaasid, 
	'NEW RATE EO #30, S2020' as remarks, 
	rlf.assessedvalue as basicav, 
	rlf.assessedvalue as sefav, 
	rlf.assessedvalue as av, 
	'basic' as revtype, 
	2022 as year, 
	case 
		when rl.rputype = 'land' then round(rlf.assessedvalue * 0.00375 / 4, 2)
		else round(rlf.assessedvalue * 0.0005 / 4, 2)
	end as amount, 
	0 as amtpaid, 
	15000 as priority, 
	1 as taxdifference, 
	1 as system, 
	4 as fromqtr, 
	4 as toqtr
from rptledger rl 
inner join tmp_ledger_with_2022_advance_payment x on rl.objid = x.rptledgerid
inner join rptledgerfaas rlf on rl.objid = rlf.rptledgerid 
where rl.state = 'APPROVED' 
and rlf.state = 'APPROVED'
and 2020 >= rlf.fromyear AND (2020 <= rlf.toyear or rlf.toyear = 0)
;



