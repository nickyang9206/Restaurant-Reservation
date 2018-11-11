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

-- 导出  表 ctdz.tokens 结构
DROP TABLE IF EXISTS `tokens`;
CREATE TABLE IF NOT EXISTS `tokens` (
  `user_id` int(11) NOT NULL,
  `token` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  ctdz.tokens 的数据：~3 rows (大约)
DELETE FROM `tokens`;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` (`user_id`, `token`) VALUES
	(18, 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6InVzZXI3IiwiaWQiOjE4LCJpZGVudGl0eSI6Mn0.8zbYj_xEcPTL6mOVkD2IiB49DXzpOnEaofbBOFb4kFg'),
	(17, 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6InVzZXI1IiwiaWQiOjE3LCJpZGVudGl0eSI6MX0.hOE7TAX0Ud7fViCN_OYsiHJlzniyrn6-wFu6wBZmTYo'),
	(1, 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsImlkZW50aXR5IjoyfQ.bB5RU7TgBcBKCSoJYYmXMLKKIlKpMw7Hd8SscB69E4c');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
