-- --------------------------------------------------------
-- 主机:                           119.23.215.203
-- 服务器版本:                        5.7.23-0ubuntu0.16.04.1 - (Ubuntu)
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 ctdz.users 结构
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `login_ip` varchar(50) DEFAULT NULL,
  `password` varchar(120) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `identity` int(11) NOT NULL DEFAULT '1' COMMENT '用户身份1. 普通用户，2.餐厅用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- 正在导出表  ctdz.users 的数据：~6 rows (大约)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `login_ip`, `password`, `created_at`, `updated_at`, `identity`) VALUES
	(1, 'admin', '127.0.0.1', '123456', '2018-10-18 20:31:50', '2018-10-19 12:00:55', 2),
	(2, 'user1', '', '123456', '2018-10-18 22:26:26', NULL, 2),
	(3, 'user2', '', '123456', '2018-10-18 22:26:34', NULL, 2),
	(16, 'user4', NULL, '123456', '2018-10-25 14:10:01', NULL, 2),
	(17, 'user5', NULL, '123456', '2018-10-25 14:10:29', NULL, 1),
	(18, 'user7', NULL, '123456', '2018-10-25 22:02:59', NULL, 2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
