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

-- 导出  表 ctdz.dishs 结构
DROP TABLE IF EXISTS `dishs`;
CREATE TABLE IF NOT EXISTS `dishs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- 正在导出表  ctdz.dishs 的数据：~8 rows (大约)
DELETE FROM `dishs`;
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

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
