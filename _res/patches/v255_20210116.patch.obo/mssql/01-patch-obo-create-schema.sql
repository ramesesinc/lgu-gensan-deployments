CREATE DATABASE obo 
go 

USE obo 
go 


CREATE TABLE building_evaluation (
  objid varchar(50) NOT NULL,
  appid varchar(50) NULL,
  typeid varchar(50) NULL,
  taskid varchar(50) NULL,
  constraint pk_building_evaluation PRIMARY KEY (objid)
)
go 
create UNIQUE index uix_appid_typeid on building_evaluation (appid, typeid)
go 
create index ix_taskid on building_evaluation (taskid)
go 
create index ix_typeid on building_evaluation (typeid)
go 


CREATE TABLE building_evaluation_finding (
  objid varchar(50) NOT NULL,
  appid varchar(50) NULL,
  parentid varchar(50) NULL,
  rootid varchar(50) NULL,
  particulars varchar(MAX) NULL,
  dtcreated datetime NULL,
  createdby_objid varchar(50) NULL,
  createdby_name varchar(255) NULL,
  state int NULL,
  supersederid varchar(50) NULL,
  transmittalid varchar(50) NULL,
  attachment varchar(MAX) NULL,
  zz_attachment_fileid varchar(255) NULL,
  zz_attachment_title varchar(255) NULL,
  constraint pk_building_evaluation_finding PRIMARY KEY (objid)
) 
go 
create index ix_appid on building_evaluation_finding (appid)
go 
create index ix_parentid on building_evaluation_finding (parentid)
go 
create index ix_supersederid on building_evaluation_finding (supersederid)
go 


CREATE TABLE building_evaluation_task (
  taskid varchar(50) NOT NULL,
  refid varchar(50) NULL,
  parentprocessid varchar(50) NULL,
  state varchar(50) NULL,
  startdate datetime NULL,
  enddate datetime NULL,
  assignee_objid varchar(50) NULL,
  assignee_name varchar(100) NULL,
  actor_objid varchar(50) NULL,
  actor_name varchar(100) NULL,
  message varchar(255) NULL,
  dtcreated datetime NULL,
  prevtaskid varchar(50) NULL,
  constraint pk_building_evaluation_task PRIMARY KEY (taskid)
) 
go 
create index ix_refid on building_evaluation_task (refid)
go 
create index ix_parentprocessid on building_evaluation_task (parentprocessid)
go 
create index ix_startdate on building_evaluation_task (startdate)
go 
create index ix_enddate on building_evaluation_task (enddate)
go 
create index ix_assignee_objid on building_evaluation_task (assignee_objid)
go 
create index ix_actor_objid on building_evaluation_task (actor_objid)
go 
create index ix_dtcreated on building_evaluation_task (dtcreated)
go 
create index ix_prevtaskid on building_evaluation_task (prevtaskid)
go 


CREATE TABLE building_evaluation_type (
  objid varchar(50) NOT NULL,
  title varchar(100) NULL,
  sectionid varchar(50) NULL,
  sortindex int NULL,
  required int NULL,
  activationstate varchar(50) NULL,
  constraint pk_building_evaluation_type PRIMARY KEY (objid)
) 
go 
create index ix_sectionid on building_evaluation_type (sectionid)
go 


CREATE TABLE building_evaluation_type_role (
  objid varchar(50) NOT NULL,
  typeid varchar(50) NULL,
  state varchar(50) NULL,
  role varchar(50) NULL,
  constraint pk_building_evaluation_type_role PRIMARY KEY (objid)
) 
go 
create UNIQUE index uix_typeid_state on building_evaluation_type_role (typeid,state)
go 


CREATE TABLE building_permit (
  objid varchar(50) NOT NULL,
  appno varchar(50) NULL,
  orgcode varchar(50) NULL,
  trackingno varchar(50) NULL,
  apptype varchar(50) NULL,
  appdate date NULL,
  taskid varchar(50) NULL,
  contact_name varchar(255) NULL,
  contact_detail varchar(255) NULL,
  contact_email varchar(255) NULL,
  contact_mobileno varchar(255) NULL,
  txnmode varchar(50) NULL,
  txntype varchar(50) NULL,
  controlid varchar(50) NULL,
  amount decimal(16,2) NULL,
  applicantid varchar(50) NULL,
  description varchar(255) NULL,
  title varchar(255) NULL,
  occupancytypeid varchar(50) NULL,
  numunits int NULL,
  fixedcost decimal(16,2) NULL,
  projectcost decimal(16,2) NULL,
  dtproposedconstruction date NULL,
  dtexpectedcompletion date NULL,
  totalfloorarea decimal(16,2) NULL,
  height decimal(16,2) NULL,
  numfloors int NULL,
  worktypes text NULL,
  zoneclassid varchar(50) NULL,
  zone varchar(50) NULL,
  location_lotno varchar(50) NULL,
  location_blockno varchar(50) NULL,
  location_street varchar(255) NULL,
  location_barangay_name varchar(255) NULL,
  location_barangay_objid varchar(50) NULL,
  supervisorid varchar(50) NULL,
  location_unitno varchar(25) NULL,
  location_bldgno varchar(25) NULL,
  location_bldgname varchar(25) NULL,
  location_subdivision varchar(25) NULL,
  createdby_objid varchar(50) NULL,
  createdby_name varchar(255) NULL,
  dtcreated datetime NULL,
  constraint pk_building_permit PRIMARY KEY (objid)
) 
go 
create UNIQUE index uix_appno on building_permit (appno)
go
create UNIQUE index uix_controlid on building_permit (controlid)
go
create index ix_applicantid on building_permit (applicantid)
go 
create index ix_taskid on building_permit (taskid)
go 
create index ix_supervisorid on building_permit (supervisorid)
go 
create index ix_zoneclassid on building_permit (zoneclassid)
go 
create index ix_occupancytypeid on building_permit (occupancytypeid)
go 


CREATE TABLE building_permit_checklist (
  objid varchar(50) NOT NULL,
  parentid varchar(50) NULL,
  typeid varchar(50) NULL,
  [values] varchar(MAX) NULL,
  constraint pk_building_permit_checklist PRIMARY KEY (objid)
) 
go 
create index ix_parentid on building_permit_checklist (parentid)
go 
create index ix_typeid on building_permit_checklist (typeid)
go 


