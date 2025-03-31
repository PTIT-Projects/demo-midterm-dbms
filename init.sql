-- Create the database
CREATE DATABASE IF NOT EXISTS football_stat_web;

USE football_stat_web;

-- Create the user
CREATE USER IF NOT EXISTS 'test_user'@'%' IDENTIFIED BY 'superSecretPassword!123';

-- Grant all privileges on the epl database to the user
GRANT ALL PRIVILEGES ON football_stat_web.* TO 'test_user'@'%' WITH GRANT OPTION;

-- Flush privileges to ensure that the changes take effect
FLUSH PRIVILEGES;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: football_stat_web
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `club_season_table`
--

DROP TABLE IF EXISTS `club_season_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club_season_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `diff` int DEFAULT NULL,
  `goal_conceded` int DEFAULT NULL,
  `goal_scores` int DEFAULT NULL,
  `num_draws` int DEFAULT NULL,
  `num_losses` int DEFAULT NULL,
  `num_wins` int DEFAULT NULL,
  `points` int DEFAULT NULL,
  `ranked` int DEFAULT NULL,
  `club_id` bigint DEFAULT NULL,
  `season_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKm6wpknpvkxhcnx07eqtev1prh` (`season_id`,`club_id`),
  KEY `FKmisqf4c7rpshy9gjfe3ilwtjn` (`club_id`),
  CONSTRAINT `FKm7x8jwlymhgjga3fmqgtper9j` FOREIGN KEY (`season_id`) REFERENCES `league_season` (`id`),
  CONSTRAINT `FKmisqf4c7rpshy9gjfe3ilwtjn` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club_season_table`
--

