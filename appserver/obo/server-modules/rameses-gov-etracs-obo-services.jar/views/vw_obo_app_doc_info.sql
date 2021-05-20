DROP VIEW IF EXISTS vw_obo_app_doc_info;
CREATE VIEW vw_obo_app_doc_info AS 
SELECT ai.*,
   ov.datatype,
   ov.doctypeid,
   ov.unit,
   ov.caption, 
   ov.category, 
   ov.sortorder,
   ov.lookuplistname,
   ov.arrayvalues,
   ov.multiselect 
FROM obo_app_doc_info ai 
INNER JOIN obo_variable ov ON ov.objid = ai.name 
