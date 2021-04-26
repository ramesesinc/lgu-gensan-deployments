[getDocsToAutoCreate]
SELECT * FROM obo_doctype 
WHERE apptype = $P{apptype} 
AND autocreate = 1
AND objid NOT IN ( SELECT doctypeid FROM obo_app_doc WHERE appid = $P{appid} )

[findDocsToReleaseCount]
SELECT COUNT(*) AS count    
FROM obo_app_doc doc 
INNER JOIN vw_obo_app app ON doc.appid = app.objid 
INNER JOIN obo_doctype od ON doc.doctypeid = od.objid
LEFT JOIN obo_section os ON od.sectionid=os.objid
WHERE doc.doctypeid = $P{doctypeid} 
AND app.task_state = 'releasing'
AND od.refdoc IS NULL
AND doc.controlid IS NULL
AND od.role IN ( ${roles} )  

[findAllDocsToReleaseCount]
SELECT COUNT(*) AS count    
FROM obo_app_doc doc
INNER JOIN vw_obo_app app ON doc.appid = app.objid 
INNER JOIN obo_doctype od ON doc.doctypeid = od.objid
LEFT JOIN obo_section os ON od.sectionid=os.objid
WHERE od.issuetype = 2 
AND app.task_state = 'releasing'
AND doc.controlid IS NULL
AND od.refdoc IS NULL
AND od.role IN ( ${roles} )  
AND (CASE WHEN os.org_objid IS NULL THEN 'root' ELSE os.org_objid END) = $P{orgid}

[getDocsThatRequireFees]
SELECT dt.title 
FROM obo_app_doc sd 
INNER JOIN obo_doctype dt ON sd.doctypeid = dt.objid 
WHERE sd.appid = $P{appid} 
AND dt.requirefee = 1 
AND (sd.amount IS NULL OR sd.amount <= 0)