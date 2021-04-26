[getAllowedTypes]
SELECT DISTINCT y.objid, y.title, y.sortindex, y.apptype
FROM 
(SELECT z.* FROM 
(SELECT bet.objid, bet.sortindex, bet.title, swf.name, bet.apptype, 
	(CASE WHEN betr.role IS NULL THEN swf.role ELSE betr.role END) AS role, 
	(CASE WHEN os.org_objid IS NULL THEN 'root' ELSE os.org_objid END) AS orgid     
FROM obo_taskitem_type bet
LEFT JOIN obo_section os ON bet.sectionid = os.objid 
INNER JOIN sys_wf_node swf ON swf.processname = 'obo_app_taskitem' 	
LEFT JOIN obo_taskitem_type_role betr ON betr.typeid = bet.objid AND betr.state = swf.name
WHERE swf.name NOT IN ( 'start', 'end' )
AND swf.tracktime = 1) z
WHERE z.role IN ( ${roles} ) 
AND z.orgid = $P{orgid}
) y
ORDER BY y.sortindex

[getAllTaskCount]
SELECT
	(SELECT COUNT(*)  
	FROM  
	(SELECT bt.state, typ.objid AS section, 
		(CASE WHEN os.org_objid IS NULL THEN 'root' ELSE os.org_objid END) AS orgid, 
		(CASE WHEN betr.role IS NULL THEN sn.role ELSE betr.role END) AS role
	FROM obo_app_taskitem_task bt
	INNER JOIN obo_app_taskitem be ON bt.taskid = be.taskid 
	INNER JOIN obo_taskitem_type typ ON be.typeid = typ.objid
	LEFT JOIN obo_section os ON typ.sectionid = os.objid
	INNER JOIN sys_wf_node sn ON sn.processname = 'obo_app_taskitem' AND sn.name = bt.state 
	LEFT JOIN obo_taskitem_type_role betr ON betr.typeid = typ.objid AND betr.state = bt.state
	WHERE bt.assignee_objid IS NULL 
	AND bt.enddate IS NULL
	AND sn.tracktime = 1) z
	WHERE z.role IN ( ${roles} )
	AND z.orgid = $P{orgid})
    +
	(SELECT COUNT(*) 
	FROM 	
	(SELECT 
	(CASE WHEN os.org_objid IS NULL THEN 'root' ELSE os.org_objid END) AS orgid
	FROM obo_app_taskitem_task bt
	INNER JOIN obo_app_taskitem be ON bt.taskid = be.taskid 
	INNER JOIN obo_taskitem_type typ ON be.typeid = typ.objid
	LEFT JOIN obo_section os ON typ.sectionid = os.objid
	WHERE bt.assignee_objid = $P{userid} 
	AND bt.enddate IS NULL
	) z
	WHERE z.orgid = $P{orgid})
AS count

[getNodeListTaskCountByType]
SELECT z.state, COUNT(*) AS count   
FROM  
(SELECT bt.state, typ.objid AS typeid, 
	(CASE WHEN os.org_objid IS NULL THEN  'root' ELSE os.org_objid END) AS orgid, 
	(CASE WHEN betr.role IS NULL THEN  sn.role ELSE  betr.role END) AS role
FROM obo_app_taskitem_task bt
INNER JOIN obo_app_taskitem be ON bt.taskid = be.taskid 
INNER JOIN obo_taskitem_type typ ON be.typeid = typ.objid
LEFT JOIN obo_section os ON typ.sectionid = os.objid 
INNER JOIN sys_wf_node sn ON sn.processname = 'obo_app_taskitem' AND sn.name = bt.state 
LEFT JOIN obo_taskitem_type_role betr ON betr.typeid = typ.objid AND betr.state = bt.state
WHERE bt.assignee_objid IS NULL 
AND bt.enddate IS NULL
AND sn.tracktime = 1) z
WHERE z.typeid = $P{typeid} 
AND z.role IN ( ${roles} )
GROUP BY z.state 

UNION ALL 

SELECT 'mytask' AS state, COUNT(*) AS count 
FROM obo_app_taskitem_task bt 
INNER JOIN obo_app_taskitem be ON bt.taskid = be.taskid 
INNER JOIN obo_taskitem_type typ ON be.typeid = typ.objid
WHERE typ.objid = $P{typeid}  
AND bt.assignee_objid = $P{userid}  


