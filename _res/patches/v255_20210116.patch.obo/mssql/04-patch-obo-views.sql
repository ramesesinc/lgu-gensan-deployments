USE obo 
go 


CREATE VIEW vw_building_permit_doc AS 
select 
a.objid AS objid,
a.appid AS appid,
a.state AS state,
a.doctypeid AS doctypeid,
a.designprofessionalid AS designprofessionalid,
a.supervisorid AS supervisorid,
a.worktypes AS worktypes,
a.contractorname AS contractorname,
a.remarks AS remarks,
a.amount AS amount,
a.controlid AS controlid,
a.occupancytypeid AS occupancytypeid,
a.projectcost AS projectcost,
a.equipmentcost AS equipmentcost,
os.org_objid AS org_objid,
bt.state AS appstate,
bt.assignee_objid AS appuserid,
iss.controlno AS controlno,
iss.dtissued AS dtissued,
iss.expirydate AS expirydate,
iss.issuedby_name AS issuedby_name,
iss.issuedby_objid AS issuedby_objid,
iss.remarks AS issue_remarks,
iss.template AS template,
od.sectionid AS sectionid 
from building_permit_doc a 
  inner join obo_doctype od on a.doctypeid = od.objid 
  left join obo_section os on od.sectionid = os.objid 
  left join obo_control iss on a.controlid = iss.objid 
  inner join building_permit ba on a.appid = ba.objid 
  left join building_permit_task bt on ba.taskid = bt.taskid
go 


CREATE VIEW vw_building_permit_fee AS 
select 
a.objid AS objid,
a.appid AS appid,
a.parentid AS parentid,
a.itemid AS itemid,
a.amount AS amount,
a.amtpaid AS amtpaid,
a.remarks AS remarks,
sd.doctypeid AS doctypeid 
from building_permit_fee a 
  left join building_permit_doc sd on a.parentid = sd.objid
go 


CREATE VIEW vw_building_permit_fee_payment AS 
select 
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
from building_permit_fee bf 
  inner join obo_itemaccount oi on bf.itemid = oi.objid 
  left join building_permit_payment pt on bf.appid = pt.appid 
where (pt.voided is null OR pt.voided = 0)
go 


CREATE VIEW vw_building_permit_info AS 
select 
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
ov.datatype AS datatype,
ov.doctypeid AS doctypeid,
ov.unit AS unit,
ov.caption AS caption,
ov.category AS category,
ov.sortorder AS sortorder 
from building_permit_info ai 
  inner join obo_variable ov on ov.objid = ai.name
go 


CREATE VIEW vw_building_permit_online AS 
select 
a.objid AS objid,
a.appno AS appno,
a.orgcode AS orgcode,
a.trackingno AS trackingno,
a.apptype AS apptype,
a.appdate AS appdate,
a.taskid AS taskid,
a.contact_name AS contact_name,
a.contact_detail AS contact_detail,
a.contact_email AS contact_email,
a.contact_mobileno AS contact_mobileno,
a.txnmode AS txnmode,
a.txntype AS txntype,
a.controlid AS controlid,
a.amount AS amount,
a.applicantid AS applicantid,
a.description AS description,
a.title AS title,
a.occupancytypeid AS occupancytypeid,
a.numunits AS numunits,
a.fixedcost AS fixedcost,
a.projectcost AS projectcost,
a.dtproposedconstruction AS dtproposedconstruction,
a.dtexpectedcompletion AS dtexpectedcompletion,
a.totalfloorarea AS totalfloorarea,
a.height AS height,
a.numfloors AS numfloors,
a.worktypes AS worktypes,
a.zoneclassid AS zoneclassid,
a.zone AS zone,
a.location_lotno AS location_lotno,
a.location_blockno AS location_blockno,
a.location_street AS location_street,
a.location_barangay_name AS location_barangay_name,
a.location_barangay_objid AS location_barangay_objid,
a.supervisorid AS supervisorid,
a.location_unitno AS location_unitno,
a.location_bldgno AS location_bldgno,
a.location_bldgname AS location_bldgname,
a.location_subdivision AS location_subdivision,
a.createdby_objid AS createdby_objid,
a.createdby_name AS createdby_name,
a.dtcreated AS dtcreated,
bt.objid AS occupancytype_objid,
bt.title AS occupancytype_title,
od.objid AS occupancytype_division_objid,
od.title AS occupancytype_division_title,
og.objid AS occupancytype_group_objid,
og.title AS occupancytype_group_title,
e.name AS applicant_name,
e.address_text AS applicant_address_text,
t.state AS task_state 
from building_permit a 
  inner join obo_occupancy_type bt on a.occupancytypeid = bt.objid 
  inner join obo_occupancy_type_division od on bt.divisionid = od.objid 
  inner join obo_occupancy_type_group og on od.groupid = og.objid 
  inner join building_permit_entity e on a.applicantid = e.objid 
  left join building_permit_task t on a.taskid = t.taskid 