CREATE TABLE building_permit_doc (
  objid varchar(50) NOT NULL,
  appid varchar(50) NULL,
  state int NULL,
  doctypeid varchar(50) NULL,
  designprofessionalid varchar(50) NULL,
  supervisorid varchar(50) NULL,
  worktypes text NULL,
  contractorname varchar(255) NULL,
  remarks varchar(255) NULL,
  amount decimal(16,2) NULL,
  controlid varchar(50) NULL,
  occupancytypeid varchar(50) NULL,
  projectcost decimal(16,2) NULL,
  equipmentcost decimal(16,2) NULL,
  constraint pk_building_permit_doc PRIMARY KEY (objid)
) 
go 
create UNIQUE index uix_appid_doctypeid on building_permit_doc (appid,doctypeid)
go 
create index ix_doctypeid on building_permit_doc (doctypeid)
go 
create index ix_designprofessionalid on building_permit_doc (designprofessionalid)
go 
create index ix_supervisorid on building_permit_doc (supervisorid)
go 
create index ix_controlid on building_permit_doc (controlid)
go 


CREATE TABLE building_permit_entity (
  objid varchar(50) NOT NULL DEFAULT '',
  appid varchar(50) NULL,
  profileid varchar(50) NULL,
  entitytype varchar(50) NULL,
  profileno varchar(50) NULL,
  name varchar(255) NULL,
  firstname varchar(100) NULL,
  middlename varchar(100) NULL,
  lastname varchar(100) NULL,
  resident int NULL,
  address_objid varchar(50) NULL,
  address_text varchar(255) NULL,
  address_unitno varchar(50) NULL,
  address_bldgno varchar(50) NULL,
  address_bldgname varchar(100) NULL,
  address_street varchar(255) NULL,
  address_subdivision varchar(255) NULL,
  address_barangay_objid varchar(50) NULL,
  address_barangay_name varchar(50) NULL,
  address_citymunicipality varchar(50) NULL,
  address_province varchar(50) NULL,
  tin varchar(50) NULL,
  email varchar(255) NULL,
  mobileno varchar(50) NULL,
  phoneno varchar(50) NULL,
  id_type_name varchar(50) NULL,
  id_idno varchar(50) NULL,
  id_placeissued varchar(100) NULL,
  id_dtissued date NULL,
  constraint pk_building_permit_entity PRIMARY KEY (objid)
) 
go 
create index ix_appid on building_permit_entity (appid)
go 
 

CREATE TABLE building_permit_fee (
  objid varchar(50) NOT NULL,
  appid varchar(50) NULL,
  parentid varchar(50) NULL,
  itemid varchar(50) NULL,
  amount decimal(16,4) NULL,
  amtpaid decimal(16,4) NULL,
  remarks varchar(255) NULL,
  constraint pk_building_permit_fee PRIMARY KEY (objid)  
)
go 
create UNIQUE index uix_appid_itemid on building_permit_fee (appid,itemid)
go 
create index ix_itemid on building_permit_fee (itemid)
go 
create index ix_parentid on building_permit_fee (parentid)
go 


CREATE TABLE building_permit_info (
  objid varchar(50) NOT NULL,
  appid varchar(50) NULL,
  parentid varchar(50) NULL,
  name varchar(50) NULL,
  stringvalue varchar(255) NULL,
  decimalvalue decimal(18,2) NULL,
  intvalue int NULL,
  datevalue date NULL,
  booleanvalue int NULL,
  remarks varchar(255) NULL,
  constraint pk_building_permit_info PRIMARY KEY (objid)
) 
go 
  
create UNIQUE index uix_parentid_name on building_permit_info (parentid,name)
go 
create index ix_appid on building_permit_info (appid)
go 


CREATE TABLE building_permit_payment (
  objid varchar(50) NOT NULL,
  appid varchar(50) NULL,
  refno varchar(50) NULL,
  refdate date NULL,
  refid varchar(50) NULL,
  reftype varchar(50) NULL,
  amount decimal(16,2) NULL,
  voided int NULL,
  constraint pk_building_permit_payment PRIMARY KEY (objid)
) 
go 
create index ix_appid on building_permit_payment (appid)
go 


CREATE TABLE building_permit_requirement (
  objid varchar(50) NOT NULL,
  appid varchar(50) NULL,
  parentid varchar(50) NULL,
  typeid varchar(50) NULL,
  state int NULL,
  remarks varchar(MAX) NULL,
  reviewer_objid varchar(50) NULL,
  reviewer_name varchar(255) NULL,
  dtreviewed datetime NULL,
  supersederid varchar(50) NULL,
  transmittalid varchar(50) NULL,
  constraint pk_building_permit_requirement PRIMARY KEY (objid)
) 
go 
create index ix_appid on building_permit_requirement (appid)
go
create index ix_typeid on building_permit_requirement (typeid)
go
create index ix_parentid on building_permit_requirement (parentid)
go
create index ix_supersederid on building_permit_requirement (supersederid)
go
create index ix_transmittalid on building_permit_requirement (transmittalid)
go


CREATE TABLE building_permit_rpu (
  objid varchar(50) NOT NULL DEFAULT '',
  appid varchar(50) NULL,
  tdno varchar(50) NULL,
  tctno varchar(50) NULL,
  pin varchar(50) NULL,
  barangay varchar(50) NULL,
  titleno varchar(50) NULL,
  lotno varchar(50) NULL,
  blockno varchar(50) NULL,
  areasqm decimal(16,4) NULL,
  classcode varchar(255) NULL,
  ownerid varchar(50) NULL,
  street varchar(255) NULL,
  refid varchar(50) NULL,
  bill_amtdue decimal(16,2) NULL,
  lotowned int NULL,
  taxclearanceid varchar(50) NULL,
  truecopycertid varchar(50) NULL,
  constraint pk_building_permit_rpu PRIMARY KEY (objid)
) 
go 
create UNIQUE index uix_appid_refid on building_permit_rpu (appid,refid)
go 
create index ix_ownerid on building_permit_rpu (ownerid)
go 