LOCK TABLES `club_season_table` WRITE;
/*!40000 ALTER TABLE `club_season_table` DISABLE KEYS */;
INSERT INTO `club_season_table` VALUES (2,0,0,0,0,0,0,0,2,2,1),(3,0,0,0,0,0,0,1,3,3,1),(4,0,0,0,0,0,0,0,0,1,1),(5,0,0,0,0,0,0,0,0,4,1);
/*!40000 ALTER TABLE `club_season_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clubs`
--

DROP TABLE IF EXISTS `clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clubs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `country` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `stadium_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubs`
--

LOCK TABLES `clubs` WRITE;
/*!40000 ALTER TABLE `clubs` DISABLE KEYS */;
INSERT INTO `clubs` VALUES (1,'England','Chelsea','Etihad'),(2,'England','MC','Etihad'),(3,'England','MU','Etihad'),(4,'England','Arsenal','Etihad');
/*!40000 ALTER TABLE `clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach_citizenship`
--

DROP TABLE IF EXISTS `coach_citizenship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach_citizenship` (
  `head_coach_id` bigint NOT NULL,
  `citizenship` varchar(255) DEFAULT NULL,
  KEY `FK99fhoyh22vxs7evjftmdudfty` (`head_coach_id`),
  CONSTRAINT `FK99fhoyh22vxs7evjftmdudfty` FOREIGN KEY (`head_coach_id`) REFERENCES `head_coaches` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach_citizenship`
--

LOCK TABLES `coach_citizenship` WRITE;
/*!40000 ALTER TABLE `coach_citizenship` DISABLE KEYS */;
INSERT INTO `coach_citizenship` VALUES (2,'England'),(1,'Vietnam');
/*!40000 ALTER TABLE `coach_citizenship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach_club`
--

DROP TABLE IF EXISTS `coach_club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach_club` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `club_id` bigint DEFAULT NULL,
  `head_coach_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkhdg3ex346y7qjpqdv82504xu` (`club_id`),
  KEY `FKnhe4mtphh3ly6hkodofx0l20m` (`head_coach_id`),
  CONSTRAINT `FKkhdg3ex346y7qjpqdv82504xu` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`),
  CONSTRAINT `FKnhe4mtphh3ly6hkodofx0l20m` FOREIGN KEY (`head_coach_id`) REFERENCES `head_coaches` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach_club`
--

LOCK TABLES `coach_club` WRITE;
/*!40000 ALTER TABLE `coach_club` DISABLE KEYS */;
INSERT INTO `coach_club` VALUES (1,'2020-06-07','2009-05-06',1,1),(2,'2021-03-01','2020-03-01',4,2),(3,'2025-03-01','2020-09-09',4,1);
/*!40000 ALTER TABLE `coach_club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `head_coaches`
--

DROP TABLE IF EXISTS `head_coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `head_coaches` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dob` date DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `head_coaches`
--

LOCK TABLES `head_coaches` WRITE;
/*!40000 ALTER TABLE `head_coaches` DISABLE KEYS */;
INSERT INTO `head_coaches` VALUES (1,'2004-09-24','Duong Vu'),(2,'2003-05-06','Nam Nguyen');
/*!40000 ALTER TABLE `head_coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `league_season`
--

DROP TABLE IF EXISTS `league_season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `league_season` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `end_date` date DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `league_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKeh56dd1sc0kskcxkh3crtrb9t` (`league_id`),
  CONSTRAINT `FKeh56dd1sc0kskcxkh3crtrb9t` FOREIGN KEY (`league_id`) REFERENCES `leagues` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `league_season`
--

LOCK TABLES `league_season` WRITE;
/*!40000 ALTER TABLE `league_season` DISABLE KEYS */;
INSERT INTO `league_season` VALUES (1,'2025-05-31','2024/2025','2024-08-16',1),(2,'2024-05-31','2023/2024','2023-08-16',1);
/*!40000 ALTER TABLE `league_season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leagues`
--

DROP TABLE IF EXISTS `leagues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leagues` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leagues`
--

LOCK TABLES `leagues` WRITE;
/*!40000 ALTER TABLE `leagues` DISABLE KEYS */;
INSERT INTO `leagues` VALUES (1,'EPL');
/*!40000 ALTER TABLE `leagues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_action`
--

DROP TABLE IF EXISTS `match_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_action` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `minute` int NOT NULL,
  `match_id` bigint DEFAULT NULL,
  `player_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKh2kthjkggihmig4al9tw8eywe` (`match_id`),
  KEY `FKhwwyrornqkr1lyvemgcjyner2` (`player_id`),
  CONSTRAINT `FKh2kthjkggihmig4al9tw8eywe` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`),
  CONSTRAINT `FKhwwyrornqkr1lyvemgcjyner2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_action`
--

LOCK TABLES `match_action` WRITE;
/*!40000 ALTER TABLE `match_action` DISABLE KEYS */;
INSERT INTO `match_action` VALUES (3,'GOAL',50,1,2),(4,'OWN_GOAL',60,1,2),(5,'GOAL',70,1,1);
/*!40000 ALTER TABLE `match_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `away_score` int NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `host_score` int NOT NULL,
  `round` int NOT NULL,
  `away_id` bigint DEFAULT NULL,
  `host_id` bigint DEFAULT NULL,
  `season_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9vqu7347mgyqqjuyf6mjqumle` (`away_id`),
  KEY `FKcpo9b45p5n2n7ikrfxkiroopb` (`host_id`),
  KEY `FKiklv11qrf4ucv9s257u841tcr` (`season_id`),
  CONSTRAINT `FK9vqu7347mgyqqjuyf6mjqumle` FOREIGN KEY (`away_id`) REFERENCES `clubs` (`id`),
  CONSTRAINT `FKcpo9b45p5n2n7ikrfxkiroopb` FOREIGN KEY (`host_id`) REFERENCES `clubs` (`id`),
  CONSTRAINT `FKiklv11qrf4ucv9s257u841tcr` FOREIGN KEY (`season_id`) REFERENCES `league_season` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (1,2,'2024-03-12 17:16:09.000000',1,1,2,1,1),(2,0,'2024-03-12 17:16:09.000000',0,1,2,1,1),(3,0,'2024-03-12 17:32:08.000000',0,1,2,1,1),(4,0,'2025-03-12 17:41:47.000000',4,1,4,3,1),(5,5,'2024-03-12 17:42:15.000000',0,2,2,3,1),(6,0,'2025-03-14 17:49:33.000000',0,3,3,2,1),(7,0,'2025-03-14 17:49:48.000000',0,4,2,3,1),(8,1,'2025-03-14 10:50:52.963000',1,5,2,1,1),(9,1,'2025-03-14 10:50:52.963000',1,6,2,1,1),(10,1,'2025-03-14 10:50:52.963000',1,7,2,1,1),(11,1,'2025-03-14 10:50:52.963000',1,8,2,1,1),(12,1,'2025-03-14 10:50:52.963000',1,9,2,1,1),(13,1,'2025-03-14 10:50:52.963000',1,10,2,1,1),(14,1,'2025-03-14 10:50:52.963000',1,11,2,1,1),(15,1,'2025-03-14 10:50:52.963000',1,12,2,1,1),(16,1,'2025-03-14 10:50:52.963000',1,13,2,1,1),(17,1,'2025-03-14 10:50:52.963000',1,14,2,1,1),(18,1,'2025-03-14 10:50:52.963000',1,15,2,1,1),(19,1,'2025-03-14 10:50:52.963000',1,16,2,1,1),(20,1,'2025-03-14 10:50:52.963000',1,17,2,1,1),(21,1,'2025-03-14 10:50:52.963000',1,18,2,1,1),(22,1,'2025-03-14 10:50:52.963000',1,19,2,1,1),(23,1,'2025-03-14 10:50:52.963000',1,20,2,1,1),(24,1,'2025-03-14 10:50:52.963000',1,21,2,1,1),(25,1,'2025-03-14 10:50:52.963000',1,22,2,1,1);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_citizenship`
--

DROP TABLE IF EXISTS `player_citizenship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_citizenship` (
  `player_id` bigint NOT NULL,
  `citizenship` varchar(255) DEFAULT NULL,
  KEY `FKjr2dffd1ba5so23j49tfxrumr` (`player_id`),
  CONSTRAINT `FKjr2dffd1ba5so23j49tfxrumr` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_citizenship`
--

LOCK TABLES `player_citizenship` WRITE;
/*!40000 ALTER TABLE `player_citizenship` DISABLE KEYS */;
INSERT INTO `player_citizenship` VALUES (1,'Norway'),(2,'Norway'),(3,'Vietnam'),(3,'England'),(3,'Norway'),(4,'Vietnam');
/*!40000 ALTER TABLE `player_citizenship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_position`
--

DROP TABLE IF EXISTS `player_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_position` (
  `player_id` bigint NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  KEY `FKg5r9b5rky6f6lp19or0kps066` (`player_id`),
  CONSTRAINT `FKg5r9b5rky6f6lp19or0kps066` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_position`
--

LOCK TABLES `player_position` WRITE;
/*!40000 ALTER TABLE `player_position` DISABLE KEYS */;
INSERT INTO `player_position` VALUES (1,'ST'),(2,'ST'),(3,'CM'),(4,'LW');
/*!40000 ALTER TABLE `player_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dob` date DEFAULT NULL,
  `market_value` double NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `shirt_number` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'2001-03-02',200,'Erling Haaland',9),(2,'2001-03-02',200,'Cole Palmer',9),(3,'2004-09-24',100,'Duong Vu',10),(4,'2004-05-06',50,'Duong Vu',11);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer_history`
--

DROP TABLE IF EXISTS `transfer_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `fee` double NOT NULL,
  `player_value` double NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `club_id` bigint DEFAULT NULL,
  `player_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8h1f3bh9nltnunk0waiighbu1` (`club_id`),
  KEY `FKpw4wnb3i37bthjq1k7enbpqdl` (`player_id`),
  CONSTRAINT `FK8h1f3bh9nltnunk0waiighbu1` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`),
  CONSTRAINT `FKpw4wnb3i37bthjq1k7enbpqdl` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_history`
--

LOCK TABLES `transfer_history` WRITE;
/*!40000 ALTER TABLE `transfer_history` DISABLE KEYS */;
INSERT INTO `transfer_history` VALUES (1,'2025-03-12',100,200,'Permanent',2,1),(2,'2025-03-12',50,200,'Permanent',1,2),(3,'2025-03-14',0,200,'Free Transfer',2,2),(4,'2025-03-14',0,100,'Youth Promote',4,3),(5,'2025-03-25',0,200,'Free Transfer',3,1);
/*!40000 ALTER TABLE `transfer_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `refreshtoken` mediumtext,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@gmail.com','Duong Vu ADMIN','$2a$10$IAdMsht7wDsar2oT7vTGFOnkLuAvF6/lkW0wUE/7vz4ZnmtzuF/nK','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbkBnbWFpbC5jb20iLCJleHAiOjE3NTE1MDMwMjcsImlhdCI6MTc0Mjg2MzAyNywidXNlciI6eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBnbWFpbC5jb20iLCJuYW1lIjoiRHVvbmcgVnUgQURNSU4iLCJyb2xlIjpudWxsfX0.aUEezVjdqkeY8g2vds5xXlZNOkjpHrL9FGUhEzfjWa4bSqFM2eTYoS-Dbfrs_dB9S4XQzI-rpOjxX6WquGu7sg','ADMIN'),(2,'duong2004@gmail.com','Duong Vu','$2a$10$bZ0qdnw23TMq7VzZcqjjQeI0ekiqxXCTs5j5iBOku7ma6tEaszrvm',NULL,'USER');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-29 16:53:03
