
if object_id('dbo.vw_obo_payment', 'V') IS NOT NULL 
   drop view dbo.vw_obo_payment; 
go
CREATE VIEW vw_obo_payment AS select 
bf.objid AS objid,
bf.appid AS appid,
bf.parentid AS parentid,
bf.itemid AS itemid,
bf.amount AS amount,
bf.amtpaid AS amtpaid,
bf.remarks AS remarks,
oi.objid AS item_objid,
oi.title AS item_title,
oi.sortorder AS item_sortorder,
pt.reftype AS payment_type,
pt.refno AS payment_refno,
pt.refid AS payment_refid,
pt.refdate AS payment_refdate 
from obo_app_fee bf 
	inner join obo_itemaccount oi on bf.itemid = oi.objid
	left join obo_payment pt on bf.appid = pt.appid
where (pt.voided is null or pt.voided = 0)
go 