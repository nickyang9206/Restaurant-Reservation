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

-- 导出  表 ctdz.bookings 结构
DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL,
  `seat_id` int(11) NOT NULL COMMENT '座位id',
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL COMMENT '指定日期',
  `message` varchar(250) NOT NULL COMMENT '文字消息',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0.待处理，1.已确认，2.已拒绝，3.已取消',
  `cause` varchar(50) DEFAULT NULL COMMENT '拒绝或取消原因',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 正在导出表  ctdz.bookings 的数据：~3 rows (大约)
DELETE FROM `bookings`;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` (`id`, `restaurant_id`, `seat_id`, `user_id`, `date`, `message`, `status`, `cause`) VALUES
	(1, 1, 1, 17, '2018-10-25', 'dsdgsdgdf', 1, NULL),
	(2, 1, 1, 17, '2018-10-26', '的方式告诉对方感到附属国', 3, NULL),
	(3, 2, 4, 17, '2018-10-25', '阿斯顿发生发射点发', 0, NULL);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
