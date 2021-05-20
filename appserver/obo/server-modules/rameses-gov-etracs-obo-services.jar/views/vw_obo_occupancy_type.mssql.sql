if object_id('dbo.vw_obo_occupancy_type', 'V') IS NOT NULL 
   drop view dbo.vw_obo_occupancy_type; 
go
CREATE VIEW vw_obo_occupancy_type AS select 
ot.objid AS objid,
ot.divisionid AS divisionid,
ot.title AS title,
od.objid AS division_objid,
od.title AS division_title,
og.objid AS group_objid,
og.title AS group_title 
from obo_occupancy_type ot 
	inner join obo_occupancy_type_division od on ot.divisionid = od.objid 
	inner join obo_occupancy_type_group og on od.groupid = og.objid 
go 