CREATE TABLE building_permit_task (
  taskid varchar(50) NOT NULL,
  refid varchar(50) NULL,
  parentprocessid varchar(50) NULL,
  state varchar(50) NULL,
  startdate datetime NULL,
  enddate datetime NULL,
  assignee_objid varchar(50) NULL,
  assignee_name varchar(100) NULL,
  actor_objid varchar(50) NULL,
  actor_name varchar(100) NULL,
  message varchar(255) NULL,
  dtcreated datetime NULL,
  prevtaskid varchar(50) NULL,
  constraint pk_building_permit_task PRIMARY KEY (taskid)
) 
go 

create index ix_refid on building_permit_task (refid)
go 
create index ix_parentprocessid on building_permit_task (parentprocessid)
go 
create index ix_startdate on building_permit_task (startdate)
go 
create index ix_enddate on building_permit_task (enddate)
go 
create index ix_assignee_objid on building_permit_task (assignee_objid)
go 
create index ix_actor_objid on building_permit_task (actor_objid)
go 
create index ix_dtcreated on building_permit_task (dtcreated)
go 
create index ix_prevtaskid on building_permit_task (prevtaskid)
go 


CREATE TABLE building_permit_transmittal (
  objid varchar(50) NOT NULL,
  appid varchar(50) NULL,
  state int NULL,
  type varchar(50) NULL,
  taskid varchar(50) NULL,
  dtcreated datetime NULL,
  createdby_objid varchar(50) NULL,
  createdby_name varchar(255) NULL,
  approverid varchar(50) NULL,
  endorserid varchar(50) NULL,
  template varchar(255) NULL,
  reportheader varchar(50) NULL,
  constraint pk_building_permit_transmittal PRIMARY KEY (objid)
) 
go 
create UNIQUE index uix_taskid on building_permit_transmittal (taskid)
go 
create index ix_appid on building_permit_transmittal (appid)
go 


CREATE TABLE idtype (
  name varchar(50) NOT NULL,
  title varchar(50) NULL,
  caption varchar(50) NULL,
  constraint pk_idtype PRIMARY KEY (name)
) 
go 


CREATE TABLE obo_checklist_master (
  objid varchar(50) NOT NULL,
  doctypeid varchar(50) NULL,
  indexno int NULL,
  title varchar(500) NULL,
  category varchar(50) NULL,
  params varchar(50) NULL,
  constraint pk_obo_checklist_master PRIMARY KEY (objid)
) 
go 
create index ix_doctypeid on obo_checklist_master (doctypeid)
go 


CREATE TABLE obo_control (
  objid varchar(50) NOT NULL,
  state int NULL,
  doctypeid varchar(50) NULL,
  controlno varchar(50) NOT NULL,
  dtissued date NULL,
  issuedby_objid varchar(50) NULL,
  issuedby_name varchar(255) NULL,
  expirydate date NULL,
  remarks varchar(255) NULL,
  template varchar(255) NULL,
  endorserid varchar(50) NULL,
  approverid varchar(50) NULL,
  reportheader varchar(50) NULL,
  constraint pk_obo_control PRIMARY KEY (objid)
) 
go 
create UNIQUE index uix_controlno on obo_control (controlno)
go 
create index ix_doctypeid on obo_control (doctypeid)
go 
create index ix_approverid on obo_control (approverid)
go 
create index ix_endorserid on obo_control (endorserid)
go 


CREATE TABLE obo_doctype (
  objid varchar(50) NOT NULL,
  title varchar(100) NULL,
  sectionid varchar(50) NULL,
  sortorder int NULL,
  type varchar(50) NULL,
  template varchar(50) NULL,
  autocreate int NULL,
  issuetype int NULL,
  requirefee int NULL,
  appnopattern varchar(50) NULL,
  controlnopattern varchar(50) NULL,
  subtypeof varchar(50) NULL,
  apptype varchar(50) NULL,
  system int NULL,
  role varchar(50) NULL,
  endorserid varchar(50) NULL,
  approverid varchar(50) NULL,
  reportheader varchar(50) NULL,
  refdoc varchar(50) NULL,
  constraint pk_obo_doctype PRIMARY KEY (objid)
) 
go 
create index ix_sectionid on obo_doctype (sectionid)
go 
create index ix_endorserid on obo_doctype (endorserid)
go 
create index ix_approverid on obo_doctype (approverid)
go 


CREATE TABLE obo_doctype_itemaccount (
  objid varchar(50) NOT NULL,
  typeid varchar(50) NULL,
  itemid varchar(50) NULL,
  constraint pk_obo_doctype_itemaccount PRIMARY KEY (objid)
) 
go 
create UNIQUE index uix_typeid_itemid on obo_doctype_itemaccount (typeid,itemid)
go 
create index ix_itemid on obo_doctype_itemaccount (itemid)
go 


CREATE TABLE obo_itemaccount (
  objid varchar(50) NOT NULL,
  title varchar(50) NULL,
  doctypeid varchar(50) NULL,
  item_objid varchar(50) NULL,
  item_code varchar(50) NULL,
  item_title varchar(255) NULL,
  item_fund_objid varchar(50) NULL,
  item_fund_title varchar(50) NULL,
  sortorder int NULL,
  groupid varchar(50) NULL,
  tag varchar(50) NULL,
  feegroup varchar(50) NULL,
  constraint pk_obo_itemaccount PRIMARY KEY (objid)
) 
go 
create index ix_doctypeid on obo_itemaccount (doctypeid)
go 


CREATE TABLE obo_itemaccount_report_tag (
  objid varchar(255) NOT NULL,
  itemid varchar(50) NULL,
  tag varchar(150) NULL,
  constraint pk_obo_itemaccount_report_tag PRIMARY KEY (objid)
) 
go 
create index ix_itemid on obo_itemaccount_report_tag (itemid)
go 
create index ix_tag on obo_itemaccount_report_tag (tag)
go 


CREATE TABLE obo_occupancy_type (
  objid varchar(50) NOT NULL,
  divisionid varchar(50) NOT NULL,
  title varchar(800) NULL,
  constraint pk_obo_occupancy_type PRIMARY KEY (objid)
) 
go 
create index ix_divisionid on obo_occupancy_type (divisionid)
go 


CREATE TABLE obo_occupancy_type_division (
  objid varchar(50) NOT NULL,
  groupid varchar(50) NULL,
  title text,
  type varchar(10) NULL,
  constraint pk_obo_occupancy_type_division PRIMARY KEY (objid)
)
go 
create index ix_groupid on obo_occupancy_type_division (groupid)
go 


