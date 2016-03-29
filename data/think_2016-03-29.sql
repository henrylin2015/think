# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.27)
# Database: think
# Generation Time: 2016-03-29 09:01:27 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table tp_admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tp_admin`;

CREATE TABLE `tp_admin` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `companyid` mediumint(8) unsigned NOT NULL COMMENT '公司id',
  `pid` mediumint(8) NOT NULL COMMENT '父id',
  `username` char(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `nickname` char(20) NOT NULL DEFAULT '' COMMENT '昵称',
  `regdate` int(10) unsigned NOT NULL COMMENT '注册时间',
  `lastdate` int(10) unsigned NOT NULL COMMENT '最后一次登录时间',
  `regip` char(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `lastip` char(15) NOT NULL DEFAULT '' COMMENT '最后一次登录ip',
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `email` char(32) NOT NULL DEFAULT '' COMMENT '邮箱',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定',
  `vip` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否会员',
  `overduedate` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '账户过期时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态-用于软删除',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `email` (`email`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `tp_admin` WRITE;
/*!40000 ALTER TABLE `tp_admin` DISABLE KEYS */;

INSERT INTO `tp_admin` (`userid`, `companyid`, `pid`, `username`, `password`, `nickname`, `regdate`, `lastdate`, `regip`, `lastip`, `loginnum`, `email`, `mobile`, `islock`, `vip`, `overduedate`, `status`)
VALUES
	(5,1,1,'admin','admin','henry',0,1459236860,'127.0.0.1','127.0.0.1',14,'henry@admin.com','',0,0,0,1),
	(6,2,0,'test','test','test',1459241276,1459241276,'','',0,'test@sina.com','',0,0,1,1),
	(7,1,0,'sss','sss','sss',1459242036,1459242051,'','',1,'sss@admin.com','',0,0,1,1);

/*!40000 ALTER TABLE `tp_admin` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