where a.taskid is null 
go 


CREATE VIEW vw_obo_doctype AS 
select 
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
os.org_objid AS org_objid,
os.org_name AS org_name 
from obo_doctype od 
  left join obo_section os on od.sectionid = os.objid
go 


CREATE VIEW vw_obo_doctype_itemaccount AS 
select  
a.objid AS objid, 
a.title AS title, 
e.typeid AS typeid  
from obo_itemaccount a 
  inner join obo_doctype_itemaccount e on a.objid = e.itemid
go 


CREATE VIEW vw_obo_occupancy_type AS 
select 
ot.objid AS objid,
ot.divisionid AS divisionid,
ot.title AS title,
od.objid AS division_objid,
od.title AS division_title,
og.objid AS group_objid,
og.title AS group_title 
from obo_occupancy_type ot 
  inner join obo_occupancy_type_division od on ot.divisionid = od.objid 
  inner join obo_occupancy_type_group og on od.groupid = og.objid 
go 


CREATE VIEW vw_obo_professional AS 
select 
pi.objid AS objid,
pi.firstname AS firstname,
pi.middlename AS middlename,
pi.lastname AS lastname,
pi.resident AS resident,
pi.address_objid AS address_objid,
pi.address_text AS address_text,
pi.address_unitno AS address_unitno,
pi.address_bldgno AS address_bldgno,
pi.address_bldgname AS address_bldgname,
pi.address_street AS address_street,
pi.address_subdivision AS address_subdivision,
pi.address_barangay_objid AS address_barangay_objid,
pi.address_barangay_name AS address_barangay_name,
pi.address_citymunicipality AS address_citymunicipality,
pi.address_province AS address_province,
pi.tin AS tin,
pi.email AS email,
pi.mobileno AS mobileno,
pi.phoneno AS phoneno,
pi.id_idno AS id_idno,
pi.id_type_name AS id_type_name,
pi.id_dtissued AS id_dtissued,
pi.id_placeissued AS id_placeissued,
pi.profession AS profession,
pi.prc_idno AS prc_idno,
pi.prc_dtissued AS prc_dtissued,
pi.prc_dtvalid AS prc_dtvalid,
pi.prc_placeissued AS prc_placeissued,
pi.ptr_refno AS ptr_refno,
pi.ptr_dtissued AS ptr_dtissued,
pi.ptr_placeissued AS ptr_placeissued,
pi.profid AS profid,
pi.system AS system,
(pi.lastname +', '+ pi.firstname +' '+ substring(pi.middlename,0,1) +'.') AS name,
id.caption AS id_type_caption,
id.title AS id_type_title 
from  obo_professional p 
  inner join obo_professional_info pi on p.infoid = pi.objid 
  left join idtype id on pi.id_type_name = id.name 
go 


CREATE VIEW vw_occupancy_permit_doc AS 
select 
a.objid AS objid,
a.appid AS appid,
a.state AS state,
a.doctypeid AS doctypeid,
a.remarks AS remarks,
a.amount AS amount,
a.controlid AS controlid,
os.org_objid AS org_objid,
bt.state AS appstate,
bt.assignee_objid AS appuserid,
iss.controlno AS controlno,
iss.dtissued AS dtissued,
iss.expirydate AS expirydate,
iss.issuedby_name AS issuedby_name,
iss.issuedby_objid AS issuedby_objid,
iss.remarks AS issue_remarks,
iss.template AS template,
od.sectionid AS sectionid 
from occupancy_permit_doc a 
  inner join obo_doctype od on a.doctypeid = od.objid 
  inner join occupancy_permit ba on a.appid = ba.objid 
  inner join occupancy_permit_task bt on ba.taskid = bt.taskid 
  left join obo_control iss on a.controlid = iss.objid 
  left join obo_section os on od.sectionid = os.objid 
go 


CREATE VIEW vw_occupancy_permit_fee AS 
select 
a.objid AS objid,
a.appid AS appid,
a.parentid AS parentid,
a.itemid AS itemid,
a.amount AS amount,
a.amtpaid AS amtpaid,
a.remarks AS remarks,
sd.doctypeid AS doctypeid 
from occupancy_permit_fee a 
  left join occupancy_permit_doc sd on a.parentid = sd.objid
go 


CREATE VIEW vw_occupancy_permit_info AS 
select 
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
ov.datatype AS datatype,
ov.doctypeid AS doctypeid,
ov.unit AS unit,
ov.caption AS caption,
ov.category AS category,
ov.sortorder AS sortorder 
from occupancy_permit_info ai 
  inner join obo_variable ov on ov.objid = ai.name 
go 
