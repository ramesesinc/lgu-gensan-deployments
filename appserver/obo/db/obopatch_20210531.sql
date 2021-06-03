CREATE TABLE `occupancy_rpu_item`  (
  `objid` varchar(50) NOT NULL,
  `parentid` varchar(50) NULL,
  `faasid` varchar(50) NULL,
  `truecopycertid` varchar(50) NULL,
  `truecopycertfee` decimal(16, 2) NULL,
  PRIMARY KEY (`objid`)
);

ALTER TABLE `occupancy_rpu_item` 
ADD CONSTRAINT `fk_occupancy_rpu_item_parentid` FOREIGN KEY (`parentid`) REFERENCES `occupancy_rpu` (`objid`);

ALTER TABLE `occupancy_rpu` 
ADD COLUMN `truecopycertfee` decimal(16, 2) ;

ALTER TABLE `occupancy_rpu_item` 
ADD COLUMN `tdno` varchar(50) NULL;

ALTER TABLE `occupancy_rpu_item` 
ADD COLUMN `pin` varchar(50) NULL;