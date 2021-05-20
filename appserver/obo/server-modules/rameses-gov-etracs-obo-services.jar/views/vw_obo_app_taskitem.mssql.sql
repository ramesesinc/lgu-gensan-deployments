if object_id('dbo.vw_obo_app_taskitem', 'V') IS NOT NULL 
   drop view dbo.vw_obo_app_taskitem; 
go
CREATE VIEW vw_obo_app_taskitem AS select 
a.objid AS objid,
a.appid AS appid,
a.typeid AS typeid,
a.taskid AS taskid,
os.objid AS sectionid,
os.org_objid AS org_objid,
et.title AS type_title,
et.sortindex AS type_sortindex,
et.joinstate AS type_joinstate,
app.task_state AS app_task_state,
t.state AS task_state,
t.dtcreated AS task_dtcreated,
t.startdate AS task_startdate,
t.enddate AS task_enddate,
t.assignee_objid AS task_assignee_objid,
t.assignee_name AS task_assignee_name,
t.actor_objid AS task_actor_objid,
t.actor_name AS task_actor_name,
sn.title AS task_title,
sn.tracktime AS task_tracktime 
from obo_app_taskitem a 
	inner join obo_app_taskitem_task t on a.taskid = t.taskid
	inner join obo_taskitem_type et on a.typeid = et.objid
	inner join sys_wf_node sn on (sn.processname = 'obo_app_taskitem' and sn.name = t.state) 
	inner join vw_obo_app app on a.appid = app.objid
	left join obo_section os on et.sectionid = os.objid
go 