DROP VIEW IF EXISTS vw_obo_app; 
CREATE VIEW vw_obo_app AS 

SELECT 
   app.*, 
   'building_permit' AS appclass,    
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
   'vw_building_permit' AS schemaname

FROM obo_app app
INNER JOIN building_permit bp ON app.objid = bp.objid
INNER JOIN obo_app_entity be ON app.applicantid = be.objid 
INNER JOIN building_permit_task bt ON bp.taskid = bt.taskid 

UNION 

SELECT 
   app.*, 
   'occupancy_certificate' AS appclass,    
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
   'occupancy_certificate' AS processname,
   'OCCUPANCY CERTIFICATE' AS doctitle,
   'vw_occupancy_certificate' AS schemaname
   
FROM obo_app app
INNER JOIN occupancy_certificate oc ON oc.objid = app.objid 
INNER JOIN building_permit bp ON oc.bldgpermitid = bp.objid
INNER JOIN obo_app_entity be ON app.applicantid = be.objid 
INNER JOIN occupancy_certificate_task bt ON oc.taskid = bt.taskid 