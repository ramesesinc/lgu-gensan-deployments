DROP VIEW IF EXISTS vw_building_permit;
CREATE VIEW vw_building_permit AS 
SELECT 
   a.*,

   bp.taskid,
   bp.amount,
   bp.description,
   bp.title,
   bp.occupancytypeid,
   bp.numunits,
   bp.fixedcost,
   bp.projectcost,
   bp.dtproposedconstruction,
   bp.dtexpectedcompletion,
   bp.totalfloorarea,
   bp.height,
   bp.numfloors,
   bp.worktypes,
   bp.location_lotno,
   bp.location_blockno,
   bp.location_street,
   bp.location_barangay_name,
   bp.location_barangay_objid,
   bp.supervisorid,
   bp.location_unitno,
   bp.location_bldgno,
   bp.location_bldgname,
   bp.location_subdivision,
   bp.location_lotarea,

   ae.name AS applicant_name,

   bt.objid AS occupancytype_objid,
   bt.title AS occupancytype_title,   
   od.objid AS occupancytype_division_objid,
   od.title AS occupancytype_division_title,   
   og.objid AS occupancytype_group_objid,
   og.title AS occupancytype_group_title,   

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

   t.state AS task_state,
   t.dtcreated AS task_dtcreated,
   t.startdate AS task_startdate,
   t.enddate AS task_enddate,
   t.assignee_objid AS task_assignee_objid,
   t.assignee_name AS task_assignee_name,
   t.actor_objid AS task_actor_objid,
   t.actor_name AS task_actor_name,
   sn.title AS task_title,
   sn.tracktime AS task_tracktime,
   sn.properties AS task_properties,
   pmt.objid AS controlid,
   pmt.controlno,
   pmt.expirydate,
   pmt.dtissued,
   pmt.issuedby_name,
   pmt.approverid,
   pmt.endorserid,
   pmt.template,
   pmt.reportheader 

FROM obo_app a 
INNER JOIN building_permit bp ON a.objid = bp.objid 
INNER JOIN building_permit_task t ON bp.taskid = t.taskid 
INNER JOIN obo_app_entity ae ON a.applicantid = ae.objid
INNER JOIN sys_wf_node sn ON sn.processname = 'building_permit' AND sn.name = t.state 
INNER JOIN obo_occupancy_type bt ON bp.occupancytypeid = bt.objid 
INNER JOIN obo_occupancy_type_division od ON bt.divisionid = od.objid 
INNER JOIN obo_occupancy_type_group og ON od.groupid = og.objid 
LEFT JOIN obo_control pmt ON pmt.appid=a.objid AND pmt.doctypeid = 'BUILDING_PERMIT' 

