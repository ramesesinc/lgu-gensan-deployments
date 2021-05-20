
CREATE TABLE `obo_app`  (
  `objid` varchar(50) NULL,
  `doctypeid` varchar(50) NULL,
  `appno` varchar(50) NULL,
  `appdate` date NULL,
  `trackingno` varchar(50) NULL,
  `applicantid` varchar(50) NULL,
  `contact_name` varchar(255) NULL,
  `contact_detail` varchar(255) NULL,
  `contact_email` varchar(255) NULL,
  `contact_mobileno` varchar(50) NULL,
  `contact_phoneno` varchar(50) NULL,
  `txnmode` varchar(50) NULL,
  `orgcode` varchar(50) NULL,
  `createdby_objid` varchar(50) NULL,
  `createdby_name` varchar(255) NULL,
  `dtcreated` datetime NULL,
  UNIQUE INDEX `uix_obo_app_appno`(`appno`),
  UNIQUE INDEX `uix_obo_app_trackingno`(`trackingno`),
  CONSTRAINT `fk_obo_app_doctypeid` FOREIGN KEY (`doctypeid`) REFERENCES `obo_doctype` (`objid`),
  CONSTRAINT `fk_obo_app_applicantid` FOREIGN KEY (`applicantid`) REFERENCES `obo_app_entity` (`objid`)
);

ALTER TABLE `obo_dev2`.`building_permit` DROP FOREIGN KEY `fk_building_permit_taskid`;
ALTER TABLE `obo_dev2`.`building_permit` 
DROP COLUMN `controlid`,
DROP COLUMN `_zoneclassid`,
DROP COLUMN `_zone`;
ALTER TABLE `building_permit` DROP FOREIGN KEY `fk_building_permit_applicantid`;

INSERT INTO obo_app 
SELECT 
`objid`,
`doctypeid`,
`appno`,
`appdate`,
`trackingno`,
`applicantid`,
`contact_name`,
`contact_detail`,
`contact_email`,
`contact_mobileno`,
`contact_phoneno`,
`txnmode`,
`orgcode`,
`createdby_objid`,
`createdby_name`,
`dtcreated`
FROM building_permit;


ALTER TABLE `building_permit` 
DROP COLUMN `appno`,
DROP COLUMN `orgcode`,
DROP COLUMN `trackingno`,
DROP COLUMN `appdate`,
DROP COLUMN `contact_name`,
DROP COLUMN `contact_detail`,
DROP COLUMN `contact_email`,
DROP COLUMN `contact_mobileno`,
DROP COLUMN `txnmode`,
DROP COLUMN `applicantid`,
DROP COLUMN `createdby_objid`,
DROP COLUMN `createdby_name`,
DROP COLUMN `dtcreated`;


ALTER TABLE `obo_dev2`.`obo_app_attachment` 
ADD CONSTRAINT `fk_obo_app_attachment_appid` FOREIGN KEY (`appid`) REFERENCES `obo_dev2`.`obo_app` (`objid`);


ALTER TABLE `obo_dev2`.`obo_app_doc` DROP FOREIGN KEY `fk_obo_doc_controlid`;

ALTER TABLE `obo_dev2`.`obo_app_doc` DROP FOREIGN KEY `fk_obo_doc_doctypeid`;

