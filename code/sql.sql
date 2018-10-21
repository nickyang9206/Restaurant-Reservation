-- --------------------------------------------------------
-- Host:                                 119.23.215.203
-- Sever version:                        5.7.23-0ubuntu0.16.04.1 - (Ubuntu)
-- OP system:                            Linux
-- HeidiSQL version:                     9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 
CREATE DATABASE IF NOT EXISTS `ctdz` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ctdz`;

-- 
CREATE TABLE IF NOT EXISTS `tokens` (
  `user_id` int(11) NOT NULL,
  `token` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` (`user_id`, `token`) VALUES
	(1, 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsImlkZW50aXR5IjoxfQ.GTvOJ755VJM4JygFj97JK5wXirs5yfM4viy-ukdTfdM');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;

-- 
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `login_ip` varchar(50) DEFAULT NULL,
  `password` varchar(120) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `identity` int(11) NOT NULL DEFAULT '1' COMMENT '1.user,2.merchant',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- 
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `login_ip`, `password`, `created_at`, `updated_at`, `identity`) VALUES
	(1, 'admin', '127.0.0.1', '123456', '2018-10-18 20:31:50', '2018-10-19 12:00:55', 1),
	(2, 'user1', '', '123456', '2018-10-18 22:26:26', NULL, 1),
	(3, 'user2', '', '123456', '2018-10-18 22:26:34', NULL, 1),
	(4, 'lblblong', NULL, '123456', '2018-10-19 11:25:14', NULL, 1),
	(9, 'iiii', NULL, '123456', '2018-10-19 12:00:39', NULL, 1),
	(10, 'gg', NULL, '213456', '2018-10-19 22:20:09', NULL, 1),
	(11, 'adm', NULL, '123456', '2018-10-19 22:25:55', NULL, 2),
	(12, '', NULL, '', '2018-10-20 16:07:30', NULL, 1),
	(13, 'ggg', NULL, '123456', '2018-10-20 16:07:44', NULL, 1),
	(14, 'ggtt', NULL, '123456', '2018-10-20 16:08:20', NULL, 1),
	(15, 'ggty', NULL, '123456', '2018-10-20 16:08:33', NULL, 2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
