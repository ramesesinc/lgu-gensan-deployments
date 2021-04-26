DROP VIEW IF EXISTS vw_obo_app; 
CREATE VIEW vw_obo_app AS 

SELECT 
   bp.objid, 
   'building_permit' AS apptype,    
   bp.appno AS appno,
   bp.trackingno,
   bp.title AS title,
   
   LTRIM(CONCAT(
      (CASE WHEN bp.location_unitno IS NULL THEN '' ELSE CONCAT(' ', bp.location_unitno) END),
      (CASE WHEN bp.location_bldgno IS NULL THEN '' ELSE CONCAT(' ', bp.location_bldgno) END),
      (CASE WHEN bp.location_bldgname IS NULL THEN '' ELSE CONCAT(' ', bp.location_bldgname) END),
      (CASE WHEN bp.location_lotno IS NULL THEN '' ELSE CONCAT( ' Lot.', bp.location_lotno) END),
      (CASE WHEN bp.location_blockno IS NULL THEN '' ELSE CONCAT(' Blk.', bp.location_blockno) END),
      (CASE WHEN bp.location_street IS NULL THEN '' ELSE CONCAT(' ', bp.location_street) END),
      (CASE WHEN bp.location_subdivision IS NULL THEN '' ELSE CONCAT(', ', bp.location_subdivision) END),      
      (CASE WHEN bp.location_barangay_name IS NULL THEN '' ELSE CONCAT(', ', bp.location_barangay_name ) END)
   )) AS location_text,


   be.name AS applicant_name,
   be.address_text AS applicant_address_text,
   be.profileid AS applicant_profileid,

   bt.state AS task_state, 
   bt.assignee_objid AS task_assignee_objid,
   'building_permit' AS processname,
   'BUILDING PERMIT' AS doctitle,
   bp.contact_email AS contact_email,
   bp.contact_mobileno AS contact_mobileno
FROM building_permit bp 
INNER JOIN obo_app_entity be ON bp.applicantid = be.objid 
INNER JOIN building_permit_task bt ON bp.taskid = bt.taskid 

UNION

SELECT 
   op.objid, 
   'occupancy_permit' AS apptype,    
   op.appno AS appno,
   op.trackingno,
   bp.title AS title,

   LTRIM(CONCAT(
      (CASE WHEN bp.location_unitno IS NULL THEN '' ELSE CONCAT(' ', bp.location_unitno) END),
      (CASE WHEN bp.location_bldgno IS NULL THEN '' ELSE CONCAT(' ', bp.location_bldgno) END),
      (CASE WHEN bp.location_bldgname IS NULL THEN '' ELSE CONCAT(' ', bp.location_bldgname) END),
      (CASE WHEN bp.location_lotno IS NULL THEN '' ELSE CONCAT( ' Lot.', bp.location_lotno) END),
      (CASE WHEN bp.location_blockno IS NULL THEN '' ELSE CONCAT(' Blk.', bp.location_blockno) END),
      (CASE WHEN bp.location_street IS NULL THEN '' ELSE CONCAT(' ', bp.location_street) END),
      (CASE WHEN bp.location_subdivision IS NULL THEN '' ELSE CONCAT(', ', bp.location_subdivision) END),      
      (CASE WHEN bp.location_barangay_name IS NULL THEN '' ELSE CONCAT(', ', bp.location_barangay_name ) END)
   )) AS location_text,

   oe.name AS applicant_name,
   oe.address_text AS applicant_address_text,
   oe.profileid AS applicant_profileid,

   ot.state AS task_state, 
   ot.assignee_objid AS task_assignee_objid,
   'occupancy_permit' AS processname,
   'OCCUPANCY CERTIFICATE' AS doctitle,
   bp.contact_email AS contact_email,
   bp.contact_mobileno AS contact_mobileno    
FROM occupancy_permit op
INNER JOIN building_permit bp ON op.bldgpermitid = bp.objid 
INNER JOIN obo_app_entity oe ON op.applicantid = oe.objid 
INNER JOIN occupancy_permit_task ot ON op.taskid = ot.taskid 
