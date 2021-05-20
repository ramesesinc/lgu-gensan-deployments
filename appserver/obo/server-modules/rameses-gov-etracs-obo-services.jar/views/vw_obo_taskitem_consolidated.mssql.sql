if object_id('dbo.vw_obo_taskitem_consolidated', 'V') IS NOT NULL 
   drop view dbo.vw_obo_taskitem_consolidated; 
go
CREATE VIEW vw_obo_taskitem_consolidated AS select 
be.objid AS objid,
be.appid AS appid,
be.typeid AS typeid,
bt.title AS type_title,
bt.sortindex AS sortindex,
betr.role AS role,
os.org_objid AS org_objid 
from obo_app_taskitem be 
	inner join obo_taskitem_type bt on be.typeid = bt.objid  
	left join obo_section os on bt.sectionid = os.objid  
	inner join obo_taskitem_type_role betr on betr.typeid = bt.objid  
union all 
select 
be.objid AS objid,
be.appid AS appid,
be.typeid AS typeid,
bt.title AS type_title,
bt.sortindex AS sortindex,
wn.role AS role,
os.org_objid AS org_objid 
from obo_app_taskitem be 
	inner join obo_taskitem_type bt on be.typeid = bt.objid  
	inner join sys_wf_node wn on (wn.processname = 'obo_app_taskitem' and wn.tracktime = 1) 
	left join obo_section os on bt.sectionid = os.objid  
where wn.name not in (
	select obo_taskitem_type_role.state from obo_taskitem_type_role 
	where obo_taskitem_type_role.typeid = be.typeid 
)
go 