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


-- 导出 ctdz 的数据库结构
CREATE DATABASE IF NOT EXISTS `ctdz` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ctdz`;

-- 导出  表 ctdz.bookings 结构
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
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` (`id`, `restaurant_id`, `seat_id`, `user_id`, `date`, `message`, `status`, `cause`) VALUES
	(1, 1, 1, 17, '2018-10-25', 'dsdgsdgdf', 1, NULL),
	(2, 1, 1, 17, '2018-10-26', '的方式告诉对方感到附属国', 3, NULL),
	(3, 2, 4, 17, '2018-10-25', '阿斯顿发生发射点发', 0, NULL);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;

-- 导出  表 ctdz.dishs 结构
CREATE TABLE IF NOT EXISTS `dishs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- 正在导出表  ctdz.dishs 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `dishs` DISABLE KEYS */;
INSERT INTO `dishs` (`id`, `restaurant_id`, `name`, `img`) VALUES
	(1, 1, 'Gold shark fin', 'https://gss0.bdstatic.com/5eZ1ciub_Q63otebn9fN2DJv/upload/2013/05-11/1368267329633-2938.jpg'),
	(2, 2, 'Spicy Shrimp', 'https://gss0.bdstatic.com/5eZ1ciub_Q63otebn9fN2DJv/upload/2013/05-11/1368267329135-3771.jpg'),
	(3, 1, 'Watermelon dish', 'https://gss0.bdstatic.com/5eZ1ciub_Q63otebn9fN2DJv/upload/2013/05-11/1368267328280-3852.jpg'),
	(4, 1, '油麦菜', 'https://www.zuocai.tv/d/file/content/cpimg/2017/08/09/1gcvfemfnns.jpg'),
	(5, 1, 'Melon fried meat', 'https://www.zuocai.tv/d/file/content/cpimg/2017/08/08/pex4kphk5y2.jpg'),
	(6, 4, '春风', 'https://www.zuocai.tv/d/file/content/cpimg/2018/10/25/54lnnesbo30.jpg'),
	(7, 4, '金脆角', 'https://www.zuocai.tv/d/file/content/cpimg/2018/10/23/nj453kqcu00.jpg'),
	(8, 14, '黑色西瓜', 'https://gss0.bdstatic.com/5eZ1ciub_Q63otebn9fN2DJv/upload/2013/05-11/1368267329135-3771.jpg');
/*!40000 ALTER TABLE `dishs` ENABLE KEYS */;

-- 导出  表 ctdz.restaurants 结构
CREATE TABLE IF NOT EXISTS `restaurants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `type` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- 正在导出表  ctdz.restaurants 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` (`id`, `user_id`, `name`, `type`) VALUES
	(1, 1, 'Interesting fish', 'Chinese food'),
	(2, 2, '辣不怕', 'Chinese food'),
	(3, 3, 'GAOMO Cafe', 'Cafe'),
	(4, 16, '十里', 'Chinese food'),
	(14, 18, '金色麦田', 'Chinese food');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;

-- 导出  表 ctdz.seats 结构
CREATE TABLE IF NOT EXISTS `seats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL COMMENT '餐厅',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '座位总数',
  `name` varchar(120) NOT NULL COMMENT '名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='座位';

-- 正在导出表  ctdz.seats 的数据：~9 rows (大约)
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

-- 导出  表 ctdz.tokens 结构
CREATE TABLE IF NOT EXISTS `tokens` (
  `user_id` int(11) NOT NULL,
  `token` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  ctdz.tokens 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` (`user_id`, `token`) VALUES
	(18, 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6InVzZXI3IiwiaWQiOjE4LCJpZGVudGl0eSI6Mn0.8zbYj_xEcPTL6mOVkD2IiB49DXzpOnEaofbBOFb4kFg'),
	(17, 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6InVzZXI1IiwiaWQiOjE3LCJpZGVudGl0eSI6MX0.hOE7TAX0Ud7fViCN_OYsiHJlzniyrn6-wFu6wBZmTYo'),
	(1, 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiaWQiOjEsImlkZW50aXR5IjoyfQ.bB5RU7TgBcBKCSoJYYmXMLKKIlKpMw7Hd8SscB69E4c');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;

-- 导出  表 ctdz.users 结构
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
