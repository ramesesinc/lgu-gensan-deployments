if object_id('dbo.vw_obo_app', 'V') IS NOT NULL 
   drop view dbo.vw_obo_app; 
go
CREATE VIEW vw_obo_app AS select 
app.objid AS objid,
app.doctypeid AS doctypeid,
app.appno AS appno,
app.appdate AS appdate,
app.trackingno AS trackingno,
app.applicantid AS applicantid,
app.contact_name AS contact_name,
app.contact_detail AS contact_detail,
app.contact_email AS contact_email,
app.contact_mobileno AS contact_mobileno,
app.contact_phoneno AS contact_phoneno,
app.txnmode AS txnmode,
app.orgcode AS orgcode,
app.createdby_objid AS createdby_objid,
app.createdby_name AS createdby_name,
app.dtcreated AS dtcreated,
'building_permit' AS appclass,bp.title AS title,
ltrim(concat(
   (case when bp.location_unitno is null then '' else concat(' ',bp.location_unitno) end),
   (case when bp.location_bldgno is null then '' else concat(' ',bp.location_bldgno) end),
   (case when bp.location_bldgname is null then '' else concat(' ',bp.location_bldgname) end),
   (case when bp.location_lotno is null then '' else concat(' Lot.',bp.location_lotno) end),
   (case when bp.location_blockno is null then '' else concat(' Blk.',bp.location_blockno) end),
   (case when bp.location_street is null then '' else concat(' ',bp.location_street) end),
   (case when bp.location_subdivision is null then '' else concat(', ',bp.location_subdivision) end),
   (case when bp.location_barangay_name is null then '' else concat(', ',bp.location_barangay_name) end)
)) AS location_text,
be.name AS applicant_name,
be.address_text AS applicant_address_text,
be.profileid AS applicant_profileid,
bt.state AS task_state,
bt.assignee_objid AS task_assignee_objid,
'building_permit' AS processname,
'BUILDING PERMIT' AS doctitle,
'vw_building_permit' AS schemaname
from obo_app app 
   inner join building_permit bp on app.objid = bp.objid 
   inner join obo_app_entity be on app.applicantid = be.objid 
   inner join building_permit_task bt on bp.taskid = bt.taskid 
union 
select 
app.objid AS objid,
app.doctypeid AS doctypeid,
app.appno AS appno,
app.appdate AS appdate,
app.trackingno AS trackingno,
app.applicantid AS applicantid,
app.contact_name AS contact_name,
app.contact_detail AS contact_detail,
app.contact_email AS contact_email,
app.contact_mobileno AS contact_mobileno,
app.contact_phoneno AS contact_phoneno,
app.txnmode AS txnmode,
app.orgcode AS orgcode,
app.createdby_objid AS createdby_objid,
app.createdby_name AS createdby_name,
app.dtcreated AS dtcreated,
'occupancy_certificate' AS appclass,bp.title AS title,
ltrim(concat(
   (case when bp.location_unitno is null then '' else concat(' ',bp.location_unitno) end),
   (case when bp.location_bldgno is null then '' else concat(' ',bp.location_bldgno) end),
   (case when bp.location_bldgname is null then '' else concat(' ',bp.location_bldgname) end),
   (case when bp.location_lotno is null then '' else concat(' Lot.',bp.location_lotno) end),
   (case when bp.location_blockno is null then '' else concat(' Blk.',bp.location_blockno) end),
   (case when bp.location_street is null then '' else concat(' ',bp.location_street) end),
   (case when bp.location_subdivision is null then '' else concat(', ',bp.location_subdivision) end),
   (case when bp.location_barangay_name is null then '' else concat(', ',bp.location_barangay_name) end)
)) AS location_text,
be.name AS applicant_name,
be.address_text AS applicant_address_text,
be.profileid AS applicant_profileid,
bt.state AS task_state,
bt.assignee_objid AS task_assignee_objid,
'occupancy_certificate' AS processname,
'OCCUPANCY CERTIFICATE' AS doctitle,
'vw_occupancy_certificate' AS schemaname
from obo_app app 
   inner join occupancy_certificate oc on oc.objid = app.objid
   inner join building_permit bp on oc.bldgpermitid = bp.objid
   inner join obo_app_entity be on app.applicantid = be.objid
   inner join occupancy_certificate_task bt on oc.taskid = bt.taskid
go 
