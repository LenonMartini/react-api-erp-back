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


-- Copiando estrutura do banco de dados para portal
CREATE DATABASE IF NOT EXISTS `portal` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `portal`;

-- Copiando estrutura para tabela portal.companies
CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `social_reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abbreviated` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ie` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `im` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` bigint(20) NOT NULL DEFAULT 1,
  `cep` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `andress` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) NOT NULL DEFAULT 0,
  `district` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_cnpj_unique` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela portal.companies: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` (`id`, `social_reason`, `abbreviated`, `cnpj`, `fone`, `ie`, `im`, `email`, `status`, `cep`, `andress`, `number`, `district`, `city`, `state`, `uf`) VALUES
	(4, 'Hospital de Caridade Dona Darcy Vargas', 'Hospital de Caridade Dona Darcy Vargas', '80.672.561/0001-76', '(42) 3457-1300', 'Isernto', '', '', 1, '84550-000', 'Rua Armando Costa', 619, 'centro', 'Rebouças', 'Parana', 'PR'),
	(8, 'teste', 'teste', '22222222222222', '(42) 3457-1257', 'teste', NULL, 'teste@teste', 1, '84550-000', 'teste', 1, 'centro', 'Rebouças', 'Parana', 'PR');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;

-- Copiando estrutura para tabela portal.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(10) unsigned NOT NULL DEFAULT 0,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grouppermissions_company_id_foreign` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela portal.groups: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`id`, `company_id`, `name`, `parameters`) VALUES
	(1, 4, 'Administrador', '1,2,3,4,5,6,7'),
	(2, 4, 'Padrão', '1');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- Copiando estrutura para tabela portal.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acao` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_logs_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela portal.logs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- Copiando estrutura para tabela portal.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela portal.migrations: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(2, '2021_09_16_165416_createalltables', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Copiando estrutura para tabela portal.partners
CREATE TABLE IF NOT EXISTS `partners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_company` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(150) NOT NULL DEFAULT '0',
  `image` varchar(150) NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_company` (`id_company`),
  CONSTRAINT `FK__companies` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela portal.partners: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `partners` DISABLE KEYS */;
INSERT INTO `partners` (`id`, `id_company`, `name`, `image`, `status`) VALUES
	(1, 4, 'Funeraria Nossa Senhora da Luz e Cristo Rei', 'drabecki.jpg', 'Ativo'),
	(2, 4, 'Compensados Drabecki', '', 'Ativo'),
	(3, 4, 'Açougue Sinhori', '', 'Ativo'),
	(4, 4, 'Farmacia Santo Antonio', '', 'Ativo');
/*!40000 ALTER TABLE `partners` ENABLE KEYS */;

-- Copiando estrutura para tabela portal.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_company_id_foreign` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela portal.permissions: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `company_id`, `name`) VALUES
	(1, 4, 'view_painel'),
	(2, 4, 'view_groups'),
	(3, 4, 'view_add_groups'),
	(4, 4, 'add_group'),
	(5, 4, 'edit_group'),
	(6, 4, 'delete_group'),
	(7, 4, 'view_edit_group');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Copiando estrutura para tabela portal.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela portal.personal_access_tokens: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Copiando estrutura para tabela portal.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) unsigned DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_cpf_unique` (`cpf`),
  KEY `FK_users_companies` (`company_id`),
  KEY `users_grouppermission_id_foreign` (`group_id`) USING BTREE,
  CONSTRAINT `FK_users_companies` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela portal.users: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `company_id`, `group_id`, `name`, `email`, `cpf`, `password`, `token`, `status`) VALUES
	(17, 4, 1, 'Lenon Emanuel Martini', 'lenonmartini21@gmail.com', '083.452.559-30', '$2y$10$YiyMWBxDoJRKW7v5qVgO.OKp2DdxPDNp9g/04Fnv3yhVwoR7Rf4DO', '0408b08bea46d30368c78cc51dd82ee4', 1),
	(19, 4, 2, 'teste', 'teste@gmail.com', '111.111.111-11', '$2y$10$YiyMWBxDoJRKW7v5qVgO.OKp2DdxPDNp9g/04Fnv3yhVwoR7Rf4DO', '79dc42e55d7001e6062ef430ec97ed60', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
