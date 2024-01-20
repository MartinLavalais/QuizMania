DROP DATABASE IF EXISTS `quiz_mania_db`;
CREATE DATABASE `quiz_mania_db`;
USE `quiz_mania_db`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: quiz_mania_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.12-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `id_answer` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(100) NOT NULL,
  `correct` tinyint(1) NOT NULL DEFAULT 0,
  `id_question` int(11) NOT NULL,
  PRIMARY KEY (`id_answer`),
  KEY `answers_FK` (`id_question`),
  CONSTRAINT `answers_FK` FOREIGN KEY (`id_question`) REFERENCES `questions` (`id_question`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_category`),
  UNIQUE KEY `categories_UN` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icons`
--

DROP TABLE IF EXISTS `icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `icons` (
  `id_icon` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `file` varchar(100) NOT NULL,
  PRIMARY KEY (`id_icon`),
  UNIQUE KEY `icons_UN` (`name`,`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icons`
--

LOCK TABLES `icons` WRITE;
/*!40000 ALTER TABLE `icons` DISABLE KEYS */;
/*!40000 ALTER TABLE `icons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_types`
--

DROP TABLE IF EXISTS `question_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_types` (
  `id_question_type` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `free_answer` tinyint(1) NOT NULL DEFAULT 0,
  `max_length` int(5) NOT NULL,
  PRIMARY KEY (`id_question_type`),
  UNIQUE KEY `question_types_UN` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_types`
--

LOCK TABLES `question_types` WRITE;
/*!40000 ALTER TABLE `question_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id_question` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `multiple_answers` tinyint(1) NOT NULL DEFAULT 0,
  `id_question_type` int(11) NOT NULL,
  `id_quiz` int(11) NOT NULL,
  PRIMARY KEY (`id_question`),
  KEY `questions_FK` (`id_quiz`),
  KEY `questions_FK_1` (`id_question_type`),
  CONSTRAINT `questions_FK` FOREIGN KEY (`id_quiz`) REFERENCES `quiz` (`id_quiz`) ON UPDATE CASCADE,
  CONSTRAINT `questions_FK_1` FOREIGN KEY (`id_question_type`) REFERENCES `question_types` (`id_question_type`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz` (
  `id_quiz` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `posted_date` datetime NOT NULL,
  `id_creator` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  PRIMARY KEY (`id_quiz`),
  KEY `quiz_FK` (`id_creator`),
  KEY `quiz_FK_1` (`id_category`),
  CONSTRAINT `quiz_FK` FOREIGN KEY (`id_creator`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE,
  CONSTRAINT `quiz_FK_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records` (
  `id_record` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `time` int(5) NOT NULL,
  `correct` tinyint(1) NOT NULL DEFAULT 0,
  `id_user` int(11) NOT NULL,
  `id_quiz` int(11) NOT NULL,
  PRIMARY KEY (`id_record`),
  KEY `records_FK` (`id_user`),
  KEY `records_FK_1` (`id_quiz`),
  CONSTRAINT `records_FK` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE,
  CONSTRAINT `records_FK_1` FOREIGN KEY (`id_quiz`) REFERENCES `quiz` (`id_quiz`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(100) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `date_creation` datetime NOT NULL,
  `f2a` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `id_icon` int(11) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `users_UN` (`token`,`username`,`email`),
  KEY `users_FK` (`id_icon`),
  CONSTRAINT `users_FK` FOREIGN KEY (`id_icon`) REFERENCES `icons` (`id_icon`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'quiz_mania_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-20 11:27:35
INSERT INTO icons VALUES 
(1, "default", "default-user.png");

INSERT INTO categories VALUES
(1, "Hors catégorie"),
(2, "Jeux-Vidéo"),
(3, "Anime/Manga"),
(4, "Histoire"),
(5, "Géographie"),
(6, "Sport"),
(7, "Informatique"),
(8, "Porno");

INSERT INTO question_types VALUES
(1, "Case à coché", false, 10),
(2, "Réponse à nombre", true, 5),
(3, "Réponse courte", true, 100),
(4, "Réponse longue", true, 1000);

/* The password is : Super */
INSERT INTO users VALUES
(1, null, "Administrateur", "no-reply@atlas-eternal.com", "$2y$10$MHgM53NBAM0IwrW3WM3ORO7A8h2qXNFCLS3HCKD5ccN4bLBiWUYRq", "2024-01-20 12:00:00", true, true, 1);
ALTER TABLE quiz_mania_db.users MODIFY COLUMN id_icon int(11) DEFAULT 1 NOT NULL;
ALTER TABLE quiz_mania_db.users DROP FOREIGN KEY users_FK;
ALTER TABLE quiz_mania_db.users ADD CONSTRAINT users_FK FOREIGN KEY (id_icon) REFERENCES quiz_mania_db.icons(id_icon) ON DELETE SET DEFAULT ON UPDATE CASCADE;
CREATE USER "atlas_quiz_user"@"localhost" IDENTIFIED BY "Super";
GRANT SELECT, INSERT, UPDATE, DELETE ON quiz_mania_db.* TO "atlas_quiz_user"@"localhost";
FLUSH PRIVILEGES;