
if object_id('dbo.vw_obo_doctype', 'V') IS NOT NULL 
   drop view dbo.vw_obo_doctype; 
go
CREATE VIEW vw_obo_doctype AS select 
od.objid AS objid,
od.title AS title,
od.sectionid AS sectionid,
od.sortorder AS sortorder,
od.type AS type,
od.template AS template,
od.autocreate AS autocreate,
od.issuetype AS issuetype,
od.requirefee AS requirefee,
od.appnopattern AS appnopattern,
od.controlnopattern AS controlnopattern,
od.subtypeof AS subtypeof,
od.apptype AS apptype,
od.system AS system,
od.role AS role,
od.endorserid AS endorserid,
od.approverid AS approverid,
od.reportheader AS reportheader,
od.refdoc AS refdoc,
od.includeinemail AS includeinemail,
os.org_objid AS org_objid,
os.org_name AS org_name 
from obo_doctype od 
	left join obo_section os on od.sectionid = os.objid
go 