CREATE TABLE obo_occupancy_type_group (
  objid varchar(50) NOT NULL,
  title text,
  constraint pk_obo_occupancy_type_group PRIMARY KEY (objid)
) 
go 


CREATE TABLE obo_profession (
  name varchar(50) NOT NULL,
  title varchar(50) NULL,
  constraint pk_obo_profession PRIMARY KEY (name)
) 
go 


CREATE TABLE obo_professional (
  objid varchar(50) NOT NULL,
  prcno varchar(50) NOT NULL,
  profession varchar(100) NULL,
  infoid varchar(50) NULL,
  constraint pk_obo_professional PRIMARY KEY (objid)
) 
go 
create UNIQUE index uix_prcno_profession on obo_professional (prcno,profession)
go 
create index ix_infoid on obo_professional (infoid)
go 
 

CREATE TABLE obo_professional_info (
  objid varchar(50) NOT NULL DEFAULT '',
  firstname varchar(100) NULL,
  middlename varchar(100) NULL,
  lastname varchar(100) NULL,
  resident int NULL,
  address_objid varchar(50) NULL,
  address_text varchar(255) NULL,
  address_unitno varchar(50) NULL,
  address_bldgno varchar(50) NULL,
  address_bldgname varchar(100) NULL,
  address_street varchar(255) NULL,
  address_subdivision varchar(255) NULL,
  address_barangay_objid varchar(50) NULL,
  address_barangay_name varchar(50) NULL,
  address_citymunicipality varchar(50) NULL,
  address_province varchar(50) NULL,
  tin varchar(50) NULL,
  email varchar(255) NULL,
  mobileno varchar(50) NULL,
  phoneno varchar(50) NULL,
  id_idno varchar(50) NULL,
  id_type_name varchar(50) NULL,
  id_dtissued date NULL,
  id_placeissued varchar(50) NULL,
  profession varchar(100) NULL,
  prc_idno varchar(50) NULL,
  prc_dtissued date NULL,
  prc_dtvalid date NULL,
  prc_placeissued varchar(50) NULL,
  ptr_refno varchar(50) NULL,
  ptr_dtissued date NULL,
  ptr_placeissued varchar(50) NULL,
  profid varchar(50) NULL,
  system int NULL,
  constraint pk_obo_professional_info PRIMARY KEY (objid)
) 
go 


CREATE TABLE obo_requirement_type (
  objid varchar(50) NOT NULL,
  title varchar(255) NULL,
  sortorder int NULL,
  permittype varchar(100) NULL,
  sectionid varchar(50) NULL,
  constraint pk_obo_requirement_type PRIMARY KEY (objid)
) 
go 
create index ix_sectionid on obo_requirement_type (sectionid)
go 


CREATE TABLE obo_section (
  objid varchar(50) NOT NULL,
  title varchar(50) NULL,
  org_objid varchar(50) NULL,
  org_name varchar(255) NULL,
  constraint pk_obo_section PRIMARY KEY (objid)
) 
go 


CREATE TABLE obo_variable (
  objid varchar(50) NOT NULL,
  state varchar(50) NULL,
  name varchar(50) NULL,
  caption varchar(255) NULL,
  description varchar(255) NULL,
  datatype varchar(100) NULL,
  doctypeid varchar(50) NULL,
  category varchar(255) NULL,
  sortorder int NULL,
  system int NULL,
  arrayvalues text,
  unit varchar(100) NULL,
  occupancytypeid varchar(50) NULL,
  constraint pk_obo_variable PRIMARY KEY (objid)
) 
go 
create UNIQUE index uix_name on obo_variable (name)
go 
create index ix_doctypeid on obo_variable (doctypeid)
go 
create index ix_state on obo_variable (state)
go 
create index ix_caption on obo_variable (caption)
go 
create index ix_datatype on obo_variable (datatype)
go 
create index ix_category on obo_variable (category)
go 
create index ix_sortorder on obo_variable (sortorder)
go 
create index ix_system on obo_variable (system)
go 
create index ix_unit on obo_variable (unit)
go 
create index ix_occupancytypeid on obo_variable (occupancytypeid)
go 


CREATE TABLE obo_work_type (
  objid varchar(50) NOT NULL,
  doctypeid varchar(50) NULL,
  description text,
  idx int NULL,
  constraint pk_obo_work_type PRIMARY KEY (objid)
) 
go 
create index ix_doctypeid on obo_work_type (doctypeid)
go 
 

CREATE TABLE obo_zoneclass (
  objid varchar(50) NOT NULL,
  title varchar(255) NULL,
  constraint pk_obo_zoneclass PRIMARY KEY (objid)
) 
go 


CREATE TABLE occupancy_inspection (
  objid varchar(50) NOT NULL,
  appid varchar(50) NULL,
  typeid varchar(50) NULL,
  taskid varchar(50) NULL,
  uploaded int NULL,
  constraint pk_occupancy_inspection PRIMARY KEY (objid)
) 
go 
create UNIQUE index uix_appid_typeid on occupancy_inspection (appid,typeid)
go 
create index ix_appid on occupancy_inspection (appid)
go 
create index ix_typeid on occupancy_inspection (typeid)
go 
create index ix_taskid on occupancy_inspection (taskid)
go 


CREATE TABLE occupancy_inspection_finding (
  objid varchar(50) NOT NULL,
  appid varchar(50) NULL,
  parentid varchar(50) NULL,
  rootid varchar(50) NULL,
  particulars varchar(MAX) NULL,
  dtcreated datetime NULL,
  createdby_objid varchar(50) NULL,
  createdby_name varchar(255) NULL,
  state int NULL,
  supersederid varchar(50) NULL,
  transmittalid varchar(50) NULL,
  attachment varchar(MAX) NULL,
  constraint pk_occupancy_inspection_finding PRIMARY KEY (objid)
) 
go 
create index ix_appid on occupancy_inspection_finding (appid)
go 
create index ix_parentid on occupancy_inspection_finding (parentid)
go 
create index ix_supersederid on occupancy_inspection_finding (supersederid)
go 


