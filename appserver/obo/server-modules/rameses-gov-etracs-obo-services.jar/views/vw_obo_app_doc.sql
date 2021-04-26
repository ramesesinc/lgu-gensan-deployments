DROP VIEW IF EXISTS vw_obo_app_doc; 
CREATE VIEW vw_obo_app_doc AS 
SELECT 
   a.*,
   os.org_objid AS org_objid,
   ba.task_state AS task_state,
   ba.task_assignee_objid AS task_assignee_objid,
   iss.controlno,
   iss.dtissued,
   iss.expirydate,
   iss.issuedby_name,
   iss.issuedby_objid,
   iss.template,
   iss.endorserid,
   iss.approverid,
   od.sectionid
FROM obo_app_doc a  
INNER JOIN obo_doctype od ON a.doctypeid = od.objid 
LEFT JOIN obo_section os ON od.sectionid = os.objid
LEFT JOIN obo_control iss ON a.controlid = iss.objid 
INNER JOIN vw_obo_app ba ON a.appid = ba.objid 
