DROP TABLE IF EXISTS `online_business_application`
;
CREATE TABLE `online_business_application` (
  `objid` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `dtcreated` datetime NOT NULL,
  `createdby_objid` varchar(50) NOT NULL,
  `createdby_name` varchar(100) NOT NULL,
  `controlno` varchar(25) NOT NULL,
  `prevapplicationid` varchar(50) NOT NULL,
  `business_objid` varchar(50) NOT NULL,
  `appyear` int(11) NOT NULL,
  `apptype` varchar(20) NOT NULL,
  `appdate` date NOT NULL,
  `lobs` text NOT NULL,
  `infos` longtext NOT NULL,
  `requirements` longtext NOT NULL,
  `step` int(11) NOT NULL DEFAULT '0',
  `dtapproved` datetime NULL,
  `approvedby_objid` varchar(50) NULL,
  `approvedby_name` varchar(150) NULL,
  `approvedappno` varchar(25) NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact_address` varchar(255) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `contact_mobileno` varchar(15) NULL,
  `partnername` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`),
  KEY `ix_state` (`state`),
  KEY `ix_dtcreated` (`dtcreated`),
  KEY `ix_controlno` (`controlno`),
  KEY `ix_prevapplicationid` (`prevapplicationid`),
  KEY `ix_business_objid` (`business_objid`),
  KEY `ix_appyear` (`appyear`),
  KEY `ix_appdate` (`appdate`),
  KEY `ix_dtapproved` (`dtapproved`),
  KEY `ix_approvedby_objid` (`approvedby_objid`),
  KEY `ix_approvedby_name` (`approvedby_name`),
  CONSTRAINT `fk_online_business_application_business_objid` FOREIGN KEY (`business_objid`) REFERENCES `business` (`objid`),
  CONSTRAINT `fk_online_business_application_prevapplicationid` FOREIGN KEY (`prevapplicationid`) REFERENCES `business_application` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
; 


DROP VIEW IF EXISTS `vw_online_business_application` 
;
CREATE VIEW `vw_online_business_application` AS 
select 
`oa`.`objid` AS `objid`, 
`oa`.`state` AS `state`, 
`oa`.`dtcreated` AS `dtcreated`, 
`oa`.`createdby_objid` AS `createdby_objid`, 
`oa`.`createdby_name` AS `createdby_name`, 
`oa`.`controlno` AS `controlno`, 
`oa`.`apptype` AS `apptype`, 
`oa`.`appyear` AS `appyear`, 
`oa`.`appdate` AS `appdate`, 
`oa`.`prevapplicationid` AS `prevapplicationid`, 
`oa`.`business_objid` AS `business_objid`, 
`b`.`bin` AS `bin`, 
`b`.`tradename` AS `tradename`, 
`b`.`businessname` AS `businessname`, 
`b`.`address_text` AS `address_text`, 
`b`.`address_objid` AS `address_objid`, 
`b`.`owner_name` AS `owner_name`, 
`b`.`owner_address_text` AS `owner_address_text`, 
`b`.`owner_address_objid` AS `owner_address_objid`, 
`b`.`yearstarted` AS `yearstarted`, 
`b`.`orgtype` AS `orgtype`, 
`b`.`permittype` AS `permittype`, 
`b`.`officetype` AS `officetype`, 
`oa`.`step` AS `step`  
from `online_business_application` `oa` 
  inner join `business_application` `a` on `a`.`objid` = `oa`.`prevapplicationid` 
  inner join `business` `b` on `b`.`objid` = `a`.`business_objid`
; 