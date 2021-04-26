DROP VIEW IF EXISTS vw_obo_payment;
CREATE VIEW vw_obo_payment AS 
SELECT bf.*,
oi.objid AS item_objid,
oi.title AS item_title,
oi.sortorder AS item_sortorder,
pt.reftype AS payment_type,
pt.refno AS payment_refno,
pt.refid AS payment_refid,
pt.refdate AS payment_refdate

FROM obo_app_fee bf 
INNER JOIN obo_itemaccount oi ON bf.itemid = oi.objid 
LEFT JOIN obo_payment pt ON bf.appid = pt.appid
WHERE (pt.voided IS NULL OR pt.voided = 0);  
