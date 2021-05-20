if object_id('dbo.vw_obo_professional_info', 'V') IS NOT NULL 
   drop view dbo.vw_obo_professional_info; 
go
CREATE VIEW vw_obo_professional_info AS select 
pi.objid AS objid,
pi.firstname AS firstname,
pi.middlename AS middlename,
pi.lastname AS lastname,
pi.resident AS resident,
pi.address_objid AS address_objid,
pi.address_text AS address_text,
pi.address_unitno AS address_unitno,
pi.address_bldgno AS address_bldgno,
pi.address_bldgname AS address_bldgname,
pi.address_street AS address_street,
pi.address_subdivision AS address_subdivision,
pi.address_barangay_objid AS address_barangay_objid,
pi.address_barangay_name AS address_barangay_name,
pi.address_citymunicipality AS address_citymunicipality,
pi.address_province AS address_province,
pi.tin AS tin,
pi.email AS email,
pi.mobileno AS mobileno,
pi.phoneno AS phoneno,
pi.id_idno AS id_idno,
pi.id_type_name AS id_type_name,
pi.id_dtissued AS id_dtissued,
pi.id_placeissued AS id_placeissued,
pi.profession AS profession,
pi.prc_idno AS prc_idno,
pi.prc_dtissued AS prc_dtissued,
pi.prc_dtvalid AS prc_dtvalid,
pi.prc_placeissued AS prc_placeissued,
pi.ptr_refno AS ptr_refno,
pi.ptr_dtissued AS ptr_dtissued,
pi.ptr_placeissued AS ptr_placeissued,
pi.profid AS profid,
pi.system AS system,
concat(pi.lastname,', ',pi.firstname,' ',substring(pi.middlename,0,1),'.') AS name,
id.caption AS id_type_caption,
id.title AS id_type_title
 from obo_professional_info pi 
 	left join idtype id on pi.id_type_name = id.name
 go 