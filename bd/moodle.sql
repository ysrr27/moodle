-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: moodle
-- ------------------------------------------------------
-- Server version	5.5.54-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mdl_assign`
--

DROP TABLE IF EXISTS `mdl_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alwaysshowdescription` tinyint(2) NOT NULL DEFAULT '0',
  `nosubmissions` tinyint(2) NOT NULL DEFAULT '0',
  `submissiondrafts` tinyint(2) NOT NULL DEFAULT '0',
  `sendnotifications` tinyint(2) NOT NULL DEFAULT '0',
  `sendlatenotifications` tinyint(2) NOT NULL DEFAULT '0',
  `duedate` bigint(10) NOT NULL DEFAULT '0',
  `allowsubmissionsfromdate` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requiresubmissionstatement` tinyint(2) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(2) NOT NULL DEFAULT '0',
  `cutoffdate` bigint(10) NOT NULL DEFAULT '0',
  `teamsubmission` tinyint(2) NOT NULL DEFAULT '0',
  `requireallteammemberssubmit` tinyint(2) NOT NULL DEFAULT '0',
  `teamsubmissiongroupingid` bigint(10) NOT NULL DEFAULT '0',
  `blindmarking` tinyint(2) NOT NULL DEFAULT '0',
  `revealidentities` tinyint(2) NOT NULL DEFAULT '0',
  `attemptreopenmethod` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `maxattempts` mediumint(6) NOT NULL DEFAULT '-1',
  `markingworkflow` tinyint(2) NOT NULL DEFAULT '0',
  `markingallocation` tinyint(2) NOT NULL DEFAULT '0',
  `sendstudentnotifications` tinyint(2) NOT NULL DEFAULT '1',
  `preventsubmissionnotingroup` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou_ix` (`course`),
  KEY `mdl_assi_tea_ix` (`teamsubmissiongroupingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table saves information about an instance of mod_assign';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign`
--

LOCK TABLES `mdl_assign` WRITE;
/*!40000 ALTER TABLE `mdl_assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_grades`
--

DROP TABLE IF EXISTS `mdl_assign_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `grader` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '0.00000',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assigrad_assuseatt_uix` (`assignment`,`userid`,`attemptnumber`),
  KEY `mdl_assigrad_use_ix` (`userid`),
  KEY `mdl_assigrad_att_ix` (`attemptnumber`),
  KEY `mdl_assigrad_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Grading information about a single assignment submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_grades`
--

LOCK TABLES `mdl_assign_grades` WRITE;
/*!40000 ALTER TABLE `mdl_assign_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_plugin_config`
--

DROP TABLE IF EXISTS `mdl_assign_plugin_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_plugin_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `plugin` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subtype` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_assiplugconf_plu_ix` (`plugin`),
  KEY `mdl_assiplugconf_sub_ix` (`subtype`),
  KEY `mdl_assiplugconf_nam_ix` (`name`),
  KEY `mdl_assiplugconf_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Config data for an instance of a plugin in an assignment.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_plugin_config`
--

LOCK TABLES `mdl_assign_plugin_config` WRITE;
/*!40000 ALTER TABLE `mdl_assign_plugin_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_plugin_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_submission`
--

DROP TABLE IF EXISTS `mdl_assign_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  `latest` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assisubm_assusegroatt_uix` (`assignment`,`userid`,`groupid`,`attemptnumber`),
  KEY `mdl_assisubm_use_ix` (`userid`),
  KEY `mdl_assisubm_att_ix` (`attemptnumber`),
  KEY `mdl_assisubm_assusegrolat_ix` (`assignment`,`userid`,`groupid`,`latest`),
  KEY `mdl_assisubm_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about student interactions with';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_submission`
--

LOCK TABLES `mdl_assign_submission` WRITE;
/*!40000 ALTER TABLE `mdl_assign_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_user_flags`
--

DROP TABLE IF EXISTS `mdl_assign_user_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_user_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` smallint(4) NOT NULL DEFAULT '0',
  `extensionduedate` bigint(10) NOT NULL DEFAULT '0',
  `workflowstate` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allocatedmarker` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiuserflag_mai_ix` (`mailed`),
  KEY `mdl_assiuserflag_use_ix` (`userid`),
  KEY `mdl_assiuserflag_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of flags that can be set for a single user in a single ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_user_flags`
--

LOCK TABLES `mdl_assign_user_flags` WRITE;
/*!40000 ALTER TABLE `mdl_assign_user_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_user_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_user_mapping`
--

DROP TABLE IF EXISTS `mdl_assign_user_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_user_mapping` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiusermapp_ass_ix` (`assignment`),
  KEY `mdl_assiusermapp_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Map an assignment specific id number to a user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_user_mapping`
--

LOCK TABLES `mdl_assign_user_mapping` WRITE;
/*!40000 ALTER TABLE `mdl_assign_user_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_user_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_comments`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `commenttext` longtext COLLATE utf8_unicode_ci,
  `commentformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assicomm_ass_ix` (`assignment`),
  KEY `mdl_assicomm_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Text feedback for submitted assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_comments`
--

LOCK TABLES `mdl_assignfeedback_comments` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_editpdf_annot`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_editpdf_annot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_editpdf_annot` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `endx` bigint(10) DEFAULT '0',
  `endy` bigint(10) DEFAULT '0',
  `path` longtext COLLATE utf8_unicode_ci,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'line',
  `colour` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditanno_grapag_ix` (`gradeid`,`pageno`),
  KEY `mdl_assieditanno_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores annotations added to pdfs submitted by students';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_editpdf_annot`
--

LOCK TABLES `mdl_assignfeedback_editpdf_annot` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_annot` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_annot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_editpdf_cmnt`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_editpdf_cmnt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_editpdf_cmnt` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `width` bigint(10) DEFAULT '120',
  `rawtext` longtext COLLATE utf8_unicode_ci,
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `colour` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditcmnt_grapag_ix` (`gradeid`,`pageno`),
  KEY `mdl_assieditcmnt_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores comments added to pdfs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_editpdf_cmnt`
--

LOCK TABLES `mdl_assignfeedback_editpdf_cmnt` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_cmnt` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_cmnt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_editpdf_quick`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_editpdf_quick`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_editpdf_quick` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `rawtext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `width` bigint(10) NOT NULL DEFAULT '120',
  `colour` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'yellow',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditquic_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores teacher specified quicklist comments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_editpdf_quick`
--

LOCK TABLES `mdl_assignfeedback_editpdf_quick` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_quick` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_editpdf_quick` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_file`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass2_ix` (`assignment`),
  KEY `mdl_assifile_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores info about the number of files submitted by a student';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_file`
--

LOCK TABLES `mdl_assignfeedback_file` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignment`
--

DROP TABLE IF EXISTS `mdl_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignment` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `timedue` bigint(10) NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou2_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignment`
--

LOCK TABLES `mdl_assignment` WRITE;
/*!40000 ALTER TABLE `mdl_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignment_submissions`
--

DROP TABLE IF EXISTS `mdl_assignment_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignment_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  `data1` longtext COLLATE utf8_unicode_ci,
  `data2` longtext COLLATE utf8_unicode_ci,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `teacher` bigint(10) NOT NULL DEFAULT '0',
  `timemarked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assisubm_use2_ix` (`userid`),
  KEY `mdl_assisubm_mai_ix` (`mailed`),
  KEY `mdl_assisubm_tim_ix` (`timemarked`),
  KEY `mdl_assisubm_ass2_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about submitted assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignment_submissions`
--

LOCK TABLES `mdl_assignment_submissions` WRITE;
/*!40000 ALTER TABLE `mdl_assignment_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignment_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignment_upgrade`
--

DROP TABLE IF EXISTS `mdl_assignment_upgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignment_upgrade` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `oldcmid` bigint(10) NOT NULL DEFAULT '0',
  `oldinstance` bigint(10) NOT NULL DEFAULT '0',
  `newcmid` bigint(10) NOT NULL DEFAULT '0',
  `newinstance` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiupgr_old_ix` (`oldcmid`),
  KEY `mdl_assiupgr_old2_ix` (`oldinstance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about upgraded assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignment_upgrade`
--

LOCK TABLES `mdl_assignment_upgrade` WRITE;
/*!40000 ALTER TABLE `mdl_assignment_upgrade` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignment_upgrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignsubmission_file`
--

DROP TABLE IF EXISTS `mdl_assignsubmission_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignsubmission_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass_ix` (`assignment`),
  KEY `mdl_assifile_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about file submissions for assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignsubmission_file`
--

LOCK TABLES `mdl_assignsubmission_file` WRITE;
/*!40000 ALTER TABLE `mdl_assignsubmission_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignsubmission_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignsubmission_onlinetext`
--

DROP TABLE IF EXISTS `mdl_assignsubmission_onlinetext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignsubmission_onlinetext` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `onlinetext` longtext COLLATE utf8_unicode_ci,
  `onlineformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assionli_ass_ix` (`assignment`),
  KEY `mdl_assionli_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about onlinetext submission';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignsubmission_onlinetext`
--

LOCK TABLES `mdl_assignsubmission_onlinetext` WRITE;
/*!40000 ALTER TABLE `mdl_assignsubmission_onlinetext` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignsubmission_onlinetext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_controllers`
--

DROP TABLE IF EXISTS `mdl_backup_controllers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_backup_controllers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `operation` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'backup',
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `format` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `interactive` smallint(4) NOT NULL,
  `purpose` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `status` smallint(4) NOT NULL,
  `execution` smallint(4) NOT NULL,
  `executiontime` bigint(10) NOT NULL,
  `checksum` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `controller` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  KEY `mdl_backcont_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store the backup_controllers as they are used';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_controllers`
--

LOCK TABLES `mdl_backup_controllers` WRITE;
/*!40000 ALTER TABLE `mdl_backup_controllers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_controllers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_courses`
--

DROP TABLE IF EXISTS `mdl_backup_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_backup_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) NOT NULL DEFAULT '0',
  `laststatus` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '5',
  `nextstarttime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store every course backup status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_courses`
--

LOCK TABLES `mdl_backup_courses` WRITE;
/*!40000 ALTER TABLE `mdl_backup_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_logs`
--

DROP TABLE IF EXISTS `mdl_backup_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_backup_logs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `loglevel` smallint(4) NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`),
  KEY `mdl_backlogs_bac_ix` (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store all the logs from backup and restore operations (by';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_logs`
--

LOCK TABLES `mdl_backup_logs` WRITE;
/*!40000 ALTER TABLE `mdl_backup_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge`
--

DROP TABLE IF EXISTS `mdl_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usercreated` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `issuername` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `issuerurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `issuercontact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiredate` bigint(10) DEFAULT NULL,
  `expireperiod` bigint(10) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `courseid` bigint(10) DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `messagesubject` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attachment` tinyint(1) NOT NULL DEFAULT '1',
  `notification` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `nextcron` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badg_typ_ix` (`type`),
  KEY `mdl_badg_cou_ix` (`courseid`),
  KEY `mdl_badg_use_ix` (`usermodified`),
  KEY `mdl_badg_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines badge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge`
--

LOCK TABLES `mdl_badge` WRITE;
/*!40000 ALTER TABLE `mdl_badge` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_backpack`
--

DROP TABLE IF EXISTS `mdl_badge_backpack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_backpack` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backpackurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backpackuid` bigint(10) NOT NULL,
  `autosync` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgback_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines settings for connecting external backpack';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_backpack`
--

LOCK TABLES `mdl_badge_backpack` WRITE;
/*!40000 ALTER TABLE `mdl_badge_backpack` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_backpack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_criteria`
--

DROP TABLE IF EXISTS `mdl_badge_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '1',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgcrit_badcri_uix` (`badgeid`,`criteriatype`),
  KEY `mdl_badgcrit_cri_ix` (`criteriatype`),
  KEY `mdl_badgcrit_bad_ix` (`badgeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines criteria for issuing badges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_criteria`
--

LOCK TABLES `mdl_badge_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_badge_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_criteria_met`
--

DROP TABLE IF EXISTS `mdl_badge_criteria_met`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_criteria_met` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `issuedid` bigint(10) DEFAULT NULL,
  `critid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritmet_cri_ix` (`critid`),
  KEY `mdl_badgcritmet_use_ix` (`userid`),
  KEY `mdl_badgcritmet_iss_ix` (`issuedid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines criteria that were met for an issued badge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_criteria_met`
--

LOCK TABLES `mdl_badge_criteria_met` WRITE;
/*!40000 ALTER TABLE `mdl_badge_criteria_met` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_criteria_met` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_criteria_param`
--

DROP TABLE IF EXISTS `mdl_badge_criteria_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_criteria_param` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `critid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritpara_cri_ix` (`critid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines parameters for badges criteria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_criteria_param`
--

LOCK TABLES `mdl_badge_criteria_param` WRITE;
/*!40000 ALTER TABLE `mdl_badge_criteria_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_criteria_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_external`
--

DROP TABLE IF EXISTS `mdl_badge_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backpackid` bigint(10) NOT NULL,
  `collectionid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgexte_bac_ix` (`backpackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Setting for external badges display';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_external`
--

LOCK TABLES `mdl_badge_external` WRITE;
/*!40000 ALTER TABLE `mdl_badge_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_issued`
--

DROP TABLE IF EXISTS `mdl_badge_issued`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_issued` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `uniquehash` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dateissued` bigint(10) NOT NULL DEFAULT '0',
  `dateexpire` bigint(10) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `issuernotified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgissu_baduse_uix` (`badgeid`,`userid`),
  KEY `mdl_badgissu_bad_ix` (`badgeid`),
  KEY `mdl_badgissu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines issued badges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_issued`
--

LOCK TABLES `mdl_badge_issued` WRITE;
/*!40000 ALTER TABLE `mdl_badge_issued` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_issued` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_manual_award`
--

DROP TABLE IF EXISTS `mdl_badge_manual_award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_manual_award` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL,
  `recipientid` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `issuerrole` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgmanuawar_bad_ix` (`badgeid`),
  KEY `mdl_badgmanuawar_rec_ix` (`recipientid`),
  KEY `mdl_badgmanuawar_iss_ix` (`issuerid`),
  KEY `mdl_badgmanuawar_iss2_ix` (`issuerrole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Track manual award criteria for badges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_manual_award`
--

LOCK TABLES `mdl_badge_manual_award` WRITE;
/*!40000 ALTER TABLE `mdl_badge_manual_award` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_manual_award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block`
--

DROP TABLE IF EXISTS `mdl_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_bloc_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='contains all installed blocks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block`
--

LOCK TABLES `mdl_block` WRITE;
/*!40000 ALTER TABLE `mdl_block` DISABLE KEYS */;
INSERT INTO `mdl_block` VALUES (1,'activity_modules',0,0,1),(2,'activity_results',0,0,1),(3,'admin_bookmarks',0,0,1),(4,'badges',0,0,1),(5,'blog_menu',0,0,1),(6,'blog_recent',0,0,1),(7,'blog_tags',0,0,1),(8,'calendar_month',0,0,1),(9,'calendar_upcoming',0,0,1),(10,'comments',0,0,1),(11,'community',0,0,1),(12,'completionstatus',0,0,1),(13,'course_list',0,0,1),(14,'course_overview',0,0,1),(15,'course_summary',0,0,1),(16,'feedback',0,0,0),(17,'glossary_random',0,0,1),(18,'html',0,0,1),(19,'login',0,0,1),(20,'mentees',0,0,1),(21,'messages',0,0,1),(22,'mnet_hosts',0,0,1),(23,'myprofile',0,0,1),(24,'navigation',0,0,1),(25,'news_items',0,0,1),(26,'online_users',0,0,1),(27,'participants',0,0,1),(28,'private_files',0,0,1),(29,'quiz_results',0,0,0),(30,'recent_activity',86400,0,1),(31,'rss_client',300,0,1),(32,'search_forums',0,0,1),(33,'section_links',0,0,1),(34,'selfcompletion',0,0,1),(35,'settings',0,0,1),(36,'site_main_menu',0,0,1),(37,'social_activities',0,0,1),(38,'tag_flickr',0,0,1),(39,'tag_youtube',0,0,0),(40,'tags',0,0,1);
/*!40000 ALTER TABLE `mdl_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_community`
--

DROP TABLE IF EXISTS `mdl_block_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_community` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `coursename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `coursedescription` longtext COLLATE utf8_unicode_ci,
  `courseurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `imageurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Community block';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_community`
--

LOCK TABLES `mdl_block_community` WRITE;
/*!40000 ALTER TABLE `mdl_block_community` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_instances`
--

DROP TABLE IF EXISTS `mdl_block_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `pagetypepattern` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultregion` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  KEY `mdl_blocinst_par_ix` (`parentcontextid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores block instances. The type of block this is';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_instances`
--

LOCK TABLES `mdl_block_instances` WRITE;
/*!40000 ALTER TABLE `mdl_block_instances` DISABLE KEYS */;
INSERT INTO `mdl_block_instances` VALUES (1,'site_main_menu',2,0,'site-index',NULL,'side-pre',0,''),(2,'course_summary',2,0,'site-index',NULL,'side-post',0,''),(3,'calendar_month',2,0,'site-index',NULL,'side-post',1,''),(4,'navigation',1,1,'*',NULL,'side-pre',0,''),(5,'settings',1,1,'*',NULL,'side-pre',1,''),(6,'admin_bookmarks',1,0,'admin-*',NULL,'side-pre',2,''),(7,'private_files',1,0,'my-index','2','side-post',0,''),(8,'online_users',1,0,'my-index','2','side-post',1,''),(9,'badges',1,0,'my-index','2','side-post',2,''),(10,'calendar_month',1,0,'my-index','2','side-post',3,''),(11,'calendar_upcoming',1,0,'my-index','2','side-post',4,''),(12,'course_overview',1,0,'my-index','2','content',0,''),(13,'private_files',5,0,'my-index','3','side-post',0,''),(14,'online_users',5,0,'my-index','3','side-post',1,''),(15,'badges',5,0,'my-index','3','side-post',2,''),(16,'calendar_month',5,0,'my-index','3','side-post',3,''),(17,'calendar_upcoming',5,0,'my-index','3','side-post',4,''),(18,'course_overview',5,0,'my-index','3','content',0,'');
/*!40000 ALTER TABLE `mdl_block_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_positions`
--

DROP TABLE IF EXISTS `mdl_block_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_positions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockinstanceid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `pagetype` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subpage` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  KEY `mdl_blocposi_blo_ix` (`blockinstanceid`),
  KEY `mdl_blocposi_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the position of a sticky block_instance on a another ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_positions`
--

LOCK TABLES `mdl_block_positions` WRITE;
/*!40000 ALTER TABLE `mdl_block_positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_recent_activity`
--

DROP TABLE IF EXISTS `mdl_block_recent_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_recent_activity` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `cmid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `action` tinyint(1) NOT NULL,
  `modname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blocreceacti_coutim_ix` (`courseid`,`timecreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Recent activity block';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_recent_activity`
--

LOCK TABLES `mdl_block_recent_activity` WRITE;
/*!40000 ALTER TABLE `mdl_block_recent_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_recent_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_rss_client`
--

DROP TABLE IF EXISTS `mdl_block_rss_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_rss_client` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `preferredtitle` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `shared` tinyint(2) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `skiptime` bigint(10) NOT NULL DEFAULT '0',
  `skipuntil` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Remote news feed information. Contains the news feed id, the';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_rss_client`
--

LOCK TABLES `mdl_block_rss_client` WRITE;
/*!40000 ALTER TABLE `mdl_block_rss_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_rss_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_blog_association`
--

DROP TABLE IF EXISTS `mdl_blog_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_blog_association` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `blogid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blogasso_con_ix` (`contextid`),
  KEY `mdl_blogasso_blo_ix` (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Associations of blog entries with courses and module instanc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_blog_association`
--

LOCK TABLES `mdl_blog_association` WRITE;
/*!40000 ALTER TABLE `mdl_blog_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_blog_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_blog_external`
--

DROP TABLE IF EXISTS `mdl_blog_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_blog_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `url` longtext COLLATE utf8_unicode_ci NOT NULL,
  `filtertags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `failedlastsync` tinyint(1) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  `timefetched` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_blogexte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='External blog links used for RSS copying of blog entries to ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_blog_external`
--

LOCK TABLES `mdl_blog_external` WRITE;
/*!40000 ALTER TABLE `mdl_blog_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_blog_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_book`
--

DROP TABLE IF EXISTS `mdl_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_book` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `numbering` smallint(4) NOT NULL DEFAULT '0',
  `navstyle` smallint(4) NOT NULL DEFAULT '1',
  `customtitles` tinyint(2) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines book';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_book`
--

LOCK TABLES `mdl_book` WRITE;
/*!40000 ALTER TABLE `mdl_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_book_chapters`
--

DROP TABLE IF EXISTS `mdl_book_chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_book_chapters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `bookid` bigint(10) NOT NULL DEFAULT '0',
  `pagenum` bigint(10) NOT NULL DEFAULT '0',
  `subchapter` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `importsrc` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines book_chapters';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_book_chapters`
--

LOCK TABLES `mdl_book_chapters` WRITE;
/*!40000 ALTER TABLE `mdl_book_chapters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_book_chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cache_filters`
--

DROP TABLE IF EXISTS `mdl_cache_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cache_filters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `md5key` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rawtext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For keeping information about cached data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cache_filters`
--

LOCK TABLES `mdl_cache_filters` WRITE;
/*!40000 ALTER TABLE `mdl_cache_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cache_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cache_flags`
--

DROP TABLE IF EXISTS `mdl_cache_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cache_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `flagtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expiry` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_cachflag_fla_ix` (`flagtype`),
  KEY `mdl_cachflag_nam_ix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Cache of time-sensitive flags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cache_flags`
--

LOCK TABLES `mdl_cache_flags` WRITE;
/*!40000 ALTER TABLE `mdl_cache_flags` DISABLE KEYS */;
INSERT INTO `mdl_cache_flags` VALUES (1,'userpreferenceschanged','2',1490792548,'1',1490799748);
/*!40000 ALTER TABLE `mdl_cache_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_capabilities`
--

DROP TABLE IF EXISTS `mdl_capabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `captype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_capa_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=529 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines all capabilities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_capabilities`
--

LOCK TABLES `mdl_capabilities` WRITE;
/*!40000 ALTER TABLE `mdl_capabilities` DISABLE KEYS */;
INSERT INTO `mdl_capabilities` VALUES (1,'moodle/site:config','write',10,'moodle',62),(2,'moodle/site:readallmessages','read',10,'moodle',8),(3,'moodle/site:deleteanymessage','write',10,'moodle',32),(4,'moodle/site:sendmessage','write',10,'moodle',16),(5,'moodle/site:deleteownmessage','write',10,'moodle',0),(6,'moodle/site:approvecourse','write',10,'moodle',4),(7,'moodle/backup:backupcourse','write',50,'moodle',28),(8,'moodle/backup:backupsection','write',50,'moodle',28),(9,'moodle/backup:backupactivity','write',70,'moodle',28),(10,'moodle/backup:backuptargethub','write',50,'moodle',28),(11,'moodle/backup:backuptargetimport','write',50,'moodle',28),(12,'moodle/backup:downloadfile','write',50,'moodle',28),(13,'moodle/backup:configure','write',50,'moodle',28),(14,'moodle/backup:userinfo','read',50,'moodle',8),(15,'moodle/backup:anonymise','read',50,'moodle',8),(16,'moodle/restore:restorecourse','write',50,'moodle',28),(17,'moodle/restore:restoresection','write',50,'moodle',28),(18,'moodle/restore:restoreactivity','write',50,'moodle',28),(19,'moodle/restore:viewautomatedfilearea','write',50,'moodle',28),(20,'moodle/restore:restoretargethub','write',50,'moodle',28),(21,'moodle/restore:restoretargetimport','write',50,'moodle',28),(22,'moodle/restore:uploadfile','write',50,'moodle',28),(23,'moodle/restore:configure','write',50,'moodle',28),(24,'moodle/restore:rolldates','write',50,'moodle',0),(25,'moodle/restore:userinfo','write',50,'moodle',30),(26,'moodle/restore:createuser','write',10,'moodle',24),(27,'moodle/site:manageblocks','write',80,'moodle',20),(28,'moodle/site:accessallgroups','read',50,'moodle',0),(29,'moodle/site:viewfullnames','read',50,'moodle',0),(30,'moodle/site:viewuseridentity','read',50,'moodle',0),(31,'moodle/site:viewreports','read',50,'moodle',8),(32,'moodle/site:trustcontent','write',50,'moodle',4),(33,'moodle/site:uploadusers','write',10,'moodle',24),(34,'moodle/filter:manage','write',50,'moodle',0),(35,'moodle/user:create','write',10,'moodle',24),(36,'moodle/user:delete','write',10,'moodle',8),(37,'moodle/user:update','write',10,'moodle',24),(38,'moodle/user:viewdetails','read',50,'moodle',0),(39,'moodle/user:viewalldetails','read',30,'moodle',8),(40,'moodle/user:viewlastip','read',30,'moodle',8),(41,'moodle/user:viewhiddendetails','read',50,'moodle',8),(42,'moodle/user:loginas','write',50,'moodle',30),(43,'moodle/user:managesyspages','write',10,'moodle',0),(44,'moodle/user:manageblocks','write',30,'moodle',0),(45,'moodle/user:manageownblocks','write',10,'moodle',0),(46,'moodle/user:manageownfiles','write',10,'moodle',0),(47,'moodle/user:ignoreuserquota','write',10,'moodle',0),(48,'moodle/my:configsyspages','write',10,'moodle',0),(49,'moodle/role:assign','write',50,'moodle',28),(50,'moodle/role:review','read',50,'moodle',8),(51,'moodle/role:override','write',50,'moodle',28),(52,'moodle/role:safeoverride','write',50,'moodle',16),(53,'moodle/role:manage','write',10,'moodle',28),(54,'moodle/role:switchroles','read',50,'moodle',12),(55,'moodle/category:manage','write',40,'moodle',4),(56,'moodle/category:viewhiddencategories','read',40,'moodle',0),(57,'moodle/cohort:manage','write',40,'moodle',0),(58,'moodle/cohort:assign','write',40,'moodle',0),(59,'moodle/cohort:view','read',50,'moodle',0),(60,'moodle/course:create','write',40,'moodle',4),(61,'moodle/course:request','write',10,'moodle',0),(62,'moodle/course:delete','write',50,'moodle',32),(63,'moodle/course:update','write',50,'moodle',4),(64,'moodle/course:view','read',50,'moodle',0),(65,'moodle/course:enrolreview','read',50,'moodle',8),(66,'moodle/course:enrolconfig','write',50,'moodle',8),(67,'moodle/course:reviewotherusers','read',50,'moodle',0),(68,'moodle/course:bulkmessaging','write',50,'moodle',16),(69,'moodle/course:viewhiddenuserfields','read',50,'moodle',8),(70,'moodle/course:viewhiddencourses','read',50,'moodle',0),(71,'moodle/course:visibility','write',50,'moodle',0),(72,'moodle/course:managefiles','write',50,'moodle',4),(73,'moodle/course:ignorefilesizelimits','write',50,'moodle',0),(74,'moodle/course:manageactivities','write',70,'moodle',4),(75,'moodle/course:activityvisibility','write',70,'moodle',0),(76,'moodle/course:viewhiddenactivities','write',70,'moodle',0),(77,'moodle/course:viewparticipants','read',50,'moodle',0),(78,'moodle/course:changefullname','write',50,'moodle',4),(79,'moodle/course:changeshortname','write',50,'moodle',4),(80,'moodle/course:changeidnumber','write',50,'moodle',4),(81,'moodle/course:changecategory','write',50,'moodle',4),(82,'moodle/course:changesummary','write',50,'moodle',4),(83,'moodle/site:viewparticipants','read',10,'moodle',0),(84,'moodle/course:isincompletionreports','read',50,'moodle',0),(85,'moodle/course:viewscales','read',50,'moodle',0),(86,'moodle/course:managescales','write',50,'moodle',0),(87,'moodle/course:managegroups','write',50,'moodle',0),(88,'moodle/course:reset','write',50,'moodle',32),(89,'moodle/course:viewsuspendedusers','read',10,'moodle',0),(90,'moodle/course:tag','write',50,'moodle',16),(91,'moodle/blog:view','read',10,'moodle',0),(92,'moodle/blog:search','read',10,'moodle',0),(93,'moodle/blog:viewdrafts','read',10,'moodle',8),(94,'moodle/blog:create','write',10,'moodle',16),(95,'moodle/blog:manageentries','write',10,'moodle',16),(96,'moodle/blog:manageexternal','write',10,'moodle',16),(97,'moodle/blog:associatecourse','write',50,'moodle',0),(98,'moodle/blog:associatemodule','write',70,'moodle',0),(99,'moodle/calendar:manageownentries','write',50,'moodle',16),(100,'moodle/calendar:managegroupentries','write',50,'moodle',16),(101,'moodle/calendar:manageentries','write',50,'moodle',16),(102,'moodle/user:editprofile','write',30,'moodle',24),(103,'moodle/user:editownprofile','write',10,'moodle',16),(104,'moodle/user:changeownpassword','write',10,'moodle',0),(105,'moodle/user:readuserposts','read',30,'moodle',0),(106,'moodle/user:readuserblogs','read',30,'moodle',0),(107,'moodle/user:viewuseractivitiesreport','read',30,'moodle',8),(108,'moodle/user:editmessageprofile','write',30,'moodle',16),(109,'moodle/user:editownmessageprofile','write',10,'moodle',0),(110,'moodle/question:managecategory','write',50,'moodle',20),(111,'moodle/question:add','write',50,'moodle',20),(112,'moodle/question:editmine','write',50,'moodle',20),(113,'moodle/question:editall','write',50,'moodle',20),(114,'moodle/question:viewmine','read',50,'moodle',0),(115,'moodle/question:viewall','read',50,'moodle',0),(116,'moodle/question:usemine','read',50,'moodle',0),(117,'moodle/question:useall','read',50,'moodle',0),(118,'moodle/question:movemine','write',50,'moodle',0),(119,'moodle/question:moveall','write',50,'moodle',0),(120,'moodle/question:config','write',10,'moodle',2),(121,'moodle/question:flag','write',50,'moodle',0),(122,'moodle/site:doclinks','read',10,'moodle',0),(123,'moodle/course:sectionvisibility','write',50,'moodle',0),(124,'moodle/course:useremail','write',50,'moodle',0),(125,'moodle/course:viewhiddensections','write',50,'moodle',0),(126,'moodle/course:setcurrentsection','write',50,'moodle',0),(127,'moodle/course:movesections','write',50,'moodle',0),(128,'moodle/site:mnetlogintoremote','read',10,'moodle',0),(129,'moodle/grade:viewall','read',50,'moodle',8),(130,'moodle/grade:view','read',50,'moodle',0),(131,'moodle/grade:viewhidden','read',50,'moodle',8),(132,'moodle/grade:import','write',50,'moodle',12),(133,'moodle/grade:export','read',50,'moodle',8),(134,'moodle/grade:manage','write',50,'moodle',12),(135,'moodle/grade:edit','write',50,'moodle',12),(136,'moodle/grade:managegradingforms','write',50,'moodle',12),(137,'moodle/grade:sharegradingforms','write',10,'moodle',4),(138,'moodle/grade:managesharedforms','write',10,'moodle',4),(139,'moodle/grade:manageoutcomes','write',50,'moodle',0),(140,'moodle/grade:manageletters','write',50,'moodle',0),(141,'moodle/grade:hide','write',50,'moodle',0),(142,'moodle/grade:lock','write',50,'moodle',0),(143,'moodle/grade:unlock','write',50,'moodle',0),(144,'moodle/my:manageblocks','write',10,'moodle',0),(145,'moodle/notes:view','read',50,'moodle',0),(146,'moodle/notes:manage','write',50,'moodle',16),(147,'moodle/tag:manage','write',10,'moodle',16),(148,'moodle/tag:edit','write',10,'moodle',16),(149,'moodle/tag:flag','write',10,'moodle',16),(150,'moodle/tag:editblocks','write',10,'moodle',0),(151,'moodle/block:view','read',80,'moodle',0),(152,'moodle/block:edit','write',80,'moodle',20),(153,'moodle/portfolio:export','read',10,'moodle',0),(154,'moodle/comment:view','read',50,'moodle',0),(155,'moodle/comment:post','write',50,'moodle',24),(156,'moodle/comment:delete','write',50,'moodle',32),(157,'moodle/webservice:createtoken','write',10,'moodle',62),(158,'moodle/webservice:createmobiletoken','write',10,'moodle',24),(159,'moodle/rating:view','read',50,'moodle',0),(160,'moodle/rating:viewany','read',50,'moodle',8),(161,'moodle/rating:viewall','read',50,'moodle',8),(162,'moodle/rating:rate','write',50,'moodle',0),(163,'moodle/course:publish','write',10,'moodle',24),(164,'moodle/course:markcomplete','write',50,'moodle',0),(165,'moodle/community:add','write',10,'moodle',0),(166,'moodle/community:download','write',10,'moodle',0),(167,'moodle/badges:manageglobalsettings','write',10,'moodle',34),(168,'moodle/badges:viewbadges','read',50,'moodle',0),(169,'moodle/badges:manageownbadges','write',30,'moodle',0),(170,'moodle/badges:viewotherbadges','read',30,'moodle',0),(171,'moodle/badges:earnbadge','write',50,'moodle',0),(172,'moodle/badges:createbadge','write',50,'moodle',16),(173,'moodle/badges:deletebadge','write',50,'moodle',32),(174,'moodle/badges:configuredetails','write',50,'moodle',16),(175,'moodle/badges:configurecriteria','write',50,'moodle',4),(176,'moodle/badges:configuremessages','write',50,'moodle',16),(177,'moodle/badges:awardbadge','write',50,'moodle',16),(178,'moodle/badges:viewawarded','read',50,'moodle',8),(179,'moodle/site:forcelanguage','read',10,'moodle',0),(180,'mod/assign:view','read',70,'mod_assign',0),(181,'mod/assign:submit','write',70,'mod_assign',0),(182,'mod/assign:grade','write',70,'mod_assign',4),(183,'mod/assign:exportownsubmission','read',70,'mod_assign',0),(184,'mod/assign:addinstance','write',50,'mod_assign',4),(185,'mod/assign:editothersubmission','write',70,'mod_assign',41),(186,'mod/assign:grantextension','write',70,'mod_assign',0),(187,'mod/assign:revealidentities','write',70,'mod_assign',0),(188,'mod/assign:reviewgrades','write',70,'mod_assign',0),(189,'mod/assign:releasegrades','write',70,'mod_assign',0),(190,'mod/assign:managegrades','write',70,'mod_assign',0),(191,'mod/assign:manageallocations','write',70,'mod_assign',0),(192,'mod/assign:viewgrades','read',70,'mod_assign',0),(193,'mod/assign:viewblinddetails','write',70,'mod_assign',8),(194,'mod/assign:receivegradernotifications','read',70,'mod_assign',0),(195,'mod/assignment:view','read',70,'mod_assignment',0),(196,'mod/assignment:addinstance','write',50,'mod_assignment',4),(197,'mod/assignment:submit','write',70,'mod_assignment',0),(198,'mod/assignment:grade','write',70,'mod_assignment',4),(199,'mod/assignment:exportownsubmission','read',70,'mod_assignment',0),(200,'mod/book:addinstance','write',50,'mod_book',4),(201,'mod/book:read','read',70,'mod_book',0),(202,'mod/book:viewhiddenchapters','read',70,'mod_book',0),(203,'mod/book:edit','write',70,'mod_book',4),(204,'mod/chat:addinstance','write',50,'mod_chat',4),(205,'mod/chat:chat','write',70,'mod_chat',16),(206,'mod/chat:readlog','read',70,'mod_chat',0),(207,'mod/chat:deletelog','write',70,'mod_chat',0),(208,'mod/chat:exportparticipatedsession','read',70,'mod_chat',8),(209,'mod/chat:exportsession','read',70,'mod_chat',8),(210,'mod/choice:addinstance','write',50,'mod_choice',4),(211,'mod/choice:choose','write',70,'mod_choice',0),(212,'mod/choice:readresponses','read',70,'mod_choice',0),(213,'mod/choice:deleteresponses','write',70,'mod_choice',0),(214,'mod/choice:downloadresponses','read',70,'mod_choice',0),(215,'mod/data:addinstance','write',50,'mod_data',4),(216,'mod/data:viewentry','read',70,'mod_data',0),(217,'mod/data:writeentry','write',70,'mod_data',16),(218,'mod/data:comment','write',70,'mod_data',16),(219,'mod/data:rate','write',70,'mod_data',0),(220,'mod/data:viewrating','read',70,'mod_data',0),(221,'mod/data:viewanyrating','read',70,'mod_data',8),(222,'mod/data:viewallratings','read',70,'mod_data',8),(223,'mod/data:approve','write',70,'mod_data',16),(224,'mod/data:manageentries','write',70,'mod_data',16),(225,'mod/data:managecomments','write',70,'mod_data',16),(226,'mod/data:managetemplates','write',70,'mod_data',20),(227,'mod/data:viewalluserpresets','read',70,'mod_data',0),(228,'mod/data:manageuserpresets','write',70,'mod_data',20),(229,'mod/data:exportentry','read',70,'mod_data',8),(230,'mod/data:exportownentry','read',70,'mod_data',0),(231,'mod/data:exportallentries','read',70,'mod_data',8),(232,'mod/data:exportuserinfo','read',70,'mod_data',8),(233,'mod/feedback:addinstance','write',50,'mod_feedback',4),(234,'mod/feedback:view','read',70,'mod_feedback',0),(235,'mod/feedback:complete','write',70,'mod_feedback',16),(236,'mod/feedback:viewanalysepage','read',70,'mod_feedback',8),(237,'mod/feedback:deletesubmissions','write',70,'mod_feedback',0),(238,'mod/feedback:mapcourse','write',70,'mod_feedback',0),(239,'mod/feedback:edititems','write',70,'mod_feedback',20),(240,'mod/feedback:createprivatetemplate','write',70,'mod_feedback',16),(241,'mod/feedback:createpublictemplate','write',70,'mod_feedback',16),(242,'mod/feedback:deletetemplate','write',70,'mod_feedback',0),(243,'mod/feedback:viewreports','read',70,'mod_feedback',8),(244,'mod/feedback:receivemail','read',70,'mod_feedback',8),(245,'mod/folder:addinstance','write',50,'mod_folder',4),(246,'mod/folder:view','read',70,'mod_folder',0),(247,'mod/folder:managefiles','write',70,'mod_folder',16),(248,'mod/forum:addinstance','write',50,'mod_forum',4),(249,'mod/forum:viewdiscussion','read',70,'mod_forum',0),(250,'mod/forum:viewhiddentimedposts','read',70,'mod_forum',0),(251,'mod/forum:startdiscussion','write',70,'mod_forum',16),(252,'mod/forum:replypost','write',70,'mod_forum',16),(253,'mod/forum:addnews','write',70,'mod_forum',16),(254,'mod/forum:replynews','write',70,'mod_forum',16),(255,'mod/forum:viewrating','read',70,'mod_forum',0),(256,'mod/forum:viewanyrating','read',70,'mod_forum',8),(257,'mod/forum:viewallratings','read',70,'mod_forum',8),(258,'mod/forum:rate','write',70,'mod_forum',0),(259,'mod/forum:createattachment','write',70,'mod_forum',16),(260,'mod/forum:deleteownpost','read',70,'mod_forum',0),(261,'mod/forum:deleteanypost','read',70,'mod_forum',0),(262,'mod/forum:splitdiscussions','read',70,'mod_forum',0),(263,'mod/forum:movediscussions','read',70,'mod_forum',0),(264,'mod/forum:editanypost','write',70,'mod_forum',16),(265,'mod/forum:viewqandawithoutposting','read',70,'mod_forum',0),(266,'mod/forum:viewsubscribers','read',70,'mod_forum',0),(267,'mod/forum:managesubscriptions','read',70,'mod_forum',16),(268,'mod/forum:postwithoutthrottling','write',70,'mod_forum',16),(269,'mod/forum:exportdiscussion','read',70,'mod_forum',8),(270,'mod/forum:exportpost','read',70,'mod_forum',8),(271,'mod/forum:exportownpost','read',70,'mod_forum',8),(272,'mod/forum:addquestion','write',70,'mod_forum',16),(273,'mod/forum:allowforcesubscribe','read',70,'mod_forum',0),(274,'mod/forum:canposttomygroups','write',70,'mod_forum',0),(275,'mod/glossary:addinstance','write',50,'mod_glossary',4),(276,'mod/glossary:view','read',70,'mod_glossary',0),(277,'mod/glossary:write','write',70,'mod_glossary',16),(278,'mod/glossary:manageentries','write',70,'mod_glossary',16),(279,'mod/glossary:managecategories','write',70,'mod_glossary',16),(280,'mod/glossary:comment','write',70,'mod_glossary',16),(281,'mod/glossary:managecomments','write',70,'mod_glossary',16),(282,'mod/glossary:import','write',70,'mod_glossary',16),(283,'mod/glossary:export','read',70,'mod_glossary',0),(284,'mod/glossary:approve','write',70,'mod_glossary',16),(285,'mod/glossary:rate','write',70,'mod_glossary',0),(286,'mod/glossary:viewrating','read',70,'mod_glossary',0),(287,'mod/glossary:viewanyrating','read',70,'mod_glossary',8),(288,'mod/glossary:viewallratings','read',70,'mod_glossary',8),(289,'mod/glossary:exportentry','read',70,'mod_glossary',8),(290,'mod/glossary:exportownentry','read',70,'mod_glossary',0),(291,'mod/imscp:view','read',70,'mod_imscp',0),(292,'mod/imscp:addinstance','write',50,'mod_imscp',4),(293,'mod/label:addinstance','write',50,'mod_label',4),(294,'mod/lesson:addinstance','write',50,'mod_lesson',4),(295,'mod/lesson:edit','write',70,'mod_lesson',4),(296,'mod/lesson:grade','write',70,'mod_lesson',20),(297,'mod/lesson:viewreports','read',70,'mod_lesson',8),(298,'mod/lesson:manage','write',70,'mod_lesson',0),(299,'mod/lesson:manageoverrides','write',70,'mod_lesson',0),(300,'mod/lti:view','read',70,'mod_lti',0),(301,'mod/lti:addinstance','write',50,'mod_lti',4),(302,'mod/lti:manage','write',70,'mod_lti',8),(303,'mod/lti:addcoursetool','write',50,'mod_lti',0),(304,'mod/lti:requesttooladd','write',50,'mod_lti',0),(305,'mod/page:view','read',70,'mod_page',0),(306,'mod/page:addinstance','write',50,'mod_page',4),(307,'mod/quiz:view','read',70,'mod_quiz',0),(308,'mod/quiz:addinstance','write',50,'mod_quiz',4),(309,'mod/quiz:attempt','write',70,'mod_quiz',16),(310,'mod/quiz:reviewmyattempts','read',70,'mod_quiz',0),(311,'mod/quiz:manage','write',70,'mod_quiz',16),(312,'mod/quiz:manageoverrides','write',70,'mod_quiz',0),(313,'mod/quiz:preview','write',70,'mod_quiz',0),(314,'mod/quiz:grade','write',70,'mod_quiz',20),(315,'mod/quiz:regrade','write',70,'mod_quiz',16),(316,'mod/quiz:viewreports','read',70,'mod_quiz',8),(317,'mod/quiz:deleteattempts','write',70,'mod_quiz',32),(318,'mod/quiz:ignoretimelimits','read',70,'mod_quiz',0),(319,'mod/quiz:emailconfirmsubmission','read',70,'mod_quiz',0),(320,'mod/quiz:emailnotifysubmission','read',70,'mod_quiz',0),(321,'mod/quiz:emailwarnoverdue','read',70,'mod_quiz',0),(322,'mod/resource:view','read',70,'mod_resource',0),(323,'mod/resource:addinstance','write',50,'mod_resource',4),(324,'mod/scorm:addinstance','write',50,'mod_scorm',4),(325,'mod/scorm:viewreport','read',70,'mod_scorm',0),(326,'mod/scorm:skipview','read',70,'mod_scorm',0),(327,'mod/scorm:savetrack','write',70,'mod_scorm',0),(328,'mod/scorm:viewscores','read',70,'mod_scorm',0),(329,'mod/scorm:deleteresponses','write',70,'mod_scorm',0),(330,'mod/scorm:deleteownresponses','write',70,'mod_scorm',0),(331,'mod/survey:addinstance','write',50,'mod_survey',4),(332,'mod/survey:participate','read',70,'mod_survey',0),(333,'mod/survey:readresponses','read',70,'mod_survey',0),(334,'mod/survey:download','read',70,'mod_survey',0),(335,'mod/url:view','read',70,'mod_url',0),(336,'mod/url:addinstance','write',50,'mod_url',4),(337,'mod/wiki:addinstance','write',50,'mod_wiki',4),(338,'mod/wiki:viewpage','read',70,'mod_wiki',0),(339,'mod/wiki:editpage','write',70,'mod_wiki',16),(340,'mod/wiki:createpage','write',70,'mod_wiki',16),(341,'mod/wiki:viewcomment','read',70,'mod_wiki',0),(342,'mod/wiki:editcomment','write',70,'mod_wiki',16),(343,'mod/wiki:managecomment','write',70,'mod_wiki',0),(344,'mod/wiki:managefiles','write',70,'mod_wiki',0),(345,'mod/wiki:overridelock','write',70,'mod_wiki',0),(346,'mod/wiki:managewiki','write',70,'mod_wiki',0),(347,'mod/workshop:view','read',70,'mod_workshop',0),(348,'mod/workshop:addinstance','write',50,'mod_workshop',4),(349,'mod/workshop:switchphase','write',70,'mod_workshop',0),(350,'mod/workshop:editdimensions','write',70,'mod_workshop',4),(351,'mod/workshop:submit','write',70,'mod_workshop',0),(352,'mod/workshop:peerassess','write',70,'mod_workshop',0),(353,'mod/workshop:manageexamples','write',70,'mod_workshop',0),(354,'mod/workshop:allocate','write',70,'mod_workshop',0),(355,'mod/workshop:publishsubmissions','write',70,'mod_workshop',0),(356,'mod/workshop:viewauthornames','read',70,'mod_workshop',0),(357,'mod/workshop:viewreviewernames','read',70,'mod_workshop',0),(358,'mod/workshop:viewallsubmissions','read',70,'mod_workshop',0),(359,'mod/workshop:viewpublishedsubmissions','read',70,'mod_workshop',0),(360,'mod/workshop:viewauthorpublished','read',70,'mod_workshop',0),(361,'mod/workshop:viewallassessments','read',70,'mod_workshop',0),(362,'mod/workshop:overridegrades','write',70,'mod_workshop',0),(363,'mod/workshop:ignoredeadlines','write',70,'mod_workshop',0),(364,'enrol/category:synchronised','write',10,'enrol_category',0),(365,'enrol/category:config','write',50,'enrol_category',0),(366,'enrol/cohort:config','write',50,'enrol_cohort',0),(367,'enrol/cohort:unenrol','write',50,'enrol_cohort',0),(368,'enrol/database:unenrol','write',50,'enrol_database',0),(369,'enrol/database:config','write',50,'enrol_database',0),(370,'enrol/flatfile:manage','write',50,'enrol_flatfile',0),(371,'enrol/flatfile:unenrol','write',50,'enrol_flatfile',0),(372,'enrol/guest:config','write',50,'enrol_guest',0),(373,'enrol/imsenterprise:config','write',50,'enrol_imsenterprise',0),(374,'enrol/ldap:manage','write',50,'enrol_ldap',0),(375,'enrol/manual:config','write',50,'enrol_manual',0),(376,'enrol/manual:enrol','write',50,'enrol_manual',0),(377,'enrol/manual:manage','write',50,'enrol_manual',0),(378,'enrol/manual:unenrol','write',50,'enrol_manual',0),(379,'enrol/manual:unenrolself','write',50,'enrol_manual',0),(380,'enrol/meta:config','write',50,'enrol_meta',0),(381,'enrol/meta:selectaslinked','read',50,'enrol_meta',0),(382,'enrol/meta:unenrol','write',50,'enrol_meta',0),(383,'enrol/mnet:config','write',50,'enrol_mnet',0),(384,'enrol/paypal:config','write',50,'enrol_paypal',0),(385,'enrol/paypal:manage','write',50,'enrol_paypal',0),(386,'enrol/paypal:unenrol','write',50,'enrol_paypal',0),(387,'enrol/paypal:unenrolself','write',50,'enrol_paypal',0),(388,'enrol/self:config','write',50,'enrol_self',0),(389,'enrol/self:manage','write',50,'enrol_self',0),(390,'enrol/self:holdkey','write',50,'enrol_self',0),(391,'enrol/self:unenrolself','write',50,'enrol_self',0),(392,'enrol/self:unenrol','write',50,'enrol_self',0),(393,'message/airnotifier:managedevice','write',10,'message_airnotifier',0),(394,'block/activity_modules:addinstance','write',80,'block_activity_modules',20),(395,'block/activity_results:addinstance','write',80,'block_activity_results',20),(396,'block/admin_bookmarks:myaddinstance','write',10,'block_admin_bookmarks',0),(397,'block/admin_bookmarks:addinstance','write',80,'block_admin_bookmarks',20),(398,'block/badges:addinstance','read',80,'block_badges',0),(399,'block/badges:myaddinstance','read',10,'block_badges',8),(400,'block/blog_menu:addinstance','write',80,'block_blog_menu',20),(401,'block/blog_recent:addinstance','write',80,'block_blog_recent',20),(402,'block/blog_tags:addinstance','write',80,'block_blog_tags',20),(403,'block/calendar_month:myaddinstance','write',10,'block_calendar_month',0),(404,'block/calendar_month:addinstance','write',80,'block_calendar_month',20),(405,'block/calendar_upcoming:myaddinstance','write',10,'block_calendar_upcoming',0),(406,'block/calendar_upcoming:addinstance','write',80,'block_calendar_upcoming',20),(407,'block/comments:myaddinstance','write',10,'block_comments',0),(408,'block/comments:addinstance','write',80,'block_comments',20),(409,'block/community:myaddinstance','write',10,'block_community',0),(410,'block/community:addinstance','write',80,'block_community',20),(411,'block/completionstatus:addinstance','write',80,'block_completionstatus',20),(412,'block/course_list:myaddinstance','write',10,'block_course_list',0),(413,'block/course_list:addinstance','write',80,'block_course_list',20),(414,'block/course_overview:myaddinstance','write',10,'block_course_overview',0),(415,'block/course_overview:addinstance','write',80,'block_course_overview',20),(416,'block/course_summary:addinstance','write',80,'block_course_summary',20),(417,'block/feedback:addinstance','write',80,'block_feedback',20),(418,'block/glossary_random:myaddinstance','write',10,'block_glossary_random',0),(419,'block/glossary_random:addinstance','write',80,'block_glossary_random',20),(420,'block/html:myaddinstance','write',10,'block_html',0),(421,'block/html:addinstance','write',80,'block_html',20),(422,'block/login:addinstance','write',80,'block_login',20),(423,'block/mentees:myaddinstance','write',10,'block_mentees',0),(424,'block/mentees:addinstance','write',80,'block_mentees',20),(425,'block/messages:myaddinstance','write',10,'block_messages',0),(426,'block/messages:addinstance','write',80,'block_messages',20),(427,'block/mnet_hosts:myaddinstance','write',10,'block_mnet_hosts',0),(428,'block/mnet_hosts:addinstance','write',80,'block_mnet_hosts',20),(429,'block/myprofile:myaddinstance','write',10,'block_myprofile',0),(430,'block/myprofile:addinstance','write',80,'block_myprofile',20),(431,'block/navigation:myaddinstance','write',10,'block_navigation',0),(432,'block/navigation:addinstance','write',80,'block_navigation',20),(433,'block/news_items:myaddinstance','write',10,'block_news_items',0),(434,'block/news_items:addinstance','write',80,'block_news_items',20),(435,'block/online_users:myaddinstance','write',10,'block_online_users',0),(436,'block/online_users:addinstance','write',80,'block_online_users',20),(437,'block/online_users:viewlist','read',80,'block_online_users',0),(438,'block/participants:addinstance','write',80,'block_participants',20),(439,'block/private_files:myaddinstance','write',10,'block_private_files',0),(440,'block/private_files:addinstance','write',80,'block_private_files',20),(441,'block/quiz_results:addinstance','write',80,'block_quiz_results',20),(442,'block/recent_activity:addinstance','write',80,'block_recent_activity',20),(443,'block/recent_activity:viewaddupdatemodule','read',50,'block_recent_activity',0),(444,'block/recent_activity:viewdeletemodule','read',50,'block_recent_activity',0),(445,'block/rss_client:myaddinstance','write',10,'block_rss_client',0),(446,'block/rss_client:addinstance','write',80,'block_rss_client',20),(447,'block/rss_client:manageownfeeds','write',80,'block_rss_client',0),(448,'block/rss_client:manageanyfeeds','write',80,'block_rss_client',16),(449,'block/search_forums:addinstance','write',80,'block_search_forums',20),(450,'block/section_links:addinstance','write',80,'block_section_links',20),(451,'block/selfcompletion:addinstance','write',80,'block_selfcompletion',20),(452,'block/settings:myaddinstance','write',10,'block_settings',0),(453,'block/settings:addinstance','write',80,'block_settings',20),(454,'block/site_main_menu:addinstance','write',80,'block_site_main_menu',20),(455,'block/social_activities:addinstance','write',80,'block_social_activities',20),(456,'block/tag_flickr:addinstance','write',80,'block_tag_flickr',20),(457,'block/tag_youtube:addinstance','write',80,'block_tag_youtube',20),(458,'block/tags:myaddinstance','write',10,'block_tags',0),(459,'block/tags:addinstance','write',80,'block_tags',20),(460,'report/completion:view','read',50,'report_completion',8),(461,'report/courseoverview:view','read',10,'report_courseoverview',8),(462,'report/log:view','read',50,'report_log',8),(463,'report/log:viewtoday','read',50,'report_log',8),(464,'report/loglive:view','read',50,'report_loglive',8),(465,'report/outline:view','read',50,'report_outline',8),(466,'report/participation:view','read',50,'report_participation',8),(467,'report/performance:view','read',10,'report_performance',2),(468,'report/progress:view','read',50,'report_progress',8),(469,'report/questioninstances:view','read',10,'report_questioninstances',0),(470,'report/security:view','read',10,'report_security',2),(471,'report/stats:view','read',50,'report_stats',8),(472,'report/usersessions:manageownsessions','write',30,'report_usersessions',0),(473,'gradeexport/ods:view','read',50,'gradeexport_ods',8),(474,'gradeexport/ods:publish','read',50,'gradeexport_ods',8),(475,'gradeexport/txt:view','read',50,'gradeexport_txt',8),(476,'gradeexport/txt:publish','read',50,'gradeexport_txt',8),(477,'gradeexport/xls:view','read',50,'gradeexport_xls',8),(478,'gradeexport/xls:publish','read',50,'gradeexport_xls',8),(479,'gradeexport/xml:view','read',50,'gradeexport_xml',8),(480,'gradeexport/xml:publish','read',50,'gradeexport_xml',8),(481,'gradeimport/csv:view','write',50,'gradeimport_csv',0),(482,'gradeimport/direct:view','write',50,'gradeimport_direct',0),(483,'gradeimport/xml:view','write',50,'gradeimport_xml',0),(484,'gradeimport/xml:publish','write',50,'gradeimport_xml',0),(485,'gradereport/grader:view','read',50,'gradereport_grader',8),(486,'gradereport/history:view','read',50,'gradereport_history',8),(487,'gradereport/outcomes:view','read',50,'gradereport_outcomes',8),(488,'gradereport/overview:view','read',50,'gradereport_overview',8),(489,'gradereport/singleview:view','read',50,'gradereport_singleview',8),(490,'gradereport/user:view','read',50,'gradereport_user',8),(491,'webservice/amf:use','read',50,'webservice_amf',0),(492,'webservice/rest:use','read',50,'webservice_rest',0),(493,'webservice/soap:use','read',50,'webservice_soap',0),(494,'webservice/xmlrpc:use','read',50,'webservice_xmlrpc',0),(495,'repository/alfresco:view','read',70,'repository_alfresco',0),(496,'repository/areafiles:view','read',70,'repository_areafiles',0),(497,'repository/boxnet:view','read',70,'repository_boxnet',0),(498,'repository/coursefiles:view','read',70,'repository_coursefiles',0),(499,'repository/dropbox:view','read',70,'repository_dropbox',0),(500,'repository/equella:view','read',70,'repository_equella',0),(501,'repository/filesystem:view','read',70,'repository_filesystem',0),(502,'repository/flickr:view','read',70,'repository_flickr',0),(503,'repository/flickr_public:view','read',70,'repository_flickr_public',0),(504,'repository/googledocs:view','read',70,'repository_googledocs',0),(505,'repository/local:view','read',70,'repository_local',0),(506,'repository/merlot:view','read',70,'repository_merlot',0),(507,'repository/picasa:view','read',70,'repository_picasa',0),(508,'repository/recent:view','read',70,'repository_recent',0),(509,'repository/s3:view','read',70,'repository_s3',0),(510,'repository/skydrive:view','read',70,'repository_skydrive',0),(511,'repository/upload:view','read',70,'repository_upload',0),(512,'repository/url:view','read',70,'repository_url',0),(513,'repository/user:view','read',70,'repository_user',0),(514,'repository/webdav:view','read',70,'repository_webdav',0),(515,'repository/wikimedia:view','read',70,'repository_wikimedia',0),(516,'repository/youtube:view','read',70,'repository_youtube',0),(517,'tool/customlang:view','read',10,'tool_customlang',2),(518,'tool/customlang:edit','write',10,'tool_customlang',6),(519,'tool/monitor:subscribe','read',50,'tool_monitor',8),(520,'tool/monitor:managerules','write',50,'tool_monitor',4),(521,'tool/monitor:managetool','write',10,'tool_monitor',4),(522,'tool/uploaduser:uploaduserpictures','write',10,'tool_uploaduser',16),(523,'booktool/exportimscp:export','read',70,'booktool_exportimscp',0),(524,'booktool/importhtml:import','write',70,'booktool_importhtml',4),(525,'booktool/print:print','read',70,'booktool_print',0),(526,'quiz/grading:viewstudentnames','read',70,'quiz_grading',0),(527,'quiz/grading:viewidnumber','read',70,'quiz_grading',0),(528,'quiz/statistics:view','read',70,'quiz_statistics',0);
/*!40000 ALTER TABLE `mdl_capabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat`
--

DROP TABLE IF EXISTS `mdl_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chat_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each of these is a chat room';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat`
--

LOCK TABLES `mdl_chat` WRITE;
/*!40000 ALTER TABLE `mdl_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat_messages`
--

DROP TABLE IF EXISTS `mdl_chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat_messages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmess_use_ix` (`userid`),
  KEY `mdl_chatmess_gro_ix` (`groupid`),
  KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmess_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all the actual chat messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat_messages`
--

LOCK TABLES `mdl_chat_messages` WRITE;
/*!40000 ALTER TABLE `mdl_chat_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat_messages_current`
--

DROP TABLE IF EXISTS `mdl_chat_messages_current`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat_messages_current` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmesscurr_use_ix` (`userid`),
  KEY `mdl_chatmesscurr_gro_ix` (`groupid`),
  KEY `mdl_chatmesscurr_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmesscurr_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores current session';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat_messages_current`
--

LOCK TABLES `mdl_chat_messages_current` WRITE;
/*!40000 ALTER TABLE `mdl_chat_messages_current` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_messages_current` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat_users`
--

DROP TABLE IF EXISTS `mdl_chat_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstping` bigint(10) NOT NULL DEFAULT '0',
  `lastping` bigint(10) NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_chatuser_use_ix` (`userid`),
  KEY `mdl_chatuser_las_ix` (`lastping`),
  KEY `mdl_chatuser_gro_ix` (`groupid`),
  KEY `mdl_chatuser_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of which users are in which chat rooms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat_users`
--

LOCK TABLES `mdl_chat_users` WRITE;
/*!40000 ALTER TABLE `mdl_chat_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_choice`
--

DROP TABLE IF EXISTS `mdl_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_choice` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `publish` tinyint(2) NOT NULL DEFAULT '0',
  `showresults` tinyint(2) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) NOT NULL DEFAULT '0',
  `allowmultiple` tinyint(2) NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) NOT NULL DEFAULT '0',
  `includeinactive` tinyint(2) NOT NULL DEFAULT '1',
  `limitanswers` tinyint(2) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `showpreview` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Available choices are stored here';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_choice`
--

LOCK TABLES `mdl_choice` WRITE;
/*!40000 ALTER TABLE `mdl_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_choice_answers`
--

DROP TABLE IF EXISTS `mdl_choice_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_choice_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `optionid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiansw_use_ix` (`userid`),
  KEY `mdl_choiansw_cho_ix` (`choiceid`),
  KEY `mdl_choiansw_opt_ix` (`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='choices performed by users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_choice_answers`
--

LOCK TABLES `mdl_choice_answers` WRITE;
/*!40000 ALTER TABLE `mdl_choice_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_choice_options`
--

DROP TABLE IF EXISTS `mdl_choice_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_choice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `text` longtext COLLATE utf8_unicode_ci,
  `maxanswers` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiopti_cho_ix` (`choiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='available options to choice';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_choice_options`
--

LOCK TABLES `mdl_choice_options` WRITE;
/*!40000 ALTER TABLE `mdl_choice_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cohort`
--

DROP TABLE IF EXISTS `mdl_cohort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cohort` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coho_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record represents one cohort (aka site-wide group).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cohort`
--

LOCK TABLES `mdl_cohort` WRITE;
/*!40000 ALTER TABLE `mdl_cohort` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cohort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cohort_members`
--

DROP TABLE IF EXISTS `mdl_cohort_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cohort_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`),
  KEY `mdl_cohomemb_coh_ix` (`cohortid`),
  KEY `mdl_cohomemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a user to a cohort.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cohort_members`
--

LOCK TABLES `mdl_cohort_members` WRITE;
/*!40000 ALTER TABLE `mdl_cohort_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cohort_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_comments`
--

DROP TABLE IF EXISTS `mdl_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commentarea` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle comments module';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_comments`
--

LOCK TABLES `mdl_comments` WRITE;
/*!40000 ALTER TABLE `mdl_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_config`
--

DROP TABLE IF EXISTS `mdl_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_conf_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=474 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Moodle configuration variables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_config`
--

LOCK TABLES `mdl_config` WRITE;
/*!40000 ALTER TABLE `mdl_config` DISABLE KEYS */;
INSERT INTO `mdl_config` VALUES (2,'rolesactive','1'),(3,'auth','email'),(4,'auth_pop3mailbox','INBOX'),(5,'enrol_plugins_enabled','manual,guest,self,cohort'),(6,'theme','adaptable'),(7,'filter_multilang_converted','1'),(8,'siteidentifier','ZfsUmIPw9HFwPhjggC4j2EbuTLRXFLuMlocalhost'),(9,'backup_version','2008111700'),(10,'backup_release','2.0 dev'),(11,'mnet_dispatcher_mode','off'),(12,'sessiontimeout','7200'),(13,'stringfilters',''),(14,'filterall','0'),(15,'texteditors','atto,tinymce,textarea'),(16,'upgrade_minmaxgradestepignored','1'),(17,'upgrade_extracreditweightsstepignored','1'),(18,'upgrade_calculatedgradeitemsignored','1'),(19,'upgrade_letterboundarycourses','1'),(20,'mnet_localhost_id','1'),(21,'mnet_all_hosts_id','2'),(22,'siteguest','1'),(23,'siteadmins','2'),(24,'themerev','1490794502'),(25,'jsrev','1490792026'),(26,'gdversion','2'),(27,'licenses','unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),(28,'version','2015111609'),(29,'enableoutcomes','0'),(30,'usecomments','1'),(31,'usetags','1'),(32,'enablenotes','1'),(33,'enableportfolios','0'),(34,'enablewebservices','0'),(35,'messaging','1'),(36,'messaginghidereadnotifications','0'),(37,'messagingdeletereadnotificationsdelay','604800'),(38,'messagingallowemailoverride','0'),(39,'enablestats','0'),(40,'enablerssfeeds','0'),(41,'enableblogs','1'),(42,'enablecompletion','0'),(43,'completiondefault','1'),(44,'enableavailability','0'),(45,'enableplagiarism','0'),(46,'enablebadges','1'),(47,'defaultpreference_maildisplay','2'),(48,'defaultpreference_mailformat','1'),(49,'defaultpreference_maildigest','0'),(50,'defaultpreference_autosubscribe','1'),(51,'defaultpreference_trackforums','0'),(52,'autologinguests','0'),(53,'hiddenuserfields',''),(54,'showuseridentity','email'),(55,'fullnamedisplay','language'),(56,'alternativefullnameformat','language'),(57,'maxusersperpage','100'),(58,'enablegravatar','0'),(59,'gravatardefaulturl','mm'),(60,'enablecourserequests','0'),(61,'defaultrequestcategory','1'),(62,'requestcategoryselection','0'),(63,'courserequestnotify',''),(64,'grade_profilereport','user'),(65,'grade_aggregationposition','1'),(66,'grade_includescalesinaggregation','1'),(67,'grade_hiddenasdate','0'),(68,'gradepublishing','0'),(69,'grade_export_displaytype','1'),(70,'grade_export_decimalpoints','2'),(71,'grade_navmethod','0'),(72,'grade_export_userprofilefields','firstname,lastname,idnumber,institution,department,email'),(73,'grade_export_customprofilefields',''),(74,'recovergradesdefault','0'),(75,'gradeexport',''),(76,'unlimitedgrades','0'),(77,'grade_report_showmin','1'),(78,'gradepointmax','100'),(79,'gradepointdefault','100'),(80,'grade_minmaxtouse','1'),(81,'grade_mygrades_report','overview'),(82,'gradereport_mygradeurl',''),(83,'grade_hideforcedsettings','1'),(84,'grade_aggregation','13'),(85,'grade_aggregation_flag','0'),(86,'grade_aggregations_visible','13'),(87,'grade_aggregateonlygraded','1'),(88,'grade_aggregateonlygraded_flag','2'),(89,'grade_aggregateoutcomes','0'),(90,'grade_aggregateoutcomes_flag','2'),(91,'grade_keephigh','0'),(92,'grade_keephigh_flag','3'),(93,'grade_droplow','0'),(94,'grade_droplow_flag','2'),(95,'grade_overridecat','1'),(96,'grade_displaytype','1'),(97,'grade_decimalpoints','2'),(98,'grade_item_advanced','iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),(99,'grade_report_studentsperpage','100'),(100,'grade_report_showonlyactiveenrol','1'),(101,'grade_report_quickgrading','1'),(102,'grade_report_showquickfeedback','0'),(103,'grade_report_meanselection','1'),(104,'grade_report_enableajax','0'),(105,'grade_report_showcalculations','1'),(106,'grade_report_showeyecons','0'),(107,'grade_report_showaverages','1'),(108,'grade_report_showlocks','0'),(109,'grade_report_showranges','0'),(110,'grade_report_showanalysisicon','1'),(111,'grade_report_showuserimage','1'),(112,'grade_report_showactivityicons','1'),(113,'grade_report_shownumberofgrades','0'),(114,'grade_report_averagesdisplaytype','inherit'),(115,'grade_report_rangesdisplaytype','inherit'),(116,'grade_report_averagesdecimalpoints','inherit'),(117,'grade_report_rangesdecimalpoints','inherit'),(118,'grade_report_historyperpage','50'),(119,'grade_report_overview_showrank','0'),(120,'grade_report_overview_showtotalsifcontainhidden','0'),(121,'grade_report_user_showrank','0'),(122,'grade_report_user_showpercentage','1'),(123,'grade_report_user_showgrade','1'),(124,'grade_report_user_showfeedback','1'),(125,'grade_report_user_showrange','1'),(126,'grade_report_user_showweight','1'),(127,'grade_report_user_showaverage','0'),(128,'grade_report_user_showlettergrade','0'),(129,'grade_report_user_rangedecimals','0'),(130,'grade_report_user_showhiddenitems','1'),(131,'grade_report_user_showtotalsifcontainhidden','0'),(132,'grade_report_user_showcontributiontocoursetotal','1'),(133,'badges_defaultissuername',''),(134,'badges_defaultissuercontact',''),(135,'badges_badgesalt','badges1490725893'),(136,'badges_allowexternalbackpack','1'),(137,'badges_allowcoursebadges','1'),(139,'forcetimezone','99'),(140,'country','0'),(141,'defaultcity',''),(142,'geoipfile','/var/www/moodledata/geoip/GeoLiteCity.dat'),(143,'googlemapkey3',''),(144,'allcountrycodes',''),(145,'autolang','1'),(146,'lang','es_ve'),(147,'langmenu','1'),(148,'langlist',''),(149,'langrev','1490792027'),(150,'langcache','1'),(151,'langstringcache','1'),(152,'locale',''),(153,'latinexcelexport','0'),(154,'filteruploadedfiles','0'),(155,'filtermatchoneperpage','0'),(156,'filtermatchonepertext','0'),(158,'authloginviaemail','0'),(159,'allowaccountssameemail','0'),(160,'authpreventaccountcreation','0'),(161,'loginpageautofocus','0'),(162,'guestloginbutton','1'),(163,'limitconcurrentlogins','0'),(164,'alternateloginurl',''),(165,'forgottenpasswordurl',''),(166,'auth_instructions',''),(167,'allowemailaddresses',''),(168,'denyemailaddresses',''),(169,'verifychangedemail','1'),(170,'recaptchapublickey',''),(171,'recaptchaprivatekey',''),(172,'sitedefaultlicense','allrightsreserved'),(173,'requiremodintro','0'),(174,'portfolio_moderate_filesize_threshold','1048576'),(175,'portfolio_high_filesize_threshold','5242880'),(176,'portfolio_moderate_db_threshold','20'),(177,'portfolio_high_db_threshold','50'),(178,'repositorycacheexpire','120'),(179,'repositorygetfiletimeout','30'),(180,'repositorysyncfiletimeout','1'),(181,'repositorysyncimagetimeout','3'),(182,'repositoryallowexternallinks','1'),(183,'legacyfilesinnewcourses','0'),(184,'legacyfilesaddallowed','1'),(185,'mobilecssurl',''),(186,'enablewsdocumentation','0'),(187,'allowbeforeblock','0'),(188,'allowedip',''),(189,'blockedip',''),(190,'protectusernames','1'),(191,'forcelogin','0'),(192,'forceloginforprofiles','1'),(193,'forceloginforprofileimage','0'),(194,'opentogoogle','0'),(195,'maxbytes','0'),(196,'userquota','104857600'),(197,'allowobjectembed','0'),(198,'enabletrusttext','0'),(199,'maxeditingtime','1800'),(200,'extendedusernamechars','0'),(201,'sitepolicy',''),(202,'sitepolicyguest',''),(203,'keeptagnamecase','1'),(204,'profilesforenrolledusersonly','1'),(205,'cronclionly','1'),(206,'cronremotepassword',''),(207,'lockoutthreshold','0'),(208,'lockoutwindow','1800'),(209,'lockoutduration','1800'),(210,'passwordpolicy','1'),(211,'minpasswordlength','8'),(212,'minpassworddigits','1'),(213,'minpasswordlower','1'),(214,'minpasswordupper','1'),(215,'minpasswordnonalphanum','1'),(216,'maxconsecutiveidentchars','0'),(217,'passwordreuselimit','0'),(218,'pwresettime','1800'),(219,'passwordchangelogout','0'),(220,'groupenrolmentkeypolicy','1'),(221,'disableuserimages','0'),(222,'emailchangeconfirmation','1'),(223,'rememberusername','2'),(224,'strictformsrequired','0'),(225,'loginhttps','0'),(226,'cookiesecure','1'),(227,'cookiehttponly','0'),(228,'allowframembedding','0'),(229,'loginpasswordautocomplete','0'),(230,'displayloginfailures','0'),(231,'notifyloginfailures',''),(232,'notifyloginthreshold','10'),(233,'runclamonupload','0'),(234,'pathtoclam',''),(235,'quarantinedir',''),(236,'clamfailureonupload','donothing'),(237,'themelist',''),(238,'themedesignermode','1'),(239,'allowuserthemes','0'),(240,'allowcoursethemes','1'),(241,'allowcategorythemes','1'),(242,'allowthemechangeonurl','1'),(243,'allowuserblockhiding','1'),(244,'allowblockstodock','1'),(245,'custommenuitems',''),(246,'customusermenuitems','grades,grades|/grade/report/mygrades.php|grades\r\nmessages,message|/message/index.php|message\r\npreferences,moodle|/user/preferences.php|preferences'),(247,'enabledevicedetection','1'),(248,'devicedetectregex','[]'),(249,'calendartype','gregorian'),(250,'calendar_adminseesall','0'),(251,'calendar_site_timeformat','0'),(252,'calendar_startwday','1'),(253,'calendar_weekend','65'),(254,'calendar_lookahead','21'),(255,'calendar_maxevents','10'),(256,'enablecalendarexport','1'),(257,'calendar_customexport','1'),(258,'calendar_exportlookahead','365'),(259,'calendar_exportlookback','5'),(260,'calendar_exportsalt','UoFkgAPKADQg5rh1i6prBEPySsLvUmRqgSlVj3BH0v1utzi2HrPGKnMtHqln'),(261,'calendar_showicalsource','1'),(262,'useblogassociations','1'),(263,'bloglevel','4'),(264,'useexternalblogs','1'),(265,'externalblogcrontime','86400'),(266,'maxexternalblogsperuser','1'),(267,'blogusecomments','1'),(268,'blogshowcommentscount','1'),(269,'defaulthomepage','1'),(270,'allowguestmymoodle','1'),(271,'navshowfullcoursenames','0'),(272,'navshowcategories','1'),(273,'navshowmycoursecategories','0'),(274,'navshowallcourses','0'),(275,'navexpandmycourses','1'),(276,'navsortmycoursessort','sortorder'),(277,'navcourselimit','20'),(278,'usesitenameforsitepages','0'),(279,'linkadmincategories','0'),(280,'linkcoursesections','0'),(281,'navshowfrontpagemods','1'),(282,'navadduserpostslinks','1'),(283,'formatstringstriptags','1'),(284,'emoticons','[{\"text\":\":-)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":-D\",\"imagename\":\"s\\/biggrin\",\"imagecomponent\":\"core\",\"altidentifier\":\"biggrin\",\"altcomponent\":\"core_pix\"},{\"text\":\";-)\",\"imagename\":\"s\\/wink\",\"imagecomponent\":\"core\",\"altidentifier\":\"wink\",\"altcomponent\":\"core_pix\"},{\"text\":\":-\\/\",\"imagename\":\"s\\/mixed\",\"imagecomponent\":\"core\",\"altidentifier\":\"mixed\",\"altcomponent\":\"core_pix\"},{\"text\":\"V-.\",\"imagename\":\"s\\/thoughtful\",\"imagecomponent\":\"core\",\"altidentifier\":\"thoughtful\",\"altcomponent\":\"core_pix\"},{\"text\":\":-P\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\":-p\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\"B-)\",\"imagename\":\"s\\/cool\",\"imagecomponent\":\"core\",\"altidentifier\":\"cool\",\"altcomponent\":\"core_pix\"},{\"text\":\"^-)\",\"imagename\":\"s\\/approve\",\"imagecomponent\":\"core\",\"altidentifier\":\"approve\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-)\",\"imagename\":\"s\\/wideeyes\",\"imagecomponent\":\"core\",\"altidentifier\":\"wideeyes\",\"altcomponent\":\"core_pix\"},{\"text\":\":o)\",\"imagename\":\"s\\/clown\",\"imagecomponent\":\"core\",\"altidentifier\":\"clown\",\"altcomponent\":\"core_pix\"},{\"text\":\":-(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\":(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-.\",\"imagename\":\"s\\/shy\",\"imagecomponent\":\"core\",\"altidentifier\":\"shy\",\"altcomponent\":\"core_pix\"},{\"text\":\":-I\",\"imagename\":\"s\\/blush\",\"imagecomponent\":\"core\",\"altidentifier\":\"blush\",\"altcomponent\":\"core_pix\"},{\"text\":\":-X\",\"imagename\":\"s\\/kiss\",\"imagecomponent\":\"core\",\"altidentifier\":\"kiss\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-o\",\"imagename\":\"s\\/surprise\",\"imagecomponent\":\"core\",\"altidentifier\":\"surprise\",\"altcomponent\":\"core_pix\"},{\"text\":\"P-|\",\"imagename\":\"s\\/blackeye\",\"imagecomponent\":\"core\",\"altidentifier\":\"blackeye\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-[\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"(grr)\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"xx-P\",\"imagename\":\"s\\/dead\",\"imagecomponent\":\"core\",\"altidentifier\":\"dead\",\"altcomponent\":\"core_pix\"},{\"text\":\"|-.\",\"imagename\":\"s\\/sleepy\",\"imagecomponent\":\"core\",\"altidentifier\":\"sleepy\",\"altcomponent\":\"core_pix\"},{\"text\":\"}-]\",\"imagename\":\"s\\/evil\",\"imagecomponent\":\"core\",\"altidentifier\":\"evil\",\"altcomponent\":\"core_pix\"},{\"text\":\"(h)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(heart)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(y)\",\"imagename\":\"s\\/yes\",\"imagecomponent\":\"core\",\"altidentifier\":\"yes\",\"altcomponent\":\"core\"},{\"text\":\"(n)\",\"imagename\":\"s\\/no\",\"imagecomponent\":\"core\",\"altidentifier\":\"no\",\"altcomponent\":\"core\"},{\"text\":\"(martin)\",\"imagename\":\"s\\/martin\",\"imagecomponent\":\"core\",\"altidentifier\":\"martin\",\"altcomponent\":\"core_pix\"},{\"text\":\"( )\",\"imagename\":\"s\\/egg\",\"imagecomponent\":\"core\",\"altidentifier\":\"egg\",\"altcomponent\":\"core_pix\"}]'),(285,'core_media_enable_youtube','1'),(286,'core_media_enable_vimeo','0'),(287,'core_media_enable_mp3','1'),(288,'core_media_enable_flv','1'),(289,'core_media_enable_swf','1'),(290,'core_media_enable_html5audio','1'),(291,'core_media_enable_html5video','1'),(292,'core_media_enable_qt','1'),(293,'core_media_enable_wmp','1'),(294,'core_media_enable_rm','1'),(295,'docroot','http://docs.moodle.org'),(296,'doclang',''),(297,'doctonewwindow','0'),(298,'courselistshortnames','0'),(299,'coursesperpage','20'),(300,'courseswithsummarieslimit','10'),(301,'courseoverviewfileslimit','1'),(302,'courseoverviewfilesext','.jpg,.gif,.png'),(303,'useexternalyui','0'),(304,'yuicomboloading','1'),(305,'cachejs','1'),(306,'modchooserdefault','1'),(307,'modeditingmenu','1'),(308,'blockeditingmenu','1'),(309,'additionalhtmlhead',''),(310,'additionalhtmltopofbody',''),(311,'additionalhtmlfooter',''),(312,'pathtodu',''),(313,'aspellpath',''),(314,'pathtodot',''),(315,'pathtogs','/usr/bin/gs'),(316,'supportname','Admin Usuario'),(317,'supportemail',''),(318,'supportpage',''),(319,'dbsessions','0'),(320,'sessioncookie',''),(321,'sessioncookiepath',''),(322,'sessioncookiedomain',''),(323,'statsfirstrun','none'),(324,'statsmaxruntime','0'),(325,'statsruntimedays','31'),(326,'statsuserthreshold','0'),(327,'slasharguments','1'),(328,'getremoteaddrconf','0'),(329,'proxyhost',''),(330,'proxyport','0'),(331,'proxytype','HTTP'),(332,'proxyuser',''),(333,'proxypassword',''),(334,'proxybypass','localhost, 127.0.0.1'),(335,'maintenance_enabled','0'),(336,'maintenance_message',''),(337,'deleteunconfirmed','168'),(338,'deleteincompleteusers','0'),(339,'disablegradehistory','0'),(340,'gradehistorylifetime','0'),(341,'tempdatafoldercleanup','168'),(342,'extramemorylimit','512M'),(343,'maxtimelimit','0'),(344,'curlcache','120'),(345,'curltimeoutkbitrate','56'),(346,'updateautocheck','1'),(347,'updateminmaturity','200'),(348,'updatenotifybuilds','0'),(349,'enablesafebrowserintegration','0'),(350,'dndallowtextandlinks','0'),(351,'enablecssoptimiser','0'),(352,'debug','0'),(353,'debugdisplay','0'),(354,'debugsmtp','0'),(355,'perfdebug','7'),(356,'debugstringids','0'),(357,'debugvalidators','0'),(358,'debugpageinfo','0'),(359,'profilingenabled','0'),(360,'profilingincluded',''),(361,'profilingexcluded',''),(362,'profilingautofrec','0'),(363,'profilingallowme','0'),(364,'profilingallowall','0'),(365,'profilinglifetime','1440'),(366,'profilingimportprefix','(I)'),(367,'release','3.0.9 (Build: 20170313)'),(368,'branch','30'),(369,'localcachedirpurged','1490792027'),(370,'scheduledtaskreset','1490792027'),(371,'allversionshash','e852970390d01d33692a829ab8636135b8d42b93'),(373,'notloggedinroleid','6'),(374,'guestroleid','6'),(375,'defaultuserroleid','7'),(376,'creatornewroleid','3'),(377,'restorernewroleid','3'),(378,'gradebookroles','5'),(379,'block_course_list_adminview','all'),(380,'block_course_list_hideallcourseslink','0'),(381,'block_html_allowcssclasses','0'),(382,'block_online_users_timetosee','5'),(383,'block_rss_client_num_entries','5'),(384,'block_rss_client_timeout','30'),(385,'filter_censor_badwords',''),(386,'filter_multilang_force_old','0'),(387,'logguests','1'),(388,'loglifetime','0'),(389,'airnotifierurl','https://messages.moodle.net'),(390,'airnotifierport','443'),(391,'airnotifiermobileappname','com.moodle.moodlemobile'),(392,'airnotifierappname','commoodlemoodlemobile'),(393,'airnotifieraccesskey',''),(394,'smtphosts',''),(395,'smtpsecure',''),(396,'smtpauthtype','LOGIN'),(397,'smtpuser',''),(398,'smtppass',''),(399,'smtpmaxbulk','1'),(400,'emailonlyfromnoreplyaddress','0'),(401,'sitemailcharset','0'),(402,'allowusermailcharset','0'),(403,'allowattachments','1'),(404,'mailnewline','LF'),(405,'jabberhost',''),(406,'jabberserver',''),(407,'jabberusername',''),(408,'jabberpassword',''),(409,'jabberport','5222'),(410,'chat_method','ajax'),(411,'chat_refresh_userlist','10'),(412,'chat_old_ping','35'),(413,'chat_refresh_room','5'),(414,'chat_normal_updatemode','jsupdate'),(415,'chat_serverhost','localhost'),(416,'chat_serverip','127.0.0.1'),(417,'chat_serverport','9111'),(418,'chat_servermax','100'),(419,'data_enablerssfeeds','0'),(420,'feedback_allowfullanonymous','0'),(421,'forum_displaymode','3'),(422,'forum_replytouser','1'),(423,'forum_shortpost','300'),(424,'forum_longpost','600'),(425,'forum_manydiscussions','100'),(426,'forum_maxbytes','512000'),(427,'forum_maxattachments','9'),(428,'forum_trackingtype','1'),(429,'forum_trackreadposts','1'),(430,'forum_allowforcedreadtracking','0'),(431,'forum_oldpostdays','14'),(432,'forum_usermarksread','0'),(433,'forum_cleanreadtime','2'),(434,'digestmailtime','17'),(435,'forum_enablerssfeeds','0'),(436,'forum_enabletimedposts','0'),(437,'glossary_entbypage','10'),(438,'glossary_dupentries','0'),(439,'glossary_allowcomments','0'),(440,'glossary_linkbydefault','1'),(441,'glossary_defaultapproval','1'),(442,'glossary_enablerssfeeds','0'),(443,'glossary_linkentries','0'),(444,'glossary_casesensitive','0'),(445,'glossary_fullmatch','0'),(446,'lesson_slideshowwidth','640'),(447,'lesson_slideshowheight','480'),(448,'lesson_slideshowbgcolor','#FFFFFF'),(449,'lesson_mediawidth','640'),(450,'lesson_mediaheight','480'),(451,'lesson_mediaclose','0'),(452,'lesson_maxanswers','4'),(453,'lesson_defaultnextpage','0'),(454,'enablemobilewebservice','0'),(455,'profileroles','5,4,3'),(456,'coursecontact','3'),(457,'frontpage','6'),(458,'frontpageloggedin','6'),(459,'maxcategorydepth','2'),(460,'frontpagecourselimit','200'),(461,'commentsperpage','15'),(462,'defaultfrontpageroleid','8'),(463,'messageinbound_enabled','0'),(464,'messageinbound_mailbox',''),(465,'messageinbound_domain',''),(466,'messageinbound_host',''),(467,'messageinbound_hostssl','ssl'),(468,'messageinbound_hostuser',''),(469,'messageinbound_hostpass',''),(470,'timezone','America/La_Paz'),(471,'registerauth',''),(472,'noreplyaddress','noreply@localhost.com');
/*!40000 ALTER TABLE `mdl_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_config_log`
--

DROP TABLE IF EXISTS `mdl_config_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_config_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  `oldvalue` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_conflog_tim_ix` (`timemodified`),
  KEY `mdl_conflog_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=1267 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Changes done in server configuration through admin UI';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_config_log`
--

LOCK TABLES `mdl_config_log` WRITE;
/*!40000 ALTER TABLE `mdl_config_log` DISABLE KEYS */;
INSERT INTO `mdl_config_log` VALUES (1,0,1490725930,NULL,'enableoutcomes','0',NULL),(2,0,1490725931,NULL,'usecomments','1',NULL),(3,0,1490725931,NULL,'usetags','1',NULL),(4,0,1490725931,NULL,'enablenotes','1',NULL),(5,0,1490725931,NULL,'enableportfolios','0',NULL),(6,0,1490725931,NULL,'enablewebservices','0',NULL),(7,0,1490725931,NULL,'messaging','1',NULL),(8,0,1490725932,NULL,'messaginghidereadnotifications','0',NULL),(9,0,1490725932,NULL,'messagingdeletereadnotificationsdelay','604800',NULL),(10,0,1490725932,NULL,'messagingallowemailoverride','0',NULL),(11,0,1490725932,NULL,'enablestats','0',NULL),(12,0,1490725932,NULL,'enablerssfeeds','0',NULL),(13,0,1490725933,NULL,'enableblogs','1',NULL),(14,0,1490725933,NULL,'enablecompletion','0',NULL),(15,0,1490725933,NULL,'completiondefault','1',NULL),(16,0,1490725934,NULL,'enableavailability','0',NULL),(17,0,1490725934,NULL,'enableplagiarism','0',NULL),(18,0,1490725934,NULL,'enablebadges','1',NULL),(19,0,1490725934,NULL,'defaultpreference_maildisplay','2',NULL),(20,0,1490725935,NULL,'defaultpreference_mailformat','1',NULL),(21,0,1490725935,NULL,'defaultpreference_maildigest','0',NULL),(22,0,1490725935,NULL,'defaultpreference_autosubscribe','1',NULL),(23,0,1490725935,NULL,'defaultpreference_trackforums','0',NULL),(24,0,1490725935,NULL,'autologinguests','0',NULL),(25,0,1490725936,NULL,'hiddenuserfields','',NULL),(26,0,1490725936,NULL,'showuseridentity','email',NULL),(27,0,1490725936,NULL,'fullnamedisplay','language',NULL),(28,0,1490725936,NULL,'alternativefullnameformat','language',NULL),(29,0,1490725936,NULL,'maxusersperpage','100',NULL),(30,0,1490725936,NULL,'enablegravatar','0',NULL),(31,0,1490725937,NULL,'gravatardefaulturl','mm',NULL),(32,0,1490725937,'moodlecourse','visible','1',NULL),(33,0,1490725937,'moodlecourse','format','weeks',NULL),(34,0,1490725938,'moodlecourse','maxsections','52',NULL),(35,0,1490725938,'moodlecourse','numsections','10',NULL),(36,0,1490725938,'moodlecourse','hiddensections','0',NULL),(37,0,1490725938,'moodlecourse','coursedisplay','0',NULL),(38,0,1490725938,'moodlecourse','lang','',NULL),(39,0,1490725939,'moodlecourse','newsitems','5',NULL),(40,0,1490725939,'moodlecourse','showgrades','1',NULL),(41,0,1490725939,'moodlecourse','showreports','0',NULL),(42,0,1490725939,'moodlecourse','maxbytes','0',NULL),(43,0,1490725939,'moodlecourse','enablecompletion','0',NULL),(44,0,1490725940,'moodlecourse','groupmode','0',NULL),(45,0,1490725940,'moodlecourse','groupmodeforce','0',NULL),(46,0,1490725940,NULL,'enablecourserequests','0',NULL),(47,0,1490725940,NULL,'defaultrequestcategory','1',NULL),(48,0,1490725940,NULL,'requestcategoryselection','0',NULL),(49,0,1490725940,NULL,'courserequestnotify','',NULL),(50,0,1490725941,'backup','loglifetime','30',NULL),(51,0,1490725941,'backup','backup_general_users','1',NULL),(52,0,1490725941,'backup','backup_general_users_locked','',NULL),(53,0,1490725941,'backup','backup_general_anonymize','0',NULL),(54,0,1490725941,'backup','backup_general_anonymize_locked','',NULL),(55,0,1490725941,'backup','backup_general_role_assignments','1',NULL),(56,0,1490725941,'backup','backup_general_role_assignments_locked','',NULL),(57,0,1490725941,'backup','backup_general_activities','1',NULL),(58,0,1490725941,'backup','backup_general_activities_locked','',NULL),(59,0,1490725941,'backup','backup_general_blocks','1',NULL),(60,0,1490725942,'backup','backup_general_blocks_locked','',NULL),(61,0,1490725942,'backup','backup_general_filters','1',NULL),(62,0,1490725942,'backup','backup_general_filters_locked','',NULL),(63,0,1490725942,'backup','backup_general_comments','1',NULL),(64,0,1490725942,'backup','backup_general_comments_locked','',NULL),(65,0,1490725942,'backup','backup_general_badges','1',NULL),(66,0,1490725942,'backup','backup_general_badges_locked','',NULL),(67,0,1490725942,'backup','backup_general_userscompletion','1',NULL),(68,0,1490725942,'backup','backup_general_userscompletion_locked','',NULL),(69,0,1490725942,'backup','backup_general_logs','0',NULL),(70,0,1490725942,'backup','backup_general_logs_locked','',NULL),(71,0,1490725942,'backup','backup_general_histories','0',NULL),(72,0,1490725942,'backup','backup_general_histories_locked','',NULL),(73,0,1490725942,'backup','backup_general_questionbank','1',NULL),(74,0,1490725942,'backup','backup_general_questionbank_locked','',NULL),(75,0,1490725943,'backup','backup_general_groups','1',NULL),(76,0,1490725943,'backup','backup_general_groups_locked','',NULL),(77,0,1490725943,'backup','import_general_maxresults','10',NULL),(78,0,1490725943,'backup','import_general_duplicate_admin_allowed','0',NULL),(79,0,1490725943,'backup','backup_auto_active','0',NULL),(80,0,1490725943,'backup','backup_auto_weekdays','0000000',NULL),(81,0,1490725943,'backup','backup_auto_hour','0',NULL),(82,0,1490725943,'backup','backup_auto_minute','0',NULL),(83,0,1490725943,'backup','backup_auto_storage','0',NULL),(84,0,1490725943,'backup','backup_auto_destination','',NULL),(85,0,1490725943,'backup','backup_auto_max_kept','1',NULL),(86,0,1490725943,'backup','backup_auto_delete_days','0',NULL),(87,0,1490725943,'backup','backup_auto_min_kept','0',NULL),(88,0,1490725943,'backup','backup_shortname','0',NULL),(89,0,1490725943,'backup','backup_auto_skip_hidden','1',NULL),(90,0,1490725943,'backup','backup_auto_skip_modif_days','30',NULL),(91,0,1490725943,'backup','backup_auto_skip_modif_prev','0',NULL),(92,0,1490725944,'backup','backup_auto_users','1',NULL),(93,0,1490725944,'backup','backup_auto_role_assignments','1',NULL),(94,0,1490725944,'backup','backup_auto_activities','1',NULL),(95,0,1490725944,'backup','backup_auto_blocks','1',NULL),(96,0,1490725944,'backup','backup_auto_filters','1',NULL),(97,0,1490725944,'backup','backup_auto_comments','1',NULL),(98,0,1490725944,'backup','backup_auto_badges','1',NULL),(99,0,1490725944,'backup','backup_auto_userscompletion','1',NULL),(100,0,1490725944,'backup','backup_auto_logs','0',NULL),(101,0,1490725944,'backup','backup_auto_histories','0',NULL),(102,0,1490725944,'backup','backup_auto_questionbank','1',NULL),(103,0,1490725944,'backup','backup_auto_groups','1',NULL),(104,0,1490725944,NULL,'grade_profilereport','user',NULL),(105,0,1490725945,NULL,'grade_aggregationposition','1',NULL),(106,0,1490725945,NULL,'grade_includescalesinaggregation','1',NULL),(107,0,1490725945,NULL,'grade_hiddenasdate','0',NULL),(108,0,1490725945,NULL,'gradepublishing','0',NULL),(109,0,1490725945,NULL,'grade_export_displaytype','1',NULL),(110,0,1490725945,NULL,'grade_export_decimalpoints','2',NULL),(111,0,1490725945,NULL,'grade_navmethod','0',NULL),(112,0,1490725945,NULL,'grade_export_userprofilefields','firstname,lastname,idnumber,institution,department,email',NULL),(113,0,1490725945,NULL,'grade_export_customprofilefields','',NULL),(114,0,1490725945,NULL,'recovergradesdefault','0',NULL),(115,0,1490725945,NULL,'gradeexport','',NULL),(116,0,1490725946,NULL,'unlimitedgrades','0',NULL),(117,0,1490725946,NULL,'grade_report_showmin','1',NULL),(118,0,1490725946,NULL,'gradepointmax','100',NULL),(119,0,1490725946,NULL,'gradepointdefault','100',NULL),(120,0,1490725946,NULL,'grade_minmaxtouse','1',NULL),(121,0,1490725946,NULL,'grade_mygrades_report','overview',NULL),(122,0,1490725946,NULL,'gradereport_mygradeurl','',NULL),(123,0,1490725946,NULL,'grade_hideforcedsettings','1',NULL),(124,0,1490725946,NULL,'grade_aggregation','13',NULL),(125,0,1490725946,NULL,'grade_aggregation_flag','0',NULL),(126,0,1490725946,NULL,'grade_aggregations_visible','13',NULL),(127,0,1490725946,NULL,'grade_aggregateonlygraded','1',NULL),(128,0,1490725946,NULL,'grade_aggregateonlygraded_flag','2',NULL),(129,0,1490725947,NULL,'grade_aggregateoutcomes','0',NULL),(130,0,1490725947,NULL,'grade_aggregateoutcomes_flag','2',NULL),(131,0,1490725947,NULL,'grade_keephigh','0',NULL),(132,0,1490725947,NULL,'grade_keephigh_flag','3',NULL),(133,0,1490725947,NULL,'grade_droplow','0',NULL),(134,0,1490725947,NULL,'grade_droplow_flag','2',NULL),(135,0,1490725947,NULL,'grade_overridecat','1',NULL),(136,0,1490725947,NULL,'grade_displaytype','1',NULL),(137,0,1490725947,NULL,'grade_decimalpoints','2',NULL),(138,0,1490725947,NULL,'grade_item_advanced','iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime',NULL),(139,0,1490725948,NULL,'grade_report_studentsperpage','100',NULL),(140,0,1490725948,NULL,'grade_report_showonlyactiveenrol','1',NULL),(141,0,1490725948,NULL,'grade_report_quickgrading','1',NULL),(142,0,1490725948,NULL,'grade_report_showquickfeedback','0',NULL),(143,0,1490725948,NULL,'grade_report_meanselection','1',NULL),(144,0,1490725948,NULL,'grade_report_enableajax','0',NULL),(145,0,1490725948,NULL,'grade_report_showcalculations','1',NULL),(146,0,1490725948,NULL,'grade_report_showeyecons','0',NULL),(147,0,1490725948,NULL,'grade_report_showaverages','1',NULL),(148,0,1490725948,NULL,'grade_report_showlocks','0',NULL),(149,0,1490725948,NULL,'grade_report_showranges','0',NULL),(150,0,1490725948,NULL,'grade_report_showanalysisicon','1',NULL),(151,0,1490725948,NULL,'grade_report_showuserimage','1',NULL),(152,0,1490725948,NULL,'grade_report_showactivityicons','1',NULL),(153,0,1490725949,NULL,'grade_report_shownumberofgrades','0',NULL),(154,0,1490725949,NULL,'grade_report_averagesdisplaytype','inherit',NULL),(155,0,1490725949,NULL,'grade_report_rangesdisplaytype','inherit',NULL),(156,0,1490725949,NULL,'grade_report_averagesdecimalpoints','inherit',NULL),(157,0,1490725949,NULL,'grade_report_rangesdecimalpoints','inherit',NULL),(158,0,1490725949,NULL,'grade_report_historyperpage','50',NULL),(159,0,1490725949,NULL,'grade_report_overview_showrank','0',NULL),(160,0,1490725949,NULL,'grade_report_overview_showtotalsifcontainhidden','0',NULL),(161,0,1490725949,NULL,'grade_report_user_showrank','0',NULL),(162,0,1490725949,NULL,'grade_report_user_showpercentage','1',NULL),(163,0,1490725949,NULL,'grade_report_user_showgrade','1',NULL),(164,0,1490725949,NULL,'grade_report_user_showfeedback','1',NULL),(165,0,1490725949,NULL,'grade_report_user_showrange','1',NULL),(166,0,1490725949,NULL,'grade_report_user_showweight','1',NULL),(167,0,1490725949,NULL,'grade_report_user_showaverage','0',NULL),(168,0,1490725949,NULL,'grade_report_user_showlettergrade','0',NULL),(169,0,1490725949,NULL,'grade_report_user_rangedecimals','0',NULL),(170,0,1490725950,NULL,'grade_report_user_showhiddenitems','1',NULL),(171,0,1490725950,NULL,'grade_report_user_showtotalsifcontainhidden','0',NULL),(172,0,1490725950,NULL,'grade_report_user_showcontributiontocoursetotal','1',NULL),(173,0,1490725950,NULL,'badges_defaultissuername','',NULL),(174,0,1490725950,NULL,'badges_defaultissuercontact','',NULL),(175,0,1490725950,NULL,'badges_badgesalt','badges1490725893',NULL),(176,0,1490725950,NULL,'badges_allowexternalbackpack','1',NULL),(177,0,1490725950,NULL,'badges_allowcoursebadges','1',NULL),(178,0,1490725951,NULL,'timezone','America/La_Paz',NULL),(179,0,1490725952,NULL,'forcetimezone','99',NULL),(180,0,1490725952,NULL,'country','0',NULL),(181,0,1490725952,NULL,'defaultcity','',NULL),(182,0,1490725952,NULL,'geoipfile','/var/www/moodledata/geoip/GeoLiteCity.dat',NULL),(183,0,1490725953,NULL,'googlemapkey3','',NULL),(184,0,1490725953,NULL,'allcountrycodes','',NULL),(185,0,1490725953,NULL,'autolang','1',NULL),(186,0,1490725953,NULL,'lang','es_ve',NULL),(187,0,1490725953,NULL,'langmenu','1',NULL),(188,0,1490725953,NULL,'langlist','',NULL),(189,0,1490725953,NULL,'langcache','1',NULL),(190,0,1490725953,NULL,'langstringcache','1',NULL),(191,0,1490725953,NULL,'locale','',NULL),(192,0,1490725953,NULL,'latinexcelexport','0',NULL),(193,0,1490725953,'cachestore_memcache','testservers','',NULL),(194,0,1490725953,'cachestore_memcached','testservers','',NULL),(195,0,1490725953,'cachestore_mongodb','testserver','',NULL),(196,0,1490725954,NULL,'filteruploadedfiles','0',NULL),(197,0,1490725954,NULL,'filtermatchoneperpage','0',NULL),(198,0,1490725954,NULL,'filtermatchonepertext','0',NULL),(199,0,1490725954,NULL,'registerauth','',NULL),(200,0,1490725954,NULL,'authloginviaemail','0',NULL),(201,0,1490725954,NULL,'allowaccountssameemail','0',NULL),(202,0,1490725954,NULL,'authpreventaccountcreation','0',NULL),(203,0,1490725954,NULL,'loginpageautofocus','0',NULL),(204,0,1490725954,NULL,'guestloginbutton','1',NULL),(205,0,1490725954,NULL,'limitconcurrentlogins','0',NULL),(206,0,1490725954,NULL,'alternateloginurl','',NULL),(207,0,1490725954,NULL,'forgottenpasswordurl','',NULL),(208,0,1490725954,NULL,'auth_instructions','',NULL),(209,0,1490725954,NULL,'allowemailaddresses','',NULL),(210,0,1490725955,NULL,'denyemailaddresses','',NULL),(211,0,1490725955,NULL,'verifychangedemail','1',NULL),(212,0,1490725955,NULL,'recaptchapublickey','',NULL),(213,0,1490725955,NULL,'recaptchaprivatekey','',NULL),(214,0,1490725955,NULL,'sitedefaultlicense','allrightsreserved',NULL),(215,0,1490725955,NULL,'requiremodintro','0',NULL),(216,0,1490725955,NULL,'portfolio_moderate_filesize_threshold','1048576',NULL),(217,0,1490725955,NULL,'portfolio_high_filesize_threshold','5242880',NULL),(218,0,1490725955,NULL,'portfolio_moderate_db_threshold','20',NULL),(219,0,1490725955,NULL,'portfolio_high_db_threshold','50',NULL),(220,0,1490725956,NULL,'repositorycacheexpire','120',NULL),(221,0,1490725956,NULL,'repositorygetfiletimeout','30',NULL),(222,0,1490725956,NULL,'repositorysyncfiletimeout','1',NULL),(223,0,1490725956,NULL,'repositorysyncimagetimeout','3',NULL),(224,0,1490725956,NULL,'repositoryallowexternallinks','1',NULL),(225,0,1490725956,NULL,'legacyfilesinnewcourses','0',NULL),(226,0,1490725956,NULL,'legacyfilesaddallowed','1',NULL),(227,0,1490725956,NULL,'mobilecssurl','',NULL),(228,0,1490725956,NULL,'enablewsdocumentation','0',NULL),(229,0,1490725956,'question_preview','behaviour','deferredfeedback',NULL),(230,0,1490725956,'question_preview','correctness','1',NULL),(231,0,1490725956,'question_preview','marks','2',NULL),(232,0,1490725957,'question_preview','markdp','2',NULL),(233,0,1490725957,'question_preview','feedback','1',NULL),(234,0,1490725957,'question_preview','generalfeedback','1',NULL),(235,0,1490725957,'question_preview','rightanswer','1',NULL),(236,0,1490725957,'question_preview','history','0',NULL),(237,0,1490725957,NULL,'allowbeforeblock','0',NULL),(238,0,1490725957,NULL,'allowedip','',NULL),(239,0,1490725957,NULL,'blockedip','',NULL),(240,0,1490725957,NULL,'protectusernames','1',NULL),(241,0,1490725957,NULL,'forcelogin','0',NULL),(242,0,1490725957,NULL,'forceloginforprofiles','1',NULL),(243,0,1490725957,NULL,'forceloginforprofileimage','0',NULL),(244,0,1490725957,NULL,'opentogoogle','0',NULL),(245,0,1490725957,NULL,'maxbytes','0',NULL),(246,0,1490725958,NULL,'userquota','104857600',NULL),(247,0,1490725958,NULL,'allowobjectembed','0',NULL),(248,0,1490725958,NULL,'enabletrusttext','0',NULL),(249,0,1490725958,NULL,'maxeditingtime','1800',NULL),(250,0,1490725958,NULL,'extendedusernamechars','0',NULL),(251,0,1490725958,NULL,'sitepolicy','',NULL),(252,0,1490725958,NULL,'sitepolicyguest','',NULL),(253,0,1490725958,NULL,'keeptagnamecase','1',NULL),(254,0,1490725958,NULL,'profilesforenrolledusersonly','1',NULL),(255,0,1490725958,NULL,'cronclionly','1',NULL),(256,0,1490725959,NULL,'cronremotepassword','',NULL),(257,0,1490725959,NULL,'lockoutthreshold','0',NULL),(258,0,1490725959,NULL,'lockoutwindow','1800',NULL),(259,0,1490725959,NULL,'lockoutduration','1800',NULL),(260,0,1490725959,NULL,'passwordpolicy','1',NULL),(261,0,1490725959,NULL,'minpasswordlength','8',NULL),(262,0,1490725959,NULL,'minpassworddigits','1',NULL),(263,0,1490725959,NULL,'minpasswordlower','1',NULL),(264,0,1490725959,NULL,'minpasswordupper','1',NULL),(265,0,1490725959,NULL,'minpasswordnonalphanum','1',NULL),(266,0,1490725959,NULL,'maxconsecutiveidentchars','0',NULL),(267,0,1490725959,NULL,'passwordreuselimit','0',NULL),(268,0,1490725959,NULL,'pwresettime','1800',NULL),(269,0,1490725959,NULL,'passwordchangelogout','0',NULL),(270,0,1490725960,NULL,'groupenrolmentkeypolicy','1',NULL),(271,0,1490725960,NULL,'disableuserimages','0',NULL),(272,0,1490725960,NULL,'emailchangeconfirmation','1',NULL),(273,0,1490725960,NULL,'rememberusername','2',NULL),(274,0,1490725960,NULL,'strictformsrequired','0',NULL),(275,0,1490725960,NULL,'loginhttps','0',NULL),(276,0,1490725960,NULL,'cookiesecure','1',NULL),(277,0,1490725960,NULL,'cookiehttponly','0',NULL),(278,0,1490725960,NULL,'allowframembedding','0',NULL),(279,0,1490725960,NULL,'loginpasswordautocomplete','0',NULL),(280,0,1490725960,NULL,'displayloginfailures','0',NULL),(281,0,1490725960,NULL,'notifyloginfailures','',NULL),(282,0,1490725960,NULL,'notifyloginthreshold','10',NULL),(283,0,1490725960,NULL,'runclamonupload','0',NULL),(284,0,1490725961,NULL,'pathtoclam','',NULL),(285,0,1490725961,NULL,'quarantinedir','',NULL),(286,0,1490725961,NULL,'clamfailureonupload','donothing',NULL),(287,0,1490725961,NULL,'themelist','',NULL),(288,0,1490725961,NULL,'themedesignermode','0',NULL),(289,0,1490725961,NULL,'allowuserthemes','0',NULL),(290,0,1490725961,NULL,'allowcoursethemes','0',NULL),(291,0,1490725961,NULL,'allowcategorythemes','0',NULL),(292,0,1490725961,NULL,'allowthemechangeonurl','0',NULL),(293,0,1490725961,NULL,'allowuserblockhiding','1',NULL),(294,0,1490725961,NULL,'allowblockstodock','1',NULL),(295,0,1490725961,NULL,'custommenuitems','',NULL),(296,0,1490725961,NULL,'customusermenuitems','grades,grades|/grade/report/mygrades.php|grades\nmessages,message|/message/index.php|message\npreferences,moodle|/user/preferences.php|preferences',NULL),(297,0,1490725961,NULL,'enabledevicedetection','1',NULL),(298,0,1490725961,NULL,'devicedetectregex','[]',NULL),(299,0,1490725961,'theme_clean','invert','0',NULL),(300,0,1490725961,'theme_clean','logo','',NULL),(301,0,1490725962,'theme_clean','customcss','',NULL),(302,0,1490725962,'theme_clean','footnote','',NULL),(303,0,1490725962,'theme_more','textcolor','#333366',NULL),(304,0,1490725962,'theme_more','linkcolor','#FF6500',NULL),(305,0,1490725962,'theme_more','bodybackground','',NULL),(306,0,1490725962,'theme_more','backgroundimage','',NULL),(307,0,1490725962,'theme_more','backgroundrepeat','repeat',NULL),(308,0,1490725962,'theme_more','backgroundposition','0',NULL),(309,0,1490725962,'theme_more','backgroundfixed','0',NULL),(310,0,1490725962,'theme_more','contentbackground','#FFFFFF',NULL),(311,0,1490725962,'theme_more','secondarybackground','#FFFFFF',NULL),(312,0,1490725962,'theme_more','invert','1',NULL),(313,0,1490725962,'theme_more','logo','',NULL),(314,0,1490725963,'theme_more','customcss','',NULL),(315,0,1490725963,'theme_more','footnote','',NULL),(316,0,1490725963,NULL,'calendartype','gregorian',NULL),(317,0,1490725963,NULL,'calendar_adminseesall','0',NULL),(318,0,1490725963,NULL,'calendar_site_timeformat','0',NULL),(319,0,1490725963,NULL,'calendar_startwday','1',NULL),(320,0,1490725963,NULL,'calendar_weekend','65',NULL),(321,0,1490725963,NULL,'calendar_lookahead','21',NULL),(322,0,1490725963,NULL,'calendar_maxevents','10',NULL),(323,0,1490725963,NULL,'enablecalendarexport','1',NULL),(324,0,1490725964,NULL,'calendar_customexport','1',NULL),(325,0,1490725964,NULL,'calendar_exportlookahead','365',NULL),(326,0,1490725964,NULL,'calendar_exportlookback','5',NULL),(327,0,1490725964,NULL,'calendar_exportsalt','UoFkgAPKADQg5rh1i6prBEPySsLvUmRqgSlVj3BH0v1utzi2HrPGKnMtHqln',NULL),(328,0,1490725964,NULL,'calendar_showicalsource','1',NULL),(329,0,1490725964,NULL,'useblogassociations','1',NULL),(330,0,1490725964,NULL,'bloglevel','4',NULL),(331,0,1490725964,NULL,'useexternalblogs','1',NULL),(332,0,1490725964,NULL,'externalblogcrontime','86400',NULL),(333,0,1490725964,NULL,'maxexternalblogsperuser','1',NULL),(334,0,1490725964,NULL,'blogusecomments','1',NULL),(335,0,1490725964,NULL,'blogshowcommentscount','1',NULL),(336,0,1490725965,NULL,'defaulthomepage','1',NULL),(337,0,1490725965,NULL,'allowguestmymoodle','1',NULL),(338,0,1490725965,NULL,'navshowfullcoursenames','0',NULL),(339,0,1490725965,NULL,'navshowcategories','1',NULL),(340,0,1490725965,NULL,'navshowmycoursecategories','0',NULL),(341,0,1490725965,NULL,'navshowallcourses','0',NULL),(342,0,1490725965,NULL,'navexpandmycourses','1',NULL),(343,0,1490725965,NULL,'navsortmycoursessort','sortorder',NULL),(344,0,1490725965,NULL,'navcourselimit','20',NULL),(345,0,1490725965,NULL,'usesitenameforsitepages','0',NULL),(346,0,1490725965,NULL,'linkadmincategories','0',NULL),(347,0,1490725966,NULL,'linkcoursesections','0',NULL),(348,0,1490725966,NULL,'navshowfrontpagemods','1',NULL),(349,0,1490725966,NULL,'navadduserpostslinks','1',NULL),(350,0,1490725966,NULL,'formatstringstriptags','1',NULL),(351,0,1490725966,NULL,'emoticons','[{\"text\":\":-)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":-D\",\"imagename\":\"s\\/biggrin\",\"imagecomponent\":\"core\",\"altidentifier\":\"biggrin\",\"altcomponent\":\"core_pix\"},{\"text\":\";-)\",\"imagename\":\"s\\/wink\",\"imagecomponent\":\"core\",\"altidentifier\":\"wink\",\"altcomponent\":\"core_pix\"},{\"text\":\":-\\/\",\"imagename\":\"s\\/mixed\",\"imagecomponent\":\"core\",\"altidentifier\":\"mixed\",\"altcomponent\":\"core_pix\"},{\"text\":\"V-.\",\"imagename\":\"s\\/thoughtful\",\"imagecomponent\":\"core\",\"altidentifier\":\"thoughtful\",\"altcomponent\":\"core_pix\"},{\"text\":\":-P\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\":-p\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\"B-)\",\"imagename\":\"s\\/cool\",\"imagecomponent\":\"core\",\"altidentifier\":\"cool\",\"altcomponent\":\"core_pix\"},{\"text\":\"^-)\",\"imagename\":\"s\\/approve\",\"imagecomponent\":\"core\",\"altidentifier\":\"approve\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-)\",\"imagename\":\"s\\/wideeyes\",\"imagecomponent\":\"core\",\"altidentifier\":\"wideeyes\",\"altcomponent\":\"core_pix\"},{\"text\":\":o)\",\"imagename\":\"s\\/clown\",\"imagecomponent\":\"core\",\"altidentifier\":\"clown\",\"altcomponent\":\"core_pix\"},{\"text\":\":-(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\":(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-.\",\"imagename\":\"s\\/shy\",\"imagecomponent\":\"core\",\"altidentifier\":\"shy\",\"altcomponent\":\"core_pix\"},{\"text\":\":-I\",\"imagename\":\"s\\/blush\",\"imagecomponent\":\"core\",\"altidentifier\":\"blush\",\"altcomponent\":\"core_pix\"},{\"text\":\":-X\",\"imagename\":\"s\\/kiss\",\"imagecomponent\":\"core\",\"altidentifier\":\"kiss\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-o\",\"imagename\":\"s\\/surprise\",\"imagecomponent\":\"core\",\"altidentifier\":\"surprise\",\"altcomponent\":\"core_pix\"},{\"text\":\"P-|\",\"imagename\":\"s\\/blackeye\",\"imagecomponent\":\"core\",\"altidentifier\":\"blackeye\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-[\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"(grr)\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"xx-P\",\"imagename\":\"s\\/dead\",\"imagecomponent\":\"core\",\"altidentifier\":\"dead\",\"altcomponent\":\"core_pix\"},{\"text\":\"|-.\",\"imagename\":\"s\\/sleepy\",\"imagecomponent\":\"core\",\"altidentifier\":\"sleepy\",\"altcomponent\":\"core_pix\"},{\"text\":\"}-]\",\"imagename\":\"s\\/evil\",\"imagecomponent\":\"core\",\"altidentifier\":\"evil\",\"altcomponent\":\"core_pix\"},{\"text\":\"(h)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(heart)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(y)\",\"imagename\":\"s\\/yes\",\"imagecomponent\":\"core\",\"altidentifier\":\"yes\",\"altcomponent\":\"core\"},{\"text\":\"(n)\",\"imagename\":\"s\\/no\",\"imagecomponent\":\"core\",\"altidentifier\":\"no\",\"altcomponent\":\"core\"},{\"text\":\"(martin)\",\"imagename\":\"s\\/martin\",\"imagecomponent\":\"core\",\"altidentifier\":\"martin\",\"altcomponent\":\"core_pix\"},{\"text\":\"( )\",\"imagename\":\"s\\/egg\",\"imagecomponent\":\"core\",\"altidentifier\":\"egg\",\"altcomponent\":\"core_pix\"}]',NULL),(352,0,1490725966,NULL,'core_media_enable_youtube','1',NULL),(353,0,1490725966,NULL,'core_media_enable_vimeo','0',NULL),(354,0,1490725966,NULL,'core_media_enable_mp3','1',NULL),(355,0,1490725966,NULL,'core_media_enable_flv','1',NULL),(356,0,1490725966,NULL,'core_media_enable_swf','1',NULL),(357,0,1490725966,NULL,'core_media_enable_html5audio','1',NULL),(358,0,1490725966,NULL,'core_media_enable_html5video','1',NULL),(359,0,1490725967,NULL,'core_media_enable_qt','1',NULL),(360,0,1490725967,NULL,'core_media_enable_wmp','1',NULL),(361,0,1490725967,NULL,'core_media_enable_rm','1',NULL),(362,0,1490725967,NULL,'docroot','http://docs.moodle.org',NULL),(363,0,1490725967,NULL,'doclang','',NULL),(364,0,1490725967,NULL,'doctonewwindow','0',NULL),(365,0,1490725967,NULL,'courselistshortnames','0',NULL),(366,0,1490725967,NULL,'coursesperpage','20',NULL),(367,0,1490725967,NULL,'courseswithsummarieslimit','10',NULL),(368,0,1490725967,NULL,'courseoverviewfileslimit','1',NULL),(369,0,1490725968,NULL,'courseoverviewfilesext','.jpg,.gif,.png',NULL),(370,0,1490725968,NULL,'useexternalyui','0',NULL),(371,0,1490725968,NULL,'yuicomboloading','1',NULL),(372,0,1490725968,NULL,'cachejs','1',NULL),(373,0,1490725968,NULL,'modchooserdefault','1',NULL),(374,0,1490725968,NULL,'modeditingmenu','1',NULL),(375,0,1490725968,NULL,'blockeditingmenu','1',NULL),(376,0,1490725968,NULL,'additionalhtmlhead','',NULL),(377,0,1490725968,NULL,'additionalhtmltopofbody','',NULL),(378,0,1490725968,NULL,'additionalhtmlfooter','',NULL),(379,0,1490725968,NULL,'pathtodu','',NULL),(380,0,1490725968,NULL,'aspellpath','',NULL),(381,0,1490725968,NULL,'pathtodot','',NULL),(382,0,1490725968,NULL,'pathtogs','/usr/bin/gs',NULL),(383,0,1490725968,NULL,'supportname','Admin Usuario',NULL),(384,0,1490725968,NULL,'supportemail','',NULL),(385,0,1490725969,NULL,'supportpage','',NULL),(386,0,1490725969,NULL,'dbsessions','0',NULL),(387,0,1490725969,NULL,'sessioncookie','',NULL),(388,0,1490725969,NULL,'sessioncookiepath','',NULL),(389,0,1490725969,NULL,'sessioncookiedomain','',NULL),(390,0,1490725969,NULL,'statsfirstrun','none',NULL),(391,0,1490725969,NULL,'statsmaxruntime','0',NULL),(392,0,1490725969,NULL,'statsruntimedays','31',NULL),(393,0,1490725969,NULL,'statsuserthreshold','0',NULL),(394,0,1490725969,NULL,'slasharguments','1',NULL),(395,0,1490725969,NULL,'getremoteaddrconf','0',NULL),(396,0,1490725969,NULL,'proxyhost','',NULL),(397,0,1490725969,NULL,'proxyport','0',NULL),(398,0,1490725969,NULL,'proxytype','HTTP',NULL),(399,0,1490725969,NULL,'proxyuser','',NULL),(400,0,1490725970,NULL,'proxypassword','',NULL),(401,0,1490725970,NULL,'proxybypass','localhost, 127.0.0.1',NULL),(402,0,1490725970,NULL,'maintenance_enabled','0',NULL),(403,0,1490725970,NULL,'maintenance_message','',NULL),(404,0,1490725970,NULL,'deleteunconfirmed','168',NULL),(405,0,1490725970,NULL,'deleteincompleteusers','0',NULL),(406,0,1490725970,NULL,'disablegradehistory','0',NULL),(407,0,1490725970,NULL,'gradehistorylifetime','0',NULL),(408,0,1490725970,NULL,'tempdatafoldercleanup','168',NULL),(409,0,1490725970,NULL,'extramemorylimit','512M',NULL),(410,0,1490725970,NULL,'maxtimelimit','0',NULL),(411,0,1490725970,NULL,'curlcache','120',NULL),(412,0,1490725971,NULL,'curltimeoutkbitrate','56',NULL),(413,0,1490725971,NULL,'updateautocheck','1',NULL),(414,0,1490725971,NULL,'updateminmaturity','200',NULL),(415,0,1490725971,NULL,'updatenotifybuilds','0',NULL),(416,0,1490725971,NULL,'enablesafebrowserintegration','0',NULL),(417,0,1490725971,NULL,'dndallowtextandlinks','0',NULL),(418,0,1490725971,NULL,'enablecssoptimiser','0',NULL),(419,0,1490725971,NULL,'debug','0',NULL),(420,0,1490725971,NULL,'debugdisplay','0',NULL),(421,0,1490725971,NULL,'debugsmtp','0',NULL),(422,0,1490725971,NULL,'perfdebug','7',NULL),(423,0,1490725971,NULL,'debugstringids','0',NULL),(424,0,1490725971,NULL,'debugvalidators','0',NULL),(425,0,1490725971,NULL,'debugpageinfo','0',NULL),(426,0,1490725971,NULL,'profilingenabled','0',NULL),(427,0,1490725971,NULL,'profilingincluded','',NULL),(428,0,1490725972,NULL,'profilingexcluded','',NULL),(429,0,1490725972,NULL,'profilingautofrec','0',NULL),(430,0,1490725972,NULL,'profilingallowme','0',NULL),(431,0,1490725972,NULL,'profilingallowall','0',NULL),(432,0,1490725972,NULL,'profilinglifetime','1440',NULL),(433,0,1490725972,NULL,'profilingimportprefix','(I)',NULL),(434,0,1490726062,'activitynames','filter_active','1',''),(435,0,1490726064,'mathjaxloader','filter_active','1',''),(436,0,1490726064,'mediaplugin','filter_active','1',''),(437,2,1490726200,NULL,'notloggedinroleid','6',NULL),(438,2,1490726200,NULL,'guestroleid','6',NULL),(439,2,1490726200,NULL,'defaultuserroleid','7',NULL),(440,2,1490726200,NULL,'creatornewroleid','3',NULL),(441,2,1490726201,NULL,'restorernewroleid','3',NULL),(442,2,1490726201,NULL,'gradebookroles','5',NULL),(443,2,1490726201,NULL,'block_course_list_adminview','all',NULL),(444,2,1490726201,NULL,'block_course_list_hideallcourseslink','0',NULL),(445,2,1490726201,'block_course_overview','defaultmaxcourses','10',NULL),(446,2,1490726201,'block_course_overview','forcedefaultmaxcourses','0',NULL),(447,2,1490726201,'block_course_overview','showchildren','0',NULL),(448,2,1490726201,'block_course_overview','showwelcomearea','0',NULL),(449,2,1490726201,'block_course_overview','showcategories','0',NULL),(450,2,1490726201,NULL,'block_html_allowcssclasses','0',NULL),(451,2,1490726201,NULL,'block_online_users_timetosee','5',NULL),(452,2,1490726201,NULL,'block_rss_client_num_entries','5',NULL),(453,2,1490726201,NULL,'block_rss_client_timeout','30',NULL),(454,2,1490726201,'block_section_links','numsections1','22',NULL),(455,2,1490726201,'block_section_links','incby1','2',NULL),(456,2,1490726201,'block_section_links','numsections2','40',NULL),(457,2,1490726202,'block_section_links','incby2','5',NULL),(458,2,1490726202,'block_tag_youtube','apikey','',NULL),(459,2,1490726202,'editor_atto','toolbar','collapse = collapse\nstyle1 = title, bold, italic\nlist = unorderedlist, orderedlist\nlinks = link\nfiles = image, media, managefiles\nstyle2 = underline, strike, subscript, superscript\nalign = align\nindent = indent\ninsert = equation, charmap, table, clear\nundo = undo\naccessibility = accessibilitychecker, accessibilityhelper\nother = html',NULL),(460,2,1490726202,'editor_atto','autosavefrequency','60',NULL),(461,2,1490726202,'atto_collapse','showgroups','5',NULL),(462,2,1490726202,'atto_equation','librarygroup1','\n\\cdot\n\\times\n\\ast\n\\div\n\\diamond\n\\pm\n\\mp\n\\oplus\n\\ominus\n\\otimes\n\\oslash\n\\odot\n\\circ\n\\bullet\n\\asymp\n\\equiv\n\\subseteq\n\\supseteq\n\\leq\n\\geq\n\\preceq\n\\succeq\n\\sim\n\\simeq\n\\approx\n\\subset\n\\supset\n\\ll\n\\gg\n\\prec\n\\succ\n\\infty\n\\in\n\\ni\n\\forall\n\\exists\n\\neq\n',NULL),(463,2,1490726202,'atto_equation','librarygroup2','\n\\leftarrow\n\\rightarrow\n\\uparrow\n\\downarrow\n\\leftrightarrow\n\\nearrow\n\\searrow\n\\swarrow\n\\nwarrow\n\\Leftarrow\n\\Rightarrow\n\\Uparrow\n\\Downarrow\n\\Leftrightarrow\n',NULL),(464,2,1490726202,'atto_equation','librarygroup3','\n\\alpha\n\\beta\n\\gamma\n\\delta\n\\epsilon\n\\zeta\n\\eta\n\\theta\n\\iota\n\\kappa\n\\lambda\n\\mu\n\\nu\n\\xi\n\\pi\n\\rho\n\\sigma\n\\tau\n\\upsilon\n\\phi\n\\chi\n\\psi\n\\omega\n\\Gamma\n\\Delta\n\\Theta\n\\Lambda\n\\Xi\n\\Pi\n\\Sigma\n\\Upsilon\n\\Phi\n\\Psi\n\\Omega\n',NULL),(465,2,1490726202,'atto_equation','librarygroup4','\n\\sum{a,b}\n\\sqrt[a]{b+c}\n\\int_{a}^{b}{c}\n\\iint_{a}^{b}{c}\n\\iiint_{a}^{b}{c}\n\\oint{a}\n(a)\n[a]\n\\lbrace{a}\\rbrace\n\\left| \\begin{matrix} a_1 & a_2 \\ a_3 & a_4 \\end{matrix} \\right|\n\\frac{a}{b+c}\n\\vec{a}\n\\binom {a} {b}\n{a \\brack b}\n{a \\brace b}\n',NULL),(466,2,1490726202,'atto_table','allowborders','0',NULL),(467,2,1490726202,'atto_table','allowbackgroundcolour','0',NULL),(468,2,1490726202,'atto_table','allowwidth','0',NULL),(469,2,1490726202,'editor_tinymce','customtoolbar','wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen',NULL),(470,2,1490726202,'editor_tinymce','fontselectlist','Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings',NULL),(471,2,1490726202,'editor_tinymce','customconfig','',NULL),(472,2,1490726202,'tinymce_moodleemoticon','requireemoticon','1',NULL),(473,2,1490726202,'tinymce_spellchecker','spellengine','',NULL),(474,2,1490726203,'tinymce_spellchecker','spelllanguagelist','+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv',NULL),(475,2,1490726203,NULL,'filter_censor_badwords','',NULL),(476,2,1490726203,'filter_emoticon','formats','1,4,0',NULL),(477,2,1490726203,'filter_mathjaxloader','httpurl','http://cdn.mathjax.org/mathjax/2.5-latest/MathJax.js',NULL),(478,2,1490726203,'filter_mathjaxloader','httpsurl','https://cdn.mathjax.org/mathjax/2.5-latest/MathJax.js',NULL),(479,2,1490726203,'filter_mathjaxloader','texfiltercompatibility','0',NULL),(480,2,1490726203,'filter_mathjaxloader','mathjaxconfig','\nMathJax.Hub.Config({\n    config: [\"Accessible.js\", \"Safe.js\"],\n    errorSettings: { message: [\"!\"] },\n    skipStartupTypeset: true,\n    messageStyle: \"none\"\n});\n',NULL),(481,2,1490726203,'filter_mathjaxloader','additionaldelimiters','',NULL),(482,2,1490726203,NULL,'filter_multilang_force_old','0',NULL),(483,2,1490726203,'filter_tex','latexpreamble','\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n',NULL),(484,2,1490726203,'filter_tex','latexbackground','#FFFFFF',NULL),(485,2,1490726203,'filter_tex','density','120',NULL),(486,2,1490726203,'filter_tex','pathlatex','/usr/bin/latex',NULL),(487,2,1490726203,'filter_tex','pathdvips','/usr/bin/dvips',NULL),(488,2,1490726204,'filter_tex','pathconvert','/usr/bin/convert',NULL),(489,2,1490726204,'filter_tex','pathdvisvgm','/usr/bin/dvisvgm',NULL),(490,2,1490726204,'filter_tex','pathmimetex','',NULL),(491,2,1490726204,'filter_tex','convertformat','gif',NULL),(492,2,1490726204,'filter_urltolink','formats','0',NULL),(493,2,1490726204,'filter_urltolink','embedimages','1',NULL),(494,2,1490726204,'format_singleactivity','activitytype','forum',NULL),(495,2,1490726204,'logstore_database','dbdriver','',NULL),(496,2,1490726204,'logstore_database','dbhost','',NULL),(497,2,1490726204,'logstore_database','dbuser','',NULL),(498,2,1490726204,'logstore_database','dbpass','',NULL),(499,2,1490726204,'logstore_database','dbname','',NULL),(500,2,1490726204,'logstore_database','dbtable','',NULL),(501,2,1490726204,'logstore_database','dbpersist','0',NULL),(502,2,1490726204,'logstore_database','dbsocket','',NULL),(503,2,1490726204,'logstore_database','dbport','',NULL),(504,2,1490726205,'logstore_database','dbschema','',NULL),(505,2,1490726205,'logstore_database','dbcollation','',NULL),(506,2,1490726205,'logstore_database','buffersize','50',NULL),(507,2,1490726205,'logstore_database','logguests','0',NULL),(508,2,1490726205,'logstore_database','includelevels','1,2,0',NULL),(509,2,1490726205,'logstore_database','includeactions','c,r,u,d',NULL),(510,2,1490726205,'logstore_legacy','loglegacy','0',NULL),(511,2,1490726205,NULL,'logguests','1',NULL),(512,2,1490726205,NULL,'loglifetime','0',NULL),(513,2,1490726205,'logstore_standard','logguests','1',NULL),(514,2,1490726205,'logstore_standard','loglifetime','0',NULL),(515,2,1490726205,'logstore_standard','buffersize','50',NULL),(516,2,1490726205,'enrol_cohort','roleid','5',NULL),(517,2,1490726205,'enrol_cohort','unenrolaction','0',NULL),(518,2,1490726205,'enrol_database','dbtype','',NULL),(519,2,1490726206,'enrol_database','dbhost','localhost',NULL),(520,2,1490726206,'enrol_database','dbuser','',NULL),(521,2,1490726206,'enrol_database','dbpass','',NULL),(522,2,1490726206,'enrol_database','dbname','',NULL),(523,2,1490726206,'enrol_database','dbencoding','utf-8',NULL),(524,2,1490726206,'enrol_database','dbsetupsql','',NULL),(525,2,1490726206,'enrol_database','dbsybasequoting','0',NULL),(526,2,1490726206,'enrol_database','debugdb','0',NULL),(527,2,1490726206,'enrol_database','localcoursefield','idnumber',NULL),(528,2,1490726206,'enrol_database','localuserfield','idnumber',NULL),(529,2,1490726206,'enrol_database','localrolefield','shortname',NULL),(530,2,1490726206,'enrol_database','localcategoryfield','id',NULL),(531,2,1490726206,'enrol_database','remoteenroltable','',NULL),(532,2,1490726206,'enrol_database','remotecoursefield','',NULL),(533,2,1490726206,'enrol_database','remoteuserfield','',NULL),(534,2,1490726206,'enrol_database','remoterolefield','',NULL),(535,2,1490726207,'enrol_database','remoteotheruserfield','',NULL),(536,2,1490726207,'enrol_database','defaultrole','5',NULL),(537,2,1490726207,'enrol_database','ignorehiddencourses','0',NULL),(538,2,1490726207,'enrol_database','unenrolaction','0',NULL),(539,2,1490726207,'enrol_database','newcoursetable','',NULL),(540,2,1490726207,'enrol_database','newcoursefullname','fullname',NULL),(541,2,1490726207,'enrol_database','newcourseshortname','shortname',NULL),(542,2,1490726207,'enrol_database','newcourseidnumber','idnumber',NULL),(543,2,1490726207,'enrol_database','newcoursecategory','',NULL),(544,2,1490726207,'enrol_database','defaultcategory','1',NULL),(545,2,1490726207,'enrol_database','templatecourse','',NULL),(546,2,1490726207,'enrol_flatfile','location','',NULL),(547,2,1490726207,'enrol_flatfile','encoding','UTF-8',NULL),(548,2,1490726207,'enrol_flatfile','mailstudents','0',NULL),(549,2,1490726207,'enrol_flatfile','mailteachers','0',NULL),(550,2,1490726208,'enrol_flatfile','mailadmins','0',NULL),(551,2,1490726208,'enrol_flatfile','unenrolaction','3',NULL),(552,2,1490726208,'enrol_flatfile','expiredaction','3',NULL),(553,2,1490726208,'enrol_guest','requirepassword','0',NULL),(554,2,1490726208,'enrol_guest','usepasswordpolicy','0',NULL),(555,2,1490726208,'enrol_guest','showhint','0',NULL),(556,2,1490726208,'enrol_guest','defaultenrol','1',NULL),(557,2,1490726208,'enrol_guest','status','1',NULL),(558,2,1490726209,'enrol_guest','status_adv','',NULL),(559,2,1490726209,'enrol_imsenterprise','imsfilelocation','',NULL),(560,2,1490726209,'enrol_imsenterprise','logtolocation','',NULL),(561,2,1490726209,'enrol_imsenterprise','mailadmins','0',NULL),(562,2,1490726209,'enrol_imsenterprise','createnewusers','0',NULL),(563,2,1490726209,'enrol_imsenterprise','imsdeleteusers','0',NULL),(564,2,1490726209,'enrol_imsenterprise','fixcaseusernames','0',NULL),(565,2,1490726209,'enrol_imsenterprise','fixcasepersonalnames','0',NULL),(566,2,1490726209,'enrol_imsenterprise','imssourcedidfallback','0',NULL),(567,2,1490726209,'enrol_imsenterprise','imsrolemap01','5',NULL),(568,2,1490726209,'enrol_imsenterprise','imsrolemap02','3',NULL),(569,2,1490726209,'enrol_imsenterprise','imsrolemap03','3',NULL),(570,2,1490726209,'enrol_imsenterprise','imsrolemap04','5',NULL),(571,2,1490726210,'enrol_imsenterprise','imsrolemap05','0',NULL),(572,2,1490726210,'enrol_imsenterprise','imsrolemap06','4',NULL),(573,2,1490726210,'enrol_imsenterprise','imsrolemap07','0',NULL),(574,2,1490726210,'enrol_imsenterprise','imsrolemap08','4',NULL),(575,2,1490726210,'enrol_imsenterprise','truncatecoursecodes','0',NULL),(576,2,1490726210,'enrol_imsenterprise','createnewcourses','0',NULL),(577,2,1490726210,'enrol_imsenterprise','createnewcategories','0',NULL),(578,2,1490726210,'enrol_imsenterprise','imsunenrol','0',NULL),(579,2,1490726210,'enrol_imsenterprise','imscoursemapshortname','coursecode',NULL),(580,2,1490726210,'enrol_imsenterprise','imscoursemapfullname','short',NULL),(581,2,1490726210,'enrol_imsenterprise','imscoursemapsummary','ignore',NULL),(582,2,1490726210,'enrol_imsenterprise','imsrestricttarget','',NULL),(583,2,1490726210,'enrol_imsenterprise','imscapitafix','0',NULL),(584,2,1490726210,'enrol_ldap','host_url','',NULL),(585,2,1490726210,'enrol_ldap','start_tls','0',NULL),(586,2,1490726211,'enrol_ldap','ldap_version','3',NULL),(587,2,1490726211,'enrol_ldap','ldapencoding','utf-8',NULL),(588,2,1490726211,'enrol_ldap','pagesize','250',NULL),(589,2,1490726211,'enrol_ldap','bind_dn','',NULL),(590,2,1490726211,'enrol_ldap','bind_pw','',NULL),(591,2,1490726211,'enrol_ldap','course_search_sub','0',NULL),(592,2,1490726211,'enrol_ldap','memberattribute_isdn','0',NULL),(593,2,1490726211,'enrol_ldap','user_contexts','',NULL),(594,2,1490726211,'enrol_ldap','user_search_sub','0',NULL),(595,2,1490726211,'enrol_ldap','user_type','default',NULL),(596,2,1490726211,'enrol_ldap','opt_deref','0',NULL),(597,2,1490726211,'enrol_ldap','idnumber_attribute','',NULL),(598,2,1490726212,'enrol_ldap','objectclass','',NULL),(599,2,1490726212,'enrol_ldap','course_idnumber','',NULL),(600,2,1490726212,'enrol_ldap','course_shortname','',NULL),(601,2,1490726212,'enrol_ldap','course_fullname','',NULL),(602,2,1490726212,'enrol_ldap','course_summary','',NULL),(603,2,1490726212,'enrol_ldap','ignorehiddencourses','0',NULL),(604,2,1490726212,'enrol_ldap','unenrolaction','0',NULL),(605,2,1490726212,'enrol_ldap','autocreate','0',NULL),(606,2,1490726212,'enrol_ldap','category','1',NULL),(607,2,1490726213,'enrol_ldap','template','',NULL),(608,2,1490726213,'enrol_ldap','course_shortname_updateonsync','0',NULL),(609,2,1490726213,'enrol_ldap','course_fullname_updateonsync','0',NULL),(610,2,1490726213,'enrol_ldap','course_summary_updateonsync','0',NULL),(611,2,1490726213,'enrol_ldap','nested_groups','0',NULL),(612,2,1490726213,'enrol_ldap','group_memberofattribute','',NULL),(613,2,1490726213,'enrol_manual','expiredaction','1',NULL),(614,2,1490726213,'enrol_manual','expirynotifyhour','6',NULL),(615,2,1490726213,'enrol_manual','defaultenrol','1',NULL),(616,2,1490726213,'enrol_manual','status','0',NULL),(617,2,1490726213,'enrol_manual','roleid','5',NULL),(618,2,1490726213,'enrol_manual','enrolstart','4',NULL),(619,2,1490726213,'enrol_manual','enrolperiod','0',NULL),(620,2,1490726213,'enrol_manual','expirynotify','0',NULL),(621,2,1490726214,'enrol_manual','expirythreshold','86400',NULL),(622,2,1490726214,'enrol_meta','nosyncroleids','',NULL),(623,2,1490726214,'enrol_meta','syncall','1',NULL),(624,2,1490726214,'enrol_meta','unenrolaction','3',NULL),(625,2,1490726214,'enrol_meta','coursesort','sortorder',NULL),(626,2,1490726214,'enrol_mnet','roleid','5',NULL),(627,2,1490726214,'enrol_mnet','roleid_adv','1',NULL),(628,2,1490726214,'enrol_paypal','paypalbusiness','',NULL),(629,2,1490726214,'enrol_paypal','mailstudents','0',NULL),(630,2,1490726214,'enrol_paypal','mailteachers','0',NULL),(631,2,1490726214,'enrol_paypal','mailadmins','0',NULL),(632,2,1490726214,'enrol_paypal','expiredaction','3',NULL),(633,2,1490726214,'enrol_paypal','status','1',NULL),(634,2,1490726214,'enrol_paypal','cost','0',NULL),(635,2,1490726214,'enrol_paypal','currency','USD',NULL),(636,2,1490726214,'enrol_paypal','roleid','5',NULL),(637,2,1490726214,'enrol_paypal','enrolperiod','0',NULL),(638,2,1490726215,'enrol_self','requirepassword','0',NULL),(639,2,1490726215,'enrol_self','usepasswordpolicy','0',NULL),(640,2,1490726215,'enrol_self','showhint','0',NULL),(641,2,1490726215,'enrol_self','expiredaction','1',NULL),(642,2,1490726215,'enrol_self','expirynotifyhour','6',NULL),(643,2,1490726215,'enrol_self','defaultenrol','1',NULL),(644,2,1490726215,'enrol_self','status','1',NULL),(645,2,1490726215,'enrol_self','newenrols','1',NULL),(646,2,1490726215,'enrol_self','groupkey','0',NULL),(647,2,1490726215,'enrol_self','roleid','5',NULL),(648,2,1490726215,'enrol_self','enrolperiod','0',NULL),(649,2,1490726215,'enrol_self','expirynotify','0',NULL),(650,2,1490726215,'enrol_self','expirythreshold','86400',NULL),(651,2,1490726215,'enrol_self','longtimenosee','0',NULL),(652,2,1490726216,'enrol_self','maxenrolled','0',NULL),(653,2,1490726216,'enrol_self','sendcoursewelcomemessage','1',NULL),(654,2,1490726216,NULL,'airnotifierurl','https://messages.moodle.net',NULL),(655,2,1490726216,NULL,'airnotifierport','443',NULL),(656,2,1490726216,NULL,'airnotifiermobileappname','com.moodle.moodlemobile',NULL),(657,2,1490726216,NULL,'airnotifierappname','commoodlemoodlemobile',NULL),(658,2,1490726216,NULL,'airnotifieraccesskey','',NULL),(659,2,1490726216,NULL,'smtphosts','',NULL),(660,2,1490726216,NULL,'smtpsecure','',NULL),(661,2,1490726216,NULL,'smtpauthtype','LOGIN',NULL),(662,2,1490726216,NULL,'smtpuser','',NULL),(663,2,1490726216,NULL,'smtppass','',NULL),(664,2,1490726216,NULL,'smtpmaxbulk','1',NULL),(665,2,1490726216,NULL,'emailonlyfromnoreplyaddress','0',NULL),(666,2,1490726217,NULL,'sitemailcharset','0',NULL),(667,2,1490726217,NULL,'allowusermailcharset','0',NULL),(668,2,1490726217,NULL,'allowattachments','1',NULL),(669,2,1490726217,NULL,'mailnewline','LF',NULL),(670,2,1490726217,NULL,'jabberhost','',NULL),(671,2,1490726217,NULL,'jabberserver','',NULL),(672,2,1490726217,NULL,'jabberusername','',NULL),(673,2,1490726217,NULL,'jabberpassword','',NULL),(674,2,1490726217,NULL,'jabberport','5222',NULL),(675,2,1490726217,'assign','feedback_plugin_for_gradebook','assignfeedback_comments',NULL),(676,2,1490726217,'assign','showrecentsubmissions','0',NULL),(677,2,1490726217,'assign','submissionreceipts','1',NULL),(678,2,1490726217,'assign','submissionstatement','Confirmo que este trabajo es de elaboración propia, excepto aquellas partes en las que haya reconocido la autoría de la obra o parte de ella a otras personas.',NULL),(679,2,1490726217,'assign','alwaysshowdescription','1',NULL),(680,2,1490726217,'assign','alwaysshowdescription_adv','',NULL),(681,2,1490726217,'assign','alwaysshowdescription_locked','',NULL),(682,2,1490726217,'assign','allowsubmissionsfromdate','0',NULL),(683,2,1490726218,'assign','allowsubmissionsfromdate_enabled','1',NULL),(684,2,1490726218,'assign','allowsubmissionsfromdate_adv','',NULL),(685,2,1490726218,'assign','duedate','604800',NULL),(686,2,1490726218,'assign','duedate_enabled','1',NULL),(687,2,1490726218,'assign','duedate_adv','',NULL),(688,2,1490726218,'assign','cutoffdate','1209600',NULL),(689,2,1490726218,'assign','cutoffdate_enabled','',NULL),(690,2,1490726218,'assign','cutoffdate_adv','',NULL),(691,2,1490726218,'assign','submissiondrafts','0',NULL),(692,2,1490726218,'assign','submissiondrafts_adv','',NULL),(693,2,1490726218,'assign','submissiondrafts_locked','',NULL),(694,2,1490726219,'assign','requiresubmissionstatement','0',NULL),(695,2,1490726219,'assign','requiresubmissionstatement_adv','',NULL),(696,2,1490726219,'assign','requiresubmissionstatement_locked','',NULL),(697,2,1490726219,'assign','attemptreopenmethod','none',NULL),(698,2,1490726219,'assign','attemptreopenmethod_adv','',NULL),(699,2,1490726219,'assign','attemptreopenmethod_locked','',NULL),(700,2,1490726219,'assign','maxattempts','-1',NULL),(701,2,1490726220,'assign','maxattempts_adv','',NULL),(702,2,1490726220,'assign','maxattempts_locked','',NULL),(703,2,1490726220,'assign','teamsubmission','0',NULL),(704,2,1490726220,'assign','teamsubmission_adv','',NULL),(705,2,1490726220,'assign','teamsubmission_locked','',NULL),(706,2,1490726220,'assign','preventsubmissionnotingroup','0',NULL),(707,2,1490726220,'assign','preventsubmissionnotingroup_adv','',NULL),(708,2,1490726220,'assign','preventsubmissionnotingroup_locked','',NULL),(709,2,1490726220,'assign','requireallteammemberssubmit','0',NULL),(710,2,1490726220,'assign','requireallteammemberssubmit_adv','',NULL),(711,2,1490726220,'assign','requireallteammemberssubmit_locked','',NULL),(712,2,1490726220,'assign','teamsubmissiongroupingid','',NULL),(713,2,1490726221,'assign','teamsubmissiongroupingid_adv','',NULL),(714,2,1490726221,'assign','sendnotifications','0',NULL),(715,2,1490726221,'assign','sendnotifications_adv','',NULL),(716,2,1490726221,'assign','sendnotifications_locked','',NULL),(717,2,1490726221,'assign','sendlatenotifications','0',NULL),(718,2,1490726221,'assign','sendlatenotifications_adv','',NULL),(719,2,1490726221,'assign','sendlatenotifications_locked','',NULL),(720,2,1490726221,'assign','sendstudentnotifications','1',NULL),(721,2,1490726221,'assign','sendstudentnotifications_adv','',NULL),(722,2,1490726221,'assign','sendstudentnotifications_locked','',NULL),(723,2,1490726221,'assign','blindmarking','0',NULL),(724,2,1490726221,'assign','blindmarking_adv','',NULL),(725,2,1490726221,'assign','blindmarking_locked','',NULL),(726,2,1490726221,'assign','markingworkflow','0',NULL),(727,2,1490726221,'assign','markingworkflow_adv','',NULL),(728,2,1490726221,'assign','markingworkflow_locked','',NULL),(729,2,1490726221,'assign','markingallocation','0',NULL),(730,2,1490726222,'assign','markingallocation_adv','',NULL),(731,2,1490726222,'assign','markingallocation_locked','',NULL),(732,2,1490726222,'assignsubmission_file','default','1',NULL),(733,2,1490726222,'assignsubmission_file','maxfiles','20',NULL),(734,2,1490726222,'assignsubmission_file','maxbytes','1048576',NULL),(735,2,1490726222,'assignsubmission_onlinetext','default','0',NULL),(736,2,1490726222,'assignfeedback_comments','default','1',NULL),(737,2,1490726222,'assignfeedback_comments','inline','0',NULL),(738,2,1490726222,'assignfeedback_comments','inline_adv','',NULL),(739,2,1490726222,'assignfeedback_comments','inline_locked','',NULL),(740,2,1490726222,'assignfeedback_editpdf','stamps','',NULL),(741,2,1490726222,'assignfeedback_file','default','0',NULL),(742,2,1490726222,'assignfeedback_offline','default','0',NULL),(743,2,1490726222,'book','numberingoptions','0,1,2,3',NULL),(744,2,1490726222,'book','navoptions','0,1,2',NULL),(745,2,1490726223,'book','numbering','1',NULL),(746,2,1490726223,'book','navstyle','1',NULL),(747,2,1490726223,NULL,'chat_method','ajax',NULL),(748,2,1490726223,NULL,'chat_refresh_userlist','10',NULL),(749,2,1490726223,NULL,'chat_old_ping','35',NULL),(750,2,1490726223,NULL,'chat_refresh_room','5',NULL),(751,2,1490726223,NULL,'chat_normal_updatemode','jsupdate',NULL),(752,2,1490726223,NULL,'chat_serverhost','localhost',NULL),(753,2,1490726223,NULL,'chat_serverip','127.0.0.1',NULL),(754,2,1490726223,NULL,'chat_serverport','9111',NULL),(755,2,1490726223,NULL,'chat_servermax','100',NULL),(756,2,1490726223,NULL,'data_enablerssfeeds','0',NULL),(757,2,1490726223,NULL,'feedback_allowfullanonymous','0',NULL),(758,2,1490726223,'folder','showexpanded','1',NULL),(759,2,1490726224,NULL,'forum_displaymode','3',NULL),(760,2,1490726224,NULL,'forum_replytouser','1',NULL),(761,2,1490726224,NULL,'forum_shortpost','300',NULL),(762,2,1490726224,NULL,'forum_longpost','600',NULL),(763,2,1490726224,NULL,'forum_manydiscussions','100',NULL),(764,2,1490726224,NULL,'forum_maxbytes','512000',NULL),(765,2,1490726224,NULL,'forum_maxattachments','9',NULL),(766,2,1490726224,NULL,'forum_trackingtype','1',NULL),(767,2,1490726224,NULL,'forum_trackreadposts','1',NULL),(768,2,1490726224,NULL,'forum_allowforcedreadtracking','0',NULL),(769,2,1490726224,NULL,'forum_oldpostdays','14',NULL),(770,2,1490726224,NULL,'forum_usermarksread','0',NULL),(771,2,1490726224,NULL,'forum_cleanreadtime','2',NULL),(772,2,1490726224,NULL,'digestmailtime','17',NULL),(773,2,1490726224,NULL,'forum_enablerssfeeds','0',NULL),(774,2,1490726224,NULL,'forum_enabletimedposts','0',NULL),(775,2,1490726225,NULL,'glossary_entbypage','10',NULL),(776,2,1490726225,NULL,'glossary_dupentries','0',NULL),(777,2,1490726225,NULL,'glossary_allowcomments','0',NULL),(778,2,1490726225,NULL,'glossary_linkbydefault','1',NULL),(779,2,1490726225,NULL,'glossary_defaultapproval','1',NULL),(780,2,1490726225,NULL,'glossary_enablerssfeeds','0',NULL),(781,2,1490726225,NULL,'glossary_linkentries','0',NULL),(782,2,1490726225,NULL,'glossary_casesensitive','0',NULL),(783,2,1490726225,NULL,'glossary_fullmatch','0',NULL),(784,2,1490726225,'imscp','keepold','1',NULL),(785,2,1490726225,'imscp','keepold_adv','',NULL),(786,2,1490726225,'label','dndmedia','1',NULL),(787,2,1490726225,'label','dndresizewidth','400',NULL),(788,2,1490726225,'label','dndresizeheight','400',NULL),(789,2,1490726225,NULL,'lesson_slideshowwidth','640',NULL),(790,2,1490726225,NULL,'lesson_slideshowheight','480',NULL),(791,2,1490726226,NULL,'lesson_slideshowbgcolor','#FFFFFF',NULL),(792,2,1490726226,NULL,'lesson_mediawidth','640',NULL),(793,2,1490726226,NULL,'lesson_mediaheight','480',NULL),(794,2,1490726226,NULL,'lesson_mediaclose','0',NULL),(795,2,1490726226,NULL,'lesson_maxanswers','4',NULL),(796,2,1490726226,NULL,'lesson_defaultnextpage','0',NULL),(797,2,1490726226,'page','displayoptions','5',NULL),(798,2,1490726226,'page','printheading','1',NULL),(799,2,1490726226,'page','printintro','0',NULL),(800,2,1490726226,'page','display','5',NULL),(801,2,1490726226,'page','popupwidth','620',NULL),(802,2,1490726227,'page','popupheight','450',NULL),(803,2,1490726227,'quiz','timelimit','0',NULL),(804,2,1490726227,'quiz','timelimit_adv','',NULL),(805,2,1490726227,'quiz','overduehandling','autosubmit',NULL),(806,2,1490726227,'quiz','overduehandling_adv','',NULL),(807,2,1490726227,'quiz','graceperiod','86400',NULL),(808,2,1490726227,'quiz','graceperiod_adv','',NULL),(809,2,1490726227,'quiz','graceperiodmin','60',NULL),(810,2,1490726227,'quiz','attempts','0',NULL),(811,2,1490726227,'quiz','attempts_adv','',NULL),(812,2,1490726227,'quiz','grademethod','1',NULL),(813,2,1490726227,'quiz','grademethod_adv','',NULL),(814,2,1490726227,'quiz','maximumgrade','10',NULL),(815,2,1490726227,'quiz','questionsperpage','1',NULL),(816,2,1490726227,'quiz','questionsperpage_adv','',NULL),(817,2,1490726228,'quiz','navmethod','free',NULL),(818,2,1490726228,'quiz','navmethod_adv','1',NULL),(819,2,1490726228,'quiz','shuffleanswers','1',NULL),(820,2,1490726228,'quiz','shuffleanswers_adv','',NULL),(821,2,1490726228,'quiz','preferredbehaviour','deferredfeedback',NULL),(822,2,1490726228,'quiz','canredoquestions','0',NULL),(823,2,1490726228,'quiz','canredoquestions_adv','1',NULL),(824,2,1490726228,'quiz','attemptonlast','0',NULL),(825,2,1490726228,'quiz','attemptonlast_adv','1',NULL),(826,2,1490726228,'quiz','reviewattempt','69904',NULL),(827,2,1490726229,'quiz','reviewcorrectness','69904',NULL),(828,2,1490726229,'quiz','reviewmarks','69904',NULL),(829,2,1490726229,'quiz','reviewspecificfeedback','69904',NULL),(830,2,1490726229,'quiz','reviewgeneralfeedback','69904',NULL),(831,2,1490726229,'quiz','reviewrightanswer','69904',NULL),(832,2,1490726229,'quiz','reviewoverallfeedback','4368',NULL),(833,2,1490726229,'quiz','showuserpicture','0',NULL),(834,2,1490726229,'quiz','showuserpicture_adv','',NULL),(835,2,1490726229,'quiz','decimalpoints','2',NULL),(836,2,1490726229,'quiz','decimalpoints_adv','',NULL),(837,2,1490726229,'quiz','questiondecimalpoints','-1',NULL),(838,2,1490726229,'quiz','questiondecimalpoints_adv','1',NULL),(839,2,1490726229,'quiz','showblocks','0',NULL),(840,2,1490726229,'quiz','showblocks_adv','1',NULL),(841,2,1490726229,'quiz','password','',NULL),(842,2,1490726230,'quiz','password_adv','',NULL),(843,2,1490726230,'quiz','subnet','',NULL),(844,2,1490726230,'quiz','subnet_adv','1',NULL),(845,2,1490726230,'quiz','delay1','0',NULL),(846,2,1490726230,'quiz','delay1_adv','1',NULL),(847,2,1490726230,'quiz','delay2','0',NULL),(848,2,1490726230,'quiz','delay2_adv','1',NULL),(849,2,1490726230,'quiz','browsersecurity','-',NULL),(850,2,1490726230,'quiz','browsersecurity_adv','1',NULL),(851,2,1490726230,'quiz','initialnumfeedbacks','2',NULL),(852,2,1490726230,'quiz','autosaveperiod','60',NULL),(853,2,1490726231,'resource','framesize','130',NULL),(854,2,1490726231,'resource','displayoptions','0,1,4,5,6',NULL),(855,2,1490726231,'resource','printintro','1',NULL),(856,2,1490726231,'resource','display','0',NULL),(857,2,1490726231,'resource','showsize','0',NULL),(858,2,1490726231,'resource','showtype','0',NULL),(859,2,1490726231,'resource','showdate','0',NULL),(860,2,1490726231,'resource','popupwidth','620',NULL),(861,2,1490726231,'resource','popupheight','450',NULL),(862,2,1490726231,'resource','filterfiles','0',NULL),(863,2,1490726231,'scorm','displaycoursestructure','0',NULL),(864,2,1490726231,'scorm','displaycoursestructure_adv','',NULL),(865,2,1490726231,'scorm','popup','0',NULL),(866,2,1490726231,'scorm','popup_adv','',NULL),(867,2,1490726231,'scorm','displayactivityname','1',NULL),(868,2,1490726231,'scorm','framewidth','100',NULL),(869,2,1490726232,'scorm','framewidth_adv','1',NULL),(870,2,1490726232,'scorm','frameheight','500',NULL),(871,2,1490726232,'scorm','frameheight_adv','1',NULL),(872,2,1490726232,'scorm','winoptgrp_adv','1',NULL),(873,2,1490726232,'scorm','scrollbars','0',NULL),(874,2,1490726232,'scorm','directories','0',NULL),(875,2,1490726232,'scorm','location','0',NULL),(876,2,1490726232,'scorm','menubar','0',NULL),(877,2,1490726232,'scorm','toolbar','0',NULL),(878,2,1490726232,'scorm','status','0',NULL),(879,2,1490726232,'scorm','skipview','0',NULL),(880,2,1490726232,'scorm','skipview_adv','1',NULL),(881,2,1490726232,'scorm','hidebrowse','0',NULL),(882,2,1490726232,'scorm','hidebrowse_adv','1',NULL),(883,2,1490726232,'scorm','hidetoc','0',NULL),(884,2,1490726232,'scorm','hidetoc_adv','1',NULL),(885,2,1490726233,'scorm','nav','1',NULL),(886,2,1490726233,'scorm','nav_adv','1',NULL),(887,2,1490726233,'scorm','navpositionleft','-100',NULL),(888,2,1490726233,'scorm','navpositionleft_adv','1',NULL),(889,2,1490726233,'scorm','navpositiontop','-100',NULL),(890,2,1490726233,'scorm','navpositiontop_adv','1',NULL),(891,2,1490726233,'scorm','collapsetocwinsize','767',NULL),(892,2,1490726233,'scorm','collapsetocwinsize_adv','1',NULL),(893,2,1490726233,'scorm','displayattemptstatus','1',NULL),(894,2,1490726233,'scorm','displayattemptstatus_adv','',NULL),(895,2,1490726233,'scorm','grademethod','1',NULL),(896,2,1490726233,'scorm','maxgrade','100',NULL),(897,2,1490726233,'scorm','maxattempt','0',NULL),(898,2,1490726233,'scorm','whatgrade','0',NULL),(899,2,1490726233,'scorm','forcecompleted','0',NULL),(900,2,1490726233,'scorm','forcenewattempt','0',NULL),(901,2,1490726233,'scorm','autocommit','0',NULL),(902,2,1490726234,'scorm','lastattemptlock','0',NULL),(903,2,1490726234,'scorm','auto','0',NULL),(904,2,1490726234,'scorm','updatefreq','0',NULL),(905,2,1490726234,'scorm','scorm12standard','1',NULL),(906,2,1490726234,'scorm','allowtypeexternal','0',NULL),(907,2,1490726234,'scorm','allowtypelocalsync','0',NULL),(908,2,1490726234,'scorm','allowtypeexternalaicc','0',NULL),(909,2,1490726234,'scorm','allowaicchacp','0',NULL),(910,2,1490726234,'scorm','aicchacptimeout','30',NULL),(911,2,1490726234,'scorm','aicchacpkeepsessiondata','1',NULL),(912,2,1490726234,'scorm','aiccuserid','1',NULL),(913,2,1490726234,'scorm','forcejavascript','1',NULL),(914,2,1490726234,'scorm','allowapidebug','0',NULL),(915,2,1490726234,'scorm','apidebugmask','.*',NULL),(916,2,1490726234,'scorm','protectpackagedownloads','0',NULL),(917,2,1490726235,'url','framesize','130',NULL),(918,2,1490726235,'url','secretphrase','',NULL),(919,2,1490726235,'url','rolesinparams','0',NULL),(920,2,1490726235,'url','displayoptions','0,1,5,6',NULL),(921,2,1490726235,'url','printintro','1',NULL),(922,2,1490726235,'url','display','0',NULL),(923,2,1490726235,'url','popupwidth','620',NULL),(924,2,1490726235,'url','popupheight','450',NULL),(925,2,1490726235,'workshop','grade','80',NULL),(926,2,1490726235,'workshop','gradinggrade','20',NULL),(927,2,1490726235,'workshop','gradedecimals','0',NULL),(928,2,1490726235,'workshop','maxbytes','0',NULL),(929,2,1490726235,'workshop','strategy','accumulative',NULL),(930,2,1490726235,'workshop','examplesmode','0',NULL),(931,2,1490726235,'workshopallocation_random','numofreviews','5',NULL),(932,2,1490726236,'workshopform_numerrors','grade0','No',NULL),(933,2,1490726236,'workshopform_numerrors','grade1','Sí',NULL),(934,2,1490726236,'workshopeval_best','comparison','5',NULL),(935,2,1490726236,NULL,'enablemobilewebservice','0',NULL),(936,2,1490726236,NULL,'profileroles','5,4,3',NULL),(937,2,1490726236,NULL,'coursecontact','3',NULL),(938,2,1490726236,NULL,'frontpage','6',NULL),(939,2,1490726236,NULL,'frontpageloggedin','6',NULL),(940,2,1490726236,NULL,'maxcategorydepth','2',NULL),(941,2,1490726236,NULL,'frontpagecourselimit','200',NULL),(942,2,1490726236,NULL,'commentsperpage','15',NULL),(943,2,1490726236,NULL,'defaultfrontpageroleid','8',NULL),(944,2,1490726236,NULL,'messageinbound_enabled','0',NULL),(945,2,1490726236,NULL,'messageinbound_mailbox','',NULL),(946,2,1490726236,NULL,'messageinbound_domain','',NULL),(947,2,1490726236,NULL,'messageinbound_host','',NULL),(948,2,1490726237,NULL,'messageinbound_hostssl','ssl',NULL),(949,2,1490726237,NULL,'messageinbound_hostuser','',NULL),(950,2,1490726237,NULL,'messageinbound_hostpass','',NULL),(951,2,1490726979,NULL,'timezone','America/La_Paz',NULL),(952,2,1490726979,NULL,'registerauth','',NULL),(953,2,1490726991,NULL,'noreplyaddress','noreply@localhost.com',NULL),(954,2,1490791497,NULL,'themedesignermode','1','0'),(955,2,1490791498,NULL,'allowcoursethemes','1','0'),(956,2,1490791498,NULL,'allowcategorythemes','1','0'),(957,2,1490791498,NULL,'allowthemechangeonurl','1','0'),(958,2,1490791498,NULL,'customusermenuitems','grades,grades|/grade/report/mygrades.php|grades\r\nmessages,message|/message/index.php|message\r\npreferences,moodle|/user/preferences.php|preferences','grades,grades|/grade/report/mygrades.php|grades\nmessages,message|/message/index.php|message\npreferences,moodle|/user/preferences.php|preferences'),(959,2,1490792280,'theme_adaptable','maincolor','#009688',NULL),(960,2,1490792280,'theme_adaptable','backcolor','#FFF',NULL),(961,2,1490792280,'theme_adaptable','regionmaincolor','#FFF',NULL),(962,2,1490792280,'theme_adaptable','linkcolor','#009688',NULL),(963,2,1490792280,'theme_adaptable','linkhover','#009688',NULL),(964,2,1490792280,'theme_adaptable','selectiontext','#000000',NULL),(965,2,1490792280,'theme_adaptable','selectionbackground','#eeff41',NULL),(966,2,1490792280,'theme_adaptable','loadingcolor','#4db6ac',NULL),(967,2,1490792280,'theme_adaptable','msgbadgecolor','#E53935',NULL),(968,2,1490792280,'theme_adaptable','headerbkcolor','#00796B',NULL),(969,2,1490792281,'theme_adaptable','headertextcolor','#ffffff',NULL),(970,2,1490792281,'theme_adaptable','headerbkcolor2','#009688',NULL),(971,2,1490792281,'theme_adaptable','headertextcolor2','#ffffff',NULL),(972,2,1490792281,'theme_adaptable','menubkcolor','#ffffff',NULL),(973,2,1490792281,'theme_adaptable','menufontcolor','#444444',NULL),(974,2,1490792281,'theme_adaptable','menuhovercolor','#b2dfdb',NULL),(975,2,1490792281,'theme_adaptable','menubordercolor','#80cbc4',NULL),(976,2,1490792281,'theme_adaptable','mobilemenubkcolor','#F9F9F9',NULL),(977,2,1490792281,'theme_adaptable','mobilemenufontcolor','#000000',NULL),(978,2,1490792281,'theme_adaptable','marketblockbordercolor','#e8eaeb',NULL),(979,2,1490792281,'theme_adaptable','marketblocksbackgroundcolor','transparent',NULL),(980,2,1490792282,'theme_adaptable','rendereroverlaycolor','#009688',NULL),(981,2,1490792282,'theme_adaptable','rendereroverlayfontcolor','#FFF',NULL),(982,2,1490792282,'theme_adaptable','tilesbordercolor','#009688',NULL),(983,2,1490792282,'theme_adaptable','covbkcolor','#009688',NULL),(984,2,1490792282,'theme_adaptable','covfontcolor','#ffffff',NULL),(985,2,1490792282,'theme_adaptable','dividingline','#ffffff',NULL),(986,2,1490792282,'theme_adaptable','dividingline2','#ffffff',NULL),(987,2,1490792282,'theme_adaptable','navbarborder','#B7B3EF',NULL),(988,2,1490792282,'theme_adaptable','navbarhover','#3C469C',NULL),(989,2,1490792283,'theme_adaptable','breadcrumb','#f5f5f5',NULL),(990,2,1490792283,'theme_adaptable','breadcrumbtextcolor','#444444',NULL),(991,2,1490792283,'theme_adaptable','messagepopupbackground','#fff000',NULL),(992,2,1490792283,'theme_adaptable','messagepopupcolor','#333333',NULL),(993,2,1490792283,'theme_adaptable','footerbkcolor','#424242',NULL),(994,2,1490792283,'theme_adaptable','footertextcolor','#ffffff',NULL),(995,2,1490792283,'theme_adaptable','footertextcolor2','#ffffff',NULL),(996,2,1490792283,'theme_adaptable','footerlinkcolor','#ffffff',NULL),(997,2,1490792283,'theme_adaptable','fontname','Open Sans',NULL),(998,2,1490792283,'theme_adaptable','fontsubset','',NULL),(999,2,1490792283,'theme_adaptable','fontsize','95%',NULL),(1000,2,1490792284,'theme_adaptable','fontweight','400',NULL),(1001,2,1490792284,'theme_adaptable','fontcolor','#333333',NULL),(1002,2,1490792284,'theme_adaptable','topmenufontsize','14px',NULL),(1003,2,1490792284,'theme_adaptable','menufontsize','14px',NULL),(1004,2,1490792284,'theme_adaptable','menufontpadding','20px',NULL),(1005,2,1490792284,'theme_adaptable','fontheadername','Roboto Slab',NULL),(1006,2,1490792284,'theme_adaptable','fontheaderweight','400',NULL),(1007,2,1490792284,'theme_adaptable','fontheadercolor','#333333',NULL),(1008,2,1490792284,'theme_adaptable','fonttitlename','Audiowide',NULL),(1009,2,1490792284,'theme_adaptable','fonttitlesize','48px',NULL),(1010,2,1490792284,'theme_adaptable','fonttitleweight','400',NULL),(1011,2,1490792285,'theme_adaptable','fonttitlecolor','#ffffff',NULL),(1012,2,1490792285,'theme_adaptable','fonttitlenamecourse','Audiowide',NULL),(1013,2,1490792285,'theme_adaptable','fonttitlesizecourse','48px',NULL),(1014,2,1490792285,'theme_adaptable','fonttitleweightcourse','400',NULL),(1015,2,1490792285,'theme_adaptable','fonttitlecolorcourse','#ffffff',NULL),(1016,2,1490792285,'theme_adaptable','fontblockheadersize','28px',NULL),(1017,2,1490792285,'theme_adaptable','fontblockheaderweight','400',NULL),(1018,2,1490792285,'theme_adaptable','fontblockheadercolor','#009688',NULL),(1019,2,1490792285,'theme_adaptable','buttonradius','5px',NULL),(1020,2,1490792285,'theme_adaptable','buttoncolor','#009688',NULL),(1021,2,1490792286,'theme_adaptable','buttonhovercolor','#00695c',NULL),(1022,2,1490792286,'theme_adaptable','buttontextcolor','#ffffff',NULL),(1023,2,1490792286,'theme_adaptable','editonbk','#4caf50',NULL),(1024,2,1490792286,'theme_adaptable','editoffbk','#f44336',NULL),(1025,2,1490792286,'theme_adaptable','editfont','#ffffff',NULL),(1026,2,1490792286,'theme_adaptable','editverticalpadding','4px',NULL),(1027,2,1490792286,'theme_adaptable','edithorizontalpadding','6px',NULL),(1028,2,1490792286,'theme_adaptable','edittopmargin','1px',NULL),(1029,2,1490792286,'theme_adaptable','buttonlogincolor','#ef5350',NULL),(1030,2,1490792286,'theme_adaptable','buttonloginhovercolor','#e53935',NULL),(1031,2,1490792286,'theme_adaptable','buttonlogintextcolor','#FFFFFF',NULL),(1032,2,1490792287,'theme_adaptable','buttonloginpadding','0px',NULL),(1033,2,1490792287,'theme_adaptable','buttonloginheight','24px',NULL),(1034,2,1490792287,'theme_adaptable','buttonloginmargintop','2px',NULL),(1035,2,1490792287,'theme_adaptable','frontpagelogin','1',NULL),(1036,2,1490792287,'theme_adaptable','displaylogin','button',NULL),(1037,2,1490792287,'theme_adaptable','enablemessagemenu','1',NULL),(1038,2,1490792287,'theme_adaptable','filteradminmessages','',NULL),(1039,2,1490792287,'theme_adaptable','logo','/ilernus.svg',NULL),(1040,2,1490792288,'theme_adaptable','favicon','/ico.ico',NULL),(1041,2,1490792288,'theme_adaptable','sitetitle','default',NULL),(1042,2,1490792288,'theme_adaptable','sitetitletext','<p>Aula virtual</p>',NULL),(1043,2,1490792288,'theme_adaptable','enableheading','fullname',NULL),(1044,2,1490792288,'theme_adaptable','sitetitlepaddingtop','0px',NULL),(1045,2,1490792288,'theme_adaptable','sitetitlepaddingleft','0px',NULL),(1046,2,1490792288,'theme_adaptable','sitetitlemaxwidth','50%',NULL),(1047,2,1490792288,'theme_adaptable','breadcrumbhome','icon',NULL),(1048,2,1490792288,'theme_adaptable','breadcrumbseparator','angle-right',NULL),(1049,2,1490792288,'theme_adaptable','socialorsearch','social',NULL),(1050,2,1490792289,'theme_adaptable','searchboxpaddingtop','16px',NULL),(1051,2,1490792289,'theme_adaptable','enablemenus','',NULL),(1052,2,1490792289,'theme_adaptable','disablemenuscoursepages','',NULL),(1053,2,1490792289,'theme_adaptable','menusession','1',NULL),(1054,2,1490792289,'theme_adaptable','menusessionttl','30',NULL),(1055,2,1490792289,'theme_adaptable','menuuseroverride','',NULL),(1056,2,1490792289,'theme_adaptable','menuoverrideprofilefield','topmenusettings',NULL),(1057,2,1490792289,'theme_adaptable','topmenuscount','1',NULL),(1058,2,1490792289,'theme_adaptable','newmenu1title','Menú 1',NULL),(1059,2,1490792290,'theme_adaptable','newmenu1','',NULL),(1060,2,1490792290,'theme_adaptable','newmenu1requirelogin','',NULL),(1061,2,1490792290,'theme_adaptable','newmenu1field','',NULL),(1062,2,1490792290,'theme_adaptable','hideinforum','',NULL),(1063,2,1490792290,'theme_adaptable','enablemy','1',NULL),(1064,2,1490792290,'theme_adaptable','enableprofile','1',NULL),(1065,2,1490792290,'theme_adaptable','enableeditprofile','1',NULL),(1066,2,1490792290,'theme_adaptable','enablecalendar','1',NULL),(1067,2,1490792290,'theme_adaptable','enableprivatefiles','',NULL),(1068,2,1490792290,'theme_adaptable','enablegrades','1',NULL),(1069,2,1490792290,'theme_adaptable','enablebadges','',NULL),(1070,2,1490792290,'theme_adaptable','enablepref','1',NULL),(1071,2,1490792291,'theme_adaptable','enablenote','',NULL),(1072,2,1490792291,'theme_adaptable','enableblog','',NULL),(1073,2,1490792291,'theme_adaptable','enableposts','',NULL),(1074,2,1490792291,'theme_adaptable','enablefeed','',NULL),(1075,2,1490792291,'theme_adaptable','socialsize','32px',NULL),(1076,2,1490792291,'theme_adaptable','socialsizemobile','22px',NULL),(1077,2,1490792291,'theme_adaptable','socialpaddingtop','1.8%',NULL),(1078,2,1490792291,'theme_adaptable','socialtarget','_self',NULL),(1079,2,1490792291,'theme_adaptable','socialiconlist','',NULL),(1080,2,1490792291,'theme_adaptable','enablehome','1',NULL),(1081,2,1490792291,'theme_adaptable','enablehomeredirect','1',NULL),(1082,2,1490792292,'theme_adaptable','enablemyhome','1',NULL),(1083,2,1490792292,'theme_adaptable','enableevents','1',NULL),(1084,2,1490792292,'theme_adaptable','enablemysites','excludehidden',NULL),(1085,2,1490792292,'theme_adaptable','mysitesmaxlength','30',NULL),(1086,2,1490792292,'theme_adaptable','mysitessortoverride','off',NULL),(1087,2,1490792292,'theme_adaptable','mysitessortoverridefield','',NULL),(1088,2,1490792292,'theme_adaptable','enablethiscourse','1',NULL),(1089,2,1490792292,'theme_adaptable','enablezoom','1',NULL),(1090,2,1490792292,'theme_adaptable','enableshowhideblocks','1',NULL),(1091,2,1490792292,'theme_adaptable','enablehelp','',NULL),(1092,2,1490792292,'theme_adaptable','helpprofilefield','',NULL),(1093,2,1490792292,'theme_adaptable','enablehelp2','',NULL),(1094,2,1490792293,'theme_adaptable','helpprofilefield2','',NULL),(1095,2,1490792293,'theme_adaptable','helptarget','_blank',NULL),(1096,2,1490792293,'theme_adaptable','disablecustommenu','',NULL),(1097,2,1490792293,'theme_adaptable','enabletoolsmenus','1',NULL),(1098,2,1490792293,'theme_adaptable','toolsmenuscount','1',NULL),(1099,2,1490792293,'theme_adaptable','toolsmenu1title','Herramientas',NULL),(1100,2,1490792293,'theme_adaptable','toolsmenu1','',NULL),(1101,2,1490792293,'theme_adaptable','toolsmenu1field','',NULL),(1102,2,1490792293,'theme_adaptable','blockicons','1',NULL),(1103,2,1490792293,'theme_adaptable','blockbackgroundcolor','#FFFFFF',NULL),(1104,2,1490792293,'theme_adaptable','blockheaderbackgroundcolor','#FFFFFF',NULL),(1105,2,1490792293,'theme_adaptable','blockbordercolor','#59585D',NULL),(1106,2,1490792293,'theme_adaptable','blocklinkcolor','#009688',NULL),(1107,2,1490792294,'theme_adaptable','blocklinkhovercolor','#009688',NULL),(1108,2,1490792294,'theme_adaptable','blockregionbackgroundcolor','transparent',NULL),(1109,2,1490792294,'theme_adaptable','blockheaderbordertopstyle','dashed',NULL),(1110,2,1490792294,'theme_adaptable','blockheadertopradius','0px',NULL),(1111,2,1490792294,'theme_adaptable','blockheaderbottomradius','0px',NULL),(1112,2,1490792294,'theme_adaptable','blockheaderbordertop','1px',NULL),(1113,2,1490792294,'theme_adaptable','blockheaderborderleft','0px',NULL),(1114,2,1490792294,'theme_adaptable','blockheaderborderright','0px',NULL),(1115,2,1490792294,'theme_adaptable','blockheaderborderbottom','0px',NULL),(1116,2,1490792294,'theme_adaptable','blockmainbordertopstyle','none',NULL),(1117,2,1490792295,'theme_adaptable','blockmaintopradius','0px',NULL),(1118,2,1490792295,'theme_adaptable','blockmainbottomradius','0px',NULL),(1119,2,1490792295,'theme_adaptable','blockmainbordertop','0px',NULL),(1120,2,1490792295,'theme_adaptable','blockmainborderleft','0px',NULL),(1121,2,1490792295,'theme_adaptable','blockmainborderright','0px',NULL),(1122,2,1490792295,'theme_adaptable','blockmainborderbottom','0px',NULL),(1123,2,1490792295,'theme_adaptable','frontpageblocksenabled','0',NULL),(1124,2,1490792295,'theme_adaptable','blocklayoutlayoutrow1','3-3-3-3',NULL),(1125,2,1490792295,'theme_adaptable','blocklayoutlayoutrow2','4-4-4-0',NULL),(1126,2,1490792295,'theme_adaptable','blocklayoutlayoutrow3','3-3-3-3',NULL),(1127,2,1490792295,'theme_adaptable','blocklayoutlayoutrow4','0-0-0-0',NULL),(1128,2,1490792296,'theme_adaptable','blocklayoutlayoutrow5','0-0-0-0',NULL),(1129,2,1490792296,'theme_adaptable','blocklayoutlayoutrow6','0-0-0-0',NULL),(1130,2,1490792296,'theme_adaptable','blocklayoutlayoutrow7','0-0-0-0',NULL),(1131,2,1490792296,'theme_adaptable','blocklayoutlayoutrow8','0-0-0-0',NULL),(1132,2,1490792296,'theme_adaptable','coursesectionheaderbg','#F3F3F3',NULL),(1133,2,1490792296,'theme_adaptable','sectionheadingcolor','#5f588a',NULL),(1134,2,1490792296,'theme_adaptable','currentcolor','#d9edf7',NULL),(1135,2,1490792296,'theme_adaptable','coursesectionheaderborderstyle','none',NULL),(1136,2,1490792296,'theme_adaptable','coursesectionheaderbordercolor','#F3F3F3',NULL),(1137,2,1490792296,'theme_adaptable','coursesectionheaderborderwidth','0px',NULL),(1138,2,1490792297,'theme_adaptable','coursesectionheaderborderradiustop','0px',NULL),(1139,2,1490792297,'theme_adaptable','coursesectionheaderborderradiusbottom','0px',NULL),(1140,2,1490792297,'theme_adaptable','coursesectionborderstyle','solid',NULL),(1141,2,1490792297,'theme_adaptable','coursesectionborderwidth','1px',NULL),(1142,2,1490792297,'theme_adaptable','coursesectionbordercolor','#e8eaeb',NULL),(1143,2,1490792297,'theme_adaptable','coursesectionborderradius','0px',NULL),(1144,2,1490792297,'theme_adaptable','infobox','',NULL),(1145,2,1490792297,'theme_adaptable','infobox2','',NULL),(1146,2,1490792297,'theme_adaptable','infoboxfullscreen','',NULL),(1147,2,1490792297,'theme_adaptable','frontpagemarketenabled','',NULL),(1148,2,1490792297,'theme_adaptable','frontpagemarketoption','covtiles',NULL),(1149,2,1490792298,'theme_adaptable','marketlayoutrow1','3-3-3-3',NULL),(1150,2,1490792298,'theme_adaptable','marketlayoutrow2','0-0-0-0',NULL),(1151,2,1490792298,'theme_adaptable','marketlayoutrow3','0-0-0-0',NULL),(1152,2,1490792298,'theme_adaptable','marketlayoutrow4','0-0-0-0',NULL),(1153,2,1490792298,'theme_adaptable','marketlayoutrow5','0-0-0-0',NULL),(1154,2,1490792298,'theme_adaptable','frontpagerenderer','2',NULL),(1155,2,1490792298,'theme_adaptable','frontpagerendererdefaultimage','',NULL),(1156,2,1490792298,'theme_adaptable','tilesshowcontacts','1',NULL),(1157,2,1490792298,'theme_adaptable','tilesshowallcontacts','0',NULL),(1158,2,1490792298,'theme_adaptable','tilescontactstitle','1',NULL),(1159,2,1490792298,'theme_adaptable','covhidebutton','0',NULL),(1160,2,1490792298,'theme_adaptable','enableavailablecourses','none',NULL),(1161,2,1490792298,'theme_adaptable','enableticker','1',NULL),(1162,2,1490792299,'theme_adaptable','enabletickermy','1',NULL),(1163,2,1490792299,'theme_adaptable','tickerwidth','',NULL),(1164,2,1490792299,'theme_adaptable','newstickercount','1',NULL),(1165,2,1490792299,'theme_adaptable','tickertext1','',NULL),(1166,2,1490792299,'theme_adaptable','tickertext1profilefield','',NULL),(1167,2,1490792299,'theme_adaptable','sliderenabled','0',NULL),(1168,2,1490792299,'theme_adaptable','sliderfullscreen','0',NULL),(1169,2,1490792299,'theme_adaptable','slidermargintop','20px',NULL),(1170,2,1490792299,'theme_adaptable','slidermarginbottom','20px',NULL),(1171,2,1490792299,'theme_adaptable','slideroption2','slider1',NULL),(1172,2,1490792299,'theme_adaptable','sliderh3color','#ffffff',NULL),(1173,2,1490792299,'theme_adaptable','sliderh4color','#ffffff',NULL),(1174,2,1490792300,'theme_adaptable','slidersubmitcolor','#ffffff',NULL),(1175,2,1490792300,'theme_adaptable','slidersubmitbgcolor','#009688',NULL),(1176,2,1490792300,'theme_adaptable','slidercount','3',NULL),(1177,2,1490792300,'theme_adaptable','p1','',NULL),(1178,2,1490792300,'theme_adaptable','p1url','',NULL),(1179,2,1490792300,'theme_adaptable','p1cap','',NULL),(1180,2,1490792300,'theme_adaptable','p2','',NULL),(1181,2,1490792300,'theme_adaptable','p2url','',NULL),(1182,2,1490792300,'theme_adaptable','p2cap','',NULL),(1183,2,1490792301,'theme_adaptable','p3','',NULL),(1184,2,1490792301,'theme_adaptable','p3url','',NULL),(1185,2,1490792301,'theme_adaptable','p3cap','',NULL),(1186,2,1490792301,'theme_adaptable','enablealerts','',NULL),(1187,2,1490792301,'theme_adaptable','enablealertcoursepages','',NULL),(1188,2,1490792301,'theme_adaptable','enablealertstriptags','1',NULL),(1189,2,1490792301,'theme_adaptable','alertcount','1',NULL),(1190,2,1490792301,'theme_adaptable','enablealert1','',NULL),(1191,2,1490792301,'theme_adaptable','alertkey1','',NULL),(1192,2,1490792301,'theme_adaptable','alerttext1','',NULL),(1193,2,1490792301,'theme_adaptable','alerttype1','info',NULL),(1194,2,1490792301,'theme_adaptable','alertaccess1','global',NULL),(1195,2,1490792302,'theme_adaptable','alertprofilefield1','',NULL),(1196,2,1490792302,'theme_adaptable','homebk','',NULL),(1197,2,1490792302,'theme_adaptable','blockside','0',NULL),(1198,2,1490792302,'theme_adaptable','viewselect','1',NULL),(1199,2,1490792302,'theme_adaptable','fullscreenwidth','98%',NULL),(1200,2,1490792302,'theme_adaptable','emoticonsize','16px',NULL),(1201,2,1490792302,'theme_adaptable','moodledocs','1',NULL),(1202,2,1490792302,'theme_adaptable','footerblocksplacement','1',NULL),(1203,2,1490792302,'theme_adaptable','showfooterblocks','1',NULL),(1204,2,1490792302,'theme_adaptable','footerlayoutrow1','3-3-3-3',NULL),(1205,2,1490792302,'theme_adaptable','footerlayoutrow2','0-0-0-0',NULL),(1206,2,1490792302,'theme_adaptable','footerlayoutrow3','0-0-0-0',NULL),(1207,2,1490792303,'theme_adaptable','footnote','',NULL),(1208,2,1490792303,'theme_adaptable','hidealertsmobile',', .customalert',NULL),(1209,2,1490792303,'theme_adaptable','hidesocialmobile',', .socialbox',NULL),(1210,2,1490792303,'theme_adaptable','socialboxpaddingtopmobile','10px',NULL),(1211,2,1490792303,'theme_adaptable','socialboxpaddingbottommobile','10px',NULL),(1212,2,1490792303,'theme_adaptable','hidecoursetitlemobile',', #coursetitle, #titlecontainer',NULL),(1213,2,1490792303,'theme_adaptable','hidelogomobile',', #logocontainer',NULL),(1214,2,1490792303,'theme_adaptable','hideheadermobile',', #page-header',NULL),(1215,2,1490792303,'theme_adaptable','hidebreadcrumbmobile',', .breadcrumb',NULL),(1216,2,1490792303,'theme_adaptable','hidepagefootermobile',', #page-footer',NULL),(1217,2,1490792303,'theme_adaptable','socialwallbackgroundcolor','#ffffff',NULL),(1218,2,1490792303,'theme_adaptable','socialwallbordercolor','#B9B9B9',NULL),(1219,2,1490792304,'theme_adaptable','socialwallbordertopstyle','solid',NULL),(1220,2,1490792304,'theme_adaptable','socialwallborderwidth','2px',NULL),(1221,2,1490792304,'theme_adaptable','socialwallsectionradius','6px',NULL),(1222,2,1490792304,'theme_adaptable','socialwallactionlinkcolor','#009688',NULL),(1223,2,1490792304,'theme_adaptable','socialwallactionlinkhovercolor','#009688',NULL),(1224,2,1490792304,'theme_adaptable','enableanalytics','',NULL),(1225,2,1490792304,'theme_adaptable','analyticscount','1',NULL),(1226,2,1490792304,'theme_adaptable','piwikenabled','',NULL),(1227,2,1490792304,'theme_adaptable','piwiksiteid','1',NULL),(1228,2,1490792304,'theme_adaptable','piwikimagetrack','1',NULL),(1229,2,1490792304,'theme_adaptable','piwiksiteurl','',NULL),(1230,2,1490792305,'theme_adaptable','piwiktrackadmin','',NULL),(1231,2,1490792305,'theme_adaptable','customcss','',NULL),(1232,2,1490792305,'theme_adaptable','jssection','',NULL),(1233,2,1490792362,'theme_adaptable','analyticstext1','',NULL),(1234,2,1490792362,'theme_adaptable','analyticsprofilefield1','',NULL),(1235,2,1490792746,'theme_adaptable','maincolor','#2C0041','#009688'),(1236,2,1490792746,'theme_adaptable','backcolor','#FFD6DB','#FFF'),(1237,2,1490792781,'theme_adaptable','regionmaincolor','#FF93A0','#FFF'),(1238,2,1490792781,'theme_adaptable','linkcolor','#510050','#009688'),(1239,2,1490792809,'theme_adaptable','regionmaincolor','#FFDBE5','#FF93A0'),(1240,2,1490792857,'theme_adaptable','headerbkcolor','#420036','#00796B'),(1241,2,1490792900,'theme_adaptable','regionmaincolor','#ccc','#FFDBE5'),(1242,2,1490792976,'theme_adaptable','headerbkcolor2','#420036','#009688'),(1243,2,1490793194,'theme_adaptable','headerbkcolor','#d8d2d7','#420036'),(1244,2,1490793195,'theme_adaptable','headertextcolor','#000','#ffffff'),(1245,2,1490793237,'theme_adaptable','headerbkcolor','#7A004C','#d8d2d7'),(1246,2,1490793237,'theme_adaptable','headertextcolor','#fff','#000'),(1247,2,1490793237,'theme_adaptable','headerbkcolor2','#d8d2d7','#420036'),(1248,2,1490793237,'theme_adaptable','headertextcolor2','#000','#ffffff'),(1249,2,1490793267,'theme_adaptable','regionmaincolor','#fff','#ccc'),(1250,2,1490793340,'theme_adaptable','messagepopupbackground','#7d4996','#fff000'),(1251,2,1490793356,'theme_adaptable','selectionbackground','#7d4996','#eeff41'),(1252,2,1490793758,'theme_adaptable','headerbkcolor2','#2e9ac9','#d8d2d7'),(1253,2,1490793819,'theme_adaptable','backcolor','#f1f1f1','#FFD6DB'),(1254,2,1490793910,'theme_adaptable','regionmaincolor','#191f43','#fff'),(1255,2,1490793910,'theme_adaptable','selectiontext','#191f43','#000000'),(1256,2,1490793933,'theme_adaptable','regionmaincolor','#fff','#191f43'),(1257,2,1490793974,'theme_adaptable','loadingcolor','#fff','#4db6ac'),(1258,2,1490794020,'theme_adaptable','menubordercolor','#444','#80cbc4'),(1259,2,1490794085,'theme_adaptable','breadcrumb','#424242','#f5f5f5'),(1260,2,1490794124,'theme_adaptable','breadcrumb','#7d4996','#424242'),(1261,2,1490794199,'theme_adaptable','breadcrumb','#53AE33','#7d4996'),(1262,2,1490794266,'theme_adaptable','headerbkcolor2','#f0f0f0','#2e9ac9'),(1263,2,1490794335,'theme_adaptable','headertextcolor','#000','#fff'),(1264,2,1490794366,'theme_adaptable','headertextcolor','#fff','#000'),(1265,2,1490794452,'theme_adaptable','rendereroverlayfontcolor','#000','#FFF'),(1266,2,1490794502,'theme_adaptable','covfontcolor','#000','#ffffff');
/*!40000 ALTER TABLE `mdl_config_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_config_plugins`
--

DROP TABLE IF EXISTS `mdl_config_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_config_plugins` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'core',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1432 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Moodle modules and plugins configuration variables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_config_plugins`
--

LOCK TABLES `mdl_config_plugins` WRITE;
/*!40000 ALTER TABLE `mdl_config_plugins` DISABLE KEYS */;
INSERT INTO `mdl_config_plugins` VALUES (1,'question','multichoice_sortorder','1'),(2,'question','truefalse_sortorder','2'),(3,'question','match_sortorder','3'),(4,'question','shortanswer_sortorder','4'),(5,'question','numerical_sortorder','5'),(6,'question','essay_sortorder','6'),(7,'moodlecourse','visible','1'),(8,'moodlecourse','format','weeks'),(9,'moodlecourse','maxsections','52'),(10,'moodlecourse','numsections','10'),(11,'moodlecourse','hiddensections','0'),(12,'moodlecourse','coursedisplay','0'),(13,'moodlecourse','lang',''),(14,'moodlecourse','newsitems','5'),(15,'moodlecourse','showgrades','1'),(16,'moodlecourse','showreports','0'),(17,'moodlecourse','maxbytes','0'),(18,'moodlecourse','enablecompletion','0'),(19,'moodlecourse','groupmode','0'),(20,'moodlecourse','groupmodeforce','0'),(21,'backup','loglifetime','30'),(22,'backup','backup_general_users','1'),(23,'backup','backup_general_users_locked',''),(24,'backup','backup_general_anonymize','0'),(25,'backup','backup_general_anonymize_locked',''),(26,'backup','backup_general_role_assignments','1'),(27,'backup','backup_general_role_assignments_locked',''),(28,'backup','backup_general_activities','1'),(29,'backup','backup_general_activities_locked',''),(30,'backup','backup_general_blocks','1'),(31,'backup','backup_general_blocks_locked',''),(32,'backup','backup_general_filters','1'),(33,'backup','backup_general_filters_locked',''),(34,'backup','backup_general_comments','1'),(35,'backup','backup_general_comments_locked',''),(36,'backup','backup_general_badges','1'),(37,'backup','backup_general_badges_locked',''),(38,'backup','backup_general_userscompletion','1'),(39,'backup','backup_general_userscompletion_locked',''),(40,'backup','backup_general_logs','0'),(41,'backup','backup_general_logs_locked',''),(42,'backup','backup_general_histories','0'),(43,'backup','backup_general_histories_locked',''),(44,'backup','backup_general_questionbank','1'),(45,'backup','backup_general_questionbank_locked',''),(46,'backup','backup_general_groups','1'),(47,'backup','backup_general_groups_locked',''),(48,'backup','import_general_maxresults','10'),(49,'backup','import_general_duplicate_admin_allowed','0'),(50,'backup','backup_auto_active','0'),(51,'backup','backup_auto_weekdays','0000000'),(52,'backup','backup_auto_hour','0'),(53,'backup','backup_auto_minute','0'),(54,'backup','backup_auto_storage','0'),(55,'backup','backup_auto_destination',''),(56,'backup','backup_auto_max_kept','1'),(57,'backup','backup_auto_delete_days','0'),(58,'backup','backup_auto_min_kept','0'),(59,'backup','backup_shortname','0'),(60,'backup','backup_auto_skip_hidden','1'),(61,'backup','backup_auto_skip_modif_days','30'),(62,'backup','backup_auto_skip_modif_prev','0'),(63,'backup','backup_auto_users','1'),(64,'backup','backup_auto_role_assignments','1'),(65,'backup','backup_auto_activities','1'),(66,'backup','backup_auto_blocks','1'),(67,'backup','backup_auto_filters','1'),(68,'backup','backup_auto_comments','1'),(69,'backup','backup_auto_badges','1'),(70,'backup','backup_auto_userscompletion','1'),(71,'backup','backup_auto_logs','0'),(72,'backup','backup_auto_histories','0'),(73,'backup','backup_auto_questionbank','1'),(74,'backup','backup_auto_groups','1'),(75,'cachestore_memcache','testservers',''),(76,'cachestore_memcached','testservers',''),(77,'cachestore_mongodb','testserver',''),(78,'question_preview','behaviour','deferredfeedback'),(79,'question_preview','correctness','1'),(80,'question_preview','marks','2'),(81,'question_preview','markdp','2'),(82,'question_preview','feedback','1'),(83,'question_preview','generalfeedback','1'),(84,'question_preview','rightanswer','1'),(85,'question_preview','history','0'),(86,'theme_clean','invert','0'),(87,'theme_clean','logo',''),(88,'theme_clean','customcss',''),(89,'theme_clean','footnote',''),(90,'theme_more','textcolor','#333366'),(91,'theme_more','linkcolor','#FF6500'),(92,'theme_more','bodybackground',''),(93,'theme_more','backgroundimage',''),(94,'theme_more','backgroundrepeat','repeat'),(95,'theme_more','backgroundposition','0'),(96,'theme_more','backgroundfixed','0'),(97,'theme_more','contentbackground','#FFFFFF'),(98,'theme_more','secondarybackground','#FFFFFF'),(99,'theme_more','invert','1'),(100,'theme_more','logo',''),(101,'theme_more','customcss',''),(102,'theme_more','footnote',''),(103,'availability_completion','version','2015111600'),(104,'availability_date','version','2015111600'),(105,'availability_grade','version','2015111600'),(106,'availability_group','version','2015111600'),(107,'availability_grouping','version','2015111600'),(108,'availability_profile','version','2015111600'),(109,'qtype_calculated','version','2015111600'),(110,'qtype_calculatedmulti','version','2015111600'),(111,'qtype_calculatedsimple','version','2015111600'),(112,'qtype_ddimageortext','version','2015111600'),(113,'qtype_ddmarker','version','2015111600'),(114,'qtype_ddwtos','version','2015111600'),(115,'qtype_description','version','2015111600'),(116,'qtype_essay','version','2015111600'),(117,'qtype_gapselect','version','2015111600'),(118,'qtype_match','version','2015111600'),(119,'qtype_missingtype','version','2015111600'),(120,'qtype_multianswer','version','2015111600'),(121,'qtype_multichoice','version','2015111600'),(122,'qtype_numerical','version','2015111600'),(123,'qtype_random','version','2015111600'),(124,'qtype_randomsamatch','version','2015111600'),(125,'qtype_shortanswer','version','2015111600'),(126,'qtype_truefalse','version','2015111600'),(127,'mod_assign','version','2015111601'),(128,'mod_assignment','version','2015111600'),(130,'mod_book','version','2015111600'),(131,'mod_chat','version','2015111600'),(132,'mod_choice','version','2015111600'),(133,'mod_data','version','2015111600'),(134,'mod_feedback','version','2015111600'),(136,'mod_folder','version','2015111600'),(138,'mod_forum','version','2015111600'),(139,'mod_glossary','version','2015111600'),(140,'mod_imscp','version','2015111600'),(142,'mod_label','version','2015111600'),(143,'mod_lesson','version','2015111600'),(144,'mod_lti','version','2015111600'),(145,'mod_page','version','2015111600'),(147,'mod_quiz','version','2015111602'),(148,'mod_resource','version','2015111600'),(149,'mod_scorm','version','2015111601'),(150,'mod_survey','version','2015111600'),(152,'mod_url','version','2015111600'),(154,'mod_wiki','version','2015111600'),(156,'mod_workshop','version','2015111600'),(157,'auth_cas','version','2015111600'),(159,'auth_db','version','2015111600'),(161,'auth_email','version','2015111600'),(162,'auth_fc','version','2015111600'),(164,'auth_imap','version','2015111600'),(166,'auth_ldap','version','2015111600'),(168,'auth_manual','version','2015111600'),(169,'auth_mnet','version','2015111600'),(171,'auth_nntp','version','2015111600'),(173,'auth_nologin','version','2015111600'),(174,'auth_none','version','2015111600'),(175,'auth_pam','version','2015111600'),(177,'auth_pop3','version','2015111600'),(179,'auth_radius','version','2015111600'),(181,'auth_shibboleth','version','2015111600'),(183,'auth_webservice','version','2015111600'),(184,'calendartype_gregorian','version','2015111600'),(185,'enrol_category','version','2015111600'),(187,'enrol_cohort','version','2015111600'),(188,'enrol_database','version','2015111600'),(190,'enrol_flatfile','version','2015111600'),(192,'enrol_flatfile','map_1','manager'),(193,'enrol_flatfile','map_2','coursecreator'),(194,'enrol_flatfile','map_3','editingteacher'),(195,'enrol_flatfile','map_4','teacher'),(196,'enrol_flatfile','map_5','student'),(197,'enrol_flatfile','map_6','guest'),(198,'enrol_flatfile','map_7','user'),(199,'enrol_flatfile','map_8','frontpage'),(200,'enrol_guest','version','2015111600'),(201,'enrol_imsenterprise','version','2015111600'),(203,'enrol_ldap','version','2015111600'),(205,'enrol_manual','version','2015111600'),(207,'enrol_meta','version','2015111600'),(209,'enrol_mnet','version','2015111600'),(210,'enrol_paypal','version','2015111600'),(211,'enrol_self','version','2015111601'),(213,'message_airnotifier','version','2015111600'),(215,'message','airnotifier_provider_enrol_flatfile_flatfile_enrolment_permitted','permitted'),(216,'message','airnotifier_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted','permitted'),(217,'message','airnotifier_provider_enrol_manual_expiry_notification_permitted','permitted'),(218,'message','airnotifier_provider_enrol_paypal_paypal_enrolment_permitted','permitted'),(219,'message','airnotifier_provider_enrol_self_expiry_notification_permitted','permitted'),(220,'message','airnotifier_provider_mod_assign_assign_notification_permitted','permitted'),(221,'message','airnotifier_provider_mod_assignment_assignment_updates_permitted','permitted'),(222,'message','airnotifier_provider_mod_feedback_submission_permitted','permitted'),(223,'message','airnotifier_provider_mod_feedback_message_permitted','permitted'),(224,'message','airnotifier_provider_mod_forum_posts_permitted','permitted'),(225,'message','airnotifier_provider_mod_lesson_graded_essay_permitted','permitted'),(226,'message','airnotifier_provider_mod_quiz_submission_permitted','permitted'),(227,'message','airnotifier_provider_mod_quiz_confirmation_permitted','permitted'),(228,'message','airnotifier_provider_mod_quiz_attempt_overdue_permitted','permitted'),(229,'message','airnotifier_provider_moodle_notices_permitted','permitted'),(230,'message','airnotifier_provider_moodle_errors_permitted','permitted'),(231,'message','airnotifier_provider_moodle_availableupdate_permitted','permitted'),(232,'message','airnotifier_provider_moodle_instantmessage_permitted','permitted'),(233,'message','airnotifier_provider_moodle_backup_permitted','permitted'),(234,'message','airnotifier_provider_moodle_courserequested_permitted','permitted'),(235,'message','airnotifier_provider_moodle_courserequestapproved_permitted','permitted'),(236,'message','airnotifier_provider_moodle_courserequestrejected_permitted','permitted'),(237,'message','airnotifier_provider_moodle_badgerecipientnotice_permitted','permitted'),(238,'message','airnotifier_provider_moodle_badgecreatornotice_permitted','permitted'),(239,'message_email','version','2015111600'),(241,'message','email_provider_enrol_flatfile_flatfile_enrolment_permitted','permitted'),(242,'message','message_provider_enrol_flatfile_flatfile_enrolment_loggedin','email'),(243,'message','message_provider_enrol_flatfile_flatfile_enrolment_loggedoff','email'),(244,'message','email_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted','permitted'),(245,'message','message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedin','email'),(246,'message','message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedoff','email'),(247,'message','email_provider_enrol_manual_expiry_notification_permitted','permitted'),(248,'message','message_provider_enrol_manual_expiry_notification_loggedin','email'),(249,'message','message_provider_enrol_manual_expiry_notification_loggedoff','email'),(250,'message','email_provider_enrol_paypal_paypal_enrolment_permitted','permitted'),(251,'message','message_provider_enrol_paypal_paypal_enrolment_loggedin','email'),(252,'message','message_provider_enrol_paypal_paypal_enrolment_loggedoff','email'),(253,'message','email_provider_enrol_self_expiry_notification_permitted','permitted'),(254,'message','message_provider_enrol_self_expiry_notification_loggedin','email'),(255,'message','message_provider_enrol_self_expiry_notification_loggedoff','email'),(256,'message','email_provider_mod_assign_assign_notification_permitted','permitted'),(257,'message','message_provider_mod_assign_assign_notification_loggedin','email'),(258,'message','message_provider_mod_assign_assign_notification_loggedoff','email'),(259,'message','email_provider_mod_assignment_assignment_updates_permitted','permitted'),(260,'message','message_provider_mod_assignment_assignment_updates_loggedin','email'),(261,'message','message_provider_mod_assignment_assignment_updates_loggedoff','email'),(262,'message','email_provider_mod_feedback_submission_permitted','permitted'),(263,'message','message_provider_mod_feedback_submission_loggedin','email'),(264,'message','message_provider_mod_feedback_submission_loggedoff','email'),(265,'message','email_provider_mod_feedback_message_permitted','permitted'),(266,'message','message_provider_mod_feedback_message_loggedin','email'),(267,'message','message_provider_mod_feedback_message_loggedoff','email'),(268,'message','email_provider_mod_forum_posts_permitted','permitted'),(269,'message','message_provider_mod_forum_posts_loggedin','email'),(270,'message','message_provider_mod_forum_posts_loggedoff','email'),(271,'message','email_provider_mod_lesson_graded_essay_permitted','permitted'),(272,'message','message_provider_mod_lesson_graded_essay_loggedin','email'),(273,'message','message_provider_mod_lesson_graded_essay_loggedoff','email'),(274,'message','email_provider_mod_quiz_submission_permitted','permitted'),(275,'message','message_provider_mod_quiz_submission_loggedin','email'),(276,'message','message_provider_mod_quiz_submission_loggedoff','email'),(277,'message','email_provider_mod_quiz_confirmation_permitted','permitted'),(278,'message','message_provider_mod_quiz_confirmation_loggedin','email'),(279,'message','message_provider_mod_quiz_confirmation_loggedoff','email'),(280,'message','email_provider_mod_quiz_attempt_overdue_permitted','permitted'),(281,'message','message_provider_mod_quiz_attempt_overdue_loggedin','email'),(282,'message','message_provider_mod_quiz_attempt_overdue_loggedoff','email'),(283,'message','email_provider_moodle_notices_permitted','permitted'),(284,'message','message_provider_moodle_notices_loggedin','email'),(285,'message','message_provider_moodle_notices_loggedoff','email'),(286,'message','email_provider_moodle_errors_permitted','permitted'),(287,'message','message_provider_moodle_errors_loggedin','email'),(288,'message','message_provider_moodle_errors_loggedoff','email'),(289,'message','email_provider_moodle_availableupdate_permitted','permitted'),(290,'message','message_provider_moodle_availableupdate_loggedin','email'),(291,'message','message_provider_moodle_availableupdate_loggedoff','email'),(292,'message','email_provider_moodle_instantmessage_permitted','permitted'),(293,'message','message_provider_moodle_instantmessage_loggedoff','popup,email'),(294,'message','email_provider_moodle_backup_permitted','permitted'),(295,'message','message_provider_moodle_backup_loggedin','email'),(296,'message','message_provider_moodle_backup_loggedoff','email'),(297,'message','email_provider_moodle_courserequested_permitted','permitted'),(298,'message','message_provider_moodle_courserequested_loggedin','email'),(299,'message','message_provider_moodle_courserequested_loggedoff','email'),(300,'message','email_provider_moodle_courserequestapproved_permitted','permitted'),(301,'message','message_provider_moodle_courserequestapproved_loggedin','email'),(302,'message','message_provider_moodle_courserequestapproved_loggedoff','email'),(303,'message','email_provider_moodle_courserequestrejected_permitted','permitted'),(304,'message','message_provider_moodle_courserequestrejected_loggedin','email'),(305,'message','message_provider_moodle_courserequestrejected_loggedoff','email'),(306,'message','email_provider_moodle_badgerecipientnotice_permitted','permitted'),(307,'message','message_provider_moodle_badgerecipientnotice_loggedoff','popup,email'),(308,'message','email_provider_moodle_badgecreatornotice_permitted','permitted'),(309,'message','message_provider_moodle_badgecreatornotice_loggedoff','email'),(310,'message_jabber','version','2015111600'),(312,'message','jabber_provider_enrol_flatfile_flatfile_enrolment_permitted','permitted'),(313,'message','jabber_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted','permitted'),(314,'message','jabber_provider_enrol_manual_expiry_notification_permitted','permitted'),(315,'message','jabber_provider_enrol_paypal_paypal_enrolment_permitted','permitted'),(316,'message','jabber_provider_enrol_self_expiry_notification_permitted','permitted'),(317,'message','jabber_provider_mod_assign_assign_notification_permitted','permitted'),(318,'message','jabber_provider_mod_assignment_assignment_updates_permitted','permitted'),(319,'message','jabber_provider_mod_feedback_submission_permitted','permitted'),(320,'message','jabber_provider_mod_feedback_message_permitted','permitted'),(321,'message','jabber_provider_mod_forum_posts_permitted','permitted'),(322,'message','jabber_provider_mod_lesson_graded_essay_permitted','permitted'),(323,'message','jabber_provider_mod_quiz_submission_permitted','permitted'),(324,'message','jabber_provider_mod_quiz_confirmation_permitted','permitted'),(325,'message','jabber_provider_mod_quiz_attempt_overdue_permitted','permitted'),(326,'message','jabber_provider_moodle_notices_permitted','permitted'),(327,'message','jabber_provider_moodle_errors_permitted','permitted'),(328,'message','jabber_provider_moodle_availableupdate_permitted','permitted'),(329,'message','jabber_provider_moodle_instantmessage_permitted','permitted'),(330,'message','jabber_provider_moodle_backup_permitted','permitted'),(331,'message','jabber_provider_moodle_courserequested_permitted','permitted'),(332,'message','jabber_provider_moodle_courserequestapproved_permitted','permitted'),(333,'message','jabber_provider_moodle_courserequestrejected_permitted','permitted'),(334,'message','jabber_provider_moodle_badgerecipientnotice_permitted','permitted'),(335,'message','jabber_provider_moodle_badgecreatornotice_permitted','permitted'),(336,'message_popup','version','2015111600'),(338,'message','popup_provider_enrol_flatfile_flatfile_enrolment_permitted','permitted'),(339,'message','popup_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted','permitted'),(340,'message','popup_provider_enrol_manual_expiry_notification_permitted','permitted'),(341,'message','popup_provider_enrol_paypal_paypal_enrolment_permitted','permitted'),(342,'message','popup_provider_enrol_self_expiry_notification_permitted','permitted'),(343,'message','popup_provider_mod_assign_assign_notification_permitted','permitted'),(344,'message','popup_provider_mod_assignment_assignment_updates_permitted','permitted'),(345,'message','popup_provider_mod_feedback_submission_permitted','permitted'),(346,'message','popup_provider_mod_feedback_message_permitted','permitted'),(347,'message','popup_provider_mod_forum_posts_permitted','permitted'),(348,'message','popup_provider_mod_lesson_graded_essay_permitted','permitted'),(349,'message','popup_provider_mod_quiz_submission_permitted','permitted'),(350,'message','popup_provider_mod_quiz_confirmation_permitted','permitted'),(351,'message','popup_provider_mod_quiz_attempt_overdue_permitted','permitted'),(352,'message','popup_provider_moodle_notices_permitted','permitted'),(353,'message','popup_provider_moodle_errors_permitted','permitted'),(354,'message','popup_provider_moodle_availableupdate_permitted','permitted'),(355,'message','popup_provider_moodle_instantmessage_permitted','permitted'),(356,'message','message_provider_moodle_instantmessage_loggedin','popup'),(357,'message','popup_provider_moodle_backup_permitted','permitted'),(358,'message','popup_provider_moodle_courserequested_permitted','permitted'),(359,'message','popup_provider_moodle_courserequestapproved_permitted','permitted'),(360,'message','popup_provider_moodle_courserequestrejected_permitted','permitted'),(361,'message','popup_provider_moodle_badgerecipientnotice_permitted','permitted'),(362,'message','message_provider_moodle_badgerecipientnotice_loggedin','popup'),(363,'message','popup_provider_moodle_badgecreatornotice_permitted','permitted'),(364,'block_activity_modules','version','2015111600'),(365,'block_activity_results','version','2015111600'),(366,'block_admin_bookmarks','version','2015111600'),(367,'block_badges','version','2015111600'),(368,'block_blog_menu','version','2015111600'),(369,'block_blog_recent','version','2015111600'),(370,'block_blog_tags','version','2015111600'),(371,'block_calendar_month','version','2015111600'),(372,'block_calendar_upcoming','version','2015111600'),(373,'block_comments','version','2015111600'),(374,'block_community','version','2015111600'),(375,'block_completionstatus','version','2015111600'),(376,'block_course_list','version','2015111600'),(377,'block_course_overview','version','2015111600'),(378,'block_course_summary','version','2015111600'),(379,'block_feedback','version','2015111600'),(381,'block_glossary_random','version','2015111600'),(382,'block_html','version','2015111600'),(383,'block_login','version','2015111600'),(384,'block_mentees','version','2015111600'),(385,'block_messages','version','2015111600'),(386,'block_mnet_hosts','version','2015111600'),(387,'block_myprofile','version','2015111600'),(388,'block_navigation','version','2015111600'),(389,'block_news_items','version','2015111600'),(390,'block_online_users','version','2015111600'),(391,'block_participants','version','2015111600'),(392,'block_private_files','version','2015111600'),(393,'block_quiz_results','version','2015111600'),(395,'block_recent_activity','version','2015111600'),(396,'block_rss_client','version','2015111600'),(397,'block_search_forums','version','2015111600'),(398,'block_section_links','version','2015111600'),(399,'block_selfcompletion','version','2015111600'),(400,'block_settings','version','2015111600'),(401,'block_site_main_menu','version','2015111600'),(402,'block_social_activities','version','2015111600'),(403,'block_tag_flickr','version','2015111600'),(404,'block_tag_youtube','version','2015111600'),(406,'block_tags','version','2015111600'),(407,'filter_activitynames','version','2015111600'),(409,'filter_algebra','version','2015111600'),(410,'filter_censor','version','2015111600'),(411,'filter_data','version','2015111600'),(413,'filter_emailprotect','version','2015111600'),(414,'filter_emoticon','version','2015111600'),(415,'filter_glossary','version','2015111600'),(417,'filter_mathjaxloader','version','2015111600'),(419,'filter_mediaplugin','version','2015111600'),(421,'filter_multilang','version','2015111600'),(422,'filter_tex','version','2015111600'),(424,'filter_tidy','version','2015111600'),(425,'filter_urltolink','version','2015111600'),(426,'editor_atto','version','2015111600'),(428,'editor_textarea','version','2015111600'),(429,'editor_tinymce','version','2015111600'),(430,'format_singleactivity','version','2015111600'),(431,'format_social','version','2015111600'),(432,'format_topics','version','2015111600'),(433,'format_weeks','version','2015111600'),(434,'profilefield_checkbox','version','2015111600'),(435,'profilefield_datetime','version','2015111600'),(436,'profilefield_menu','version','2015111600'),(437,'profilefield_text','version','2015111600'),(438,'profilefield_textarea','version','2015111600'),(439,'report_backups','version','2015111600'),(440,'report_completion','version','2015111600'),(442,'report_configlog','version','2015111600'),(443,'report_courseoverview','version','2015111600'),(444,'report_eventlist','version','2015111600'),(445,'report_log','version','2015111600'),(447,'report_loglive','version','2015111600'),(448,'report_outline','version','2015111600'),(450,'report_participation','version','2015111600'),(452,'report_performance','version','2015111600'),(453,'report_progress','version','2015111600'),(455,'report_questioninstances','version','2015111600'),(456,'report_security','version','2015111600'),(457,'report_stats','version','2015111600'),(459,'report_usersessions','version','2015111600'),(460,'gradeexport_ods','version','2015111600'),(461,'gradeexport_txt','version','2015111600'),(462,'gradeexport_xls','version','2015111600'),(463,'gradeexport_xml','version','2015111600'),(464,'gradeimport_csv','version','2015111600'),(465,'gradeimport_direct','version','2015111600'),(466,'gradeimport_xml','version','2015111600'),(467,'gradereport_grader','version','2015111600'),(468,'gradereport_history','version','2015111600'),(469,'gradereport_outcomes','version','2015111600'),(470,'gradereport_overview','version','2015111600'),(471,'gradereport_singleview','version','2015111600'),(472,'gradereport_user','version','2015111600'),(473,'gradingform_guide','version','2015111601'),(474,'gradingform_rubric','version','2015111600'),(475,'mnetservice_enrol','version','2015111600'),(476,'webservice_amf','version','2015111600'),(477,'webservice_rest','version','2015111600'),(478,'webservice_soap','version','2015111600'),(479,'webservice_xmlrpc','version','2015111600'),(480,'repository_alfresco','version','2015111600'),(481,'repository_areafiles','version','2015111600'),(483,'areafiles','enablecourseinstances','0'),(484,'areafiles','enableuserinstances','0'),(485,'repository_boxnet','version','2015111600'),(486,'repository_coursefiles','version','2015111600'),(487,'repository_dropbox','version','2015111601'),(488,'repository_equella','version','2015111600'),(489,'repository_filesystem','version','2015111600'),(490,'repository_flickr','version','2015111600'),(491,'repository_flickr_public','version','2015111600'),(492,'repository_googledocs','version','2015111600'),(493,'repository_local','version','2015111600'),(495,'local','enablecourseinstances','0'),(496,'local','enableuserinstances','0'),(497,'repository_merlot','version','2015111600'),(498,'repository_picasa','version','2015111600'),(499,'repository_recent','version','2015111600'),(501,'recent','enablecourseinstances','0'),(502,'recent','enableuserinstances','0'),(503,'repository_s3','version','2015111600'),(504,'repository_skydrive','version','2015111600'),(505,'repository_upload','version','2015111600'),(507,'upload','enablecourseinstances','0'),(508,'upload','enableuserinstances','0'),(509,'repository_url','version','2015111600'),(511,'url','enablecourseinstances','0'),(512,'url','enableuserinstances','0'),(513,'repository_user','version','2015111600'),(515,'user','enablecourseinstances','0'),(516,'user','enableuserinstances','0'),(517,'repository_webdav','version','2015111600'),(518,'repository_wikimedia','version','2015111600'),(520,'wikimedia','enablecourseinstances','0'),(521,'wikimedia','enableuserinstances','0'),(522,'repository_youtube','version','2015111600'),(524,'portfolio_boxnet','version','2015111600'),(525,'portfolio_download','version','2015111600'),(526,'portfolio_flickr','version','2015111600'),(527,'portfolio_googledocs','version','2015111600'),(528,'portfolio_mahara','version','2015111600'),(529,'portfolio_picasa','version','2015111600'),(530,'qbehaviour_adaptive','version','2015111600'),(531,'qbehaviour_adaptivenopenalty','version','2015111600'),(532,'qbehaviour_deferredcbm','version','2015111600'),(533,'qbehaviour_deferredfeedback','version','2015111600'),(534,'qbehaviour_immediatecbm','version','2015111600'),(535,'qbehaviour_immediatefeedback','version','2015111600'),(536,'qbehaviour_informationitem','version','2015111600'),(537,'qbehaviour_interactive','version','2015111600'),(538,'qbehaviour_interactivecountback','version','2015111600'),(539,'qbehaviour_manualgraded','version','2015111600'),(541,'question','disabledbehaviours','manualgraded'),(542,'qbehaviour_missing','version','2015111600'),(543,'qformat_aiken','version','2015111600'),(544,'qformat_blackboard_six','version','2015111600'),(545,'qformat_examview','version','2015111600'),(546,'qformat_gift','version','2015111600'),(547,'qformat_missingword','version','2015111600'),(548,'qformat_multianswer','version','2015111600'),(549,'qformat_webct','version','2015111600'),(550,'qformat_xhtml','version','2015111600'),(551,'qformat_xml','version','2015111600'),(552,'tool_assignmentupgrade','version','2015111600'),(553,'tool_availabilityconditions','version','2015111600'),(554,'tool_behat','version','2015111600'),(555,'tool_capability','version','2015111600'),(556,'tool_customlang','version','2015111600'),(558,'tool_dbtransfer','version','2015111600'),(559,'tool_filetypes','version','2015111600'),(560,'tool_generator','version','2015111600'),(561,'tool_health','version','2015111600'),(562,'tool_innodb','version','2015111600'),(563,'tool_installaddon','version','2015111600'),(564,'tool_langimport','version','2015111600'),(565,'tool_log','version','2015111600'),(567,'tool_log','enabled_stores','logstore_standard'),(568,'tool_messageinbound','version','2015111600'),(569,'message','airnotifier_provider_tool_messageinbound_invalidrecipienthandler_permitted','permitted'),(570,'message','email_provider_tool_messageinbound_invalidrecipienthandler_permitted','permitted'),(571,'message','jabber_provider_tool_messageinbound_invalidrecipienthandler_permitted','permitted'),(572,'message','popup_provider_tool_messageinbound_invalidrecipienthandler_permitted','permitted'),(573,'message','message_provider_tool_messageinbound_invalidrecipienthandler_loggedin','email'),(574,'message','message_provider_tool_messageinbound_invalidrecipienthandler_loggedoff','email'),(575,'message','airnotifier_provider_tool_messageinbound_messageprocessingerror_permitted','permitted'),(576,'message','email_provider_tool_messageinbound_messageprocessingerror_permitted','permitted'),(577,'message','jabber_provider_tool_messageinbound_messageprocessingerror_permitted','permitted'),(578,'message','popup_provider_tool_messageinbound_messageprocessingerror_permitted','permitted'),(579,'message','message_provider_tool_messageinbound_messageprocessingerror_loggedin','email'),(580,'message','message_provider_tool_messageinbound_messageprocessingerror_loggedoff','email'),(581,'message','airnotifier_provider_tool_messageinbound_messageprocessingsuccess_permitted','permitted'),(582,'message','email_provider_tool_messageinbound_messageprocessingsuccess_permitted','permitted'),(583,'message','jabber_provider_tool_messageinbound_messageprocessingsuccess_permitted','permitted'),(584,'message','popup_provider_tool_messageinbound_messageprocessingsuccess_permitted','permitted'),(585,'message','message_provider_tool_messageinbound_messageprocessingsuccess_loggedin','email'),(586,'message','message_provider_tool_messageinbound_messageprocessingsuccess_loggedoff','email'),(587,'tool_monitor','version','2015111601'),(588,'message','airnotifier_provider_tool_monitor_notification_permitted','permitted'),(589,'message','email_provider_tool_monitor_notification_permitted','permitted'),(590,'message','jabber_provider_tool_monitor_notification_permitted','permitted'),(591,'message','popup_provider_tool_monitor_notification_permitted','permitted'),(592,'message','message_provider_tool_monitor_notification_loggedin','email'),(593,'message','message_provider_tool_monitor_notification_loggedoff','email'),(594,'tool_multilangupgrade','version','2015111600'),(595,'tool_phpunit','version','2015111600'),(596,'tool_profiling','version','2015111600'),(597,'tool_replace','version','2015111600'),(598,'tool_spamcleaner','version','2015111600'),(599,'tool_task','version','2015111600'),(600,'tool_templatelibrary','version','2015111600'),(601,'tool_unsuproles','version','2015111600'),(603,'tool_uploadcourse','version','2015111600'),(604,'tool_uploaduser','version','2015111600'),(605,'tool_xmldb','version','2015111600'),(606,'cachestore_file','version','2015111600'),(607,'cachestore_memcache','version','2015111600'),(608,'cachestore_memcached','version','2015111600'),(609,'cachestore_mongodb','version','2015111600'),(610,'cachestore_session','version','2015111600'),(611,'cachestore_static','version','2015111600'),(612,'cachelock_file','version','2015111600'),(613,'theme_base','version','2015111600'),(614,'theme_bootstrapbase','version','2015111600'),(615,'theme_canvas','version','2015111600'),(616,'theme_clean','version','2015111600'),(617,'theme_more','version','2015111600'),(619,'assignsubmission_comments','version','2015111600'),(621,'assignsubmission_file','sortorder','1'),(622,'assignsubmission_comments','sortorder','2'),(623,'assignsubmission_onlinetext','sortorder','0'),(624,'assignsubmission_file','version','2015111600'),(625,'assignsubmission_onlinetext','version','2015111600'),(627,'assignfeedback_comments','version','2015111600'),(629,'assignfeedback_comments','sortorder','0'),(630,'assignfeedback_editpdf','sortorder','1'),(631,'assignfeedback_file','sortorder','3'),(632,'assignfeedback_offline','sortorder','2'),(633,'assignfeedback_editpdf','version','2015111600'),(635,'assignfeedback_file','version','2015111600'),(637,'assignfeedback_offline','version','2015111600'),(638,'assignment_offline','version','2015111600'),(639,'assignment_online','version','2015111600'),(640,'assignment_upload','version','2015111600'),(641,'assignment_uploadsingle','version','2015111600'),(642,'booktool_exportimscp','version','2015111600'),(643,'booktool_importhtml','version','2015111600'),(644,'booktool_print','version','2015111600'),(645,'datafield_checkbox','version','2015111600'),(646,'datafield_date','version','2015111600'),(647,'datafield_file','version','2015111600'),(648,'datafield_latlong','version','2015111600'),(649,'datafield_menu','version','2015111600'),(650,'datafield_multimenu','version','2015111600'),(651,'datafield_number','version','2015111600'),(652,'datafield_picture','version','2015111600'),(653,'datafield_radiobutton','version','2015111600'),(654,'datafield_text','version','2015111600'),(655,'datafield_textarea','version','2015111600'),(656,'datafield_url','version','2015111600'),(657,'datapreset_imagegallery','version','2015111600'),(658,'ltiservice_memberships','version','2015111600'),(659,'ltiservice_profile','version','2015111600'),(660,'ltiservice_toolproxy','version','2015111600'),(661,'ltiservice_toolsettings','version','2015111601'),(662,'quiz_grading','version','2015111600'),(664,'quiz_overview','version','2015111600'),(666,'quiz_responses','version','2015111600'),(668,'quiz_statistics','version','2015111600'),(670,'quizaccess_delaybetweenattempts','version','2015111600'),(671,'quizaccess_ipaddress','version','2015111600'),(672,'quizaccess_numattempts','version','2015111600'),(673,'quizaccess_openclosedate','version','2015111600'),(674,'quizaccess_password','version','2015111600'),(675,'quizaccess_safebrowser','version','2015111600'),(676,'quizaccess_securewindow','version','2015111600'),(677,'quizaccess_timelimit','version','2015111600'),(678,'scormreport_basic','version','2015111600'),(679,'scormreport_graphs','version','2015111600'),(680,'scormreport_interactions','version','2015111600'),(681,'scormreport_objectives','version','2015111600'),(682,'workshopform_accumulative','version','2015111600'),(684,'workshopform_comments','version','2015111600'),(686,'workshopform_numerrors','version','2015111600'),(688,'workshopform_rubric','version','2015111600'),(690,'workshopallocation_manual','version','2015111600'),(691,'workshopallocation_random','version','2015111600'),(692,'workshopallocation_scheduled','version','2015111600'),(693,'workshopeval_best','version','2015111600'),(694,'atto_accessibilitychecker','version','2015111600'),(695,'atto_accessibilityhelper','version','2015111600'),(696,'atto_align','version','2015111600'),(697,'atto_backcolor','version','2015111600'),(698,'atto_bold','version','2015111600'),(699,'atto_charmap','version','2015111600'),(700,'atto_clear','version','2015111600'),(701,'atto_collapse','version','2015111600'),(702,'atto_emoticon','version','2015111600'),(703,'atto_equation','version','2015111600'),(704,'atto_fontcolor','version','2015111600'),(705,'atto_html','version','2015111600'),(706,'atto_image','version','2015111600'),(707,'atto_indent','version','2015111600'),(708,'atto_italic','version','2015111600'),(709,'atto_link','version','2015111600'),(710,'atto_managefiles','version','2015111600'),(711,'atto_media','version','2015111600'),(712,'atto_noautolink','version','2015111600'),(713,'atto_orderedlist','version','2015111600'),(714,'atto_rtl','version','2015111600'),(715,'atto_strike','version','2015111600'),(716,'atto_subscript','version','2015111600'),(717,'atto_superscript','version','2015111600'),(718,'atto_table','version','2015111600'),(719,'atto_title','version','2015111600'),(720,'atto_underline','version','2015111600'),(721,'atto_undo','version','2015111600'),(722,'atto_unorderedlist','version','2015111600'),(723,'tinymce_ctrlhelp','version','2015111600'),(724,'tinymce_managefiles','version','2015111600'),(725,'tinymce_moodleemoticon','version','2015111600'),(726,'tinymce_moodleimage','version','2015111600'),(727,'tinymce_moodlemedia','version','2015111600'),(728,'tinymce_moodlenolink','version','2015111600'),(729,'tinymce_pdw','version','2015111600'),(730,'tinymce_spellchecker','version','2015111600'),(732,'tinymce_wrap','version','2015111600'),(733,'logstore_database','version','2015111600'),(734,'logstore_legacy','version','2015111600'),(735,'logstore_standard','version','2015111601'),(736,'block_course_overview','defaultmaxcourses','10'),(737,'block_course_overview','forcedefaultmaxcourses','0'),(738,'block_course_overview','showchildren','0'),(739,'block_course_overview','showwelcomearea','0'),(740,'block_course_overview','showcategories','0'),(741,'block_section_links','numsections1','22'),(742,'block_section_links','incby1','2'),(743,'block_section_links','numsections2','40'),(744,'block_section_links','incby2','5'),(745,'block_tag_youtube','apikey',''),(746,'editor_atto','toolbar','collapse = collapse\nstyle1 = title, bold, italic\nlist = unorderedlist, orderedlist\nlinks = link\nfiles = image, media, managefiles\nstyle2 = underline, strike, subscript, superscript\nalign = align\nindent = indent\ninsert = equation, charmap, table, clear\nundo = undo\naccessibility = accessibilitychecker, accessibilityhelper\nother = html'),(747,'editor_atto','autosavefrequency','60'),(748,'atto_collapse','showgroups','5'),(749,'atto_equation','librarygroup1','\n\\cdot\n\\times\n\\ast\n\\div\n\\diamond\n\\pm\n\\mp\n\\oplus\n\\ominus\n\\otimes\n\\oslash\n\\odot\n\\circ\n\\bullet\n\\asymp\n\\equiv\n\\subseteq\n\\supseteq\n\\leq\n\\geq\n\\preceq\n\\succeq\n\\sim\n\\simeq\n\\approx\n\\subset\n\\supset\n\\ll\n\\gg\n\\prec\n\\succ\n\\infty\n\\in\n\\ni\n\\forall\n\\exists\n\\neq\n'),(750,'atto_equation','librarygroup2','\n\\leftarrow\n\\rightarrow\n\\uparrow\n\\downarrow\n\\leftrightarrow\n\\nearrow\n\\searrow\n\\swarrow\n\\nwarrow\n\\Leftarrow\n\\Rightarrow\n\\Uparrow\n\\Downarrow\n\\Leftrightarrow\n'),(751,'atto_equation','librarygroup3','\n\\alpha\n\\beta\n\\gamma\n\\delta\n\\epsilon\n\\zeta\n\\eta\n\\theta\n\\iota\n\\kappa\n\\lambda\n\\mu\n\\nu\n\\xi\n\\pi\n\\rho\n\\sigma\n\\tau\n\\upsilon\n\\phi\n\\chi\n\\psi\n\\omega\n\\Gamma\n\\Delta\n\\Theta\n\\Lambda\n\\Xi\n\\Pi\n\\Sigma\n\\Upsilon\n\\Phi\n\\Psi\n\\Omega\n'),(752,'atto_equation','librarygroup4','\n\\sum{a,b}\n\\sqrt[a]{b+c}\n\\int_{a}^{b}{c}\n\\iint_{a}^{b}{c}\n\\iiint_{a}^{b}{c}\n\\oint{a}\n(a)\n[a]\n\\lbrace{a}\\rbrace\n\\left| \\begin{matrix} a_1 & a_2 \\ a_3 & a_4 \\end{matrix} \\right|\n\\frac{a}{b+c}\n\\vec{a}\n\\binom {a} {b}\n{a \\brack b}\n{a \\brace b}\n'),(753,'atto_table','allowborders','0'),(754,'atto_table','allowbackgroundcolour','0'),(755,'atto_table','allowwidth','0'),(756,'editor_tinymce','customtoolbar','wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\n\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen'),(757,'editor_tinymce','fontselectlist','Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings'),(758,'editor_tinymce','customconfig',''),(759,'tinymce_moodleemoticon','requireemoticon','1'),(760,'tinymce_spellchecker','spellengine',''),(761,'tinymce_spellchecker','spelllanguagelist','+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv'),(762,'filter_emoticon','formats','1,4,0'),(763,'filter_mathjaxloader','httpurl','http://cdn.mathjax.org/mathjax/2.5-latest/MathJax.js'),(764,'filter_mathjaxloader','httpsurl','https://cdn.mathjax.org/mathjax/2.5-latest/MathJax.js'),(765,'filter_mathjaxloader','texfiltercompatibility','0'),(766,'filter_mathjaxloader','mathjaxconfig','\nMathJax.Hub.Config({\n    config: [\"Accessible.js\", \"Safe.js\"],\n    errorSettings: { message: [\"!\"] },\n    skipStartupTypeset: true,\n    messageStyle: \"none\"\n});\n'),(767,'filter_mathjaxloader','additionaldelimiters',''),(768,'filter_tex','latexpreamble','\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n'),(769,'filter_tex','latexbackground','#FFFFFF'),(770,'filter_tex','density','120'),(771,'filter_tex','pathlatex','/usr/bin/latex'),(772,'filter_tex','pathdvips','/usr/bin/dvips'),(773,'filter_tex','pathconvert','/usr/bin/convert'),(774,'filter_tex','pathdvisvgm','/usr/bin/dvisvgm'),(775,'filter_tex','pathmimetex',''),(776,'filter_tex','convertformat','gif'),(777,'filter_urltolink','formats','0'),(778,'filter_urltolink','embedimages','1'),(779,'format_singleactivity','activitytype','forum'),(780,'logstore_database','dbdriver',''),(781,'logstore_database','dbhost',''),(782,'logstore_database','dbuser',''),(783,'logstore_database','dbpass',''),(784,'logstore_database','dbname',''),(785,'logstore_database','dbtable',''),(786,'logstore_database','dbpersist','0'),(787,'logstore_database','dbsocket',''),(788,'logstore_database','dbport',''),(789,'logstore_database','dbschema',''),(790,'logstore_database','dbcollation',''),(791,'logstore_database','buffersize','50'),(792,'logstore_database','logguests','0'),(793,'logstore_database','includelevels','1,2,0'),(794,'logstore_database','includeactions','c,r,u,d'),(795,'logstore_legacy','loglegacy','0'),(796,'logstore_standard','logguests','1'),(797,'logstore_standard','loglifetime','0'),(798,'logstore_standard','buffersize','50'),(799,'enrol_cohort','roleid','5'),(800,'enrol_cohort','unenrolaction','0'),(801,'enrol_database','dbtype',''),(802,'enrol_database','dbhost','localhost'),(803,'enrol_database','dbuser',''),(804,'enrol_database','dbpass',''),(805,'enrol_database','dbname',''),(806,'enrol_database','dbencoding','utf-8'),(807,'enrol_database','dbsetupsql',''),(808,'enrol_database','dbsybasequoting','0'),(809,'enrol_database','debugdb','0'),(810,'enrol_database','localcoursefield','idnumber'),(811,'enrol_database','localuserfield','idnumber'),(812,'enrol_database','localrolefield','shortname'),(813,'enrol_database','localcategoryfield','id'),(814,'enrol_database','remoteenroltable',''),(815,'enrol_database','remotecoursefield',''),(816,'enrol_database','remoteuserfield',''),(817,'enrol_database','remoterolefield',''),(818,'enrol_database','remoteotheruserfield',''),(819,'enrol_database','defaultrole','5'),(820,'enrol_database','ignorehiddencourses','0'),(821,'enrol_database','unenrolaction','0'),(822,'enrol_database','newcoursetable',''),(823,'enrol_database','newcoursefullname','fullname'),(824,'enrol_database','newcourseshortname','shortname'),(825,'enrol_database','newcourseidnumber','idnumber'),(826,'enrol_database','newcoursecategory',''),(827,'enrol_database','defaultcategory','1'),(828,'enrol_database','templatecourse',''),(829,'enrol_flatfile','location',''),(830,'enrol_flatfile','encoding','UTF-8'),(831,'enrol_flatfile','mailstudents','0'),(832,'enrol_flatfile','mailteachers','0'),(833,'enrol_flatfile','mailadmins','0'),(834,'enrol_flatfile','unenrolaction','3'),(835,'enrol_flatfile','expiredaction','3'),(836,'enrol_guest','requirepassword','0'),(837,'enrol_guest','usepasswordpolicy','0'),(838,'enrol_guest','showhint','0'),(839,'enrol_guest','defaultenrol','1'),(840,'enrol_guest','status','1'),(841,'enrol_guest','status_adv',''),(842,'enrol_imsenterprise','imsfilelocation',''),(843,'enrol_imsenterprise','logtolocation',''),(844,'enrol_imsenterprise','mailadmins','0'),(845,'enrol_imsenterprise','createnewusers','0'),(846,'enrol_imsenterprise','imsdeleteusers','0'),(847,'enrol_imsenterprise','fixcaseusernames','0'),(848,'enrol_imsenterprise','fixcasepersonalnames','0'),(849,'enrol_imsenterprise','imssourcedidfallback','0'),(850,'enrol_imsenterprise','imsrolemap01','5'),(851,'enrol_imsenterprise','imsrolemap02','3'),(852,'enrol_imsenterprise','imsrolemap03','3'),(853,'enrol_imsenterprise','imsrolemap04','5'),(854,'enrol_imsenterprise','imsrolemap05','0'),(855,'enrol_imsenterprise','imsrolemap06','4'),(856,'enrol_imsenterprise','imsrolemap07','0'),(857,'enrol_imsenterprise','imsrolemap08','4'),(858,'enrol_imsenterprise','truncatecoursecodes','0'),(859,'enrol_imsenterprise','createnewcourses','0'),(860,'enrol_imsenterprise','createnewcategories','0'),(861,'enrol_imsenterprise','imsunenrol','0'),(862,'enrol_imsenterprise','imscoursemapshortname','coursecode'),(863,'enrol_imsenterprise','imscoursemapfullname','short'),(864,'enrol_imsenterprise','imscoursemapsummary','ignore'),(865,'enrol_imsenterprise','imsrestricttarget',''),(866,'enrol_imsenterprise','imscapitafix','0'),(867,'enrol_ldap','host_url',''),(868,'enrol_ldap','start_tls','0'),(869,'enrol_ldap','ldap_version','3'),(870,'enrol_ldap','ldapencoding','utf-8'),(871,'enrol_ldap','pagesize','250'),(872,'enrol_ldap','bind_dn',''),(873,'enrol_ldap','bind_pw',''),(874,'enrol_ldap','course_search_sub','0'),(875,'enrol_ldap','memberattribute_isdn','0'),(876,'enrol_ldap','user_contexts',''),(877,'enrol_ldap','user_search_sub','0'),(878,'enrol_ldap','user_type','default'),(879,'enrol_ldap','opt_deref','0'),(880,'enrol_ldap','idnumber_attribute',''),(881,'enrol_ldap','objectclass',''),(882,'enrol_ldap','course_idnumber',''),(883,'enrol_ldap','course_shortname',''),(884,'enrol_ldap','course_fullname',''),(885,'enrol_ldap','course_summary',''),(886,'enrol_ldap','ignorehiddencourses','0'),(887,'enrol_ldap','unenrolaction','0'),(888,'enrol_ldap','autocreate','0'),(889,'enrol_ldap','category','1'),(890,'enrol_ldap','template',''),(891,'enrol_ldap','course_shortname_updateonsync','0'),(892,'enrol_ldap','course_fullname_updateonsync','0'),(893,'enrol_ldap','course_summary_updateonsync','0'),(894,'enrol_ldap','nested_groups','0'),(895,'enrol_ldap','group_memberofattribute',''),(896,'enrol_manual','expiredaction','1'),(897,'enrol_manual','expirynotifyhour','6'),(898,'enrol_manual','defaultenrol','1'),(899,'enrol_manual','status','0'),(900,'enrol_manual','roleid','5'),(901,'enrol_manual','enrolstart','4'),(902,'enrol_manual','enrolperiod','0'),(903,'enrol_manual','expirynotify','0'),(904,'enrol_manual','expirythreshold','86400'),(905,'enrol_meta','nosyncroleids',''),(906,'enrol_meta','syncall','1'),(907,'enrol_meta','unenrolaction','3'),(908,'enrol_meta','coursesort','sortorder'),(909,'enrol_mnet','roleid','5'),(910,'enrol_mnet','roleid_adv','1'),(911,'enrol_paypal','paypalbusiness',''),(912,'enrol_paypal','mailstudents','0'),(913,'enrol_paypal','mailteachers','0'),(914,'enrol_paypal','mailadmins','0'),(915,'enrol_paypal','expiredaction','3'),(916,'enrol_paypal','status','1'),(917,'enrol_paypal','cost','0'),(918,'enrol_paypal','currency','USD'),(919,'enrol_paypal','roleid','5'),(920,'enrol_paypal','enrolperiod','0'),(921,'enrol_self','requirepassword','0'),(922,'enrol_self','usepasswordpolicy','0'),(923,'enrol_self','showhint','0'),(924,'enrol_self','expiredaction','1'),(925,'enrol_self','expirynotifyhour','6'),(926,'enrol_self','defaultenrol','1'),(927,'enrol_self','status','1'),(928,'enrol_self','newenrols','1'),(929,'enrol_self','groupkey','0'),(930,'enrol_self','roleid','5'),(931,'enrol_self','enrolperiod','0'),(932,'enrol_self','expirynotify','0'),(933,'enrol_self','expirythreshold','86400'),(934,'enrol_self','longtimenosee','0'),(935,'enrol_self','maxenrolled','0'),(936,'enrol_self','sendcoursewelcomemessage','1'),(937,'assign','feedback_plugin_for_gradebook','assignfeedback_comments'),(938,'assign','showrecentsubmissions','0'),(939,'assign','submissionreceipts','1'),(940,'assign','submissionstatement','Confirmo que este trabajo es de elaboración propia, excepto aquellas partes en las que haya reconocido la autoría de la obra o parte de ella a otras personas.'),(941,'assign','alwaysshowdescription','1'),(942,'assign','alwaysshowdescription_adv',''),(943,'assign','alwaysshowdescription_locked',''),(944,'assign','allowsubmissionsfromdate','0'),(945,'assign','allowsubmissionsfromdate_enabled','1'),(946,'assign','allowsubmissionsfromdate_adv',''),(947,'assign','duedate','604800'),(948,'assign','duedate_enabled','1'),(949,'assign','duedate_adv',''),(950,'assign','cutoffdate','1209600'),(951,'assign','cutoffdate_enabled',''),(952,'assign','cutoffdate_adv',''),(953,'assign','submissiondrafts','0'),(954,'assign','submissiondrafts_adv',''),(955,'assign','submissiondrafts_locked',''),(956,'assign','requiresubmissionstatement','0'),(957,'assign','requiresubmissionstatement_adv',''),(958,'assign','requiresubmissionstatement_locked',''),(959,'assign','attemptreopenmethod','none'),(960,'assign','attemptreopenmethod_adv',''),(961,'assign','attemptreopenmethod_locked',''),(962,'assign','maxattempts','-1'),(963,'assign','maxattempts_adv',''),(964,'assign','maxattempts_locked',''),(965,'assign','teamsubmission','0'),(966,'assign','teamsubmission_adv',''),(967,'assign','teamsubmission_locked',''),(968,'assign','preventsubmissionnotingroup','0'),(969,'assign','preventsubmissionnotingroup_adv',''),(970,'assign','preventsubmissionnotingroup_locked',''),(971,'assign','requireallteammemberssubmit','0'),(972,'assign','requireallteammemberssubmit_adv',''),(973,'assign','requireallteammemberssubmit_locked',''),(974,'assign','teamsubmissiongroupingid',''),(975,'assign','teamsubmissiongroupingid_adv',''),(976,'assign','sendnotifications','0'),(977,'assign','sendnotifications_adv',''),(978,'assign','sendnotifications_locked',''),(979,'assign','sendlatenotifications','0'),(980,'assign','sendlatenotifications_adv',''),(981,'assign','sendlatenotifications_locked',''),(982,'assign','sendstudentnotifications','1'),(983,'assign','sendstudentnotifications_adv',''),(984,'assign','sendstudentnotifications_locked',''),(985,'assign','blindmarking','0'),(986,'assign','blindmarking_adv',''),(987,'assign','blindmarking_locked',''),(988,'assign','markingworkflow','0'),(989,'assign','markingworkflow_adv',''),(990,'assign','markingworkflow_locked',''),(991,'assign','markingallocation','0'),(992,'assign','markingallocation_adv',''),(993,'assign','markingallocation_locked',''),(994,'assignsubmission_file','default','1'),(995,'assignsubmission_file','maxfiles','20'),(996,'assignsubmission_file','maxbytes','1048576'),(997,'assignsubmission_onlinetext','default','0'),(998,'assignfeedback_comments','default','1'),(999,'assignfeedback_comments','inline','0'),(1000,'assignfeedback_comments','inline_adv',''),(1001,'assignfeedback_comments','inline_locked',''),(1002,'assignfeedback_editpdf','stamps',''),(1003,'assignfeedback_file','default','0'),(1004,'assignfeedback_offline','default','0'),(1005,'book','numberingoptions','0,1,2,3'),(1006,'book','navoptions','0,1,2'),(1007,'book','numbering','1'),(1008,'book','navstyle','1'),(1009,'folder','showexpanded','1'),(1010,'imscp','keepold','1'),(1011,'imscp','keepold_adv',''),(1012,'label','dndmedia','1'),(1013,'label','dndresizewidth','400'),(1014,'label','dndresizeheight','400'),(1015,'page','displayoptions','5'),(1016,'page','printheading','1'),(1017,'page','printintro','0'),(1018,'page','display','5'),(1019,'page','popupwidth','620'),(1020,'page','popupheight','450'),(1021,'quiz','timelimit','0'),(1022,'quiz','timelimit_adv',''),(1023,'quiz','overduehandling','autosubmit'),(1024,'quiz','overduehandling_adv',''),(1025,'quiz','graceperiod','86400'),(1026,'quiz','graceperiod_adv',''),(1027,'quiz','graceperiodmin','60'),(1028,'quiz','attempts','0'),(1029,'quiz','attempts_adv',''),(1030,'quiz','grademethod','1'),(1031,'quiz','grademethod_adv',''),(1032,'quiz','maximumgrade','10'),(1033,'quiz','questionsperpage','1'),(1034,'quiz','questionsperpage_adv',''),(1035,'quiz','navmethod','free'),(1036,'quiz','navmethod_adv','1'),(1037,'quiz','shuffleanswers','1'),(1038,'quiz','shuffleanswers_adv',''),(1039,'quiz','preferredbehaviour','deferredfeedback'),(1040,'quiz','canredoquestions','0'),(1041,'quiz','canredoquestions_adv','1'),(1042,'quiz','attemptonlast','0'),(1043,'quiz','attemptonlast_adv','1'),(1044,'quiz','reviewattempt','69904'),(1045,'quiz','reviewcorrectness','69904'),(1046,'quiz','reviewmarks','69904'),(1047,'quiz','reviewspecificfeedback','69904'),(1048,'quiz','reviewgeneralfeedback','69904'),(1049,'quiz','reviewrightanswer','69904'),(1050,'quiz','reviewoverallfeedback','4368'),(1051,'quiz','showuserpicture','0'),(1052,'quiz','showuserpicture_adv',''),(1053,'quiz','decimalpoints','2'),(1054,'quiz','decimalpoints_adv',''),(1055,'quiz','questiondecimalpoints','-1'),(1056,'quiz','questiondecimalpoints_adv','1'),(1057,'quiz','showblocks','0'),(1058,'quiz','showblocks_adv','1'),(1059,'quiz','password',''),(1060,'quiz','password_adv',''),(1061,'quiz','subnet',''),(1062,'quiz','subnet_adv','1'),(1063,'quiz','delay1','0'),(1064,'quiz','delay1_adv','1'),(1065,'quiz','delay2','0'),(1066,'quiz','delay2_adv','1'),(1067,'quiz','browsersecurity','-'),(1068,'quiz','browsersecurity_adv','1'),(1069,'quiz','initialnumfeedbacks','2'),(1070,'quiz','autosaveperiod','60'),(1071,'resource','framesize','130'),(1072,'resource','displayoptions','0,1,4,5,6'),(1073,'resource','printintro','1'),(1074,'resource','display','0'),(1075,'resource','showsize','0'),(1076,'resource','showtype','0'),(1077,'resource','showdate','0'),(1078,'resource','popupwidth','620'),(1079,'resource','popupheight','450'),(1080,'resource','filterfiles','0'),(1081,'scorm','displaycoursestructure','0'),(1082,'scorm','displaycoursestructure_adv',''),(1083,'scorm','popup','0'),(1084,'scorm','popup_adv',''),(1085,'scorm','displayactivityname','1'),(1086,'scorm','framewidth','100'),(1087,'scorm','framewidth_adv','1'),(1088,'scorm','frameheight','500'),(1089,'scorm','frameheight_adv','1'),(1090,'scorm','winoptgrp_adv','1'),(1091,'scorm','scrollbars','0'),(1092,'scorm','directories','0'),(1093,'scorm','location','0'),(1094,'scorm','menubar','0'),(1095,'scorm','toolbar','0'),(1096,'scorm','status','0'),(1097,'scorm','skipview','0'),(1098,'scorm','skipview_adv','1'),(1099,'scorm','hidebrowse','0'),(1100,'scorm','hidebrowse_adv','1'),(1101,'scorm','hidetoc','0'),(1102,'scorm','hidetoc_adv','1'),(1103,'scorm','nav','1'),(1104,'scorm','nav_adv','1'),(1105,'scorm','navpositionleft','-100'),(1106,'scorm','navpositionleft_adv','1'),(1107,'scorm','navpositiontop','-100'),(1108,'scorm','navpositiontop_adv','1'),(1109,'scorm','collapsetocwinsize','767'),(1110,'scorm','collapsetocwinsize_adv','1'),(1111,'scorm','displayattemptstatus','1'),(1112,'scorm','displayattemptstatus_adv',''),(1113,'scorm','grademethod','1'),(1114,'scorm','maxgrade','100'),(1115,'scorm','maxattempt','0'),(1116,'scorm','whatgrade','0'),(1117,'scorm','forcecompleted','0'),(1118,'scorm','forcenewattempt','0'),(1119,'scorm','autocommit','0'),(1120,'scorm','lastattemptlock','0'),(1121,'scorm','auto','0'),(1122,'scorm','updatefreq','0'),(1123,'scorm','scorm12standard','1'),(1124,'scorm','allowtypeexternal','0'),(1125,'scorm','allowtypelocalsync','0'),(1126,'scorm','allowtypeexternalaicc','0'),(1127,'scorm','allowaicchacp','0'),(1128,'scorm','aicchacptimeout','30'),(1129,'scorm','aicchacpkeepsessiondata','1'),(1130,'scorm','aiccuserid','1'),(1131,'scorm','forcejavascript','1'),(1132,'scorm','allowapidebug','0'),(1133,'scorm','apidebugmask','.*'),(1134,'scorm','protectpackagedownloads','0'),(1135,'url','framesize','130'),(1136,'url','secretphrase',''),(1137,'url','rolesinparams','0'),(1138,'url','displayoptions','0,1,5,6'),(1139,'url','printintro','1'),(1140,'url','display','0'),(1141,'url','popupwidth','620'),(1142,'url','popupheight','450'),(1143,'workshop','grade','80'),(1144,'workshop','gradinggrade','20'),(1145,'workshop','gradedecimals','0'),(1146,'workshop','maxbytes','0'),(1147,'workshop','strategy','accumulative'),(1148,'workshop','examplesmode','0'),(1149,'workshopallocation_random','numofreviews','5'),(1150,'workshopform_numerrors','grade0','No'),(1151,'workshopform_numerrors','grade1','Sí'),(1152,'workshopeval_best','comparison','5'),(1153,'core_plugin','recentfetch','1490792019'),(1154,'core_plugin','recentresponse','{\"status\":\"OK\",\"provider\":\"https:\\/\\/download.moodle.org\\/api\\/1.3\\/updates.php\",\"apiver\":\"1.3\",\"timegenerated\":1490792018,\"ticket\":\"JUM5JTkxNCVGOCUzQyVEMyUyQyUyQiVCMCU5NCVEQyVEMyVFMjElMTUlRTJKJTlDJTk5JUY5VDAlQ0VxdiVCRiVBQUNmJUZEJTI5WCU4OCUxRiUxQiU4NSU3QiU4RCU4OUw=\",\"forbranch\":\"3.0\",\"forversion\":\"2015111609\",\"updates\":{\"core\":[{\"version\":2015111609,\"release\":\"3.0.9 (Build: 20170313)\",\"branch\":\"3.0\",\"maturity\":200,\"url\":\"https:\\/\\/download.moodle.org\",\"download\":\"https:\\/\\/download.moodle.org\\/download.php\\/direct\\/stable30\\/moodle-3.0.9.zip\"},{\"version\":2016120502.02,\"release\":\"3.2.2+ (Build: 20170324)\",\"branch\":\"3.2\",\"maturity\":200,\"url\":\"https:\\/\\/download.moodle.org\",\"download\":\"https:\\/\\/download.moodle.org\\/download.php\\/direct\\/stable32\\/moodle-latest-32.zip\"},{\"version\":2016052305.02,\"release\":\"3.1.5+ (Build: 20170324)\",\"branch\":\"3.1\",\"maturity\":200,\"url\":\"https:\\/\\/download.moodle.org\",\"download\":\"https:\\/\\/download.moodle.org\\/download.php\\/direct\\/stable31\\/moodle-latest-31.zip\"},{\"version\":2017032400,\"release\":\"3.3dev (Build: 20170324)\",\"branch\":\"3.3\",\"maturity\":50,\"url\":\"https:\\/\\/download.moodle.org\",\"download\":\"https:\\/\\/download.moodle.org\\/download.php\\/direct\\/moodle\\/moodle-latest.zip\"}],\"theme_adaptable\":[{\"version\":\"2017012300\",\"release\":\"1.3.1.1\",\"maturity\":200,\"url\":\"https:\\/\\/moodle.org\\/plugins\\/pluginversion.php?id=13040\",\"download\":\"https:\\/\\/moodle.org\\/plugins\\/download.php\\/13040\\/theme_adaptable_moodle32_2017012300.zip\",\"downloadmd5\":\"195793f62c1ccddf7cd51fded966339e\"}]}}'),(1155,'theme_adaptable','version','2017012300'),(1156,'theme_adaptable','maincolor','#2C0041'),(1157,'theme_adaptable','backcolor','#f1f1f1'),(1158,'theme_adaptable','regionmaincolor','#fff'),(1159,'theme_adaptable','linkcolor','#510050'),(1160,'theme_adaptable','linkhover','#009688'),(1161,'theme_adaptable','selectiontext','#191f43'),(1162,'theme_adaptable','selectionbackground','#7d4996'),(1163,'theme_adaptable','loadingcolor','#fff'),(1164,'theme_adaptable','msgbadgecolor','#E53935'),(1165,'theme_adaptable','headerbkcolor','#7A004C'),(1166,'theme_adaptable','headertextcolor','#fff'),(1167,'theme_adaptable','headerbkcolor2','#f0f0f0'),(1168,'theme_adaptable','headertextcolor2','#000'),(1169,'theme_adaptable','menubkcolor','#ffffff'),(1170,'theme_adaptable','menufontcolor','#444444'),(1171,'theme_adaptable','menuhovercolor','#b2dfdb'),(1172,'theme_adaptable','menubordercolor','#444'),(1173,'theme_adaptable','mobilemenubkcolor','#F9F9F9'),(1174,'theme_adaptable','mobilemenufontcolor','#000000'),(1175,'theme_adaptable','marketblockbordercolor','#e8eaeb'),(1176,'theme_adaptable','marketblocksbackgroundcolor','transparent'),(1177,'theme_adaptable','rendereroverlaycolor','#009688'),(1178,'theme_adaptable','rendereroverlayfontcolor','#000'),(1179,'theme_adaptable','tilesbordercolor','#009688'),(1180,'theme_adaptable','covbkcolor','#009688'),(1181,'theme_adaptable','covfontcolor','#000'),(1182,'theme_adaptable','dividingline','#ffffff'),(1183,'theme_adaptable','dividingline2','#ffffff'),(1184,'theme_adaptable','navbarborder','#B7B3EF'),(1185,'theme_adaptable','navbarhover','#3C469C'),(1186,'theme_adaptable','breadcrumb','#53AE33'),(1187,'theme_adaptable','breadcrumbtextcolor','#444444'),(1188,'theme_adaptable','messagepopupbackground','#7d4996'),(1189,'theme_adaptable','messagepopupcolor','#333333'),(1190,'theme_adaptable','footerbkcolor','#424242'),(1191,'theme_adaptable','footertextcolor','#ffffff'),(1192,'theme_adaptable','footertextcolor2','#ffffff'),(1193,'theme_adaptable','footerlinkcolor','#ffffff'),(1194,'theme_adaptable','fontname','Open Sans'),(1195,'theme_adaptable','fontsubset',''),(1196,'theme_adaptable','fontsize','95%'),(1197,'theme_adaptable','fontweight','400'),(1198,'theme_adaptable','fontcolor','#333333'),(1199,'theme_adaptable','topmenufontsize','14px'),(1200,'theme_adaptable','menufontsize','14px'),(1201,'theme_adaptable','menufontpadding','20px'),(1202,'theme_adaptable','fontheadername','Roboto Slab'),(1203,'theme_adaptable','fontheaderweight','400'),(1204,'theme_adaptable','fontheadercolor','#333333'),(1205,'theme_adaptable','fonttitlename','Audiowide'),(1206,'theme_adaptable','fonttitlesize','48px'),(1207,'theme_adaptable','fonttitleweight','400'),(1208,'theme_adaptable','fonttitlecolor','#ffffff'),(1209,'theme_adaptable','fonttitlenamecourse','Audiowide'),(1210,'theme_adaptable','fonttitlesizecourse','48px'),(1211,'theme_adaptable','fonttitleweightcourse','400'),(1212,'theme_adaptable','fonttitlecolorcourse','#ffffff'),(1213,'theme_adaptable','fontblockheadersize','28px'),(1214,'theme_adaptable','fontblockheaderweight','400'),(1215,'theme_adaptable','fontblockheadercolor','#009688'),(1216,'theme_adaptable','buttonradius','5px'),(1217,'theme_adaptable','buttoncolor','#009688'),(1218,'theme_adaptable','buttonhovercolor','#00695c'),(1219,'theme_adaptable','buttontextcolor','#ffffff'),(1220,'theme_adaptable','editonbk','#4caf50'),(1221,'theme_adaptable','editoffbk','#f44336'),(1222,'theme_adaptable','editfont','#ffffff'),(1223,'theme_adaptable','editverticalpadding','4px'),(1224,'theme_adaptable','edithorizontalpadding','6px'),(1225,'theme_adaptable','edittopmargin','1px'),(1226,'theme_adaptable','buttonlogincolor','#ef5350'),(1227,'theme_adaptable','buttonloginhovercolor','#e53935'),(1228,'theme_adaptable','buttonlogintextcolor','#FFFFFF'),(1229,'theme_adaptable','buttonloginpadding','0px'),(1230,'theme_adaptable','buttonloginheight','24px'),(1231,'theme_adaptable','buttonloginmargintop','2px'),(1232,'theme_adaptable','frontpagelogin','1'),(1233,'theme_adaptable','displaylogin','button'),(1234,'theme_adaptable','enablemessagemenu','1'),(1235,'theme_adaptable','filteradminmessages',''),(1236,'theme_adaptable','logo','/ilernus.svg'),(1237,'theme_adaptable','favicon','/ico.ico'),(1238,'theme_adaptable','sitetitle','default'),(1239,'theme_adaptable','sitetitletext','<p>Aula virtual</p>'),(1240,'theme_adaptable','enableheading','fullname'),(1241,'theme_adaptable','sitetitlepaddingtop','0px'),(1242,'theme_adaptable','sitetitlepaddingleft','0px'),(1243,'theme_adaptable','sitetitlemaxwidth','50%'),(1244,'theme_adaptable','breadcrumbhome','icon'),(1245,'theme_adaptable','breadcrumbseparator','angle-right'),(1246,'theme_adaptable','socialorsearch','social'),(1247,'theme_adaptable','searchboxpaddingtop','16px'),(1248,'theme_adaptable','enablemenus',''),(1249,'theme_adaptable','disablemenuscoursepages',''),(1250,'theme_adaptable','menusession','1'),(1251,'theme_adaptable','menusessionttl','30'),(1252,'theme_adaptable','menuuseroverride',''),(1253,'theme_adaptable','menuoverrideprofilefield','topmenusettings'),(1254,'theme_adaptable','topmenuscount','1'),(1255,'theme_adaptable','newmenu1title','Menú 1'),(1256,'theme_adaptable','newmenu1',''),(1257,'theme_adaptable','newmenu1requirelogin',''),(1258,'theme_adaptable','newmenu1field',''),(1259,'theme_adaptable','hideinforum',''),(1260,'theme_adaptable','enablemy','1'),(1261,'theme_adaptable','enableprofile','1'),(1262,'theme_adaptable','enableeditprofile','1'),(1263,'theme_adaptable','enablecalendar','1'),(1264,'theme_adaptable','enableprivatefiles',''),(1265,'theme_adaptable','enablegrades','1'),(1266,'theme_adaptable','enablebadges',''),(1267,'theme_adaptable','enablepref','1'),(1268,'theme_adaptable','enablenote',''),(1269,'theme_adaptable','enableblog',''),(1270,'theme_adaptable','enableposts',''),(1271,'theme_adaptable','enablefeed',''),(1272,'theme_adaptable','socialsize','32px'),(1273,'theme_adaptable','socialsizemobile','22px'),(1274,'theme_adaptable','socialpaddingtop','1.8%'),(1275,'theme_adaptable','socialtarget','_self'),(1276,'theme_adaptable','socialiconlist',''),(1277,'theme_adaptable','enablehome','1'),(1278,'theme_adaptable','enablehomeredirect','1'),(1279,'theme_adaptable','enablemyhome','1'),(1280,'theme_adaptable','enableevents','1'),(1281,'theme_adaptable','enablemysites','excludehidden'),(1282,'theme_adaptable','mysitesmaxlength','30'),(1283,'theme_adaptable','mysitessortoverride','off'),(1284,'theme_adaptable','mysitessortoverridefield',''),(1285,'theme_adaptable','enablethiscourse','1'),(1286,'theme_adaptable','enablezoom','1'),(1287,'theme_adaptable','enableshowhideblocks','1'),(1288,'theme_adaptable','enablehelp',''),(1289,'theme_adaptable','helpprofilefield',''),(1290,'theme_adaptable','enablehelp2',''),(1291,'theme_adaptable','helpprofilefield2',''),(1292,'theme_adaptable','helptarget','_blank'),(1293,'theme_adaptable','disablecustommenu',''),(1294,'theme_adaptable','enabletoolsmenus','1'),(1295,'theme_adaptable','toolsmenuscount','1'),(1296,'theme_adaptable','toolsmenu1title','Herramientas'),(1297,'theme_adaptable','toolsmenu1',''),(1298,'theme_adaptable','toolsmenu1field',''),(1299,'theme_adaptable','blockicons','1'),(1300,'theme_adaptable','blockbackgroundcolor','#FFFFFF'),(1301,'theme_adaptable','blockheaderbackgroundcolor','#FFFFFF'),(1302,'theme_adaptable','blockbordercolor','#59585D'),(1303,'theme_adaptable','blocklinkcolor','#009688'),(1304,'theme_adaptable','blocklinkhovercolor','#009688'),(1305,'theme_adaptable','blockregionbackgroundcolor','transparent'),(1306,'theme_adaptable','blockheaderbordertopstyle','dashed'),(1307,'theme_adaptable','blockheadertopradius','0px'),(1308,'theme_adaptable','blockheaderbottomradius','0px'),(1309,'theme_adaptable','blockheaderbordertop','1px'),(1310,'theme_adaptable','blockheaderborderleft','0px'),(1311,'theme_adaptable','blockheaderborderright','0px'),(1312,'theme_adaptable','blockheaderborderbottom','0px'),(1313,'theme_adaptable','blockmainbordertopstyle','none'),(1314,'theme_adaptable','blockmaintopradius','0px'),(1315,'theme_adaptable','blockmainbottomradius','0px'),(1316,'theme_adaptable','blockmainbordertop','0px'),(1317,'theme_adaptable','blockmainborderleft','0px'),(1318,'theme_adaptable','blockmainborderright','0px'),(1319,'theme_adaptable','blockmainborderbottom','0px'),(1320,'theme_adaptable','frontpageblocksenabled','0'),(1321,'theme_adaptable','blocklayoutlayoutrow1','3-3-3-3'),(1322,'theme_adaptable','blocklayoutlayoutrow2','4-4-4-0'),(1323,'theme_adaptable','blocklayoutlayoutrow3','3-3-3-3'),(1324,'theme_adaptable','blocklayoutlayoutrow4','0-0-0-0'),(1325,'theme_adaptable','blocklayoutlayoutrow5','0-0-0-0'),(1326,'theme_adaptable','blocklayoutlayoutrow6','0-0-0-0'),(1327,'theme_adaptable','blocklayoutlayoutrow7','0-0-0-0'),(1328,'theme_adaptable','blocklayoutlayoutrow8','0-0-0-0'),(1329,'theme_adaptable','coursesectionheaderbg','#F3F3F3'),(1330,'theme_adaptable','sectionheadingcolor','#5f588a'),(1331,'theme_adaptable','currentcolor','#d9edf7'),(1332,'theme_adaptable','coursesectionheaderborderstyle','none'),(1333,'theme_adaptable','coursesectionheaderbordercolor','#F3F3F3'),(1334,'theme_adaptable','coursesectionheaderborderwidth','0px'),(1335,'theme_adaptable','coursesectionheaderborderradiustop','0px'),(1336,'theme_adaptable','coursesectionheaderborderradiusbottom','0px'),(1337,'theme_adaptable','coursesectionborderstyle','solid'),(1338,'theme_adaptable','coursesectionborderwidth','1px'),(1339,'theme_adaptable','coursesectionbordercolor','#e8eaeb'),(1340,'theme_adaptable','coursesectionborderradius','0px'),(1341,'theme_adaptable','infobox',''),(1342,'theme_adaptable','infobox2',''),(1343,'theme_adaptable','infoboxfullscreen',''),(1344,'theme_adaptable','frontpagemarketenabled',''),(1345,'theme_adaptable','frontpagemarketoption','covtiles'),(1346,'theme_adaptable','marketlayoutrow1','3-3-3-3'),(1347,'theme_adaptable','marketlayoutrow2','0-0-0-0'),(1348,'theme_adaptable','marketlayoutrow3','0-0-0-0'),(1349,'theme_adaptable','marketlayoutrow4','0-0-0-0'),(1350,'theme_adaptable','marketlayoutrow5','0-0-0-0'),(1351,'theme_adaptable','frontpagerenderer','2'),(1352,'theme_adaptable','frontpagerendererdefaultimage',''),(1353,'theme_adaptable','tilesshowcontacts','1'),(1354,'theme_adaptable','tilesshowallcontacts','0'),(1355,'theme_adaptable','tilescontactstitle','1'),(1356,'theme_adaptable','covhidebutton','0'),(1357,'theme_adaptable','enableavailablecourses','none'),(1358,'theme_adaptable','enableticker','1'),(1359,'theme_adaptable','enabletickermy','1'),(1360,'theme_adaptable','tickerwidth',''),(1361,'theme_adaptable','newstickercount','1'),(1362,'theme_adaptable','tickertext1',''),(1363,'theme_adaptable','tickertext1profilefield',''),(1364,'theme_adaptable','sliderenabled','0'),(1365,'theme_adaptable','sliderfullscreen','0'),(1366,'theme_adaptable','slidermargintop','20px'),(1367,'theme_adaptable','slidermarginbottom','20px'),(1368,'theme_adaptable','slideroption2','slider1'),(1369,'theme_adaptable','sliderh3color','#ffffff'),(1370,'theme_adaptable','sliderh4color','#ffffff'),(1371,'theme_adaptable','slidersubmitcolor','#ffffff'),(1372,'theme_adaptable','slidersubmitbgcolor','#009688'),(1373,'theme_adaptable','slidercount','3'),(1374,'theme_adaptable','p1',''),(1375,'theme_adaptable','p1url',''),(1376,'theme_adaptable','p1cap',''),(1377,'theme_adaptable','p2',''),(1378,'theme_adaptable','p2url',''),(1379,'theme_adaptable','p2cap',''),(1380,'theme_adaptable','p3',''),(1381,'theme_adaptable','p3url',''),(1382,'theme_adaptable','p3cap',''),(1383,'theme_adaptable','enablealerts',''),(1384,'theme_adaptable','enablealertcoursepages',''),(1385,'theme_adaptable','enablealertstriptags','1'),(1386,'theme_adaptable','alertcount','1'),(1387,'theme_adaptable','enablealert1',''),(1388,'theme_adaptable','alertkey1',''),(1389,'theme_adaptable','alerttext1',''),(1390,'theme_adaptable','alerttype1','info'),(1391,'theme_adaptable','alertaccess1','global'),(1392,'theme_adaptable','alertprofilefield1',''),(1393,'theme_adaptable','homebk',''),(1394,'theme_adaptable','blockside','0'),(1395,'theme_adaptable','viewselect','1'),(1396,'theme_adaptable','fullscreenwidth','98%'),(1397,'theme_adaptable','emoticonsize','16px'),(1398,'theme_adaptable','moodledocs','1'),(1399,'theme_adaptable','footerblocksplacement','1'),(1400,'theme_adaptable','showfooterblocks','1'),(1401,'theme_adaptable','footerlayoutrow1','3-3-3-3'),(1402,'theme_adaptable','footerlayoutrow2','0-0-0-0'),(1403,'theme_adaptable','footerlayoutrow3','0-0-0-0'),(1404,'theme_adaptable','footnote',''),(1405,'theme_adaptable','hidealertsmobile',', .customalert'),(1406,'theme_adaptable','hidesocialmobile',', .socialbox'),(1407,'theme_adaptable','socialboxpaddingtopmobile','10px'),(1408,'theme_adaptable','socialboxpaddingbottommobile','10px'),(1409,'theme_adaptable','hidecoursetitlemobile',', #coursetitle, #titlecontainer'),(1410,'theme_adaptable','hidelogomobile',', #logocontainer'),(1411,'theme_adaptable','hideheadermobile',', #page-header'),(1412,'theme_adaptable','hidebreadcrumbmobile',', .breadcrumb'),(1413,'theme_adaptable','hidepagefootermobile',', #page-footer'),(1414,'theme_adaptable','socialwallbackgroundcolor','#ffffff'),(1415,'theme_adaptable','socialwallbordercolor','#B9B9B9'),(1416,'theme_adaptable','socialwallbordertopstyle','solid'),(1417,'theme_adaptable','socialwallborderwidth','2px'),(1418,'theme_adaptable','socialwallsectionradius','6px'),(1419,'theme_adaptable','socialwallactionlinkcolor','#009688'),(1420,'theme_adaptable','socialwallactionlinkhovercolor','#009688'),(1421,'theme_adaptable','enableanalytics',''),(1422,'theme_adaptable','analyticscount','1'),(1423,'theme_adaptable','piwikenabled',''),(1424,'theme_adaptable','piwiksiteid','1'),(1425,'theme_adaptable','piwikimagetrack','1'),(1426,'theme_adaptable','piwiksiteurl',''),(1427,'theme_adaptable','piwiktrackadmin',''),(1428,'theme_adaptable','customcss',''),(1429,'theme_adaptable','jssection',''),(1430,'theme_adaptable','analyticstext1',''),(1431,'theme_adaptable','analyticsprofilefield1','');
/*!40000 ALTER TABLE `mdl_config_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_context`
--

DROP TABLE IF EXISTS `mdl_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_context` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  KEY `mdl_cont_ins_ix` (`instanceid`),
  KEY `mdl_cont_pat_ix` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='one of these must be set';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_context`
--

LOCK TABLES `mdl_context` WRITE;
/*!40000 ALTER TABLE `mdl_context` DISABLE KEYS */;
INSERT INTO `mdl_context` VALUES (1,10,0,'/1',1),(2,50,1,'/1/2',2),(3,40,1,'/1/3',2),(4,30,1,'/1/4',2),(5,30,2,'/1/5',2),(6,80,1,'/1/2/6',3),(7,80,2,'/1/2/7',3),(8,80,3,'/1/2/8',3),(9,80,4,'/1/9',2),(10,80,5,'/1/10',2),(11,80,6,'/1/11',2),(12,80,7,'/1/12',2),(13,80,8,'/1/13',2),(14,80,9,'/1/14',2),(15,80,10,'/1/15',2),(16,80,11,'/1/16',2),(17,80,12,'/1/17',2),(18,80,13,'/1/5/18',3),(19,80,14,'/1/5/19',3),(20,80,15,'/1/5/20',3),(21,80,16,'/1/5/21',3),(22,80,17,'/1/5/22',3),(23,80,18,'/1/5/23',3);
/*!40000 ALTER TABLE `mdl_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_context_temp`
--

DROP TABLE IF EXISTS `mdl_context_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_context_temp` (
  `id` bigint(10) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `depth` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used by build_context_path() in upgrade and cron to keep con';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_context_temp`
--

LOCK TABLES `mdl_context_temp` WRITE;
/*!40000 ALTER TABLE `mdl_context_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_context_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course`
--

DROP TABLE IF EXISTS `mdl_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `format` varchar(21) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) NOT NULL DEFAULT '1',
  `newsitems` mediumint(5) NOT NULL DEFAULT '1',
  `startdate` bigint(10) NOT NULL DEFAULT '0',
  `marker` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `showreports` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `calendartype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) NOT NULL DEFAULT '0',
  `cacherev` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cour_cat_ix` (`category`),
  KEY `mdl_cour_idn_ix` (`idnumber`),
  KEY `mdl_cour_sho_ix` (`shortname`),
  KEY `mdl_cour_sor_ix` (`sortorder`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Central course table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course`
--

LOCK TABLES `mdl_course` WRITE;
/*!40000 ALTER TABLE `mdl_course` DISABLE KEYS */;
INSERT INTO `mdl_course` VALUES (1,0,0,'Aulas virtuales','Aulas virtuales','','<p>clases online las 24 horas</p>',0,'site',1,3,0,0,0,0,0,1,1,0,0,0,'','','',1490725893,1490726979,0,0,0,1490792027);
/*!40000 ALTER TABLE `mdl_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_categories`
--

DROP TABLE IF EXISTS `mdl_course_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `coursecount` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcate_par_ix` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_categories`
--

LOCK TABLES `mdl_course_categories` WRITE;
/*!40000 ALTER TABLE `mdl_course_categories` DISABLE KEYS */;
INSERT INTO `mdl_course_categories` VALUES (1,'Miscelánea',NULL,NULL,0,0,10000,0,1,1,1490725893,1,'/1',NULL);
/*!40000 ALTER TABLE `mdl_course_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completion_aggr_methd`
--

DROP TABLE IF EXISTS `mdl_course_completion_aggr_methd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completion_aggr_methd` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompaggrmeth_coucr_uix` (`course`,`criteriatype`),
  KEY `mdl_courcompaggrmeth_cou_ix` (`course`),
  KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion aggregation methods for criteria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completion_aggr_methd`
--

LOCK TABLES `mdl_course_completion_aggr_methd` WRITE;
/*!40000 ALTER TABLE `mdl_course_completion_aggr_methd` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completion_aggr_methd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completion_crit_compl`
--

DROP TABLE IF EXISTS `mdl_course_completion_crit_compl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completion_crit_compl` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) DEFAULT NULL,
  `timecompleted` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompcritcomp_useco_uix` (`userid`,`course`,`criteriaid`),
  KEY `mdl_courcompcritcomp_use_ix` (`userid`),
  KEY `mdl_courcompcritcomp_cou_ix` (`course`),
  KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`),
  KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion user records';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completion_crit_compl`
--

LOCK TABLES `mdl_course_completion_crit_compl` WRITE;
/*!40000 ALTER TABLE `mdl_course_completion_crit_compl` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completion_crit_compl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completion_criteria`
--

DROP TABLE IF EXISTS `mdl_course_completion_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completion_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `moduleinstance` bigint(10) DEFAULT NULL,
  `courseinstance` bigint(10) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT NULL,
  `timeend` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompcrit_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion criteria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completion_criteria`
--

LOCK TABLES `mdl_course_completion_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_course_completion_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completion_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completions`
--

DROP TABLE IF EXISTS `mdl_course_completions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `timeenrolled` bigint(10) NOT NULL DEFAULT '0',
  `timestarted` bigint(10) NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) DEFAULT NULL,
  `reaggregate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcomp_usecou_uix` (`userid`,`course`),
  KEY `mdl_courcomp_use_ix` (`userid`),
  KEY `mdl_courcomp_cou_ix` (`course`),
  KEY `mdl_courcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion records';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completions`
--

LOCK TABLES `mdl_course_completions` WRITE;
/*!40000 ALTER TABLE `mdl_course_completions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_format_options`
--

DROP TABLE IF EXISTS `mdl_course_format_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_format_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `format` varchar(21) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sectionid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courformopti_couforsec_uix` (`courseid`,`format`,`sectionid`,`name`),
  KEY `mdl_courformopti_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores format-specific options for the course or course sect';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_format_options`
--

LOCK TABLES `mdl_course_format_options` WRITE;
/*!40000 ALTER TABLE `mdl_course_format_options` DISABLE KEYS */;
INSERT INTO `mdl_course_format_options` VALUES (1,1,'site',0,'numsections','1');
/*!40000 ALTER TABLE `mdl_course_format_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_modules`
--

DROP TABLE IF EXISTS `mdl_course_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` bigint(10) NOT NULL DEFAULT '0',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added` bigint(10) NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) DEFAULT NULL,
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) NOT NULL DEFAULT '0',
  `showdescription` tinyint(1) NOT NULL DEFAULT '0',
  `availability` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_courmodu_vis_ix` (`visible`),
  KEY `mdl_courmodu_cou_ix` (`course`),
  KEY `mdl_courmodu_mod_ix` (`module`),
  KEY `mdl_courmodu_ins_ix` (`instance`),
  KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`),
  KEY `mdl_courmodu_gro_ix` (`groupingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='course_modules table retrofitted from MySQL';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_modules`
--

LOCK TABLES `mdl_course_modules` WRITE;
/*!40000 ALTER TABLE `mdl_course_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_modules_completion`
--

DROP TABLE IF EXISTS `mdl_course_modules_completion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_modules_completion` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `completionstate` tinyint(1) NOT NULL,
  `viewed` tinyint(1) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`),
  KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the completion state (completed or not completed, etc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_modules_completion`
--

LOCK TABLES `mdl_course_modules_completion` WRITE;
/*!40000 ALTER TABLE `mdl_course_modules_completion` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_modules_completion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_published`
--

DROP TABLE IF EXISTS `mdl_course_published`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_published` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `huburl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `timepublished` bigint(10) NOT NULL,
  `enrollable` tinyint(1) NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `timechecked` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about how and when an local courses were publish';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_published`
--

LOCK TABLES `mdl_course_published` WRITE;
/*!40000 ALTER TABLE `mdl_course_published` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_published` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_request`
--

DROP TABLE IF EXISTS `mdl_course_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_request` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `category` bigint(10) NOT NULL DEFAULT '0',
  `reason` longtext COLLATE utf8_unicode_ci NOT NULL,
  `requester` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courrequ_sho_ix` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='course requests';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_request`
--

LOCK TABLES `mdl_course_request` WRITE;
/*!40000 ALTER TABLE `mdl_course_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_sections`
--

DROP TABLE IF EXISTS `mdl_course_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_sections` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` longtext COLLATE utf8_unicode_ci,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `sequence` longtext COLLATE utf8_unicode_ci,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `availability` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_coursect_cousec_uix` (`course`,`section`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to define the sections for each course';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_sections`
--

LOCK TABLES `mdl_course_sections` WRITE;
/*!40000 ALTER TABLE `mdl_course_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data`
--

DROP TABLE IF EXISTS `mdl_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `comments` smallint(4) NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) NOT NULL DEFAULT '0',
  `requiredentries` int(8) NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) NOT NULL DEFAULT '0',
  `maxentries` int(8) NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) NOT NULL DEFAULT '0',
  `singletemplate` longtext COLLATE utf8_unicode_ci,
  `listtemplate` longtext COLLATE utf8_unicode_ci,
  `listtemplateheader` longtext COLLATE utf8_unicode_ci,
  `listtemplatefooter` longtext COLLATE utf8_unicode_ci,
  `addtemplate` longtext COLLATE utf8_unicode_ci,
  `rsstemplate` longtext COLLATE utf8_unicode_ci,
  `rsstitletemplate` longtext COLLATE utf8_unicode_ci,
  `csstemplate` longtext COLLATE utf8_unicode_ci,
  `jstemplate` longtext COLLATE utf8_unicode_ci,
  `asearchtemplate` longtext COLLATE utf8_unicode_ci,
  `approval` smallint(4) NOT NULL DEFAULT '0',
  `manageapproved` smallint(4) NOT NULL DEFAULT '1',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) NOT NULL DEFAULT '0',
  `editany` smallint(4) NOT NULL DEFAULT '0',
  `notification` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_data_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all database activities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data`
--

LOCK TABLES `mdl_data` WRITE;
/*!40000 ALTER TABLE `mdl_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_content`
--

DROP TABLE IF EXISTS `mdl_data_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data_content` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `recordid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `content1` longtext COLLATE utf8_unicode_ci,
  `content2` longtext COLLATE utf8_unicode_ci,
  `content3` longtext COLLATE utf8_unicode_ci,
  `content4` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_datacont_rec_ix` (`recordid`),
  KEY `mdl_datacont_fie_ix` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the content introduced in each record/fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data_content`
--

LOCK TABLES `mdl_data_content` WRITE;
/*!40000 ALTER TABLE `mdl_data_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_fields`
--

DROP TABLE IF EXISTS `mdl_data_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `param1` longtext COLLATE utf8_unicode_ci,
  `param2` longtext COLLATE utf8_unicode_ci,
  `param3` longtext COLLATE utf8_unicode_ci,
  `param4` longtext COLLATE utf8_unicode_ci,
  `param5` longtext COLLATE utf8_unicode_ci,
  `param6` longtext COLLATE utf8_unicode_ci,
  `param7` longtext COLLATE utf8_unicode_ci,
  `param8` longtext COLLATE utf8_unicode_ci,
  `param9` longtext COLLATE utf8_unicode_ci,
  `param10` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`),
  KEY `mdl_datafiel_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='every field available';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data_fields`
--

LOCK TABLES `mdl_data_fields` WRITE;
/*!40000 ALTER TABLE `mdl_data_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_records`
--

DROP TABLE IF EXISTS `mdl_data_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data_records` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `approved` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_datareco_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='every record introduced';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data_records`
--

LOCK TABLES `mdl_data_records` WRITE;
/*!40000 ALTER TABLE `mdl_data_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_editor_atto_autosave`
--

DROP TABLE IF EXISTS `mdl_editor_atto_autosave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_editor_atto_autosave` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `elementid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `pagehash` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `drafttext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `draftid` bigint(10) DEFAULT NULL,
  `pageinstance` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_editattoauto_eleconuse_uix` (`elementid`,`contextid`,`userid`,`pagehash`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Draft text that is auto-saved every 5 seconds while an edito';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_editor_atto_autosave`
--

LOCK TABLES `mdl_editor_atto_autosave` WRITE;
/*!40000 ALTER TABLE `mdl_editor_atto_autosave` DISABLE KEYS */;
INSERT INTO `mdl_editor_atto_autosave` VALUES (1,'id_s_theme_clean_footnote',1,'312e4b3b66b16a0fc970620d3399e14692822561',2,'',-1,'yui_3_17_2_1_1490791914231_184',1490791914),(2,'id_s_theme_more_footnote',1,'a5d7e25118c957053666b1cae307f8f16f3a3387',2,'',-1,'yui_3_17_2_1_1490791557556_250',1490791558),(12,'id_s_theme_adaptable_sitetitletext',5,'10d618ae28118d1bde00fcda904d4e1cb2873a2d',2,'<p>Aula virtual</p>',NULL,'yui_3_17_2_1_1490792038976_732',1490792305),(13,'id_summary_editor',3,'fe94f82330900b1e022c6c6526c44316e343016d',2,'',495729027,'yui_3_17_2_1_1490792450285_335',1490792451);
/*!40000 ALTER TABLE `mdl_editor_atto_autosave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol`
--

DROP TABLE IF EXISTS `mdl_enrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `enrol` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT '0',
  `enrolstartdate` bigint(10) DEFAULT '0',
  `enrolenddate` bigint(10) DEFAULT '0',
  `expirynotify` tinyint(1) DEFAULT '0',
  `expirythreshold` bigint(10) DEFAULT '0',
  `notifyall` tinyint(1) DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleid` bigint(10) DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customint5` bigint(10) DEFAULT NULL,
  `customint6` bigint(10) DEFAULT NULL,
  `customint7` bigint(10) DEFAULT NULL,
  `customint8` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customchar2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customchar3` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext COLLATE utf8_unicode_ci,
  `customtext2` longtext COLLATE utf8_unicode_ci,
  `customtext3` longtext COLLATE utf8_unicode_ci,
  `customtext4` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enro_enr_ix` (`enrol`),
  KEY `mdl_enro_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Instances of enrolment plugins used in courses, fields marke';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol`
--

LOCK TABLES `mdl_enrol` WRITE;
/*!40000 ALTER TABLE `mdl_enrol` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_flatfile`
--

DROP TABLE IF EXISTS `mdl_enrol_flatfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_flatfile` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroflat_cou_ix` (`courseid`),
  KEY `mdl_enroflat_use_ix` (`userid`),
  KEY `mdl_enroflat_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='enrol_flatfile table retrofitted from MySQL';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_flatfile`
--

LOCK TABLES `mdl_enrol_flatfile` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_flatfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_flatfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_paypal`
--

DROP TABLE IF EXISTS `mdl_enrol_paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_paypal` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `business` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receiver_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receiver_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `memo` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_name1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_name2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pending_reason` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reason_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timeupdated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Holds all known information about PayPal transactions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_paypal`
--

LOCK TABLES `mdl_enrol_paypal` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_event`
--

DROP TABLE IF EXISTS `mdl_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_event` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `repeatid` bigint(10) NOT NULL DEFAULT '0',
  `modulename` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeduration` bigint(10) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sequence` bigint(10) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `subscriptionid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_even_cou_ix` (`courseid`),
  KEY `mdl_even_use_ix` (`userid`),
  KEY `mdl_even_tim_ix` (`timestart`),
  KEY `mdl_even_tim2_ix` (`timeduration`),
  KEY `mdl_even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For everything with a time associated to it';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_event`
--

LOCK TABLES `mdl_event` WRITE;
/*!40000 ALTER TABLE `mdl_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_event_subscriptions`
--

DROP TABLE IF EXISTS `mdl_event_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_event_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pollinterval` bigint(10) NOT NULL DEFAULT '0',
  `lastupdated` bigint(10) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks subscriptions to remote calendars.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_event_subscriptions`
--

LOCK TABLES `mdl_event_subscriptions` WRITE;
/*!40000 ALTER TABLE `mdl_event_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_event_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_events_handlers`
--

DROP TABLE IF EXISTS `mdl_events_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_events_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handlerfile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handlerfunction` longtext COLLATE utf8_unicode_ci,
  `schedule` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `internal` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table is for storing which components requests what typ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_events_handlers`
--

LOCK TABLES `mdl_events_handlers` WRITE;
/*!40000 ALTER TABLE `mdl_events_handlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_events_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_events_queue`
--

DROP TABLE IF EXISTS `mdl_events_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_events_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventdata` longtext COLLATE utf8_unicode_ci NOT NULL,
  `stackdump` longtext COLLATE utf8_unicode_ci,
  `userid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table is for storing queued events. It stores only one ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_events_queue`
--

LOCK TABLES `mdl_events_queue` WRITE;
/*!40000 ALTER TABLE `mdl_events_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_events_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_events_queue_handlers`
--

DROP TABLE IF EXISTS `mdl_events_queue_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_events_queue_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `queuedeventid` bigint(10) NOT NULL,
  `handlerid` bigint(10) NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  KEY `mdl_evenqueuhand_han_ix` (`handlerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This is the list of queued handlers for processing. The even';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_events_queue_handlers`
--

LOCK TABLES `mdl_events_queue_handlers` WRITE;
/*!40000 ALTER TABLE `mdl_events_queue_handlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_events_queue_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_functions`
--

DROP TABLE IF EXISTS `mdl_external_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `methodname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capabilities` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_extefunc_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='list of all external functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_functions`
--

LOCK TABLES `mdl_external_functions` WRITE;
/*!40000 ALTER TABLE `mdl_external_functions` DISABLE KEYS */;
INSERT INTO `mdl_external_functions` VALUES (1,'core_cohort_create_cohorts','core_cohort_external','create_cohorts','cohort/externallib.php','moodle','moodle/cohort:manage'),(2,'core_cohort_delete_cohorts','core_cohort_external','delete_cohorts','cohort/externallib.php','moodle','moodle/cohort:manage'),(3,'core_cohort_get_cohorts','core_cohort_external','get_cohorts','cohort/externallib.php','moodle','moodle/cohort:view'),(4,'core_cohort_update_cohorts','core_cohort_external','update_cohorts','cohort/externallib.php','moodle','moodle/cohort:manage'),(5,'core_cohort_add_cohort_members','core_cohort_external','add_cohort_members','cohort/externallib.php','moodle','moodle/cohort:assign'),(6,'core_cohort_delete_cohort_members','core_cohort_external','delete_cohort_members','cohort/externallib.php','moodle','moodle/cohort:assign'),(7,'core_cohort_get_cohort_members','core_cohort_external','get_cohort_members','cohort/externallib.php','moodle','moodle/cohort:view'),(8,'core_comment_get_comments','core_comment_external','get_comments',NULL,'moodle','moodle/comment:view'),(9,'core_grades_get_grades','core_grades_external','get_grades',NULL,'moodle','moodle/grade:view, moodle/grade:viewall, moodle/grade:viewhidden'),(10,'core_grades_update_grades','core_grades_external','update_grades',NULL,'moodle',''),(11,'moodle_group_create_groups','moodle_group_external','create_groups','group/externallib.php','moodle','moodle/course:managegroups'),(12,'core_group_create_groups','core_group_external','create_groups','group/externallib.php','moodle','moodle/course:managegroups'),(13,'moodle_group_get_groups','moodle_group_external','get_groups','group/externallib.php','moodle','moodle/course:managegroups'),(14,'core_group_get_groups','core_group_external','get_groups','group/externallib.php','moodle','moodle/course:managegroups'),(15,'moodle_group_get_course_groups','moodle_group_external','get_course_groups','group/externallib.php','moodle','moodle/course:managegroups'),(16,'core_group_get_course_groups','core_group_external','get_course_groups','group/externallib.php','moodle','moodle/course:managegroups'),(17,'moodle_group_delete_groups','moodle_group_external','delete_groups','group/externallib.php','moodle','moodle/course:managegroups'),(18,'core_group_delete_groups','core_group_external','delete_groups','group/externallib.php','moodle','moodle/course:managegroups'),(19,'moodle_group_get_groupmembers','moodle_group_external','get_groupmembers','group/externallib.php','moodle','moodle/course:managegroups'),(20,'core_group_get_group_members','core_group_external','get_group_members','group/externallib.php','moodle','moodle/course:managegroups'),(21,'moodle_group_add_groupmembers','moodle_group_external','add_groupmembers','group/externallib.php','moodle','moodle/course:managegroups'),(22,'core_group_add_group_members','core_group_external','add_group_members','group/externallib.php','moodle','moodle/course:managegroups'),(23,'moodle_group_delete_groupmembers','moodle_group_external','delete_groupmembers','group/externallib.php','moodle','moodle/course:managegroups'),(24,'core_group_delete_group_members','core_group_external','delete_group_members','group/externallib.php','moodle','moodle/course:managegroups'),(25,'core_group_create_groupings','core_group_external','create_groupings','group/externallib.php','moodle',''),(26,'core_group_update_groupings','core_group_external','update_groupings','group/externallib.php','moodle',''),(27,'core_group_get_groupings','core_group_external','get_groupings','group/externallib.php','moodle',''),(28,'core_group_get_course_groupings','core_group_external','get_course_groupings','group/externallib.php','moodle',''),(29,'core_group_delete_groupings','core_group_external','delete_groupings','group/externallib.php','moodle',''),(30,'core_group_assign_grouping','core_group_external','assign_grouping','group/externallib.php','moodle',''),(31,'core_group_unassign_grouping','core_group_external','unassign_grouping','group/externallib.php','moodle',''),(32,'core_group_get_course_user_groups','core_group_external','get_course_user_groups','group/externallib.php','moodle','moodle/course:managegroups'),(33,'core_group_get_activity_allowed_groups','core_group_external','get_activity_allowed_groups','group/externallib.php','moodle',''),(34,'core_group_get_activity_groupmode','core_group_external','get_activity_groupmode','group/externallib.php','moodle',''),(35,'core_notes_get_course_notes','core_notes_external','get_course_notes','notes/externallib.php','moodle','moodle/notes:view'),(36,'moodle_file_get_files','moodle_file_external','get_files','files/externallib.php','moodle',''),(37,'core_files_get_files','core_files_external','get_files','files/externallib.php','moodle',''),(38,'moodle_file_upload','moodle_file_external','upload','files/externallib.php','moodle',''),(39,'core_files_upload','core_files_external','upload','files/externallib.php','moodle',''),(40,'moodle_user_create_users','moodle_user_external','create_users','user/externallib.php','moodle','moodle/user:create'),(41,'core_user_create_users','core_user_external','create_users','user/externallib.php','moodle','moodle/user:create'),(42,'core_user_get_users','core_user_external','get_users','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),(43,'moodle_user_get_users_by_id','moodle_user_external','get_users_by_id','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),(44,'core_user_get_users_by_field','core_user_external','get_users_by_field','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),(45,'core_user_get_users_by_id','core_user_external','get_users_by_id','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),(46,'moodle_user_get_users_by_courseid','moodle_user_external','get_users_by_courseid','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),(47,'moodle_user_get_course_participants_by_id','moodle_user_external','get_course_participants_by_id','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),(48,'core_user_get_course_user_profiles','core_user_external','get_course_user_profiles','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),(49,'moodle_user_delete_users','moodle_user_external','delete_users','user/externallib.php','moodle','moodle/user:delete'),(50,'core_user_delete_users','core_user_external','delete_users','user/externallib.php','moodle','moodle/user:delete'),(51,'moodle_user_update_users','moodle_user_external','update_users','user/externallib.php','moodle','moodle/user:update'),(52,'core_user_update_users','core_user_external','update_users','user/externallib.php','moodle','moodle/user:update'),(53,'core_user_add_user_device','core_user_external','add_user_device','user/externallib.php','moodle',''),(54,'core_user_remove_user_device','core_user_external','remove_user_device','user/externallib.php','moodle',''),(55,'core_user_view_user_list','core_user_external','view_user_list','user/externallib.php','moodle','moodle/course:viewparticipants'),(56,'core_user_view_user_profile','core_user_external','view_user_profile','user/externallib.php','moodle','moodle/user:viewdetails'),(57,'core_user_add_user_private_files','core_user_external','add_user_private_files','user/externallib.php','moodle','moodle/user:manageownfiles'),(58,'core_enrol_get_enrolled_users_with_capability','core_enrol_external','get_enrolled_users_with_capability','enrol/externallib.php','moodle',''),(59,'moodle_enrol_get_enrolled_users','moodle_enrol_external','get_enrolled_users','enrol/externallib.php','moodle','moodle/site:viewparticipants, moodle/course:viewparticipants,\n            moodle/role:review, moodle/site:accessallgroups, moodle/course:enrolreview'),(60,'core_enrol_get_enrolled_users','core_enrol_external','get_enrolled_users','enrol/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),(61,'moodle_enrol_get_users_courses','moodle_enrol_external','get_users_courses','enrol/externallib.php','moodle','moodle/course:viewparticipants'),(62,'core_enrol_get_users_courses','core_enrol_external','get_users_courses','enrol/externallib.php','moodle','moodle/course:viewparticipants'),(63,'core_enrol_get_course_enrolment_methods','core_enrol_external','get_course_enrolment_methods','enrol/externallib.php','moodle',''),(64,'moodle_role_assign','moodle_enrol_external','role_assign','enrol/externallib.php','moodle','moodle/role:assign'),(65,'core_role_assign_roles','core_role_external','assign_roles','enrol/externallib.php','moodle','moodle/role:assign'),(66,'moodle_role_unassign','moodle_enrol_external','role_unassign','enrol/externallib.php','moodle','moodle/role:assign'),(67,'core_role_unassign_roles','core_role_external','unassign_roles','enrol/externallib.php','moodle','moodle/role:assign'),(68,'core_course_get_contents','core_course_external','get_course_contents','course/externallib.php','moodle','moodle/course:update,moodle/course:viewhiddencourses'),(69,'moodle_course_get_courses','moodle_course_external','get_courses','course/externallib.php','moodle','moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),(70,'core_course_get_courses','core_course_external','get_courses','course/externallib.php','moodle','moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),(71,'core_course_search_courses','core_course_external','search_courses','course/externallib.php','moodle',''),(72,'moodle_course_create_courses','moodle_course_external','create_courses','course/externallib.php','moodle','moodle/course:create,moodle/course:visibility'),(73,'core_course_create_courses','core_course_external','create_courses','course/externallib.php','moodle','moodle/course:create,moodle/course:visibility'),(74,'core_course_delete_courses','core_course_external','delete_courses','course/externallib.php','moodle','moodle/course:delete'),(75,'core_course_delete_modules','core_course_external','delete_modules','course/externallib.php','moodle','moodle/course:manageactivities'),(76,'core_course_duplicate_course','core_course_external','duplicate_course','course/externallib.php','moodle','moodle/backup:backupcourse,moodle/restore:restorecourse,moodle/course:create'),(77,'core_course_update_courses','core_course_external','update_courses','course/externallib.php','moodle','moodle/course:update,moodle/course:changecategory,moodle/course:changefullname,moodle/course:changeshortname,moodle/course:changeidnumber,moodle/course:changesummary,moodle/course:visibility'),(78,'core_course_view_course','core_course_external','view_course','course/externallib.php','moodle',''),(79,'core_course_get_course_module','core_course_external','get_course_module','course/externallib.php','moodle',''),(80,'core_course_get_course_module_by_instance','core_course_external','get_course_module_by_instance','course/externallib.php','moodle',''),(81,'core_course_get_categories','core_course_external','get_categories','course/externallib.php','moodle','moodle/category:viewhiddencategories'),(82,'core_course_create_categories','core_course_external','create_categories','course/externallib.php','moodle','moodle/category:manage'),(83,'core_course_update_categories','core_course_external','update_categories','course/externallib.php','moodle','moodle/category:manage'),(84,'core_course_delete_categories','core_course_external','delete_categories','course/externallib.php','moodle','moodle/category:manage'),(85,'core_course_import_course','core_course_external','import_course','course/externallib.php','moodle','moodle/backup:backuptargetimport, moodle/restore:restoretargetimport'),(86,'moodle_message_send_instantmessages','moodle_message_external','send_instantmessages','message/externallib.php','moodle','moodle/site:sendmessage'),(87,'core_message_send_instant_messages','core_message_external','send_instant_messages','message/externallib.php','moodle','moodle/site:sendmessage'),(88,'core_message_create_contacts','core_message_external','create_contacts','message/externallib.php','moodle',''),(89,'core_message_delete_contacts','core_message_external','delete_contacts','message/externallib.php','moodle',''),(90,'core_message_block_contacts','core_message_external','block_contacts','message/externallib.php','moodle',''),(91,'core_message_unblock_contacts','core_message_external','unblock_contacts','message/externallib.php','moodle',''),(92,'core_message_get_contacts','core_message_external','get_contacts','message/externallib.php','moodle',''),(93,'core_message_search_contacts','core_message_external','search_contacts','message/externallib.php','moodle',''),(94,'core_message_get_messages','core_message_external','get_messages','message/externallib.php','moodle',''),(95,'core_message_get_blocked_users','core_message_external','get_blocked_users','message/externallib.php','moodle',''),(96,'core_message_mark_message_read','core_message_external','mark_message_read','message/externallib.php','moodle',''),(97,'moodle_notes_create_notes','moodle_notes_external','create_notes','notes/externallib.php','moodle','moodle/notes:manage'),(98,'core_notes_create_notes','core_notes_external','create_notes','notes/externallib.php','moodle','moodle/notes:manage'),(99,'core_notes_delete_notes','core_notes_external','delete_notes','notes/externallib.php','moodle','moodle/notes:manage'),(100,'core_notes_get_notes','core_notes_external','get_notes','notes/externallib.php','moodle','moodle/notes:view'),(101,'core_notes_update_notes','core_notes_external','update_notes','notes/externallib.php','moodle','moodle/notes:manage'),(102,'core_notes_view_notes','core_notes_external','view_notes','notes/externallib.php','moodle','moodle/notes:view'),(103,'core_grading_get_definitions','core_grading_external','get_definitions',NULL,'moodle',''),(104,'core_grade_get_definitions','core_grade_external','get_definitions','grade/externallib.php','moodle',''),(105,'core_grading_save_definitions','core_grading_external','save_definitions',NULL,'moodle',''),(106,'core_grading_get_gradingform_instances','core_grading_external','get_gradingform_instances',NULL,'moodle',''),(107,'moodle_webservice_get_siteinfo','moodle_webservice_external','get_siteinfo','webservice/externallib.php','moodle',''),(108,'core_webservice_get_site_info','core_webservice_external','get_site_info','webservice/externallib.php','moodle',''),(109,'core_get_string','core_external','get_string','lib/external/externallib.php','moodle',''),(110,'core_get_strings','core_external','get_strings','lib/external/externallib.php','moodle',''),(111,'core_get_component_strings','core_external','get_component_strings','lib/external/externallib.php','moodle',''),(112,'core_calendar_delete_calendar_events','core_calendar_external','delete_calendar_events','calendar/externallib.php','moodle','moodle/calendar:manageentries'),(113,'core_calendar_get_calendar_events','core_calendar_external','get_calendar_events','calendar/externallib.php','moodle','moodle/calendar:manageentries'),(114,'core_calendar_create_calendar_events','core_calendar_external','create_calendar_events','calendar/externallib.php','moodle','moodle/calendar:manageentries'),(115,'core_output_load_template','core\\output\\external','load_template',NULL,'moodle',''),(116,'core_completion_update_activity_completion_status_manually','core_completion_external','update_activity_completion_status_manually',NULL,'moodle',''),(117,'core_completion_mark_course_self_completed','core_completion_external','mark_course_self_completed',NULL,'moodle',''),(118,'core_completion_get_activities_completion_status','core_completion_external','get_activities_completion_status',NULL,'moodle',''),(119,'core_completion_get_course_completion_status','core_completion_external','get_course_completion_status',NULL,'moodle','report/completion:view'),(120,'core_rating_get_item_ratings','core_rating_external','get_item_ratings',NULL,'moodle','moodle/rating:view'),(121,'core_tag_update_tags','core_tag_external','update_tags',NULL,'moodle',''),(122,'core_tag_get_tags','core_tag_external','get_tags',NULL,'moodle',''),(123,'mod_assign_copy_previous_attempt','mod_assign_external','copy_previous_attempt','mod/assign/externallib.php','mod_assign','mod/assign:view, mod/assign:submit'),(124,'mod_assign_get_grades','mod_assign_external','get_grades','mod/assign/externallib.php','mod_assign',''),(125,'mod_assign_get_assignments','mod_assign_external','get_assignments','mod/assign/externallib.php','mod_assign',''),(126,'mod_assign_get_submissions','mod_assign_external','get_submissions','mod/assign/externallib.php','mod_assign',''),(127,'mod_assign_get_user_flags','mod_assign_external','get_user_flags','mod/assign/externallib.php','mod_assign',''),(128,'mod_assign_set_user_flags','mod_assign_external','set_user_flags','mod/assign/externallib.php','mod_assign','mod/assign:grade'),(129,'mod_assign_get_user_mappings','mod_assign_external','get_user_mappings','mod/assign/externallib.php','mod_assign',''),(130,'mod_assign_revert_submissions_to_draft','mod_assign_external','revert_submissions_to_draft','mod/assign/externallib.php','mod_assign',''),(131,'mod_assign_lock_submissions','mod_assign_external','lock_submissions','mod/assign/externallib.php','mod_assign',''),(132,'mod_assign_unlock_submissions','mod_assign_external','unlock_submissions','mod/assign/externallib.php','mod_assign',''),(133,'mod_assign_save_submission','mod_assign_external','save_submission','mod/assign/externallib.php','mod_assign',''),(134,'mod_assign_submit_for_grading','mod_assign_external','submit_for_grading','mod/assign/externallib.php','mod_assign',''),(135,'mod_assign_save_grade','mod_assign_external','save_grade','mod/assign/externallib.php','mod_assign',''),(136,'mod_assign_save_grades','mod_assign_external','save_grades','mod/assign/externallib.php','mod_assign',''),(137,'mod_assign_save_user_extensions','mod_assign_external','save_user_extensions','mod/assign/externallib.php','mod_assign',''),(138,'mod_assign_reveal_identities','mod_assign_external','reveal_identities','mod/assign/externallib.php','mod_assign',''),(139,'mod_assign_view_grading_table','mod_assign_external','view_grading_table','mod/assign/externallib.php','mod_assign','mod/assign:view, mod/assign:viewgrades'),(140,'mod_book_view_book','mod_book_external','view_book',NULL,'mod_book','mod/book:read'),(141,'mod_book_get_books_by_courses','mod_book_external','get_books_by_courses',NULL,'mod_book',''),(142,'mod_chat_login_user','mod_chat_external','login_user',NULL,'mod_chat','mod/chat:chat'),(143,'mod_chat_get_chat_users','mod_chat_external','get_chat_users',NULL,'mod_chat','mod/chat:chat'),(144,'mod_chat_send_chat_message','mod_chat_external','send_chat_message',NULL,'mod_chat','mod/chat:chat'),(145,'mod_chat_get_chat_latest_messages','mod_chat_external','get_chat_latest_messages',NULL,'mod_chat','mod/chat:chat'),(146,'mod_chat_view_chat','mod_chat_external','view_chat',NULL,'mod_chat','mod/chat:chat'),(147,'mod_chat_get_chats_by_courses','mod_chat_external','get_chats_by_courses',NULL,'mod_chat',''),(148,'mod_choice_get_choice_results','mod_choice_external','get_choice_results',NULL,'mod_choice',''),(149,'mod_choice_get_choice_options','mod_choice_external','get_choice_options',NULL,'mod_choice','mod/choice:choose'),(150,'mod_choice_submit_choice_response','mod_choice_external','submit_choice_response',NULL,'mod_choice','mod/choice:choose'),(151,'mod_choice_view_choice','mod_choice_external','view_choice',NULL,'mod_choice',''),(152,'mod_choice_get_choices_by_courses','mod_choice_external','get_choices_by_courses',NULL,'mod_choice',''),(153,'mod_choice_delete_choice_responses','mod_choice_external','delete_choice_responses',NULL,'mod_choice','mod/choice:choose'),(154,'mod_data_get_databases_by_courses','mod_data_external','get_databases_by_courses',NULL,'mod_data','mod/data:viewentry'),(155,'mod_folder_view_folder','mod_folder_external','view_folder',NULL,'mod_folder','mod/folder:view'),(156,'mod_forum_get_forums_by_courses','mod_forum_external','get_forums_by_courses','mod/forum/externallib.php','mod_forum','mod/forum:viewdiscussion'),(157,'mod_forum_get_forum_discussions','mod_forum_external','get_forum_discussions','mod/forum/externallib.php','mod_forum','mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting'),(158,'mod_forum_get_forum_discussion_posts','mod_forum_external','get_forum_discussion_posts','mod/forum/externallib.php','mod_forum','mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting'),(159,'mod_forum_get_forum_discussions_paginated','mod_forum_external','get_forum_discussions_paginated','mod/forum/externallib.php','mod_forum','mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting'),(160,'mod_forum_view_forum','mod_forum_external','view_forum','mod/forum/externallib.php','mod_forum','mod/forum:viewdiscussion'),(161,'mod_forum_view_forum_discussion','mod_forum_external','view_forum_discussion','mod/forum/externallib.php','mod_forum','mod/forum:viewdiscussion'),(162,'mod_forum_add_discussion_post','mod_forum_external','add_discussion_post','mod/forum/externallib.php','mod_forum','mod/forum:replypost'),(163,'mod_forum_add_discussion','mod_forum_external','add_discussion','mod/forum/externallib.php','mod_forum','mod/forum:startdiscussion'),(164,'mod_imscp_view_imscp','mod_imscp_external','view_imscp',NULL,'mod_imscp','mod/imscp:view'),(165,'mod_imscp_get_imscps_by_courses','mod_imscp_external','get_imscps_by_courses',NULL,'mod_imscp','moodle/imscp:view'),(166,'mod_lti_get_tool_launch_data','mod_lti_external','get_tool_launch_data',NULL,'mod_lti','mod/lti:view'),(167,'mod_lti_get_ltis_by_courses','mod_lti_external','get_ltis_by_courses',NULL,'mod_lti','mod/lti:view'),(168,'mod_lti_view_lti','mod_lti_external','view_lti',NULL,'mod_lti','mod/lti:view'),(169,'mod_page_view_page','mod_page_external','view_page',NULL,'mod_page','mod/page:view'),(170,'mod_resource_view_resource','mod_resource_external','view_resource',NULL,'mod_resource','mod/resource:view'),(171,'mod_scorm_view_scorm','mod_scorm_external','view_scorm',NULL,'mod_scorm',''),(172,'mod_scorm_get_scorm_attempt_count','mod_scorm_external','get_scorm_attempt_count',NULL,'mod_scorm',''),(173,'mod_scorm_get_scorm_scoes','mod_scorm_external','get_scorm_scoes',NULL,'mod_scorm',''),(174,'mod_scorm_get_scorm_user_data','mod_scorm_external','get_scorm_user_data',NULL,'mod_scorm',''),(175,'mod_scorm_insert_scorm_tracks','mod_scorm_external','insert_scorm_tracks',NULL,'mod_scorm','mod/scorm:savetrack'),(176,'mod_scorm_get_scorm_sco_tracks','mod_scorm_external','get_scorm_sco_tracks',NULL,'mod_scorm',''),(177,'mod_scorm_get_scorms_by_courses','mod_scorm_external','get_scorms_by_courses',NULL,'mod_scorm',''),(178,'mod_survey_get_surveys_by_courses','mod_survey_external','get_surveys_by_courses',NULL,'mod_survey',''),(179,'mod_survey_view_survey','mod_survey_external','view_survey',NULL,'mod_survey','mod/survey:participate'),(180,'mod_survey_get_questions','mod_survey_external','get_questions',NULL,'mod_survey','mod/survey:participate'),(181,'mod_survey_submit_answers','mod_survey_external','submit_answers',NULL,'mod_survey','mod/survey:participate'),(182,'mod_url_view_url','mod_url_external','view_url',NULL,'mod_url','mod/url:view'),(183,'moodle_enrol_manual_enrol_users','moodle_enrol_manual_external','manual_enrol_users','enrol/manual/externallib.php','enrol_manual','enrol/manual:enrol'),(184,'enrol_manual_enrol_users','enrol_manual_external','enrol_users','enrol/manual/externallib.php','enrol_manual','enrol/manual:enrol'),(185,'enrol_manual_unenrol_users','enrol_manual_external','unenrol_users','enrol/manual/externallib.php','enrol_manual','enrol/manual:unenrol'),(186,'enrol_self_get_instance_info','enrol_self_external','get_instance_info','enrol/self/externallib.php','enrol_self',''),(187,'enrol_self_enrol_user','enrol_self_external','enrol_user','enrol/self/externallib.php','enrol_self',''),(188,'message_airnotifier_is_system_configured','message_airnotifier_external','is_system_configured','message/output/airnotifier/externallib.php','message_airnotifier',''),(189,'message_airnotifier_are_notification_preferences_configured','message_airnotifier_external','are_notification_preferences_configured','message/output/airnotifier/externallib.php','message_airnotifier',''),(190,'gradereport_user_get_grades_table','gradereport_user_external','get_grades_table','grade/report/user/externallib.php','gradereport_user','gradereport/user:view'),(191,'gradereport_user_view_grade_report','gradereport_user_external','view_grade_report','grade/report/user/externallib.php','gradereport_user','gradereport/user:view'),(192,'tool_templatelibrary_list_templates','tool_templatelibrary\\external','list_templates',NULL,'tool_templatelibrary',''),(193,'tool_templatelibrary_load_canonical_template','tool_templatelibrary\\external','load_canonical_template',NULL,'tool_templatelibrary','');
/*!40000 ALTER TABLE `mdl_external_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_services`
--

DROP TABLE IF EXISTS `mdl_external_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_services` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  `requiredcapability` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restrictedusers` tinyint(1) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `downloadfiles` tinyint(1) NOT NULL DEFAULT '0',
  `uploadfiles` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_exteserv_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='built in and custom external services';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_services`
--

LOCK TABLES `mdl_external_services` WRITE;
/*!40000 ALTER TABLE `mdl_external_services` DISABLE KEYS */;
INSERT INTO `mdl_external_services` VALUES (1,'Moodle mobile web service',0,NULL,0,'moodle',1490725922,1490726236,'moodle_mobile_app',1,1);
/*!40000 ALTER TABLE `mdl_external_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_services_functions`
--

DROP TABLE IF EXISTS `mdl_external_services_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_services_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `functionname` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lists functions available in each service group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_services_functions`
--

LOCK TABLES `mdl_external_services_functions` WRITE;
/*!40000 ALTER TABLE `mdl_external_services_functions` DISABLE KEYS */;
INSERT INTO `mdl_external_services_functions` VALUES (1,1,'moodle_enrol_get_users_courses'),(2,1,'moodle_enrol_get_enrolled_users'),(3,1,'moodle_user_get_users_by_id'),(4,1,'moodle_webservice_get_siteinfo'),(5,1,'moodle_notes_create_notes'),(6,1,'moodle_user_get_course_participants_by_id'),(7,1,'moodle_user_get_users_by_courseid'),(8,1,'moodle_message_send_instantmessages'),(9,1,'core_course_get_contents'),(10,1,'core_get_component_strings'),(11,1,'core_user_add_user_device'),(12,1,'core_calendar_get_calendar_events'),(13,1,'core_enrol_get_users_courses'),(14,1,'core_enrol_get_enrolled_users'),(15,1,'core_enrol_get_course_enrolment_methods'),(16,1,'enrol_self_enrol_user'),(17,1,'core_user_get_users_by_id'),(18,1,'core_webservice_get_site_info'),(19,1,'core_notes_create_notes'),(20,1,'core_user_get_course_user_profiles'),(21,1,'core_message_send_instant_messages'),(22,1,'mod_assign_get_grades'),(23,1,'mod_assign_get_assignments'),(24,1,'mod_assign_get_submissions'),(25,1,'mod_assign_get_user_flags'),(26,1,'mod_assign_set_user_flags'),(27,1,'mod_assign_get_user_mappings'),(28,1,'mod_assign_revert_submissions_to_draft'),(29,1,'mod_assign_lock_submissions'),(30,1,'mod_assign_unlock_submissions'),(31,1,'mod_assign_save_submission'),(32,1,'mod_assign_submit_for_grading'),(33,1,'mod_assign_save_grade'),(34,1,'mod_assign_save_user_extensions'),(35,1,'mod_assign_reveal_identities'),(36,1,'message_airnotifier_is_system_configured'),(37,1,'message_airnotifier_are_notification_preferences_configured'),(38,1,'core_grades_update_grades'),(39,1,'mod_forum_get_forums_by_courses'),(40,1,'mod_forum_get_forum_discussions_paginated'),(41,1,'mod_forum_get_forum_discussion_posts'),(42,1,'mod_forum_add_discussion_post'),(43,1,'mod_forum_add_discussion'),(44,1,'core_files_get_files'),(45,1,'core_message_get_messages'),(46,1,'core_message_create_contacts'),(47,1,'core_message_delete_contacts'),(48,1,'core_message_block_contacts'),(49,1,'core_message_unblock_contacts'),(50,1,'core_message_get_contacts'),(51,1,'core_message_search_contacts'),(52,1,'core_message_get_blocked_users'),(53,1,'gradereport_user_get_grades_table'),(54,1,'core_group_get_course_user_groups'),(55,1,'core_group_get_activity_allowed_groups'),(56,1,'core_group_get_activity_groupmode'),(57,1,'core_user_remove_user_device'),(58,1,'core_course_get_courses'),(59,1,'core_completion_update_activity_completion_status_manually'),(60,1,'core_completion_mark_course_self_completed'),(61,1,'mod_data_get_databases_by_courses'),(62,1,'core_comment_get_comments'),(63,1,'mod_forum_view_forum'),(64,1,'core_course_view_course'),(65,1,'core_course_search_courses'),(66,1,'core_course_get_course_module'),(67,1,'core_course_get_course_module_by_instance'),(68,1,'core_completion_get_activities_completion_status'),(69,1,'core_notes_get_course_notes'),(70,1,'core_completion_get_course_completion_status'),(71,1,'core_user_view_user_list'),(72,1,'core_message_mark_message_read'),(73,1,'core_notes_view_notes'),(74,1,'core_notes_delete_notes'),(75,1,'mod_forum_view_forum_discussion'),(76,1,'core_user_view_user_profile'),(77,1,'gradereport_user_view_grade_report'),(78,1,'core_rating_get_item_ratings'),(79,1,'mod_url_view_url'),(80,1,'core_user_get_users_by_field'),(81,1,'core_user_add_user_private_files'),(82,1,'mod_assign_view_grading_table'),(83,1,'mod_scorm_view_scorm'),(84,1,'mod_scorm_get_scorm_scoes'),(85,1,'mod_scorm_get_scorm_user_data'),(86,1,'mod_scorm_insert_scorm_tracks'),(87,1,'mod_scorm_get_scorm_sco_tracks'),(88,1,'mod_scorm_get_scorm_attempt_count'),(89,1,'mod_scorm_get_scorms_by_courses'),(90,1,'mod_survey_get_surveys_by_courses'),(91,1,'mod_survey_view_survey'),(92,1,'mod_survey_get_questions'),(93,1,'mod_survey_submit_answers'),(94,1,'mod_page_view_page'),(95,1,'mod_resource_view_resource'),(96,1,'mod_folder_view_folder'),(97,1,'mod_chat_login_user'),(98,1,'mod_chat_get_chat_users'),(99,1,'mod_chat_send_chat_message'),(100,1,'mod_chat_get_chat_latest_messages'),(101,1,'mod_chat_view_chat'),(102,1,'mod_chat_get_chats_by_courses'),(103,1,'mod_book_view_book'),(104,1,'mod_book_get_books_by_courses'),(105,1,'mod_choice_get_choice_results'),(106,1,'mod_choice_get_choice_options'),(107,1,'mod_choice_submit_choice_response'),(108,1,'mod_choice_view_choice'),(109,1,'mod_choice_get_choices_by_courses'),(110,1,'mod_choice_delete_choice_responses'),(111,1,'mod_lti_get_tool_launch_data'),(112,1,'mod_lti_get_ltis_by_courses'),(113,1,'mod_lti_view_lti'),(114,1,'mod_imscp_view_imscp'),(115,1,'mod_imscp_get_imscps_by_courses');
/*!40000 ALTER TABLE `mdl_external_services_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_services_users`
--

DROP TABLE IF EXISTS `mdl_external_services_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_services_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_exteservuser_ext_ix` (`externalserviceid`),
  KEY `mdl_exteservuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='users allowed to use services with restricted users flag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_services_users`
--

LOCK TABLES `mdl_external_services_users` WRITE;
/*!40000 ALTER TABLE `mdl_external_services_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_external_services_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_tokens`
--

DROP TABLE IF EXISTS `mdl_external_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_tokens` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tokentype` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `sid` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `creatorid` bigint(10) NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_extetoke_use_ix` (`userid`),
  KEY `mdl_extetoke_ext_ix` (`externalserviceid`),
  KEY `mdl_extetoke_con_ix` (`contextid`),
  KEY `mdl_extetoke_cre_ix` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Security tokens for accessing of external services';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_tokens`
--

LOCK TABLES `mdl_external_tokens` WRITE;
/*!40000 ALTER TABLE `mdl_external_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_external_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback`
--

DROP TABLE IF EXISTS `mdl_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `page_after_submit` longtext COLLATE utf8_unicode_ci NOT NULL,
  `page_after_submitformat` tinyint(2) NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feed_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all feedbacks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback`
--

LOCK TABLES `mdl_feedback` WRITE;
/*!40000 ALTER TABLE `mdl_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_completed`
--

DROP TABLE IF EXISTS `mdl_feedback_completed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_completed` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use_ix` (`userid`),
  KEY `mdl_feedcomp_fee_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='filled out feedback';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_completed`
--

LOCK TABLES `mdl_feedback_completed` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_completed` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_completed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_completedtmp`
--

DROP TABLE IF EXISTS `mdl_feedback_completedtmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_completedtmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `guestid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use2_ix` (`userid`),
  KEY `mdl_feedcomp_fee2_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='filled out feedback';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_completedtmp`
--

LOCK TABLES `mdl_feedback_completedtmp` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_completedtmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_completedtmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_item`
--

DROP TABLE IF EXISTS `mdl_feedback_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_item` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `presentation` longtext COLLATE utf8_unicode_ci NOT NULL,
  `typ` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) NOT NULL DEFAULT '0',
  `position` smallint(3) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `dependitem` bigint(10) NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feeditem_fee_ix` (`feedback`),
  KEY `mdl_feeditem_tem_ix` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback_items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_item`
--

LOCK TABLES `mdl_feedback_item` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_sitecourse_map`
--

DROP TABLE IF EXISTS `mdl_feedback_sitecourse_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_sitecourse_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedbackid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedsitemap_cou_ix` (`courseid`),
  KEY `mdl_feedsitemap_fee_ix` (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback sitecourse map';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_sitecourse_map`
--

LOCK TABLES `mdl_feedback_sitecourse_map` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_sitecourse_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_sitecourse_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_template`
--

DROP TABLE IF EXISTS `mdl_feedback_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtemp_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='templates of feedbackstructures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_template`
--

LOCK TABLES `mdl_feedback_template` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_tracking`
--

DROP TABLE IF EXISTS `mdl_feedback_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_tracking` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtrac_use_ix` (`userid`),
  KEY `mdl_feedtrac_fee_ix` (`feedback`),
  KEY `mdl_feedtrac_com_ix` (`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback trackingdata';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_tracking`
--

LOCK TABLES `mdl_feedback_tracking` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_value`
--

DROP TABLE IF EXISTS `mdl_feedback_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_value` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou_ix` (`course_id`),
  KEY `mdl_feedvalu_ite_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='values of the completeds';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_value`
--

LOCK TABLES `mdl_feedback_value` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_valuetmp`
--

DROP TABLE IF EXISTS `mdl_feedback_valuetmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_valuetmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou2_ix` (`course_id`),
  KEY `mdl_feedvalu_ite2_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='values of the completedstmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_valuetmp`
--

LOCK TABLES `mdl_feedback_valuetmp` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_valuetmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_valuetmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_files`
--

DROP TABLE IF EXISTS `mdl_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_files` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contenthash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filearea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `filepath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) DEFAULT NULL,
  `filesize` bigint(10) NOT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `source` longtext COLLATE utf8_unicode_ci,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `referencefileid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`),
  KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  KEY `mdl_file_con_ix` (`contenthash`),
  KEY `mdl_file_con2_ix` (`contextid`),
  KEY `mdl_file_use_ix` (`userid`),
  KEY `mdl_file_ref_ix` (`referencefileid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='description of files, content is stored in sha1 file pool';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_files`
--

LOCK TABLES `mdl_files` WRITE;
/*!40000 ALTER TABLE `mdl_files` DISABLE KEYS */;
INSERT INTO `mdl_files` VALUES (1,'41cfeee5884a43a4650a851f4f85e7b28316fcc9','a48e186a2cc853a9e94e9305f4e9bc086391212d',1,'theme_more','backgroundimage',0,'/','background.jpg',2,4451,'image/jpeg',0,NULL,NULL,NULL,1490726107,1490726107,0,NULL),(2,'da39a3ee5e6b4b0d3255bfef95601890afd80709','d1da7ab1bb9c08a926037367bf8ce9a838034ead',1,'theme_more','backgroundimage',0,'/','.',2,0,NULL,0,NULL,NULL,NULL,1490726107,1490726107,0,NULL),(3,'fb262df98d67c4e2a5c9802403821e00cf2992af','508e674d49c30d4fde325fe6c7f6fd3d56b247e1',1,'assignfeedback_editpdf','stamps',0,'/','smile.png',2,1600,'image/png',0,NULL,NULL,NULL,1490726109,1490726109,0,NULL),(4,'da39a3ee5e6b4b0d3255bfef95601890afd80709','70b7cdade7b4e27d4e83f0cdaad10d6a3c0cccb5',1,'assignfeedback_editpdf','stamps',0,'/','.',2,0,NULL,0,NULL,NULL,NULL,1490726109,1490726109,0,NULL),(5,'a4f146f120e7e00d21291b924e26aaabe9f4297a','68317eab56c67d32aeaee5acf509a0c4aa828b6b',1,'assignfeedback_editpdf','stamps',0,'/','sad.png',2,1702,'image/png',0,NULL,NULL,NULL,1490726110,1490726110,0,NULL),(6,'33957e31ba9c763a74638b825f0a9154acf475e1','695a55ff780e61c9e59428aa425430b0d6bde53b',1,'assignfeedback_editpdf','stamps',0,'/','tick.png',2,1187,'image/png',0,NULL,NULL,NULL,1490726110,1490726110,0,NULL),(7,'d613d55f37bb76d38d4ffb4b7b83e6c694778c30','373e63af262a9b8466ba8632551520be793c37ff',1,'assignfeedback_editpdf','stamps',0,'/','cross.png',2,1230,'image/png',0,NULL,NULL,NULL,1490726110,1490726110,0,NULL),(8,'41cfeee5884a43a4650a851f4f85e7b28316fcc9','6cfb1c38ec02ac36f487506970672ddcb55ce075',5,'user','draft',167000858,'/','background.jpg',2,4451,'image/jpeg',0,'O:8:\"stdClass\":2:{s:6:\"source\";N;s:8:\"original\";s:236:\"YTo2OntzOjk6ImNvbnRleHRpZCI7aToxO3M6OToiY29tcG9uZW50IjtzOjEwOiJ0aGVtZV9tb3JlIjtzOjY6Iml0ZW1pZCI7aTowO3M6ODoiZmlsZWFyZWEiO3M6MTU6ImJhY2tncm91bmRpbWFnZSI7czo4OiJmaWxlcGF0aCI7czoxOiIvIjtzOjg6ImZpbGVuYW1lIjtzOjE0OiJiYWNrZ3JvdW5kLmpwZyI7fQ==\";}',NULL,NULL,1490726107,1490726107,0,NULL),(9,'da39a3ee5e6b4b0d3255bfef95601890afd80709','eace69eaf1c048ed685069edf3f9c53346912d34',5,'user','draft',167000858,'/','.',2,0,NULL,0,NULL,NULL,NULL,1490790261,1490790261,0,NULL),(10,'403ebc62497c996d56845652d465d96c5c2d61dd','dac5349202a9b83a50d38beac58b291f4905a98f',1,'core','preview',0,'/thumb/','41cfeee5884a43a4650a851f4f85e7b28316fcc9',NULL,8910,'image/png',0,NULL,NULL,NULL,1490790262,1490790262,0,NULL),(11,'da39a3ee5e6b4b0d3255bfef95601890afd80709','74c104d54c05b5f8c633a36da516d37e6c5279e4',1,'core','preview',0,'/thumb/','.',NULL,0,NULL,0,NULL,NULL,NULL,1490790262,1490790262,0,NULL),(12,'da39a3ee5e6b4b0d3255bfef95601890afd80709','884555719c50529b9df662a38619d04b5b11e25c',1,'core','preview',0,'/','.',NULL,0,NULL,0,NULL,NULL,NULL,1490790262,1490790262,0,NULL),(13,'41cfeee5884a43a4650a851f4f85e7b28316fcc9','925cd5f1a668af8c61c306746a802bf3c9190dc6',5,'user','draft',400647919,'/','background.jpg',2,4451,'image/jpeg',0,'O:8:\"stdClass\":2:{s:6:\"source\";N;s:8:\"original\";s:236:\"YTo2OntzOjk6ImNvbnRleHRpZCI7aToxO3M6OToiY29tcG9uZW50IjtzOjEwOiJ0aGVtZV9tb3JlIjtzOjY6Iml0ZW1pZCI7aTowO3M6ODoiZmlsZWFyZWEiO3M6MTU6ImJhY2tncm91bmRpbWFnZSI7czo4OiJmaWxlcGF0aCI7czoxOiIvIjtzOjg6ImZpbGVuYW1lIjtzOjE0OiJiYWNrZ3JvdW5kLmpwZyI7fQ==\";}',NULL,NULL,1490726107,1490726107,0,NULL),(14,'da39a3ee5e6b4b0d3255bfef95601890afd80709','2b4de2a22fe43991946a691eee2d7bf300c1fbcf',5,'user','draft',400647919,'/','.',2,0,NULL,0,NULL,NULL,NULL,1490790369,1490790369,0,NULL),(15,'41cfeee5884a43a4650a851f4f85e7b28316fcc9','54be41389b5fd17a75ee9b21e5ad65255d7d71da',5,'user','draft',671411138,'/','background.jpg',2,4451,'image/jpeg',0,'O:8:\"stdClass\":2:{s:6:\"source\";N;s:8:\"original\";s:236:\"YTo2OntzOjk6ImNvbnRleHRpZCI7aToxO3M6OToiY29tcG9uZW50IjtzOjEwOiJ0aGVtZV9tb3JlIjtzOjY6Iml0ZW1pZCI7aTowO3M6ODoiZmlsZWFyZWEiO3M6MTU6ImJhY2tncm91bmRpbWFnZSI7czo4OiJmaWxlcGF0aCI7czoxOiIvIjtzOjg6ImZpbGVuYW1lIjtzOjE0OiJiYWNrZ3JvdW5kLmpwZyI7fQ==\";}',NULL,NULL,1490726107,1490726107,0,NULL),(16,'da39a3ee5e6b4b0d3255bfef95601890afd80709','77e8ee5a58dcf27b1c2d665b63c3824d5d9fcc6c',5,'user','draft',671411138,'/','.',2,0,NULL,0,NULL,NULL,NULL,1490791549,1490791549,0,NULL),(17,'27e30eba8f8271b738ce20777e0a1c64eedb08d4','b986cac9c54611e1119b104e8bfc664060949668',5,'user','draft',490563207,'/','ilernus.svg',2,23362,'image/svg+xml',0,'O:8:\"stdClass\":1:{s:6:\"source\";s:11:\"ilernus.svg\";}','admin admin','allrightsreserved',1490792153,1490792153,0,NULL),(18,'da39a3ee5e6b4b0d3255bfef95601890afd80709','1cb03971bf8eb0d505ece653ecf73764bd453ff9',5,'user','draft',490563207,'/','.',2,0,NULL,0,NULL,NULL,NULL,1490792153,1490792153,0,NULL),(19,'8ba154931d60ff3005f4a32f3efdd55c024f9294','080b966d9edbb97b918a100b3d7540458046445a',5,'user','draft',263749672,'/','ico.ico',2,60902,'image/vnd.microsoft.icon',0,'O:8:\"stdClass\":1:{s:6:\"source\";s:11:\"favicon.ico\";}','admin admin','allrightsreserved',1490792249,1490792249,0,NULL),(20,'da39a3ee5e6b4b0d3255bfef95601890afd80709','5ee2f7e61fd9718219f405cbf8f89e536eedf795',5,'user','draft',263749672,'/','.',2,0,NULL,0,NULL,NULL,NULL,1490792249,1490792249,0,NULL),(21,'27e30eba8f8271b738ce20777e0a1c64eedb08d4','bf2bc10ce79f8fb5a4954a1751699906f83f72fb',1,'theme_adaptable','logo',0,'/','ilernus.svg',2,23362,'image/svg+xml',0,'ilernus.svg','admin admin','allrightsreserved',1490792153,1490792287,0,NULL),(22,'da39a3ee5e6b4b0d3255bfef95601890afd80709','48e97c76c94bba96c637da79f57dcc4679f89898',1,'theme_adaptable','logo',0,'/','.',2,0,NULL,0,NULL,NULL,NULL,1490792153,1490792287,0,NULL),(23,'8ba154931d60ff3005f4a32f3efdd55c024f9294','eec0c7d949474d4625739fe493d7f16ab557a79c',1,'theme_adaptable','favicon',0,'/','ico.ico',2,60902,'image/vnd.microsoft.icon',0,'favicon.ico','admin admin','allrightsreserved',1490792249,1490792288,0,NULL),(24,'da39a3ee5e6b4b0d3255bfef95601890afd80709','7803911e19941a23a70c504ac76f67cbcde61c75',1,'theme_adaptable','favicon',0,'/','.',2,0,NULL,0,NULL,NULL,NULL,1490792249,1490792288,0,NULL);
/*!40000 ALTER TABLE `mdl_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_files_reference`
--

DROP TABLE IF EXISTS `mdl_files_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_files_reference` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `repositoryid` bigint(10) NOT NULL,
  `lastsync` bigint(10) DEFAULT NULL,
  `reference` longtext COLLATE utf8_unicode_ci,
  `referencehash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filerefe_refrep_uix` (`referencehash`,`repositoryid`),
  KEY `mdl_filerefe_rep_ix` (`repositoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store files references';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_files_reference`
--

LOCK TABLES `mdl_files_reference` WRITE;
/*!40000 ALTER TABLE `mdl_files_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_files_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_filter_active`
--

DROP TABLE IF EXISTS `mdl_filter_active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_filter_active` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`),
  KEY `mdl_filtacti_con_ix` (`contextid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores information about which filters are active in which c';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_filter_active`
--

LOCK TABLES `mdl_filter_active` WRITE;
/*!40000 ALTER TABLE `mdl_filter_active` DISABLE KEYS */;
INSERT INTO `mdl_filter_active` VALUES (1,'activitynames',1,1,2),(2,'mathjaxloader',1,1,1),(3,'mediaplugin',1,1,3);
/*!40000 ALTER TABLE `mdl_filter_active` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_filter_config`
--

DROP TABLE IF EXISTS `mdl_filter_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_filter_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  KEY `mdl_filtconf_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores per-context configuration settings for filters which ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_filter_config`
--

LOCK TABLES `mdl_filter_config` WRITE;
/*!40000 ALTER TABLE `mdl_filter_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_filter_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_folder`
--

DROP TABLE IF EXISTS `mdl_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_folder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `showexpanded` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_fold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one folder resource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_folder`
--

LOCK TABLES `mdl_folder` WRITE;
/*!40000 ALTER TABLE `mdl_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum`
--

DROP TABLE IF EXISTS `mdl_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'general',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `warnafter` bigint(10) NOT NULL DEFAULT '0',
  `blockafter` bigint(10) NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) NOT NULL DEFAULT '0',
  `completionreplies` int(9) NOT NULL DEFAULT '0',
  `completionposts` int(9) NOT NULL DEFAULT '0',
  `displaywordcount` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foru_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Forums contain and structure discussion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum`
--

LOCK TABLES `mdl_forum` WRITE;
/*!40000 ALTER TABLE `mdl_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_digests`
--

DROP TABLE IF EXISTS `mdl_forum_digests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_digests` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `forum` bigint(10) NOT NULL,
  `maildigest` tinyint(1) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_forudige_forusemai_uix` (`forum`,`userid`,`maildigest`),
  KEY `mdl_forudige_use_ix` (`userid`),
  KEY `mdl_forudige_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of user mail delivery preferences for each forum';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_digests`
--

LOCK TABLES `mdl_forum_digests` WRITE;
/*!40000 ALTER TABLE `mdl_forum_digests` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_digests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_discussion_subs`
--

DROP TABLE IF EXISTS `mdl_forum_discussion_subs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_discussion_subs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `forum` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `discussion` bigint(10) NOT NULL,
  `preference` bigint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_forudiscsubs_usedis_uix` (`userid`,`discussion`),
  KEY `mdl_forudiscsubs_for_ix` (`forum`),
  KEY `mdl_forudiscsubs_use_ix` (`userid`),
  KEY `mdl_forudiscsubs_dis_ix` (`discussion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users may choose to subscribe and unsubscribe from specific ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_discussion_subs`
--

LOCK TABLES `mdl_forum_discussion_subs` WRITE;
/*!40000 ALTER TABLE `mdl_forum_discussion_subs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_discussion_subs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_discussions`
--

DROP TABLE IF EXISTS `mdl_forum_discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_discussions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstpost` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL DEFAULT '0',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forudisc_use_ix` (`userid`),
  KEY `mdl_forudisc_cou_ix` (`course`),
  KEY `mdl_forudisc_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Forums are composed of discussions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_discussions`
--

LOCK TABLES `mdl_forum_discussions` WRITE;
/*!40000 ALTER TABLE `mdl_forum_discussions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_posts`
--

DROP TABLE IF EXISTS `mdl_forum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_posts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `discussion` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forupost_use_ix` (`userid`),
  KEY `mdl_forupost_cre_ix` (`created`),
  KEY `mdl_forupost_mai_ix` (`mailed`),
  KEY `mdl_forupost_dis_ix` (`discussion`),
  KEY `mdl_forupost_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='All posts are stored in this table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_posts`
--

LOCK TABLES `mdl_forum_posts` WRITE;
/*!40000 ALTER TABLE `mdl_forum_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_queue`
--

DROP TABLE IF EXISTS `mdl_forum_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruqueu_use_ix` (`userid`),
  KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  KEY `mdl_foruqueu_pos_ix` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For keeping track of posts that will be mailed in digest for';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_queue`
--

LOCK TABLES `mdl_forum_queue` WRITE;
/*!40000 ALTER TABLE `mdl_forum_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_read`
--

DROP TABLE IF EXISTS `mdl_forum_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `firstread` bigint(10) NOT NULL DEFAULT '0',
  `lastread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`),
  KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`),
  KEY `mdl_foruread_posuse_ix` (`postid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks each users read posts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_read`
--

LOCK TABLES `mdl_forum_read` WRITE;
/*!40000 ALTER TABLE `mdl_forum_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_subscriptions`
--

DROP TABLE IF EXISTS `mdl_forum_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forusubs_use_ix` (`userid`),
  KEY `mdl_forusubs_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of who is subscribed to what forum';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_subscriptions`
--

LOCK TABLES `mdl_forum_subscriptions` WRITE;
/*!40000 ALTER TABLE `mdl_forum_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_track_prefs`
--

DROP TABLE IF EXISTS `mdl_forum_track_prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_track_prefs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks each users untracked forums';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_track_prefs`
--

LOCK TABLES `mdl_forum_track_prefs` WRITE;
/*!40000 ALTER TABLE `mdl_forum_track_prefs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_track_prefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary`
--

DROP TABLE IF EXISTS `mdl_glossary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) NOT NULL DEFAULT '0',
  `displayformat` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) NOT NULL DEFAULT '1',
  `showall` tinyint(2) NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) NOT NULL DEFAULT '1',
  `approvaldisplayformat` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `globalglossary` tinyint(2) NOT NULL DEFAULT '0',
  `entbypage` smallint(3) NOT NULL DEFAULT '10',
  `editalways` tinyint(2) NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionentries` int(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glos_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all glossaries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary`
--

LOCK TABLES `mdl_glossary` WRITE;
/*!40000 ALTER TABLE `mdl_glossary` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_alias`
--

DROP TABLE IF EXISTS `mdl_glossary_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_alias` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_glosalia_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='entries alias';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_alias`
--

LOCK TABLES `mdl_glossary_alias` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_categories`
--

DROP TABLE IF EXISTS `mdl_glossary_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_gloscate_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all categories for glossary entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_categories`
--

LOCK TABLES `mdl_glossary_categories` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_entries`
--

DROP TABLE IF EXISTS `mdl_glossary_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_entries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `concept` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `definition` longtext COLLATE utf8_unicode_ci NOT NULL,
  `definitionformat` tinyint(2) NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) NOT NULL DEFAULT '1',
  `approved` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentr_use_ix` (`userid`),
  KEY `mdl_glosentr_con_ix` (`concept`),
  KEY `mdl_glosentr_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all glossary entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_entries`
--

LOCK TABLES `mdl_glossary_entries` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_entries_categories`
--

DROP TABLE IF EXISTS `mdl_glossary_entries_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_entries_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  KEY `mdl_glosentrcate_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='categories of each glossary entry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_entries_categories`
--

LOCK TABLES `mdl_glossary_entries_categories` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_entries_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_entries_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_formats`
--

DROP TABLE IF EXISTS `mdl_glossary_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_formats` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `popupformatname` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) NOT NULL DEFAULT '1',
  `showtabs` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultmode` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaulthook` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortkey` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Setting of the display formats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_formats`
--

LOCK TABLES `mdl_glossary_formats` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_formats` DISABLE KEYS */;
INSERT INTO `mdl_glossary_formats` VALUES (1,'continuous','continuous',1,1,'standard,category,date','','','',''),(2,'dictionary','dictionary',1,1,'standard','','','',''),(3,'encyclopedia','encyclopedia',1,1,'standard,category,date,author','','','',''),(4,'entrylist','entrylist',1,1,'standard,category,date,author','','','',''),(5,'faq','faq',1,1,'standard,category,date,author','','','',''),(6,'fullwithauthor','fullwithauthor',1,1,'standard,category,date,author','','','',''),(7,'fullwithoutauthor','fullwithoutauthor',1,1,'standard,category,date','','','','');
/*!40000 ALTER TABLE `mdl_glossary_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_categories`
--

DROP TABLE IF EXISTS `mdl_grade_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcate_cou_ix` (`courseid`),
  KEY `mdl_gradcate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about categories, used for grou';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_categories`
--

LOCK TABLES `mdl_grade_categories` WRITE;
/*!40000 ALTER TABLE `mdl_grade_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_categories_history`
--

DROP TABLE IF EXISTS `mdl_grade_categories_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_categories_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcatehist_act_ix` (`action`),
  KEY `mdl_gradcatehist_old_ix` (`oldid`),
  KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  KEY `mdl_gradcatehist_par_ix` (`parent`),
  KEY `mdl_gradcatehist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History of grade_categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_categories_history`
--

LOCK TABLES `mdl_grade_categories_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_categories_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_categories_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_grades`
--

DROP TABLE IF EXISTS `mdl_grade_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext COLLATE utf8_unicode_ci,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `aggregationstatus` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `aggregationweight` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_gradgrad_ite_ix` (`itemid`),
  KEY `mdl_gradgrad_use_ix` (`userid`),
  KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgrad_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='grade_grades  This table keeps individual grades for each us';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_grades`
--

LOCK TABLES `mdl_grade_grades` WRITE;
/*!40000 ALTER TABLE `mdl_grade_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_grades_history`
--

DROP TABLE IF EXISTS `mdl_grade_grades_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_grades_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext COLLATE utf8_unicode_ci,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradgradhist_act_ix` (`action`),
  KEY `mdl_gradgradhist_tim_ix` (`timemodified`),
  KEY `mdl_gradgradhist_useitetim_ix` (`userid`,`itemid`,`timemodified`),
  KEY `mdl_gradgradhist_old_ix` (`oldid`),
  KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  KEY `mdl_gradgradhist_use_ix` (`userid`),
  KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  KEY `mdl_gradgradhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_grades_history`
--

LOCK TABLES `mdl_grade_grades_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_grades_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_grades_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_import_newitem`
--

DROP TABLE IF EXISTS `mdl_grade_import_newitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_import_newitem` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimponewi_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='temporary table for storing new grade_item names from grade ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_import_newitem`
--

LOCK TABLES `mdl_grade_import_newitem` WRITE;
/*!40000 ALTER TABLE `mdl_grade_import_newitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_import_newitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_import_values`
--

DROP TABLE IF EXISTS `mdl_grade_import_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_import_values` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) DEFAULT NULL,
  `newgradeitem` bigint(10) DEFAULT NULL,
  `userid` bigint(10) NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` longtext COLLATE utf8_unicode_ci,
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) DEFAULT NULL,
  `importonlyfeedback` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  KEY `mdl_gradimpovalu_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Temporary table for importing grades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_import_values`
--

LOCK TABLES `mdl_grade_import_values` WRITE;
/*!40000 ALTER TABLE `mdl_grade_import_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_import_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_items`
--

DROP TABLE IF EXISTS `mdl_grade_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext COLLATE utf8_unicode_ci,
  `idnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculation` longtext COLLATE utf8_unicode_ci,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef2` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `weightoverride` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  KEY `mdl_graditem_gra_ix` (`gradetype`),
  KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`),
  KEY `mdl_graditem_cou_ix` (`courseid`),
  KEY `mdl_graditem_cat_ix` (`categoryid`),
  KEY `mdl_graditem_sca_ix` (`scaleid`),
  KEY `mdl_graditem_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about gradeable items (ie colum';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_items`
--

LOCK TABLES `mdl_grade_items` WRITE;
/*!40000 ALTER TABLE `mdl_grade_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_items_history`
--

DROP TABLE IF EXISTS `mdl_grade_items_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_items_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext COLLATE utf8_unicode_ci,
  `idnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculation` longtext COLLATE utf8_unicode_ci,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef2` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `weightoverride` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_graditemhist_act_ix` (`action`),
  KEY `mdl_graditemhist_old_ix` (`oldid`),
  KEY `mdl_graditemhist_cou_ix` (`courseid`),
  KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  KEY `mdl_graditemhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History of grade_items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_items_history`
--

LOCK TABLES `mdl_grade_items_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_items_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_items_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_letters`
--

DROP TABLE IF EXISTS `mdl_grade_letters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_letters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Repository for grade letters, for courses and other moodle e';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_letters`
--

LOCK TABLES `mdl_grade_letters` WRITE;
/*!40000 ALTER TABLE `mdl_grade_letters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_letters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_outcomes`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_outcomes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  KEY `mdl_gradoutc_cou_ix` (`courseid`),
  KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  KEY `mdl_gradoutc_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table describes the outcomes used in the system. An out';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_outcomes`
--

LOCK TABLES `mdl_grade_outcomes` WRITE;
/*!40000 ALTER TABLE `mdl_grade_outcomes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_outcomes_courses`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_outcomes_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `outcomeid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  KEY `mdl_gradoutccour_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores what outcomes are used in what courses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_outcomes_courses`
--

LOCK TABLES `mdl_grade_outcomes_courses` WRITE;
/*!40000 ALTER TABLE `mdl_grade_outcomes_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_outcomes_history`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_outcomes_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradoutchist_act_ix` (`action`),
  KEY `mdl_gradoutchist_old_ix` (`oldid`),
  KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  KEY `mdl_gradoutchist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_outcomes_history`
--

LOCK TABLES `mdl_grade_outcomes_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_outcomes_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_settings`
--

DROP TABLE IF EXISTS `mdl_grade_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  KEY `mdl_gradsett_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='gradebook settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_settings`
--

LOCK TABLES `mdl_grade_settings` WRITE;
/*!40000 ALTER TABLE `mdl_grade_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grading_areas`
--

DROP TABLE IF EXISTS `mdl_grading_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grading_areas` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `areaname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `activemethod` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradarea_concomare_uix` (`contextid`,`component`,`areaname`),
  KEY `mdl_gradarea_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Identifies gradable areas where advanced grading can happen.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grading_areas`
--

LOCK TABLES `mdl_grading_areas` WRITE;
/*!40000 ALTER TABLE `mdl_grading_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grading_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grading_definitions`
--

DROP TABLE IF EXISTS `mdl_grading_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grading_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `areaid` bigint(10) NOT NULL,
  `method` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `copiedfromid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usercreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `timecopied` bigint(10) DEFAULT '0',
  `options` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_graddefi_aremet_uix` (`areaid`,`method`),
  KEY `mdl_graddefi_are_ix` (`areaid`),
  KEY `mdl_graddefi_use_ix` (`usermodified`),
  KEY `mdl_graddefi_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the basic information about an advanced grading for';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grading_definitions`
--

LOCK TABLES `mdl_grading_definitions` WRITE;
/*!40000 ALTER TABLE `mdl_grading_definitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grading_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grading_instances`
--

DROP TABLE IF EXISTS `mdl_grading_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grading_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `raterid` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` tinyint(2) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradinst_def_ix` (`definitionid`),
  KEY `mdl_gradinst_rat_ix` (`raterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Grading form instance is an assessment record for one gradab';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grading_instances`
--

LOCK TABLES `mdl_grading_instances` WRITE;
/*!40000 ALTER TABLE `mdl_grading_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grading_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_guide_comments`
--

DROP TABLE IF EXISTS `mdl_gradingform_guide_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_guide_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcomm_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='frequently used comments used in marking guide';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_guide_comments`
--

LOCK TABLES `mdl_gradingform_guide_comments` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_guide_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_guide_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_guide_criteria`
--

DROP TABLE IF EXISTS `mdl_gradingform_guide_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_guide_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `descriptionmarkers` longtext COLLATE utf8_unicode_ci,
  `descriptionmarkersformat` tinyint(2) DEFAULT NULL,
  `maxscore` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the rows of the criteria grid.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_guide_criteria`
--

LOCK TABLES `mdl_gradingform_guide_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_guide_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_guide_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_guide_fillings`
--

DROP TABLE IF EXISTS `mdl_gradingform_guide_fillings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_guide_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `remark` longtext COLLATE utf8_unicode_ci,
  `remarkformat` tinyint(2) DEFAULT NULL,
  `score` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradguidfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradguidfill_ins_ix` (`instanceid`),
  KEY `mdl_gradguidfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the data of how the guide is filled by a particular r';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_guide_fillings`
--

LOCK TABLES `mdl_gradingform_guide_fillings` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_guide_fillings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_guide_fillings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_rubric_criteria`
--

DROP TABLE IF EXISTS `mdl_gradingform_rubric_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_rubric_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the rows of the rubric grid.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_rubric_criteria`
--

LOCK TABLES `mdl_gradingform_rubric_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_rubric_fillings`
--

DROP TABLE IF EXISTS `mdl_gradingform_rubric_fillings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_rubric_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `levelid` bigint(10) DEFAULT NULL,
  `remark` longtext COLLATE utf8_unicode_ci,
  `remarkformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradrubrfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradrubrfill_lev_ix` (`levelid`),
  KEY `mdl_gradrubrfill_ins_ix` (`instanceid`),
  KEY `mdl_gradrubrfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the data of how the rubric is filled by a particular ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_rubric_fillings`
--

LOCK TABLES `mdl_gradingform_rubric_fillings` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_fillings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_fillings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_rubric_levels`
--

DROP TABLE IF EXISTS `mdl_gradingform_rubric_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `criterionid` bigint(10) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `definition` longtext COLLATE utf8_unicode_ci,
  `definitionformat` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrleve_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the columns of the rubric grid.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_rubric_levels`
--

LOCK TABLES `mdl_gradingform_rubric_levels` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groupings`
--

DROP TABLE IF EXISTS `mdl_groupings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groupings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `configdata` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn2_ix` (`idnumber`),
  KEY `mdl_grou_cou2_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A grouping is a collection of groups. WAS: groups_groupings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groupings`
--

LOCK TABLES `mdl_groupings` WRITE;
/*!40000 ALTER TABLE `mdl_groupings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groupings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groupings_groups`
--

DROP TABLE IF EXISTS `mdl_groupings_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groupings_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grougrou_gro_ix` (`groupingid`),
  KEY `mdl_grougrou_gro2_ix` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a grouping to a group (note, groups can be in multiple ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groupings_groups`
--

LOCK TABLES `mdl_groupings_groups` WRITE;
/*!40000 ALTER TABLE `mdl_groupings_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groupings_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groups`
--

DROP TABLE IF EXISTS `mdl_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn_ix` (`idnumber`),
  KEY `mdl_grou_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record represents a group.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groups`
--

LOCK TABLES `mdl_groups` WRITE;
/*!40000 ALTER TABLE `mdl_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groups_members`
--

DROP TABLE IF EXISTS `mdl_groups_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groups_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_groumemb_gro_ix` (`groupid`),
  KEY `mdl_groumemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a user to a group.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groups_members`
--

LOCK TABLES `mdl_groups_members` WRITE;
/*!40000 ALTER TABLE `mdl_groups_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groups_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_imscp`
--

DROP TABLE IF EXISTS `mdl_imscp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_imscp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_imsc_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one imscp resource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_imscp`
--

LOCK TABLES `mdl_imscp` WRITE;
/*!40000 ALTER TABLE `mdl_imscp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_imscp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_label`
--

DROP TABLE IF EXISTS `mdl_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_label` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_labe_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines labels';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_label`
--

LOCK TABLES `mdl_label` WRITE;
/*!40000 ALTER TABLE `mdl_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson`
--

DROP TABLE IF EXISTS `mdl_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `practice` smallint(3) NOT NULL DEFAULT '0',
  `modattempts` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dependency` bigint(10) NOT NULL DEFAULT '0',
  `conditions` longtext COLLATE utf8_unicode_ci NOT NULL,
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `custom` smallint(3) NOT NULL DEFAULT '0',
  `ongoing` smallint(3) NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) NOT NULL DEFAULT '5',
  `review` smallint(3) NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) NOT NULL DEFAULT '0',
  `feedback` smallint(3) NOT NULL DEFAULT '1',
  `minquestions` smallint(3) NOT NULL DEFAULT '0',
  `maxpages` smallint(3) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `retake` smallint(3) NOT NULL DEFAULT '1',
  `activitylink` bigint(10) NOT NULL DEFAULT '0',
  `mediafile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mediaheight` bigint(10) NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) NOT NULL DEFAULT '0',
  `slideshow` smallint(3) NOT NULL DEFAULT '0',
  `width` bigint(10) NOT NULL DEFAULT '640',
  `height` bigint(10) NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) NOT NULL DEFAULT '0',
  `progressbar` smallint(3) NOT NULL DEFAULT '0',
  `available` bigint(10) NOT NULL DEFAULT '0',
  `deadline` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionendreached` tinyint(1) DEFAULT '0',
  `completiontimespent` bigint(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_less_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson`
--

LOCK TABLES `mdl_lesson` WRITE;
/*!40000 ALTER TABLE `mdl_lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_answers`
--

DROP TABLE IF EXISTS `mdl_lesson_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext COLLATE utf8_unicode_ci,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `response` longtext COLLATE utf8_unicode_ci,
  `responseformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessansw_les_ix` (`lessonid`),
  KEY `mdl_lessansw_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_answers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_answers`
--

LOCK TABLES `mdl_lesson_answers` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_attempts`
--

DROP TABLE IF EXISTS `mdl_lesson_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `answerid` bigint(10) NOT NULL DEFAULT '0',
  `retry` smallint(3) NOT NULL DEFAULT '0',
  `correct` bigint(10) NOT NULL DEFAULT '0',
  `useranswer` longtext COLLATE utf8_unicode_ci,
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessatte_use_ix` (`userid`),
  KEY `mdl_lessatte_les_ix` (`lessonid`),
  KEY `mdl_lessatte_pag_ix` (`pageid`),
  KEY `mdl_lessatte_ans_ix` (`answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_attempts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_attempts`
--

LOCK TABLES `mdl_lesson_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_branch`
--

DROP TABLE IF EXISTS `mdl_lesson_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_branch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `retry` bigint(10) NOT NULL DEFAULT '0',
  `flag` smallint(3) NOT NULL DEFAULT '0',
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessbran_use_ix` (`userid`),
  KEY `mdl_lessbran_les_ix` (`lessonid`),
  KEY `mdl_lessbran_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='branches for each lesson/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_branch`
--

LOCK TABLES `mdl_lesson_branch` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_grades`
--

DROP TABLE IF EXISTS `mdl_lesson_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessgrad_use_ix` (`userid`),
  KEY `mdl_lessgrad_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_grades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_grades`
--

LOCK TABLES `mdl_lesson_grades` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_overrides`
--

DROP TABLE IF EXISTS `mdl_lesson_overrides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `available` bigint(10) DEFAULT NULL,
  `deadline` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `review` smallint(3) DEFAULT NULL,
  `maxattempts` smallint(3) DEFAULT NULL,
  `retake` smallint(3) DEFAULT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_lessover_les_ix` (`lessonid`),
  KEY `mdl_lessover_gro_ix` (`groupid`),
  KEY `mdl_lessover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The overrides to lesson settings.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_overrides`
--

LOCK TABLES `mdl_lesson_overrides` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_overrides` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_overrides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_pages`
--

DROP TABLE IF EXISTS `mdl_lesson_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  `qtype` smallint(3) NOT NULL DEFAULT '0',
  `qoption` smallint(3) NOT NULL DEFAULT '0',
  `layout` smallint(3) NOT NULL DEFAULT '1',
  `display` smallint(3) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contents` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentsformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesspage_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_pages`
--

LOCK TABLES `mdl_lesson_pages` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_timer`
--

DROP TABLE IF EXISTS `mdl_lesson_timer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_timer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `starttime` bigint(10) NOT NULL DEFAULT '0',
  `lessontime` bigint(10) NOT NULL DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesstime_use_ix` (`userid`),
  KEY `mdl_lesstime_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lesson timer for each lesson';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_timer`
--

LOCK TABLES `mdl_lesson_timer` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_timer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_timer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_license`
--

DROP TABLE IF EXISTS `mdl_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_license` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` longtext COLLATE utf8_unicode_ci,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='store licenses used by moodle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_license`
--

LOCK TABLES `mdl_license` WRITE;
/*!40000 ALTER TABLE `mdl_license` DISABLE KEYS */;
INSERT INTO `mdl_license` VALUES (1,'unknown','Unknown license','',1,2010033100),(2,'allrightsreserved','All rights reserved','http://en.wikipedia.org/wiki/All_rights_reserved',1,2010033100),(3,'public','Public Domain','http://creativecommons.org/licenses/publicdomain/',1,2010033100),(4,'cc','Creative Commons','http://creativecommons.org/licenses/by/3.0/',1,2010033100),(5,'cc-nd','Creative Commons - NoDerivs','http://creativecommons.org/licenses/by-nd/3.0/',1,2010033100),(6,'cc-nc-nd','Creative Commons - No Commercial NoDerivs','http://creativecommons.org/licenses/by-nc-nd/3.0/',1,2010033100),(7,'cc-nc','Creative Commons - No Commercial','http://creativecommons.org/licenses/by-nc/3.0/',1,2013051500),(8,'cc-nc-sa','Creative Commons - No Commercial ShareAlike','http://creativecommons.org/licenses/by-nc-sa/3.0/',1,2010033100),(9,'cc-sa','Creative Commons - ShareAlike','http://creativecommons.org/licenses/by-sa/3.0/',1,2010033100);
/*!40000 ALTER TABLE `mdl_license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lock_db`
--

DROP TABLE IF EXISTS `mdl_lock_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lock_db` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `resourcekey` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint(10) DEFAULT NULL,
  `owner` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_lockdb_res_uix` (`resourcekey`),
  KEY `mdl_lockdb_exp_ix` (`expires`),
  KEY `mdl_lockdb_own_ix` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores active and inactive lock types for db locking method.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lock_db`
--

LOCK TABLES `mdl_lock_db` WRITE;
/*!40000 ALTER TABLE `mdl_lock_db` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lock_db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_log`
--

DROP TABLE IF EXISTS `mdl_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  KEY `mdl_log_tim_ix` (`time`),
  KEY `mdl_log_act_ix` (`action`),
  KEY `mdl_log_usecou_ix` (`userid`,`course`),
  KEY `mdl_log_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Every action is logged as far as possible';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_log`
--

LOCK TABLES `mdl_log` WRITE;
/*!40000 ALTER TABLE `mdl_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_log_display`
--

DROP TABLE IF EXISTS `mdl_log_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_log_display` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mtable` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For a particular module/action, specifies a moodle table/fie';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_log_display`
--

LOCK TABLES `mdl_log_display` WRITE;
/*!40000 ALTER TABLE `mdl_log_display` DISABLE KEYS */;
INSERT INTO `mdl_log_display` VALUES (1,'course','user report','user','CONCAT(firstname, \' \', lastname)','moodle'),(2,'course','view','course','fullname','moodle'),(3,'course','view section','course_sections','name','moodle'),(4,'course','update','course','fullname','moodle'),(5,'course','hide','course','fullname','moodle'),(6,'course','show','course','fullname','moodle'),(7,'course','move','course','fullname','moodle'),(8,'course','enrol','course','fullname','moodle'),(9,'course','unenrol','course','fullname','moodle'),(10,'course','report log','course','fullname','moodle'),(11,'course','report live','course','fullname','moodle'),(12,'course','report outline','course','fullname','moodle'),(13,'course','report participation','course','fullname','moodle'),(14,'course','report stats','course','fullname','moodle'),(15,'category','add','course_categories','name','moodle'),(16,'category','hide','course_categories','name','moodle'),(17,'category','move','course_categories','name','moodle'),(18,'category','show','course_categories','name','moodle'),(19,'category','update','course_categories','name','moodle'),(20,'message','write','user','CONCAT(firstname, \' \', lastname)','moodle'),(21,'message','read','user','CONCAT(firstname, \' \', lastname)','moodle'),(22,'message','add contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(23,'message','remove contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(24,'message','block contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(25,'message','unblock contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(26,'group','view','groups','name','moodle'),(27,'tag','update','tag','name','moodle'),(28,'tag','flag','tag','name','moodle'),(29,'user','view','user','CONCAT(firstname, \' \', lastname)','moodle'),(30,'assign','add','assign','name','mod_assign'),(31,'assign','delete mod','assign','name','mod_assign'),(32,'assign','download all submissions','assign','name','mod_assign'),(33,'assign','grade submission','assign','name','mod_assign'),(34,'assign','lock submission','assign','name','mod_assign'),(35,'assign','reveal identities','assign','name','mod_assign'),(36,'assign','revert submission to draft','assign','name','mod_assign'),(37,'assign','set marking workflow state','assign','name','mod_assign'),(38,'assign','submission statement accepted','assign','name','mod_assign'),(39,'assign','submit','assign','name','mod_assign'),(40,'assign','submit for grading','assign','name','mod_assign'),(41,'assign','unlock submission','assign','name','mod_assign'),(42,'assign','update','assign','name','mod_assign'),(43,'assign','upload','assign','name','mod_assign'),(44,'assign','view','assign','name','mod_assign'),(45,'assign','view all','course','fullname','mod_assign'),(46,'assign','view confirm submit assignment form','assign','name','mod_assign'),(47,'assign','view grading form','assign','name','mod_assign'),(48,'assign','view submission','assign','name','mod_assign'),(49,'assign','view submission grading table','assign','name','mod_assign'),(50,'assign','view submit assignment form','assign','name','mod_assign'),(51,'assign','view feedback','assign','name','mod_assign'),(52,'assign','view batch set marking workflow state','assign','name','mod_assign'),(53,'assignment','view','assignment','name','mod_assignment'),(54,'assignment','add','assignment','name','mod_assignment'),(55,'assignment','update','assignment','name','mod_assignment'),(56,'assignment','view submission','assignment','name','mod_assignment'),(57,'assignment','upload','assignment','name','mod_assignment'),(58,'book','add','book','name','mod_book'),(59,'book','update','book','name','mod_book'),(60,'book','view','book','name','mod_book'),(61,'book','add chapter','book_chapters','title','mod_book'),(62,'book','update chapter','book_chapters','title','mod_book'),(63,'book','view chapter','book_chapters','title','mod_book'),(64,'chat','view','chat','name','mod_chat'),(65,'chat','add','chat','name','mod_chat'),(66,'chat','update','chat','name','mod_chat'),(67,'chat','report','chat','name','mod_chat'),(68,'chat','talk','chat','name','mod_chat'),(69,'choice','view','choice','name','mod_choice'),(70,'choice','update','choice','name','mod_choice'),(71,'choice','add','choice','name','mod_choice'),(72,'choice','report','choice','name','mod_choice'),(73,'choice','choose','choice','name','mod_choice'),(74,'choice','choose again','choice','name','mod_choice'),(75,'data','view','data','name','mod_data'),(76,'data','add','data','name','mod_data'),(77,'data','update','data','name','mod_data'),(78,'data','record delete','data','name','mod_data'),(79,'data','fields add','data_fields','name','mod_data'),(80,'data','fields update','data_fields','name','mod_data'),(81,'data','templates saved','data','name','mod_data'),(82,'data','templates def','data','name','mod_data'),(83,'feedback','startcomplete','feedback','name','mod_feedback'),(84,'feedback','submit','feedback','name','mod_feedback'),(85,'feedback','delete','feedback','name','mod_feedback'),(86,'feedback','view','feedback','name','mod_feedback'),(87,'feedback','view all','course','shortname','mod_feedback'),(88,'folder','view','folder','name','mod_folder'),(89,'folder','view all','folder','name','mod_folder'),(90,'folder','update','folder','name','mod_folder'),(91,'folder','add','folder','name','mod_folder'),(92,'forum','add','forum','name','mod_forum'),(93,'forum','update','forum','name','mod_forum'),(94,'forum','add discussion','forum_discussions','name','mod_forum'),(95,'forum','add post','forum_posts','subject','mod_forum'),(96,'forum','update post','forum_posts','subject','mod_forum'),(97,'forum','user report','user','CONCAT(firstname, \' \', lastname)','mod_forum'),(98,'forum','move discussion','forum_discussions','name','mod_forum'),(99,'forum','view subscribers','forum','name','mod_forum'),(100,'forum','view discussion','forum_discussions','name','mod_forum'),(101,'forum','view forum','forum','name','mod_forum'),(102,'forum','subscribe','forum','name','mod_forum'),(103,'forum','unsubscribe','forum','name','mod_forum'),(104,'glossary','add','glossary','name','mod_glossary'),(105,'glossary','update','glossary','name','mod_glossary'),(106,'glossary','view','glossary','name','mod_glossary'),(107,'glossary','view all','glossary','name','mod_glossary'),(108,'glossary','add entry','glossary','name','mod_glossary'),(109,'glossary','update entry','glossary','name','mod_glossary'),(110,'glossary','add category','glossary','name','mod_glossary'),(111,'glossary','update category','glossary','name','mod_glossary'),(112,'glossary','delete category','glossary','name','mod_glossary'),(113,'glossary','approve entry','glossary','name','mod_glossary'),(114,'glossary','disapprove entry','glossary','name','mod_glossary'),(115,'glossary','view entry','glossary_entries','concept','mod_glossary'),(116,'imscp','view','imscp','name','mod_imscp'),(117,'imscp','view all','imscp','name','mod_imscp'),(118,'imscp','update','imscp','name','mod_imscp'),(119,'imscp','add','imscp','name','mod_imscp'),(120,'label','add','label','name','mod_label'),(121,'label','update','label','name','mod_label'),(122,'lesson','start','lesson','name','mod_lesson'),(123,'lesson','end','lesson','name','mod_lesson'),(124,'lesson','view','lesson_pages','title','mod_lesson'),(125,'lti','view','lti','name','mod_lti'),(126,'lti','launch','lti','name','mod_lti'),(127,'lti','view all','lti','name','mod_lti'),(128,'page','view','page','name','mod_page'),(129,'page','view all','page','name','mod_page'),(130,'page','update','page','name','mod_page'),(131,'page','add','page','name','mod_page'),(132,'quiz','add','quiz','name','mod_quiz'),(133,'quiz','update','quiz','name','mod_quiz'),(134,'quiz','view','quiz','name','mod_quiz'),(135,'quiz','report','quiz','name','mod_quiz'),(136,'quiz','attempt','quiz','name','mod_quiz'),(137,'quiz','submit','quiz','name','mod_quiz'),(138,'quiz','review','quiz','name','mod_quiz'),(139,'quiz','editquestions','quiz','name','mod_quiz'),(140,'quiz','preview','quiz','name','mod_quiz'),(141,'quiz','start attempt','quiz','name','mod_quiz'),(142,'quiz','close attempt','quiz','name','mod_quiz'),(143,'quiz','continue attempt','quiz','name','mod_quiz'),(144,'quiz','edit override','quiz','name','mod_quiz'),(145,'quiz','delete override','quiz','name','mod_quiz'),(146,'quiz','view summary','quiz','name','mod_quiz'),(147,'resource','view','resource','name','mod_resource'),(148,'resource','view all','resource','name','mod_resource'),(149,'resource','update','resource','name','mod_resource'),(150,'resource','add','resource','name','mod_resource'),(151,'scorm','view','scorm','name','mod_scorm'),(152,'scorm','review','scorm','name','mod_scorm'),(153,'scorm','update','scorm','name','mod_scorm'),(154,'scorm','add','scorm','name','mod_scorm'),(155,'survey','add','survey','name','mod_survey'),(156,'survey','update','survey','name','mod_survey'),(157,'survey','download','survey','name','mod_survey'),(158,'survey','view form','survey','name','mod_survey'),(159,'survey','view graph','survey','name','mod_survey'),(160,'survey','view report','survey','name','mod_survey'),(161,'survey','submit','survey','name','mod_survey'),(162,'url','view','url','name','mod_url'),(163,'url','view all','url','name','mod_url'),(164,'url','update','url','name','mod_url'),(165,'url','add','url','name','mod_url'),(166,'workshop','add','workshop','name','mod_workshop'),(167,'workshop','update','workshop','name','mod_workshop'),(168,'workshop','view','workshop','name','mod_workshop'),(169,'workshop','view all','workshop','name','mod_workshop'),(170,'workshop','add submission','workshop_submissions','title','mod_workshop'),(171,'workshop','update submission','workshop_submissions','title','mod_workshop'),(172,'workshop','view submission','workshop_submissions','title','mod_workshop'),(173,'workshop','add assessment','workshop_submissions','title','mod_workshop'),(174,'workshop','update assessment','workshop_submissions','title','mod_workshop'),(175,'workshop','add example','workshop_submissions','title','mod_workshop'),(176,'workshop','update example','workshop_submissions','title','mod_workshop'),(177,'workshop','view example','workshop_submissions','title','mod_workshop'),(178,'workshop','add reference assessment','workshop_submissions','title','mod_workshop'),(179,'workshop','update reference assessment','workshop_submissions','title','mod_workshop'),(180,'workshop','add example assessment','workshop_submissions','title','mod_workshop'),(181,'workshop','update example assessment','workshop_submissions','title','mod_workshop'),(182,'workshop','update aggregate grades','workshop','name','mod_workshop'),(183,'workshop','update clear aggregated grades','workshop','name','mod_workshop'),(184,'workshop','update clear assessments','workshop','name','mod_workshop'),(185,'book','exportimscp','book','name','booktool_exportimscp'),(186,'book','print','book','name','booktool_print'),(187,'book','print chapter','book_chapters','title','booktool_print');
/*!40000 ALTER TABLE `mdl_log_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_log_queries`
--

DROP TABLE IF EXISTS `mdl_log_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_log_queries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `qtype` mediumint(5) NOT NULL,
  `sqltext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sqlparams` longtext COLLATE utf8_unicode_ci,
  `error` mediumint(5) NOT NULL DEFAULT '0',
  `info` longtext COLLATE utf8_unicode_ci,
  `backtrace` longtext COLLATE utf8_unicode_ci,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Logged database queries.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_log_queries`
--

LOCK TABLES `mdl_log_queries` WRITE;
/*!40000 ALTER TABLE `mdl_log_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_log_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_logstore_standard_log`
--

DROP TABLE IF EXISTS `mdl_logstore_standard_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_logstore_standard_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `target` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `objecttable` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `objectid` bigint(10) DEFAULT NULL,
  `crud` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `edulevel` tinyint(1) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  `contextinstanceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `relateduserid` bigint(10) DEFAULT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `other` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL,
  `origin` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realuserid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_logsstanlog_tim_ix` (`timecreated`),
  KEY `mdl_logsstanlog_couanotim_ix` (`courseid`,`anonymous`,`timecreated`),
  KEY `mdl_logsstanlog_useconconcr_ix` (`userid`,`contextlevel`,`contextinstanceid`,`crud`,`edulevel`,`timecreated`),
  KEY `mdl_logsstanlog_con_ix` (`contextid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Standard log table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_logstore_standard_log`
--

LOCK TABLES `mdl_logstore_standard_log` WRITE;
/*!40000 ALTER TABLE `mdl_logstore_standard_log` DISABLE KEYS */;
INSERT INTO `mdl_logstore_standard_log` VALUES (1,'\\core\\event\\user_loggedin','core','loggedin','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:8:\"username\";s:5:\"admin\";}',1490726137,'web','127.0.0.1',NULL),(2,'\\core\\event\\user_password_updated','core','updated','user_password',NULL,NULL,'u',0,5,30,2,2,0,2,0,'a:1:{s:14:\"forgottenreset\";b:0;}',1490726199,'web','127.0.0.1',NULL),(3,'\\core\\event\\user_updated','core','updated','user','user',2,'u',0,5,30,2,2,0,2,0,'N;',1490726199,'web','127.0.0.1',NULL),(4,'\\core\\event\\user_login_failed','core','failed','user_login',NULL,NULL,'r',0,1,10,0,0,0,NULL,0,'a:2:{s:8:\"username\";s:5:\"admin\";s:6:\"reason\";i:1;}',1490789848,'web','127.0.0.1',NULL),(5,'\\core\\event\\user_loggedin','core','loggedin','user','user',2,'r',0,1,10,0,2,0,NULL,0,'a:1:{s:8:\"username\";s:8:\"ysanchez\";}',1490789856,'web','127.0.0.1',NULL),(6,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1490790489,'web','127.0.0.1',NULL),(7,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1490792435,'web','127.0.0.1',NULL),(8,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1490792453,'web','127.0.0.1',NULL),(9,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1490792518,'web','127.0.0.1',NULL),(10,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1490792756,'web','127.0.0.1',NULL),(11,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1490792786,'web','127.0.0.1',NULL),(12,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1490793608,'web','127.0.0.1',NULL),(13,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1490794615,'web','127.0.0.1',NULL),(14,'\\core\\event\\course_viewed','core','viewed','course',NULL,NULL,'r',2,2,50,1,2,1,NULL,0,'N;',1490794653,'web','127.0.0.1',NULL);
/*!40000 ALTER TABLE `mdl_logstore_standard_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti`
--

DROP TABLE IF EXISTS `mdl_lti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `typeid` bigint(10) DEFAULT NULL,
  `toolurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `securetoolurl` longtext COLLATE utf8_unicode_ci,
  `instructorchoicesendname` tinyint(1) DEFAULT NULL,
  `instructorchoicesendemailaddr` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowroster` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowsetting` tinyint(1) DEFAULT NULL,
  `instructorcustomparameters` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructorchoiceacceptgrades` tinyint(1) DEFAULT NULL,
  `grade` bigint(10) NOT NULL DEFAULT '100',
  `launchcontainer` tinyint(2) NOT NULL DEFAULT '1',
  `resourcekey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `debuglaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showtitlelaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showdescriptionlaunch` tinyint(1) NOT NULL DEFAULT '0',
  `servicesalt` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` longtext COLLATE utf8_unicode_ci,
  `secureicon` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_lti_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains Basic LTI activities instances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti`
--

LOCK TABLES `mdl_lti` WRITE;
/*!40000 ALTER TABLE `mdl_lti` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_submission`
--

DROP TABLE IF EXISTS `mdl_lti_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `ltiid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datesubmitted` bigint(10) NOT NULL,
  `dateupdated` bigint(10) NOT NULL,
  `gradepercent` decimal(10,5) NOT NULL,
  `originalgrade` decimal(10,5) NOT NULL,
  `launchid` bigint(10) NOT NULL,
  `state` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltisubm_lti_ix` (`ltiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of individual submissions for LTI activities.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_submission`
--

LOCK TABLES `mdl_lti_submission` WRITE;
/*!40000 ALTER TABLE `mdl_lti_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_tool_proxies`
--

DROP TABLE IF EXISTS `mdl_lti_tool_proxies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_tool_proxies` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Tool Provider',
  `regurl` longtext COLLATE utf8_unicode_ci,
  `state` tinyint(2) NOT NULL DEFAULT '1',
  `guid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vendorcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capabilityoffered` longtext COLLATE utf8_unicode_ci NOT NULL,
  `serviceoffered` longtext COLLATE utf8_unicode_ci NOT NULL,
  `toolproxy` longtext COLLATE utf8_unicode_ci,
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_ltitoolprox_gui_uix` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='LTI tool proxy registrations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_tool_proxies`
--

LOCK TABLES `mdl_lti_tool_proxies` WRITE;
/*!40000 ALTER TABLE `mdl_lti_tool_proxies` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_tool_proxies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_tool_settings`
--

DROP TABLE IF EXISTS `mdl_lti_tool_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_tool_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `toolproxyid` bigint(10) NOT NULL,
  `course` bigint(10) DEFAULT NULL,
  `coursemoduleid` bigint(10) DEFAULT NULL,
  `settings` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitoolsett_too_ix` (`toolproxyid`),
  KEY `mdl_ltitoolsett_cou_ix` (`course`),
  KEY `mdl_ltitoolsett_cou2_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='LTI tool setting values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_tool_settings`
--

LOCK TABLES `mdl_lti_tool_settings` WRITE;
/*!40000 ALTER TABLE `mdl_lti_tool_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_tool_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_types`
--

DROP TABLE IF EXISTS `mdl_lti_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_types` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'basiclti Activity',
  `baseurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `tooldomain` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(2) NOT NULL DEFAULT '2',
  `course` bigint(10) NOT NULL,
  `coursevisible` tinyint(1) NOT NULL DEFAULT '0',
  `toolproxyid` bigint(10) DEFAULT NULL,
  `enabledcapability` longtext COLLATE utf8_unicode_ci,
  `parameter` longtext COLLATE utf8_unicode_ci,
  `icon` longtext COLLATE utf8_unicode_ci,
  `secureicon` longtext COLLATE utf8_unicode_ci,
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitype_cou_ix` (`course`),
  KEY `mdl_ltitype_too_ix` (`tooldomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Basic LTI pre-configured activities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_types`
--

LOCK TABLES `mdl_lti_types` WRITE;
/*!40000 ALTER TABLE `mdl_lti_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_types_config`
--

DROP TABLE IF EXISTS `mdl_lti_types_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_types_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `typeid` bigint(10) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_ltitypeconf_typ_ix` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Basic LTI types configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_types_config`
--

LOCK TABLES `mdl_lti_types_config` WRITE;
/*!40000 ALTER TABLE `mdl_lti_types_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_types_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message`
--

DROP TABLE IF EXISTS `mdl_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext COLLATE utf8_unicode_ci,
  `fullmessage` longtext COLLATE utf8_unicode_ci,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext COLLATE utf8_unicode_ci,
  `smallmessage` longtext COLLATE utf8_unicode_ci,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext COLLATE utf8_unicode_ci,
  `contexturlname` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeuserfromdeleted` bigint(10) NOT NULL DEFAULT '0',
  `timeusertodeleted` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mess_use_ix` (`useridto`),
  KEY `mdl_mess_useusetimtim_ix` (`useridfrom`,`useridto`,`timeuserfromdeleted`,`timeusertodeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all unread messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message`
--

LOCK TABLES `mdl_message` WRITE;
/*!40000 ALTER TABLE `mdl_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_airnotifier_devices`
--

DROP TABLE IF EXISTS `mdl_message_airnotifier_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_airnotifier_devices` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userdeviceid` bigint(10) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messairndevi_use_uix` (`userdeviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store information about the devices registered in Airnotifie';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_airnotifier_devices`
--

LOCK TABLES `mdl_message_airnotifier_devices` WRITE;
/*!40000 ALTER TABLE `mdl_message_airnotifier_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_airnotifier_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_contacts`
--

DROP TABLE IF EXISTS `mdl_message_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_contacts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contactid` bigint(10) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Maintains lists of relationships between users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_contacts`
--

LOCK TABLES `mdl_message_contacts` WRITE;
/*!40000 ALTER TABLE `mdl_message_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_processors`
--

DROP TABLE IF EXISTS `mdl_message_processors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_processors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of message output plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_processors`
--

LOCK TABLES `mdl_message_processors` WRITE;
/*!40000 ALTER TABLE `mdl_message_processors` DISABLE KEYS */;
INSERT INTO `mdl_message_processors` VALUES (1,'airnotifier',0),(2,'email',1),(3,'jabber',1),(4,'popup',1);
/*!40000 ALTER TABLE `mdl_message_processors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_providers`
--

DROP TABLE IF EXISTS `mdl_message_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_providers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores the message providers (modules and core sy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_providers`
--

LOCK TABLES `mdl_message_providers` WRITE;
/*!40000 ALTER TABLE `mdl_message_providers` DISABLE KEYS */;
INSERT INTO `mdl_message_providers` VALUES (1,'notices','moodle','moodle/site:config'),(2,'errors','moodle','moodle/site:config'),(3,'availableupdate','moodle','moodle/site:config'),(4,'instantmessage','moodle',NULL),(5,'backup','moodle','moodle/site:config'),(6,'courserequested','moodle','moodle/site:approvecourse'),(7,'courserequestapproved','moodle','moodle/course:request'),(8,'courserequestrejected','moodle','moodle/course:request'),(9,'badgerecipientnotice','moodle','moodle/badges:earnbadge'),(10,'badgecreatornotice','moodle',NULL),(11,'assign_notification','mod_assign',NULL),(12,'assignment_updates','mod_assignment',NULL),(13,'submission','mod_feedback',NULL),(14,'message','mod_feedback',NULL),(15,'posts','mod_forum',NULL),(16,'graded_essay','mod_lesson',NULL),(17,'submission','mod_quiz','mod/quiz:emailnotifysubmission'),(18,'confirmation','mod_quiz','mod/quiz:emailconfirmsubmission'),(19,'attempt_overdue','mod_quiz','mod/quiz:emailwarnoverdue'),(20,'flatfile_enrolment','enrol_flatfile',NULL),(21,'imsenterprise_enrolment','enrol_imsenterprise',NULL),(22,'expiry_notification','enrol_manual',NULL),(23,'paypal_enrolment','enrol_paypal',NULL),(24,'expiry_notification','enrol_self',NULL),(25,'invalidrecipienthandler','tool_messageinbound',NULL),(26,'messageprocessingerror','tool_messageinbound',NULL),(27,'messageprocessingsuccess','tool_messageinbound',NULL),(28,'notification','tool_monitor','tool/monitor:subscribe');
/*!40000 ALTER TABLE `mdl_message_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_read`
--

DROP TABLE IF EXISTS `mdl_message_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext COLLATE utf8_unicode_ci,
  `fullmessage` longtext COLLATE utf8_unicode_ci,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext COLLATE utf8_unicode_ci,
  `smallmessage` longtext COLLATE utf8_unicode_ci,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext COLLATE utf8_unicode_ci,
  `contexturlname` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0',
  `timeuserfromdeleted` bigint(10) NOT NULL DEFAULT '0',
  `timeusertodeleted` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_messread_use_ix` (`useridto`),
  KEY `mdl_messread_useusetimtim_ix` (`useridfrom`,`useridto`,`timeuserfromdeleted`,`timeusertodeleted`),
  KEY `mdl_messread_nottim_ix` (`notification`,`timeread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all messages that have been read';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_read`
--

LOCK TABLES `mdl_message_read` WRITE;
/*!40000 ALTER TABLE `mdl_message_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_working`
--

DROP TABLE IF EXISTS `mdl_message_working`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_working` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `unreadmessageid` bigint(10) NOT NULL,
  `processorid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messwork_unr_ix` (`unreadmessageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists all the messages and processors that need to be proces';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_working`
--

LOCK TABLES `mdl_message_working` WRITE;
/*!40000 ALTER TABLE `mdl_message_working` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_working` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_messageinbound_datakeys`
--

DROP TABLE IF EXISTS `mdl_messageinbound_datakeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_messageinbound_datakeys` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `handler` bigint(10) NOT NULL,
  `datavalue` bigint(10) NOT NULL,
  `datakey` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `expires` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messdata_handat_uix` (`handler`,`datavalue`),
  KEY `mdl_messdata_han_ix` (`handler`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Inbound Message data item secret keys.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_messageinbound_datakeys`
--

LOCK TABLES `mdl_messageinbound_datakeys` WRITE;
/*!40000 ALTER TABLE `mdl_messageinbound_datakeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_messageinbound_datakeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_messageinbound_handlers`
--

DROP TABLE IF EXISTS `mdl_messageinbound_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_messageinbound_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaultexpiration` bigint(10) NOT NULL DEFAULT '86400',
  `validateaddress` tinyint(1) NOT NULL DEFAULT '1',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messhand_cla_uix` (`classname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Inbound Message Handler definitions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_messageinbound_handlers`
--

LOCK TABLES `mdl_messageinbound_handlers` WRITE;
/*!40000 ALTER TABLE `mdl_messageinbound_handlers` DISABLE KEYS */;
INSERT INTO `mdl_messageinbound_handlers` VALUES (1,'core','\\core\\message\\inbound\\private_files_handler',0,1,0),(2,'mod_forum','\\mod_forum\\message\\inbound\\reply_handler',604800,1,0),(3,'tool_messageinbound','\\tool_messageinbound\\message\\inbound\\invalid_recipient_handler',604800,0,1);
/*!40000 ALTER TABLE `mdl_messageinbound_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_messageinbound_messagelist`
--

DROP TABLE IF EXISTS `mdl_messageinbound_messagelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_messageinbound_messagelist` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `messageid` longtext COLLATE utf8_unicode_ci NOT NULL,
  `userid` bigint(10) NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messmess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A list of message IDs for existing replies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_messageinbound_messagelist`
--

LOCK TABLES `mdl_messageinbound_messagelist` WRITE;
/*!40000 ALTER TABLE `mdl_messageinbound_messagelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_messageinbound_messagelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_application`
--

DROP TABLE IF EXISTS `mdl_mnet_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_application` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about applications on remote hosts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_application`
--

LOCK TABLES `mdl_mnet_application` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_application` DISABLE KEYS */;
INSERT INTO `mdl_mnet_application` VALUES (1,'moodle','Moodle','/mnet/xmlrpc/server.php','/auth/mnet/land.php','/auth/mnet/jump.php'),(2,'mahara','Mahara','/api/xmlrpc/server.php','/auth/xmlrpc/land.php','/auth/xmlrpc/jump.php');
/*!40000 ALTER TABLE `mdl_mnet_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_host`
--

DROP TABLE IF EXISTS `mdl_mnet_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_host` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `public_key` longtext COLLATE utf8_unicode_ci NOT NULL,
  `public_key_expires` bigint(10) NOT NULL DEFAULT '0',
  `transport` tinyint(2) NOT NULL DEFAULT '0',
  `portno` mediumint(5) NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationid` bigint(10) NOT NULL DEFAULT '1',
  `sslverification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mnethost_app_ix` (`applicationid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about the local and remote hosts for RPC';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_host`
--

LOCK TABLES `mdl_mnet_host` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_host` DISABLE KEYS */;
INSERT INTO `mdl_mnet_host` VALUES (1,0,'http://localhost/moodle','127.0.0.1','','',0,0,0,0,0,0,NULL,1,0),(2,0,'','','All Hosts','',0,0,0,0,0,0,NULL,1,0);
/*!40000 ALTER TABLE `mdl_mnet_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_host2service`
--

DROP TABLE IF EXISTS `mdl_mnet_host2service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_host2service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about the services for a given host';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_host2service`
--

LOCK TABLES `mdl_mnet_host2service` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_host2service` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_host2service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_log`
--

DROP TABLE IF EXISTS `mdl_mnet_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `remoteid` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `coursename` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store session data from users migrating to other sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_log`
--

LOCK TABLES `mdl_mnet_log` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_remote_rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_remote_rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_remote_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table describes functions that might be called remotely';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_remote_rpc`
--

LOCK TABLES `mdl_mnet_remote_rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_remote_rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_remote_rpc` VALUES (1,'user_authorise','auth/mnet/auth.php/user_authorise','auth','mnet',1),(2,'keepalive_server','auth/mnet/auth.php/keepalive_server','auth','mnet',1),(3,'kill_children','auth/mnet/auth.php/kill_children','auth','mnet',1),(4,'refresh_log','auth/mnet/auth.php/refresh_log','auth','mnet',1),(5,'fetch_user_image','auth/mnet/auth.php/fetch_user_image','auth','mnet',1),(6,'fetch_theme_info','auth/mnet/auth.php/fetch_theme_info','auth','mnet',1),(7,'update_enrolments','auth/mnet/auth.php/update_enrolments','auth','mnet',1),(8,'keepalive_client','auth/mnet/auth.php/keepalive_client','auth','mnet',1),(9,'kill_child','auth/mnet/auth.php/kill_child','auth','mnet',1),(10,'available_courses','enrol/mnet/enrol.php/available_courses','enrol','mnet',1),(11,'user_enrolments','enrol/mnet/enrol.php/user_enrolments','enrol','mnet',1),(12,'enrol_user','enrol/mnet/enrol.php/enrol_user','enrol','mnet',1),(13,'unenrol_user','enrol/mnet/enrol.php/unenrol_user','enrol','mnet',1),(14,'course_enrolments','enrol/mnet/enrol.php/course_enrolments','enrol','mnet',1),(15,'send_content_intent','portfolio/mahara/lib.php/send_content_intent','portfolio','mahara',1),(16,'send_content_ready','portfolio/mahara/lib.php/send_content_ready','portfolio','mahara',1);
/*!40000 ALTER TABLE `mdl_mnet_remote_rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_remote_service2rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_remote_service2rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_remote_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group functions or methods under a service';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_remote_service2rpc`
--

LOCK TABLES `mdl_mnet_remote_service2rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_remote_service2rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_remote_service2rpc` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,2,8),(9,2,9),(10,3,10),(11,3,11),(12,3,12),(13,3,13),(14,3,14),(15,4,15),(16,4,16);
/*!40000 ALTER TABLE `mdl_mnet_remote_service2rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `help` longtext COLLATE utf8_unicode_ci NOT NULL,
  `profile` longtext COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Functions or methods that we may publish or subscribe to';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_rpc`
--

LOCK TABLES `mdl_mnet_rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_rpc` VALUES (1,'user_authorise','auth/mnet/auth.php/user_authorise','auth','mnet',1,'Return user data for the provided token, compare with user_agent string.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:5:\"token\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:37:\"The unique ID provided by remotehost.\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:18:\"User Agent string.\";}}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:44:\"$userdata Array of user info for remote host\";}}','auth.php','auth_plugin_mnet',0),(2,'keepalive_server','auth/mnet/auth.php/keepalive_server','auth','mnet',1,'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"array\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:21:\"An array of usernames\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"\"All ok\" or an error message\";}}','auth.php','auth_plugin_mnet',0),(3,'kill_children','auth/mnet/auth.php/kill_children','auth','mnet',1,'The IdP uses this function to kill child sessions on other hosts','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"Username for session to kill\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:35:\"SHA1 hash of user agent to look for\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:39:\"A plaintext report of what has happened\";}}','auth.php','auth_plugin_mnet',0),(4,'refresh_log','auth/mnet/auth.php/refresh_log','auth','mnet',1,'Receives an array of log entries from an SP and adds them to the mnet_log\ntable','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"array\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:21:\"An array of usernames\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"\"All ok\" or an error message\";}}','auth.php','auth_plugin_mnet',0),(5,'fetch_user_image','auth/mnet/auth.php/fetch_user_image','auth','mnet',1,'Returns the user\'s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\n f1          - the content of the default 100x100px image\n f1_mimetype - the mimetype of the f1 file\n f2          - the content of the 35x35px variant of the image\n f2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:18:\"The id of the user\";}}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:84:\"false if user not found, empty array if no picture exists, array with data otherwise\";}}','auth.php','auth_plugin_mnet',0),(6,'fetch_theme_info','auth/mnet/auth.php/fetch_theme_info','auth','mnet',1,'Returns the theme information and logo url as strings.','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:14:\"The theme info\";}}','auth.php','auth_plugin_mnet',0),(7,'update_enrolments','auth/mnet/auth.php/update_enrolments','auth','mnet',1,'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:12:\"The username\";}i:1;a:3:{s:4:\"name\";s:7:\"courses\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:75:\"Assoc array of courses following the structure of mnetservice_enrol_courses\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:0:\"\";}}','auth.php','auth_plugin_mnet',0),(8,'keepalive_client','auth/mnet/auth.php/keepalive_client','auth','mnet',1,'Poll the IdP server to let it know that a user it has authenticated is still\nonline','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"void\";s:11:\"description\";s:0:\"\";}}','auth.php','auth_plugin_mnet',0),(9,'kill_child','auth/mnet/auth.php/kill_child','auth','mnet',1,'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"Username for session to kill\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:35:\"SHA1 hash of user agent to look for\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:15:\"True on success\";}}','auth.php','auth_plugin_mnet',0),(10,'available_courses','enrol/mnet/enrol.php/available_courses','enrol','mnet',1,'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for \'All hosts\', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(11,'user_enrolments','enrol/mnet/enrol.php/user_enrolments','enrol','mnet',1,'This method has never been implemented in Moodle MNet API','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:11:\"empty array\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(12,'enrol_user','enrol/mnet/enrol.php/enrol_user','enrol','mnet',1,'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"userdata\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:14:\"user details {\";}i:1;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:19:\"our local course id\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:69:\"true if the enrolment has been successful, throws exception otherwise\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(13,'unenrol_user','enrol/mnet/enrol.php/unenrol_user','enrol','mnet',1,'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can\'t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:18:\"of the remote user\";}i:1;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:19:\"of our local course\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:71:\"true if the unenrolment has been successful, throws exception otherwise\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(14,'course_enrolments','enrol/mnet/enrol.php/course_enrolments','enrol','mnet',1,'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:16:\"ID of our course\";}i:1;a:3:{s:4:\"name\";s:5:\"roles\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:58:\"comma separated list of role shortnames (or array of them)\";}}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(15,'fetch_file','portfolio/mahara/lib.php/fetch_file','portfolio','mahara',1,'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"token\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:56:\"the token recieved previously during send_content_intent\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"void\";s:11:\"description\";s:0:\"\";}}','lib.php','portfolio_plugin_mahara',1);
/*!40000 ALTER TABLE `mdl_mnet_rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_service`
--

DROP TABLE IF EXISTS `mdl_mnet_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `apiversion` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `offer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A service is a group of functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_service`
--

LOCK TABLES `mdl_mnet_service` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_service` DISABLE KEYS */;
INSERT INTO `mdl_mnet_service` VALUES (1,'sso_idp','','1',1),(2,'sso_sp','','1',1),(3,'mnet_enrol','','1',1),(4,'pf','','1',1);
/*!40000 ALTER TABLE `mdl_mnet_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_service2rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_service2rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group functions or methods under a service';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_service2rpc`
--

LOCK TABLES `mdl_mnet_service2rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_service2rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_service2rpc` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,2,8),(9,2,9),(10,3,10),(11,3,11),(12,3,12),(13,3,13),(14,3,14),(15,4,15);
/*!40000 ALTER TABLE `mdl_mnet_service2rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_session`
--

DROP TABLE IF EXISTS `mdl_mnet_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `useragent` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) NOT NULL DEFAULT '0',
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store session data from users migrating to other sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_session`
--

LOCK TABLES `mdl_mnet_session` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_sso_access_control`
--

DROP TABLE IF EXISTS `mdl_mnet_sso_access_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_sso_access_control` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'allow',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users by host permitted (or not) to login from a remote prov';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_sso_access_control`
--

LOCK TABLES `mdl_mnet_sso_access_control` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_sso_access_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_sso_access_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnetservice_enrol_courses`
--

DROP TABLE IF EXISTS `mdl_mnetservice_enrol_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnetservice_enrol_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `remoteid` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL,
  `categoryname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `summaryformat` smallint(3) DEFAULT '0',
  `startdate` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Caches the information fetched via XML-RPC about courses on ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnetservice_enrol_courses`
--

LOCK TABLES `mdl_mnetservice_enrol_courses` WRITE;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnetservice_enrol_enrolments`
--

DROP TABLE IF EXISTS `mdl_mnetservice_enrol_enrolments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnetservice_enrol_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `remotecourseid` bigint(10) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enroltime` bigint(10) NOT NULL DEFAULT '0',
  `enroltype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetenroenro_use_ix` (`userid`),
  KEY `mdl_mnetenroenro_hos_ix` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Caches the information about enrolments of our local users i';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnetservice_enrol_enrolments`
--

LOCK TABLES `mdl_mnetservice_enrol_enrolments` WRITE;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_enrolments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_enrolments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_modules`
--

DROP TABLE IF EXISTS `mdl_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `search` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_modu_nam_ix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='modules available in the site';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_modules`
--

LOCK TABLES `mdl_modules` WRITE;
/*!40000 ALTER TABLE `mdl_modules` DISABLE KEYS */;
INSERT INTO `mdl_modules` VALUES (1,'assign',60,0,'',1),(2,'assignment',60,0,'',0),(3,'book',0,0,'',1),(4,'chat',300,0,'',1),(5,'choice',0,0,'',1),(6,'data',0,0,'',1),(7,'feedback',0,0,'',0),(8,'folder',0,0,'',1),(9,'forum',0,0,'',1),(10,'glossary',0,0,'',1),(11,'imscp',0,0,'',1),(12,'label',0,0,'',1),(13,'lesson',0,0,'',1),(14,'lti',0,0,'',1),(15,'page',0,0,'',1),(16,'quiz',60,0,'',1),(17,'resource',0,0,'',1),(18,'scorm',300,0,'',1),(19,'survey',0,0,'',1),(20,'url',0,0,'',1),(21,'wiki',0,0,'',1),(22,'workshop',60,0,'',1);
/*!40000 ALTER TABLE `mdl_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_my_pages`
--

DROP TABLE IF EXISTS `mdl_my_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_my_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) DEFAULT '0',
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mypage_usepri_ix` (`userid`,`private`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Extra user pages for the My Moodle system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_my_pages`
--

LOCK TABLES `mdl_my_pages` WRITE;
/*!40000 ALTER TABLE `mdl_my_pages` DISABLE KEYS */;
INSERT INTO `mdl_my_pages` VALUES (1,NULL,'__default',0,0),(2,NULL,'__default',1,0),(3,2,'__default',1,0);
/*!40000 ALTER TABLE `mdl_my_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_page`
--

DROP TABLE IF EXISTS `mdl_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_page` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_page_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one page and its config data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_page`
--

LOCK TABLES `mdl_page` WRITE;
/*!40000 ALTER TABLE `mdl_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_instance`
--

DROP TABLE IF EXISTS `mdl_portfolio_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='base table (not including config data) for instances of port';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_instance`
--

LOCK TABLES `mdl_portfolio_instance` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_instance_config`
--

DROP TABLE IF EXISTS `mdl_portfolio_instance_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstconf_nam_ix` (`name`),
  KEY `mdl_portinstconf_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='config for portfolio plugin instances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_instance_config`
--

LOCK TABLES `mdl_portfolio_instance_config` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_instance_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_instance_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_instance_user`
--

DROP TABLE IF EXISTS `mdl_portfolio_instance_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_instance_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstuser_ins_ix` (`instance`),
  KEY `mdl_portinstuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data for portfolio instances.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_instance_user`
--

LOCK TABLES `mdl_portfolio_instance_user` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_instance_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_instance_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_log`
--

DROP TABLE IF EXISTS `mdl_portfolio_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL,
  `portfolio` bigint(10) NOT NULL,
  `caller_class` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_file` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_sha1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `continueurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portlog_use_ix` (`userid`),
  KEY `mdl_portlog_por_ix` (`portfolio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='log of portfolio transfers (used to later check for duplicat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_log`
--

LOCK TABLES `mdl_portfolio_log` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_mahara_queue`
--

DROP TABLE IF EXISTS `mdl_portfolio_mahara_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_mahara_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `transferid` bigint(10) NOT NULL,
  `token` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portmahaqueu_tok_ix` (`token`),
  KEY `mdl_portmahaqueu_tra_ix` (`transferid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='maps mahara tokens to transfer ids';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_mahara_queue`
--

LOCK TABLES `mdl_portfolio_mahara_queue` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_mahara_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_mahara_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_tempdata`
--

DROP TABLE IF EXISTS `mdl_portfolio_tempdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_tempdata` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8_unicode_ci,
  `expirytime` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT '0',
  `queued` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_porttemp_use_ix` (`userid`),
  KEY `mdl_porttemp_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores temporary data for portfolio exports. the id of this ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_tempdata`
--

LOCK TABLES `mdl_portfolio_tempdata` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_tempdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_tempdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_post`
--

DROP TABLE IF EXISTS `mdl_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_post` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `moduleid` bigint(10) NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) NOT NULL DEFAULT '0',
  `subject` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `uniquehash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rating` bigint(10) NOT NULL DEFAULT '0',
  `format` bigint(10) NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publishstate` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  KEY `mdl_post_las_ix` (`lastmodified`),
  KEY `mdl_post_mod_ix` (`module`),
  KEY `mdl_post_sub_ix` (`subject`),
  KEY `mdl_post_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Generic post table to hold data blog entries etc in differen';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_post`
--

LOCK TABLES `mdl_post` WRITE;
/*!40000 ALTER TABLE `mdl_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_profiling`
--

DROP TABLE IF EXISTS `mdl_profiling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_profiling` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `runid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `totalexecutiontime` bigint(10) NOT NULL,
  `totalcputime` bigint(10) NOT NULL,
  `totalcalls` bigint(10) NOT NULL,
  `totalmemory` bigint(10) NOT NULL,
  `runreference` tinyint(2) NOT NULL DEFAULT '0',
  `runcomment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the results of all the profiling runs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_profiling`
--

LOCK TABLES `mdl_profiling` WRITE;
/*!40000 ALTER TABLE `mdl_profiling` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_profiling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_ddimageortext`
--

DROP TABLE IF EXISTS `mdl_qtype_ddimageortext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_ddimageortext` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddim_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines drag and drop (text or images onto a background imag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_ddimageortext`
--

LOCK TABLES `mdl_qtype_ddimageortext` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_ddimageortext_drags`
--

DROP TABLE IF EXISTS `mdl_qtype_ddimageortext_drags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_ddimageortext_drags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `draggroup` bigint(10) NOT NULL DEFAULT '0',
  `infinite` smallint(4) NOT NULL DEFAULT '0',
  `label` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddimdrag_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Images to drag. Actual file names are not stored here we use';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_ddimageortext_drags`
--

LOCK TABLES `mdl_qtype_ddimageortext_drags` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext_drags` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext_drags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_ddimageortext_drops`
--

DROP TABLE IF EXISTS `mdl_qtype_ddimageortext_drops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_ddimageortext_drops` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `xleft` bigint(10) NOT NULL DEFAULT '0',
  `ytop` bigint(10) NOT NULL DEFAULT '0',
  `choice` bigint(10) NOT NULL DEFAULT '0',
  `label` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddimdrop_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Drop boxes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_ddimageortext_drops`
--

LOCK TABLES `mdl_qtype_ddimageortext_drops` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext_drops` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddimageortext_drops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_ddmarker`
--

DROP TABLE IF EXISTS `mdl_qtype_ddmarker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_ddmarker` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  `showmisplaced` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddma_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines drag and drop (text or images onto a background imag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_ddmarker`
--

LOCK TABLES `mdl_qtype_ddmarker` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_ddmarker` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddmarker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_ddmarker_drags`
--

DROP TABLE IF EXISTS `mdl_qtype_ddmarker_drags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_ddmarker_drags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `label` longtext COLLATE utf8_unicode_ci NOT NULL,
  `infinite` smallint(4) NOT NULL DEFAULT '0',
  `noofdrags` bigint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddmadrag_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Labels for markers to drag.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_ddmarker_drags`
--

LOCK TABLES `mdl_qtype_ddmarker_drags` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_ddmarker_drags` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddmarker_drags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_ddmarker_drops`
--

DROP TABLE IF EXISTS `mdl_qtype_ddmarker_drops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_ddmarker_drops` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `shape` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coords` longtext COLLATE utf8_unicode_ci NOT NULL,
  `choice` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddmadrop_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='drop regions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_ddmarker_drops`
--

LOCK TABLES `mdl_qtype_ddmarker_drops` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_ddmarker_drops` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_ddmarker_drops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_essay_options`
--

DROP TABLE IF EXISTS `mdl_qtype_essay_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_essay_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `responseformat` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'editor',
  `responserequired` tinyint(2) NOT NULL DEFAULT '1',
  `responsefieldlines` smallint(4) NOT NULL DEFAULT '15',
  `attachments` smallint(4) NOT NULL DEFAULT '0',
  `attachmentsrequired` smallint(4) NOT NULL DEFAULT '0',
  `graderinfo` longtext COLLATE utf8_unicode_ci,
  `graderinfoformat` smallint(4) NOT NULL DEFAULT '0',
  `responsetemplate` longtext COLLATE utf8_unicode_ci,
  `responsetemplateformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Extra options for essay questions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_essay_options`
--

LOCK TABLES `mdl_qtype_essay_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_essay_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_essay_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_match_options`
--

DROP TABLE IF EXISTS `mdl_qtype_match_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_match_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmatcopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines the question-type specific options for matching ques';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_match_options`
--

LOCK TABLES `mdl_qtype_match_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_match_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_match_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_match_subquestions`
--

DROP TABLE IF EXISTS `mdl_qtype_match_subquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_match_subquestions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `questiontext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypmatcsubq_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The subquestions that make up a matching question';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_match_subquestions`
--

LOCK TABLES `mdl_qtype_match_subquestions` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_match_subquestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_match_subquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_multichoice_options`
--

DROP TABLE IF EXISTS `mdl_qtype_multichoice_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_multichoice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `layout` smallint(4) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmultopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for multiple choice questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_multichoice_options`
--

LOCK TABLES `mdl_qtype_multichoice_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_multichoice_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_multichoice_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_randomsamatch_options`
--

DROP TABLE IF EXISTS `mdl_qtype_randomsamatch_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_randomsamatch_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `choose` bigint(10) NOT NULL DEFAULT '4',
  `subcats` tinyint(2) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtyprandopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about a random short-answer matching question';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_randomsamatch_options`
--

LOCK TABLES `mdl_qtype_randomsamatch_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_randomsamatch_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_randomsamatch_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_shortanswer_options`
--

DROP TABLE IF EXISTS `mdl_qtype_shortanswer_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_shortanswer_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `usecase` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypshoropti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for short answer questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_shortanswer_options`
--

LOCK TABLES `mdl_qtype_shortanswer_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_shortanswer_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_shortanswer_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question`
--

DROP TABLE IF EXISTS `mdl_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `questiontext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `generalfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `generalfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `length` bigint(10) NOT NULL DEFAULT '1',
  `stamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `createdby` bigint(10) DEFAULT NULL,
  `modifiedby` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ques_qty_ix` (`qtype`),
  KEY `mdl_ques_cat_ix` (`category`),
  KEY `mdl_ques_par_ix` (`parent`),
  KEY `mdl_ques_cre_ix` (`createdby`),
  KEY `mdl_ques_mod_ix` (`modifiedby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The questions themselves';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question`
--

LOCK TABLES `mdl_question` WRITE;
/*!40000 ALTER TABLE `mdl_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_answers`
--

DROP TABLE IF EXISTS `mdl_question_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Answers, with a fractional grade (0-1) and feedback';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_answers`
--

LOCK TABLES `mdl_question_answers` WRITE;
/*!40000 ALTER TABLE `mdl_question_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_attempt_step_data`
--

DROP TABLE IF EXISTS `mdl_question_attempt_step_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_attempt_step_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptstepid` bigint(10) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each question_attempt_step has an associative array of the d';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_attempt_step_data`
--

LOCK TABLES `mdl_question_attempt_step_data` WRITE;
/*!40000 ALTER TABLE `mdl_question_attempt_step_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_attempt_step_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_attempt_steps`
--

DROP TABLE IF EXISTS `mdl_question_attempt_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_attempt_steps` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionattemptid` bigint(10) NOT NULL,
  `sequencenumber` bigint(10) NOT NULL,
  `state` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`),
  KEY `mdl_quesattestep_que_ix` (`questionattemptid`),
  KEY `mdl_quesattestep_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores one step in in a question attempt. As well as the dat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_attempt_steps`
--

LOCK TABLES `mdl_question_attempt_steps` WRITE;
/*!40000 ALTER TABLE `mdl_question_attempt_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_attempt_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_attempts`
--

DROP TABLE IF EXISTS `mdl_question_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `behaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `maxfraction` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `flagged` tinyint(1) NOT NULL DEFAULT '0',
  `questionsummary` longtext COLLATE utf8_unicode_ci,
  `rightanswer` longtext COLLATE utf8_unicode_ci,
  `responsesummary` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`),
  KEY `mdl_quesatte_beh_ix` (`behaviour`),
  KEY `mdl_quesatte_que_ix` (`questionid`),
  KEY `mdl_quesatte_que2_ix` (`questionusageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each row here corresponds to an attempt at one question, as ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_attempts`
--

LOCK TABLES `mdl_question_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_question_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_calculated`
--

DROP TABLE IF EXISTS `mdl_question_calculated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_calculated` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint(10) NOT NULL DEFAULT '1',
  `correctanswerlength` bigint(10) NOT NULL DEFAULT '2',
  `correctanswerformat` bigint(10) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalc_ans_ix` (`answer`),
  KEY `mdl_quescalc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type calculated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_calculated`
--

LOCK TABLES `mdl_question_calculated` WRITE;
/*!40000 ALTER TABLE `mdl_question_calculated` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_calculated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_calculated_options`
--

DROP TABLE IF EXISTS `mdl_question_calculated_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_calculated_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `synchronize` tinyint(2) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `correctfeedback` longtext COLLATE utf8_unicode_ci,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalcopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type calculated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_calculated_options`
--

LOCK TABLES `mdl_question_calculated_options` WRITE;
/*!40000 ALTER TABLE `mdl_question_calculated_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_calculated_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_categories`
--

DROP TABLE IF EXISTS `mdl_question_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `info` longtext COLLATE utf8_unicode_ci NOT NULL,
  `infoformat` tinyint(2) NOT NULL DEFAULT '0',
  `stamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '999',
  PRIMARY KEY (`id`),
  KEY `mdl_quescate_con_ix` (`contextid`),
  KEY `mdl_quescate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Categories are for grouping questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_categories`
--

LOCK TABLES `mdl_question_categories` WRITE;
/*!40000 ALTER TABLE `mdl_question_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_dataset_definitions`
--

DROP TABLE IF EXISTS `mdl_question_dataset_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_dataset_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` bigint(10) NOT NULL DEFAULT '0',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemcount` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdatadefi_cat_ix` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Organises and stores properties for dataset items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_dataset_definitions`
--

LOCK TABLES `mdl_question_dataset_definitions` WRITE;
/*!40000 ALTER TABLE `mdl_question_dataset_definitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_dataset_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_dataset_items`
--

DROP TABLE IF EXISTS `mdl_question_dataset_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_dataset_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definition` bigint(10) NOT NULL DEFAULT '0',
  `itemnumber` bigint(10) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdataitem_def_ix` (`definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Individual dataset items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_dataset_items`
--

LOCK TABLES `mdl_question_dataset_items` WRITE;
/*!40000 ALTER TABLE `mdl_question_dataset_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_dataset_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_datasets`
--

DROP TABLE IF EXISTS `mdl_question_datasets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_datasets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `datasetdefinition` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  KEY `mdl_quesdata_que_ix` (`question`),
  KEY `mdl_quesdata_dat_ix` (`datasetdefinition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Many-many relation between questions and dataset definitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_datasets`
--

LOCK TABLES `mdl_question_datasets` WRITE;
/*!40000 ALTER TABLE `mdl_question_datasets` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_datasets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_ddwtos`
--

DROP TABLE IF EXISTS `mdl_question_ddwtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_ddwtos` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesddwt_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines drag and drop (words into sentences) questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_ddwtos`
--

LOCK TABLES `mdl_question_ddwtos` WRITE;
/*!40000 ALTER TABLE `mdl_question_ddwtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_ddwtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_gapselect`
--

DROP TABLE IF EXISTS `mdl_question_gapselect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_gapselect` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesgaps_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines select missing words questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_gapselect`
--

LOCK TABLES `mdl_question_gapselect` WRITE;
/*!40000 ALTER TABLE `mdl_question_gapselect` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_gapselect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_hints`
--

DROP TABLE IF EXISTS `mdl_question_hints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_hints` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `hint` longtext COLLATE utf8_unicode_ci NOT NULL,
  `hintformat` smallint(4) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) DEFAULT NULL,
  `clearwrong` tinyint(1) DEFAULT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_queshint_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the the part of the question definition that gives di';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_hints`
--

LOCK TABLES `mdl_question_hints` WRITE;
/*!40000 ALTER TABLE `mdl_question_hints` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_hints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_multianswer`
--

DROP TABLE IF EXISTS `mdl_question_multianswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_multianswer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `sequence` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for multianswer questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_multianswer`
--

LOCK TABLES `mdl_question_multianswer` WRITE;
/*!40000 ALTER TABLE `mdl_question_multianswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_multianswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_numerical`
--

DROP TABLE IF EXISTS `mdl_question_numerical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_numerical` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnume_ans_ix` (`answer`),
  KEY `mdl_quesnume_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for numerical questions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_numerical`
--

LOCK TABLES `mdl_question_numerical` WRITE;
/*!40000 ALTER TABLE `mdl_question_numerical` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_numerical_options`
--

DROP TABLE IF EXISTS `mdl_question_numerical_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_numerical_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `showunits` smallint(4) NOT NULL DEFAULT '0',
  `unitsleft` smallint(4) NOT NULL DEFAULT '0',
  `unitgradingtype` smallint(4) NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) NOT NULL DEFAULT '0.1000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnumeopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type numerical This table is also u';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_numerical_options`
--

LOCK TABLES `mdl_question_numerical_options` WRITE;
/*!40000 ALTER TABLE `mdl_question_numerical_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_numerical_units`
--

DROP TABLE IF EXISTS `mdl_question_numerical_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_numerical_units` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `multiplier` decimal(40,20) NOT NULL DEFAULT '1.00000000000000000000',
  `unit` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  KEY `mdl_quesnumeunit_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Optional unit options for numerical questions. This table is';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_numerical_units`
--

LOCK TABLES `mdl_question_numerical_units` WRITE;
/*!40000 ALTER TABLE `mdl_question_numerical_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_response_analysis`
--

DROP TABLE IF EXISTS `mdl_question_response_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_response_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `whichtries` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) DEFAULT NULL,
  `subqid` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `response` longtext COLLATE utf8_unicode_ci,
  `credit` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Analysis of student responses given to questions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_response_analysis`
--

LOCK TABLES `mdl_question_response_analysis` WRITE;
/*!40000 ALTER TABLE `mdl_question_response_analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_response_analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_response_count`
--

DROP TABLE IF EXISTS `mdl_question_response_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_response_count` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `analysisid` bigint(10) NOT NULL,
  `try` bigint(10) NOT NULL,
  `rcount` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesrespcoun_ana_ix` (`analysisid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Count for each responses for each try at a question.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_response_count`
--

LOCK TABLES `mdl_question_response_count` WRITE;
/*!40000 ALTER TABLE `mdl_question_response_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_response_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_statistics`
--

DROP TABLE IF EXISTS `mdl_question_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `slot` bigint(10) DEFAULT NULL,
  `subquestion` smallint(4) NOT NULL,
  `variant` bigint(10) DEFAULT NULL,
  `s` bigint(10) NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint(2) NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` longtext COLLATE utf8_unicode_ci,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` longtext COLLATE utf8_unicode_ci,
  `randomguessscore` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Statistics for individual questions used in an activity.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_statistics`
--

LOCK TABLES `mdl_question_statistics` WRITE;
/*!40000 ALTER TABLE `mdl_question_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_truefalse`
--

DROP TABLE IF EXISTS `mdl_question_truefalse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_truefalse` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `trueanswer` bigint(10) NOT NULL DEFAULT '0',
  `falseanswer` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_questrue_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for True-False questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_truefalse`
--

LOCK TABLES `mdl_question_truefalse` WRITE;
/*!40000 ALTER TABLE `mdl_question_truefalse` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_truefalse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_usages`
--

DROP TABLE IF EXISTS `mdl_question_usages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_usages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesusag_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table''s main purpose it to assign a unique id to each a';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_usages`
--

LOCK TABLES `mdl_question_usages` WRITE;
/*!40000 ALTER TABLE `mdl_question_usages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_usages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz`
--

DROP TABLE IF EXISTS `mdl_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `overduehandling` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'autoabandon',
  `graceperiod` bigint(10) NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `canredoquestions` smallint(4) NOT NULL DEFAULT '0',
  `attempts` mediumint(6) NOT NULL DEFAULT '0',
  `attemptonlast` smallint(4) NOT NULL DEFAULT '0',
  `grademethod` smallint(4) NOT NULL DEFAULT '1',
  `decimalpoints` smallint(4) NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint(4) NOT NULL DEFAULT '-1',
  `reviewattempt` mediumint(6) NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint(6) NOT NULL DEFAULT '0',
  `reviewmarks` mediumint(6) NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint(6) NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `questionsperpage` bigint(10) NOT NULL DEFAULT '0',
  `navmethod` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'free',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subnet` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `browsersecurity` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delay1` bigint(10) NOT NULL DEFAULT '0',
  `delay2` bigint(10) NOT NULL DEFAULT '0',
  `showuserpicture` smallint(4) NOT NULL DEFAULT '0',
  `showblocks` smallint(4) NOT NULL DEFAULT '0',
  `completionattemptsexhausted` tinyint(1) DEFAULT '0',
  `completionpass` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quiz_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The settings for each quiz.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz`
--

LOCK TABLES `mdl_quiz` WRITE;
/*!40000 ALTER TABLE `mdl_quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_attempts`
--

DROP TABLE IF EXISTS `mdl_quiz_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` mediumint(6) NOT NULL DEFAULT '0',
  `uniqueid` bigint(10) NOT NULL DEFAULT '0',
  `layout` longtext COLLATE utf8_unicode_ci NOT NULL,
  `currentpage` bigint(10) NOT NULL DEFAULT '0',
  `preview` smallint(3) NOT NULL DEFAULT '0',
  `state` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inprogress',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timefinish` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timecheckstate` bigint(10) DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizatte_quiuseatt_uix` (`quiz`,`userid`,`attempt`),
  UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  KEY `mdl_quizatte_statim_ix` (`state`,`timecheckstate`),
  KEY `mdl_quizatte_qui_ix` (`quiz`),
  KEY `mdl_quizatte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores users attempts at quizzes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_attempts`
--

LOCK TABLES `mdl_quiz_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_feedback`
--

DROP TABLE IF EXISTS `mdl_quiz_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `feedbacktext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedbacktextformat` tinyint(2) NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizfeed_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Feedback given to students based on which grade band their o';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_feedback`
--

LOCK TABLES `mdl_quiz_feedback` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_grades`
--

DROP TABLE IF EXISTS `mdl_quiz_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quizgrad_use_ix` (`userid`),
  KEY `mdl_quizgrad_qui_ix` (`quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the overall grade for each user on the quiz, based on';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_grades`
--

LOCK TABLES `mdl_quiz_grades` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_overrides`
--

DROP TABLE IF EXISTS `mdl_quiz_overrides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `timeopen` bigint(10) DEFAULT NULL,
  `timeclose` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `attempts` mediumint(6) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quizover_qui_ix` (`quiz`),
  KEY `mdl_quizover_gro_ix` (`groupid`),
  KEY `mdl_quizover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The overrides to quiz settings on a per-user and per-group b';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_overrides`
--

LOCK TABLES `mdl_quiz_overrides` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_overrides` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_overrides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_overview_regrades`
--

DROP TABLE IF EXISTS `mdl_quiz_overview_regrades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_overview_regrades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table records which question attempts need regrading an';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_overview_regrades`
--

LOCK TABLES `mdl_quiz_overview_regrades` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_overview_regrades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_overview_regrades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_reports`
--

DROP TABLE IF EXISTS `mdl_quiz_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_reports` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayorder` bigint(10) NOT NULL,
  `capability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists all the installed quiz reports and their display order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_reports`
--

LOCK TABLES `mdl_quiz_reports` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_reports` DISABLE KEYS */;
INSERT INTO `mdl_quiz_reports` VALUES (1,'grading',6000,'mod/quiz:grade'),(2,'overview',10000,NULL),(3,'responses',9000,NULL),(4,'statistics',8000,'quiz/statistics:view');
/*!40000 ALTER TABLE `mdl_quiz_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_sections`
--

DROP TABLE IF EXISTS `mdl_quiz_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_sections` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL,
  `firstslot` bigint(10) NOT NULL,
  `heading` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shufflequestions` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizsect_quifir_uix` (`quizid`,`firstslot`),
  KEY `mdl_quizsect_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores sections of a quiz with section name (heading), from ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_sections`
--

LOCK TABLES `mdl_quiz_sections` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_slots`
--

DROP TABLE IF EXISTS `mdl_quiz_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_slots` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `slot` bigint(10) NOT NULL,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `page` bigint(10) NOT NULL,
  `requireprevious` smallint(4) NOT NULL DEFAULT '0',
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `maxmark` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizslot_quislo_uix` (`quizid`,`slot`),
  KEY `mdl_quizslot_qui_ix` (`quizid`),
  KEY `mdl_quizslot_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the question used in a quiz, with the order, and for ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_slots`
--

LOCK TABLES `mdl_quiz_slots` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_statistics`
--

DROP TABLE IF EXISTS `mdl_quiz_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `whichattempts` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstattemptscount` bigint(10) NOT NULL,
  `highestattemptscount` bigint(10) NOT NULL,
  `lastattemptscount` bigint(10) NOT NULL,
  `allattemptscount` bigint(10) NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `highestattemptsavg` decimal(15,5) DEFAULT NULL,
  `lastattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='table to cache results from analysis done in statistics repo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_statistics`
--

LOCK TABLES `mdl_quiz_statistics` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_rating`
--

DROP TABLE IF EXISTS `mdl_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_rating` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ratingarea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `scaleid` bigint(10) NOT NULL,
  `rating` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`),
  KEY `mdl_rati_con_ix` (`contextid`),
  KEY `mdl_rati_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle ratings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_rating`
--

LOCK TABLES `mdl_rating` WRITE;
/*!40000 ALTER TABLE `mdl_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_registration_hubs`
--

DROP TABLE IF EXISTS `mdl_registration_hubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_registration_hubs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hubname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `huburl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='hub where the site is registered on with their associated to';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_registration_hubs`
--

LOCK TABLES `mdl_registration_hubs` WRITE;
/*!40000 ALTER TABLE `mdl_registration_hubs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_registration_hubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_repository`
--

DROP TABLE IF EXISTS `mdl_repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_repository` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains one entry for every configured external ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_repository`
--

LOCK TABLES `mdl_repository` WRITE;
/*!40000 ALTER TABLE `mdl_repository` DISABLE KEYS */;
INSERT INTO `mdl_repository` VALUES (1,'areafiles',1,1),(2,'local',1,2),(3,'recent',1,3),(4,'upload',1,4),(5,'url',1,5),(6,'user',1,6),(7,'wikimedia',1,7);
/*!40000 ALTER TABLE `mdl_repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_repository_instance_config`
--

DROP TABLE IF EXISTS `mdl_repository_instance_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_repository_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The config for intances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_repository_instance_config`
--

LOCK TABLES `mdl_repository_instance_config` WRITE;
/*!40000 ALTER TABLE `mdl_repository_instance_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_repository_instance_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_repository_instances`
--

DROP TABLE IF EXISTS `mdl_repository_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_repository_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `typeid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains one entry for every configured external ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_repository_instances`
--

LOCK TABLES `mdl_repository_instances` WRITE;
/*!40000 ALTER TABLE `mdl_repository_instances` DISABLE KEYS */;
INSERT INTO `mdl_repository_instances` VALUES (1,'',1,0,1,NULL,NULL,1490726083,1490726083,0),(2,'',2,0,1,NULL,NULL,1490726085,1490726085,0),(3,'',3,0,1,NULL,NULL,1490726087,1490726087,0),(4,'',4,0,1,NULL,NULL,1490726088,1490726088,0),(5,'',5,0,1,NULL,NULL,1490726088,1490726088,0),(6,'',6,0,1,NULL,NULL,1490726089,1490726089,0),(7,'',7,0,1,NULL,NULL,1490726090,1490726090,0);
/*!40000 ALTER TABLE `mdl_repository_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_resource`
--

DROP TABLE IF EXISTS `mdl_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_resource` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `tobemigrated` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `filterfiles` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_reso_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one resource and its config data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_resource`
--

LOCK TABLES `mdl_resource` WRITE;
/*!40000 ALTER TABLE `mdl_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_resource_old`
--

DROP TABLE IF EXISTS `mdl_resource_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_resource_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alltext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `popup` longtext COLLATE utf8_unicode_ci NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `cmid` bigint(10) DEFAULT NULL,
  `newmodule` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  `migrated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_resoold_old_uix` (`oldid`),
  KEY `mdl_resoold_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='backup of all old resource instances from 1.9';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_resource_old`
--

LOCK TABLES `mdl_resource_old` WRITE;
/*!40000 ALTER TABLE `mdl_resource_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_resource_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role`
--

DROP TABLE IF EXISTS `mdl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `archetype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_role_sor_uix` (`sortorder`),
  UNIQUE KEY `mdl_role_sho_uix` (`shortname`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role`
--

LOCK TABLES `mdl_role` WRITE;
/*!40000 ALTER TABLE `mdl_role` DISABLE KEYS */;
INSERT INTO `mdl_role` VALUES (1,'','manager','',1,'manager'),(2,'','coursecreator','',2,'coursecreator'),(3,'','editingteacher','',3,'editingteacher'),(4,'','teacher','',4,'teacher'),(5,'','student','',5,'student'),(6,'','guest','',6,'guest'),(7,'','user','',7,'user'),(8,'','frontpage','',8,'frontpage');
/*!40000 ALTER TABLE `mdl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_allow_assign`
--

DROP TABLE IF EXISTS `mdl_role_allow_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_allow_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowassign` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  KEY `mdl_rolealloassi_all_ix` (`allowassign`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines what role can assign what role';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_allow_assign`
--

LOCK TABLES `mdl_role_allow_assign` WRITE;
/*!40000 ALTER TABLE `mdl_role_allow_assign` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_assign` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,3,4),(7,3,5);
/*!40000 ALTER TABLE `mdl_role_allow_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_allow_override`
--

DROP TABLE IF EXISTS `mdl_role_allow_override`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_allow_override` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowoverride` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  KEY `mdl_rolealloover_rol_ix` (`roleid`),
  KEY `mdl_rolealloover_all_ix` (`allowoverride`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines what role can override what role';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_allow_override`
--

LOCK TABLES `mdl_role_allow_override` WRITE;
/*!40000 ALTER TABLE `mdl_role_allow_override` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_override` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,3,4),(10,3,5),(11,3,6);
/*!40000 ALTER TABLE `mdl_role_allow_override` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_allow_switch`
--

DROP TABLE IF EXISTS `mdl_role_allow_switch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_allow_switch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `allowswitch` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  KEY `mdl_rolealloswit_rol_ix` (`roleid`),
  KEY `mdl_rolealloswit_all_ix` (`allowswitch`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores which which other roles a user is allowed ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_allow_switch`
--

LOCK TABLES `mdl_role_allow_switch` WRITE;
/*!40000 ALTER TABLE `mdl_role_allow_switch` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_switch` VALUES (1,1,3),(2,1,4),(3,1,5),(4,1,6),(5,3,4),(6,3,5),(7,3,6),(8,4,5),(9,4,6);
/*!40000 ALTER TABLE `mdl_role_allow_switch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_assignments`
--

DROP TABLE IF EXISTS `mdl_role_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_assignments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_roleassi_sor_ix` (`sortorder`),
  KEY `mdl_roleassi_rolcon_ix` (`roleid`,`contextid`),
  KEY `mdl_roleassi_useconrol_ix` (`userid`,`contextid`,`roleid`),
  KEY `mdl_roleassi_comiteuse_ix` (`component`,`itemid`,`userid`),
  KEY `mdl_roleassi_rol_ix` (`roleid`),
  KEY `mdl_roleassi_con_ix` (`contextid`),
  KEY `mdl_roleassi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='assigning roles in different context';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_assignments`
--

LOCK TABLES `mdl_role_assignments` WRITE;
/*!40000 ALTER TABLE `mdl_role_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_role_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_capabilities`
--

DROP TABLE IF EXISTS `mdl_role_capabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `capability` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `permission` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  KEY `mdl_rolecapa_rol_ix` (`roleid`),
  KEY `mdl_rolecapa_con_ix` (`contextid`),
  KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  KEY `mdl_rolecapa_cap_ix` (`capability`)
) ENGINE=InnoDB AUTO_INCREMENT=1166 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='permission has to be signed, overriding a capability for a p';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_capabilities`
--

LOCK TABLES `mdl_role_capabilities` WRITE;
/*!40000 ALTER TABLE `mdl_role_capabilities` DISABLE KEYS */;
INSERT INTO `mdl_role_capabilities` VALUES (1,1,1,'moodle/site:readallmessages',1,1490725895,0),(2,1,3,'moodle/site:readallmessages',1,1490725895,0),(3,1,1,'moodle/site:deleteanymessage',1,1490725895,0),(4,1,1,'moodle/site:sendmessage',1,1490725895,0),(5,1,7,'moodle/site:sendmessage',1,1490725895,0),(6,1,7,'moodle/site:deleteownmessage',1,1490725895,0),(7,1,1,'moodle/site:approvecourse',1,1490725895,0),(8,1,3,'moodle/backup:backupcourse',1,1490725895,0),(9,1,1,'moodle/backup:backupcourse',1,1490725895,0),(10,1,3,'moodle/backup:backupsection',1,1490725895,0),(11,1,1,'moodle/backup:backupsection',1,1490725895,0),(12,1,3,'moodle/backup:backupactivity',1,1490725895,0),(13,1,1,'moodle/backup:backupactivity',1,1490725895,0),(14,1,3,'moodle/backup:backuptargethub',1,1490725895,0),(15,1,1,'moodle/backup:backuptargethub',1,1490725895,0),(16,1,3,'moodle/backup:backuptargetimport',1,1490725896,0),(17,1,1,'moodle/backup:backuptargetimport',1,1490725896,0),(18,1,3,'moodle/backup:downloadfile',1,1490725896,0),(19,1,1,'moodle/backup:downloadfile',1,1490725896,0),(20,1,3,'moodle/backup:configure',1,1490725896,0),(21,1,1,'moodle/backup:configure',1,1490725896,0),(22,1,1,'moodle/backup:userinfo',1,1490725896,0),(23,1,1,'moodle/backup:anonymise',1,1490725896,0),(24,1,3,'moodle/restore:restorecourse',1,1490725896,0),(25,1,1,'moodle/restore:restorecourse',1,1490725896,0),(26,1,3,'moodle/restore:restoresection',1,1490725896,0),(27,1,1,'moodle/restore:restoresection',1,1490725896,0),(28,1,3,'moodle/restore:restoreactivity',1,1490725896,0),(29,1,1,'moodle/restore:restoreactivity',1,1490725896,0),(30,1,3,'moodle/restore:restoretargethub',1,1490725896,0),(31,1,1,'moodle/restore:restoretargethub',1,1490725896,0),(32,1,3,'moodle/restore:restoretargetimport',1,1490725896,0),(33,1,1,'moodle/restore:restoretargetimport',1,1490725896,0),(34,1,3,'moodle/restore:uploadfile',1,1490725896,0),(35,1,1,'moodle/restore:uploadfile',1,1490725896,0),(36,1,3,'moodle/restore:configure',1,1490725897,0),(37,1,1,'moodle/restore:configure',1,1490725897,0),(38,1,2,'moodle/restore:rolldates',1,1490725897,0),(39,1,1,'moodle/restore:rolldates',1,1490725897,0),(40,1,1,'moodle/restore:userinfo',1,1490725897,0),(41,1,1,'moodle/restore:createuser',1,1490725897,0),(42,1,3,'moodle/site:manageblocks',1,1490725897,0),(43,1,1,'moodle/site:manageblocks',1,1490725897,0),(44,1,4,'moodle/site:accessallgroups',1,1490725897,0),(45,1,3,'moodle/site:accessallgroups',1,1490725897,0),(46,1,1,'moodle/site:accessallgroups',1,1490725897,0),(47,1,4,'moodle/site:viewfullnames',1,1490725897,0),(48,1,3,'moodle/site:viewfullnames',1,1490725897,0),(49,1,1,'moodle/site:viewfullnames',1,1490725897,0),(50,1,4,'moodle/site:viewuseridentity',1,1490725897,0),(51,1,3,'moodle/site:viewuseridentity',1,1490725897,0),(52,1,1,'moodle/site:viewuseridentity',1,1490725897,0),(53,1,4,'moodle/site:viewreports',1,1490725897,0),(54,1,3,'moodle/site:viewreports',1,1490725897,0),(55,1,1,'moodle/site:viewreports',1,1490725898,0),(56,1,3,'moodle/site:trustcontent',1,1490725898,0),(57,1,1,'moodle/site:trustcontent',1,1490725898,0),(58,1,1,'moodle/site:uploadusers',1,1490725898,0),(59,1,3,'moodle/filter:manage',1,1490725898,0),(60,1,1,'moodle/filter:manage',1,1490725898,0),(61,1,1,'moodle/user:create',1,1490725898,0),(62,1,1,'moodle/user:delete',1,1490725898,0),(63,1,1,'moodle/user:update',1,1490725898,0),(64,1,6,'moodle/user:viewdetails',1,1490725898,0),(65,1,5,'moodle/user:viewdetails',1,1490725898,0),(66,1,4,'moodle/user:viewdetails',1,1490725898,0),(67,1,3,'moodle/user:viewdetails',1,1490725898,0),(68,1,1,'moodle/user:viewdetails',1,1490725898,0),(69,1,1,'moodle/user:viewalldetails',1,1490725898,0),(70,1,1,'moodle/user:viewlastip',1,1490725898,0),(71,1,4,'moodle/user:viewhiddendetails',1,1490725899,0),(72,1,3,'moodle/user:viewhiddendetails',1,1490725899,0),(73,1,1,'moodle/user:viewhiddendetails',1,1490725899,0),(74,1,1,'moodle/user:loginas',1,1490725899,0),(75,1,1,'moodle/user:managesyspages',1,1490725899,0),(76,1,7,'moodle/user:manageownblocks',1,1490725899,0),(77,1,7,'moodle/user:manageownfiles',1,1490725899,0),(78,1,1,'moodle/my:configsyspages',1,1490725899,0),(79,1,3,'moodle/role:assign',1,1490725899,0),(80,1,1,'moodle/role:assign',1,1490725899,0),(81,1,4,'moodle/role:review',1,1490725899,0),(82,1,3,'moodle/role:review',1,1490725899,0),(83,1,1,'moodle/role:review',1,1490725899,0),(84,1,1,'moodle/role:override',1,1490725899,0),(85,1,3,'moodle/role:safeoverride',1,1490725900,0),(86,1,1,'moodle/role:manage',1,1490725900,0),(87,1,3,'moodle/role:switchroles',1,1490725900,0),(88,1,1,'moodle/role:switchroles',1,1490725900,0),(89,1,1,'moodle/category:manage',1,1490725900,0),(90,1,2,'moodle/category:viewhiddencategories',1,1490725900,0),(91,1,1,'moodle/category:viewhiddencategories',1,1490725900,0),(92,1,1,'moodle/cohort:manage',1,1490725900,0),(93,1,1,'moodle/cohort:assign',1,1490725900,0),(94,1,3,'moodle/cohort:view',1,1490725900,0),(95,1,1,'moodle/cohort:view',1,1490725900,0),(96,1,2,'moodle/course:create',1,1490725900,0),(97,1,1,'moodle/course:create',1,1490725900,0),(98,1,7,'moodle/course:request',1,1490725900,0),(99,1,1,'moodle/course:delete',1,1490725900,0),(100,1,3,'moodle/course:update',1,1490725900,0),(101,1,1,'moodle/course:update',1,1490725900,0),(102,1,1,'moodle/course:view',1,1490725901,0),(103,1,3,'moodle/course:enrolreview',1,1490725901,0),(104,1,1,'moodle/course:enrolreview',1,1490725901,0),(105,1,3,'moodle/course:enrolconfig',1,1490725901,0),(106,1,1,'moodle/course:enrolconfig',1,1490725901,0),(107,1,3,'moodle/course:reviewotherusers',1,1490725901,0),(108,1,1,'moodle/course:reviewotherusers',1,1490725901,0),(109,1,4,'moodle/course:bulkmessaging',1,1490725901,0),(110,1,3,'moodle/course:bulkmessaging',1,1490725901,0),(111,1,1,'moodle/course:bulkmessaging',1,1490725901,0),(112,1,4,'moodle/course:viewhiddenuserfields',1,1490725901,0),(113,1,3,'moodle/course:viewhiddenuserfields',1,1490725901,0),(114,1,1,'moodle/course:viewhiddenuserfields',1,1490725901,0),(115,1,2,'moodle/course:viewhiddencourses',1,1490725901,0),(116,1,4,'moodle/course:viewhiddencourses',1,1490725901,0),(117,1,3,'moodle/course:viewhiddencourses',1,1490725901,0),(118,1,1,'moodle/course:viewhiddencourses',1,1490725901,0),(119,1,3,'moodle/course:visibility',1,1490725902,0),(120,1,1,'moodle/course:visibility',1,1490725902,0),(121,1,3,'moodle/course:managefiles',1,1490725902,0),(122,1,1,'moodle/course:managefiles',1,1490725902,0),(123,1,3,'moodle/course:manageactivities',1,1490725902,0),(124,1,1,'moodle/course:manageactivities',1,1490725902,0),(125,1,3,'moodle/course:activityvisibility',1,1490725902,0),(126,1,1,'moodle/course:activityvisibility',1,1490725902,0),(127,1,4,'moodle/course:viewhiddenactivities',1,1490725902,0),(128,1,3,'moodle/course:viewhiddenactivities',1,1490725902,0),(129,1,1,'moodle/course:viewhiddenactivities',1,1490725902,0),(130,1,5,'moodle/course:viewparticipants',1,1490725903,0),(131,1,4,'moodle/course:viewparticipants',1,1490725903,0),(132,1,3,'moodle/course:viewparticipants',1,1490725903,0),(133,1,1,'moodle/course:viewparticipants',1,1490725903,0),(134,1,3,'moodle/course:changefullname',1,1490725903,0),(135,1,1,'moodle/course:changefullname',1,1490725903,0),(136,1,3,'moodle/course:changeshortname',1,1490725903,0),(137,1,1,'moodle/course:changeshortname',1,1490725903,0),(138,1,3,'moodle/course:changeidnumber',1,1490725903,0),(139,1,1,'moodle/course:changeidnumber',1,1490725903,0),(140,1,3,'moodle/course:changecategory',1,1490725903,0),(141,1,1,'moodle/course:changecategory',1,1490725903,0),(142,1,3,'moodle/course:changesummary',1,1490725903,0),(143,1,1,'moodle/course:changesummary',1,1490725903,0),(144,1,1,'moodle/site:viewparticipants',1,1490725903,0),(145,1,5,'moodle/course:isincompletionreports',1,1490725903,0),(146,1,5,'moodle/course:viewscales',1,1490725903,0),(147,1,4,'moodle/course:viewscales',1,1490725903,0),(148,1,3,'moodle/course:viewscales',1,1490725903,0),(149,1,1,'moodle/course:viewscales',1,1490725903,0),(150,1,3,'moodle/course:managescales',1,1490725904,0),(151,1,1,'moodle/course:managescales',1,1490725904,0),(152,1,3,'moodle/course:managegroups',1,1490725904,0),(153,1,1,'moodle/course:managegroups',1,1490725904,0),(154,1,3,'moodle/course:reset',1,1490725904,0),(155,1,1,'moodle/course:reset',1,1490725904,0),(156,1,3,'moodle/course:viewsuspendedusers',1,1490725904,0),(157,1,1,'moodle/course:viewsuspendedusers',1,1490725904,0),(158,1,1,'moodle/course:tag',1,1490725904,0),(159,1,3,'moodle/course:tag',1,1490725904,0),(160,1,6,'moodle/blog:view',1,1490725904,0),(161,1,7,'moodle/blog:view',1,1490725904,0),(162,1,5,'moodle/blog:view',1,1490725904,0),(163,1,4,'moodle/blog:view',1,1490725904,0),(164,1,3,'moodle/blog:view',1,1490725904,0),(165,1,1,'moodle/blog:view',1,1490725904,0),(166,1,6,'moodle/blog:search',1,1490725904,0),(167,1,7,'moodle/blog:search',1,1490725904,0),(168,1,5,'moodle/blog:search',1,1490725904,0),(169,1,4,'moodle/blog:search',1,1490725904,0),(170,1,3,'moodle/blog:search',1,1490725904,0),(171,1,1,'moodle/blog:search',1,1490725904,0),(172,1,1,'moodle/blog:viewdrafts',1,1490725905,0),(173,1,7,'moodle/blog:create',1,1490725905,0),(174,1,1,'moodle/blog:create',1,1490725905,0),(175,1,4,'moodle/blog:manageentries',1,1490725905,0),(176,1,3,'moodle/blog:manageentries',1,1490725905,0),(177,1,1,'moodle/blog:manageentries',1,1490725905,0),(178,1,5,'moodle/blog:manageexternal',1,1490725905,0),(179,1,7,'moodle/blog:manageexternal',1,1490725905,0),(180,1,4,'moodle/blog:manageexternal',1,1490725905,0),(181,1,3,'moodle/blog:manageexternal',1,1490725905,0),(182,1,1,'moodle/blog:manageexternal',1,1490725905,0),(183,1,7,'moodle/calendar:manageownentries',1,1490725905,0),(184,1,1,'moodle/calendar:manageownentries',1,1490725905,0),(185,1,4,'moodle/calendar:managegroupentries',1,1490725905,0),(186,1,3,'moodle/calendar:managegroupentries',1,1490725905,0),(187,1,1,'moodle/calendar:managegroupentries',1,1490725905,0),(188,1,4,'moodle/calendar:manageentries',1,1490725905,0),(189,1,3,'moodle/calendar:manageentries',1,1490725905,0),(190,1,1,'moodle/calendar:manageentries',1,1490725905,0),(191,1,1,'moodle/user:editprofile',1,1490725905,0),(192,1,6,'moodle/user:editownprofile',-1000,1490725905,0),(193,1,7,'moodle/user:editownprofile',1,1490725905,0),(194,1,1,'moodle/user:editownprofile',1,1490725906,0),(195,1,6,'moodle/user:changeownpassword',-1000,1490725906,0),(196,1,7,'moodle/user:changeownpassword',1,1490725906,0),(197,1,1,'moodle/user:changeownpassword',1,1490725906,0),(198,1,5,'moodle/user:readuserposts',1,1490725906,0),(199,1,4,'moodle/user:readuserposts',1,1490725906,0),(200,1,3,'moodle/user:readuserposts',1,1490725906,0),(201,1,1,'moodle/user:readuserposts',1,1490725906,0),(202,1,5,'moodle/user:readuserblogs',1,1490725906,0),(203,1,4,'moodle/user:readuserblogs',1,1490725906,0),(204,1,3,'moodle/user:readuserblogs',1,1490725906,0),(205,1,1,'moodle/user:readuserblogs',1,1490725906,0),(206,1,1,'moodle/user:editmessageprofile',1,1490725906,0),(207,1,6,'moodle/user:editownmessageprofile',-1000,1490725906,0),(208,1,7,'moodle/user:editownmessageprofile',1,1490725906,0),(209,1,1,'moodle/user:editownmessageprofile',1,1490725906,0),(210,1,3,'moodle/question:managecategory',1,1490725906,0),(211,1,1,'moodle/question:managecategory',1,1490725906,0),(212,1,3,'moodle/question:add',1,1490725906,0),(213,1,1,'moodle/question:add',1,1490725906,0),(214,1,3,'moodle/question:editmine',1,1490725906,0),(215,1,1,'moodle/question:editmine',1,1490725907,0),(216,1,3,'moodle/question:editall',1,1490725907,0),(217,1,1,'moodle/question:editall',1,1490725907,0),(218,1,3,'moodle/question:viewmine',1,1490725908,0),(219,1,1,'moodle/question:viewmine',1,1490725908,0),(220,1,3,'moodle/question:viewall',1,1490725908,0),(221,1,1,'moodle/question:viewall',1,1490725908,0),(222,1,3,'moodle/question:usemine',1,1490725908,0),(223,1,1,'moodle/question:usemine',1,1490725908,0),(224,1,3,'moodle/question:useall',1,1490725908,0),(225,1,1,'moodle/question:useall',1,1490725908,0),(226,1,3,'moodle/question:movemine',1,1490725908,0),(227,1,1,'moodle/question:movemine',1,1490725908,0),(228,1,3,'moodle/question:moveall',1,1490725908,0),(229,1,1,'moodle/question:moveall',1,1490725908,0),(230,1,1,'moodle/question:config',1,1490725908,0),(231,1,5,'moodle/question:flag',1,1490725908,0),(232,1,4,'moodle/question:flag',1,1490725908,0),(233,1,3,'moodle/question:flag',1,1490725908,0),(234,1,1,'moodle/question:flag',1,1490725908,0),(235,1,4,'moodle/site:doclinks',1,1490725908,0),(236,1,3,'moodle/site:doclinks',1,1490725908,0),(237,1,1,'moodle/site:doclinks',1,1490725908,0),(238,1,3,'moodle/course:sectionvisibility',1,1490725909,0),(239,1,1,'moodle/course:sectionvisibility',1,1490725909,0),(240,1,3,'moodle/course:useremail',1,1490725909,0),(241,1,1,'moodle/course:useremail',1,1490725909,0),(242,1,3,'moodle/course:viewhiddensections',1,1490725909,0),(243,1,1,'moodle/course:viewhiddensections',1,1490725909,0),(244,1,3,'moodle/course:setcurrentsection',1,1490725909,0),(245,1,1,'moodle/course:setcurrentsection',1,1490725909,0),(246,1,3,'moodle/course:movesections',1,1490725909,0),(247,1,1,'moodle/course:movesections',1,1490725909,0),(248,1,4,'moodle/grade:viewall',1,1490725909,0),(249,1,3,'moodle/grade:viewall',1,1490725909,0),(250,1,1,'moodle/grade:viewall',1,1490725909,0),(251,1,5,'moodle/grade:view',1,1490725909,0),(252,1,4,'moodle/grade:viewhidden',1,1490725909,0),(253,1,3,'moodle/grade:viewhidden',1,1490725909,0),(254,1,1,'moodle/grade:viewhidden',1,1490725909,0),(255,1,3,'moodle/grade:import',1,1490725909,0),(256,1,1,'moodle/grade:import',1,1490725909,0),(257,1,4,'moodle/grade:export',1,1490725909,0),(258,1,3,'moodle/grade:export',1,1490725909,0),(259,1,1,'moodle/grade:export',1,1490725909,0),(260,1,3,'moodle/grade:manage',1,1490725910,0),(261,1,1,'moodle/grade:manage',1,1490725910,0),(262,1,3,'moodle/grade:edit',1,1490725910,0),(263,1,1,'moodle/grade:edit',1,1490725910,0),(264,1,3,'moodle/grade:managegradingforms',1,1490725910,0),(265,1,1,'moodle/grade:managegradingforms',1,1490725910,0),(266,1,1,'moodle/grade:sharegradingforms',1,1490725910,0),(267,1,1,'moodle/grade:managesharedforms',1,1490725910,0),(268,1,3,'moodle/grade:manageoutcomes',1,1490725910,0),(269,1,1,'moodle/grade:manageoutcomes',1,1490725910,0),(270,1,3,'moodle/grade:manageletters',1,1490725910,0),(271,1,1,'moodle/grade:manageletters',1,1490725910,0),(272,1,3,'moodle/grade:hide',1,1490725910,0),(273,1,1,'moodle/grade:hide',1,1490725910,0),(274,1,3,'moodle/grade:lock',1,1490725910,0),(275,1,1,'moodle/grade:lock',1,1490725910,0),(276,1,3,'moodle/grade:unlock',1,1490725910,0),(277,1,1,'moodle/grade:unlock',1,1490725910,0),(278,1,7,'moodle/my:manageblocks',1,1490725910,0),(279,1,4,'moodle/notes:view',1,1490725911,0),(280,1,3,'moodle/notes:view',1,1490725911,0),(281,1,1,'moodle/notes:view',1,1490725911,0),(282,1,4,'moodle/notes:manage',1,1490725911,0),(283,1,3,'moodle/notes:manage',1,1490725911,0),(284,1,1,'moodle/notes:manage',1,1490725911,0),(285,1,1,'moodle/tag:manage',1,1490725911,0),(286,1,1,'moodle/tag:edit',1,1490725911,0),(287,1,7,'moodle/tag:flag',1,1490725911,0),(288,1,4,'moodle/tag:editblocks',1,1490725911,0),(289,1,3,'moodle/tag:editblocks',1,1490725911,0),(290,1,1,'moodle/tag:editblocks',1,1490725911,0),(291,1,6,'moodle/block:view',1,1490725911,0),(292,1,7,'moodle/block:view',1,1490725911,0),(293,1,5,'moodle/block:view',1,1490725911,0),(294,1,4,'moodle/block:view',1,1490725911,0),(295,1,3,'moodle/block:view',1,1490725911,0),(296,1,3,'moodle/block:edit',1,1490725911,0),(297,1,1,'moodle/block:edit',1,1490725911,0),(298,1,7,'moodle/portfolio:export',1,1490725912,0),(299,1,5,'moodle/portfolio:export',1,1490725912,0),(300,1,4,'moodle/portfolio:export',1,1490725912,0),(301,1,3,'moodle/portfolio:export',1,1490725912,0),(302,1,8,'moodle/comment:view',1,1490725912,0),(303,1,6,'moodle/comment:view',1,1490725912,0),(304,1,7,'moodle/comment:view',1,1490725912,0),(305,1,5,'moodle/comment:view',1,1490725912,0),(306,1,4,'moodle/comment:view',1,1490725912,0),(307,1,3,'moodle/comment:view',1,1490725912,0),(308,1,1,'moodle/comment:view',1,1490725912,0),(309,1,7,'moodle/comment:post',1,1490725912,0),(310,1,5,'moodle/comment:post',1,1490725912,0),(311,1,4,'moodle/comment:post',1,1490725912,0),(312,1,3,'moodle/comment:post',1,1490725912,0),(313,1,1,'moodle/comment:post',1,1490725912,0),(314,1,3,'moodle/comment:delete',1,1490725912,0),(315,1,1,'moodle/comment:delete',1,1490725912,0),(316,1,1,'moodle/webservice:createtoken',1,1490725913,0),(317,1,7,'moodle/webservice:createmobiletoken',1,1490725913,0),(318,1,7,'moodle/rating:view',1,1490725913,0),(319,1,5,'moodle/rating:view',1,1490725913,0),(320,1,4,'moodle/rating:view',1,1490725913,0),(321,1,3,'moodle/rating:view',1,1490725913,0),(322,1,1,'moodle/rating:view',1,1490725913,0),(323,1,7,'moodle/rating:viewany',1,1490725913,0),(324,1,5,'moodle/rating:viewany',1,1490725913,0),(325,1,4,'moodle/rating:viewany',1,1490725913,0),(326,1,3,'moodle/rating:viewany',1,1490725913,0),(327,1,1,'moodle/rating:viewany',1,1490725913,0),(328,1,7,'moodle/rating:viewall',1,1490725913,0),(329,1,5,'moodle/rating:viewall',1,1490725913,0),(330,1,4,'moodle/rating:viewall',1,1490725913,0),(331,1,3,'moodle/rating:viewall',1,1490725913,0),(332,1,1,'moodle/rating:viewall',1,1490725913,0),(333,1,7,'moodle/rating:rate',1,1490725913,0),(334,1,5,'moodle/rating:rate',1,1490725913,0),(335,1,4,'moodle/rating:rate',1,1490725914,0),(336,1,3,'moodle/rating:rate',1,1490725914,0),(337,1,1,'moodle/rating:rate',1,1490725914,0),(338,1,1,'moodle/course:publish',1,1490725914,0),(339,1,4,'moodle/course:markcomplete',1,1490725914,0),(340,1,3,'moodle/course:markcomplete',1,1490725914,0),(341,1,1,'moodle/course:markcomplete',1,1490725914,0),(342,1,1,'moodle/community:add',1,1490725914,0),(343,1,4,'moodle/community:add',1,1490725914,0),(344,1,3,'moodle/community:add',1,1490725914,0),(345,1,1,'moodle/community:download',1,1490725914,0),(346,1,3,'moodle/community:download',1,1490725914,0),(347,1,1,'moodle/badges:manageglobalsettings',1,1490725914,0),(348,1,7,'moodle/badges:viewbadges',1,1490725914,0),(349,1,7,'moodle/badges:manageownbadges',1,1490725914,0),(350,1,7,'moodle/badges:viewotherbadges',1,1490725914,0),(351,1,7,'moodle/badges:earnbadge',1,1490725914,0),(352,1,1,'moodle/badges:createbadge',1,1490725914,0),(353,1,3,'moodle/badges:createbadge',1,1490725914,0),(354,1,1,'moodle/badges:deletebadge',1,1490725914,0),(355,1,3,'moodle/badges:deletebadge',1,1490725914,0),(356,1,1,'moodle/badges:configuredetails',1,1490725915,0),(357,1,3,'moodle/badges:configuredetails',1,1490725915,0),(358,1,1,'moodle/badges:configurecriteria',1,1490725915,0),(359,1,3,'moodle/badges:configurecriteria',1,1490725915,0),(360,1,1,'moodle/badges:configuremessages',1,1490725915,0),(361,1,3,'moodle/badges:configuremessages',1,1490725915,0),(362,1,1,'moodle/badges:awardbadge',1,1490725915,0),(363,1,4,'moodle/badges:awardbadge',1,1490725915,0),(364,1,3,'moodle/badges:awardbadge',1,1490725915,0),(365,1,1,'moodle/badges:viewawarded',1,1490725915,0),(366,1,4,'moodle/badges:viewawarded',1,1490725915,0),(367,1,3,'moodle/badges:viewawarded',1,1490725915,0),(368,1,6,'mod/assign:view',1,1490725980,0),(369,1,5,'mod/assign:view',1,1490725980,0),(370,1,4,'mod/assign:view',1,1490725980,0),(371,1,3,'mod/assign:view',1,1490725980,0),(372,1,1,'mod/assign:view',1,1490725980,0),(373,1,5,'mod/assign:submit',1,1490725980,0),(374,1,4,'mod/assign:grade',1,1490725980,0),(375,1,3,'mod/assign:grade',1,1490725980,0),(376,1,1,'mod/assign:grade',1,1490725980,0),(377,1,4,'mod/assign:exportownsubmission',1,1490725980,0),(378,1,3,'mod/assign:exportownsubmission',1,1490725980,0),(379,1,1,'mod/assign:exportownsubmission',1,1490725980,0),(380,1,5,'mod/assign:exportownsubmission',1,1490725980,0),(381,1,3,'mod/assign:addinstance',1,1490725980,0),(382,1,1,'mod/assign:addinstance',1,1490725980,0),(383,1,4,'mod/assign:grantextension',1,1490725981,0),(384,1,3,'mod/assign:grantextension',1,1490725981,0),(385,1,1,'mod/assign:grantextension',1,1490725981,0),(386,1,3,'mod/assign:revealidentities',1,1490725981,0),(387,1,1,'mod/assign:revealidentities',1,1490725981,0),(388,1,3,'mod/assign:reviewgrades',1,1490725981,0),(389,1,1,'mod/assign:reviewgrades',1,1490725981,0),(390,1,3,'mod/assign:releasegrades',1,1490725981,0),(391,1,1,'mod/assign:releasegrades',1,1490725981,0),(392,1,3,'mod/assign:managegrades',1,1490725981,0),(393,1,1,'mod/assign:managegrades',1,1490725981,0),(394,1,3,'mod/assign:manageallocations',1,1490725981,0),(395,1,1,'mod/assign:manageallocations',1,1490725981,0),(396,1,3,'mod/assign:viewgrades',1,1490725981,0),(397,1,1,'mod/assign:viewgrades',1,1490725981,0),(398,1,4,'mod/assign:viewgrades',1,1490725981,0),(399,1,1,'mod/assign:viewblinddetails',1,1490725981,0),(400,1,4,'mod/assign:receivegradernotifications',1,1490725981,0),(401,1,3,'mod/assign:receivegradernotifications',1,1490725981,0),(402,1,1,'mod/assign:receivegradernotifications',1,1490725981,0),(403,1,6,'mod/assignment:view',1,1490725984,0),(404,1,5,'mod/assignment:view',1,1490725984,0),(405,1,4,'mod/assignment:view',1,1490725984,0),(406,1,3,'mod/assignment:view',1,1490725984,0),(407,1,1,'mod/assignment:view',1,1490725984,0),(408,1,3,'mod/assignment:addinstance',1,1490725984,0),(409,1,1,'mod/assignment:addinstance',1,1490725984,0),(410,1,5,'mod/assignment:submit',1,1490725984,0),(411,1,4,'mod/assignment:grade',1,1490725984,0),(412,1,3,'mod/assignment:grade',1,1490725984,0),(413,1,1,'mod/assignment:grade',1,1490725984,0),(414,1,4,'mod/assignment:exportownsubmission',1,1490725984,0),(415,1,3,'mod/assignment:exportownsubmission',1,1490725984,0),(416,1,1,'mod/assignment:exportownsubmission',1,1490725984,0),(417,1,5,'mod/assignment:exportownsubmission',1,1490725984,0),(418,1,3,'mod/book:addinstance',1,1490725985,0),(419,1,1,'mod/book:addinstance',1,1490725985,0),(420,1,6,'mod/book:read',1,1490725985,0),(421,1,8,'mod/book:read',1,1490725985,0),(422,1,5,'mod/book:read',1,1490725985,0),(423,1,4,'mod/book:read',1,1490725985,0),(424,1,3,'mod/book:read',1,1490725985,0),(425,1,1,'mod/book:read',1,1490725985,0),(426,1,4,'mod/book:viewhiddenchapters',1,1490725985,0),(427,1,3,'mod/book:viewhiddenchapters',1,1490725985,0),(428,1,1,'mod/book:viewhiddenchapters',1,1490725985,0),(429,1,3,'mod/book:edit',1,1490725986,0),(430,1,1,'mod/book:edit',1,1490725986,0),(431,1,3,'mod/chat:addinstance',1,1490725986,0),(432,1,1,'mod/chat:addinstance',1,1490725986,0),(433,1,5,'mod/chat:chat',1,1490725987,0),(434,1,4,'mod/chat:chat',1,1490725987,0),(435,1,3,'mod/chat:chat',1,1490725987,0),(436,1,1,'mod/chat:chat',1,1490725987,0),(437,1,5,'mod/chat:readlog',1,1490725987,0),(438,1,4,'mod/chat:readlog',1,1490725987,0),(439,1,3,'mod/chat:readlog',1,1490725987,0),(440,1,1,'mod/chat:readlog',1,1490725987,0),(441,1,4,'mod/chat:deletelog',1,1490725987,0),(442,1,3,'mod/chat:deletelog',1,1490725987,0),(443,1,1,'mod/chat:deletelog',1,1490725987,0),(444,1,4,'mod/chat:exportparticipatedsession',1,1490725987,0),(445,1,3,'mod/chat:exportparticipatedsession',1,1490725987,0),(446,1,1,'mod/chat:exportparticipatedsession',1,1490725987,0),(447,1,4,'mod/chat:exportsession',1,1490725987,0),(448,1,3,'mod/chat:exportsession',1,1490725987,0),(449,1,1,'mod/chat:exportsession',1,1490725987,0),(450,1,3,'mod/choice:addinstance',1,1490725988,0),(451,1,1,'mod/choice:addinstance',1,1490725988,0),(452,1,5,'mod/choice:choose',1,1490725988,0),(453,1,4,'mod/choice:choose',1,1490725989,0),(454,1,3,'mod/choice:choose',1,1490725989,0),(455,1,4,'mod/choice:readresponses',1,1490725989,0),(456,1,3,'mod/choice:readresponses',1,1490725989,0),(457,1,1,'mod/choice:readresponses',1,1490725989,0),(458,1,4,'mod/choice:deleteresponses',1,1490725989,0),(459,1,3,'mod/choice:deleteresponses',1,1490725989,0),(460,1,1,'mod/choice:deleteresponses',1,1490725989,0),(461,1,4,'mod/choice:downloadresponses',1,1490725989,0),(462,1,3,'mod/choice:downloadresponses',1,1490725989,0),(463,1,1,'mod/choice:downloadresponses',1,1490725989,0),(464,1,3,'mod/data:addinstance',1,1490725990,0),(465,1,1,'mod/data:addinstance',1,1490725990,0),(466,1,8,'mod/data:viewentry',1,1490725990,0),(467,1,6,'mod/data:viewentry',1,1490725990,0),(468,1,5,'mod/data:viewentry',1,1490725990,0),(469,1,4,'mod/data:viewentry',1,1490725990,0),(470,1,3,'mod/data:viewentry',1,1490725990,0),(471,1,1,'mod/data:viewentry',1,1490725990,0),(472,1,5,'mod/data:writeentry',1,1490725990,0),(473,1,4,'mod/data:writeentry',1,1490725990,0),(474,1,3,'mod/data:writeentry',1,1490725990,0),(475,1,1,'mod/data:writeentry',1,1490725990,0),(476,1,5,'mod/data:comment',1,1490725990,0),(477,1,4,'mod/data:comment',1,1490725990,0),(478,1,3,'mod/data:comment',1,1490725990,0),(479,1,1,'mod/data:comment',1,1490725990,0),(480,1,4,'mod/data:rate',1,1490725991,0),(481,1,3,'mod/data:rate',1,1490725991,0),(482,1,1,'mod/data:rate',1,1490725991,0),(483,1,4,'mod/data:viewrating',1,1490725991,0),(484,1,3,'mod/data:viewrating',1,1490725991,0),(485,1,1,'mod/data:viewrating',1,1490725991,0),(486,1,4,'mod/data:viewanyrating',1,1490725991,0),(487,1,3,'mod/data:viewanyrating',1,1490725991,0),(488,1,1,'mod/data:viewanyrating',1,1490725991,0),(489,1,4,'mod/data:viewallratings',1,1490725991,0),(490,1,3,'mod/data:viewallratings',1,1490725991,0),(491,1,1,'mod/data:viewallratings',1,1490725991,0),(492,1,4,'mod/data:approve',1,1490725991,0),(493,1,3,'mod/data:approve',1,1490725991,0),(494,1,1,'mod/data:approve',1,1490725991,0),(495,1,4,'mod/data:manageentries',1,1490725991,0),(496,1,3,'mod/data:manageentries',1,1490725991,0),(497,1,1,'mod/data:manageentries',1,1490725991,0),(498,1,4,'mod/data:managecomments',1,1490725991,0),(499,1,3,'mod/data:managecomments',1,1490725991,0),(500,1,1,'mod/data:managecomments',1,1490725991,0),(501,1,3,'mod/data:managetemplates',1,1490725991,0),(502,1,1,'mod/data:managetemplates',1,1490725991,0),(503,1,4,'mod/data:viewalluserpresets',1,1490725991,0),(504,1,3,'mod/data:viewalluserpresets',1,1490725992,0),(505,1,1,'mod/data:viewalluserpresets',1,1490725992,0),(506,1,1,'mod/data:manageuserpresets',1,1490725992,0),(507,1,1,'mod/data:exportentry',1,1490725992,0),(508,1,4,'mod/data:exportentry',1,1490725992,0),(509,1,3,'mod/data:exportentry',1,1490725992,0),(510,1,1,'mod/data:exportownentry',1,1490725992,0),(511,1,4,'mod/data:exportownentry',1,1490725992,0),(512,1,3,'mod/data:exportownentry',1,1490725992,0),(513,1,5,'mod/data:exportownentry',1,1490725992,0),(514,1,1,'mod/data:exportallentries',1,1490725992,0),(515,1,4,'mod/data:exportallentries',1,1490725992,0),(516,1,3,'mod/data:exportallentries',1,1490725992,0),(517,1,1,'mod/data:exportuserinfo',1,1490725992,0),(518,1,4,'mod/data:exportuserinfo',1,1490725992,0),(519,1,3,'mod/data:exportuserinfo',1,1490725992,0),(520,1,3,'mod/feedback:addinstance',1,1490725994,0),(521,1,1,'mod/feedback:addinstance',1,1490725994,0),(522,1,6,'mod/feedback:view',1,1490725994,0),(523,1,5,'mod/feedback:view',1,1490725994,0),(524,1,4,'mod/feedback:view',1,1490725994,0),(525,1,3,'mod/feedback:view',1,1490725994,0),(526,1,1,'mod/feedback:view',1,1490725994,0),(527,1,5,'mod/feedback:complete',1,1490725994,0),(528,1,5,'mod/feedback:viewanalysepage',1,1490725994,0),(529,1,3,'mod/feedback:viewanalysepage',1,1490725994,0),(530,1,1,'mod/feedback:viewanalysepage',1,1490725994,0),(531,1,3,'mod/feedback:deletesubmissions',1,1490725994,0),(532,1,1,'mod/feedback:deletesubmissions',1,1490725994,0),(533,1,1,'mod/feedback:mapcourse',1,1490725994,0),(534,1,3,'mod/feedback:edititems',1,1490725994,0),(535,1,1,'mod/feedback:edititems',1,1490725994,0),(536,1,3,'mod/feedback:createprivatetemplate',1,1490725995,0),(537,1,1,'mod/feedback:createprivatetemplate',1,1490725995,0),(538,1,3,'mod/feedback:createpublictemplate',1,1490725995,0),(539,1,1,'mod/feedback:createpublictemplate',1,1490725995,0),(540,1,3,'mod/feedback:deletetemplate',1,1490725995,0),(541,1,1,'mod/feedback:deletetemplate',1,1490725995,0),(542,1,4,'mod/feedback:viewreports',1,1490725995,0),(543,1,3,'mod/feedback:viewreports',1,1490725995,0),(544,1,1,'mod/feedback:viewreports',1,1490725995,0),(545,1,4,'mod/feedback:receivemail',1,1490725995,0),(546,1,3,'mod/feedback:receivemail',1,1490725995,0),(547,1,3,'mod/folder:addinstance',1,1490725996,0),(548,1,1,'mod/folder:addinstance',1,1490725996,0),(549,1,6,'mod/folder:view',1,1490725996,0),(550,1,7,'mod/folder:view',1,1490725996,0),(551,1,3,'mod/folder:managefiles',1,1490725996,0),(552,1,3,'mod/forum:addinstance',1,1490725997,0),(553,1,1,'mod/forum:addinstance',1,1490725997,0),(554,1,8,'mod/forum:viewdiscussion',1,1490725997,0),(555,1,6,'mod/forum:viewdiscussion',1,1490725997,0),(556,1,5,'mod/forum:viewdiscussion',1,1490725998,0),(557,1,4,'mod/forum:viewdiscussion',1,1490725998,0),(558,1,3,'mod/forum:viewdiscussion',1,1490725998,0),(559,1,1,'mod/forum:viewdiscussion',1,1490725998,0),(560,1,4,'mod/forum:viewhiddentimedposts',1,1490725998,0),(561,1,3,'mod/forum:viewhiddentimedposts',1,1490725998,0),(562,1,1,'mod/forum:viewhiddentimedposts',1,1490725998,0),(563,1,5,'mod/forum:startdiscussion',1,1490725998,0),(564,1,4,'mod/forum:startdiscussion',1,1490725998,0),(565,1,3,'mod/forum:startdiscussion',1,1490725998,0),(566,1,1,'mod/forum:startdiscussion',1,1490725998,0),(567,1,5,'mod/forum:replypost',1,1490725998,0),(568,1,4,'mod/forum:replypost',1,1490725998,0),(569,1,3,'mod/forum:replypost',1,1490725998,0),(570,1,1,'mod/forum:replypost',1,1490725999,0),(571,1,4,'mod/forum:addnews',1,1490725999,0),(572,1,3,'mod/forum:addnews',1,1490725999,0),(573,1,1,'mod/forum:addnews',1,1490725999,0),(574,1,4,'mod/forum:replynews',1,1490725999,0),(575,1,3,'mod/forum:replynews',1,1490725999,0),(576,1,1,'mod/forum:replynews',1,1490725999,0),(577,1,5,'mod/forum:viewrating',1,1490725999,0),(578,1,4,'mod/forum:viewrating',1,1490725999,0),(579,1,3,'mod/forum:viewrating',1,1490725999,0),(580,1,1,'mod/forum:viewrating',1,1490725999,0),(581,1,4,'mod/forum:viewanyrating',1,1490725999,0),(582,1,3,'mod/forum:viewanyrating',1,1490725999,0),(583,1,1,'mod/forum:viewanyrating',1,1490725999,0),(584,1,4,'mod/forum:viewallratings',1,1490725999,0),(585,1,3,'mod/forum:viewallratings',1,1490725999,0),(586,1,1,'mod/forum:viewallratings',1,1490725999,0),(587,1,4,'mod/forum:rate',1,1490725999,0),(588,1,3,'mod/forum:rate',1,1490725999,0),(589,1,1,'mod/forum:rate',1,1490725999,0),(590,1,5,'mod/forum:createattachment',1,1490725999,0),(591,1,4,'mod/forum:createattachment',1,1490725999,0),(592,1,3,'mod/forum:createattachment',1,1490725999,0),(593,1,1,'mod/forum:createattachment',1,1490725999,0),(594,1,5,'mod/forum:deleteownpost',1,1490726000,0),(595,1,4,'mod/forum:deleteownpost',1,1490726000,0),(596,1,3,'mod/forum:deleteownpost',1,1490726000,0),(597,1,1,'mod/forum:deleteownpost',1,1490726000,0),(598,1,4,'mod/forum:deleteanypost',1,1490726000,0),(599,1,3,'mod/forum:deleteanypost',1,1490726000,0),(600,1,1,'mod/forum:deleteanypost',1,1490726000,0),(601,1,4,'mod/forum:splitdiscussions',1,1490726000,0),(602,1,3,'mod/forum:splitdiscussions',1,1490726000,0),(603,1,1,'mod/forum:splitdiscussions',1,1490726000,0),(604,1,4,'mod/forum:movediscussions',1,1490726000,0),(605,1,3,'mod/forum:movediscussions',1,1490726000,0),(606,1,1,'mod/forum:movediscussions',1,1490726000,0),(607,1,4,'mod/forum:editanypost',1,1490726000,0),(608,1,3,'mod/forum:editanypost',1,1490726000,0),(609,1,1,'mod/forum:editanypost',1,1490726000,0),(610,1,4,'mod/forum:viewqandawithoutposting',1,1490726000,0),(611,1,3,'mod/forum:viewqandawithoutposting',1,1490726000,0),(612,1,1,'mod/forum:viewqandawithoutposting',1,1490726000,0),(613,1,4,'mod/forum:viewsubscribers',1,1490726000,0),(614,1,3,'mod/forum:viewsubscribers',1,1490726000,0),(615,1,1,'mod/forum:viewsubscribers',1,1490726000,0),(616,1,4,'mod/forum:managesubscriptions',1,1490726000,0),(617,1,3,'mod/forum:managesubscriptions',1,1490726000,0),(618,1,1,'mod/forum:managesubscriptions',1,1490726000,0),(619,1,4,'mod/forum:postwithoutthrottling',1,1490726001,0),(620,1,3,'mod/forum:postwithoutthrottling',1,1490726001,0),(621,1,1,'mod/forum:postwithoutthrottling',1,1490726001,0),(622,1,4,'mod/forum:exportdiscussion',1,1490726001,0),(623,1,3,'mod/forum:exportdiscussion',1,1490726001,0),(624,1,1,'mod/forum:exportdiscussion',1,1490726001,0),(625,1,4,'mod/forum:exportpost',1,1490726001,0),(626,1,3,'mod/forum:exportpost',1,1490726001,0),(627,1,1,'mod/forum:exportpost',1,1490726001,0),(628,1,4,'mod/forum:exportownpost',1,1490726001,0),(629,1,3,'mod/forum:exportownpost',1,1490726001,0),(630,1,1,'mod/forum:exportownpost',1,1490726001,0),(631,1,5,'mod/forum:exportownpost',1,1490726001,0),(632,1,4,'mod/forum:addquestion',1,1490726001,0),(633,1,3,'mod/forum:addquestion',1,1490726001,0),(634,1,1,'mod/forum:addquestion',1,1490726001,0),(635,1,5,'mod/forum:allowforcesubscribe',1,1490726001,0),(636,1,4,'mod/forum:allowforcesubscribe',1,1490726001,0),(637,1,3,'mod/forum:allowforcesubscribe',1,1490726001,0),(638,1,8,'mod/forum:allowforcesubscribe',1,1490726001,0),(639,1,4,'mod/forum:canposttomygroups',1,1490726001,0),(640,1,3,'mod/forum:canposttomygroups',1,1490726001,0),(641,1,1,'mod/forum:canposttomygroups',1,1490726001,0),(642,1,3,'mod/glossary:addinstance',1,1490726003,0),(643,1,1,'mod/glossary:addinstance',1,1490726003,0),(644,1,8,'mod/glossary:view',1,1490726003,0),(645,1,6,'mod/glossary:view',1,1490726003,0),(646,1,5,'mod/glossary:view',1,1490726003,0),(647,1,4,'mod/glossary:view',1,1490726003,0),(648,1,3,'mod/glossary:view',1,1490726003,0),(649,1,1,'mod/glossary:view',1,1490726003,0),(650,1,5,'mod/glossary:write',1,1490726003,0),(651,1,4,'mod/glossary:write',1,1490726003,0),(652,1,3,'mod/glossary:write',1,1490726003,0),(653,1,1,'mod/glossary:write',1,1490726004,0),(654,1,4,'mod/glossary:manageentries',1,1490726004,0),(655,1,3,'mod/glossary:manageentries',1,1490726004,0),(656,1,1,'mod/glossary:manageentries',1,1490726004,0),(657,1,4,'mod/glossary:managecategories',1,1490726004,0),(658,1,3,'mod/glossary:managecategories',1,1490726004,0),(659,1,1,'mod/glossary:managecategories',1,1490726004,0),(660,1,5,'mod/glossary:comment',1,1490726004,0),(661,1,4,'mod/glossary:comment',1,1490726004,0),(662,1,3,'mod/glossary:comment',1,1490726004,0),(663,1,1,'mod/glossary:comment',1,1490726004,0),(664,1,4,'mod/glossary:managecomments',1,1490726004,0),(665,1,3,'mod/glossary:managecomments',1,1490726004,0),(666,1,1,'mod/glossary:managecomments',1,1490726004,0),(667,1,4,'mod/glossary:import',1,1490726004,0),(668,1,3,'mod/glossary:import',1,1490726004,0),(669,1,1,'mod/glossary:import',1,1490726004,0),(670,1,4,'mod/glossary:export',1,1490726004,0),(671,1,3,'mod/glossary:export',1,1490726004,0),(672,1,1,'mod/glossary:export',1,1490726004,0),(673,1,4,'mod/glossary:approve',1,1490726004,0),(674,1,3,'mod/glossary:approve',1,1490726004,0),(675,1,1,'mod/glossary:approve',1,1490726004,0),(676,1,4,'mod/glossary:rate',1,1490726004,0),(677,1,3,'mod/glossary:rate',1,1490726004,0),(678,1,1,'mod/glossary:rate',1,1490726005,0),(679,1,4,'mod/glossary:viewrating',1,1490726005,0),(680,1,3,'mod/glossary:viewrating',1,1490726005,0),(681,1,1,'mod/glossary:viewrating',1,1490726005,0),(682,1,4,'mod/glossary:viewanyrating',1,1490726005,0),(683,1,3,'mod/glossary:viewanyrating',1,1490726005,0),(684,1,1,'mod/glossary:viewanyrating',1,1490726005,0),(685,1,4,'mod/glossary:viewallratings',1,1490726005,0),(686,1,3,'mod/glossary:viewallratings',1,1490726005,0),(687,1,1,'mod/glossary:viewallratings',1,1490726005,0),(688,1,4,'mod/glossary:exportentry',1,1490726005,0),(689,1,3,'mod/glossary:exportentry',1,1490726005,0),(690,1,1,'mod/glossary:exportentry',1,1490726005,0),(691,1,4,'mod/glossary:exportownentry',1,1490726005,0),(692,1,3,'mod/glossary:exportownentry',1,1490726005,0),(693,1,1,'mod/glossary:exportownentry',1,1490726005,0),(694,1,5,'mod/glossary:exportownentry',1,1490726005,0),(695,1,6,'mod/imscp:view',1,1490726006,0),(696,1,7,'mod/imscp:view',1,1490726006,0),(697,1,3,'mod/imscp:addinstance',1,1490726006,0),(698,1,1,'mod/imscp:addinstance',1,1490726006,0),(699,1,3,'mod/label:addinstance',1,1490726007,0),(700,1,1,'mod/label:addinstance',1,1490726007,0),(701,1,3,'mod/lesson:addinstance',1,1490726008,0),(702,1,1,'mod/lesson:addinstance',1,1490726008,0),(703,1,3,'mod/lesson:edit',1,1490726008,0),(704,1,1,'mod/lesson:edit',1,1490726008,0),(705,1,4,'mod/lesson:grade',1,1490726008,0),(706,1,3,'mod/lesson:grade',1,1490726008,0),(707,1,1,'mod/lesson:grade',1,1490726008,0),(708,1,4,'mod/lesson:viewreports',1,1490726008,0),(709,1,3,'mod/lesson:viewreports',1,1490726008,0),(710,1,1,'mod/lesson:viewreports',1,1490726008,0),(711,1,4,'mod/lesson:manage',1,1490726008,0),(712,1,3,'mod/lesson:manage',1,1490726008,0),(713,1,1,'mod/lesson:manage',1,1490726008,0),(714,1,3,'mod/lesson:manageoverrides',1,1490726009,0),(715,1,1,'mod/lesson:manageoverrides',1,1490726009,0),(716,1,5,'mod/lti:view',1,1490726009,0),(717,1,4,'mod/lti:view',1,1490726009,0),(718,1,3,'mod/lti:view',1,1490726009,0),(719,1,1,'mod/lti:view',1,1490726010,0),(720,1,3,'mod/lti:addinstance',1,1490726010,0),(721,1,1,'mod/lti:addinstance',1,1490726010,0),(722,1,4,'mod/lti:manage',1,1490726010,0),(723,1,3,'mod/lti:manage',1,1490726010,0),(724,1,1,'mod/lti:manage',1,1490726010,0),(725,1,3,'mod/lti:addcoursetool',1,1490726010,0),(726,1,1,'mod/lti:addcoursetool',1,1490726010,0),(727,1,3,'mod/lti:requesttooladd',1,1490726010,0),(728,1,1,'mod/lti:requesttooladd',1,1490726010,0),(729,1,6,'mod/page:view',1,1490726010,0),(730,1,7,'mod/page:view',1,1490726011,0),(731,1,3,'mod/page:addinstance',1,1490726011,0),(732,1,1,'mod/page:addinstance',1,1490726011,0),(733,1,6,'mod/quiz:view',1,1490726012,0),(734,1,5,'mod/quiz:view',1,1490726012,0),(735,1,4,'mod/quiz:view',1,1490726012,0),(736,1,3,'mod/quiz:view',1,1490726012,0),(737,1,1,'mod/quiz:view',1,1490726012,0),(738,1,3,'mod/quiz:addinstance',1,1490726012,0),(739,1,1,'mod/quiz:addinstance',1,1490726012,0),(740,1,5,'mod/quiz:attempt',1,1490726012,0),(741,1,5,'mod/quiz:reviewmyattempts',1,1490726012,0),(742,1,3,'mod/quiz:manage',1,1490726012,0),(743,1,1,'mod/quiz:manage',1,1490726012,0),(744,1,3,'mod/quiz:manageoverrides',1,1490726012,0),(745,1,1,'mod/quiz:manageoverrides',1,1490726012,0),(746,1,4,'mod/quiz:preview',1,1490726012,0),(747,1,3,'mod/quiz:preview',1,1490726012,0),(748,1,1,'mod/quiz:preview',1,1490726012,0),(749,1,4,'mod/quiz:grade',1,1490726012,0),(750,1,3,'mod/quiz:grade',1,1490726013,0),(751,1,1,'mod/quiz:grade',1,1490726013,0),(752,1,4,'mod/quiz:regrade',1,1490726013,0),(753,1,3,'mod/quiz:regrade',1,1490726013,0),(754,1,1,'mod/quiz:regrade',1,1490726013,0),(755,1,4,'mod/quiz:viewreports',1,1490726013,0),(756,1,3,'mod/quiz:viewreports',1,1490726013,0),(757,1,1,'mod/quiz:viewreports',1,1490726013,0),(758,1,3,'mod/quiz:deleteattempts',1,1490726013,0),(759,1,1,'mod/quiz:deleteattempts',1,1490726013,0),(760,1,6,'mod/resource:view',1,1490726014,0),(761,1,7,'mod/resource:view',1,1490726014,0),(762,1,3,'mod/resource:addinstance',1,1490726014,0),(763,1,1,'mod/resource:addinstance',1,1490726014,0),(764,1,3,'mod/scorm:addinstance',1,1490726015,0),(765,1,1,'mod/scorm:addinstance',1,1490726016,0),(766,1,4,'mod/scorm:viewreport',1,1490726016,0),(767,1,3,'mod/scorm:viewreport',1,1490726016,0),(768,1,1,'mod/scorm:viewreport',1,1490726016,0),(769,1,5,'mod/scorm:skipview',1,1490726016,0),(770,1,5,'mod/scorm:savetrack',1,1490726016,0),(771,1,4,'mod/scorm:savetrack',1,1490726016,0),(772,1,3,'mod/scorm:savetrack',1,1490726016,0),(773,1,1,'mod/scorm:savetrack',1,1490726016,0),(774,1,5,'mod/scorm:viewscores',1,1490726016,0),(775,1,4,'mod/scorm:viewscores',1,1490726016,0),(776,1,3,'mod/scorm:viewscores',1,1490726016,0),(777,1,1,'mod/scorm:viewscores',1,1490726016,0),(778,1,4,'mod/scorm:deleteresponses',1,1490726016,0),(779,1,3,'mod/scorm:deleteresponses',1,1490726016,0),(780,1,1,'mod/scorm:deleteresponses',1,1490726016,0),(781,1,3,'mod/survey:addinstance',1,1490726020,0),(782,1,1,'mod/survey:addinstance',1,1490726020,0),(783,1,5,'mod/survey:participate',1,1490726021,0),(784,1,4,'mod/survey:participate',1,1490726021,0),(785,1,3,'mod/survey:participate',1,1490726021,0),(786,1,1,'mod/survey:participate',1,1490726021,0),(787,1,4,'mod/survey:readresponses',1,1490726021,0),(788,1,3,'mod/survey:readresponses',1,1490726021,0),(789,1,1,'mod/survey:readresponses',1,1490726021,0),(790,1,4,'mod/survey:download',1,1490726021,0),(791,1,3,'mod/survey:download',1,1490726021,0),(792,1,1,'mod/survey:download',1,1490726021,0),(793,1,6,'mod/url:view',1,1490726022,0),(794,1,7,'mod/url:view',1,1490726022,0),(795,1,3,'mod/url:addinstance',1,1490726022,0),(796,1,1,'mod/url:addinstance',1,1490726022,0),(797,1,3,'mod/wiki:addinstance',1,1490726023,0),(798,1,1,'mod/wiki:addinstance',1,1490726023,0),(799,1,6,'mod/wiki:viewpage',1,1490726023,0),(800,1,5,'mod/wiki:viewpage',1,1490726023,0),(801,1,4,'mod/wiki:viewpage',1,1490726023,0),(802,1,3,'mod/wiki:viewpage',1,1490726023,0),(803,1,1,'mod/wiki:viewpage',1,1490726023,0),(804,1,5,'mod/wiki:editpage',1,1490726023,0),(805,1,4,'mod/wiki:editpage',1,1490726023,0),(806,1,3,'mod/wiki:editpage',1,1490726023,0),(807,1,1,'mod/wiki:editpage',1,1490726023,0),(808,1,5,'mod/wiki:createpage',1,1490726023,0),(809,1,4,'mod/wiki:createpage',1,1490726023,0),(810,1,3,'mod/wiki:createpage',1,1490726024,0),(811,1,1,'mod/wiki:createpage',1,1490726024,0),(812,1,5,'mod/wiki:viewcomment',1,1490726024,0),(813,1,4,'mod/wiki:viewcomment',1,1490726024,0),(814,1,3,'mod/wiki:viewcomment',1,1490726024,0),(815,1,1,'mod/wiki:viewcomment',1,1490726024,0),(816,1,5,'mod/wiki:editcomment',1,1490726024,0),(817,1,4,'mod/wiki:editcomment',1,1490726024,0),(818,1,3,'mod/wiki:editcomment',1,1490726024,0),(819,1,1,'mod/wiki:editcomment',1,1490726024,0),(820,1,4,'mod/wiki:managecomment',1,1490726024,0),(821,1,3,'mod/wiki:managecomment',1,1490726024,0),(822,1,1,'mod/wiki:managecomment',1,1490726024,0),(823,1,4,'mod/wiki:managefiles',1,1490726024,0),(824,1,3,'mod/wiki:managefiles',1,1490726024,0),(825,1,1,'mod/wiki:managefiles',1,1490726024,0),(826,1,4,'mod/wiki:overridelock',1,1490726024,0),(827,1,3,'mod/wiki:overridelock',1,1490726024,0),(828,1,1,'mod/wiki:overridelock',1,1490726024,0),(829,1,4,'mod/wiki:managewiki',1,1490726024,0),(830,1,3,'mod/wiki:managewiki',1,1490726024,0),(831,1,1,'mod/wiki:managewiki',1,1490726024,0),(832,1,6,'mod/workshop:view',1,1490726025,0),(833,1,5,'mod/workshop:view',1,1490726026,0),(834,1,4,'mod/workshop:view',1,1490726026,0),(835,1,3,'mod/workshop:view',1,1490726026,0),(836,1,1,'mod/workshop:view',1,1490726026,0),(837,1,3,'mod/workshop:addinstance',1,1490726026,0),(838,1,1,'mod/workshop:addinstance',1,1490726026,0),(839,1,4,'mod/workshop:switchphase',1,1490726026,0),(840,1,3,'mod/workshop:switchphase',1,1490726026,0),(841,1,1,'mod/workshop:switchphase',1,1490726026,0),(842,1,3,'mod/workshop:editdimensions',1,1490726026,0),(843,1,1,'mod/workshop:editdimensions',1,1490726026,0),(844,1,5,'mod/workshop:submit',1,1490726026,0),(845,1,5,'mod/workshop:peerassess',1,1490726026,0),(846,1,4,'mod/workshop:manageexamples',1,1490726026,0),(847,1,3,'mod/workshop:manageexamples',1,1490726026,0),(848,1,1,'mod/workshop:manageexamples',1,1490726026,0),(849,1,4,'mod/workshop:allocate',1,1490726026,0),(850,1,3,'mod/workshop:allocate',1,1490726026,0),(851,1,1,'mod/workshop:allocate',1,1490726026,0),(852,1,4,'mod/workshop:publishsubmissions',1,1490726026,0),(853,1,3,'mod/workshop:publishsubmissions',1,1490726026,0),(854,1,1,'mod/workshop:publishsubmissions',1,1490726026,0),(855,1,5,'mod/workshop:viewauthornames',1,1490726026,0),(856,1,4,'mod/workshop:viewauthornames',1,1490726027,0),(857,1,3,'mod/workshop:viewauthornames',1,1490726027,0),(858,1,1,'mod/workshop:viewauthornames',1,1490726027,0),(859,1,4,'mod/workshop:viewreviewernames',1,1490726027,0),(860,1,3,'mod/workshop:viewreviewernames',1,1490726027,0),(861,1,1,'mod/workshop:viewreviewernames',1,1490726027,0),(862,1,4,'mod/workshop:viewallsubmissions',1,1490726027,0),(863,1,3,'mod/workshop:viewallsubmissions',1,1490726027,0),(864,1,1,'mod/workshop:viewallsubmissions',1,1490726027,0),(865,1,5,'mod/workshop:viewpublishedsubmissions',1,1490726027,0),(866,1,4,'mod/workshop:viewpublishedsubmissions',1,1490726027,0),(867,1,3,'mod/workshop:viewpublishedsubmissions',1,1490726027,0),(868,1,1,'mod/workshop:viewpublishedsubmissions',1,1490726027,0),(869,1,5,'mod/workshop:viewauthorpublished',1,1490726027,0),(870,1,4,'mod/workshop:viewauthorpublished',1,1490726027,0),(871,1,3,'mod/workshop:viewauthorpublished',1,1490726027,0),(872,1,1,'mod/workshop:viewauthorpublished',1,1490726027,0),(873,1,4,'mod/workshop:viewallassessments',1,1490726027,0),(874,1,3,'mod/workshop:viewallassessments',1,1490726027,0),(875,1,1,'mod/workshop:viewallassessments',1,1490726027,0),(876,1,4,'mod/workshop:overridegrades',1,1490726028,0),(877,1,3,'mod/workshop:overridegrades',1,1490726028,0),(878,1,1,'mod/workshop:overridegrades',1,1490726028,0),(879,1,4,'mod/workshop:ignoredeadlines',1,1490726028,0),(880,1,3,'mod/workshop:ignoredeadlines',1,1490726028,0),(881,1,1,'mod/workshop:ignoredeadlines',1,1490726028,0),(882,1,1,'enrol/category:config',1,1490726035,0),(883,1,3,'enrol/category:config',1,1490726035,0),(884,1,3,'enrol/cohort:config',1,1490726035,0),(885,1,1,'enrol/cohort:config',1,1490726035,0),(886,1,1,'enrol/cohort:unenrol',1,1490726035,0),(887,1,1,'enrol/database:unenrol',1,1490726036,0),(888,1,1,'enrol/database:config',1,1490726036,0),(889,1,3,'enrol/database:config',1,1490726036,0),(890,1,1,'enrol/guest:config',1,1490726037,0),(891,1,3,'enrol/guest:config',1,1490726037,0),(892,1,1,'enrol/imsenterprise:config',1,1490726037,0),(893,1,3,'enrol/imsenterprise:config',1,1490726037,0),(894,1,1,'enrol/ldap:manage',1,1490726038,0),(895,1,1,'enrol/manual:config',1,1490726038,0),(896,1,1,'enrol/manual:enrol',1,1490726038,0),(897,1,3,'enrol/manual:enrol',1,1490726038,0),(898,1,1,'enrol/manual:manage',1,1490726038,0),(899,1,3,'enrol/manual:manage',1,1490726038,0),(900,1,1,'enrol/manual:unenrol',1,1490726038,0),(901,1,3,'enrol/manual:unenrol',1,1490726038,0),(902,1,1,'enrol/meta:config',1,1490726039,0),(903,1,3,'enrol/meta:config',1,1490726039,0),(904,1,1,'enrol/meta:selectaslinked',1,1490726039,0),(905,1,1,'enrol/meta:unenrol',1,1490726039,0),(906,1,1,'enrol/mnet:config',1,1490726039,0),(907,1,3,'enrol/mnet:config',1,1490726039,0),(908,1,1,'enrol/paypal:config',1,1490726041,0),(909,1,1,'enrol/paypal:manage',1,1490726041,0),(910,1,3,'enrol/paypal:manage',1,1490726041,0),(911,1,1,'enrol/paypal:unenrol',1,1490726041,0),(912,1,3,'enrol/self:config',1,1490726041,0),(913,1,1,'enrol/self:config',1,1490726041,0),(914,1,3,'enrol/self:manage',1,1490726041,0),(915,1,1,'enrol/self:manage',1,1490726041,0),(916,1,5,'enrol/self:unenrolself',1,1490726042,0),(917,1,3,'enrol/self:unenrol',1,1490726042,0),(918,1,1,'enrol/self:unenrol',1,1490726042,0),(919,1,7,'message/airnotifier:managedevice',1,1490726042,0),(920,1,3,'block/activity_modules:addinstance',1,1490726044,0),(921,1,1,'block/activity_modules:addinstance',1,1490726044,0),(922,1,3,'block/activity_results:addinstance',1,1490726044,0),(923,1,1,'block/activity_results:addinstance',1,1490726044,0),(924,1,7,'block/admin_bookmarks:myaddinstance',1,1490726045,0),(925,1,3,'block/admin_bookmarks:addinstance',1,1490726045,0),(926,1,1,'block/admin_bookmarks:addinstance',1,1490726045,0),(927,1,3,'block/badges:addinstance',1,1490726045,0),(928,1,1,'block/badges:addinstance',1,1490726045,0),(929,1,7,'block/badges:myaddinstance',1,1490726045,0),(930,1,3,'block/blog_menu:addinstance',1,1490726045,0),(931,1,1,'block/blog_menu:addinstance',1,1490726045,0),(932,1,3,'block/blog_recent:addinstance',1,1490726046,0),(933,1,1,'block/blog_recent:addinstance',1,1490726046,0),(934,1,3,'block/blog_tags:addinstance',1,1490726046,0),(935,1,1,'block/blog_tags:addinstance',1,1490726046,0),(936,1,7,'block/calendar_month:myaddinstance',1,1490726046,0),(937,1,3,'block/calendar_month:addinstance',1,1490726047,0),(938,1,1,'block/calendar_month:addinstance',1,1490726047,0),(939,1,7,'block/calendar_upcoming:myaddinstance',1,1490726047,0),(940,1,3,'block/calendar_upcoming:addinstance',1,1490726047,0),(941,1,1,'block/calendar_upcoming:addinstance',1,1490726047,0),(942,1,7,'block/comments:myaddinstance',1,1490726047,0),(943,1,3,'block/comments:addinstance',1,1490726047,0),(944,1,1,'block/comments:addinstance',1,1490726047,0),(945,1,7,'block/community:myaddinstance',1,1490726048,0),(946,1,3,'block/community:addinstance',1,1490726048,0),(947,1,1,'block/community:addinstance',1,1490726048,0),(948,1,3,'block/completionstatus:addinstance',1,1490726048,0),(949,1,1,'block/completionstatus:addinstance',1,1490726048,0),(950,1,7,'block/course_list:myaddinstance',1,1490726048,0),(951,1,3,'block/course_list:addinstance',1,1490726048,0),(952,1,1,'block/course_list:addinstance',1,1490726048,0),(953,1,7,'block/course_overview:myaddinstance',1,1490726049,0),(954,1,3,'block/course_overview:addinstance',1,1490726049,0),(955,1,1,'block/course_overview:addinstance',1,1490726049,0),(956,1,3,'block/course_summary:addinstance',1,1490726049,0),(957,1,1,'block/course_summary:addinstance',1,1490726049,0),(958,1,3,'block/feedback:addinstance',1,1490726050,0),(959,1,1,'block/feedback:addinstance',1,1490726050,0),(960,1,7,'block/glossary_random:myaddinstance',1,1490726050,0),(961,1,3,'block/glossary_random:addinstance',1,1490726050,0),(962,1,1,'block/glossary_random:addinstance',1,1490726050,0),(963,1,7,'block/html:myaddinstance',1,1490726051,0),(964,1,3,'block/html:addinstance',1,1490726051,0),(965,1,1,'block/html:addinstance',1,1490726051,0),(966,1,3,'block/login:addinstance',1,1490726051,0),(967,1,1,'block/login:addinstance',1,1490726051,0),(968,1,7,'block/mentees:myaddinstance',1,1490726052,0),(969,1,3,'block/mentees:addinstance',1,1490726052,0),(970,1,1,'block/mentees:addinstance',1,1490726052,0),(971,1,7,'block/messages:myaddinstance',1,1490726052,0),(972,1,3,'block/messages:addinstance',1,1490726052,0),(973,1,1,'block/messages:addinstance',1,1490726052,0),(974,1,7,'block/mnet_hosts:myaddinstance',1,1490726053,0),(975,1,3,'block/mnet_hosts:addinstance',1,1490726053,0),(976,1,1,'block/mnet_hosts:addinstance',1,1490726053,0),(977,1,7,'block/myprofile:myaddinstance',1,1490726053,0),(978,1,3,'block/myprofile:addinstance',1,1490726053,0),(979,1,1,'block/myprofile:addinstance',1,1490726053,0),(980,1,7,'block/navigation:myaddinstance',1,1490726053,0),(981,1,3,'block/navigation:addinstance',1,1490726053,0),(982,1,1,'block/navigation:addinstance',1,1490726053,0),(983,1,7,'block/news_items:myaddinstance',1,1490726054,0),(984,1,3,'block/news_items:addinstance',1,1490726054,0),(985,1,1,'block/news_items:addinstance',1,1490726054,0),(986,1,7,'block/online_users:myaddinstance',1,1490726054,0),(987,1,3,'block/online_users:addinstance',1,1490726054,0),(988,1,1,'block/online_users:addinstance',1,1490726054,0),(989,1,7,'block/online_users:viewlist',1,1490726054,0),(990,1,6,'block/online_users:viewlist',1,1490726054,0),(991,1,5,'block/online_users:viewlist',1,1490726054,0),(992,1,4,'block/online_users:viewlist',1,1490726054,0),(993,1,3,'block/online_users:viewlist',1,1490726054,0),(994,1,1,'block/online_users:viewlist',1,1490726054,0),(995,1,3,'block/participants:addinstance',1,1490726055,0),(996,1,1,'block/participants:addinstance',1,1490726055,0),(997,1,7,'block/private_files:myaddinstance',1,1490726055,0),(998,1,3,'block/private_files:addinstance',1,1490726055,0),(999,1,1,'block/private_files:addinstance',1,1490726055,0),(1000,1,3,'block/quiz_results:addinstance',1,1490726055,0),(1001,1,1,'block/quiz_results:addinstance',1,1490726056,0),(1002,1,3,'block/recent_activity:addinstance',1,1490726056,0),(1003,1,1,'block/recent_activity:addinstance',1,1490726056,0),(1004,1,7,'block/recent_activity:viewaddupdatemodule',1,1490726056,0),(1005,1,7,'block/recent_activity:viewdeletemodule',1,1490726056,0),(1006,1,7,'block/rss_client:myaddinstance',1,1490726056,0),(1007,1,3,'block/rss_client:addinstance',1,1490726056,0),(1008,1,1,'block/rss_client:addinstance',1,1490726056,0),(1009,1,4,'block/rss_client:manageownfeeds',1,1490726056,0),(1010,1,3,'block/rss_client:manageownfeeds',1,1490726057,0),(1011,1,1,'block/rss_client:manageownfeeds',1,1490726057,0),(1012,1,1,'block/rss_client:manageanyfeeds',1,1490726057,0),(1013,1,3,'block/search_forums:addinstance',1,1490726057,0),(1014,1,1,'block/search_forums:addinstance',1,1490726057,0),(1015,1,3,'block/section_links:addinstance',1,1490726057,0),(1016,1,1,'block/section_links:addinstance',1,1490726057,0),(1017,1,3,'block/selfcompletion:addinstance',1,1490726058,0),(1018,1,1,'block/selfcompletion:addinstance',1,1490726058,0),(1019,1,7,'block/settings:myaddinstance',1,1490726058,0),(1020,1,3,'block/settings:addinstance',1,1490726058,0),(1021,1,1,'block/settings:addinstance',1,1490726058,0),(1022,1,3,'block/site_main_menu:addinstance',1,1490726058,0),(1023,1,1,'block/site_main_menu:addinstance',1,1490726058,0),(1024,1,3,'block/social_activities:addinstance',1,1490726059,0),(1025,1,1,'block/social_activities:addinstance',1,1490726059,0),(1026,1,3,'block/tag_flickr:addinstance',1,1490726059,0),(1027,1,1,'block/tag_flickr:addinstance',1,1490726059,0),(1028,1,3,'block/tag_youtube:addinstance',1,1490726060,0),(1029,1,1,'block/tag_youtube:addinstance',1,1490726060,0),(1030,1,7,'block/tags:myaddinstance',1,1490726060,0),(1031,1,3,'block/tags:addinstance',1,1490726060,0),(1032,1,1,'block/tags:addinstance',1,1490726060,0),(1033,1,4,'report/completion:view',1,1490726069,0),(1034,1,3,'report/completion:view',1,1490726069,0),(1035,1,1,'report/completion:view',1,1490726069,0),(1036,1,4,'report/courseoverview:view',1,1490726069,0),(1037,1,3,'report/courseoverview:view',1,1490726069,0),(1038,1,1,'report/courseoverview:view',1,1490726070,0),(1039,1,4,'report/log:view',1,1490726070,0),(1040,1,3,'report/log:view',1,1490726070,0),(1041,1,1,'report/log:view',1,1490726070,0),(1042,1,4,'report/log:viewtoday',1,1490726070,0),(1043,1,3,'report/log:viewtoday',1,1490726070,0),(1044,1,1,'report/log:viewtoday',1,1490726070,0),(1045,1,4,'report/loglive:view',1,1490726071,0),(1046,1,3,'report/loglive:view',1,1490726071,0),(1047,1,1,'report/loglive:view',1,1490726071,0),(1048,1,4,'report/outline:view',1,1490726071,0),(1049,1,3,'report/outline:view',1,1490726071,0),(1050,1,1,'report/outline:view',1,1490726071,0),(1051,1,4,'report/participation:view',1,1490726072,0),(1052,1,3,'report/participation:view',1,1490726072,0),(1053,1,1,'report/participation:view',1,1490726072,0),(1054,1,1,'report/performance:view',1,1490726072,0),(1055,1,4,'report/progress:view',1,1490726073,0),(1056,1,3,'report/progress:view',1,1490726073,0),(1057,1,1,'report/progress:view',1,1490726073,0),(1058,1,1,'report/security:view',1,1490726073,0),(1059,1,4,'report/stats:view',1,1490726074,0),(1060,1,3,'report/stats:view',1,1490726074,0),(1061,1,1,'report/stats:view',1,1490726074,0),(1062,1,6,'report/usersessions:manageownsessions',-1000,1490726074,0),(1063,1,7,'report/usersessions:manageownsessions',1,1490726074,0),(1064,1,1,'report/usersessions:manageownsessions',1,1490726074,0),(1065,1,4,'gradeexport/ods:view',1,1490726074,0),(1066,1,3,'gradeexport/ods:view',1,1490726074,0),(1067,1,1,'gradeexport/ods:view',1,1490726074,0),(1068,1,1,'gradeexport/ods:publish',1,1490726074,0),(1069,1,4,'gradeexport/txt:view',1,1490726075,0),(1070,1,3,'gradeexport/txt:view',1,1490726075,0),(1071,1,1,'gradeexport/txt:view',1,1490726075,0),(1072,1,1,'gradeexport/txt:publish',1,1490726075,0),(1073,1,4,'gradeexport/xls:view',1,1490726075,0),(1074,1,3,'gradeexport/xls:view',1,1490726075,0),(1075,1,1,'gradeexport/xls:view',1,1490726075,0),(1076,1,1,'gradeexport/xls:publish',1,1490726075,0),(1077,1,4,'gradeexport/xml:view',1,1490726075,0),(1078,1,3,'gradeexport/xml:view',1,1490726075,0),(1079,1,1,'gradeexport/xml:view',1,1490726076,0),(1080,1,1,'gradeexport/xml:publish',1,1490726076,0),(1081,1,3,'gradeimport/csv:view',1,1490726076,0),(1082,1,1,'gradeimport/csv:view',1,1490726076,0),(1083,1,3,'gradeimport/direct:view',1,1490726076,0),(1084,1,1,'gradeimport/direct:view',1,1490726076,0),(1085,1,3,'gradeimport/xml:view',1,1490726077,0),(1086,1,1,'gradeimport/xml:view',1,1490726077,0),(1087,1,1,'gradeimport/xml:publish',1,1490726077,0),(1088,1,4,'gradereport/grader:view',1,1490726077,0),(1089,1,3,'gradereport/grader:view',1,1490726077,0),(1090,1,1,'gradereport/grader:view',1,1490726077,0),(1091,1,4,'gradereport/history:view',1,1490726077,0),(1092,1,3,'gradereport/history:view',1,1490726078,0),(1093,1,1,'gradereport/history:view',1,1490726078,0),(1094,1,4,'gradereport/outcomes:view',1,1490726078,0),(1095,1,3,'gradereport/outcomes:view',1,1490726078,0),(1096,1,1,'gradereport/outcomes:view',1,1490726078,0),(1097,1,5,'gradereport/overview:view',1,1490726078,0),(1098,1,1,'gradereport/overview:view',1,1490726078,0),(1099,1,3,'gradereport/singleview:view',1,1490726079,0),(1100,1,1,'gradereport/singleview:view',1,1490726079,0),(1101,1,5,'gradereport/user:view',1,1490726079,0),(1102,1,4,'gradereport/user:view',1,1490726079,0),(1103,1,3,'gradereport/user:view',1,1490726079,0),(1104,1,1,'gradereport/user:view',1,1490726079,0),(1105,1,7,'repository/alfresco:view',1,1490726082,0),(1106,1,7,'repository/areafiles:view',1,1490726083,0),(1107,1,7,'repository/boxnet:view',1,1490726083,0),(1108,1,2,'repository/coursefiles:view',1,1490726083,0),(1109,1,4,'repository/coursefiles:view',1,1490726083,0),(1110,1,3,'repository/coursefiles:view',1,1490726083,0),(1111,1,1,'repository/coursefiles:view',1,1490726083,0),(1112,1,7,'repository/dropbox:view',1,1490726084,0),(1113,1,7,'repository/equella:view',1,1490726084,0),(1114,1,2,'repository/filesystem:view',1,1490726084,0),(1115,1,4,'repository/filesystem:view',1,1490726084,0),(1116,1,3,'repository/filesystem:view',1,1490726084,0),(1117,1,1,'repository/filesystem:view',1,1490726084,0),(1118,1,7,'repository/flickr:view',1,1490726085,0),(1119,1,7,'repository/flickr_public:view',1,1490726085,0),(1120,1,7,'repository/googledocs:view',1,1490726085,0),(1121,1,2,'repository/local:view',1,1490726086,0),(1122,1,4,'repository/local:view',1,1490726086,0),(1123,1,3,'repository/local:view',1,1490726086,0),(1124,1,1,'repository/local:view',1,1490726086,0),(1125,1,7,'repository/merlot:view',1,1490726086,0),(1126,1,7,'repository/picasa:view',1,1490726086,0),(1127,1,7,'repository/recent:view',1,1490726087,0),(1128,1,7,'repository/s3:view',1,1490726087,0),(1129,1,7,'repository/skydrive:view',1,1490726087,0),(1130,1,7,'repository/upload:view',1,1490726088,0),(1131,1,7,'repository/url:view',1,1490726088,0),(1132,1,7,'repository/user:view',1,1490726089,0),(1133,1,2,'repository/webdav:view',1,1490726089,0),(1134,1,4,'repository/webdav:view',1,1490726089,0),(1135,1,3,'repository/webdav:view',1,1490726089,0),(1136,1,1,'repository/webdav:view',1,1490726089,0),(1137,1,7,'repository/wikimedia:view',1,1490726090,0),(1138,1,7,'repository/youtube:view',1,1490726090,0),(1139,1,1,'tool/customlang:view',1,1490726097,0),(1140,1,1,'tool/customlang:edit',1,1490726098,0),(1141,1,4,'tool/monitor:subscribe',1,1490726100,0),(1142,1,3,'tool/monitor:subscribe',1,1490726100,0),(1143,1,1,'tool/monitor:subscribe',1,1490726100,0),(1144,1,4,'tool/monitor:managerules',1,1490726101,0),(1145,1,3,'tool/monitor:managerules',1,1490726101,0),(1146,1,1,'tool/monitor:managerules',1,1490726101,0),(1147,1,1,'tool/monitor:managetool',1,1490726101,0),(1148,1,1,'tool/uploaduser:uploaduserpictures',1,1490726104,0),(1149,1,3,'booktool/importhtml:import',1,1490726112,0),(1150,1,1,'booktool/importhtml:import',1,1490726112,0),(1151,1,6,'booktool/print:print',1,1490726113,0),(1152,1,8,'booktool/print:print',1,1490726113,0),(1153,1,5,'booktool/print:print',1,1490726113,0),(1154,1,4,'booktool/print:print',1,1490726113,0),(1155,1,3,'booktool/print:print',1,1490726113,0),(1156,1,1,'booktool/print:print',1,1490726113,0),(1157,1,4,'quiz/grading:viewstudentnames',1,1490726117,0),(1158,1,3,'quiz/grading:viewstudentnames',1,1490726117,0),(1159,1,1,'quiz/grading:viewstudentnames',1,1490726117,0),(1160,1,4,'quiz/grading:viewidnumber',1,1490726117,0),(1161,1,3,'quiz/grading:viewidnumber',1,1490726117,0),(1162,1,1,'quiz/grading:viewidnumber',1,1490726117,0),(1163,1,4,'quiz/statistics:view',1,1490726119,0),(1164,1,3,'quiz/statistics:view',1,1490726119,0),(1165,1,1,'quiz/statistics:view',1,1490726119,0);
/*!40000 ALTER TABLE `mdl_role_capabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_context_levels`
--

DROP TABLE IF EXISTS `mdl_role_context_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_context_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  KEY `mdl_rolecontleve_rol_ix` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists which roles can be assigned at which context levels. T';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_context_levels`
--

LOCK TABLES `mdl_role_context_levels` WRITE;
/*!40000 ALTER TABLE `mdl_role_context_levels` DISABLE KEYS */;
INSERT INTO `mdl_role_context_levels` VALUES (1,1,10),(4,2,10),(2,1,40),(5,2,40),(3,1,50),(6,3,50),(8,4,50),(10,5,50),(7,3,70),(9,4,70),(11,5,70);
/*!40000 ALTER TABLE `mdl_role_context_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_names`
--

DROP TABLE IF EXISTS `mdl_role_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_names` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  KEY `mdl_rolename_rol_ix` (`roleid`),
  KEY `mdl_rolename_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='role names in native strings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_names`
--

LOCK TABLES `mdl_role_names` WRITE;
/*!40000 ALTER TABLE `mdl_role_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_role_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_sortorder`
--

DROP TABLE IF EXISTS `mdl_role_sortorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_sortorder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `sortoder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`),
  KEY `mdl_rolesort_use_ix` (`userid`),
  KEY `mdl_rolesort_rol_ix` (`roleid`),
  KEY `mdl_rolesort_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='sort order of course managers in a course';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_sortorder`
--

LOCK TABLES `mdl_role_sortorder` WRITE;
/*!40000 ALTER TABLE `mdl_role_sortorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_role_sortorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scale`
--

DROP TABLE IF EXISTS `mdl_scale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scale` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scale` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scal_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines grading scales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scale`
--

LOCK TABLES `mdl_scale` WRITE;
/*!40000 ALTER TABLE `mdl_scale` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scale_history`
--

DROP TABLE IF EXISTS `mdl_scale_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scale_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scale` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scalhist_act_ix` (`action`),
  KEY `mdl_scalhist_old_ix` (`oldid`),
  KEY `mdl_scalhist_cou_ix` (`courseid`),
  KEY `mdl_scalhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scale_history`
--

LOCK TABLES `mdl_scale_history` WRITE;
/*!40000 ALTER TABLE `mdl_scale_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scale_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm`
--

DROP TABLE IF EXISTS `mdl_scorm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scormtype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `version` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint(2) NOT NULL DEFAULT '0',
  `whatgrade` bigint(10) NOT NULL DEFAULT '0',
  `maxattempt` bigint(10) NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '0',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '0',
  `updatefreq` tinyint(1) NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `md5hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `launch` bigint(10) NOT NULL DEFAULT '0',
  `skipview` tinyint(1) NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `nav` tinyint(1) NOT NULL DEFAULT '1',
  `navpositionleft` bigint(10) DEFAULT '-100',
  `navpositiontop` bigint(10) DEFAULT '-100',
  `auto` tinyint(1) NOT NULL DEFAULT '0',
  `popup` tinyint(1) NOT NULL DEFAULT '0',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` bigint(10) NOT NULL DEFAULT '100',
  `height` bigint(10) NOT NULL DEFAULT '600',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionstatusrequired` tinyint(1) DEFAULT NULL,
  `completionscorerequired` tinyint(2) DEFAULT NULL,
  `displayactivityname` smallint(4) NOT NULL DEFAULT '1',
  `autocommit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scor_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each table is one SCORM module and its configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm`
--

LOCK TABLES `mdl_scorm` WRITE;
/*!40000 ALTER TABLE `mdl_scorm` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_aicc_session`
--

DROP TABLE IF EXISTS `mdl_scorm_aicc_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_aicc_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `hacpsession` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scoid` bigint(10) DEFAULT '0',
  `scormmode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scormstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` bigint(10) DEFAULT NULL,
  `lessonstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sessiontime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scoraiccsess_sco_ix` (`scormid`),
  KEY `mdl_scoraiccsess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used by AICC HACP to store session information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_aicc_session`
--

LOCK TABLES `mdl_scorm_aicc_session` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_aicc_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_aicc_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_scoes`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_scoes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scorm` bigint(10) NOT NULL DEFAULT '0',
  `manifest` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `organization` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `launch` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scormtype` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoe_sco_ix` (`scorm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each SCO part of the SCORM module';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_scoes`
--

LOCK TABLES `mdl_scorm_scoes` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_scoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_scoes_data`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_scoes_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoedata_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains variable data get from packages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_scoes_data`
--

LOCK TABLES `mdl_scorm_scoes_data` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_scoes_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_scoes_track`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_scoes_track` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` bigint(10) NOT NULL DEFAULT '1',
  `element` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  KEY `mdl_scorscoetrac_use_ix` (`userid`),
  KEY `mdl_scorscoetrac_ele_ix` (`element`),
  KEY `mdl_scorscoetrac_sco_ix` (`scormid`),
  KEY `mdl_scorscoetrac_sco2_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to track SCOes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_scoes_track`
--

LOCK TABLES `mdl_scorm_scoes_track` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_scoes_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_mapinfo`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_mapinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_mapinfo` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint(10) NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 objective mapinfo description';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_mapinfo`
--

LOCK TABLES `mdl_scorm_seq_mapinfo` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_mapinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_mapinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_objective`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_objective` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqobje_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 objective description';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_objective`
--

LOCK TABLES `mdl_scorm_seq_objective` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_objective` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_rolluprule`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rolluprule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_rolluprule` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `minimumcount` bigint(10) NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `action` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqroll_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 sequencing rule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_rolluprule`
--

LOCK TABLES `mdl_scorm_seq_rolluprule` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprule` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_rolluprulecond`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rolluprulecond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_rolluprulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `rollupruleid` bigint(10) NOT NULL DEFAULT '0',
  `operator` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 sequencing rule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_rolluprulecond`
--

LOCK TABLES `mdl_scorm_seq_rolluprulecond` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprulecond` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprulecond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_rulecond`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rulecond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_rulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint(10) NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'always',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 rule condition';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_rulecond`
--

LOCK TABLES `mdl_scorm_seq_rulecond` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_rulecond` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rulecond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_ruleconds`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_ruleconds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_ruleconds` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `ruletype` tinyint(2) NOT NULL DEFAULT '0',
  `action` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqrule_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 rule conditions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_ruleconds`
--

LOCK TABLES `mdl_scorm_seq_ruleconds` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_ruleconds` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_ruleconds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sessions`
--

DROP TABLE IF EXISTS `mdl_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `state` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `sessdata` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_sess_sid_uix` (`sid`),
  KEY `mdl_sess_sta_ix` (`state`),
  KEY `mdl_sess_tim_ix` (`timecreated`),
  KEY `mdl_sess_tim2_ix` (`timemodified`),
  KEY `mdl_sess_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Database based session storage - now recommended';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_sessions`
--

LOCK TABLES `mdl_sessions` WRITE;
/*!40000 ALTER TABLE `mdl_sessions` DISABLE KEYS */;
INSERT INTO `mdl_sessions` VALUES (4,0,'6g6p1nlik6e32g3u53jrggbd01',2,NULL,1490789856,1490794647,'127.0.0.1','127.0.0.1');
/*!40000 ALTER TABLE `mdl_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_daily`
--

DROP TABLE IF EXISTS `mdl_stats_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statdail_cou_ix` (`courseid`),
  KEY `mdl_statdail_tim_ix` (`timeend`),
  KEY `mdl_statdail_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to accumulate daily stats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_daily`
--

LOCK TABLES `mdl_stats_daily` WRITE;
/*!40000 ALTER TABLE `mdl_stats_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_monthly`
--

DROP TABLE IF EXISTS `mdl_stats_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statmont_cou_ix` (`courseid`),
  KEY `mdl_statmont_tim_ix` (`timeend`),
  KEY `mdl_statmont_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate monthly stats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_monthly`
--

LOCK TABLES `mdl_stats_monthly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_user_daily`
--

DROP TABLE IF EXISTS `mdl_stats_user_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_user_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserdail_cou_ix` (`courseid`),
  KEY `mdl_statuserdail_use_ix` (`userid`),
  KEY `mdl_statuserdail_rol_ix` (`roleid`),
  KEY `mdl_statuserdail_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate daily stats per course/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_user_daily`
--

LOCK TABLES `mdl_stats_user_daily` WRITE;
/*!40000 ALTER TABLE `mdl_stats_user_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_user_monthly`
--

DROP TABLE IF EXISTS `mdl_stats_user_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_user_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statusermont_cou_ix` (`courseid`),
  KEY `mdl_statusermont_use_ix` (`userid`),
  KEY `mdl_statusermont_rol_ix` (`roleid`),
  KEY `mdl_statusermont_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate monthly stats per course/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_user_monthly`
--

LOCK TABLES `mdl_stats_user_monthly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_user_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_user_weekly`
--

DROP TABLE IF EXISTS `mdl_stats_user_weekly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_user_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserweek_cou_ix` (`courseid`),
  KEY `mdl_statuserweek_use_ix` (`userid`),
  KEY `mdl_statuserweek_rol_ix` (`roleid`),
  KEY `mdl_statuserweek_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate weekly stats per course/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_user_weekly`
--

LOCK TABLES `mdl_stats_user_weekly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_user_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_weekly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_weekly`
--

DROP TABLE IF EXISTS `mdl_stats_weekly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statweek_cou_ix` (`courseid`),
  KEY `mdl_statweek_tim_ix` (`timeend`),
  KEY `mdl_statweek_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate weekly stats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_weekly`
--

LOCK TABLES `mdl_stats_weekly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_weekly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey`
--

DROP TABLE IF EXISTS `mdl_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `days` mediumint(6) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `questions` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_surv_cou_ix` (`course`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one SURVEY module with its configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey`
--

LOCK TABLES `mdl_survey` WRITE;
/*!40000 ALTER TABLE `mdl_survey` DISABLE KEYS */;
INSERT INTO `mdl_survey` VALUES (1,0,0,0,985017600,985017600,'collesaname','collesaintro',0,'25,26,27,28,29,30,43,44'),(2,0,0,0,985017600,985017600,'collespname','collespintro',0,'31,32,33,34,35,36,43,44'),(3,0,0,0,985017600,985017600,'collesapname','collesapintro',0,'37,38,39,40,41,42,43,44'),(4,0,0,0,985017600,985017600,'attlsname','attlsintro',0,'65,67,68'),(5,0,0,0,985017600,985017600,'ciqname','ciqintro',0,'69,70,71,72,73');
/*!40000 ALTER TABLE `mdl_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey_analysis`
--

DROP TABLE IF EXISTS `mdl_survey_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `notes` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survanal_use_ix` (`userid`),
  KEY `mdl_survanal_sur_ix` (`survey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='text about each survey submission';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey_analysis`
--

LOCK TABLES `mdl_survey_analysis` WRITE;
/*!40000 ALTER TABLE `mdl_survey_analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_survey_analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey_answers`
--

DROP TABLE IF EXISTS `mdl_survey_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `answer1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `answer2` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survansw_use_ix` (`userid`),
  KEY `mdl_survansw_sur_ix` (`survey`),
  KEY `mdl_survansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the answers to each questions filled by the users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey_answers`
--

LOCK TABLES `mdl_survey_answers` WRITE;
/*!40000 ALTER TABLE `mdl_survey_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_survey_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey_questions`
--

DROP TABLE IF EXISTS `mdl_survey_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey_questions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shorttext` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `multi` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` smallint(3) NOT NULL DEFAULT '0',
  `options` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the questions conforming one survey';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey_questions`
--

LOCK TABLES `mdl_survey_questions` WRITE;
/*!40000 ALTER TABLE `mdl_survey_questions` DISABLE KEYS */;
INSERT INTO `mdl_survey_questions` VALUES (1,'colles1','colles1short','','',1,'scaletimes5'),(2,'colles2','colles2short','','',1,'scaletimes5'),(3,'colles3','colles3short','','',1,'scaletimes5'),(4,'colles4','colles4short','','',1,'scaletimes5'),(5,'colles5','colles5short','','',1,'scaletimes5'),(6,'colles6','colles6short','','',1,'scaletimes5'),(7,'colles7','colles7short','','',1,'scaletimes5'),(8,'colles8','colles8short','','',1,'scaletimes5'),(9,'colles9','colles9short','','',1,'scaletimes5'),(10,'colles10','colles10short','','',1,'scaletimes5'),(11,'colles11','colles11short','','',1,'scaletimes5'),(12,'colles12','colles12short','','',1,'scaletimes5'),(13,'colles13','colles13short','','',1,'scaletimes5'),(14,'colles14','colles14short','','',1,'scaletimes5'),(15,'colles15','colles15short','','',1,'scaletimes5'),(16,'colles16','colles16short','','',1,'scaletimes5'),(17,'colles17','colles17short','','',1,'scaletimes5'),(18,'colles18','colles18short','','',1,'scaletimes5'),(19,'colles19','colles19short','','',1,'scaletimes5'),(20,'colles20','colles20short','','',1,'scaletimes5'),(21,'colles21','colles21short','','',1,'scaletimes5'),(22,'colles22','colles22short','','',1,'scaletimes5'),(23,'colles23','colles23short','','',1,'scaletimes5'),(24,'colles24','colles24short','','',1,'scaletimes5'),(25,'collesm1','collesm1short','1,2,3,4','collesmintro',1,'scaletimes5'),(26,'collesm2','collesm2short','5,6,7,8','collesmintro',1,'scaletimes5'),(27,'collesm3','collesm3short','9,10,11,12','collesmintro',1,'scaletimes5'),(28,'collesm4','collesm4short','13,14,15,16','collesmintro',1,'scaletimes5'),(29,'collesm5','collesm5short','17,18,19,20','collesmintro',1,'scaletimes5'),(30,'collesm6','collesm6short','21,22,23,24','collesmintro',1,'scaletimes5'),(31,'collesm1','collesm1short','1,2,3,4','collesmintro',2,'scaletimes5'),(32,'collesm2','collesm2short','5,6,7,8','collesmintro',2,'scaletimes5'),(33,'collesm3','collesm3short','9,10,11,12','collesmintro',2,'scaletimes5'),(34,'collesm4','collesm4short','13,14,15,16','collesmintro',2,'scaletimes5'),(35,'collesm5','collesm5short','17,18,19,20','collesmintro',2,'scaletimes5'),(36,'collesm6','collesm6short','21,22,23,24','collesmintro',2,'scaletimes5'),(37,'collesm1','collesm1short','1,2,3,4','collesmintro',3,'scaletimes5'),(38,'collesm2','collesm2short','5,6,7,8','collesmintro',3,'scaletimes5'),(39,'collesm3','collesm3short','9,10,11,12','collesmintro',3,'scaletimes5'),(40,'collesm4','collesm4short','13,14,15,16','collesmintro',3,'scaletimes5'),(41,'collesm5','collesm5short','17,18,19,20','collesmintro',3,'scaletimes5'),(42,'collesm6','collesm6short','21,22,23,24','collesmintro',3,'scaletimes5'),(43,'howlong','','','',1,'howlongoptions'),(44,'othercomments','','','',0,NULL),(45,'attls1','attls1short','','',1,'scaleagree5'),(46,'attls2','attls2short','','',1,'scaleagree5'),(47,'attls3','attls3short','','',1,'scaleagree5'),(48,'attls4','attls4short','','',1,'scaleagree5'),(49,'attls5','attls5short','','',1,'scaleagree5'),(50,'attls6','attls6short','','',1,'scaleagree5'),(51,'attls7','attls7short','','',1,'scaleagree5'),(52,'attls8','attls8short','','',1,'scaleagree5'),(53,'attls9','attls9short','','',1,'scaleagree5'),(54,'attls10','attls10short','','',1,'scaleagree5'),(55,'attls11','attls11short','','',1,'scaleagree5'),(56,'attls12','attls12short','','',1,'scaleagree5'),(57,'attls13','attls13short','','',1,'scaleagree5'),(58,'attls14','attls14short','','',1,'scaleagree5'),(59,'attls15','attls15short','','',1,'scaleagree5'),(60,'attls16','attls16short','','',1,'scaleagree5'),(61,'attls17','attls17short','','',1,'scaleagree5'),(62,'attls18','attls18short','','',1,'scaleagree5'),(63,'attls19','attls19short','','',1,'scaleagree5'),(64,'attls20','attls20short','','',1,'scaleagree5'),(65,'attlsm1','attlsm1','45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64','attlsmintro',1,'scaleagree5'),(66,'-','-','-','-',0,'-'),(67,'attlsm2','attlsm2','63,62,59,57,55,49,52,50,48,47','attlsmintro',-1,'scaleagree5'),(68,'attlsm3','attlsm3','46,54,45,51,60,53,56,58,61,64','attlsmintro',-1,'scaleagree5'),(69,'ciq1','ciq1short','','',0,NULL),(70,'ciq2','ciq2short','','',0,NULL),(71,'ciq3','ciq3short','','',0,NULL),(72,'ciq4','ciq4short','','',0,NULL),(73,'ciq5','ciq5short','','',0,NULL);
/*!40000 ALTER TABLE `mdl_survey_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag`
--

DROP TABLE IF EXISTS `mdl_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tag` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rawname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tagtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `flag` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tag_nam_uix` (`name`),
  KEY `mdl_tag_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tag table - this generic table will replace the old "tags" t';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tag`
--

LOCK TABLES `mdl_tag` WRITE;
/*!40000 ALTER TABLE `mdl_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag_correlation`
--

DROP TABLE IF EXISTS `mdl_tag_correlation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tag_correlation` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `correlatedtags` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tagcorr_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The rationale for the ''tag_correlation'' table is performance';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tag_correlation`
--

LOCK TABLES `mdl_tag_correlation` WRITE;
/*!40000 ALTER TABLE `mdl_tag_correlation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tag_correlation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag_instance`
--

DROP TABLE IF EXISTS `mdl_tag_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tag_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `contextid` bigint(10) DEFAULT NULL,
  `tiuserid` bigint(10) NOT NULL DEFAULT '0',
  `ordering` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_taginst_iteitetagtiu_uix` (`itemtype`,`itemid`,`tagid`,`tiuserid`),
  KEY `mdl_taginst_tag_ix` (`tagid`),
  KEY `mdl_taginst_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tag_instance table holds the information of associations bet';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tag_instance`
--

LOCK TABLES `mdl_tag_instance` WRITE;
/*!40000 ALTER TABLE `mdl_tag_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tag_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_task_adhoc`
--

DROP TABLE IF EXISTS `mdl_task_adhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_task_adhoc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nextruntime` bigint(10) NOT NULL,
  `faildelay` bigint(10) DEFAULT NULL,
  `customdata` longtext COLLATE utf8_unicode_ci,
  `blocking` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_taskadho_nex_ix` (`nextruntime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of adhoc tasks waiting to run.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_task_adhoc`
--

LOCK TABLES `mdl_task_adhoc` WRITE;
/*!40000 ALTER TABLE `mdl_task_adhoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_task_adhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_task_scheduled`
--

DROP TABLE IF EXISTS `mdl_task_scheduled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_task_scheduled` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastruntime` bigint(10) DEFAULT NULL,
  `nextruntime` bigint(10) DEFAULT NULL,
  `blocking` tinyint(2) NOT NULL DEFAULT '0',
  `minute` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hour` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `day` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `month` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dayofweek` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `faildelay` bigint(10) DEFAULT NULL,
  `customised` tinyint(2) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tasksche_cla_uix` (`classname`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of scheduled tasks to be run by cron.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_task_scheduled`
--

LOCK TABLES `mdl_task_scheduled` WRITE;
/*!40000 ALTER TABLE `mdl_task_scheduled` DISABLE KEYS */;
INSERT INTO `mdl_task_scheduled` VALUES (1,'moodle','\\core\\task\\session_cleanup_task',0,1490725980,0,'*','*','*','*','*',0,0,0),(2,'moodle','\\core\\task\\delete_unconfirmed_users_task',0,1490727600,0,'0','*','*','*','*',0,0,0),(3,'moodle','\\core\\task\\delete_incomplete_users_task',0,1490727900,0,'5','*','*','*','*',0,0,0),(4,'moodle','\\core\\task\\backup_cleanup_task',0,1490728200,0,'10','*','*','*','*',0,0,0),(5,'moodle','\\core\\task\\tag_cron_task',0,1490728800,0,'20','*','*','*','*',0,0,0),(6,'moodle','\\core\\task\\context_cleanup_task',0,1490729100,0,'25','*','*','*','*',0,0,0),(7,'moodle','\\core\\task\\cache_cleanup_task',0,1490729400,0,'30','*','*','*','*',0,0,0),(8,'moodle','\\core\\task\\messaging_cleanup_task',0,1490726100,0,'35','*','*','*','*',0,0,0),(9,'moodle','\\core\\task\\send_new_user_passwords_task',0,1490725980,0,'*','*','*','*','*',0,0,0),(10,'moodle','\\core\\task\\send_failed_login_notifications_task',0,1490725980,0,'*','*','*','*','*',0,0,0),(11,'moodle','\\core\\task\\create_contexts_task',0,1490760000,1,'0','0','*','*','*',0,0,0),(12,'moodle','\\core\\task\\legacy_plugin_cron_task',0,1490725980,0,'*','*','*','*','*',0,0,0),(13,'moodle','\\core\\task\\grade_cron_task',0,1490725980,0,'*','*','*','*','*',0,0,0),(14,'moodle','\\core\\task\\events_cron_task',0,1490725980,0,'*','*','*','*','*',0,0,0),(15,'moodle','\\core\\task\\completion_regular_task',0,1490725980,0,'*','*','*','*','*',0,0,0),(16,'moodle','\\core\\task\\completion_daily_task',0,1490785380,0,'3','7','*','*','*',0,0,0),(17,'moodle','\\core\\task\\portfolio_cron_task',0,1490725980,0,'*','*','*','*','*',0,0,0),(18,'moodle','\\core\\task\\plagiarism_cron_task',0,1490725980,0,'*','*','*','*','*',0,0,0),(19,'moodle','\\core\\task\\calendar_cron_task',0,1490725980,0,'*','*','*','*','*',0,0,0),(20,'moodle','\\core\\task\\blog_cron_task',0,1490725980,0,'*','*','*','*','*',0,0,0),(21,'moodle','\\core\\task\\question_cron_task',0,1490725980,0,'*','*','*','*','*',0,0,0),(22,'moodle','\\core\\task\\registration_cron_task',0,1491002460,0,'21','19','*','*','5',0,0,0),(23,'moodle','\\core\\task\\check_for_updates_task',0,1490731200,0,'0','*/2','*','*','*',0,0,0),(24,'moodle','\\core\\task\\cache_cron_task',0,1490727000,0,'50','*','*','*','*',0,0,0),(25,'moodle','\\core\\task\\automated_backup_task',0,1490727000,0,'50','*','*','*','*',0,0,0),(26,'moodle','\\core\\task\\badges_cron_task',0,1490726100,0,'*/5','*','*','*','*',0,0,0),(27,'moodle','\\core\\task\\file_temp_cleanup_task',0,1490741700,0,'55','*/6','*','*','*',0,0,0),(28,'moodle','\\core\\task\\file_trash_cleanup_task',0,1490741700,0,'55','*/6','*','*','*',0,0,0),(29,'moodle','\\core\\task\\stats_cron_task',0,1490760000,0,'0','0','*','*','*',0,0,0),(30,'moodle','\\core\\task\\password_reset_cleanup_task',0,1490738400,0,'0','*/6','*','*','*',0,0,0),(31,'mod_forum','\\mod_forum\\task\\cron_task',0,1490726040,0,'*','*','*','*','*',0,0,0),(32,'auth_cas','\\auth_cas\\task\\sync_task',0,1490760000,0,'0','0','*','*','*',0,0,1),(33,'auth_ldap','\\auth_ldap\\task\\sync_task',0,1490760000,0,'0','0','*','*','*',0,0,1),(34,'enrol_flatfile','\\enrol_flatfile\\task\\flatfile_sync_task',0,1490728500,0,'15','*','*','*','*',0,0,0),(35,'enrol_imsenterprise','\\enrol_imsenterprise\\task\\cron_task',0,1490728200,0,'10','*','*','*','*',0,0,0),(36,'editor_atto','\\editor_atto\\task\\autosave_cleanup_task',0,1491300600,0,'10','6','*','*','2',0,0,0),(37,'tool_langimport','\\tool_langimport\\task\\update_langpacks_task',0,1490774700,0,'5','4','*','*','*',0,0,0),(38,'tool_messageinbound','\\tool_messageinbound\\task\\pickup_task',0,1490726160,0,'*','*','*','*','*',0,0,0),(39,'tool_messageinbound','\\tool_messageinbound\\task\\cleanup_task',0,1490766900,0,'55','1','*','*','*',0,0,0),(40,'tool_monitor','\\tool_monitor\\task\\clean_events',0,1490726160,0,'*','*','*','*','*',0,0,0),(41,'tool_monitor','\\tool_monitor\\task\\check_subscriptions',0,1490793240,0,'14','9','*','*','*',0,0,0),(42,'logstore_legacy','\\logstore_legacy\\task\\cleanup_task',0,1490779080,0,'18','5','*','*','*',0,0,0),(43,'logstore_standard','\\logstore_standard\\task\\cleanup_task',0,1490775480,0,'18','4','*','*','*',0,0,0);
/*!40000 ALTER TABLE `mdl_task_scheduled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_customlang`
--

DROP TABLE IF EXISTS `mdl_tool_customlang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_customlang` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `componentid` bigint(10) NOT NULL,
  `stringid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `original` longtext COLLATE utf8_unicode_ci NOT NULL,
  `master` longtext COLLATE utf8_unicode_ci,
  `local` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  `timecustomized` bigint(10) DEFAULT NULL,
  `outdated` smallint(3) DEFAULT '0',
  `modified` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  KEY `mdl_toolcust_com_ix` (`componentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the working checkout of all strings and their custo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_customlang`
--

LOCK TABLES `mdl_tool_customlang` WRITE;
/*!40000 ALTER TABLE `mdl_tool_customlang` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_customlang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_customlang_components`
--

DROP TABLE IF EXISTS `mdl_tool_customlang_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_customlang_components` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the list of all installed plugins that provide thei';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_customlang_components`
--

LOCK TABLES `mdl_tool_customlang_components` WRITE;
/*!40000 ALTER TABLE `mdl_tool_customlang_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_customlang_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_monitor_events`
--

DROP TABLE IF EXISTS `mdl_tool_monitor_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_monitor_events` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  `contextinstanceid` bigint(10) NOT NULL,
  `link` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A table that keeps a log of events related to subscriptions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_monitor_events`
--

LOCK TABLES `mdl_tool_monitor_events` WRITE;
/*!40000 ALTER TABLE `mdl_tool_monitor_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_monitor_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_monitor_history`
--

DROP TABLE IF EXISTS `mdl_tool_monitor_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_monitor_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `sid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timesent` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolmonihist_sidusetim_uix` (`sid`,`userid`,`timesent`),
  KEY `mdl_toolmonihist_sid_ix` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table to store history of message notifications sent';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_monitor_history`
--

LOCK TABLES `mdl_tool_monitor_history` WRITE;
/*!40000 ALTER TABLE `mdl_tool_monitor_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_monitor_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_monitor_rules`
--

DROP TABLE IF EXISTS `mdl_tool_monitor_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_monitor_rules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(1) NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `plugin` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `eventname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `template` longtext COLLATE utf8_unicode_ci NOT NULL,
  `templateformat` tinyint(1) NOT NULL,
  `frequency` smallint(4) NOT NULL,
  `timewindow` mediumint(5) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolmonirule_couuse_ix` (`courseid`,`userid`),
  KEY `mdl_toolmonirule_eve_ix` (`eventname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table to store rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_monitor_rules`
--

LOCK TABLES `mdl_tool_monitor_rules` WRITE;
/*!40000 ALTER TABLE `mdl_tool_monitor_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_monitor_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_monitor_subscriptions`
--

DROP TABLE IF EXISTS `mdl_tool_monitor_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_monitor_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `ruleid` bigint(10) NOT NULL,
  `cmid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastnotificationsent` bigint(10) NOT NULL DEFAULT '0',
  `inactivedate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_toolmonisubs_couuse_ix` (`courseid`,`userid`),
  KEY `mdl_toolmonisubs_rul_ix` (`ruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table to store user subscriptions to various rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_monitor_subscriptions`
--

LOCK TABLES `mdl_tool_monitor_subscriptions` WRITE;
/*!40000 ALTER TABLE `mdl_tool_monitor_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_monitor_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_upgrade_log`
--

DROP TABLE IF EXISTS `mdl_upgrade_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_upgrade_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` bigint(10) NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetversion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `details` longtext COLLATE utf8_unicode_ci,
  `backtrace` longtext COLLATE utf8_unicode_ci,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_upgrlog_tim_ix` (`timemodified`),
  KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`),
  KEY `mdl_upgrlog_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=1089 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Upgrade logging';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_upgrade_log`
--

LOCK TABLES `mdl_upgrade_log` WRITE;
/*!40000 ALTER TABLE `mdl_upgrade_log` DISABLE KEYS */;
INSERT INTO `mdl_upgrade_log` VALUES (1,0,'core','2015111609','2015111609','Upgrade savepoint reached',NULL,'',0,1490725917),(2,0,'core','2015111609','2015111609','Core installed',NULL,'',0,1490725972),(3,0,'availability_completion',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725972),(4,0,'availability_completion','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725972),(5,0,'availability_completion','2015111600','2015111600','Plugin installed',NULL,'',0,1490725972),(6,0,'availability_date',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725972),(7,0,'availability_date','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725973),(8,0,'availability_date','2015111600','2015111600','Plugin installed',NULL,'',0,1490725973),(9,0,'availability_grade',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725973),(10,0,'availability_grade','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725973),(11,0,'availability_grade','2015111600','2015111600','Plugin installed',NULL,'',0,1490725973),(12,0,'availability_group',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725973),(13,0,'availability_group','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725973),(14,0,'availability_group','2015111600','2015111600','Plugin installed',NULL,'',0,1490725973),(15,0,'availability_grouping',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725973),(16,0,'availability_grouping','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725973),(17,0,'availability_grouping','2015111600','2015111600','Plugin installed',NULL,'',0,1490725973),(18,0,'availability_profile',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725973),(19,0,'availability_profile','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725973),(20,0,'availability_profile','2015111600','2015111600','Plugin installed',NULL,'',0,1490725973),(21,0,'qtype_calculated',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725973),(22,0,'qtype_calculated','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725974),(23,0,'qtype_calculated','2015111600','2015111600','Plugin installed',NULL,'',0,1490725974),(24,0,'qtype_calculatedmulti',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725974),(25,0,'qtype_calculatedmulti','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725974),(26,0,'qtype_calculatedmulti','2015111600','2015111600','Plugin installed',NULL,'',0,1490725974),(27,0,'qtype_calculatedsimple',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725974),(28,0,'qtype_calculatedsimple','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725974),(29,0,'qtype_calculatedsimple','2015111600','2015111600','Plugin installed',NULL,'',0,1490725974),(30,0,'qtype_ddimageortext',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725974),(31,0,'qtype_ddimageortext','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725975),(32,0,'qtype_ddimageortext','2015111600','2015111600','Plugin installed',NULL,'',0,1490725975),(33,0,'qtype_ddmarker',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725975),(34,0,'qtype_ddmarker','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725975),(35,0,'qtype_ddmarker','2015111600','2015111600','Plugin installed',NULL,'',0,1490725975),(36,0,'qtype_ddwtos',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725975),(37,0,'qtype_ddwtos','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725975),(38,0,'qtype_ddwtos','2015111600','2015111600','Plugin installed',NULL,'',0,1490725975),(39,0,'qtype_description',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725975),(40,0,'qtype_description','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725976),(41,0,'qtype_description','2015111600','2015111600','Plugin installed',NULL,'',0,1490725976),(42,0,'qtype_essay',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725976),(43,0,'qtype_essay','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725976),(44,0,'qtype_essay','2015111600','2015111600','Plugin installed',NULL,'',0,1490725976),(45,0,'qtype_gapselect',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725976),(46,0,'qtype_gapselect','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725976),(47,0,'qtype_gapselect','2015111600','2015111600','Plugin installed',NULL,'',0,1490725976),(48,0,'qtype_match',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725977),(49,0,'qtype_match','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725977),(50,0,'qtype_match','2015111600','2015111600','Plugin installed',NULL,'',0,1490725977),(51,0,'qtype_missingtype',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725977),(52,0,'qtype_missingtype','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725977),(53,0,'qtype_missingtype','2015111600','2015111600','Plugin installed',NULL,'',0,1490725977),(54,0,'qtype_multianswer',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725977),(55,0,'qtype_multianswer','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725977),(56,0,'qtype_multianswer','2015111600','2015111600','Plugin installed',NULL,'',0,1490725977),(57,0,'qtype_multichoice',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725978),(58,0,'qtype_multichoice','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725978),(59,0,'qtype_multichoice','2015111600','2015111600','Plugin installed',NULL,'',0,1490725978),(60,0,'qtype_numerical',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725978),(61,0,'qtype_numerical','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725978),(62,0,'qtype_numerical','2015111600','2015111600','Plugin installed',NULL,'',0,1490725978),(63,0,'qtype_random',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725978),(64,0,'qtype_random','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725978),(65,0,'qtype_random','2015111600','2015111600','Plugin installed',NULL,'',0,1490725978),(66,0,'qtype_randomsamatch',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725978),(67,0,'qtype_randomsamatch','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725979),(68,0,'qtype_randomsamatch','2015111600','2015111600','Plugin installed',NULL,'',0,1490725979),(69,0,'qtype_shortanswer',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725979),(70,0,'qtype_shortanswer','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725979),(71,0,'qtype_shortanswer','2015111600','2015111600','Plugin installed',NULL,'',0,1490725979),(72,0,'qtype_truefalse',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725979),(73,0,'qtype_truefalse','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725979),(74,0,'qtype_truefalse','2015111600','2015111600','Plugin installed',NULL,'',0,1490725979),(75,0,'mod_assign',NULL,'2015111601','Starting plugin installation',NULL,'',0,1490725979),(76,0,'mod_assign','2015111601','2015111601','Upgrade savepoint reached',NULL,'',0,1490725980),(77,0,'mod_assign','2015111601','2015111601','Plugin installed',NULL,'',0,1490725983),(78,0,'mod_assignment',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725983),(79,0,'mod_assignment','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725983),(80,0,'mod_assignment','2015111600','2015111600','Plugin installed',NULL,'',0,1490725985),(81,0,'mod_book',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725985),(82,0,'mod_book','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725985),(83,0,'mod_book','2015111600','2015111600','Plugin installed',NULL,'',0,1490725986),(84,0,'mod_chat',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725986),(85,0,'mod_chat','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725986),(86,0,'mod_chat','2015111600','2015111600','Plugin installed',NULL,'',0,1490725988),(87,0,'mod_choice',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725988),(88,0,'mod_choice','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725988),(89,0,'mod_choice','2015111600','2015111600','Plugin installed',NULL,'',0,1490725989),(90,0,'mod_data',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725989),(91,0,'mod_data','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725990),(92,0,'mod_data','2015111600','2015111600','Plugin installed',NULL,'',0,1490725993),(93,0,'mod_feedback',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725993),(94,0,'mod_feedback','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725994),(95,0,'mod_feedback','2015111600','2015111600','Plugin installed',NULL,'',0,1490725995),(96,0,'mod_folder',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725995),(97,0,'mod_folder','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725996),(98,0,'mod_folder','2015111600','2015111600','Plugin installed',NULL,'',0,1490725996),(99,0,'mod_forum',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490725996),(100,0,'mod_forum','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490725997),(101,0,'mod_forum','2015111600','2015111600','Plugin installed',NULL,'',0,1490726002),(102,0,'mod_glossary',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726002),(103,0,'mod_glossary','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726003),(104,0,'mod_glossary','2015111600','2015111600','Plugin installed',NULL,'',0,1490726006),(105,0,'mod_imscp',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726006),(106,0,'mod_imscp','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726006),(107,0,'mod_imscp','2015111600','2015111600','Plugin installed',NULL,'',0,1490726006),(108,0,'mod_label',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726006),(109,0,'mod_label','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726007),(110,0,'mod_label','2015111600','2015111600','Plugin installed',NULL,'',0,1490726007),(111,0,'mod_lesson',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726007),(112,0,'mod_lesson','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726008),(113,0,'mod_lesson','2015111600','2015111600','Plugin installed',NULL,'',0,1490726009),(114,0,'mod_lti',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726009),(115,0,'mod_lti','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726009),(116,0,'mod_lti','2015111600','2015111600','Plugin installed',NULL,'',0,1490726010),(117,0,'mod_page',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726010),(118,0,'mod_page','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726010),(119,0,'mod_page','2015111600','2015111600','Plugin installed',NULL,'',0,1490726011),(120,0,'mod_quiz',NULL,'2015111602','Starting plugin installation',NULL,'',0,1490726011),(121,0,'mod_quiz','2015111602','2015111602','Upgrade savepoint reached',NULL,'',0,1490726012),(122,0,'mod_quiz','2015111602','2015111602','Plugin installed',NULL,'',0,1490726014),(123,0,'mod_resource',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726014),(124,0,'mod_resource','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726014),(125,0,'mod_resource','2015111600','2015111600','Plugin installed',NULL,'',0,1490726014),(126,0,'mod_scorm',NULL,'2015111601','Starting plugin installation',NULL,'',0,1490726014),(127,0,'mod_scorm','2015111601','2015111601','Upgrade savepoint reached',NULL,'',0,1490726015),(128,0,'mod_scorm','2015111601','2015111601','Plugin installed',NULL,'',0,1490726017),(129,0,'mod_survey',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726017),(130,0,'mod_survey','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726017),(131,0,'mod_survey','2015111600','2015111600','Plugin installed',NULL,'',0,1490726021),(132,0,'mod_url',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726021),(133,0,'mod_url','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726021),(134,0,'mod_url','2015111600','2015111600','Plugin installed',NULL,'',0,1490726022),(135,0,'mod_wiki',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726022),(136,0,'mod_wiki','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726023),(137,0,'mod_wiki','2015111600','2015111600','Plugin installed',NULL,'',0,1490726024),(138,0,'mod_workshop',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726024),(139,0,'mod_workshop','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726025),(140,0,'mod_workshop','2015111600','2015111600','Plugin installed',NULL,'',0,1490726028),(141,0,'auth_cas',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726028),(142,0,'auth_cas','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726028),(143,0,'auth_cas','2015111600','2015111600','Plugin installed',NULL,'',0,1490726029),(144,0,'auth_db',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726029),(145,0,'auth_db','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726029),(146,0,'auth_db','2015111600','2015111600','Plugin installed',NULL,'',0,1490726029),(147,0,'auth_email',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726029),(148,0,'auth_email','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726029),(149,0,'auth_email','2015111600','2015111600','Plugin installed',NULL,'',0,1490726030),(150,0,'auth_fc',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726030),(151,0,'auth_fc','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726030),(152,0,'auth_fc','2015111600','2015111600','Plugin installed',NULL,'',0,1490726030),(153,0,'auth_imap',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726030),(154,0,'auth_imap','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726030),(155,0,'auth_imap','2015111600','2015111600','Plugin installed',NULL,'',0,1490726030),(156,0,'auth_ldap',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726030),(157,0,'auth_ldap','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726030),(158,0,'auth_ldap','2015111600','2015111600','Plugin installed',NULL,'',0,1490726030),(159,0,'auth_manual',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726030),(160,0,'auth_manual','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726031),(161,0,'auth_manual','2015111600','2015111600','Plugin installed',NULL,'',0,1490726031),(162,0,'auth_mnet',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726031),(163,0,'auth_mnet','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726031),(164,0,'auth_mnet','2015111600','2015111600','Plugin installed',NULL,'',0,1490726032),(165,0,'auth_nntp',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726033),(166,0,'auth_nntp','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726033),(167,0,'auth_nntp','2015111600','2015111600','Plugin installed',NULL,'',0,1490726033),(168,0,'auth_nologin',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726033),(169,0,'auth_nologin','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726033),(170,0,'auth_nologin','2015111600','2015111600','Plugin installed',NULL,'',0,1490726033),(171,0,'auth_none',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726033),(172,0,'auth_none','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726033),(173,0,'auth_none','2015111600','2015111600','Plugin installed',NULL,'',0,1490726033),(174,0,'auth_pam',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726033),(175,0,'auth_pam','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726033),(176,0,'auth_pam','2015111600','2015111600','Plugin installed',NULL,'',0,1490726033),(177,0,'auth_pop3',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726034),(178,0,'auth_pop3','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726034),(179,0,'auth_pop3','2015111600','2015111600','Plugin installed',NULL,'',0,1490726034),(180,0,'auth_radius',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726034),(181,0,'auth_radius','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726034),(182,0,'auth_radius','2015111600','2015111600','Plugin installed',NULL,'',0,1490726034),(183,0,'auth_shibboleth',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726034),(184,0,'auth_shibboleth','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726034),(185,0,'auth_shibboleth','2015111600','2015111600','Plugin installed',NULL,'',0,1490726034),(186,0,'auth_webservice',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726034),(187,0,'auth_webservice','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726034),(188,0,'auth_webservice','2015111600','2015111600','Plugin installed',NULL,'',0,1490726034),(189,0,'calendartype_gregorian',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726035),(190,0,'calendartype_gregorian','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726035),(191,0,'calendartype_gregorian','2015111600','2015111600','Plugin installed',NULL,'',0,1490726035),(192,0,'enrol_category',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726035),(193,0,'enrol_category','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726035),(194,0,'enrol_category','2015111600','2015111600','Plugin installed',NULL,'',0,1490726035),(195,0,'enrol_cohort',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726035),(196,0,'enrol_cohort','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726035),(197,0,'enrol_cohort','2015111600','2015111600','Plugin installed',NULL,'',0,1490726035),(198,0,'enrol_database',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726035),(199,0,'enrol_database','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726036),(200,0,'enrol_database','2015111600','2015111600','Plugin installed',NULL,'',0,1490726036),(201,0,'enrol_flatfile',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726036),(202,0,'enrol_flatfile','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726036),(203,0,'enrol_flatfile','2015111600','2015111600','Plugin installed',NULL,'',0,1490726037),(204,0,'enrol_guest',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726037),(205,0,'enrol_guest','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726037),(206,0,'enrol_guest','2015111600','2015111600','Plugin installed',NULL,'',0,1490726037),(207,0,'enrol_imsenterprise',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726037),(208,0,'enrol_imsenterprise','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726037),(209,0,'enrol_imsenterprise','2015111600','2015111600','Plugin installed',NULL,'',0,1490726038),(210,0,'enrol_ldap',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726038),(211,0,'enrol_ldap','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726038),(212,0,'enrol_ldap','2015111600','2015111600','Plugin installed',NULL,'',0,1490726038),(213,0,'enrol_manual',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726038),(214,0,'enrol_manual','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726038),(215,0,'enrol_manual','2015111600','2015111600','Plugin installed',NULL,'',0,1490726039),(216,0,'enrol_meta',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726039),(217,0,'enrol_meta','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726039),(218,0,'enrol_meta','2015111600','2015111600','Plugin installed',NULL,'',0,1490726039),(219,0,'enrol_mnet',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726039),(220,0,'enrol_mnet','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726039),(221,0,'enrol_mnet','2015111600','2015111600','Plugin installed',NULL,'',0,1490726041),(222,0,'enrol_paypal',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726041),(223,0,'enrol_paypal','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726041),(224,0,'enrol_paypal','2015111600','2015111600','Plugin installed',NULL,'',0,1490726041),(225,0,'enrol_self',NULL,'2015111601','Starting plugin installation',NULL,'',0,1490726041),(226,0,'enrol_self','2015111601','2015111601','Upgrade savepoint reached',NULL,'',0,1490726041),(227,0,'enrol_self','2015111601','2015111601','Plugin installed',NULL,'',0,1490726042),(228,0,'message_airnotifier',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726042),(229,0,'message_airnotifier','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726042),(230,0,'message_airnotifier','2015111600','2015111600','Plugin installed',NULL,'',0,1490726043),(231,0,'message_email',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726043),(232,0,'message_email','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726043),(233,0,'message_email','2015111600','2015111600','Plugin installed',NULL,'',0,1490726043),(234,0,'message_jabber',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726043),(235,0,'message_jabber','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726043),(236,0,'message_jabber','2015111600','2015111600','Plugin installed',NULL,'',0,1490726043),(237,0,'message_popup',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726043),(238,0,'message_popup','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726043),(239,0,'message_popup','2015111600','2015111600','Plugin installed',NULL,'',0,1490726044),(240,0,'block_activity_modules',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726044),(241,0,'block_activity_modules','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726044),(242,0,'block_activity_modules','2015111600','2015111600','Plugin installed',NULL,'',0,1490726044),(243,0,'block_activity_results',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726044),(244,0,'block_activity_results','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726044),(245,0,'block_activity_results','2015111600','2015111600','Plugin installed',NULL,'',0,1490726044),(246,0,'block_admin_bookmarks',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726044),(247,0,'block_admin_bookmarks','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726045),(248,0,'block_admin_bookmarks','2015111600','2015111600','Plugin installed',NULL,'',0,1490726045),(249,0,'block_badges',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726045),(250,0,'block_badges','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726045),(251,0,'block_badges','2015111600','2015111600','Plugin installed',NULL,'',0,1490726045),(252,0,'block_blog_menu',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726045),(253,0,'block_blog_menu','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726045),(254,0,'block_blog_menu','2015111600','2015111600','Plugin installed',NULL,'',0,1490726045),(255,0,'block_blog_recent',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726046),(256,0,'block_blog_recent','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726046),(257,0,'block_blog_recent','2015111600','2015111600','Plugin installed',NULL,'',0,1490726046),(258,0,'block_blog_tags',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726046),(259,0,'block_blog_tags','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726046),(260,0,'block_blog_tags','2015111600','2015111600','Plugin installed',NULL,'',0,1490726046),(261,0,'block_calendar_month',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726046),(262,0,'block_calendar_month','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726046),(263,0,'block_calendar_month','2015111600','2015111600','Plugin installed',NULL,'',0,1490726047),(264,0,'block_calendar_upcoming',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726047),(265,0,'block_calendar_upcoming','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726047),(266,0,'block_calendar_upcoming','2015111600','2015111600','Plugin installed',NULL,'',0,1490726047),(267,0,'block_comments',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726047),(268,0,'block_comments','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726047),(269,0,'block_comments','2015111600','2015111600','Plugin installed',NULL,'',0,1490726047),(270,0,'block_community',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726047),(271,0,'block_community','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726048),(272,0,'block_community','2015111600','2015111600','Plugin installed',NULL,'',0,1490726048),(273,0,'block_completionstatus',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726048),(274,0,'block_completionstatus','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726048),(275,0,'block_completionstatus','2015111600','2015111600','Plugin installed',NULL,'',0,1490726048),(276,0,'block_course_list',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726048),(277,0,'block_course_list','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726048),(278,0,'block_course_list','2015111600','2015111600','Plugin installed',NULL,'',0,1490726049),(279,0,'block_course_overview',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726049),(280,0,'block_course_overview','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726049),(281,0,'block_course_overview','2015111600','2015111600','Plugin installed',NULL,'',0,1490726049),(282,0,'block_course_summary',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726049),(283,0,'block_course_summary','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726049),(284,0,'block_course_summary','2015111600','2015111600','Plugin installed',NULL,'',0,1490726049),(285,0,'block_feedback',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726049),(286,0,'block_feedback','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726049),(287,0,'block_feedback','2015111600','2015111600','Plugin installed',NULL,'',0,1490726050),(288,0,'block_glossary_random',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726050),(289,0,'block_glossary_random','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726050),(290,0,'block_glossary_random','2015111600','2015111600','Plugin installed',NULL,'',0,1490726051),(291,0,'block_html',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726051),(292,0,'block_html','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726051),(293,0,'block_html','2015111600','2015111600','Plugin installed',NULL,'',0,1490726051),(294,0,'block_login',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726051),(295,0,'block_login','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726051),(296,0,'block_login','2015111600','2015111600','Plugin installed',NULL,'',0,1490726051),(297,0,'block_mentees',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726051),(298,0,'block_mentees','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726052),(299,0,'block_mentees','2015111600','2015111600','Plugin installed',NULL,'',0,1490726052),(300,0,'block_messages',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726052),(301,0,'block_messages','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726052),(302,0,'block_messages','2015111600','2015111600','Plugin installed',NULL,'',0,1490726052),(303,0,'block_mnet_hosts',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726052),(304,0,'block_mnet_hosts','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726052),(305,0,'block_mnet_hosts','2015111600','2015111600','Plugin installed',NULL,'',0,1490726053),(306,0,'block_myprofile',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726053),(307,0,'block_myprofile','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726053),(308,0,'block_myprofile','2015111600','2015111600','Plugin installed',NULL,'',0,1490726053),(309,0,'block_navigation',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726053),(310,0,'block_navigation','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726053),(311,0,'block_navigation','2015111600','2015111600','Plugin installed',NULL,'',0,1490726053),(312,0,'block_news_items',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726054),(313,0,'block_news_items','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726054),(314,0,'block_news_items','2015111600','2015111600','Plugin installed',NULL,'',0,1490726054),(315,0,'block_online_users',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726054),(316,0,'block_online_users','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726054),(317,0,'block_online_users','2015111600','2015111600','Plugin installed',NULL,'',0,1490726054),(318,0,'block_participants',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726055),(319,0,'block_participants','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726055),(320,0,'block_participants','2015111600','2015111600','Plugin installed',NULL,'',0,1490726055),(321,0,'block_private_files',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726055),(322,0,'block_private_files','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726055),(323,0,'block_private_files','2015111600','2015111600','Plugin installed',NULL,'',0,1490726055),(324,0,'block_quiz_results',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726055),(325,0,'block_quiz_results','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726055),(326,0,'block_quiz_results','2015111600','2015111600','Plugin installed',NULL,'',0,1490726056),(327,0,'block_recent_activity',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726056),(328,0,'block_recent_activity','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726056),(329,0,'block_recent_activity','2015111600','2015111600','Plugin installed',NULL,'',0,1490726056),(330,0,'block_rss_client',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726056),(331,0,'block_rss_client','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726056),(332,0,'block_rss_client','2015111600','2015111600','Plugin installed',NULL,'',0,1490726057),(333,0,'block_search_forums',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726057),(334,0,'block_search_forums','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726057),(335,0,'block_search_forums','2015111600','2015111600','Plugin installed',NULL,'',0,1490726057),(336,0,'block_section_links',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726057),(337,0,'block_section_links','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726057),(338,0,'block_section_links','2015111600','2015111600','Plugin installed',NULL,'',0,1490726057),(339,0,'block_selfcompletion',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726057),(340,0,'block_selfcompletion','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726057),(341,0,'block_selfcompletion','2015111600','2015111600','Plugin installed',NULL,'',0,1490726058),(342,0,'block_settings',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726058),(343,0,'block_settings','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726058),(344,0,'block_settings','2015111600','2015111600','Plugin installed',NULL,'',0,1490726058),(345,0,'block_site_main_menu',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726058),(346,0,'block_site_main_menu','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726058),(347,0,'block_site_main_menu','2015111600','2015111600','Plugin installed',NULL,'',0,1490726058),(348,0,'block_social_activities',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726059),(349,0,'block_social_activities','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726059),(350,0,'block_social_activities','2015111600','2015111600','Plugin installed',NULL,'',0,1490726059),(351,0,'block_tag_flickr',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726059),(352,0,'block_tag_flickr','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726059),(353,0,'block_tag_flickr','2015111600','2015111600','Plugin installed',NULL,'',0,1490726059),(354,0,'block_tag_youtube',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726059),(355,0,'block_tag_youtube','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726060),(356,0,'block_tag_youtube','2015111600','2015111600','Plugin installed',NULL,'',0,1490726060),(357,0,'block_tags',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726060),(358,0,'block_tags','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726060),(359,0,'block_tags','2015111600','2015111600','Plugin installed',NULL,'',0,1490726060),(360,0,'filter_activitynames',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726062),(361,0,'filter_activitynames','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726062),(362,0,'filter_activitynames','2015111600','2015111600','Plugin installed',NULL,'',0,1490726062),(363,0,'filter_algebra',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726062),(364,0,'filter_algebra','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726062),(365,0,'filter_algebra','2015111600','2015111600','Plugin installed',NULL,'',0,1490726062),(366,0,'filter_censor',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726062),(367,0,'filter_censor','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726062),(368,0,'filter_censor','2015111600','2015111600','Plugin installed',NULL,'',0,1490726062),(369,0,'filter_data',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726063),(370,0,'filter_data','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726063),(371,0,'filter_data','2015111600','2015111600','Plugin installed',NULL,'',0,1490726063),(372,0,'filter_emailprotect',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726063),(373,0,'filter_emailprotect','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726063),(374,0,'filter_emailprotect','2015111600','2015111600','Plugin installed',NULL,'',0,1490726063),(375,0,'filter_emoticon',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726063),(376,0,'filter_emoticon','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726063),(377,0,'filter_emoticon','2015111600','2015111600','Plugin installed',NULL,'',0,1490726063),(378,0,'filter_glossary',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726063),(379,0,'filter_glossary','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726063),(380,0,'filter_glossary','2015111600','2015111600','Plugin installed',NULL,'',0,1490726064),(381,0,'filter_mathjaxloader',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726064),(382,0,'filter_mathjaxloader','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726064),(383,0,'filter_mathjaxloader','2015111600','2015111600','Plugin installed',NULL,'',0,1490726064),(384,0,'filter_mediaplugin',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726064),(385,0,'filter_mediaplugin','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726064),(386,0,'filter_mediaplugin','2015111600','2015111600','Plugin installed',NULL,'',0,1490726064),(387,0,'filter_multilang',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726064),(388,0,'filter_multilang','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726064),(389,0,'filter_multilang','2015111600','2015111600','Plugin installed',NULL,'',0,1490726064),(390,0,'filter_tex',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726064),(391,0,'filter_tex','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726064),(392,0,'filter_tex','2015111600','2015111600','Plugin installed',NULL,'',0,1490726065),(393,0,'filter_tidy',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726065),(394,0,'filter_tidy','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726065),(395,0,'filter_tidy','2015111600','2015111600','Plugin installed',NULL,'',0,1490726065),(396,0,'filter_urltolink',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726065),(397,0,'filter_urltolink','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726065),(398,0,'filter_urltolink','2015111600','2015111600','Plugin installed',NULL,'',0,1490726065),(399,0,'editor_atto',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726065),(400,0,'editor_atto','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726065),(401,0,'editor_atto','2015111600','2015111600','Plugin installed',NULL,'',0,1490726066),(402,0,'editor_textarea',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726066),(403,0,'editor_textarea','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726066),(404,0,'editor_textarea','2015111600','2015111600','Plugin installed',NULL,'',0,1490726066),(405,0,'editor_tinymce',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726066),(406,0,'editor_tinymce','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726066),(407,0,'editor_tinymce','2015111600','2015111600','Plugin installed',NULL,'',0,1490726066),(408,0,'format_singleactivity',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726066),(409,0,'format_singleactivity','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726066),(410,0,'format_singleactivity','2015111600','2015111600','Plugin installed',NULL,'',0,1490726066),(411,0,'format_social',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726066),(412,0,'format_social','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726066),(413,0,'format_social','2015111600','2015111600','Plugin installed',NULL,'',0,1490726067),(414,0,'format_topics',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726067),(415,0,'format_topics','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726067),(416,0,'format_topics','2015111600','2015111600','Plugin installed',NULL,'',0,1490726067),(417,0,'format_weeks',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726067),(418,0,'format_weeks','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726067),(419,0,'format_weeks','2015111600','2015111600','Plugin installed',NULL,'',0,1490726067),(420,0,'profilefield_checkbox',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726067),(421,0,'profilefield_checkbox','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726067),(422,0,'profilefield_checkbox','2015111600','2015111600','Plugin installed',NULL,'',0,1490726067),(423,0,'profilefield_datetime',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726067),(424,0,'profilefield_datetime','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726067),(425,0,'profilefield_datetime','2015111600','2015111600','Plugin installed',NULL,'',0,1490726068),(426,0,'profilefield_menu',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726068),(427,0,'profilefield_menu','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726068),(428,0,'profilefield_menu','2015111600','2015111600','Plugin installed',NULL,'',0,1490726068),(429,0,'profilefield_text',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726068),(430,0,'profilefield_text','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726068),(431,0,'profilefield_text','2015111600','2015111600','Plugin installed',NULL,'',0,1490726068),(432,0,'profilefield_textarea',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726068),(433,0,'profilefield_textarea','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726068),(434,0,'profilefield_textarea','2015111600','2015111600','Plugin installed',NULL,'',0,1490726068),(435,0,'report_backups',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726068),(436,0,'report_backups','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726069),(437,0,'report_backups','2015111600','2015111600','Plugin installed',NULL,'',0,1490726069),(438,0,'report_completion',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726069),(439,0,'report_completion','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726069),(440,0,'report_completion','2015111600','2015111600','Plugin installed',NULL,'',0,1490726069),(441,0,'report_configlog',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726069),(442,0,'report_configlog','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726069),(443,0,'report_configlog','2015111600','2015111600','Plugin installed',NULL,'',0,1490726069),(444,0,'report_courseoverview',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726069),(445,0,'report_courseoverview','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726069),(446,0,'report_courseoverview','2015111600','2015111600','Plugin installed',NULL,'',0,1490726070),(447,0,'report_eventlist',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726070),(448,0,'report_eventlist','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726070),(449,0,'report_eventlist','2015111600','2015111600','Plugin installed',NULL,'',0,1490726070),(450,0,'report_log',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726070),(451,0,'report_log','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726070),(452,0,'report_log','2015111600','2015111600','Plugin installed',NULL,'',0,1490726070),(453,0,'report_loglive',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726071),(454,0,'report_loglive','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726071),(455,0,'report_loglive','2015111600','2015111600','Plugin installed',NULL,'',0,1490726071),(456,0,'report_outline',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726071),(457,0,'report_outline','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726071),(458,0,'report_outline','2015111600','2015111600','Plugin installed',NULL,'',0,1490726071),(459,0,'report_participation',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726072),(460,0,'report_participation','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726072),(461,0,'report_participation','2015111600','2015111600','Plugin installed',NULL,'',0,1490726072),(462,0,'report_performance',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726072),(463,0,'report_performance','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726072),(464,0,'report_performance','2015111600','2015111600','Plugin installed',NULL,'',0,1490726072),(465,0,'report_progress',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726073),(466,0,'report_progress','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726073),(467,0,'report_progress','2015111600','2015111600','Plugin installed',NULL,'',0,1490726073),(468,0,'report_questioninstances',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726073),(469,0,'report_questioninstances','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726073),(470,0,'report_questioninstances','2015111600','2015111600','Plugin installed',NULL,'',0,1490726073),(471,0,'report_security',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726073),(472,0,'report_security','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726073),(473,0,'report_security','2015111600','2015111600','Plugin installed',NULL,'',0,1490726073),(474,0,'report_stats',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726073),(475,0,'report_stats','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726073),(476,0,'report_stats','2015111600','2015111600','Plugin installed',NULL,'',0,1490726074),(477,0,'report_usersessions',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726074),(478,0,'report_usersessions','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726074),(479,0,'report_usersessions','2015111600','2015111600','Plugin installed',NULL,'',0,1490726074),(480,0,'gradeexport_ods',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726074),(481,0,'gradeexport_ods','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726074),(482,0,'gradeexport_ods','2015111600','2015111600','Plugin installed',NULL,'',0,1490726074),(483,0,'gradeexport_txt',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726074),(484,0,'gradeexport_txt','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726074),(485,0,'gradeexport_txt','2015111600','2015111600','Plugin installed',NULL,'',0,1490726075),(486,0,'gradeexport_xls',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726075),(487,0,'gradeexport_xls','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726075),(488,0,'gradeexport_xls','2015111600','2015111600','Plugin installed',NULL,'',0,1490726075),(489,0,'gradeexport_xml',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726075),(490,0,'gradeexport_xml','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726075),(491,0,'gradeexport_xml','2015111600','2015111600','Plugin installed',NULL,'',0,1490726076),(492,0,'gradeimport_csv',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726076),(493,0,'gradeimport_csv','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726076),(494,0,'gradeimport_csv','2015111600','2015111600','Plugin installed',NULL,'',0,1490726076),(495,0,'gradeimport_direct',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726076),(496,0,'gradeimport_direct','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726076),(497,0,'gradeimport_direct','2015111600','2015111600','Plugin installed',NULL,'',0,1490726076),(498,0,'gradeimport_xml',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726077),(499,0,'gradeimport_xml','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726077),(500,0,'gradeimport_xml','2015111600','2015111600','Plugin installed',NULL,'',0,1490726077),(501,0,'gradereport_grader',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726077),(502,0,'gradereport_grader','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726077),(503,0,'gradereport_grader','2015111600','2015111600','Plugin installed',NULL,'',0,1490726077),(504,0,'gradereport_history',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726077),(505,0,'gradereport_history','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726077),(506,0,'gradereport_history','2015111600','2015111600','Plugin installed',NULL,'',0,1490726078),(507,0,'gradereport_outcomes',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726078),(508,0,'gradereport_outcomes','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726078),(509,0,'gradereport_outcomes','2015111600','2015111600','Plugin installed',NULL,'',0,1490726078),(510,0,'gradereport_overview',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726078),(511,0,'gradereport_overview','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726078),(512,0,'gradereport_overview','2015111600','2015111600','Plugin installed',NULL,'',0,1490726078),(513,0,'gradereport_singleview',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726078),(514,0,'gradereport_singleview','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726078),(515,0,'gradereport_singleview','2015111600','2015111600','Plugin installed',NULL,'',0,1490726079),(516,0,'gradereport_user',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726079),(517,0,'gradereport_user','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726079),(518,0,'gradereport_user','2015111600','2015111600','Plugin installed',NULL,'',0,1490726079),(519,0,'gradingform_guide',NULL,'2015111601','Starting plugin installation',NULL,'',0,1490726079),(520,0,'gradingform_guide','2015111601','2015111601','Upgrade savepoint reached',NULL,'',0,1490726079),(521,0,'gradingform_guide','2015111601','2015111601','Plugin installed',NULL,'',0,1490726080),(522,0,'gradingform_rubric',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726080),(523,0,'gradingform_rubric','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726080),(524,0,'gradingform_rubric','2015111600','2015111600','Plugin installed',NULL,'',0,1490726080),(525,0,'mnetservice_enrol',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726080),(526,0,'mnetservice_enrol','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726080),(527,0,'mnetservice_enrol','2015111600','2015111600','Plugin installed',NULL,'',0,1490726080),(528,0,'webservice_amf',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726080),(529,0,'webservice_amf','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726080),(530,0,'webservice_amf','2015111600','2015111600','Plugin installed',NULL,'',0,1490726081),(531,0,'webservice_rest',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726081),(532,0,'webservice_rest','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726081),(533,0,'webservice_rest','2015111600','2015111600','Plugin installed',NULL,'',0,1490726081),(534,0,'webservice_soap',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726081),(535,0,'webservice_soap','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726081),(536,0,'webservice_soap','2015111600','2015111600','Plugin installed',NULL,'',0,1490726081),(537,0,'webservice_xmlrpc',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726081),(538,0,'webservice_xmlrpc','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726081),(539,0,'webservice_xmlrpc','2015111600','2015111600','Plugin installed',NULL,'',0,1490726082),(540,0,'repository_alfresco',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726082),(541,0,'repository_alfresco','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726082),(542,0,'repository_alfresco','2015111600','2015111600','Plugin installed',NULL,'',0,1490726082),(543,0,'repository_areafiles',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726082),(544,0,'repository_areafiles','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726082),(545,0,'repository_areafiles','2015111600','2015111600','Plugin installed',NULL,'',0,1490726083),(546,0,'repository_boxnet',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726083),(547,0,'repository_boxnet','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726083),(548,0,'repository_boxnet','2015111600','2015111600','Plugin installed',NULL,'',0,1490726083),(549,0,'repository_coursefiles',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726083),(550,0,'repository_coursefiles','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726083),(551,0,'repository_coursefiles','2015111600','2015111600','Plugin installed',NULL,'',0,1490726083),(552,0,'repository_dropbox',NULL,'2015111601','Starting plugin installation',NULL,'',0,1490726083),(553,0,'repository_dropbox','2015111601','2015111601','Upgrade savepoint reached',NULL,'',0,1490726084),(554,0,'repository_dropbox','2015111601','2015111601','Plugin installed',NULL,'',0,1490726084),(555,0,'repository_equella',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726084),(556,0,'repository_equella','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726084),(557,0,'repository_equella','2015111600','2015111600','Plugin installed',NULL,'',0,1490726084),(558,0,'repository_filesystem',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726084),(559,0,'repository_filesystem','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726084),(560,0,'repository_filesystem','2015111600','2015111600','Plugin installed',NULL,'',0,1490726084),(561,0,'repository_flickr',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726084),(562,0,'repository_flickr','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726084),(563,0,'repository_flickr','2015111600','2015111600','Plugin installed',NULL,'',0,1490726085),(564,0,'repository_flickr_public',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726085),(565,0,'repository_flickr_public','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726085),(566,0,'repository_flickr_public','2015111600','2015111600','Plugin installed',NULL,'',0,1490726085),(567,0,'repository_googledocs',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726085),(568,0,'repository_googledocs','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726085),(569,0,'repository_googledocs','2015111600','2015111600','Plugin installed',NULL,'',0,1490726085),(570,0,'repository_local',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726085),(571,0,'repository_local','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726085),(572,0,'repository_local','2015111600','2015111600','Plugin installed',NULL,'',0,1490726086),(573,0,'repository_merlot',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726086),(574,0,'repository_merlot','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726086),(575,0,'repository_merlot','2015111600','2015111600','Plugin installed',NULL,'',0,1490726086),(576,0,'repository_picasa',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726086),(577,0,'repository_picasa','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726086),(578,0,'repository_picasa','2015111600','2015111600','Plugin installed',NULL,'',0,1490726086),(579,0,'repository_recent',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726086),(580,0,'repository_recent','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726086),(581,0,'repository_recent','2015111600','2015111600','Plugin installed',NULL,'',0,1490726087),(582,0,'repository_s3',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726087),(583,0,'repository_s3','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726087),(584,0,'repository_s3','2015111600','2015111600','Plugin installed',NULL,'',0,1490726087),(585,0,'repository_skydrive',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726087),(586,0,'repository_skydrive','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726087),(587,0,'repository_skydrive','2015111600','2015111600','Plugin installed',NULL,'',0,1490726087),(588,0,'repository_upload',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726087),(589,0,'repository_upload','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726088),(590,0,'repository_upload','2015111600','2015111600','Plugin installed',NULL,'',0,1490726088),(591,0,'repository_url',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726088),(592,0,'repository_url','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726088),(593,0,'repository_url','2015111600','2015111600','Plugin installed',NULL,'',0,1490726088),(594,0,'repository_user',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726088),(595,0,'repository_user','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726088),(596,0,'repository_user','2015111600','2015111600','Plugin installed',NULL,'',0,1490726089),(597,0,'repository_webdav',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726089),(598,0,'repository_webdav','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726089),(599,0,'repository_webdav','2015111600','2015111600','Plugin installed',NULL,'',0,1490726089),(600,0,'repository_wikimedia',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726089),(601,0,'repository_wikimedia','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726089),(602,0,'repository_wikimedia','2015111600','2015111600','Plugin installed',NULL,'',0,1490726090),(603,0,'repository_youtube',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726090),(604,0,'repository_youtube','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726090),(605,0,'repository_youtube','2015111600','2015111600','Plugin installed',NULL,'',0,1490726090),(606,0,'portfolio_boxnet',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726090),(607,0,'portfolio_boxnet','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726090),(608,0,'portfolio_boxnet','2015111600','2015111600','Plugin installed',NULL,'',0,1490726090),(609,0,'portfolio_download',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726090),(610,0,'portfolio_download','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726090),(611,0,'portfolio_download','2015111600','2015111600','Plugin installed',NULL,'',0,1490726091),(612,0,'portfolio_flickr',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726091),(613,0,'portfolio_flickr','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726091),(614,0,'portfolio_flickr','2015111600','2015111600','Plugin installed',NULL,'',0,1490726091),(615,0,'portfolio_googledocs',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726091),(616,0,'portfolio_googledocs','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726091),(617,0,'portfolio_googledocs','2015111600','2015111600','Plugin installed',NULL,'',0,1490726091),(618,0,'portfolio_mahara',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726091),(619,0,'portfolio_mahara','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726091),(620,0,'portfolio_mahara','2015111600','2015111600','Plugin installed',NULL,'',0,1490726091),(621,0,'portfolio_picasa',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726092),(622,0,'portfolio_picasa','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726092),(623,0,'portfolio_picasa','2015111600','2015111600','Plugin installed',NULL,'',0,1490726092),(624,0,'qbehaviour_adaptive',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726092),(625,0,'qbehaviour_adaptive','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726092),(626,0,'qbehaviour_adaptive','2015111600','2015111600','Plugin installed',NULL,'',0,1490726092),(627,0,'qbehaviour_adaptivenopenalty',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726092),(628,0,'qbehaviour_adaptivenopenalty','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726092),(629,0,'qbehaviour_adaptivenopenalty','2015111600','2015111600','Plugin installed',NULL,'',0,1490726092),(630,0,'qbehaviour_deferredcbm',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726093),(631,0,'qbehaviour_deferredcbm','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726093),(632,0,'qbehaviour_deferredcbm','2015111600','2015111600','Plugin installed',NULL,'',0,1490726093),(633,0,'qbehaviour_deferredfeedback',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726093),(634,0,'qbehaviour_deferredfeedback','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726093),(635,0,'qbehaviour_deferredfeedback','2015111600','2015111600','Plugin installed',NULL,'',0,1490726093),(636,0,'qbehaviour_immediatecbm',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726093),(637,0,'qbehaviour_immediatecbm','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726093),(638,0,'qbehaviour_immediatecbm','2015111600','2015111600','Plugin installed',NULL,'',0,1490726093),(639,0,'qbehaviour_immediatefeedback',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726093),(640,0,'qbehaviour_immediatefeedback','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726093),(641,0,'qbehaviour_immediatefeedback','2015111600','2015111600','Plugin installed',NULL,'',0,1490726093),(642,0,'qbehaviour_informationitem',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726093),(643,0,'qbehaviour_informationitem','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726094),(644,0,'qbehaviour_informationitem','2015111600','2015111600','Plugin installed',NULL,'',0,1490726094),(645,0,'qbehaviour_interactive',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726094),(646,0,'qbehaviour_interactive','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726094),(647,0,'qbehaviour_interactive','2015111600','2015111600','Plugin installed',NULL,'',0,1490726094),(648,0,'qbehaviour_interactivecountback',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726094),(649,0,'qbehaviour_interactivecountback','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726094),(650,0,'qbehaviour_interactivecountback','2015111600','2015111600','Plugin installed',NULL,'',0,1490726094),(651,0,'qbehaviour_manualgraded',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726094),(652,0,'qbehaviour_manualgraded','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726094),(653,0,'qbehaviour_manualgraded','2015111600','2015111600','Plugin installed',NULL,'',0,1490726094),(654,0,'qbehaviour_missing',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726094),(655,0,'qbehaviour_missing','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726094),(656,0,'qbehaviour_missing','2015111600','2015111600','Plugin installed',NULL,'',0,1490726094),(657,0,'qformat_aiken',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726095),(658,0,'qformat_aiken','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726095),(659,0,'qformat_aiken','2015111600','2015111600','Plugin installed',NULL,'',0,1490726095),(660,0,'qformat_blackboard_six',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726095),(661,0,'qformat_blackboard_six','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726095),(662,0,'qformat_blackboard_six','2015111600','2015111600','Plugin installed',NULL,'',0,1490726095),(663,0,'qformat_examview',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726095),(664,0,'qformat_examview','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726095),(665,0,'qformat_examview','2015111600','2015111600','Plugin installed',NULL,'',0,1490726095),(666,0,'qformat_gift',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726095),(667,0,'qformat_gift','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726095),(668,0,'qformat_gift','2015111600','2015111600','Plugin installed',NULL,'',0,1490726095),(669,0,'qformat_missingword',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726095),(670,0,'qformat_missingword','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726095),(671,0,'qformat_missingword','2015111600','2015111600','Plugin installed',NULL,'',0,1490726095),(672,0,'qformat_multianswer',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726096),(673,0,'qformat_multianswer','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726096),(674,0,'qformat_multianswer','2015111600','2015111600','Plugin installed',NULL,'',0,1490726096),(675,0,'qformat_webct',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726096),(676,0,'qformat_webct','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726096),(677,0,'qformat_webct','2015111600','2015111600','Plugin installed',NULL,'',0,1490726096),(678,0,'qformat_xhtml',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726096),(679,0,'qformat_xhtml','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726096),(680,0,'qformat_xhtml','2015111600','2015111600','Plugin installed',NULL,'',0,1490726096),(681,0,'qformat_xml',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726096),(682,0,'qformat_xml','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726096),(683,0,'qformat_xml','2015111600','2015111600','Plugin installed',NULL,'',0,1490726096),(684,0,'tool_assignmentupgrade',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726096),(685,0,'tool_assignmentupgrade','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726096),(686,0,'tool_assignmentupgrade','2015111600','2015111600','Plugin installed',NULL,'',0,1490726096),(687,0,'tool_availabilityconditions',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726096),(688,0,'tool_availabilityconditions','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726097),(689,0,'tool_availabilityconditions','2015111600','2015111600','Plugin installed',NULL,'',0,1490726097),(690,0,'tool_behat',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726097),(691,0,'tool_behat','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726097),(692,0,'tool_behat','2015111600','2015111600','Plugin installed',NULL,'',0,1490726097),(693,0,'tool_capability',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726097),(694,0,'tool_capability','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726097),(695,0,'tool_capability','2015111600','2015111600','Plugin installed',NULL,'',0,1490726097),(696,0,'tool_customlang',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726097),(697,0,'tool_customlang','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726097),(698,0,'tool_customlang','2015111600','2015111600','Plugin installed',NULL,'',0,1490726098),(699,0,'tool_dbtransfer',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726098),(700,0,'tool_dbtransfer','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726098),(701,0,'tool_dbtransfer','2015111600','2015111600','Plugin installed',NULL,'',0,1490726098),(702,0,'tool_filetypes',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726098),(703,0,'tool_filetypes','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726098),(704,0,'tool_filetypes','2015111600','2015111600','Plugin installed',NULL,'',0,1490726098),(705,0,'tool_generator',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726098),(706,0,'tool_generator','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726098),(707,0,'tool_generator','2015111600','2015111600','Plugin installed',NULL,'',0,1490726098),(708,0,'tool_health',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726098),(709,0,'tool_health','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726098),(710,0,'tool_health','2015111600','2015111600','Plugin installed',NULL,'',0,1490726098),(711,0,'tool_innodb',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726099),(712,0,'tool_innodb','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726099),(713,0,'tool_innodb','2015111600','2015111600','Plugin installed',NULL,'',0,1490726099),(714,0,'tool_installaddon',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726099),(715,0,'tool_installaddon','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726099),(716,0,'tool_installaddon','2015111600','2015111600','Plugin installed',NULL,'',0,1490726099),(717,0,'tool_langimport',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726099),(718,0,'tool_langimport','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726099),(719,0,'tool_langimport','2015111600','2015111600','Plugin installed',NULL,'',0,1490726099),(720,0,'tool_log',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726099),(721,0,'tool_log','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726099),(722,0,'tool_log','2015111600','2015111600','Plugin installed',NULL,'',0,1490726099),(723,0,'tool_messageinbound',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726099),(724,0,'tool_messageinbound','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726100),(725,0,'tool_messageinbound','2015111600','2015111600','Plugin installed',NULL,'',0,1490726100),(726,0,'tool_monitor',NULL,'2015111601','Starting plugin installation',NULL,'',0,1490726100),(727,0,'tool_monitor','2015111601','2015111601','Upgrade savepoint reached',NULL,'',0,1490726100),(728,0,'tool_monitor','2015111601','2015111601','Plugin installed',NULL,'',0,1490726101),(729,0,'tool_multilangupgrade',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726101),(730,0,'tool_multilangupgrade','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726101),(731,0,'tool_multilangupgrade','2015111600','2015111600','Plugin installed',NULL,'',0,1490726101),(732,0,'tool_phpunit',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726101),(733,0,'tool_phpunit','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726101),(734,0,'tool_phpunit','2015111600','2015111600','Plugin installed',NULL,'',0,1490726101),(735,0,'tool_profiling',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726101),(736,0,'tool_profiling','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726102),(737,0,'tool_profiling','2015111600','2015111600','Plugin installed',NULL,'',0,1490726102),(738,0,'tool_replace',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726102),(739,0,'tool_replace','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726102),(740,0,'tool_replace','2015111600','2015111600','Plugin installed',NULL,'',0,1490726102),(741,0,'tool_spamcleaner',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726102),(742,0,'tool_spamcleaner','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726102),(743,0,'tool_spamcleaner','2015111600','2015111600','Plugin installed',NULL,'',0,1490726102),(744,0,'tool_task',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726102),(745,0,'tool_task','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726102),(746,0,'tool_task','2015111600','2015111600','Plugin installed',NULL,'',0,1490726102),(747,0,'tool_templatelibrary',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726102),(748,0,'tool_templatelibrary','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726103),(749,0,'tool_templatelibrary','2015111600','2015111600','Plugin installed',NULL,'',0,1490726103),(750,0,'tool_unsuproles',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726103),(751,0,'tool_unsuproles','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726103),(752,0,'tool_unsuproles','2015111600','2015111600','Plugin installed',NULL,'',0,1490726103),(753,0,'tool_uploadcourse',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726103),(754,0,'tool_uploadcourse','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726103),(755,0,'tool_uploadcourse','2015111600','2015111600','Plugin installed',NULL,'',0,1490726104),(756,0,'tool_uploaduser',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726104),(757,0,'tool_uploaduser','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726104),(758,0,'tool_uploaduser','2015111600','2015111600','Plugin installed',NULL,'',0,1490726104),(759,0,'tool_xmldb',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726104),(760,0,'tool_xmldb','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726104),(761,0,'tool_xmldb','2015111600','2015111600','Plugin installed',NULL,'',0,1490726104),(762,0,'cachestore_file',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726104),(763,0,'cachestore_file','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726104),(764,0,'cachestore_file','2015111600','2015111600','Plugin installed',NULL,'',0,1490726104),(765,0,'cachestore_memcache',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726104),(766,0,'cachestore_memcache','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726104),(767,0,'cachestore_memcache','2015111600','2015111600','Plugin installed',NULL,'',0,1490726105),(768,0,'cachestore_memcached',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726105),(769,0,'cachestore_memcached','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726105),(770,0,'cachestore_memcached','2015111600','2015111600','Plugin installed',NULL,'',0,1490726105),(771,0,'cachestore_mongodb',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726105),(772,0,'cachestore_mongodb','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726105),(773,0,'cachestore_mongodb','2015111600','2015111600','Plugin installed',NULL,'',0,1490726105),(774,0,'cachestore_session',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726105),(775,0,'cachestore_session','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726105),(776,0,'cachestore_session','2015111600','2015111600','Plugin installed',NULL,'',0,1490726105),(777,0,'cachestore_static',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726105),(778,0,'cachestore_static','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726105),(779,0,'cachestore_static','2015111600','2015111600','Plugin installed',NULL,'',0,1490726105),(780,0,'cachelock_file',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726105),(781,0,'cachelock_file','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726105),(782,0,'cachelock_file','2015111600','2015111600','Plugin installed',NULL,'',0,1490726105),(783,0,'theme_base',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726106),(784,0,'theme_base','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726106),(785,0,'theme_base','2015111600','2015111600','Plugin installed',NULL,'',0,1490726106),(786,0,'theme_bootstrapbase',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726106),(787,0,'theme_bootstrapbase','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726106),(788,0,'theme_bootstrapbase','2015111600','2015111600','Plugin installed',NULL,'',0,1490726106),(789,0,'theme_canvas',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726106),(790,0,'theme_canvas','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726106),(791,0,'theme_canvas','2015111600','2015111600','Plugin installed',NULL,'',0,1490726106),(792,0,'theme_clean',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726106),(793,0,'theme_clean','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726106),(794,0,'theme_clean','2015111600','2015111600','Plugin installed',NULL,'',0,1490726106),(795,0,'theme_more',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726107),(796,0,'theme_more','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726107),(797,0,'theme_more','2015111600','2015111600','Plugin installed',NULL,'',0,1490726107),(798,0,'assignsubmission_comments',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726107),(799,0,'assignsubmission_comments','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726107),(800,0,'assignsubmission_comments','2015111600','2015111600','Plugin installed',NULL,'',0,1490726108),(801,0,'assignsubmission_file',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726108),(802,0,'assignsubmission_file','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726108),(803,0,'assignsubmission_file','2015111600','2015111600','Plugin installed',NULL,'',0,1490726108),(804,0,'assignsubmission_onlinetext',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726108),(805,0,'assignsubmission_onlinetext','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726108),(806,0,'assignsubmission_onlinetext','2015111600','2015111600','Plugin installed',NULL,'',0,1490726109),(807,0,'assignfeedback_comments',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726109),(808,0,'assignfeedback_comments','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726109),(809,0,'assignfeedback_comments','2015111600','2015111600','Plugin installed',NULL,'',0,1490726109),(810,0,'assignfeedback_editpdf',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726109),(811,0,'assignfeedback_editpdf','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726109),(812,0,'assignfeedback_editpdf','2015111600','2015111600','Plugin installed',NULL,'',0,1490726110),(813,0,'assignfeedback_file',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726110),(814,0,'assignfeedback_file','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726110),(815,0,'assignfeedback_file','2015111600','2015111600','Plugin installed',NULL,'',0,1490726110),(816,0,'assignfeedback_offline',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726110),(817,0,'assignfeedback_offline','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726111),(818,0,'assignfeedback_offline','2015111600','2015111600','Plugin installed',NULL,'',0,1490726111),(819,0,'assignment_offline',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726111),(820,0,'assignment_offline','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726111),(821,0,'assignment_offline','2015111600','2015111600','Plugin installed',NULL,'',0,1490726111),(822,0,'assignment_online',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726111),(823,0,'assignment_online','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726111),(824,0,'assignment_online','2015111600','2015111600','Plugin installed',NULL,'',0,1490726111),(825,0,'assignment_upload',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726111),(826,0,'assignment_upload','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726111),(827,0,'assignment_upload','2015111600','2015111600','Plugin installed',NULL,'',0,1490726111),(828,0,'assignment_uploadsingle',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726111),(829,0,'assignment_uploadsingle','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726111),(830,0,'assignment_uploadsingle','2015111600','2015111600','Plugin installed',NULL,'',0,1490726112),(831,0,'booktool_exportimscp',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726112),(832,0,'booktool_exportimscp','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726112),(833,0,'booktool_exportimscp','2015111600','2015111600','Plugin installed',NULL,'',0,1490726112),(834,0,'booktool_importhtml',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726112),(835,0,'booktool_importhtml','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726112),(836,0,'booktool_importhtml','2015111600','2015111600','Plugin installed',NULL,'',0,1490726113),(837,0,'booktool_print',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726113),(838,0,'booktool_print','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726113),(839,0,'booktool_print','2015111600','2015111600','Plugin installed',NULL,'',0,1490726113),(840,0,'datafield_checkbox',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726113),(841,0,'datafield_checkbox','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726113),(842,0,'datafield_checkbox','2015111600','2015111600','Plugin installed',NULL,'',0,1490726113),(843,0,'datafield_date',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726113),(844,0,'datafield_date','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726114),(845,0,'datafield_date','2015111600','2015111600','Plugin installed',NULL,'',0,1490726114),(846,0,'datafield_file',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726114),(847,0,'datafield_file','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726114),(848,0,'datafield_file','2015111600','2015111600','Plugin installed',NULL,'',0,1490726114),(849,0,'datafield_latlong',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726114),(850,0,'datafield_latlong','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726114),(851,0,'datafield_latlong','2015111600','2015111600','Plugin installed',NULL,'',0,1490726114),(852,0,'datafield_menu',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726114),(853,0,'datafield_menu','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726114),(854,0,'datafield_menu','2015111600','2015111600','Plugin installed',NULL,'',0,1490726114),(855,0,'datafield_multimenu',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726114),(856,0,'datafield_multimenu','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726114),(857,0,'datafield_multimenu','2015111600','2015111600','Plugin installed',NULL,'',0,1490726115),(858,0,'datafield_number',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726115),(859,0,'datafield_number','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726115),(860,0,'datafield_number','2015111600','2015111600','Plugin installed',NULL,'',0,1490726115),(861,0,'datafield_picture',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726115),(862,0,'datafield_picture','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726115),(863,0,'datafield_picture','2015111600','2015111600','Plugin installed',NULL,'',0,1490726115),(864,0,'datafield_radiobutton',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726115),(865,0,'datafield_radiobutton','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726115),(866,0,'datafield_radiobutton','2015111600','2015111600','Plugin installed',NULL,'',0,1490726115),(867,0,'datafield_text',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726115),(868,0,'datafield_text','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726115),(869,0,'datafield_text','2015111600','2015111600','Plugin installed',NULL,'',0,1490726115),(870,0,'datafield_textarea',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726116),(871,0,'datafield_textarea','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726116),(872,0,'datafield_textarea','2015111600','2015111600','Plugin installed',NULL,'',0,1490726116),(873,0,'datafield_url',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726116),(874,0,'datafield_url','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726116),(875,0,'datafield_url','2015111600','2015111600','Plugin installed',NULL,'',0,1490726116),(876,0,'datapreset_imagegallery',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726116),(877,0,'datapreset_imagegallery','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726116),(878,0,'datapreset_imagegallery','2015111600','2015111600','Plugin installed',NULL,'',0,1490726116),(879,0,'ltiservice_memberships',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726116),(880,0,'ltiservice_memberships','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726116),(881,0,'ltiservice_memberships','2015111600','2015111600','Plugin installed',NULL,'',0,1490726116),(882,0,'ltiservice_profile',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726116),(883,0,'ltiservice_profile','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726116),(884,0,'ltiservice_profile','2015111600','2015111600','Plugin installed',NULL,'',0,1490726117),(885,0,'ltiservice_toolproxy',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726117),(886,0,'ltiservice_toolproxy','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726117),(887,0,'ltiservice_toolproxy','2015111600','2015111600','Plugin installed',NULL,'',0,1490726117),(888,0,'ltiservice_toolsettings',NULL,'2015111601','Starting plugin installation',NULL,'',0,1490726117),(889,0,'ltiservice_toolsettings','2015111601','2015111601','Upgrade savepoint reached',NULL,'',0,1490726117),(890,0,'ltiservice_toolsettings','2015111601','2015111601','Plugin installed',NULL,'',0,1490726117),(891,0,'quiz_grading',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726117),(892,0,'quiz_grading','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726117),(893,0,'quiz_grading','2015111600','2015111600','Plugin installed',NULL,'',0,1490726117),(894,0,'quiz_overview',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726118),(895,0,'quiz_overview','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726118),(896,0,'quiz_overview','2015111600','2015111600','Plugin installed',NULL,'',0,1490726118),(897,0,'quiz_responses',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726118),(898,0,'quiz_responses','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726118),(899,0,'quiz_responses','2015111600','2015111600','Plugin installed',NULL,'',0,1490726118),(900,0,'quiz_statistics',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726118),(901,0,'quiz_statistics','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726118),(902,0,'quiz_statistics','2015111600','2015111600','Plugin installed',NULL,'',0,1490726119),(903,0,'quizaccess_delaybetweenattempts',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726119),(904,0,'quizaccess_delaybetweenattempts','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726119),(905,0,'quizaccess_delaybetweenattempts','2015111600','2015111600','Plugin installed',NULL,'',0,1490726119),(906,0,'quizaccess_ipaddress',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726119),(907,0,'quizaccess_ipaddress','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726119),(908,0,'quizaccess_ipaddress','2015111600','2015111600','Plugin installed',NULL,'',0,1490726120),(909,0,'quizaccess_numattempts',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726120),(910,0,'quizaccess_numattempts','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726120),(911,0,'quizaccess_numattempts','2015111600','2015111600','Plugin installed',NULL,'',0,1490726120),(912,0,'quizaccess_openclosedate',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726120),(913,0,'quizaccess_openclosedate','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726120),(914,0,'quizaccess_openclosedate','2015111600','2015111600','Plugin installed',NULL,'',0,1490726120),(915,0,'quizaccess_password',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726120),(916,0,'quizaccess_password','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726120),(917,0,'quizaccess_password','2015111600','2015111600','Plugin installed',NULL,'',0,1490726120),(918,0,'quizaccess_safebrowser',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726120),(919,0,'quizaccess_safebrowser','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726120),(920,0,'quizaccess_safebrowser','2015111600','2015111600','Plugin installed',NULL,'',0,1490726121),(921,0,'quizaccess_securewindow',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726121),(922,0,'quizaccess_securewindow','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726121),(923,0,'quizaccess_securewindow','2015111600','2015111600','Plugin installed',NULL,'',0,1490726121),(924,0,'quizaccess_timelimit',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726121),(925,0,'quizaccess_timelimit','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726121),(926,0,'quizaccess_timelimit','2015111600','2015111600','Plugin installed',NULL,'',0,1490726121),(927,0,'scormreport_basic',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726121),(928,0,'scormreport_basic','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726121),(929,0,'scormreport_basic','2015111600','2015111600','Plugin installed',NULL,'',0,1490726121),(930,0,'scormreport_graphs',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726121),(931,0,'scormreport_graphs','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726121),(932,0,'scormreport_graphs','2015111600','2015111600','Plugin installed',NULL,'',0,1490726121),(933,0,'scormreport_interactions',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726121),(934,0,'scormreport_interactions','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726121),(935,0,'scormreport_interactions','2015111600','2015111600','Plugin installed',NULL,'',0,1490726122),(936,0,'scormreport_objectives',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726122),(937,0,'scormreport_objectives','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726122),(938,0,'scormreport_objectives','2015111600','2015111600','Plugin installed',NULL,'',0,1490726122),(939,0,'workshopform_accumulative',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726122),(940,0,'workshopform_accumulative','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726122),(941,0,'workshopform_accumulative','2015111600','2015111600','Plugin installed',NULL,'',0,1490726122),(942,0,'workshopform_comments',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726122),(943,0,'workshopform_comments','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726122),(944,0,'workshopform_comments','2015111600','2015111600','Plugin installed',NULL,'',0,1490726122),(945,0,'workshopform_numerrors',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726122),(946,0,'workshopform_numerrors','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726123),(947,0,'workshopform_numerrors','2015111600','2015111600','Plugin installed',NULL,'',0,1490726123),(948,0,'workshopform_rubric',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726123),(949,0,'workshopform_rubric','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726123),(950,0,'workshopform_rubric','2015111600','2015111600','Plugin installed',NULL,'',0,1490726123),(951,0,'workshopallocation_manual',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726123),(952,0,'workshopallocation_manual','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726123),(953,0,'workshopallocation_manual','2015111600','2015111600','Plugin installed',NULL,'',0,1490726123),(954,0,'workshopallocation_random',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726123),(955,0,'workshopallocation_random','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726123),(956,0,'workshopallocation_random','2015111600','2015111600','Plugin installed',NULL,'',0,1490726124),(957,0,'workshopallocation_scheduled',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726124),(958,0,'workshopallocation_scheduled','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726124),(959,0,'workshopallocation_scheduled','2015111600','2015111600','Plugin installed',NULL,'',0,1490726124),(960,0,'workshopeval_best',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726124),(961,0,'workshopeval_best','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726124),(962,0,'workshopeval_best','2015111600','2015111600','Plugin installed',NULL,'',0,1490726124),(963,0,'atto_accessibilitychecker',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726125),(964,0,'atto_accessibilitychecker','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726125),(965,0,'atto_accessibilitychecker','2015111600','2015111600','Plugin installed',NULL,'',0,1490726125),(966,0,'atto_accessibilityhelper',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726125),(967,0,'atto_accessibilityhelper','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726125),(968,0,'atto_accessibilityhelper','2015111600','2015111600','Plugin installed',NULL,'',0,1490726125),(969,0,'atto_align',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726125),(970,0,'atto_align','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726125),(971,0,'atto_align','2015111600','2015111600','Plugin installed',NULL,'',0,1490726125),(972,0,'atto_backcolor',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726125),(973,0,'atto_backcolor','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726125),(974,0,'atto_backcolor','2015111600','2015111600','Plugin installed',NULL,'',0,1490726125),(975,0,'atto_bold',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726125),(976,0,'atto_bold','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726125),(977,0,'atto_bold','2015111600','2015111600','Plugin installed',NULL,'',0,1490726126),(978,0,'atto_charmap',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726126),(979,0,'atto_charmap','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726126),(980,0,'atto_charmap','2015111600','2015111600','Plugin installed',NULL,'',0,1490726126),(981,0,'atto_clear',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726126),(982,0,'atto_clear','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726126),(983,0,'atto_clear','2015111600','2015111600','Plugin installed',NULL,'',0,1490726126),(984,0,'atto_collapse',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726126),(985,0,'atto_collapse','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726126),(986,0,'atto_collapse','2015111600','2015111600','Plugin installed',NULL,'',0,1490726126),(987,0,'atto_emoticon',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726126),(988,0,'atto_emoticon','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726126),(989,0,'atto_emoticon','2015111600','2015111600','Plugin installed',NULL,'',0,1490726126),(990,0,'atto_equation',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726126),(991,0,'atto_equation','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726126),(992,0,'atto_equation','2015111600','2015111600','Plugin installed',NULL,'',0,1490726127),(993,0,'atto_fontcolor',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726127),(994,0,'atto_fontcolor','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726127),(995,0,'atto_fontcolor','2015111600','2015111600','Plugin installed',NULL,'',0,1490726127),(996,0,'atto_html',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726127),(997,0,'atto_html','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726127),(998,0,'atto_html','2015111600','2015111600','Plugin installed',NULL,'',0,1490726127),(999,0,'atto_image',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726127),(1000,0,'atto_image','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726127),(1001,0,'atto_image','2015111600','2015111600','Plugin installed',NULL,'',0,1490726127),(1002,0,'atto_indent',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726127),(1003,0,'atto_indent','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726127),(1004,0,'atto_indent','2015111600','2015111600','Plugin installed',NULL,'',0,1490726128),(1005,0,'atto_italic',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726128),(1006,0,'atto_italic','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726128),(1007,0,'atto_italic','2015111600','2015111600','Plugin installed',NULL,'',0,1490726128),(1008,0,'atto_link',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726128),(1009,0,'atto_link','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726128),(1010,0,'atto_link','2015111600','2015111600','Plugin installed',NULL,'',0,1490726128),(1011,0,'atto_managefiles',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726128),(1012,0,'atto_managefiles','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726128),(1013,0,'atto_managefiles','2015111600','2015111600','Plugin installed',NULL,'',0,1490726129),(1014,0,'atto_media',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726129),(1015,0,'atto_media','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726129),(1016,0,'atto_media','2015111600','2015111600','Plugin installed',NULL,'',0,1490726129),(1017,0,'atto_noautolink',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726129),(1018,0,'atto_noautolink','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726129),(1019,0,'atto_noautolink','2015111600','2015111600','Plugin installed',NULL,'',0,1490726129),(1020,0,'atto_orderedlist',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726129),(1021,0,'atto_orderedlist','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726129),(1022,0,'atto_orderedlist','2015111600','2015111600','Plugin installed',NULL,'',0,1490726129),(1023,0,'atto_rtl',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726129),(1024,0,'atto_rtl','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726129),(1025,0,'atto_rtl','2015111600','2015111600','Plugin installed',NULL,'',0,1490726129),(1026,0,'atto_strike',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726129),(1027,0,'atto_strike','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726129),(1028,0,'atto_strike','2015111600','2015111600','Plugin installed',NULL,'',0,1490726130),(1029,0,'atto_subscript',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726130),(1030,0,'atto_subscript','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726130),(1031,0,'atto_subscript','2015111600','2015111600','Plugin installed',NULL,'',0,1490726130),(1032,0,'atto_superscript',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726130),(1033,0,'atto_superscript','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726130),(1034,0,'atto_superscript','2015111600','2015111600','Plugin installed',NULL,'',0,1490726130),(1035,0,'atto_table',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726130),(1036,0,'atto_table','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726130),(1037,0,'atto_table','2015111600','2015111600','Plugin installed',NULL,'',0,1490726130),(1038,0,'atto_title',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726130),(1039,0,'atto_title','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726130),(1040,0,'atto_title','2015111600','2015111600','Plugin installed',NULL,'',0,1490726130),(1041,0,'atto_underline',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726130),(1042,0,'atto_underline','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726130),(1043,0,'atto_underline','2015111600','2015111600','Plugin installed',NULL,'',0,1490726131),(1044,0,'atto_undo',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726131),(1045,0,'atto_undo','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726131),(1046,0,'atto_undo','2015111600','2015111600','Plugin installed',NULL,'',0,1490726131),(1047,0,'atto_unorderedlist',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726131),(1048,0,'atto_unorderedlist','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726131),(1049,0,'atto_unorderedlist','2015111600','2015111600','Plugin installed',NULL,'',0,1490726131),(1050,0,'tinymce_ctrlhelp',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726131),(1051,0,'tinymce_ctrlhelp','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726131),(1052,0,'tinymce_ctrlhelp','2015111600','2015111600','Plugin installed',NULL,'',0,1490726131),(1053,0,'tinymce_managefiles',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726131),(1054,0,'tinymce_managefiles','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726131),(1055,0,'tinymce_managefiles','2015111600','2015111600','Plugin installed',NULL,'',0,1490726131),(1056,0,'tinymce_moodleemoticon',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726131),(1057,0,'tinymce_moodleemoticon','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726132),(1058,0,'tinymce_moodleemoticon','2015111600','2015111600','Plugin installed',NULL,'',0,1490726132),(1059,0,'tinymce_moodleimage',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726132),(1060,0,'tinymce_moodleimage','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726132),(1061,0,'tinymce_moodleimage','2015111600','2015111600','Plugin installed',NULL,'',0,1490726132),(1062,0,'tinymce_moodlemedia',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726132),(1063,0,'tinymce_moodlemedia','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726132),(1064,0,'tinymce_moodlemedia','2015111600','2015111600','Plugin installed',NULL,'',0,1490726132),(1065,0,'tinymce_moodlenolink',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726132),(1066,0,'tinymce_moodlenolink','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726132),(1067,0,'tinymce_moodlenolink','2015111600','2015111600','Plugin installed',NULL,'',0,1490726132),(1068,0,'tinymce_pdw',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726132),(1069,0,'tinymce_pdw','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726132),(1070,0,'tinymce_pdw','2015111600','2015111600','Plugin installed',NULL,'',0,1490726132),(1071,0,'tinymce_spellchecker',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726133),(1072,0,'tinymce_spellchecker','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726133),(1073,0,'tinymce_spellchecker','2015111600','2015111600','Plugin installed',NULL,'',0,1490726133),(1074,0,'tinymce_wrap',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726133),(1075,0,'tinymce_wrap','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726133),(1076,0,'tinymce_wrap','2015111600','2015111600','Plugin installed',NULL,'',0,1490726133),(1077,0,'logstore_database',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726133),(1078,0,'logstore_database','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726133),(1079,0,'logstore_database','2015111600','2015111600','Plugin installed',NULL,'',0,1490726133),(1080,0,'logstore_legacy',NULL,'2015111600','Starting plugin installation',NULL,'',0,1490726133),(1081,0,'logstore_legacy','2015111600','2015111600','Upgrade savepoint reached',NULL,'',0,1490726133),(1082,0,'logstore_legacy','2015111600','2015111600','Plugin installed',NULL,'',0,1490726133),(1083,0,'logstore_standard',NULL,'2015111601','Starting plugin installation',NULL,'',0,1490726133),(1084,0,'logstore_standard','2015111601','2015111601','Upgrade savepoint reached',NULL,'',0,1490726134),(1085,0,'logstore_standard','2015111601','2015111601','Plugin installed',NULL,'',0,1490726134),(1086,0,'theme_adaptable',NULL,'2017012300','Starting plugin installation',NULL,'',2,1490792026),(1087,0,'theme_adaptable','2017012300','2017012300','Upgrade savepoint reached',NULL,'',2,1490792026),(1088,0,'theme_adaptable','2017012300','2017012300','Plugin installed',NULL,'',2,1490792026);
/*!40000 ALTER TABLE `mdl_upgrade_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_url`
--

DROP TABLE IF EXISTS `mdl_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_url` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `externalurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `parameters` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_url_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one url resource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_url`
--

LOCK TABLES `mdl_url` WRITE;
/*!40000 ALTER TABLE `mdl_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user`
--

DROP TABLE IF EXISTS `mdl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `auth` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `emailstop` tinyint(1) NOT NULL DEFAULT '0',
  `icq` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `skype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `yahoo` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aim` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `msn` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone1` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone2` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `institution` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `department` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `calendartype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'gregorian',
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timezone` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '99',
  `firstaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastlogin` bigint(10) NOT NULL DEFAULT '0',
  `currentlogin` bigint(10) NOT NULL DEFAULT '0',
  `lastip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `secret` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '1',
  `mailformat` tinyint(1) NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `autosubscribe` tinyint(1) NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `trustbitmask` bigint(10) NOT NULL DEFAULT '0',
  `imagealt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastnamephonetic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstnamephonetic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middlename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternatename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  KEY `mdl_user_del_ix` (`deleted`),
  KEY `mdl_user_con_ix` (`confirmed`),
  KEY `mdl_user_fir_ix` (`firstname`),
  KEY `mdl_user_las_ix` (`lastname`),
  KEY `mdl_user_cit_ix` (`city`),
  KEY `mdl_user_cou_ix` (`country`),
  KEY `mdl_user_las2_ix` (`lastaccess`),
  KEY `mdl_user_ema_ix` (`email`),
  KEY `mdl_user_aut_ix` (`auth`),
  KEY `mdl_user_idn_ix` (`idnumber`),
  KEY `mdl_user_fir2_ix` (`firstnamephonetic`),
  KEY `mdl_user_las3_ix` (`lastnamephonetic`),
  KEY `mdl_user_mid_ix` (`middlename`),
  KEY `mdl_user_alt_ix` (`alternatename`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='One record for each person';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user`
--

LOCK TABLES `mdl_user` WRITE;
/*!40000 ALTER TABLE `mdl_user` DISABLE KEYS */;
INSERT INTO `mdl_user` VALUES (1,'manual',1,0,0,0,1,'guest','$2y$10$9HjkMbuf477b.8.cpWgpl.MmHb2x8F8gdCvgmjSOBHk8BLVQMitUO','','Invitado',' ','root@localhost',0,'','','','','','','','','','','','','es_ve','gregorian','','99',0,0,0,0,'','',0,'','Este usuario sólo tiene acceso de lectura en ciertos cursos.',1,1,0,2,1,0,0,1490725894,0,NULL,NULL,NULL,NULL,NULL),(2,'manual',1,0,0,0,1,'ysanchez','$2y$10$MSdl5ngAV1YSo.N0nRSVxu151v0AekictpTv/aErwinl4J1CuDD4q','','admin','admin','ysrr27@hotmail.com',0,'','','','','','','','','','','caracas','VE','es_ve','gregorian','','99',1490726137,1490794615,1490726137,1490789856,'127.0.0.1','',0,'','',1,1,0,1,1,0,0,1490726198,0,NULL,'','','','');
/*!40000 ALTER TABLE `mdl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_devices`
--

DROP TABLE IF EXISTS `mdl_user_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_devices` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `appid` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `model` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `platform` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pushid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userdevi_pususe_uix` (`pushid`,`userid`),
  KEY `mdl_userdevi_uuiuse_ix` (`uuid`,`userid`),
  KEY `mdl_userdevi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores user''s mobile devices information in order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_devices`
--

LOCK TABLES `mdl_user_devices` WRITE;
/*!40000 ALTER TABLE `mdl_user_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_enrolments`
--

DROP TABLE IF EXISTS `mdl_user_enrolments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `enrolid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '2147483647',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`),
  KEY `mdl_userenro_enr_ix` (`enrolid`),
  KEY `mdl_userenro_use_ix` (`userid`),
  KEY `mdl_userenro_mod_ix` (`modifierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users participating in courses (aka enrolled users) - everyb';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_enrolments`
--

LOCK TABLES `mdl_user_enrolments` WRITE;
/*!40000 ALTER TABLE `mdl_user_enrolments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_enrolments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_info_category`
--

DROP TABLE IF EXISTS `mdl_user_info_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_info_category` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customisable fields categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_info_category`
--

LOCK TABLES `mdl_user_info_category` WRITE;
/*!40000 ALTER TABLE `mdl_user_info_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_info_data`
--

DROP TABLE IF EXISTS `mdl_user_info_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_info_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dataformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userinfodata_usefie_uix` (`userid`,`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Data for the customisable user fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_info_data`
--

LOCK TABLES `mdl_user_info_data` WRITE;
/*!40000 ALTER TABLE `mdl_user_info_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_info_field`
--

DROP TABLE IF EXISTS `mdl_user_info_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_info_field` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'shortname',
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `datatype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `required` tinyint(2) NOT NULL DEFAULT '0',
  `locked` tinyint(2) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '0',
  `forceunique` tinyint(2) NOT NULL DEFAULT '0',
  `signup` tinyint(2) NOT NULL DEFAULT '0',
  `defaultdata` longtext COLLATE utf8_unicode_ci,
  `defaultdataformat` tinyint(2) NOT NULL DEFAULT '0',
  `param1` longtext COLLATE utf8_unicode_ci,
  `param2` longtext COLLATE utf8_unicode_ci,
  `param3` longtext COLLATE utf8_unicode_ci,
  `param4` longtext COLLATE utf8_unicode_ci,
  `param5` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customisable user profile fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_info_field`
--

LOCK TABLES `mdl_user_info_field` WRITE;
/*!40000 ALTER TABLE `mdl_user_info_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_lastaccess`
--

DROP TABLE IF EXISTS `mdl_user_lastaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_lastaccess` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeaccess` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  KEY `mdl_userlast_use_ix` (`userid`),
  KEY `mdl_userlast_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To keep track of course page access times, used in online pa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_lastaccess`
--

LOCK TABLES `mdl_user_lastaccess` WRITE;
/*!40000 ALTER TABLE `mdl_user_lastaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_lastaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_password_history`
--

DROP TABLE IF EXISTS `mdl_user_password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_password_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userpasshist_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A rotating log of hashes of previously used passwords for ea';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_password_history`
--

LOCK TABLES `mdl_user_password_history` WRITE;
/*!40000 ALTER TABLE `mdl_user_password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_password_resets`
--

DROP TABLE IF EXISTS `mdl_user_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_password_resets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timerequested` bigint(10) NOT NULL,
  `timererequested` bigint(10) NOT NULL DEFAULT '0',
  `token` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_userpassrese_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='table tracking password reset confirmation tokens';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_password_resets`
--

LOCK TABLES `mdl_user_password_resets` WRITE;
/*!40000 ALTER TABLE `mdl_user_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_preferences`
--

DROP TABLE IF EXISTS `mdl_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_preferences` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(1333) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Allows modules to store arbitrary user preferences';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_preferences`
--

LOCK TABLES `mdl_user_preferences` WRITE;
/*!40000 ALTER TABLE `mdl_user_preferences` DISABLE KEYS */;
INSERT INTO `mdl_user_preferences` VALUES (1,2,'auth_manual_passwordupdatetime','1490726198'),(2,2,'email_bounce_count','1'),(3,2,'email_send_count','1'),(4,2,'admin_bookmarks','themeselector'),(5,2,'filepicker_recentrepository','4'),(6,2,'filepicker_recentlicense','allrightsreserved'),(7,2,'theme_adaptable_full','fullin');
/*!40000 ALTER TABLE `mdl_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_private_key`
--

DROP TABLE IF EXISTS `mdl_user_private_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_private_key` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `script` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT NULL,
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  KEY `mdl_userprivkey_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='access keys used in cookieless scripts - rss, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_private_key`
--

LOCK TABLES `mdl_user_private_key` WRITE;
/*!40000 ALTER TABLE `mdl_user_private_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_private_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki`
--

DROP TABLE IF EXISTS `mdl_wiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Wiki',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) NOT NULL DEFAULT '1',
  `editbegin` bigint(10) NOT NULL DEFAULT '0',
  `editend` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wiki_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores Wiki activity configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki`
--

LOCK TABLES `mdl_wiki` WRITE;
/*!40000 ALTER TABLE `mdl_wiki` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_links`
--

DROP TABLE IF EXISTS `mdl_wiki_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_links` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `frompageid` bigint(10) NOT NULL DEFAULT '0',
  `topageid` bigint(10) NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_wikilink_fro_ix` (`frompageid`),
  KEY `mdl_wikilink_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Page wiki links';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_links`
--

LOCK TABLES `mdl_wiki_links` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_locks`
--

DROP TABLE IF EXISTS `mdl_wiki_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `sectionname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `lockedat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Manages page locks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_locks`
--

LOCK TABLES `mdl_wiki_locks` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_pages`
--

DROP TABLE IF EXISTS `mdl_wiki_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'title',
  `cachedcontent` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timerendered` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageviews` bigint(10) NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  KEY `mdl_wikipage_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_pages`
--

LOCK TABLES `mdl_wiki_pages` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_subwikis`
--

DROP TABLE IF EXISTS `mdl_wiki_subwikis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_subwikis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `wikiid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  KEY `mdl_wikisubw_wik_ix` (`wikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores subwiki instances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_subwikis`
--

LOCK TABLES `mdl_wiki_subwikis` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_subwikis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_subwikis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_synonyms`
--

DROP TABLE IF EXISTS `mdl_wiki_synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_synonyms` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pagesynonym',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki pages synonyms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_synonyms`
--

LOCK TABLES `mdl_wiki_synonyms` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_synonyms` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_versions`
--

DROP TABLE IF EXISTS `mdl_wiki_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_versions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentformat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'creole',
  `version` mediumint(5) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wikivers_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki page history';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_versions`
--

LOCK TABLES `mdl_wiki_versions` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop`
--

DROP TABLE IF EXISTS `mdl_workshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(3) NOT NULL DEFAULT '0',
  `instructauthors` longtext COLLATE utf8_unicode_ci,
  `instructauthorsformat` smallint(3) NOT NULL DEFAULT '0',
  `instructreviewers` longtext COLLATE utf8_unicode_ci,
  `instructreviewersformat` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL,
  `phase` smallint(3) DEFAULT '0',
  `useexamples` tinyint(2) DEFAULT '0',
  `usepeerassessment` tinyint(2) DEFAULT '0',
  `useselfassessment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) DEFAULT '20.00000',
  `strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `evaluation` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gradedecimals` smallint(3) DEFAULT '0',
  `nattachments` smallint(3) DEFAULT '0',
  `latesubmissions` tinyint(2) DEFAULT '0',
  `maxbytes` bigint(10) DEFAULT '100000',
  `examplesmode` smallint(3) DEFAULT '0',
  `submissionstart` bigint(10) DEFAULT '0',
  `submissionend` bigint(10) DEFAULT '0',
  `assessmentstart` bigint(10) DEFAULT '0',
  `assessmentend` bigint(10) DEFAULT '0',
  `phaseswitchassessment` tinyint(2) NOT NULL DEFAULT '0',
  `conclusion` longtext COLLATE utf8_unicode_ci,
  `conclusionformat` smallint(3) NOT NULL DEFAULT '1',
  `overallfeedbackmode` smallint(3) DEFAULT '1',
  `overallfeedbackfiles` smallint(3) DEFAULT '0',
  `overallfeedbackmaxbytes` bigint(10) DEFAULT '100000',
  PRIMARY KEY (`id`),
  KEY `mdl_work_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about the module instances and ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop`
--

LOCK TABLES `mdl_workshop` WRITE;
/*!40000 ALTER TABLE `mdl_workshop` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_aggregations`
--

DROP TABLE IF EXISTS `mdl_workshop_aggregations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_aggregations` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `timegraded` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`),
  KEY `mdl_workaggr_wor_ix` (`workshopid`),
  KEY `mdl_workaggr_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Aggregated grades for assessment are stored here. The aggreg';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_aggregations`
--

LOCK TABLES `mdl_workshop_aggregations` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_aggregations` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_aggregations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_assessments`
--

DROP TABLE IF EXISTS `mdl_workshop_assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_assessments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) NOT NULL,
  `reviewerid` bigint(10) NOT NULL,
  `weight` bigint(10) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `gradinggradeover` decimal(10,5) DEFAULT NULL,
  `gradinggradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext COLLATE utf8_unicode_ci,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `feedbackauthorattachment` smallint(3) DEFAULT '0',
  `feedbackreviewer` longtext COLLATE utf8_unicode_ci,
  `feedbackreviewerformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workasse_sub_ix` (`submissionid`),
  KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`),
  KEY `mdl_workasse_rev_ix` (`reviewerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about the made assessment and automatically calculated ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_assessments`
--

LOCK TABLES `mdl_workshop_assessments` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_assessments_old`
--

DROP TABLE IF EXISTS `mdl_workshop_assessments_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_assessments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `submissionid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timegraded` bigint(10) NOT NULL DEFAULT '0',
  `timeagreed` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `teachergraded` smallint(3) NOT NULL DEFAULT '0',
  `mailed` smallint(3) NOT NULL DEFAULT '0',
  `resubmission` smallint(3) NOT NULL DEFAULT '0',
  `donotuse` smallint(3) NOT NULL DEFAULT '0',
  `generalcomment` longtext COLLATE utf8_unicode_ci,
  `teachercomment` longtext COLLATE utf8_unicode_ci,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workasseold_use_ix` (`userid`),
  KEY `mdl_workasseold_mai_ix` (`mailed`),
  KEY `mdl_workasseold_wor_ix` (`workshopid`),
  KEY `mdl_workasseold_sub_ix` (`submissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_assessments table to be dropped later in Moo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_assessments_old`
--

LOCK TABLES `mdl_workshop_assessments_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_assessments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_assessments_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_comments_old`
--

DROP TABLE IF EXISTS `mdl_workshop_comments_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_comments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `comments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workcommold_use_ix` (`userid`),
  KEY `mdl_workcommold_mai_ix` (`mailed`),
  KEY `mdl_workcommold_wor_ix` (`workshopid`),
  KEY `mdl_workcommold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_comments table to be dropped later in Moodle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_comments_old`
--

LOCK TABLES `mdl_workshop_comments_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_comments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_comments_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_elements_old`
--

DROP TABLE IF EXISTS `mdl_workshop_elements_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_elements_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scale` smallint(3) NOT NULL DEFAULT '0',
  `maxscore` smallint(3) NOT NULL DEFAULT '1',
  `weight` smallint(3) NOT NULL DEFAULT '11',
  `stddev` double NOT NULL DEFAULT '0',
  `totalassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workelemold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_elements table to be dropped later in Moodle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_elements_old`
--

LOCK TABLES `mdl_workshop_elements_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_elements_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_elements_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_grades`
--

DROP TABLE IF EXISTS `mdl_workshop_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assessmentid` bigint(10) NOT NULL,
  `strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `peercomment` longtext COLLATE utf8_unicode_ci,
  `peercommentformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  KEY `mdl_workgrad_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='How the reviewers filled-up the grading forms, given grades ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_grades`
--

LOCK TABLES `mdl_workshop_grades` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_grades_old`
--

DROP TABLE IF EXISTS `mdl_workshop_grades_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_grades_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workgradold_wor_ix` (`workshopid`),
  KEY `mdl_workgradold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_grades table to be dropped later in Moodle 2';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_grades_old`
--

LOCK TABLES `mdl_workshop_grades_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_grades_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_grades_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_old`
--

DROP TABLE IF EXISTS `mdl_workshop_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `wtype` smallint(3) NOT NULL DEFAULT '0',
  `nelements` smallint(3) NOT NULL DEFAULT '1',
  `nattachments` smallint(3) NOT NULL DEFAULT '0',
  `phase` tinyint(2) NOT NULL DEFAULT '0',
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `gradingstrategy` tinyint(2) NOT NULL DEFAULT '1',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `agreeassessments` tinyint(2) NOT NULL DEFAULT '0',
  `hidegrades` tinyint(2) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  `includeself` tinyint(2) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `submissionstart` bigint(10) NOT NULL DEFAULT '0',
  `assessmentstart` bigint(10) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL DEFAULT '0',
  `assessmentend` bigint(10) NOT NULL DEFAULT '0',
  `releasegrades` bigint(10) NOT NULL DEFAULT '0',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `ntassessments` smallint(3) NOT NULL DEFAULT '0',
  `assessmentcomps` smallint(3) NOT NULL DEFAULT '2',
  `nsassessments` smallint(3) NOT NULL DEFAULT '0',
  `overallocation` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherweight` smallint(3) NOT NULL DEFAULT '1',
  `showleaguetable` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop table to be dropped later in Moodle 2.x';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_old`
--

LOCK TABLES `mdl_workshop_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_rubrics_old`
--

DROP TABLE IF EXISTS `mdl_workshop_rubrics_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_rubrics_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `rubricno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_rubrics table to be dropped later in Moodle ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_rubrics_old`
--

LOCK TABLES `mdl_workshop_rubrics_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_rubrics_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_rubrics_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_stockcomments_old`
--

DROP TABLE IF EXISTS `mdl_workshop_stockcomments_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_stockcomments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `comments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workstocold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_stockcomments table to be dropped later in M';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_stockcomments_old`
--

LOCK TABLES `mdl_workshop_stockcomments_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_stockcomments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_stockcomments_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_submissions`
--

DROP TABLE IF EXISTS `mdl_workshop_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `example` tinyint(2) DEFAULT '0',
  `authorid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci,
  `contentformat` smallint(3) NOT NULL DEFAULT '0',
  `contenttrust` smallint(3) NOT NULL DEFAULT '0',
  `attachment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradeover` decimal(10,5) DEFAULT NULL,
  `gradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext COLLATE utf8_unicode_ci,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `timegraded` bigint(10) DEFAULT NULL,
  `published` tinyint(2) DEFAULT '0',
  `late` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_worksubm_wor_ix` (`workshopid`),
  KEY `mdl_worksubm_gra_ix` (`gradeoverby`),
  KEY `mdl_worksubm_aut_ix` (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about the submission and the aggregation of the grade f';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_submissions`
--

LOCK TABLES `mdl_workshop_submissions` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_submissions_old`
--

DROP TABLE IF EXISTS `mdl_workshop_submissions_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_submissions_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `finalgrade` smallint(3) NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `nassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_worksubmold_use_ix` (`userid`),
  KEY `mdl_worksubmold_mai_ix` (`mailed`),
  KEY `mdl_worksubmold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_submissions table to be dropped later in Moo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_submissions_old`
--

LOCK TABLES `mdl_workshop_submissions_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_submissions_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_submissions_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopallocation_scheduled`
--

DROP TABLE IF EXISTS `mdl_workshopallocation_scheduled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopallocation_scheduled` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `enabled` tinyint(2) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL,
  `timeallocated` bigint(10) DEFAULT NULL,
  `settings` longtext COLLATE utf8_unicode_ci,
  `resultstatus` bigint(10) DEFAULT NULL,
  `resultmessage` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resultlog` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worksche_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the allocation settings for the scheduled allocator';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopallocation_scheduled`
--

LOCK TABLES `mdl_workshopallocation_scheduled` WRITE;
/*!40000 ALTER TABLE `mdl_workshopallocation_scheduled` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopallocation_scheduled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopeval_best_settings`
--

DROP TABLE IF EXISTS `mdl_workshopeval_best_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopeval_best_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `comparison` smallint(3) DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Settings for the grading evaluation subplugin Comparison wit';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopeval_best_settings`
--

LOCK TABLES `mdl_workshopeval_best_settings` WRITE;
/*!40000 ALTER TABLE `mdl_workshopeval_best_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopeval_best_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_accumulative`
--

DROP TABLE IF EXISTS `mdl_workshopform_accumulative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_accumulative` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  `grade` bigint(10) NOT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_workaccu_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Accumulative gradin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_accumulative`
--

LOCK TABLES `mdl_workshopform_accumulative` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_accumulative` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_accumulative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_comments`
--

DROP TABLE IF EXISTS `mdl_workshopform_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workcomm_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Comments strategy f';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_comments`
--

LOCK TABLES `mdl_workshopform_comments` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_numerrors`
--

DROP TABLE IF EXISTS `mdl_workshopform_numerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_numerrors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  `descriptiontrust` bigint(10) DEFAULT NULL,
  `grade0` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_worknume_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Number of errors gr';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_numerrors`
--

LOCK TABLES `mdl_workshopform_numerrors` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_numerrors_map`
--

DROP TABLE IF EXISTS `mdl_workshopform_numerrors_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_numerrors_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `nonegative` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  KEY `mdl_worknumemap_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This maps the number of errors to a percentual grade for sub';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_numerrors_map`
--

LOCK TABLES `mdl_workshopform_numerrors_map` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_rubric`
--

DROP TABLE IF EXISTS `mdl_workshopform_rubric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_rubric` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubr_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Rubric grading stra';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_rubric`
--

LOCK TABLES `mdl_workshopform_rubric` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_rubric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_rubric_config`
--

DROP TABLE IF EXISTS `mdl_workshopform_rubric_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_rubric_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `layout` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'list',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Configuration table for the Rubric grading strategy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_rubric_config`
--

LOCK TABLES `mdl_workshopform_rubric_config` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_rubric_levels`
--

DROP TABLE IF EXISTS `mdl_workshopform_rubric_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `definition` longtext COLLATE utf8_unicode_ci,
  `definitionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrleve_dim_ix` (`dimensionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The definition of rubric rating scales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_rubric_levels`
--

LOCK TABLES `mdl_workshopform_rubric_levels` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_levels` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-29 10:13:03
