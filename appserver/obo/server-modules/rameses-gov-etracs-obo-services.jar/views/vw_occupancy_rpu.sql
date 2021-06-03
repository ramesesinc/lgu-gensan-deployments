DROP VIEW IF EXISTS `vw_occupancy_rpu`;
CREATE VIEW vw_occupancy_rpu AS 
SELECT 
orpu.*,
app.apptype,
bc.objid AS bldgpermitid,
bp.objid AS bldgappid,
bc.controlno AS bldgpermitno,
bc.dtissued AS bldgpermitdtissued,
occ.objid AS occpermitid,
occ.controlno AS occpermitno,
occ.dtissued AS occpermitdtissued,
app.applicantid,
oc.actualprojectcost,
oc.occupancytypeid,
oc.actualnumunits,
oc.actualnumfloors,
oc.actualtotalfloorarea,
oc.actualheight,
oc.dtactualstarted,
oc.dtactualcompleted,
oc.inspectiondate,
bp.title,

ot.objid AS occupancytype_objid,
ot.title AS occupancytype_title,   
od.objid AS occupancytype_division_objid,
od.title AS occupancytype_division_title,   
og.objid AS occupancytype_group_objid,
og.title AS occupancytype_group_title,
   

LTRIM(CONCAT(
  (CASE WHEN bp.location_unitno IS NULL THEN '' ELSE CONCAT(' ', bp.location_unitno) END),
  (CASE WHEN bp.location_bldgno IS NULL THEN '' ELSE CONCAT(' ', bp.location_bldgno) END),
  (CASE WHEN bp.location_bldgname IS NULL THEN '' ELSE CONCAT(' ', bp.location_bldgname) END),
  (CASE WHEN bp.location_lotno IS NULL THEN '' ELSE CONCAT( ' Lot.', bp.location_lotno) END),
  (CASE WHEN bp.location_blockno IS NULL THEN '' ELSE CONCAT(' Blk.', bp.location_blockno) END),
  (CASE WHEN bp.location_street IS NULL THEN '' ELSE CONCAT(' ', bp.location_street) END),
  (CASE WHEN bp.location_subdivision IS NULL THEN '' ELSE CONCAT(', ', bp.location_subdivision) END),      
  (CASE WHEN bp.location_barangay_name IS NULL THEN '' ELSE CONCAT(', ', bp.location_barangay_name ) END)
)) AS location_text

FROM occupancy_rpu orpu 
INNER JOIN obo_app app ON orpu.appid = app.objid 
INNER JOIN occupancy_certificate oc ON app.objid=oc.objid
INNER JOIN building_permit bp ON oc.bldgpermitid = bp.objid 
INNER JOIN obo_control bc ON bc.appid=bp.objid AND bc.doctypeid='BUILDING_PERMIT'
LEFT JOIN obo_control occ ON occ.appid=oc.objid AND occ.doctypeid = 'OCCUPANCY_CERTIFICATE'

INNER JOIN obo_occupancy_type ot ON oc.occupancytypeid = ot.objid 
INNER JOIN obo_occupancy_type_division od ON ot.divisionid = od.objid 
INNER JOIN obo_occupancy_type_group og ON od.groupid = og.objid 



