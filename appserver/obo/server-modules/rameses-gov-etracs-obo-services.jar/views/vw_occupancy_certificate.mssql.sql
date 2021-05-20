if object_id('dbo.vw_occupancy_certificate', 'V') IS NOT NULL 
   drop view dbo.vw_occupancy_certificate; 
go
CREATE VIEW vw_occupancy_certificate AS 
SELECT 
   a.*,
   op.taskid,
   op.bldgpermitid,
   op.totalmaterialcost,
   op.totaldirectlaborcost,
   op.totalequipmentcost,
   op.totalothercost,
   op.occupancytypeid,
   op.actualnumunits,
   op.actualtotalfloorarea,
   op.actualheight,
   op.actualnumfloors,
   op.dtactualstarted,
   op.dtactualcompleted,
   op.inspectiondate,
   op.supervisorid,
   op.contractor_name,
   op.contractor_address,
   op.contractor_pcab_idno,
   op.contractor_pcab_dtvalid,
   op.contractor_tin,
   op.contractor_manager_name,
   op.contractor_manager_email,
   op.actualfixedcost,
   op.actualprojectcost,
   op.occupancystate,
   op.amount,

   t.state AS task_state,
   t.startdate AS task_startdate,
   t.enddate AS task_enddate,
   t.assignee_objid AS task_assignee_objid,
   t.assignee_name AS task_assignee_name,
   t.actor_objid AS task_actor_objid,
   t.actor_name AS task_actor_name,
   sn.title AS task_title,
   sn.tracktime AS task_tracktime,
   sn.properties AS task_properties,

   ot.objid AS occupancytype_objid,
   ot.title AS occupancytype_title,   
   od.objid AS occupancytype_division_objid,
   od.title AS occupancytype_division_title,   
   og.objid AS occupancytype_group_objid,
   og.title AS occupancytype_group_title,
   ctl.controlno,
   ctl.expirydate,
   ctl.dtissued,
   ctl.issuedby_name,
   ctl.approverid,
   ctl.endorserid,
   ctl.template,
   ctl.reportheader,

   bp.title,
   bp.location_text,
   op.actualfixedcost AS fixedcost,
   op.actualprojectcost AS projectcost  

FROM obo_app a
INNER JOIN occupancy_certificate op ON  a.objid = op.objid 
INNER JOIN vw_building_permit bp ON op.bldgpermitid = bp.objid
INNER JOIN occupancy_certificate_task t ON op.taskid = t.taskid
INNER JOIN sys_wf_node sn ON sn.processname = 'occupancy_certificate' AND sn.name = t.state 
INNER JOIN obo_occupancy_type ot ON op.occupancytypeid = ot.objid 
INNER JOIN obo_occupancy_type_division od ON ot.divisionid = od.objid 
INNER JOIN obo_occupancy_type_group og ON od.groupid = og.objid 
LEFT JOIN obo_control ctl ON ctl.appid=a.objid AND ctl.doctypeid = 'OCCUPANCY_CERTIFICATE' 
go 
