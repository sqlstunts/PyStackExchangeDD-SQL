CREATE DATABASE  IF NOT EXISTS `stackexchangedd` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `stackexchangedd`;
-- MySQL dump 10.13  Distrib 5.6.23
-- Server version	5.6.24

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
-- Table structure for table `badges`
--

DROP TABLE IF EXISTS `badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badges` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `UserId` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `CreationDate` datetime NOT NULL,
  `PostId` int(11) NOT NULL,
  `Score` int(11) DEFAULT NULL,
  `Text` varchar(700) NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_Comments_Id_PostId` (`id`,`PostId`),
  KEY `IX_Comments_Id_UserId` (`id`,`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `linktypes`
--

DROP TABLE IF EXISTS `linktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linktypes` (
  `Id` int(11) NOT NULL,
  `type` varchar(40) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `postlinks`
--

DROP TABLE IF EXISTS `postlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postlinks` (
  `id` int(11) NOT NULL,
  `CreationDate` datetime NOT NULL,
  `PostId` int(11) NOT NULL,
  `RelatedPostId` int(11) NOT NULL,
  `LinkTypeId` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `AcceptedAnswerId` int(11) DEFAULT NULL,
  `AnswerCount` int(11) DEFAULT NULL,
  `Body` text NOT NULL,
  `ClosedDate` datetime DEFAULT NULL,
  `CommentCount` int(11) DEFAULT NULL,
  `CommunityOwnedDate` datetime DEFAULT NULL,
  `CreationDate` datetime NOT NULL,
  `FavoriteCount` int(11) DEFAULT NULL,
  `LastActivityDate` datetime NOT NULL,
  `LastEditDate` datetime DEFAULT NULL,
  `LastEditorDisplayName` varchar(40) DEFAULT NULL,
  `LastEditorUserId` int(11) DEFAULT NULL,
  `OwnerUserId` int(11) DEFAULT NULL,
  `ParentId` int(11) DEFAULT NULL,
  `PostTypeId` int(11) NOT NULL,
  `Score` int(11) NOT NULL,
  `Tags` varchar(150) DEFAULT NULL,
  `Title` varchar(250) DEFAULT NULL,
  `ViewCount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_Posts_Id_PostTypeId` (`id`,`PostTypeId`),
  KEY `IX_Posts_PostTypeId` (`PostTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `posttags`
--

DROP TABLE IF EXISTS `posttags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posttags` (
  `PostId` int(11) NOT NULL,
  `Tag` varchar(50) NOT NULL,
  PRIMARY KEY (`PostId`,`Tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `posttypes`
--

DROP TABLE IF EXISTS `posttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posttypes` (
  `Id` int(11) NOT NULL,
  `Type` varchar(10) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `AboutMe` varchar(255) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `CreationDate` datetime NOT NULL,
  `DisplayName` varchar(40) NOT NULL,
  `DownVotes` int(11) NOT NULL,
  `EmailHash` varchar(40) DEFAULT NULL,
  `LastAccessDate` datetime NOT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `Reputation` int(11) NOT NULL,
  `UpVotes` int(11) NOT NULL,
  `Views` int(11) NOT NULL,
  `WebsiteUrl` varchar(200) DEFAULT NULL,
  `AccountId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_Users_DisplayName` (`DisplayName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes` (
  `Id` int(11) NOT NULL,
  `PostId` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `BountyAmount` int(11) DEFAULT NULL,
  `VoteTypeId` int(11) NOT NULL,
  `CreationDate` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_Votes_Id_PostId` (`Id`,`PostId`),
  KEY `IX_Votes_VoteTypeId` (`VoteTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `votetypes`
--

DROP TABLE IF EXISTS `votetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votetypes` (
  `Id` int(11) NOT NULL,
  `Name` varchar(40) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
