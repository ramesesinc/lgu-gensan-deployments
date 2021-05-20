if object_id('dbo.vw_obo_app_doc', 'V') IS NOT NULL 
   drop view dbo.vw_obo_app_doc; 
go
CREATE VIEW vw_obo_app_doc AS select 
a.objid AS objid,
a.appid AS appid,
a.state AS state,
a.doctypeid AS doctypeid,
a.worktypes AS worktypes,
a.remarks AS remarks,
a.amount AS amount,
a.controlid AS controlid,
a.projectcost AS projectcost,
a.equipmentcost AS equipmentcost,
os.org_objid AS org_objid,
ba.task_state AS task_state,
ba.task_assignee_objid AS task_assignee_objid,
iss.controlno AS controlno,
iss.dtissued AS dtissued,
iss.expirydate AS expirydate,
iss.issuedby_name AS issuedby_name,
iss.issuedby_objid AS issuedby_objid,
iss.template AS template,
iss.endorserid AS endorserid,
iss.approverid AS approverid,
od.sectionid AS sectionid 
from obo_app_doc a 
	inner join vw_obo_app ba on a.appid = ba.objid
	inner join obo_doctype od on a.doctypeid = od.objid
	left join obo_section os on od.sectionid = os.objid
	left join obo_control iss on a.controlid = iss.objid
go 