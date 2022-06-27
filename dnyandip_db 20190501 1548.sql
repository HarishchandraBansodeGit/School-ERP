-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.20


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema dnyandip_db
--

CREATE DATABASE IF NOT EXISTS dnyandip_db;
USE dnyandip_db;

--
-- Definition of table `academicyearmodel`
--

DROP TABLE IF EXISTS `academicyearmodel`;
CREATE TABLE `academicyearmodel` (
  `academicYearId` int(11) NOT NULL AUTO_INCREMENT,
  `academicYearName` varchar(255) DEFAULT NULL,
  `academicstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`academicYearId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `academicyearmodel`
--

/*!40000 ALTER TABLE `academicyearmodel` DISABLE KEYS */;
INSERT INTO `academicyearmodel` (`academicYearId`,`academicYearName`,`academicstatus`) VALUES 
 (1,'2001-2002','On'),
 (2,'2002-2003','On');
/*!40000 ALTER TABLE `academicyearmodel` ENABLE KEYS */;


--
-- Definition of table `adminmodel`
--

DROP TABLE IF EXISTS `adminmodel`;
CREATE TABLE `adminmodel` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `adminPassword` varchar(255) DEFAULT NULL,
  `adminUsername` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminmodel`
--

/*!40000 ALTER TABLE `adminmodel` DISABLE KEYS */;
INSERT INTO `adminmodel` (`adminId`,`adminPassword`,`adminUsername`) VALUES 
 (1,'admin','admin');
/*!40000 ALTER TABLE `adminmodel` ENABLE KEYS */;


--
-- Definition of table `assignclassteachermodel`
--

DROP TABLE IF EXISTS `assignclassteachermodel`;
CREATE TABLE `assignclassteachermodel` (
  `assignClassTeacherId` int(11) NOT NULL AUTO_INCREMENT,
  `teacherNameOfClass` varchar(255) DEFAULT NULL,
  `academicYear_FK` int(11) DEFAULT NULL,
  `standard_FK` int(11) DEFAULT NULL,
  `teacherId_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`assignClassTeacherId`),
  KEY `FK16B698B0F215B7BF` (`teacherId_FK`),
  KEY `FK16B698B0CEB6F8EE` (`standard_FK`),
  KEY `FK16B698B05C7BA840` (`academicYear_FK`),
  CONSTRAINT `FK16B698B05C7BA840` FOREIGN KEY (`academicYear_FK`) REFERENCES `academicyearmodel` (`academicYearId`),
  CONSTRAINT `FK16B698B0CEB6F8EE` FOREIGN KEY (`standard_FK`) REFERENCES `standardmodel` (`standardId`),
  CONSTRAINT `FK16B698B0F215B7BF` FOREIGN KEY (`teacherId_FK`) REFERENCES `teachermodel` (`teacherId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignclassteachermodel`
--

/*!40000 ALTER TABLE `assignclassteachermodel` DISABLE KEYS */;
INSERT INTO `assignclassteachermodel` (`assignClassTeacherId`,`teacherNameOfClass`,`academicYear_FK`,`standard_FK`,`teacherId_FK`) VALUES 
 (1,NULL,1,2,1),
 (2,NULL,1,2,1);
/*!40000 ALTER TABLE `assignclassteachermodel` ENABLE KEYS */;


--
-- Definition of table `assigndivisionmodel`
--

DROP TABLE IF EXISTS `assigndivisionmodel`;
CREATE TABLE `assigndivisionmodel` (
  `assignDivisionId` int(11) NOT NULL AUTO_INCREMENT,
  `assignStudentDivision` varchar(255) DEFAULT NULL,
  `academicYear_FK` int(11) DEFAULT NULL,
  `standard_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`assignDivisionId`),
  KEY `FKB7C9F1ADCEB6F8EE` (`standard_FK`),
  KEY `FKB7C9F1AD5C7BA840` (`academicYear_FK`),
  CONSTRAINT `FKB7C9F1AD5C7BA840` FOREIGN KEY (`academicYear_FK`) REFERENCES `academicyearmodel` (`academicYearId`),
  CONSTRAINT `FKB7C9F1ADCEB6F8EE` FOREIGN KEY (`standard_FK`) REFERENCES `standardmodel` (`standardId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assigndivisionmodel`
--

/*!40000 ALTER TABLE `assigndivisionmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `assigndivisionmodel` ENABLE KEYS */;


--
-- Definition of table `assignexamtostudentdummymodel`
--

DROP TABLE IF EXISTS `assignexamtostudentdummymodel`;
CREATE TABLE `assignexamtostudentdummymodel` (
  `assignExamToStudentId` int(11) NOT NULL AUTO_INCREMENT,
  `studentFullName` varchar(255) DEFAULT NULL,
  `academicYear_FK` int(11) DEFAULT NULL,
  `division_FK` int(11) DEFAULT NULL,
  `examName_FK` int(11) DEFAULT NULL,
  `examType_FK` int(11) DEFAULT NULL,
  `standard_FK` int(11) DEFAULT NULL,
  `studentRegId_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`assignExamToStudentId`),
  KEY `FK934486137ED908F4` (`examName_FK`),
  KEY `FK9344861363CC050E` (`division_FK`),
  KEY `FK93448613BAC68296` (`examType_FK`),
  KEY `FK93448613E9A49C96` (`studentRegId_FK`),
  KEY `FK93448613CEB6F8EE` (`standard_FK`),
  KEY `FK934486135C7BA840` (`academicYear_FK`),
  CONSTRAINT `FK934486135C7BA840` FOREIGN KEY (`academicYear_FK`) REFERENCES `academicyearmodel` (`academicYearId`),
  CONSTRAINT `FK9344861363CC050E` FOREIGN KEY (`division_FK`) REFERENCES `divisionmodel` (`divisionId`),
  CONSTRAINT `FK934486137ED908F4` FOREIGN KEY (`examName_FK`) REFERENCES `examnamemodel` (`examNameId`),
  CONSTRAINT `FK93448613BAC68296` FOREIGN KEY (`examType_FK`) REFERENCES `examtypemodel` (`examTypeId`),
  CONSTRAINT `FK93448613CEB6F8EE` FOREIGN KEY (`standard_FK`) REFERENCES `standardmodel` (`standardId`),
  CONSTRAINT `FK93448613E9A49C96` FOREIGN KEY (`studentRegId_FK`) REFERENCES `studentregistrationmodel` (`studentRegistrationId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignexamtostudentdummymodel`
--

/*!40000 ALTER TABLE `assignexamtostudentdummymodel` DISABLE KEYS */;
INSERT INTO `assignexamtostudentdummymodel` (`assignExamToStudentId`,`studentFullName`,`academicYear_FK`,`division_FK`,`examName_FK`,`examType_FK`,`standard_FK`,`studentRegId_FK`) VALUES 
 (1,'Payal subhash Tatiya',1,1,1,1,2,1);
/*!40000 ALTER TABLE `assignexamtostudentdummymodel` ENABLE KEYS */;


--
-- Definition of table `assignmarkstoexamtypemodel`
--

DROP TABLE IF EXISTS `assignmarkstoexamtypemodel`;
CREATE TABLE `assignmarkstoexamtypemodel` (
  `assignMarksToExamTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `examTypeMarks` int(11) NOT NULL,
  `academicYear_FK` int(11) DEFAULT NULL,
  `examName_FK` int(11) DEFAULT NULL,
  `examType_FK` int(11) DEFAULT NULL,
  `standard_FK` int(11) DEFAULT NULL,
  `subjectName_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`assignMarksToExamTypeId`),
  KEY `FK87407F7E7ED908F4` (`examName_FK`),
  KEY `FK87407F7EBAC68296` (`examType_FK`),
  KEY `FK87407F7ECEB6F8EE` (`standard_FK`),
  KEY `FK87407F7E5C7BA840` (`academicYear_FK`),
  KEY `FK87407F7ED4BC2D04` (`subjectName_FK`),
  CONSTRAINT `FK87407F7E5C7BA840` FOREIGN KEY (`academicYear_FK`) REFERENCES `academicyearmodel` (`academicYearId`),
  CONSTRAINT `FK87407F7E7ED908F4` FOREIGN KEY (`examName_FK`) REFERENCES `examnamemodel` (`examNameId`),
  CONSTRAINT `FK87407F7EBAC68296` FOREIGN KEY (`examType_FK`) REFERENCES `examtypemodel` (`examTypeId`),
  CONSTRAINT `FK87407F7ECEB6F8EE` FOREIGN KEY (`standard_FK`) REFERENCES `standardmodel` (`standardId`),
  CONSTRAINT `FK87407F7ED4BC2D04` FOREIGN KEY (`subjectName_FK`) REFERENCES `subjectnamemodel` (`subjectId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignmarkstoexamtypemodel`
--

/*!40000 ALTER TABLE `assignmarkstoexamtypemodel` DISABLE KEYS */;
INSERT INTO `assignmarkstoexamtypemodel` (`assignMarksToExamTypeId`,`examTypeMarks`,`academicYear_FK`,`examName_FK`,`examType_FK`,`standard_FK`,`subjectName_FK`) VALUES 
 (1,60,1,1,1,2,1),
 (2,40,1,1,2,2,1),
 (3,60,1,1,1,2,2),
 (4,40,1,1,2,2,2);
/*!40000 ALTER TABLE `assignmarkstoexamtypemodel` ENABLE KEYS */;


--
-- Definition of table `assignstudenttoscholarshipmodel`
--

DROP TABLE IF EXISTS `assignstudenttoscholarshipmodel`;
CREATE TABLE `assignstudenttoscholarshipmodel` (
  `studentScholarshipId` int(11) NOT NULL AUTO_INCREMENT,
  `maximumMarksId` varchar(255) DEFAULT NULL,
  `minimumMarksId` varchar(255) DEFAULT NULL,
  `academicYear_FK` int(11) DEFAULT NULL,
  `religion_FK` int(11) DEFAULT NULL,
  `standard_FK` int(11) DEFAULT NULL,
  `studentRegId_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`studentScholarshipId`),
  KEY `FK3DC0460EE9A49C96` (`studentRegId_FK`),
  KEY `FK3DC0460EB79F3344` (`religion_FK`),
  KEY `FK3DC0460ECEB6F8EE` (`standard_FK`),
  KEY `FK3DC0460E5C7BA840` (`academicYear_FK`),
  CONSTRAINT `FK3DC0460E5C7BA840` FOREIGN KEY (`academicYear_FK`) REFERENCES `academicyearmodel` (`academicYearId`),
  CONSTRAINT `FK3DC0460EB79F3344` FOREIGN KEY (`religion_FK`) REFERENCES `religionmastermodel` (`religionId`),
  CONSTRAINT `FK3DC0460ECEB6F8EE` FOREIGN KEY (`standard_FK`) REFERENCES `standardmodel` (`standardId`),
  CONSTRAINT `FK3DC0460EE9A49C96` FOREIGN KEY (`studentRegId_FK`) REFERENCES `studentregistrationmodel` (`studentRegistrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignstudenttoscholarshipmodel`
--

/*!40000 ALTER TABLE `assignstudenttoscholarshipmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignstudenttoscholarshipmodel` ENABLE KEYS */;


--
-- Definition of table `assignsubjectmodel`
--

DROP TABLE IF EXISTS `assignsubjectmodel`;
CREATE TABLE `assignsubjectmodel` (
  `assignSubjectID` int(11) NOT NULL AUTO_INCREMENT,
  `examDate` varchar(255) DEFAULT NULL,
  `examEndTime` varchar(255) DEFAULT NULL,
  `examStartTime` varchar(255) DEFAULT NULL,
  `subjectMark` double NOT NULL,
  `totalHours` varchar(255) DEFAULT NULL,
  `academicYear_FK` int(11) DEFAULT NULL,
  `examName_FK` int(11) DEFAULT NULL,
  `examType_FK` int(11) DEFAULT NULL,
  `standard_FK` int(11) DEFAULT NULL,
  `subject_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`assignSubjectID`),
  KEY `FK603BB40C7ED908F4` (`examName_FK`),
  KEY `FK603BB40C7138816F` (`subject_FK`),
  KEY `FK603BB40CBAC68296` (`examType_FK`),
  KEY `FK603BB40CCEB6F8EE` (`standard_FK`),
  KEY `FK603BB40C5C7BA840` (`academicYear_FK`),
  CONSTRAINT `FK603BB40C5C7BA840` FOREIGN KEY (`academicYear_FK`) REFERENCES `academicyearmodel` (`academicYearId`),
  CONSTRAINT `FK603BB40C7138816F` FOREIGN KEY (`subject_FK`) REFERENCES `subjectnamemodel` (`subjectId`),
  CONSTRAINT `FK603BB40C7ED908F4` FOREIGN KEY (`examName_FK`) REFERENCES `examnamemodel` (`examNameId`),
  CONSTRAINT `FK603BB40CBAC68296` FOREIGN KEY (`examType_FK`) REFERENCES `examtypemodel` (`examTypeId`),
  CONSTRAINT `FK603BB40CCEB6F8EE` FOREIGN KEY (`standard_FK`) REFERENCES `standardmodel` (`standardId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignsubjectmodel`
--

/*!40000 ALTER TABLE `assignsubjectmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignsubjectmodel` ENABLE KEYS */;


--
-- Definition of table `assignsubjecttostandardmodel`
--

DROP TABLE IF EXISTS `assignsubjecttostandardmodel`;
CREATE TABLE `assignsubjecttostandardmodel` (
  `AssignSubjectToStandardId` int(11) NOT NULL AUTO_INCREMENT,
  `subjectMarks` int(11) NOT NULL,
  `academicYear_FK` int(11) DEFAULT NULL,
  `examName_FK` int(11) DEFAULT NULL,
  `examType_FK` int(11) DEFAULT NULL,
  `standard_FK` int(11) DEFAULT NULL,
  `subjectName_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`AssignSubjectToStandardId`),
  KEY `FK82FC94D47ED908F4` (`examName_FK`),
  KEY `FK82FC94D4BAC68296` (`examType_FK`),
  KEY `FK82FC94D4CEB6F8EE` (`standard_FK`),
  KEY `FK82FC94D45C7BA840` (`academicYear_FK`),
  KEY `FK82FC94D4D4BC2D04` (`subjectName_FK`),
  CONSTRAINT `FK82FC94D45C7BA840` FOREIGN KEY (`academicYear_FK`) REFERENCES `academicyearmodel` (`academicYearId`),
  CONSTRAINT `FK82FC94D47ED908F4` FOREIGN KEY (`examName_FK`) REFERENCES `examnamemodel` (`examNameId`),
  CONSTRAINT `FK82FC94D4BAC68296` FOREIGN KEY (`examType_FK`) REFERENCES `examtypemodel` (`examTypeId`),
  CONSTRAINT `FK82FC94D4CEB6F8EE` FOREIGN KEY (`standard_FK`) REFERENCES `standardmodel` (`standardId`),
  CONSTRAINT `FK82FC94D4D4BC2D04` FOREIGN KEY (`subjectName_FK`) REFERENCES `subjectnamemodel` (`subjectId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignsubjecttostandardmodel`
--

/*!40000 ALTER TABLE `assignsubjecttostandardmodel` DISABLE KEYS */;
INSERT INTO `assignsubjecttostandardmodel` (`AssignSubjectToStandardId`,`subjectMarks`,`academicYear_FK`,`examName_FK`,`examType_FK`,`standard_FK`,`subjectName_FK`) VALUES 
 (1,100,1,1,1,2,1),
 (2,100,1,1,1,2,1),
 (3,100,1,1,1,2,1),
 (4,100,1,1,1,2,1);
/*!40000 ALTER TABLE `assignsubjecttostandardmodel` ENABLE KEYS */;


--
-- Definition of table `assignsubjecttoteachermodel`
--

DROP TABLE IF EXISTS `assignsubjecttoteachermodel`;
CREATE TABLE `assignsubjecttoteachermodel` (
  `assignSubjectToTeacherId` int(11) NOT NULL AUTO_INCREMENT,
  `subjectNameOfTeacher` varchar(255) DEFAULT NULL,
  `academicYear_FK` int(11) DEFAULT NULL,
  `division_FK` int(11) DEFAULT NULL,
  `standard_FK` int(11) DEFAULT NULL,
  `subjectId_FK` int(11) DEFAULT NULL,
  `teacherRegId_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`assignSubjectToTeacherId`),
  KEY `FK2BAE74FFDEB8B42F` (`teacherRegId_FK`),
  KEY `FK2BAE74FF63CC050E` (`division_FK`),
  KEY `FK2BAE74FF39F81574` (`subjectId_FK`),
  KEY `FK2BAE74FFCEB6F8EE` (`standard_FK`),
  KEY `FK2BAE74FF5C7BA840` (`academicYear_FK`),
  CONSTRAINT `FK2BAE74FF39F81574` FOREIGN KEY (`subjectId_FK`) REFERENCES `subjectnamemodel` (`subjectId`),
  CONSTRAINT `FK2BAE74FF5C7BA840` FOREIGN KEY (`academicYear_FK`) REFERENCES `academicyearmodel` (`academicYearId`),
  CONSTRAINT `FK2BAE74FF63CC050E` FOREIGN KEY (`division_FK`) REFERENCES `divisionmodel` (`divisionId`),
  CONSTRAINT `FK2BAE74FFCEB6F8EE` FOREIGN KEY (`standard_FK`) REFERENCES `standardmodel` (`standardId`),
  CONSTRAINT `FK2BAE74FFDEB8B42F` FOREIGN KEY (`teacherRegId_FK`) REFERENCES `teachermodel` (`teacherId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignsubjecttoteachermodel`
--

/*!40000 ALTER TABLE `assignsubjecttoteachermodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignsubjecttoteachermodel` ENABLE KEYS */;


--
-- Definition of table `attendancemodel`
--

DROP TABLE IF EXISTS `attendancemodel`;
CREATE TABLE `attendancemodel` (
  `attendanceId` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) DEFAULT NULL,
  `dayStatus` varchar(255) DEFAULT NULL,
  `presentyStatus` varchar(255) DEFAULT NULL,
  `studentRegId_FK` int(11) NOT NULL,
  `academicYear_FK` int(11) DEFAULT NULL,
  `division_FK` int(11) DEFAULT NULL,
  `standard_FK` int(11) DEFAULT NULL,
  `teacher_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`attendanceId`),
  KEY `FKA32249A063CC050E` (`division_FK`),
  KEY `FKA32249A0CEB6F8EE` (`standard_FK`),
  KEY `FKA32249A0AF215E3A` (`teacher_FK`),
  KEY `FKA32249A05C7BA840` (`academicYear_FK`),
  CONSTRAINT `FKA32249A05C7BA840` FOREIGN KEY (`academicYear_FK`) REFERENCES `academicyearmodel` (`academicYearId`),
  CONSTRAINT `FKA32249A063CC050E` FOREIGN KEY (`division_FK`) REFERENCES `divisionmodel` (`divisionId`),
  CONSTRAINT `FKA32249A0AF215E3A` FOREIGN KEY (`teacher_FK`) REFERENCES `teachermodel` (`teacherId`),
  CONSTRAINT `FKA32249A0CEB6F8EE` FOREIGN KEY (`standard_FK`) REFERENCES `standardmodel` (`standardId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendancemodel`
--

/*!40000 ALTER TABLE `attendancemodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendancemodel` ENABLE KEYS */;


--
-- Definition of table `castmastermodel`
--

DROP TABLE IF EXISTS `castmastermodel`;
CREATE TABLE `castmastermodel` (
  `castId` int(11) NOT NULL AUTO_INCREMENT,
  `castName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`castId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `castmastermodel`
--

/*!40000 ALTER TABLE `castmastermodel` DISABLE KEYS */;
INSERT INTO `castmastermodel` (`castId`,`castName`) VALUES 
 (1,'Hindu-Maratha');
/*!40000 ALTER TABLE `castmastermodel` ENABLE KEYS */;


--
-- Definition of table `categorymastermodel`
--

DROP TABLE IF EXISTS `categorymastermodel`;
CREATE TABLE `categorymastermodel` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorymastermodel`
--

/*!40000 ALTER TABLE `categorymastermodel` DISABLE KEYS */;
INSERT INTO `categorymastermodel` (`categoryId`,`categoryName`) VALUES 
 (1,'Open');
/*!40000 ALTER TABLE `categorymastermodel` ENABLE KEYS */;


--
-- Definition of table `clerkmodel`
--

DROP TABLE IF EXISTS `clerkmodel`;
CREATE TABLE `clerkmodel` (
  `clerkId` int(11) NOT NULL AUTO_INCREMENT,
  `UIDno` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `clerkFirstName` varchar(255) DEFAULT NULL,
  `clerkFullName` varchar(255) DEFAULT NULL,
  `clerkLastName` varchar(255) DEFAULT NULL,
  `clerkMiddleName` varchar(255) DEFAULT NULL,
  `contactNo` varchar(255) DEFAULT NULL,
  `dateofBirth` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `regDate` varchar(255) DEFAULT NULL,
  `taluka` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `village` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`clerkId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clerkmodel`
--

/*!40000 ALTER TABLE `clerkmodel` DISABLE KEYS */;
INSERT INTO `clerkmodel` (`clerkId`,`UIDno`,`address`,`clerkFirstName`,`clerkFullName`,`clerkLastName`,`clerkMiddleName`,`contactNo`,`dateofBirth`,`district`,`gender`,`nationality`,`password`,`pincode`,`regDate`,`taluka`,`username`,`village`) VALUES 
 (1,'983249032','Dist-Ahemdnagar,Tal-Newasa,Village-Chinchwad,Pincode-873489','Atish','Atish	 Mahesh	 Jadhav','Jadhav','Mahesh','8999385622','2019-04-17','Ahemdnagar','Male','Indian','clerk','873489','2019-04-24','Newasa','clerk','Chinchwad');
/*!40000 ALTER TABLE `clerkmodel` ENABLE KEYS */;


--
-- Definition of table `divisionmodel`
--

DROP TABLE IF EXISTS `divisionmodel`;
CREATE TABLE `divisionmodel` (
  `divisionId` int(11) NOT NULL AUTO_INCREMENT,
  `divisionName` varchar(255) DEFAULT NULL,
  `divisionstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`divisionId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `divisionmodel`
--

/*!40000 ALTER TABLE `divisionmodel` DISABLE KEYS */;
INSERT INTO `divisionmodel` (`divisionId`,`divisionName`,`divisionstatus`) VALUES 
 (1,'A','On'),
 (2,'B','On'),
 (3,'C','On');
/*!40000 ALTER TABLE `divisionmodel` ENABLE KEYS */;


--
-- Definition of table `examnamemodel`
--

DROP TABLE IF EXISTS `examnamemodel`;
CREATE TABLE `examnamemodel` (
  `examNameId` int(11) NOT NULL AUTO_INCREMENT,
  `examName` varchar(255) DEFAULT NULL,
  `examNamestatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`examNameId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `examnamemodel`
--

/*!40000 ALTER TABLE `examnamemodel` DISABLE KEYS */;
INSERT INTO `examnamemodel` (`examNameId`,`examName`,`examNamestatus`) VALUES 
 (1,'Sahamahi','On'),
 (2,'Varshik','On');
/*!40000 ALTER TABLE `examnamemodel` ENABLE KEYS */;


--
-- Definition of table `examtypemodel`
--

DROP TABLE IF EXISTS `examtypemodel`;
CREATE TABLE `examtypemodel` (
  `examTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `examTypeName` varchar(255) DEFAULT NULL,
  `examTypeNameStatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`examTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `examtypemodel`
--

/*!40000 ALTER TABLE `examtypemodel` DISABLE KEYS */;
INSERT INTO `examtypemodel` (`examTypeId`,`examTypeName`,`examTypeNameStatus`) VALUES 
 (1,'Theory','On'),
 (2,'Practical','On'),
 (3,'Oral','On'),
 (4,'Day to day observation','On');
/*!40000 ALTER TABLE `examtypemodel` ENABLE KEYS */;


--
-- Definition of table `generatestudentgrademodel`
--

DROP TABLE IF EXISTS `generatestudentgrademodel`;
CREATE TABLE `generatestudentgrademodel` (
  `generateGradeId` int(11) NOT NULL AUTO_INCREMENT,
  `studentMaxMarks` int(11) NOT NULL,
  `studentMinMarks` int(11) NOT NULL,
  `academicYear_FK` int(11) DEFAULT NULL,
  `studentGrade_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`generateGradeId`),
  KEY `FK2FE82D188E94BB10` (`studentGrade_FK`),
  KEY `FK2FE82D185C7BA840` (`academicYear_FK`),
  CONSTRAINT `FK2FE82D185C7BA840` FOREIGN KEY (`academicYear_FK`) REFERENCES `academicyearmodel` (`academicYearId`),
  CONSTRAINT `FK2FE82D188E94BB10` FOREIGN KEY (`studentGrade_FK`) REFERENCES `studentgrademodel` (`studentGradeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `generatestudentgrademodel`
--

/*!40000 ALTER TABLE `generatestudentgrademodel` DISABLE KEYS */;
INSERT INTO `generatestudentgrademodel` (`generateGradeId`,`studentMaxMarks`,`studentMinMarks`,`academicYear_FK`,`studentGrade_FK`) VALUES 
 (1,100,91,1,1),
 (2,90,81,1,2),
 (3,80,71,1,3),
 (4,70,61,1,4);
/*!40000 ALTER TABLE `generatestudentgrademodel` ENABLE KEYS */;


--
-- Definition of table `leavingcertificatemodel`
--

DROP TABLE IF EXISTS `leavingcertificatemodel`;
CREATE TABLE `leavingcertificatemodel` (
  `leavingcertificateId` int(11) NOT NULL AUTO_INCREMENT,
  `conduct` varchar(255) DEFAULT NULL,
  `dateofLeavingtheSchool` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `progress` varchar(255) DEFAULT NULL,
  `reasonOfLeavingSchool` varchar(255) DEFAULT NULL,
  `regDate` varchar(255) DEFAULT NULL,
  `StudentRegistrationId_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`leavingcertificateId`),
  KEY `FK17D5FD8633367F7B` (`StudentRegistrationId_FK`),
  CONSTRAINT `FK17D5FD8633367F7B` FOREIGN KEY (`StudentRegistrationId_FK`) REFERENCES `studentregistrationmodel` (`studentRegistrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leavingcertificatemodel`
--

/*!40000 ALTER TABLE `leavingcertificatemodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `leavingcertificatemodel` ENABLE KEYS */;


--
-- Definition of table `librarianmodel`
--

DROP TABLE IF EXISTS `librarianmodel`;
CREATE TABLE `librarianmodel` (
  `librarianId` int(11) NOT NULL AUTO_INCREMENT,
  `UIDno` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cast` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `contactNo` varchar(255) DEFAULT NULL,
  `dateofBirth` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `librarianFirstName` varchar(255) DEFAULT NULL,
  `librarianFullName` varchar(255) DEFAULT NULL,
  `librarianLastName` varchar(255) DEFAULT NULL,
  `librarianMiddleName` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `regDate` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `subCast` varchar(255) DEFAULT NULL,
  `taluka` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `village` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`librarianId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `librarianmodel`
--

/*!40000 ALTER TABLE `librarianmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `librarianmodel` ENABLE KEYS */;


--
-- Definition of table `principalmodel`
--

DROP TABLE IF EXISTS `principalmodel`;
CREATE TABLE `principalmodel` (
  `principalId` int(11) NOT NULL AUTO_INCREMENT,
  `UIDno` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contactNo` varchar(255) DEFAULT NULL,
  `dateofBirth` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `principalFirstName` varchar(255) DEFAULT NULL,
  `principalFullName` varchar(255) DEFAULT NULL,
  `principalLastName` varchar(255) DEFAULT NULL,
  `principalMiddleName` varchar(255) DEFAULT NULL,
  `principalPassword` varchar(255) DEFAULT NULL,
  `principalUsername` varchar(255) DEFAULT NULL,
  `regDate` varchar(255) DEFAULT NULL,
  `taluka` varchar(255) DEFAULT NULL,
  `village` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`principalId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `principalmodel`
--

/*!40000 ALTER TABLE `principalmodel` DISABLE KEYS */;
INSERT INTO `principalmodel` (`principalId`,`UIDno`,`address`,`contactNo`,`dateofBirth`,`district`,`gender`,`nationality`,`pincode`,`principalFirstName`,`principalFullName`,`principalLastName`,`principalMiddleName`,`principalPassword`,`principalUsername`,`regDate`,`taluka`,`village`) VALUES 
 (1,'983249032','Dist-Ahemdnagar,Tal-Shrigonda,Village-Ukkadgaon,Pincode-873489','8999385622','2019-04-22','Ahemdnagar','Male','Indian','873489','Atish','Atish	 Mahesh	 Jadhav','Jadhav','Mahesh','principal','principal','2019-04-21','Shrigonda','Ukkadgaon');
/*!40000 ALTER TABLE `principalmodel` ENABLE KEYS */;


--
-- Definition of table `religionmastermodel`
--

DROP TABLE IF EXISTS `religionmastermodel`;
CREATE TABLE `religionmastermodel` (
  `religionId` int(11) NOT NULL AUTO_INCREMENT,
  `religionName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`religionId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `religionmastermodel`
--

/*!40000 ALTER TABLE `religionmastermodel` DISABLE KEYS */;
INSERT INTO `religionmastermodel` (`religionId`,`religionName`) VALUES 
 (1,'Hindu');
/*!40000 ALTER TABLE `religionmastermodel` ENABLE KEYS */;


--
-- Definition of table `schooldetailsmodel`
--

DROP TABLE IF EXISTS `schooldetailsmodel`;
CREATE TABLE `schooldetailsmodel` (
  `schoolDetailsId` int(11) NOT NULL AUTO_INCREMENT,
  `district` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `regDate` varchar(255) DEFAULT NULL,
  `schoolContactNo` varchar(255) DEFAULT NULL,
  `schoolFullName` varchar(255) DEFAULT NULL,
  `schoolMedium` varchar(255) DEFAULT NULL,
  `schoolType` varchar(255) DEFAULT NULL,
  `stateName` varchar(255) DEFAULT NULL,
  `taluka` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `village` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`schoolDetailsId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schooldetailsmodel`
--

/*!40000 ALTER TABLE `schooldetailsmodel` DISABLE KEYS */;
INSERT INTO `schooldetailsmodel` (`schoolDetailsId`,`district`,`password`,`pincode`,`regDate`,`schoolContactNo`,`schoolFullName`,`schoolMedium`,`schoolType`,`stateName`,`taluka`,`userId`,`village`) VALUES 
 (1,'Ahemdnagar','12345','3762',NULL,'8999385622','Munjoba','Marathi','private','Maharashtra','Shrigonda','12345','Ukkadgaon');
/*!40000 ALTER TABLE `schooldetailsmodel` ENABLE KEYS */;


--
-- Definition of table `standardmodel`
--

DROP TABLE IF EXISTS `standardmodel`;
CREATE TABLE `standardmodel` (
  `standardId` int(11) NOT NULL AUTO_INCREMENT,
  `standardName` varchar(255) DEFAULT NULL,
  `standardNameStatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`standardId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `standardmodel`
--

/*!40000 ALTER TABLE `standardmodel` DISABLE KEYS */;
INSERT INTO `standardmodel` (`standardId`,`standardName`,`standardNameStatus`) VALUES 
 (1,'0th','On'),
 (2,'1st','On'),
 (3,'2nd','On');
/*!40000 ALTER TABLE `standardmodel` ENABLE KEYS */;


--
-- Definition of table `studentallsubjectmarkdetailsmodel`
--

DROP TABLE IF EXISTS `studentallsubjectmarkdetailsmodel`;
CREATE TABLE `studentallsubjectmarkdetailsmodel` (
  `studentAllSubjectMarkDetailsId` int(11) NOT NULL AUTO_INCREMENT,
  `aggregate` double NOT NULL,
  `finalGrade` varchar(255) DEFAULT NULL,
  `percentage` double NOT NULL,
  `studentMarkOfPerticularSubject` int(11) NOT NULL,
  `subjectGrade` varchar(255) DEFAULT NULL,
  `totalNoOfsubject` int(11) NOT NULL,
  `totalOfAllSubjectMarks` bigint(20) NOT NULL,
  `totalOfExamTypeMarks` int(11) NOT NULL,
  `totalOfStudentMarksOfAllSubject` bigint(20) NOT NULL,
  `academicYear_FK` int(11) DEFAULT NULL,
  `division_FK` int(11) DEFAULT NULL,
  `examName_FK` int(11) DEFAULT NULL,
  `standard_FK` int(11) DEFAULT NULL,
  `studentRegId_FK` int(11) DEFAULT NULL,
  `subjectName_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`studentAllSubjectMarkDetailsId`),
  KEY `FK23A2965A7ED908F4` (`examName_FK`),
  KEY `FK23A2965A63CC050E` (`division_FK`),
  KEY `FK23A2965AE9A49C96` (`studentRegId_FK`),
  KEY `FK23A2965ACEB6F8EE` (`standard_FK`),
  KEY `FK23A2965A5C7BA840` (`academicYear_FK`),
  KEY `FK23A2965AD4BC2D04` (`subjectName_FK`),
  CONSTRAINT `FK23A2965A5C7BA840` FOREIGN KEY (`academicYear_FK`) REFERENCES `academicyearmodel` (`academicYearId`),
  CONSTRAINT `FK23A2965A63CC050E` FOREIGN KEY (`division_FK`) REFERENCES `divisionmodel` (`divisionId`),
  CONSTRAINT `FK23A2965A7ED908F4` FOREIGN KEY (`examName_FK`) REFERENCES `examnamemodel` (`examNameId`),
  CONSTRAINT `FK23A2965ACEB6F8EE` FOREIGN KEY (`standard_FK`) REFERENCES `standardmodel` (`standardId`),
  CONSTRAINT `FK23A2965AD4BC2D04` FOREIGN KEY (`subjectName_FK`) REFERENCES `subjectnamemodel` (`subjectId`),
  CONSTRAINT `FK23A2965AE9A49C96` FOREIGN KEY (`studentRegId_FK`) REFERENCES `studentregistrationmodel` (`studentRegistrationId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentallsubjectmarkdetailsmodel`
--

/*!40000 ALTER TABLE `studentallsubjectmarkdetailsmodel` DISABLE KEYS */;
INSERT INTO `studentallsubjectmarkdetailsmodel` (`studentAllSubjectMarkDetailsId`,`aggregate`,`finalGrade`,`percentage`,`studentMarkOfPerticularSubject`,`subjectGrade`,`totalNoOfsubject`,`totalOfAllSubjectMarks`,`totalOfExamTypeMarks`,`totalOfStudentMarksOfAllSubject`,`academicYear_FK`,`division_FK`,`examName_FK`,`standard_FK`,`studentRegId_FK`,`subjectName_FK`) VALUES 
 (3,92.5,'A1',92.5,95,'A1',2,200,100,185,1,1,1,2,1,NULL),
 (4,92.5,'A1',92.5,90,'A2',2,200,100,185,1,1,1,2,1,NULL),
 (5,92.5,'A1',92.5,95,'A1',2,200,100,185,1,1,1,2,1,3),
 (6,92.5,'A1',92.5,90,'A2',2,200,100,185,1,1,1,2,1,1);
/*!40000 ALTER TABLE `studentallsubjectmarkdetailsmodel` ENABLE KEYS */;


--
-- Definition of table `studentfinalmarksmodel`
--

DROP TABLE IF EXISTS `studentfinalmarksmodel`;
CREATE TABLE `studentfinalmarksmodel` (
  `studentFinalMarksId` int(11) NOT NULL AUTO_INCREMENT,
  `finalMarks` double NOT NULL,
  `studentAggregate` double NOT NULL,
  `studentGrade` varchar(255) DEFAULT NULL,
  `studentMarks` double NOT NULL,
  `studentPercentage` double NOT NULL,
  `studentSubjectGrade` varchar(255) DEFAULT NULL,
  `totalMarks` int(11) NOT NULL,
  `totalOfSubjectMarks` int(11) NOT NULL,
  `totalSubject` int(11) NOT NULL,
  `academicYear_FK` int(11) DEFAULT NULL,
  `division_FK` int(11) DEFAULT NULL,
  `examName_FK` int(11) DEFAULT NULL,
  `examType_FK` int(11) DEFAULT NULL,
  `standard_FK` int(11) DEFAULT NULL,
  `studentRegistration_FK` int(11) DEFAULT NULL,
  `subject_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`studentFinalMarksId`),
  KEY `FK2F16D9FE7ED908F4` (`examName_FK`),
  KEY `FK2F16D9FE63CC050E` (`division_FK`),
  KEY `FK2F16D9FE1FA17976` (`studentRegistration_FK`),
  KEY `FK2F16D9FE7138816F` (`subject_FK`),
  KEY `FK2F16D9FEBAC68296` (`examType_FK`),
  KEY `FK2F16D9FECEB6F8EE` (`standard_FK`),
  KEY `FK2F16D9FE5C7BA840` (`academicYear_FK`),
  CONSTRAINT `FK2F16D9FE1FA17976` FOREIGN KEY (`studentRegistration_FK`) REFERENCES `studentregistrationmodel` (`studentRegistrationId`),
  CONSTRAINT `FK2F16D9FE5C7BA840` FOREIGN KEY (`academicYear_FK`) REFERENCES `academicyearmodel` (`academicYearId`),
  CONSTRAINT `FK2F16D9FE63CC050E` FOREIGN KEY (`division_FK`) REFERENCES `divisionmodel` (`divisionId`),
  CONSTRAINT `FK2F16D9FE7138816F` FOREIGN KEY (`subject_FK`) REFERENCES `subjectnamemodel` (`subjectId`),
  CONSTRAINT `FK2F16D9FE7ED908F4` FOREIGN KEY (`examName_FK`) REFERENCES `examnamemodel` (`examNameId`),
  CONSTRAINT `FK2F16D9FEBAC68296` FOREIGN KEY (`examType_FK`) REFERENCES `examtypemodel` (`examTypeId`),
  CONSTRAINT `FK2F16D9FECEB6F8EE` FOREIGN KEY (`standard_FK`) REFERENCES `standardmodel` (`standardId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentfinalmarksmodel`
--

/*!40000 ALTER TABLE `studentfinalmarksmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentfinalmarksmodel` ENABLE KEYS */;


--
-- Definition of table `studentgrademodel`
--

DROP TABLE IF EXISTS `studentgrademodel`;
CREATE TABLE `studentgrademodel` (
  `studentGradeId` int(11) NOT NULL AUTO_INCREMENT,
  `studentGradeName` varchar(255) DEFAULT NULL,
  `studentGradeStatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`studentGradeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentgrademodel`
--

/*!40000 ALTER TABLE `studentgrademodel` DISABLE KEYS */;
INSERT INTO `studentgrademodel` (`studentGradeId`,`studentGradeName`,`studentGradeStatus`) VALUES 
 (1,'A1','On'),
 (2,'A2','On'),
 (3,'B1','On'),
 (4,'B2','On');
/*!40000 ALTER TABLE `studentgrademodel` ENABLE KEYS */;


--
-- Definition of table `studentmarksmodel`
--

DROP TABLE IF EXISTS `studentmarksmodel`;
CREATE TABLE `studentmarksmodel` (
  `studentMarksId` int(11) NOT NULL AUTO_INCREMENT,
  `studentAggregate` double NOT NULL,
  `studentGrade` varchar(255) DEFAULT NULL,
  `studentMarks` double NOT NULL,
  `studentPercentage` double NOT NULL,
  `totalMarks` int(11) NOT NULL,
  `totalOfSubjectMarks` int(11) NOT NULL,
  `totalSubject` int(11) NOT NULL,
  `academicYear_FK` int(11) DEFAULT NULL,
  `division_FK` int(11) DEFAULT NULL,
  `examName_FK` int(11) DEFAULT NULL,
  `examType_FK` int(11) DEFAULT NULL,
  `standard_FK` int(11) DEFAULT NULL,
  `studentRegistration_FK` int(11) DEFAULT NULL,
  `subject_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`studentMarksId`),
  KEY `FK57F1A3FE7ED908F4` (`examName_FK`),
  KEY `FK57F1A3FE63CC050E` (`division_FK`),
  KEY `FK57F1A3FE1FA17976` (`studentRegistration_FK`),
  KEY `FK57F1A3FE7138816F` (`subject_FK`),
  KEY `FK57F1A3FEBAC68296` (`examType_FK`),
  KEY `FK57F1A3FECEB6F8EE` (`standard_FK`),
  KEY `FK57F1A3FE5C7BA840` (`academicYear_FK`),
  CONSTRAINT `FK57F1A3FE1FA17976` FOREIGN KEY (`studentRegistration_FK`) REFERENCES `studentregistrationmodel` (`studentRegistrationId`),
  CONSTRAINT `FK57F1A3FE5C7BA840` FOREIGN KEY (`academicYear_FK`) REFERENCES `academicyearmodel` (`academicYearId`),
  CONSTRAINT `FK57F1A3FE63CC050E` FOREIGN KEY (`division_FK`) REFERENCES `divisionmodel` (`divisionId`),
  CONSTRAINT `FK57F1A3FE7138816F` FOREIGN KEY (`subject_FK`) REFERENCES `subjectnamemodel` (`subjectId`),
  CONSTRAINT `FK57F1A3FE7ED908F4` FOREIGN KEY (`examName_FK`) REFERENCES `examnamemodel` (`examNameId`),
  CONSTRAINT `FK57F1A3FEBAC68296` FOREIGN KEY (`examType_FK`) REFERENCES `examtypemodel` (`examTypeId`),
  CONSTRAINT `FK57F1A3FECEB6F8EE` FOREIGN KEY (`standard_FK`) REFERENCES `standardmodel` (`standardId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentmarksmodel`
--

/*!40000 ALTER TABLE `studentmarksmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentmarksmodel` ENABLE KEYS */;


--
-- Definition of table `studentnextyearadmissionmodel`
--

DROP TABLE IF EXISTS `studentnextyearadmissionmodel`;
CREATE TABLE `studentnextyearadmissionmodel` (
  `StudentNextYearAdmissionId` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) DEFAULT NULL,
  `studentNextAcademicYearId` int(11) NOT NULL,
  `studentNextYearStandardId` int(11) NOT NULL,
  `studentRegId` int(11) NOT NULL,
  `NextAcademicYear_FK` int(11) DEFAULT NULL,
  `NextStandard_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`StudentNextYearAdmissionId`),
  KEY `FK5CA2368B4EF878ED` (`NextAcademicYear_FK`),
  KEY `FK5CA2368BD169281B` (`NextStandard_FK`),
  CONSTRAINT `FK5CA2368B4EF878ED` FOREIGN KEY (`NextAcademicYear_FK`) REFERENCES `academicyearmodel` (`academicYearId`),
  CONSTRAINT `FK5CA2368BD169281B` FOREIGN KEY (`NextStandard_FK`) REFERENCES `standardmodel` (`standardId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentnextyearadmissionmodel`
--

/*!40000 ALTER TABLE `studentnextyearadmissionmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentnextyearadmissionmodel` ENABLE KEYS */;


--
-- Definition of table `studentregistrationmodel`
--

DROP TABLE IF EXISTS `studentregistrationmodel`;
CREATE TABLE `studentregistrationmodel` (
  `studentRegistrationId` int(11) NOT NULL AUTO_INCREMENT,
  `UDISEno` varchar(255) DEFAULT NULL,
  `UIDno` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `annualIncomeOfParent` varchar(255) DEFAULT NULL,
  `bloodGroup` varchar(255) DEFAULT NULL,
  `conduct` varchar(255) DEFAULT NULL,
  `contactNo` varchar(255) DEFAULT NULL,
  `dateofAdmission` varchar(255) DEFAULT NULL,
  `dateofBirth` varchar(255) DEFAULT NULL,
  `dateofLeavingtheSchool` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `generalRegNo` varchar(255) DEFAULT NULL,
  `initialAcademicYear` varchar(255) DEFAULT NULL,
  `initialDivision` varchar(255) DEFAULT NULL,
  `initialStandard` varchar(255) DEFAULT NULL,
  `lastSchoolAttendedWithStd` varchar(255) DEFAULT NULL,
  `lastSchoolAttendedwithUDISEno` varchar(255) DEFAULT NULL,
  `lastSchoolOfStudent` varchar(255) DEFAULT NULL,
  `motherName` varchar(255) DEFAULT NULL,
  `motherToungh` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `placeofBirth` varchar(255) DEFAULT NULL,
  `progress` varchar(255) DEFAULT NULL,
  `reasonofLeavingSchool` varchar(255) DEFAULT NULL,
  `receivingDateofLCnParentsSign` varchar(255) DEFAULT NULL,
  `regDate` varchar(255) DEFAULT NULL,
  `signofGuardionForEntriesareCorrect` varchar(255) DEFAULT NULL,
  `stdnDivfromWhichLeft` varchar(255) DEFAULT NULL,
  `studentFirstName` varchar(255) DEFAULT NULL,
  `studentFullName` varchar(255) DEFAULT NULL,
  `studentLastName` varchar(255) DEFAULT NULL,
  `studentMiddleName` varchar(255) DEFAULT NULL,
  `taluka` varchar(255) DEFAULT NULL,
  `village` varchar(255) DEFAULT NULL,
  `AcademicYear_FK` int(11) DEFAULT NULL,
  `cast_FK` int(11) DEFAULT NULL,
  `category_FK` int(11) DEFAULT NULL,
  `division_FK` int(11) DEFAULT NULL,
  `religion_FK` int(11) DEFAULT NULL,
  `standard_FK` int(11) DEFAULT NULL,
  `subcast_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`studentRegistrationId`),
  KEY `FK2795ED1563CC050E` (`division_FK`),
  KEY `FK2795ED15A4C1FE52` (`subcast_FK`),
  KEY `FK2795ED15B79F3344` (`religion_FK`),
  KEY `FK2795ED15CEB6F8EE` (`standard_FK`),
  KEY `FK2795ED15D2355528` (`cast_FK`),
  KEY `FK2795ED158540326A` (`category_FK`),
  KEY `FK2795ED155C7BA840` (`AcademicYear_FK`),
  CONSTRAINT `FK2795ED155C7BA840` FOREIGN KEY (`AcademicYear_FK`) REFERENCES `academicyearmodel` (`academicYearId`),
  CONSTRAINT `FK2795ED1563CC050E` FOREIGN KEY (`division_FK`) REFERENCES `divisionmodel` (`divisionId`),
  CONSTRAINT `FK2795ED158540326A` FOREIGN KEY (`category_FK`) REFERENCES `categorymastermodel` (`categoryId`),
  CONSTRAINT `FK2795ED15A4C1FE52` FOREIGN KEY (`subcast_FK`) REFERENCES `subcastmastermodel` (`subcastId`),
  CONSTRAINT `FK2795ED15B79F3344` FOREIGN KEY (`religion_FK`) REFERENCES `religionmastermodel` (`religionId`),
  CONSTRAINT `FK2795ED15CEB6F8EE` FOREIGN KEY (`standard_FK`) REFERENCES `standardmodel` (`standardId`),
  CONSTRAINT `FK2795ED15D2355528` FOREIGN KEY (`cast_FK`) REFERENCES `castmastermodel` (`castId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentregistrationmodel`
--

/*!40000 ALTER TABLE `studentregistrationmodel` DISABLE KEYS */;
INSERT INTO `studentregistrationmodel` (`studentRegistrationId`,`UDISEno`,`UIDno`,`address`,`annualIncomeOfParent`,`bloodGroup`,`conduct`,`contactNo`,`dateofAdmission`,`dateofBirth`,`dateofLeavingtheSchool`,`district`,`gender`,`generalRegNo`,`initialAcademicYear`,`initialDivision`,`initialStandard`,`lastSchoolAttendedWithStd`,`lastSchoolAttendedwithUDISEno`,`lastSchoolOfStudent`,`motherName`,`motherToungh`,`nationality`,`pincode`,`placeofBirth`,`progress`,`reasonofLeavingSchool`,`receivingDateofLCnParentsSign`,`regDate`,`signofGuardionForEntriesareCorrect`,`stdnDivfromWhichLeft`,`studentFirstName`,`studentFullName`,`studentLastName`,`studentMiddleName`,`taluka`,`village`,`AcademicYear_FK`,`cast_FK`,`category_FK`,`division_FK`,`religion_FK`,`standard_FK`,`subcast_FK`) VALUES 
 (1,'45434567654','983249032','Dist:Ahemdnagar ,Tal:Shrigonda ,village:Ukkadgaon pin:,3762','2364826583','A+',NULL,'8999385622','2019-04-24','2019-04-15',NULL,'Ahemdnagar','Female','7979788','1','1','2','1st','34739876567','Prerana','Sunita','Marathi','Indian','3762','Pune',NULL,NULL,NULL,'2019-04-21',NULL,NULL,'Payal','Payal subhash Tatiya','Tatiya','subhash','Shrigonda','Ukkadgaon',1,1,1,1,1,2,1);
/*!40000 ALTER TABLE `studentregistrationmodel` ENABLE KEYS */;


--
-- Definition of table `studentsubjectwisemarksmodel`
--

DROP TABLE IF EXISTS `studentsubjectwisemarksmodel`;
CREATE TABLE `studentsubjectwisemarksmodel` (
  `studentSubjectWiseMarksId` int(11) NOT NULL AUTO_INCREMENT,
  `examTypeMark` int(11) NOT NULL,
  `studentMarkOfPerticularSubject` int(11) NOT NULL,
  `studentMarks` int(11) NOT NULL,
  `subjectGrade` varchar(255) DEFAULT NULL,
  `totalExamType` int(11) NOT NULL,
  `totalOfExamTypeMarks` int(11) NOT NULL,
  `academicYear_FK` int(11) DEFAULT NULL,
  `division_FK` int(11) DEFAULT NULL,
  `examName_FK` int(11) DEFAULT NULL,
  `examType_FK` int(11) DEFAULT NULL,
  `standard_FK` int(11) DEFAULT NULL,
  `studentRegId_FK` int(11) DEFAULT NULL,
  `subjectName_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`studentSubjectWiseMarksId`),
  KEY `FK3A9A2C387ED908F4` (`examName_FK`),
  KEY `FK3A9A2C3863CC050E` (`division_FK`),
  KEY `FK3A9A2C38BAC68296` (`examType_FK`),
  KEY `FK3A9A2C38E9A49C96` (`studentRegId_FK`),
  KEY `FK3A9A2C38CEB6F8EE` (`standard_FK`),
  KEY `FK3A9A2C385C7BA840` (`academicYear_FK`),
  KEY `FK3A9A2C38D4BC2D04` (`subjectName_FK`),
  CONSTRAINT `FK3A9A2C385C7BA840` FOREIGN KEY (`academicYear_FK`) REFERENCES `academicyearmodel` (`academicYearId`),
  CONSTRAINT `FK3A9A2C3863CC050E` FOREIGN KEY (`division_FK`) REFERENCES `divisionmodel` (`divisionId`),
  CONSTRAINT `FK3A9A2C387ED908F4` FOREIGN KEY (`examName_FK`) REFERENCES `examnamemodel` (`examNameId`),
  CONSTRAINT `FK3A9A2C38BAC68296` FOREIGN KEY (`examType_FK`) REFERENCES `examtypemodel` (`examTypeId`),
  CONSTRAINT `FK3A9A2C38CEB6F8EE` FOREIGN KEY (`standard_FK`) REFERENCES `standardmodel` (`standardId`),
  CONSTRAINT `FK3A9A2C38D4BC2D04` FOREIGN KEY (`subjectName_FK`) REFERENCES `subjectnamemodel` (`subjectId`),
  CONSTRAINT `FK3A9A2C38E9A49C96` FOREIGN KEY (`studentRegId_FK`) REFERENCES `studentregistrationmodel` (`studentRegistrationId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentsubjectwisemarksmodel`
--

/*!40000 ALTER TABLE `studentsubjectwisemarksmodel` DISABLE KEYS */;
INSERT INTO `studentsubjectwisemarksmodel` (`studentSubjectWiseMarksId`,`examTypeMark`,`studentMarkOfPerticularSubject`,`studentMarks`,`subjectGrade`,`totalExamType`,`totalOfExamTypeMarks`,`academicYear_FK`,`division_FK`,`examName_FK`,`examType_FK`,`standard_FK`,`studentRegId_FK`,`subjectName_FK`) VALUES 
 (1,40,90,35,'A2',2,100,1,1,1,2,2,1,1),
 (2,60,90,55,'A2',2,100,1,1,1,1,2,1,1),
 (3,40,95,40,'A1',2,100,1,1,1,2,2,1,2),
 (4,60,95,55,'A1',2,100,1,1,1,1,2,1,2),
 (5,40,90,34,'A2',2,100,1,1,1,2,2,1,2),
 (6,60,90,56,'A2',2,100,1,1,1,1,2,1,2);
/*!40000 ALTER TABLE `studentsubjectwisemarksmodel` ENABLE KEYS */;


--
-- Definition of table `subcastmastermodel`
--

DROP TABLE IF EXISTS `subcastmastermodel`;
CREATE TABLE `subcastmastermodel` (
  `subcastId` int(11) NOT NULL AUTO_INCREMENT,
  `subcastName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subcastId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcastmastermodel`
--

/*!40000 ALTER TABLE `subcastmastermodel` DISABLE KEYS */;
INSERT INTO `subcastmastermodel` (`subcastId`,`subcastName`) VALUES 
 (1,'Kunabi');
/*!40000 ALTER TABLE `subcastmastermodel` ENABLE KEYS */;


--
-- Definition of table `subjectnamemodel`
--

DROP TABLE IF EXISTS `subjectnamemodel`;
CREATE TABLE `subjectnamemodel` (
  `subjectId` int(11) NOT NULL AUTO_INCREMENT,
  `subjectName` varchar(255) DEFAULT NULL,
  `subjectNameStatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subjectId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjectnamemodel`
--

/*!40000 ALTER TABLE `subjectnamemodel` DISABLE KEYS */;
INSERT INTO `subjectnamemodel` (`subjectId`,`subjectName`,`subjectNameStatus`) VALUES 
 (1,'Marathi','On'),
 (2,'Hindi','On'),
 (3,'English','On');
/*!40000 ALTER TABLE `subjectnamemodel` ENABLE KEYS */;


--
-- Definition of table `teachermodel`
--

DROP TABLE IF EXISTS `teachermodel`;
CREATE TABLE `teachermodel` (
  `teacherId` int(11) NOT NULL AUTO_INCREMENT,
  `UIDno` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contactNo` varchar(255) DEFAULT NULL,
  `dateofBirth` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `regDate` varchar(255) DEFAULT NULL,
  `taluka` varchar(255) DEFAULT NULL,
  `teacherFirstName` varchar(255) DEFAULT NULL,
  `teacherFullName` varchar(255) DEFAULT NULL,
  `teacherLastName` varchar(255) DEFAULT NULL,
  `teacherMiddleName` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `village` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`teacherId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teachermodel`
--

/*!40000 ALTER TABLE `teachermodel` DISABLE KEYS */;
INSERT INTO `teachermodel` (`teacherId`,`UIDno`,`address`,`contactNo`,`dateofBirth`,`district`,`gender`,`nationality`,`password`,`pincode`,`regDate`,`taluka`,`teacherFirstName`,`teacherFullName`,`teacherLastName`,`teacherMiddleName`,`username`,`village`) VALUES 
 (1,'983249032','Dist-Ahemdnagar,Tal-Newasa,Village-Sonai,Pincode-324324','8999385622','2019-04-16','Ahemdnagar','Female','Indian','teacher','324324','2019-04-21','Newasa','Manjusha','Manjusha	 Sambhaji	 Darandale','Darandale','Sambhaji','teacher','Sonai');
/*!40000 ALTER TABLE `teachermodel` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
