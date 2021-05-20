ALTER TABLE `obo_gensan`.`obo_app_attachment` 
ADD COLUMN `createdby_objid` varchar(50) NULL,
ADD COLUMN `createdby_name` varchar(255) NULL,
ADD COLUMN `dtcreated` datetime(0);