CREATE TABLE occupancy_inspection_task (
  taskid varchar(50) NOT NULL,
  refid varchar(50) NULL,
  parentprocessid varchar(50) NULL,
  state varchar(50) NULL,
  startdate datetime NULL,
  enddate datetime NULL,
  assignee_objid varchar(50) NULL,
  assignee_name varchar(100) NULL,
  actor_objid varchar(50) NULL,
  actor_name varchar(100) NULL,
  message varchar(255) NULL,
  dtcreated datetime NULL,
  prevtaskid varchar(50) NULL,
  constraint pk_occupancy_inspection_task PRIMARY KEY (taskid)
) 
go 
create index ix_refid on occupancy_inspection_task (refid)
go 
create index ix_parentprocessid on occupancy_inspection_task (parentprocessid)
go 
create index ix_startdate on occupancy_inspection_task (startdate)
go 
create index ix_enddate on occupancy_inspection_task (enddate)
go 
create index ix_assignee_objid on occupancy_inspection_task (assignee_objid)
go 
create index ix_actor_objid on occupancy_inspection_task (actor_objid)
go 
create index ix_dtcreated on occupancy_inspection_task (dtcreated)
go 
create index ix_prevtaskid on occupancy_inspection_task (prevtaskid)
go 
 

CREATE TABLE occupancy_inspection_type (
  objid varchar(50) NOT NULL,
  title varchar(100) NULL,
  sectionid varchar(50) NULL,
  sortindex int NULL,
  required int NULL,
  constraint pk_occupancy_inspection_type PRIMARY KEY (objid)
) 
go 
create index ix_sectionid on occupancy_inspection_type (sectionid)
go 
 

CREATE TABLE occupancy_inspection_type_itemaccount (
  objid varchar(50) NOT NULL,
  typeid varchar(50) NULL,
  itemid varchar(50) NULL,
  constraint pk_occupancy_inspection_type_itemaccount PRIMARY KEY (objid)
) 
go 
create UNIQUE index uix_typeid_itemid on occupancy_inspection_type_itemaccount (typeid,itemid)
go 
create index ix_itemid on occupancy_inspection_type_itemaccount (itemid)
go 


CREATE TABLE occupancy_inspection_type_role (
  objid varchar(50) NOT NULL,
  typeid varchar(50) NULL,
  state varchar(50) NULL,
  role varchar(50) NULL,
  constraint pk_occupancy_inspection_type_role PRIMARY KEY (objid)
) 
go 
create index ix_typeid on occupancy_inspection_type_role (typeid)
go 
 

CREATE TABLE occupancy_permit (
  objid varchar(50) NOT NULL,
  appno varchar(50) NULL,
  apptype varchar(50) NULL,
  txntype varchar(50) NULL,
  orgcode varchar(50) NULL,
  trackingno varchar(50) NULL,
  contact_name varchar(50) NULL,
  contact_detail varchar(255) NULL,
  contact_email varchar(255) NULL,
  contact_mobileno varchar(50) NULL,
  appdate datetime NULL,
  taskid varchar(50) NULL,
  bldgpermitid varchar(50) NULL,
  applicantid varchar(50) NULL,
  txnmode varchar(50) NULL,
  totalmaterialcost decimal(16,2) NULL,
  totaldirectlaborcost decimal(16,2) NULL,
  totalequipmentcost decimal(16,2) NULL,
  totalothercost decimal(16,2) NULL,
  occupancytypeid varchar(50) NULL,
  actualnumunits int NULL,
  actualtotalfloorarea decimal(16,2) NULL,
  actualheight decimal(16,2) NULL,
  actualnumfloors int NULL,
  dtactualstarted date NULL,
  dtactualcompleted date NULL,
  inspectiondate datetime NULL,
  supervisorid varchar(50) NULL,
  contractor_name varchar(255) NULL,
  contractor_address varchar(255) NULL,
  contractor_pcab_idno varchar(50) NULL,
  contractor_pcab_dtvalid date NULL,
  contractor_tin varchar(50) NULL,
  contractor_manager_name varchar(255) NULL,
  contractor_manager_email varchar(255) NULL,
  controlid varchar(50) NULL,
  actualfixedcost decimal(16,2) NULL,
  actualprojectcost decimal(16,2) NULL,
  occupancystate int NULL,
  amount decimal(16,2) NULL,
  constraint pk_occupancy_permit PRIMARY KEY (objid)
) 
go 

create UNIQUE index uix_appno on occupancy_permit (appno)
go 
create index ix_applicantid on occupancy_permit (applicantid)
go 
create index ix_supervisorid on occupancy_permit (supervisorid)
go 
create index ix_taskid on occupancy_permit (taskid)
go 
create index ix_bldgpermitid on occupancy_permit (bldgpermitid)
go 
create index ix_controlid on occupancy_permit (controlid)
go 


CREATE TABLE occupancy_permit_checklist (
  objid varchar(50) NOT NULL,
  parentid varchar(50) NULL,
  typeid varchar(50) NULL,
  [values] varchar(MAX) NULL,
  constraint pk_occupancy_permit_checklist PRIMARY KEY (objid)
) 
go 
create index ix_parentid on occupancy_permit_checklist (parentid)
go 
create index ix_typeid on occupancy_permit_checklist (typeid)
go 


CREATE TABLE occupancy_permit_doc (
  objid varchar(50) NOT NULL,
  appid varchar(50) NULL,
  state int NULL,
  doctypeid varchar(50) NULL,
  remarks varchar(255) NULL,
  amount decimal(16,2) NULL,
  controlid varchar(50) NULL,
  constraint pk_occupancy_permit_doc PRIMARY KEY (objid)
) 
go 
create UNIQUE index uix_appid_doctypeid on occupancy_permit_doc (appid,doctypeid)
go 
create index ix_doctypeid on occupancy_permit_doc (doctypeid)
go 
create index ix_controlid on occupancy_permit_doc (controlid)
go 