ALTER TABLE `obo_dev2`.`obo_app_doc` 
ADD CONSTRAINT `fk_obo_app_doc_controlid` FOREIGN KEY (`controlid`) REFERENCES `obo_dev2`.`obo_control` (`objid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT `fk_obo_app_doc_doctypeid` FOREIGN KEY (`doctypeid`) REFERENCES `obo_dev2`.`obo_doctype` (`objid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT `fk_obo_app_doc_appid` FOREIGN KEY (`appid`) REFERENCES `obo_dev2`.`obo_app` (`objid`);


ALTER TABLE `obo_dev2`.`obo_app_doc_checklist` DROP FOREIGN KEY `fk_obo_doc_checklist_parentid`;

ALTER TABLE `obo_dev2`.`obo_app_doc_checklist` 
ADD CONSTRAINT `fk_obo_app_doc_checklist_parentid` FOREIGN KEY (`parentid`) REFERENCES `obo_dev2`.`obo_app_doc` (`objid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `obo_dev2`.`obo_app_doc_info` DROP FOREIGN KEY `fk_obo_doc_info_name`;

ALTER TABLE `obo_dev2`.`obo_app_doc_info` DROP FOREIGN KEY `fk_obo_doc_info_parentid`;

ALTER TABLE `obo_dev2`.`obo_app_doc_info` 
ADD CONSTRAINT `fk_obo_app_doc_info_name` FOREIGN KEY (`name`) REFERENCES `obo_dev2`.`obo_variable` (`objid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT `fk_obo_app_doc_info_parentid` FOREIGN KEY (`parentid`) REFERENCES `obo_dev2`.`obo_app_doc` (`objid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT `fk_obo_app_doc_info_appid` FOREIGN KEY (`appid`) REFERENCES `obo_dev2`.`obo_app` (`objid`);


ALTER TABLE `obo_dev2`.`obo_app_entity` 
ADD CONSTRAINT `fk_obo_app_entity_appid` FOREIGN KEY (`appid`) REFERENCES `obo_dev2`.`obo_app` (`objid`);


ALTER TABLE `obo_dev2`.`obo_app_fee` DROP FOREIGN KEY `fk_building_permit_fee_itemid`;

ALTER TABLE `obo_dev2`.`obo_app_fee` DROP FOREIGN KEY `fk_builidng_permit_fee_parentid`;

ALTER TABLE `obo_dev2`.`obo_app_fee` 
ADD CONSTRAINT `fk_obo_app_fee_itemid` FOREIGN KEY (`itemid`) REFERENCES `obo_dev2`.`obo_itemaccount` (`objid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT `fk_obo_app_fee_parentid` FOREIGN KEY (`parentid`) REFERENCES `obo_dev2`.`obo_app_doc` (`objid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT `fk_obo_app_fee_appid` FOREIGN KEY (`appid`) REFERENCES `obo_dev2`.`obo_app` (`objid`);

ALTER TABLE `obo_dev2`.`obo_app_professional` 
ADD CONSTRAINT `fk_obo_app_professional_appid` FOREIGN KEY (`appid`) REFERENCES `obo_dev2`.`obo_app` (`objid`),
ADD CONSTRAINT `fk_obo_app_professional_sectionid` FOREIGN KEY (`sectionid`) REFERENCES `obo_dev2`.`obo_section` (`objid`),
ADD CONSTRAINT `fk_obo_app_professional_doctypeid` FOREIGN KEY (`doctypeid`) REFERENCES `obo_dev2`.`obo_doctype` (`objid`),
ADD CONSTRAINT `fk_obo_app_professional_supervisorid` FOREIGN KEY (`supervisorid`) REFERENCES `obo_dev2`.`obo_professional_info` (`objid`),
ADD CONSTRAINT `fk_obo_app_professional_designprofessionalid` FOREIGN KEY (`designprofessionalid`) REFERENCES `obo_dev2`.`obo_professional_info` (`objid`);

ALTER TABLE `obo_dev2`.`obo_app_transmittal` DROP FOREIGN KEY `fk_building_permit_transmittal_appid`;

ALTER TABLE `obo_dev2`.`obo_app_transmittal` 
ADD CONSTRAINT `fk_obo_app_transmittal_appid` FOREIGN KEY (`appid`) REFERENCES `obo_dev2`.`obo_app` (`objid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `obo_dev2`.`obo_app_taskitem_task` DROP FOREIGN KEY `fk_building_permit_evaluation_task_refid`;

ALTER TABLE `obo_dev2`.`obo_app_taskitem_task` 
ADD CONSTRAINT `fk_obo_app_taskitem_task_refid` FOREIGN KEY (`refid`) REFERENCES `obo_dev2`.`obo_app_taskitem` (`objid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `obo_dev2`.`obo_app_taskitem_finding` DROP FOREIGN KEY `fk_building_permit_finding_appid`;

ALTER TABLE `obo_dev2`.`obo_app_taskitem_finding` DROP FOREIGN KEY `fk_building_permit_finding_attachmentid`;

ALTER TABLE `obo_dev2`.`obo_app_taskitem_finding` DROP FOREIGN KEY `fk_building_permit_finding_checklistitemid`;

ALTER TABLE `obo_dev2`.`obo_app_taskitem_finding` DROP FOREIGN KEY `fk_building_permit_finding_parentid`;

ALTER TABLE `obo_dev2`.`obo_app_taskitem_finding` DROP FOREIGN KEY `fk_building_permit_finding_supersederid`;

ALTER TABLE `obo_dev2`.`obo_app_taskitem_finding` 
ADD CONSTRAINT `fk_obo_app_taskitem_finding_appid` FOREIGN KEY (`appid`) REFERENCES `obo_dev2`.`obo_app` (`objid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT `fk_obo_app_taskitem_finding_attachmentid` FOREIGN KEY (`attachmentid`) REFERENCES `obo_dev2`.`sys_file` (`objid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT `fk_obo_app_taskitem_finding_checklistitemid` FOREIGN KEY (`checklistitemid`) REFERENCES `obo_dev2`.`obo_checklist_master` (`objid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT `fk_obo_app_taskitem_finding_parentid` FOREIGN KEY (`parentid`) REFERENCES `obo_dev2`.`obo_app_taskitem` (`objid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT `fk_obo_app_taskitem_finding_supersederid` FOREIGN KEY (`supersederid`) REFERENCES `obo_dev2`.`obo_app_taskitem_finding` (`objid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `obo_dev2`.`obo_app_taskitem` DROP FOREIGN KEY `fk_building_application_section_taskid`;

ALTER TABLE `obo_dev2`.`obo_app_taskitem` DROP FOREIGN KEY `fk_building_application_section_typeid`;

ALTER TABLE `obo_dev2`.`obo_app_taskitem` 
ADD CONSTRAINT `fk_obo_app_taskitem_taskid` FOREIGN KEY (`taskid`) REFERENCES `obo_dev2`.`obo_app_taskitem_task` (`taskid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT `fk_obo_app_taskitem_typeid` FOREIGN KEY (`typeid`) REFERENCES `obo_dev2`.`obo_taskitem_type` (`objid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT `fk_obo_app_taskitem_appid` FOREIGN KEY (`appid`) REFERENCES `obo_dev2`.`obo_app` (`objid`);

ALTER TABLE `obo_dev2`.`obo_app_requirement` 
ADD CONSTRAINT `fk_obo_app_requirement_appid` FOREIGN KEY (`appid`) REFERENCES `obo_dev2`.`obo_app` (`objid`);

ALTER TABLE `obo_dev2`.`obo_app_doc` 
DROP COLUMN `designprofessionalid`,
DROP COLUMN `supervisorid`,
DROP COLUMN `contractorname`,
DROP COLUMN `occupancytypeid`;





