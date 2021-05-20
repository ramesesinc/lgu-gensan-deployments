DROP VIEW IF EXISTS vw_obo_app_task;
CREATE VIEW vw_obo_app_task AS 
SELECT 
t.taskid,
'building_permit' AS processname,
t.refid, 
t.state, 
wf.title,
wf.tracktime,
wf.nodetype,
t.dtcreated,
t.startdate,
t.enddate, 
t.assignee_name,
t.assignee_objid 
FROM building_permit_task t
INNER JOIN sys_wf_node wf ON wf.processname = 'building_permit' AND t.state = wf.name 
AND wf.nodetype = 'state'

UNION 

SELECT 
t.taskid,
'occupancy_certificate' AS processname,
t.refid, 
t.state, 
wf.title,
wf.tracktime,
wf.nodetype,
t.dtcreated,
t.startdate,
t.enddate, 
t.assignee_name,
t.assignee_objid 
FROM occupancy_certificate_task t
INNER JOIN sys_wf_node wf ON wf.processname = 'occupancy_certificate' AND t.state = wf.name 
AND wf.nodetype = 'state';