CREATE TABLE occupancy_permit_entity (
  objid varchar(50) NOT NULL DEFAULT '',
  appid varchar(50) NULL,
  profileid varchar(50) NULL,
  entitytype varchar(50) NULL,
  profileno varchar(50) NULL,
  name varchar(255) NULL,
  firstname varchar(100) NULL,
  middlename varchar(100) NULL,
  lastname varchar(100) NULL,
  resident int NULL,
  address_objid varchar(50) NULL,
  address_text varchar(255) NULL,
  address_unitno varchar(50) NULL,
  address_bldgno varchar(50) NULL,
  address_bldgname varchar(100) NULL,
  address_street varchar(255) NULL,
  address_subdivision varchar(255) NULL,
  address_barangay_objid varchar(50) NULL,
  address_barangay_name varchar(50) NULL,
  address_citymunicipality varchar(50) NULL,
  address_province varchar(50) NULL,
  tin varchar(50) NULL,
  email varchar(255) NULL,
  mobileno varchar(50) NULL,
  phoneno varchar(50) NULL,
  id varchar(MAX) NULL,
  constraint pk_occupancy_permit_entity PRIMARY KEY (objid)
) 
go 
create index ix_appid on occupancy_permit_entity (appid)
go 
 

CREATE TABLE occupancy_permit_fee (
  objid varchar(50) NOT NULL,
  appid varchar(50) NULL,
  parentid varchar(50) NULL,
  itemid varchar(50) NULL,
  amount decimal(16,4) NULL,
  amtpaid decimal(16,4) NULL,
  remarks varchar(255) NULL,
  constraint pk_occupancy_permit_fee PRIMARY KEY (objid)
) 
go 
create UNIQUE index uix_appid_itemid on occupancy_permit_fee (appid,itemid)
go 
create index ix_itemid on occupancy_permit_fee (itemid)
go 
create index ix_parentid on occupancy_permit_fee (parentid)
go 


CREATE TABLE occupancy_permit_info (
  objid varchar(50) NOT NULL,
  appid varchar(50) NULL,
  parentid varchar(50) NULL,
  name varchar(50) NULL,
  stringvalue varchar(255) NULL,
  decimalvalue decimal(18,2) NULL,
  intvalue int NULL,
  datevalue date NULL,
  booleanvalue int NULL,
  remarks varchar(255) NULL,
  constraint pk_occupancy_permit_info PRIMARY KEY (objid)
) 
go 
create UNIQUE index uix_parentid_name on occupancy_permit_info (parentid,name)
go 
create index ix_appid on occupancy_permit_info (appid)
go 


CREATE TABLE occupancy_permit_payment (
  objid varchar(50) NOT NULL,
  appid varchar(50) NULL,
  refno varchar(50) NULL,
  refdate date NULL,
  refid varchar(50) NULL,
  reftype varchar(50) NULL,
  amount decimal(16,2) NULL,
  voided int NULL,
  constraint pk_occupancy_permit_payment PRIMARY KEY (objid)
) 
go 
create index ix_appid on occupancy_permit_payment (appid)
go 
 

CREATE TABLE occupancy_permit_professional (
  objid varchar(50) NOT NULL DEFAULT '',
  appid varchar(50) NULL,
  entityid varchar(50) NULL,
  profession varchar(255) NULL,
  ptr varchar(MAX) NULL,
  prc varchar(MAX) NULL,
  constraint pk_occupancy_permit_professional PRIMARY KEY (objid)
) 
go 
create index ix_appid on occupancy_permit_professional (appid)
go 
create index ix_entityid on occupancy_permit_professional (entityid)
go 
 

CREATE TABLE occupancy_permit_requirement (
  objid varchar(50) NOT NULL,
  appid varchar(50) NULL,
  parentid varchar(50) NULL,
  typeid varchar(50) NULL,
  state int NULL,
  remarks varchar(MAX) NULL,
  reviewer_objid varchar(50) NULL,
  reviewer_name varchar(255) NULL,
  dtreviewed datetime NULL,
  supersederid varchar(50) NULL,
  transmittalid varchar(50) NULL,
  constraint pk_occupancy_permit_requirement PRIMARY KEY (objid)
) 
go 
create index ix_transmittalid on occupancy_permit_requirement (transmittalid)
go 
create index ix_parentid on occupancy_permit_requirement (parentid)
go 
create index ix_supersederid on occupancy_permit_requirement (supersederid)
go 
create index ix_typeid on occupancy_permit_requirement (typeid)
go 
create index ix_appid on occupancy_permit_requirement (appid)
go 


CREATE TABLE occupancy_permit_task (
  taskid varchar(50) NOT NULL,
  refid varchar(50) NULL,
  parentprocessid varchar(50) NULL,
  state varchar(50) NULL,
  startdate datetime NULL,
  enddate datetime NULL,
  assignee_objid varchar(50) NULL,
  assignee_name varchar(100) NULL,
  actor_objid varchar(50) NULL,
  actor_name varchar(100) NULL,
  message varchar(255) NULL,
  dtcreated datetime NULL,
  prevtaskid varchar(50) NULL,
  constraint pk_occupancy_permit_task PRIMARY KEY (taskid)
) 
go 
create index ix_refid on occupancy_permit_task (refid)
go
create index ix_parentprocessid on occupancy_permit_task (parentprocessid)
go
create index ix_startdate on occupancy_permit_task (startdate)
go
create index ix_enddate on occupancy_permit_task (enddate)
go
create index ix_assignee_objid on occupancy_permit_task (assignee_objid)
go
create index ix_actor_objid on occupancy_permit_task (actor_objid)
go
create index ix_dtcreated on occupancy_permit_task (dtcreated)
go
create index ix_prevtaskid on occupancy_permit_task (prevtaskid)
go


CREATE TABLE occupancy_permit_transmittal (
  objid varchar(50) NOT NULL,
  appid varchar(50) NULL,
  state int NULL,
  type varchar(50) NULL,
  taskid varchar(50) NULL,
  dtcreated datetime NULL,
  createdby_objid varchar(50) NULL,
  createdby_name varchar(255) NULL,
  approverid varchar(50) NULL,
  endorserid varchar(50) NULL,
  template varchar(255) NULL,
  reportheader varchar(255) NULL,
  constraint pk_occupancy_permit_transmittal PRIMARY KEY (objid)
) 
go 
create UNIQUE index uix_taskid on occupancy_permit_transmittal (taskid)
go 
create index ix_appid on occupancy_permit_transmittal (appid)
go 


CREATE TABLE occupancy_rpu (
  objid varchar(50) NOT NULL,
  state int NULL,
  dtcreated datetime NULL,
  appid varchar(50) NULL,
  faasid varchar(50) NULL,
  tdno varchar(50) NULL,
  txnmode varchar(50) NULL,
  constraint pk_occupancy_rpu PRIMARY KEY (objid)
) 
go 
create UNIQUE index uix_appid on occupancy_rpu (appid)
go 


