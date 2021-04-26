DROP VIEW IF EXISTS vw_obo_taskitem_consolidated; 
CREATE VIEW vw_obo_taskitem_consolidated AS 
SELECT 
be.objid, 
be.appid, 
be.typeid,
bt.title AS type_title,
bt.sortindex,
betr.role,
os.org_objid
FROM obo_app_taskitem be 
INNER JOIN obo_taskitem_type bt ON be.typeid = bt.objid 
LEFT JOIN obo_section os ON bt.sectionid = os.objid
INNER JOIN obo_taskitem_type_role betr ON betr.typeid = bt.objid
 
UNION ALL

SELECT 
be.objid, 
be.appid, 
be.typeid,
bt.title AS type_title,
bt.sortindex,
wn.role,
os.org_objid
-- CASE WHEN betr.role IS NULL THEN wn.role ELSE betr.role END AS role 
FROM obo_app_taskitem be 
INNER JOIN obo_taskitem_type bt ON be.typeid = bt.objid 
LEFT JOIN obo_section os ON bt.sectionid = os.objid
JOIN sys_wf_node wn ON wn.processname = 'obo_app_taskitem' AND wn.tracktime = 1
WHERE wn.name NOT IN ( 
	SELECT state FROM obo_taskitem_type_role 
	WHERE typeid = be.typeid 
)