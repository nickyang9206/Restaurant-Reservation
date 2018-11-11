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

-- 导出  表 ctdz.seats 结构
DROP TABLE IF EXISTS `seats`;
CREATE TABLE IF NOT EXISTS `seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL COMMENT '餐厅',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '座位总数',
  `name` varchar(120) NOT NULL COMMENT '名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='座位';

-- 正在导出表  ctdz.seats 的数据：~9 rows (大约)
DELETE FROM `seats`;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` (`id`, `restaurant_id`, `total`, `name`) VALUES
	(1, 1, 20, 'Hall'),
	(2, 1, 10, 'Private room'),
	(3, 2, 10, 'Aisle'),
	(4, 2, 5, 'A区大厅'),
	(5, 14, 10, '大厅'),
	(6, 4, 5, '春风'),
	(7, 4, 5, '夏雨'),
	(8, 4, 5, '秋凉'),
	(9, 3, 10, '非酋区');
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
