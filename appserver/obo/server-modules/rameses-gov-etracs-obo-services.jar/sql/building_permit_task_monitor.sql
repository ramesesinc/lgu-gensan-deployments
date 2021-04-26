[getMainTasks]
SELECT a.* FROM 
(SELECT bt.state, bt.dtcreated AS startdate, bt.enddate, sn.title 
FROM building_permit bp 
INNER JOIN building_permit_task bt ON bt.refid = bp.objid 
INNER JOIN sys_wf_node sn ON sn.name = bt.state AND sn.processname = 'building_permit'
WHERE bp.objid = $P{appid} AND sn.tracktime = 1 ) a
ORDER BY a.startdate


[getSubTasks]
SELECT a.*
FROM 
(SELECT bt.objid AS section, os.org_objid, 
  btk.state, btk.dtcreated AS startdate, 
  btk.enddate, bt.activationstate  
FROM building_evaluation be
INNER JOIN building_evaluation_type bt ON be.typeid = bt.objid 
INNER JOIN building_evaluation_task btk ON btk.refid = be.objid 
LEFT JOIN obo_section os ON bt.sectionid = os.objid 
WHERE be.appid = $P{appid} 
AND bt.activationstate = $P{state} 
AND btk.dtcreated >= $P{startdate} 
AND btk.dtcreated <= $P{enddate} 
) a
ORDER BY a.section, a.startdate 