CREATE TABLE sys_email_queue (
  objid varchar(50) NOT NULL,
  refid varchar(50) NULL,
  state int NULL,
  reportid varchar(50) NULL,
  dtsent datetime NULL,
  [to] varchar(255) NULL,
  subject varchar(255) NULL,
  message varchar(MAX) NULL,
  errmsg varchar(255) NULL,
  connection varchar(50) NULL,
  constraint pk_sys_email_queue PRIMARY KEY (objid)
) 
go 


CREATE TABLE sys_email_template (
  objid varchar(50) NOT NULL,
  subject varchar(255) NULL,
  message varchar(MAX) NULL,
  constraint pk_sys_email_template PRIMARY KEY (objid)
) 
go 


CREATE TABLE sys_report_header (
  objid varchar(50) NOT NULL,
  value varchar(MAX) NULL,
  constraint pk_sys_report_header PRIMARY KEY (objid)
) 
go 


CREATE TABLE sys_report_tag (
  objid varchar(150) NOT NULL,
  description varchar(255) NULL,
  constraint pk_sys_report_tag PRIMARY KEY (objid)
) 
go 


CREATE TABLE sys_rule (
  objid varchar(50) NOT NULL,
  state varchar(25) NULL,
  name varchar(50) NOT NULL,
  ruleset varchar(50) NOT NULL,
  rulegroup varchar(50) NULL,
  title varchar(250) NULL,
  description varchar(MAX) NULL,
  salience int NULL,
  effectivefrom date NULL,
  effectiveto date NULL,
  dtfiled datetime NULL,
  user_objid varchar(50) NULL,
  user_name varchar(100) NULL,
  noloop int NULL,
  constraint pk_sys_rule PRIMARY KEY (objid)
) 
go 
create index ix_rulegroup_ruleset on sys_rule (rulegroup,ruleset)
go 
create index ix_ruleset on sys_rule (ruleset)
go 


CREATE TABLE sys_rulegroup (
  name varchar(50) NOT NULL,
  ruleset varchar(50) NOT NULL,
  title varchar(160) NULL,
  sortorder int NULL,
  constraint pk_sys_rulegroup PRIMARY KEY (name,ruleset)
) 
go 
create index ix_ruleset on sys_rulegroup (ruleset)
go 


CREATE TABLE sys_ruleset (
  name varchar(50) NOT NULL,
  title varchar(160) NULL,
  packagename varchar(50) NULL,
  domain varchar(50) NULL,
  role varchar(50) NULL,
  permission varchar(50) NULL,
  constraint pk_sys_ruleset PRIMARY KEY (name)
) 
go 


CREATE TABLE sys_ruleset_actiondef (
  ruleset varchar(50) NOT NULL,
  actiondef varchar(50) NOT NULL,
  constraint pk_sys_ruleset_actiondef PRIMARY KEY (ruleset,actiondef)
) 
go 
create index ix_actiondef on sys_ruleset_actiondef (actiondef)
go 


CREATE TABLE sys_ruleset_fact (
  ruleset varchar(50) NOT NULL,
  rulefact varchar(50) NOT NULL,
  constraint pk_sys_ruleset_fact PRIMARY KEY (ruleset,rulefact)
) 
go 
create index ix_rulefact on sys_ruleset_fact (rulefact)
go 


CREATE TABLE sys_rule_action (
  objid varchar(50) NOT NULL,
  parentid varchar(50) NULL,
  actiondef_objid varchar(50) NULL,
  actiondef_name varchar(50) NULL,
  pos int NULL,
  constraint pk_sys_rule_action PRIMARY KEY (objid)
) 
go 
create index ix_parentid on sys_rule_action (parentid)
go 
create index ix_actiondef_objid on sys_rule_action (actiondef_objid)
go 


CREATE TABLE sys_rule_actiondef (
  objid varchar(50) NOT NULL,
  name varchar(50) NOT NULL,
  title varchar(250) NULL,
  sortorder int NULL,
  actionname varchar(50) NULL,
  domain varchar(50) NULL,
  actionclass varchar(255) NULL,
  constraint pk_sys_rule_actiondef PRIMARY KEY (objid)
) 
go 


CREATE TABLE sys_rule_actiondef_param (
  objid varchar(100) NOT NULL DEFAULT '',
  parentid varchar(50) NULL,
  name varchar(50) NOT NULL,
  sortorder int NULL,
  title varchar(50) NULL,
  datatype varchar(50) NULL,
  handler varchar(50) NULL,
  lookuphandler varchar(50) NULL,
  lookupkey varchar(50) NULL,
  lookupvalue varchar(50) NULL,
  vardatatype varchar(50) NULL,
  lovname varchar(50) NULL,
  constraint pk_sys_rule_actiondef_param PRIMARY KEY (objid)
) 
go 
create index ix_parentid on sys_rule_actiondef_param (parentid)
go 


CREATE TABLE sys_rule_action_param (
  objid varchar(50) NOT NULL,
  parentid varchar(50) NULL,
  actiondefparam_objid varchar(100) NULL,
  stringvalue varchar(255) NULL,
  booleanvalue int NULL,
  var_objid varchar(50) NULL,
  var_name varchar(50) NULL,
  expr varchar(MAX) NULL,
  exprtype varchar(25) NULL,
  pos int NULL,
  obj_key varchar(50) NULL,
  obj_value varchar(255) NULL,
  listvalue varchar(MAX) NULL,
  lov varchar(50) NULL,
  rangeoption int NULL,
  constraint pk_sys_rule_action_param PRIMARY KEY (objid)
) 
go 
create index ix_parentid on sys_rule_action_param (parentid)
go 
create index ix_var_objid on sys_rule_action_param (var_objid)
go 
create index ix_actiondefparam_objid on sys_rule_action_param (actiondefparam_objid)
go 
create index ix_obj_key on sys_rule_action_param (obj_key)
go 


