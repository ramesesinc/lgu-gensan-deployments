[findApp]
select 
	a.objid as applicationid, a.appno, a.appyear, a.apptype, a.txndate, 
	b.objid as businessid, b.bin, a.tradename, b.businessname, a.businessaddress, 
	b.owner_objid as taxpayerid, a.ownername as taxpayername, a.owneraddress as taxpayeraddress, 
	(select sum(amount) from business_receivable where applicationid = a.objid) as amount, 
	(select sum(amount) from business_receivable where applicationid = a.objid and taxfeetype='TAX') as tax, 
	(select sum(amount) from business_receivable where applicationid = a.objid and taxfeetype='REGFEE') as regfee, 
	(select sum(amount) from business_receivable where applicationid = a.objid and taxfeetype='OTHERCHARGE') as othercharge, 
	( 
		select sum(br.amount) 
		from business_receivable br, business_billitem_txntype tt 
		where br.applicationid = a.objid 
			and tt.acctid = br.account_objid 
			and tt.domain='BPLS' and tt.role='OBO' 
	) as obofee 
from business_application a 
	inner join business b on b.objid = a.business_objid 
where a.objid = $P{objid} 


[findPayment]
select p.*, c.collector_objid, c.collector_name
from business_payment p 
	inner join cashreceipt c on c.objid = p.refid 
where p.applicationid = $P{applicationid} 
order by p.refdate desc 
