/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50559
Source Host           : localhost:3306
Source Database       : skilldb

Target Server Type    : MYSQL
Target Server Version : 50559
File Encoding         : 65001

Date: 2021-04-07 23:23:27
*/

CREATE DATABASE skilldb CHARACTER SET utf8;

USE skilldb;


SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address_abroad
-- ----------------------------
DROP TABLE IF EXISTS `address_abroad`;
CREATE TABLE `address_abroad` (
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address_abroad
-- ----------------------------
INSERT INTO `address_abroad` VALUES ('USA');
INSERT INTO `address_abroad` VALUES ('CANADA');
INSERT INTO `address_abroad` VALUES ('UNITED KINGDOM');
INSERT INTO `address_abroad` VALUES ('JAPAN');
INSERT INTO `address_abroad` VALUES ('HONG KONG');
INSERT INTO `address_abroad` VALUES ('SOUTH KOREA');
INSERT INTO `address_abroad` VALUES ('DUBAI');
INSERT INTO `address_abroad` VALUES ('CHINA');
INSERT INTO `address_abroad` VALUES ('RUSSIA');
INSERT INTO `address_abroad` VALUES ('AUSTRALIA');
INSERT INTO `address_abroad` VALUES ('FRANCE');

-- ----------------------------
-- Table structure for address_local
-- ----------------------------
DROP TABLE IF EXISTS `address_local`;
CREATE TABLE `address_local` (
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address_local
-- ----------------------------
INSERT INTO `address_local` VALUES ('CEBU');
INSERT INTO `address_local` VALUES ('DAVAO');
INSERT INTO `address_local` VALUES ('MAKATI');
INSERT INTO `address_local` VALUES ('TAGUIG');
INSERT INTO `address_local` VALUES ('ILOILO');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('CR-34be9d6a:156fc7a16bc:-7964', 'HOTEL RESTAURANT MANAGEMENT');
INSERT INTO `course` VALUES ('CR-4191e688:156b050a884:-7fa2', 'BACHELOR OF SCIENCE IN ECONOMICS');
INSERT INTO `course` VALUES ('CR-4191e688:156b050a884:-7faa', 'BACHELOR OF SCIENCE IN MASS COMMUNICATION');
INSERT INTO `course` VALUES ('CR-4191e688:156b050a884:-7faf', 'BACHELOR OF ARTS MAJOR IN POLITICAL SCIENCE');
INSERT INTO `course` VALUES ('CR-4191e688:156b050a884:-7fb4', 'BACHELOR OF ARTS MAJOR IN ENGLISH');
INSERT INTO `course` VALUES ('CR-4191e688:156b050a884:-7fb9', 'BACHELOR OF SCIENCE IN COMPUTER SCIENCE');
INSERT INTO `course` VALUES ('CR-4191e688:156b050a884:-7fbe', 'BACHELOR OF SCIENCE IN INFORMATION TECHNOLOGY');

-- ----------------------------
-- Table structure for dataentry
-- ----------------------------
DROP TABLE IF EXISTS `dataentry`;
CREATE TABLE `dataentry` (
  `objid` varchar(50) NOT NULL,
  `dtcreated` date DEFAULT NULL,
  `data` longtext,
  `createdby_objid` varchar(50) DEFAULT NULL,
  `createdby_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dataentry
-- ----------------------------

-- ----------------------------
-- Table structure for educationallevel
-- ----------------------------
DROP TABLE IF EXISTS `educationallevel`;
CREATE TABLE `educationallevel` (
  `level` varchar(50) DEFAULT NULL,
  `index` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of educationallevel
-- ----------------------------
INSERT INTO `educationallevel` VALUES ('NO FORMAL EDUCATION', '0');
INSERT INTO `educationallevel` VALUES ('INCOMPLETE ELEMENTARY LEVEL', '1');
INSERT INTO `educationallevel` VALUES ('ELEMENTARY GRADUATE', '2');
INSERT INTO `educationallevel` VALUES ('INCOMPLETE HIGH SCHOOL LEVEL', '3');
INSERT INTO `educationallevel` VALUES ('HIGH SCHOOL GRADUATE', '4');
INSERT INTO `educationallevel` VALUES ('INCOMPLETE COLLEGE LEVEL', '5');
INSERT INTO `educationallevel` VALUES ('COLLEGE GRADUATE', '6');
INSERT INTO `educationallevel` VALUES ('TECHNICAL-VOCATIONAL GRADUATE', '7');
INSERT INTO `educationallevel` VALUES ('POST GRADUATE', '8');

-- ----------------------------
-- Table structure for entity_education
-- ----------------------------
DROP TABLE IF EXISTS `entity_education`;
CREATE TABLE `entity_education` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) DEFAULT NULL,
  `schoolname` text,
  `educationlevel` varchar(50) DEFAULT NULL,
  `course_objid` varchar(50) DEFAULT NULL,
  `course_name` varchar(50) DEFAULT NULL,
  `fromyear` int(11) DEFAULT NULL,
  `toyear` int(11) DEFAULT NULL,
  `awards` text,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entity_education
-- ----------------------------

-- ----------------------------
-- Table structure for entity_eligibility
-- ----------------------------
DROP TABLE IF EXISTS `entity_eligibility`;
CREATE TABLE `entity_eligibility` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) DEFAULT NULL,
  `name` text,
  `licenseno` varchar(50) DEFAULT NULL,
  `expirydate` date DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entity_eligibility
-- ----------------------------

-- ----------------------------
-- Table structure for entity_jobpreference_occupation
-- ----------------------------
DROP TABLE IF EXISTS `entity_jobpreference_occupation`;
CREATE TABLE `entity_jobpreference_occupation` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) DEFAULT NULL,
  `occupation` text,
  `industry` text,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entity_jobpreference_occupation
-- ----------------------------

-- ----------------------------
-- Table structure for entity_jobpreference_worklocation
-- ----------------------------
DROP TABLE IF EXISTS `entity_jobpreference_worklocation`;
CREATE TABLE `entity_jobpreference_worklocation` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) DEFAULT NULL,
  `local` tinyint(1) DEFAULT NULL,
  `location` text,
  `index` int(11) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entity_jobpreference_worklocation
-- ----------------------------

-- ----------------------------
-- Table structure for entity_languageproficiency
-- ----------------------------
DROP TABLE IF EXISTS `entity_languageproficiency`;
CREATE TABLE `entity_languageproficiency` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) DEFAULT NULL,
  `language` text,
  `read` tinyint(1) DEFAULT NULL,
  `write` tinyint(1) DEFAULT NULL,
  `speak` tinyint(1) DEFAULT NULL,
  `understand` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entity_languageproficiency
-- ----------------------------

-- ----------------------------
-- Table structure for entity_skill
-- ----------------------------
DROP TABLE IF EXISTS `entity_skill`;
CREATE TABLE `entity_skill` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) DEFAULT NULL,
  `name` text,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entity_skill
-- ----------------------------

-- ----------------------------
-- Table structure for entity_training
-- ----------------------------
DROP TABLE IF EXISTS `entity_training`;
CREATE TABLE `entity_training` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) DEFAULT NULL,
  `training` text,
  `fromdate` date DEFAULT NULL,
  `todate` date DEFAULT NULL,
  `institution` text,
  `certificates` text,
  `completed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entity_training
-- ----------------------------

-- ----------------------------
-- Table structure for entity_workexperience
-- ----------------------------
DROP TABLE IF EXISTS `entity_workexperience`;
CREATE TABLE `entity_workexperience` (
  `objid` varchar(50) NOT NULL,
  `entityid` varchar(50) DEFAULT NULL,
  `companyname` text,
  `address` text,
  `fromdate` date DEFAULT NULL,
  `todate` date DEFAULT NULL,
  `appointmentstatus` text,
  `jobtitle_objid` varchar(50) DEFAULT NULL,
  `jobtitle_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entity_workexperience
-- ----------------------------

-- ----------------------------
-- Table structure for jobtitle
-- ----------------------------
DROP TABLE IF EXISTS `jobtitle`;
CREATE TABLE `jobtitle` (
  `objid` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`objid`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobtitle
-- ----------------------------
INSERT INTO `jobtitle` VALUES ('JT-34be9d6a:156fc7a16bc:-79d1', 'SECRETARY');
INSERT INTO `jobtitle` VALUES ('JT2eb26155:156a1d9c6a6:-7f34', 'ANDROID DEVELOPER');
INSERT INTO `jobtitle` VALUES ('JT2eb26155:156a1d9c6a6:-7f39', 'JAVA DEVELOPER');
INSERT INTO `jobtitle` VALUES ('JT2eb26155:156a1d9c6a6:-7f71', 'IT MANAGER');
INSERT INTO `jobtitle` VALUES ('JT2eb26155:156a1d9c6a6:-7fa8', 'CALL CENTER AGENT');
INSERT INTO `jobtitle` VALUES ('JT2eb26155:156a1d9c6a6:-7fad', 'TEACHER');
INSERT INTO `jobtitle` VALUES ('JT2eb26155:156a1d9c6a6:-7fb5', 'ENCODER');
INSERT INTO `jobtitle` VALUES ('JT2eb26155:156a1d9c6a6:-7fba', 'WEB DESIGNER');

-- ----------------------------
-- Table structure for language
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of language
-- ----------------------------
INSERT INTO `language` VALUES ('ENGLISH');
INSERT INTO `language` VALUES ('BISAYA');
INSERT INTO `language` VALUES ('TAGALOG');
INSERT INTO `language` VALUES ('ILOKO');
INSERT INTO `language` VALUES ('ILONGGO');
INSERT INTO `language` VALUES ('AKLANON');
INSERT INTO `language` VALUES ('SPANISH');
INSERT INTO `language` VALUES ('MANDARIN');
INSERT INTO `language` VALUES ('ITALIAN');
INSERT INTO `language` VALUES ('PORTUGESE');