CREATE TABLE sys_rule_condition (
  objid varchar(50) NOT NULL,
  parentid varchar(50) NULL,
  fact_name varchar(50) NULL,
  fact_objid varchar(50) NULL,
  varname varchar(50) NULL,
  pos int NULL,
  ruletext varchar(MAX) NULL,
  displaytext varchar(MAX) NULL,
  dynamic_datatype varchar(50) NULL,
  dynamic_key varchar(50) NULL,
  dynamic_value varchar(50) NULL,
  notexist int NOT NULL,
  constraint pk_sys_rule_condition PRIMARY KEY (objid)
) 
go 
create index ix_fact_objid on sys_rule_condition (fact_objid)
go 
create index ix_parentid on sys_rule_condition (parentid)
go 


CREATE TABLE sys_rule_condition_constraint (
  objid varchar(50) NOT NULL,
  parentid varchar(50) NULL,
  field_objid varchar(100) NULL,
  fieldname varchar(50) NULL,
  varname varchar(50) NULL,
  operator_caption varchar(50) NULL,
  operator_symbol varchar(50) NULL,
  usevar int NULL,
  var_objid varchar(50) NULL,
  var_name varchar(50) NULL,
  decimalvalue decimal(16,2) NULL,
  intvalue int NULL,
  stringvalue varchar(255) NULL,
  listvalue varchar(MAX) NULL,
  datevalue date NULL,
  pos int NULL,
  constraint pk_sys_rule_condition_constraint PRIMARY KEY (objid)
) 
go 
create index ix_parentid on sys_rule_condition_constraint (parentid)
go 
create index ix_var_objid on sys_rule_condition_constraint (var_objid)
go 
create index ix_field_objid on sys_rule_condition_constraint (field_objid)
go 


CREATE TABLE sys_rule_condition_var (
  objid varchar(50) NOT NULL,
  parentid varchar(50) NULL,
  ruleid varchar(50) NULL,
  varname varchar(50) NULL,
  datatype varchar(50) NULL,
  pos int NULL,
  constraint pk_sys_rule_condition_var PRIMARY KEY (objid)
) 
go 
create index ix_parentid on sys_rule_condition_var (parentid)
go 


CREATE TABLE sys_rule_deployed (
  objid varchar(50) NOT NULL,
  ruletext varchar(MAX) NULL,
  constraint pk_sys_rule_deployed PRIMARY KEY (objid)
) 
go 


CREATE TABLE sys_rule_fact (
  objid varchar(50) NOT NULL,
  name varchar(50) NOT NULL,
  title varchar(160) NULL,
  factclass varchar(50) NULL,
  sortorder int NULL,
  handler varchar(50) NULL,
  defaultvarname varchar(25) NULL,
  dynamic int NULL,
  lookuphandler varchar(50) NULL,
  lookupkey varchar(50) NULL,
  lookupvalue varchar(50) NULL,
  lookupdatatype varchar(50) NULL,
  dynamicfieldname varchar(50) NULL,
  builtinconstraints varchar(50) NULL,
  domain varchar(50) NULL,
  factsuperclass varchar(50) NULL,
  constraint pk_sys_rule_fact PRIMARY KEY (objid)
) 
go 


CREATE TABLE sys_rule_fact_field (
  objid varchar(100) NOT NULL DEFAULT '',
  parentid varchar(50) NULL,
  name varchar(50) NOT NULL,
  title varchar(160) NULL,
  datatype varchar(50) NULL,
  sortorder int NULL,
  handler varchar(50) NULL,
  lookuphandler varchar(50) NULL,
  lookupkey varchar(50) NULL,
  lookupvalue varchar(50) NULL,
  lookupdatatype varchar(50) NULL,
  multivalued int NULL,
  required int NULL,
  vardatatype varchar(50) NULL,
  lovname varchar(50) NULL,
  constraint pk_sys_rule_fact_field PRIMARY KEY (objid)
) 
go 
create index ix_parentid on sys_rule_fact_field (parentid)
go 


CREATE TABLE sys_sequence (
  objid varchar(100) NOT NULL,
  nextSeries int NULL,
  constraint pk_sys_sequence PRIMARY KEY (objid)
) 
go 


CREATE TABLE sys_signature (
  objid varchar(50) NOT NULL,
  userid varchar(50) NULL,
  user_name varchar(255) NULL,
  displayname varchar(255) NULL,
  position varchar(255) NULL,
  signature varbinary(MAX) NULL,
  tag varchar(50) NULL,
  system int NULL,
  state int NULL,
  constraint pk_sys_signature PRIMARY KEY (objid)
) 
go 


CREATE TABLE sys_usergroup (
  objid varchar(50) NOT NULL,
  title varchar(255) NULL,
  domain varchar(25) NULL,
  userclass varchar(25) NULL,
  orgclass varchar(50) NULL,
  role varchar(50) NULL,
  constraint pk_sys_usergroup PRIMARY KEY (objid)
) 
go


CREATE TABLE sys_var (
  name varchar(50) NOT NULL,
  value varchar(MAX) NULL,
  description varchar(255) NULL,
  datatype varchar(15) NULL,
  category varchar(50) NULL,
  constraint pk_sys_var PRIMARY KEY (name)
) 
go 


CREATE TABLE sys_wf (
  name varchar(50) NOT NULL,
  title varchar(100) NULL,
  domain varchar(50) NULL,
  constraint pk_sys_wf PRIMARY KEY (name)
) 
go 


CREATE TABLE sys_wf_node (
  name varchar(50) NOT NULL,
  processname varchar(50) NOT NULL DEFAULT '',
  title varchar(100) NULL,
  nodetype varchar(10) NULL,
  idx int NULL,
  salience int NULL,
  domain varchar(50) NULL,
  role varchar(255) NULL,
  ui text,
  properties text,
  tracktime int NULL,
  constraint pk_sys_wf_node PRIMARY KEY (name,processname)
) 
go 


CREATE TABLE sys_wf_transition (
  parentid varchar(50) NOT NULL DEFAULT '',
  processname varchar(50) NOT NULL DEFAULT '',
  [action] varchar(50) NOT NULL,
  [to] varchar(50) NOT NULL,
  idx int NULL,
  eval varchar(MAX) NULL,
  properties varchar(255) NULL,
  permission varchar(255) NULL,
  caption varchar(255) NULL,
  ui text,
  constraint pk_sys_wf_transition PRIMARY KEY (parentid,processname,[to],[action])
) 
go 
