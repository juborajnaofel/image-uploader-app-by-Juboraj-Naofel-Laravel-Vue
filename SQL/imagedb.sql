CREATE DATABASE  IF NOT EXISTS `jntest` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jntest`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: jntest
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'API Token','01219113dfaf4969155390a733da77464fa1e0c734baeb49a1aea03a48f860da','[\"*\"]',NULL,'2022-05-23 07:47:32','2022-05-23 07:47:32'),(2,'App\\Models\\User',2,'API Token','a2d32b329d1a48caeb1048e926a613bdf71a1312bdc15c4dc45d862a2ec18808','[\"*\"]',NULL,'2022-05-23 08:08:32','2022-05-23 08:08:32'),(3,'App\\Models\\User',3,'API Token','3d15f7f6dbdbebf79e8144dc7400d80fc250fc76f10fffe053c6705863e8e658','[\"*\"]',NULL,'2022-05-23 08:09:29','2022-05-23 08:09:29'),(4,'App\\Models\\User',4,'API Token','3e017bc2de4a4ade358d15078b0be9075f62fedb40ed54a92641143c315afb35','[\"*\"]',NULL,'2022-05-23 08:10:32','2022-05-23 08:10:32'),(5,'App\\Models\\User',5,'API Token','4c9a7dca482126f171274c0daca82fb59a76ce4f3692e80d90ea40bf9475c83d','[\"*\"]',NULL,'2022-05-23 08:12:11','2022-05-23 08:12:11'),(6,'App\\Models\\User',6,'API Token','31d44b15d3ed62ce0280f7700a6887aaa3eb1eb00cca5d5af214ecab012320e2','[\"*\"]',NULL,'2022-05-23 08:15:09','2022-05-23 08:15:09'),(7,'App\\Models\\User',7,'API Token','6c47ebccba9c4d3ab0c6550f781e857077784e7c43d9b04be2c8382c67a24a54','[\"*\"]',NULL,'2022-05-23 08:18:47','2022-05-23 08:18:47'),(8,'App\\Models\\User',8,'API Token','8110c73c8f717fc65f5cbdf60b733e63f3c9a154b757e4e2e07ac8f2866f7593','[\"*\"]',NULL,'2022-05-23 08:24:20','2022-05-23 08:24:20'),(9,'App\\Models\\User',9,'API Token','1afbfd0c4dde115acd874003768046ca32380d7d1f76de16b953ad04c07e1ba3','[\"*\"]',NULL,'2022-05-23 08:27:52','2022-05-23 08:27:52'),(10,'App\\Models\\User',10,'API Token','d19a2e3d57fac164806e297536b083806c6bf3af77360e4cb24e4a1956cdebd6','[\"*\"]',NULL,'2022-05-23 08:29:09','2022-05-23 08:29:09'),(11,'App\\Models\\User',11,'API Token','e3e2f81d0a5f3952a2dfc88a474a35b64ee43666528d2bdf4a31c2a7a1222171','[\"*\"]',NULL,'2022-05-23 08:29:51','2022-05-23 08:29:51'),(12,'App\\Models\\User',12,'API Token','0dc097aec405d4aa4e8a528800d0c188fbc10cc65b26b18fd465fbcbdd5384a9','[\"*\"]',NULL,'2022-05-23 08:30:38','2022-05-23 08:30:38'),(13,'App\\Models\\User',13,'API Token','d6765fd7e01b629242a0a1a3c89efb1ee7634a84e31c271b28783d78fcb2bc52','[\"*\"]',NULL,'2022-05-23 08:31:39','2022-05-23 08:31:39'),(14,'App\\Models\\User',14,'API Token','9a58d692ec060f4f68529464b073147528d41a0b9cbc8421b6cec26154bcfff1','[\"*\"]',NULL,'2022-05-23 08:35:08','2022-05-23 08:35:08'),(15,'App\\Models\\User',15,'API Token','09eedf7aa26286a6a6611762f9057aa674db4de417718534a6360b6ece24b32f','[\"*\"]',NULL,'2022-05-23 08:37:22','2022-05-23 08:37:22'),(16,'App\\Models\\User',16,'API Token','0bd218646e78cef30d0a0864dd6b8ca5a7e4e3060bd9918af662e172f992969b','[\"*\"]',NULL,'2022-05-23 08:39:04','2022-05-23 08:39:04'),(17,'App\\Models\\User',17,'API Token','0486c02dd4f54dc89e614ffddd8b867b2263bc1cd87903994919ddc9d92dad00','[\"*\"]',NULL,'2022-05-23 08:41:05','2022-05-23 08:41:05'),(18,'App\\Models\\User',18,'API Token','29e3270c923747bf63132e9ca06cc96bbc16e33e3fe9c42510bc3f77258f5ee8','[\"*\"]',NULL,'2022-05-23 08:43:30','2022-05-23 08:43:30'),(19,'App\\Models\\User',19,'API Token','c5a187973817fcc3ace190e2375d98aef8adc115f22704d940654aa0785824fd','[\"*\"]',NULL,'2022-05-23 08:44:21','2022-05-23 08:44:21'),(20,'App\\Models\\User',20,'API Token','21486f1c4ba7f101117c7fb02155fa3c834a75e7ba60048eee1893aadeb707f7','[\"*\"]',NULL,'2022-05-23 08:45:27','2022-05-23 08:45:27'),(21,'App\\Models\\User',21,'API Token','bfe924c7c1bf971adc42c3a5f1de9fd4b218fec600ce248b165c58bc405af53e','[\"*\"]',NULL,'2022-05-23 08:46:48','2022-05-23 08:46:48'),(22,'App\\Models\\User',22,'API Token','a46d1996021afc12f3d47f682156a9d8799e06851794f357b4f247d4b8072596','[\"*\"]',NULL,'2022-05-23 08:47:47','2022-05-23 08:47:47'),(23,'App\\Models\\User',23,'API Token','885baa8ad42618f909dd021c70493d6067c3ceae5e24e409777694eb8b475689','[\"*\"]',NULL,'2022-05-23 08:51:03','2022-05-23 08:51:03'),(24,'App\\Models\\User',24,'API Token','164684bb7952d2557c9b37b86ce28647e1ab9c6fb8321a3ed5795c7bb611cce1','[\"*\"]',NULL,'2022-05-23 08:55:07','2022-05-23 08:55:07'),(25,'App\\Models\\User',25,'API Token','909928c7624106dcb5c38d83ee7b7c470d30ca1451a112fc2e6e46d86ed033fb','[\"*\"]',NULL,'2022-05-25 11:57:45','2022-05-25 11:57:45'),(26,'App\\Models\\User',26,'API Token','2a781e14fc03660e15521939e78f01c9b18f9b450126ff1eae290bd82748d296','[\"*\"]',NULL,'2022-05-25 12:02:29','2022-05-25 12:02:29'),(27,'App\\Models\\User',27,'API Token','7ca50bf438f80944ce7d54751d3d263756b051bc5b26c749da8d15adcabb6e62','[\"*\"]',NULL,'2022-05-25 12:05:32','2022-05-25 12:05:32'),(28,'App\\Models\\User',28,'API Token','f83167b8abf138689f656dd8a4a97445c9eb1c5e44f5cea40e8f380c46caed9c','[\"*\"]',NULL,'2022-05-25 12:08:51','2022-05-25 12:08:51'),(29,'App\\Models\\User',29,'API Token','89181dad3dab6f7c7f42a618f37a5d4706f3149159930c3a33e9c4363e582b2f','[\"*\"]',NULL,'2022-05-25 12:09:53','2022-05-25 12:09:53'),(30,'App\\Models\\User',30,'API Token','c7354ad94ac464ab97519e654202c79168994ded1e14e6b6e1f14c51e231c0e2','[\"*\"]',NULL,'2022-05-25 12:10:27','2022-05-25 12:10:27'),(31,'App\\Models\\User',31,'API Token','58d6a20d8562cacb89042cd6e8acc18fb60173bbd6fe9912e004fb273d7aa792','[\"*\"]',NULL,'2022-05-25 12:11:55','2022-05-25 12:11:55'),(32,'App\\Models\\User',32,'API Token','36f37ae00ec011353202e3242995b02ff985c7d19f7d68ebe402181c4421b593','[\"*\"]',NULL,'2022-05-25 12:13:41','2022-05-25 12:13:41'),(33,'App\\Models\\User',1,'API Token','736e2379908e2c244449e8124e7e6ac716bdb701da11d3163c6d30171968eb3f','[\"*\"]',NULL,'2022-05-25 12:29:19','2022-05-25 12:29:19'),(34,'App\\Models\\User',1,'API Token','51af48fc9d9fdebaf4450c3da19b7f2ee5682872e275978d93bf747926f5d604','[\"*\"]',NULL,'2022-05-25 12:32:37','2022-05-25 12:32:37'),(35,'App\\Models\\User',1,'API Token','c72222e113b28216afa170d073f88b1ffde38802582516a7e14273f8c9c1ad1e','[\"*\"]',NULL,'2022-05-25 12:45:13','2022-05-25 12:45:13');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Juboraj Naofel','jn@gmail.com',NULL,'$2y$10$5edujRLf82o92ULwkAMDN.IhkHXuRRC8IEr25Rxy38QvRwGDf5nsy',NULL,'2022-05-25 12:29:19','2022-05-25 12:29:19');
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

-- Dump completed on 2022-05-26  1:19:01
