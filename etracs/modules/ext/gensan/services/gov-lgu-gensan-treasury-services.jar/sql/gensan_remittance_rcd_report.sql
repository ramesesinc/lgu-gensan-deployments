[getCollectionSummaries]
select 
  t1.fundid, fund.code as fundcode, fund.title as fundtitle, 
  sum(t1.amount)-sum(t1.share) as amount 
from ( 
  select fundid, sum(amount) as amount, 0.0 as share 
  from vw_remittance_cashreceiptitem 
  where remittanceid = $P{remittanceid}  
  group by fundid 

  union all 

  select t1.fundid, 0.0 as amount, sum(cs.amount) as share 
  from ( 
    select receiptid, fundid, acctid 
    from vw_remittance_cashreceiptitem 
    where remittanceid = $P{remittanceid}   
    group by receiptid, fundid, acctid
  )t1, vw_remittance_cashreceiptshare cs 
  where cs.receiptid = t1.receiptid and cs.refacctid = t1.acctid 
  group by t1.fundid 

  union all 

  select fundid, sum(amount) as amount, 0.0 as share  
  from vw_remittance_cashreceiptshare  
  where remittanceid = $P{remittanceid}   
  group by fundid 
)t1, fund 
where fund.objid = t1.fundid 
group by t1.fundid, fund.code, fund.title 
order by fund.code, fund.title 
