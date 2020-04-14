drop view if exists vw_cashbook_cashreceipt
; 
CREATE VIEW vw_cashbook_cashreceipt AS 
select  
  c.objid AS objid, 
  c.txndate AS txndate,
  cast(c.receiptdate as date) AS refdate, 
  c.objid AS refid, 
  c.receiptno AS refno,'cashreceipt' AS reftype,
  concat(ct.name,' (',c.paidby,')') AS particulars, 
  ci.item_fund_objid AS fundid, 
  c.collector_objid AS collectorid, 
  ci.amount AS dr,0.0 AS cr, 
  c.formno AS formno, 
  c.formtype AS formtype, 
  c.series AS series, 
  c.controlid AS controlid, 
  c.txndate AS sortdate, 
  c.receiptdate AS receiptdate, 
  c.objid AS receiptid, 
  c.remittanceid, 
	r.controldate as remittancedate, 
	r.dtposted as remittancedtposted
from cashreceipt c 
  inner join collectiontype ct on ct.objid = c.collectiontype_objid
  inner join cashreceiptitem ci on ci.receiptid = c.objid
	left join remittance r on r.objid = c.remittanceid 
;


drop view if exists vw_cashbook_cashreceipt_share
; 
CREATE VIEW vw_cashbook_cashreceipt_share AS 
select  
  c.objid AS objid, 
  c.txndate AS txndate,
  cast(c.receiptdate as date) AS refdate, 
  c.objid AS refid, 
  c.receiptno AS refno,'cashreceipt' AS reftype,
  concat(ct.name,' (',c.paidby,')') AS particulars, 
  ia.fund_objid AS fundid, 
  c.collector_objid AS collectorid, 
  cs.amount AS dr,0.0 AS cr, 
  c.formno AS formno, 
  c.formtype AS formtype, 
  c.series AS series, 
  c.controlid AS controlid, 
  c.txndate AS sortdate, 
  c.receiptdate AS receiptdate, 
  c.objid AS receiptid, 
  cs.refitem_objid AS refitemid, 
  c.remittanceid, 
  r.controldate as remittancedate, 
  r.dtposted as remittancedtposted   
from cashreceipt c 
  inner join collectiontype ct on ct.objid = c.collectiontype_objid 
  inner join cashreceipt_share cs on cs.receiptid = c.objid 
  inner join itemaccount ia on ia.objid = cs.payableitem_objid 
  left join remittance r on r.objid = c.remittanceid 
;