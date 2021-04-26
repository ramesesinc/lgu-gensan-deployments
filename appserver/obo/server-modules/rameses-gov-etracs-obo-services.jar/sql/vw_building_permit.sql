[getProfessionalList]
SELECT 
*
FROM obo_professional_info 
WHERE objid IN 
(SELECT designprofessionalid AS profid 
FROM obo_app_doc 
WHERE appid = $P{appid}
AND NOT(designprofessionalid IS NULL)
UNION 
SELECT supervisorid AS profid 
FROM obo_app_doc 
WHERE appid = $P{appid}
AND NOT(supervisorid IS NULL)
UNION 
SELECT ba.supervisorid AS profid
FROM building_permit ba 
WHERE ba.objid =   $P{appid}
AND NOT(ba.supervisorid IS NULL)) 