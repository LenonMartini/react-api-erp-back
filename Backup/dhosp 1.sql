-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.19-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para dhosp
CREATE DATABASE IF NOT EXISTS `dhosp` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `dhosp`;

-- Copiando estrutura para tabela dhosp.companies
CREATE TABLE IF NOT EXISTS `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) NOT NULL,
  `social_reason` varchar(255) NOT NULL,
  `abbreviated` varchar(255) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `fone` varchar(20) NOT NULL,
  `ie` varchar(20) DEFAULT NULL,
  `im` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `image_logo` varchar(100) DEFAULT NULL,
  `status` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_cnpj_unique` (`cnpj`),
  UNIQUE KEY `companies_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela dhosp.companies: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` (`id`, `location_id`, `social_reason`, `abbreviated`, `cnpj`, `fone`, `ie`, `im`, `email`, `image_logo`, `status`) VALUES
	(1, 1, 'Hospital de Caridade Dona Darcy Vargas', 'Hospital Darcy Vargas', '80.672.561/0001-76', '(42) 3457-1300', NULL, NULL, 'hospitaldarcyvargas.com.br', 'logo.png', 1),
	(2, 1, 'Teste', 'teste', '11.111.111/1111-11', '(42) 3457-2135', '123', '123', 'teste@teste.com', 'teste.logo', 2);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;

-- Copiando estrutura para tabela dhosp.locations
CREATE TABLE IF NOT EXISTS `locations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cep` varchar(15) NOT NULL,
  `andress` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `number` int(11) DEFAULT 0,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `uf` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela dhosp.locations: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` (`id`, `cep`, `andress`, `district`, `number`, `city`, `state`, `uf`) VALUES
	(1, '84.550-000', 'Rua Armando Costa', 'centro', 619, 'Rebouças', 'Paraná', 'PR');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;

-- Copiando estrutura para tabela dhosp.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela dhosp.migrations: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(5, '2021_10_30_083806_create_companies_table', 1),
	(6, '2021_10_30_084157_create_locations_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Copiando estrutura para tabela dhosp.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` bigint(20) DEFAULT 0,
  `company_id` bigint(20) DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `location_id` (`location_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela dhosp.users: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `location_id`, `company_id`, `name`, `email`, `cpf`, `password`, `status`) VALUES
	(3, 0, 0, 'Lenon Emanuel Martini', 'lenonmartini21@gmail.com', '083.452.559-30', '$2y$10$kjgcEd4dlicLOCCLCDysRO78.pwNOmsMfLbcs/5vdVjadNdIwhII.', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
