
if object_id('dbo.vw_obo_app_doc_info', 'V') IS NOT NULL 
   drop view dbo.vw_obo_app_doc_info; 
go
CREATE VIEW vw_obo_app_doc_info AS select 
ai.objid AS objid,
ai.appid AS appid,
ai.parentid AS parentid,
ai.name AS name,
ai.stringvalue AS stringvalue,
ai.decimalvalue AS decimalvalue,
ai.intvalue AS intvalue,
ai.datevalue AS datevalue,
ai.booleanvalue AS booleanvalue,
ai.remarks AS remarks,
ai.lookupkey AS lookupkey,
ai.lookupvalue AS lookupvalue,
ov.datatype AS datatype,
ov.doctypeid AS doctypeid,
ov.unit AS unit,
ov.caption AS caption,
ov.category AS category,
ov.sortorder AS sortorder,
ov.lookuplistname AS lookuplistname,
ov.arrayvalues AS arrayvalues,
ov.multiselect AS multiselect 
from obo_app_doc_info ai 
	inner join obo_variable ov on ov.objid = ai.name
go 