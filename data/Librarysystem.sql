DROP DATABASE IF EXISTS `librarysystem`;

CREATE SCHEMA `librarysystem` ;

use librarysystem;

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `tb_bookcase`
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookcase`;
CREATE TABLE `tb_bookcase` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of tb_bookcase
-- ----------------------------
INSERT INTO tb_bookcase VALUES ('49', 'VC书架');
INSERT INTO tb_bookcase VALUES ('50', 'VB书架');
INSERT INTO tb_bookcase VALUES ('51', 'Delphi书架');
INSERT INTO tb_bookcase VALUES ('46', 'PHP书架');
INSERT INTO tb_bookcase VALUES ('48', 'net书架');
INSERT INTO tb_bookcase VALUES ('37', 'ASP图书架');
INSERT INTO tb_bookcase VALUES ('47', 'JSP书架');
INSERT INTO tb_bookcase VALUES ('52', '其他');

-- ----------------------------
-- Table structure for `tb_bookinfo`
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookinfo`;
CREATE TABLE `tb_bookinfo` (
  `barcode` varchar(30) DEFAULT NULL,
  `bookname` varchar(70) DEFAULT NULL,
  `typeid` int(10) unsigned DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `translator` varchar(30) DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `price` float(8,2) DEFAULT NULL,
  `page` int(10) unsigned DEFAULT NULL,
  `bookcase` int(10) unsigned DEFAULT NULL,
  `storage` int(10) unsigned DEFAULT NULL,
  `inTime` date DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `del` tinyint(1) DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of tb_bookinfo
-- ----------------------------
INSERT INTO tb_bookinfo VALUES ('123456789', 'PHP数据库系统开发完全手册', '1', '邹天思、潘凯华、刘中华', 'me', '7-121', '65.00', '530', '46', '666', '2007-12-07', '1', '0', '5');
INSERT INTO tb_bookinfo VALUES ('123454321', 'PHP程序开发范例宝典', '2', '邹天思、潘凯华', 'hehe', '7-121', '89.00', '730', '46', '299', '2007-12-07', '1', '0', '6');
INSERT INTO tb_bookinfo VALUES ('987654321', 'PHP函数参考大全', '3', '邹天思、潘凯华', 'me', '7-121', '99.00', '950', '46', '799', '2007-11-12', '1', '0', '2');
INSERT INTO tb_bookinfo VALUES ('9787115154101', 'Visual Basic控件参考大全', '5', '高春艳、刘彬彬', '无', '7-121', '86.00', '777', '50', '10', '2007-12-06', '1', '0', '20');

-- ----------------------------
-- Table structure for `tb_booktype`
-- ----------------------------
DROP TABLE IF EXISTS `tb_booktype`;
CREATE TABLE `tb_booktype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typename` varchar(30) DEFAULT NULL,
  `days` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of tb_booktype
-- ----------------------------
INSERT INTO tb_booktype VALUES ('1', '数据库技术', '30');
INSERT INTO tb_booktype VALUES ('2', '宝典系列', '45');
INSERT INTO tb_booktype VALUES ('3', '信息科学技术', '20');
INSERT INTO tb_booktype VALUES ('5', '计算机程序设计', '30');

-- ----------------------------
-- Table structure for `tb_borrow`
-- ----------------------------
DROP TABLE IF EXISTS `tb_borrow`;
CREATE TABLE `tb_borrow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `readerid` int(10) unsigned DEFAULT NULL,
  `bookid` int(10) DEFAULT NULL,
  `borrowTime` date DEFAULT NULL,
  `backTime` date DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `ifback` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of tb_borrow
-- ----------------------------
INSERT INTO tb_borrow VALUES ('14', '1', '6', '2007-01-01', '2007-12-06', 'Tsoft', '1');
INSERT INTO tb_borrow VALUES ('42', '1', '2', '2007-12-06', '2008-01-05', 'Tsoft', '0');
INSERT INTO tb_borrow VALUES ('49', '18', '2', '2007-12-07', '2008-01-06', 'Tsoft', '0');
INSERT INTO tb_borrow VALUES ('48', '18', '20', '2007-12-06', '2007-12-06', 'Tsoft', '1');
INSERT INTO tb_borrow VALUES ('33', '11', '2', '2007-12-05', '2007-12-05', 'Tsoft', '1');
INSERT INTO tb_borrow VALUES ('47', '18', '20', '2007-12-06', '2007-12-06', 'Tsoft', '1');
INSERT INTO tb_borrow VALUES ('46', '16', '20', '2007-12-06', '2007-12-06', 'Tsoft', '1');
INSERT INTO tb_borrow VALUES ('45', '1', '5', '2007-12-06', '2008-01-05', 'Tsoft', '0');
INSERT INTO tb_borrow VALUES ('44', '11', '2', '2007-12-06', '2008-01-05', 'Tsoft', '0');
INSERT INTO tb_borrow VALUES ('43', '1', '5', '2007-12-06', '2007-12-06', 'Tsoft', '1');

-- ----------------------------
-- Table structure for `tb_library`
-- ----------------------------
DROP TABLE IF EXISTS `tb_library`;
CREATE TABLE `tb_library` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `libraryname` varchar(50) DEFAULT NULL,
  `curator` varchar(10) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `introduce` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of tb_library
-- ----------------------------
INSERT INTO tb_library VALUES ('1', '*****师范大学图书馆', 'Zeyang', '1771797****', '上海市徐汇区******', 'zeyang**@***.com', 'http://www.xxx.com', '2020-6-25', '努力学习');

-- ----------------------------
-- Table structure for `tb_manager`
-- ----------------------------
DROP TABLE IF EXISTS `tb_manager`;
CREATE TABLE `tb_manager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `pwd` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of tb_manager
-- ----------------------------
INSERT INTO tb_manager VALUES ('1', 'Tsoft', '111');
INSERT INTO tb_manager VALUES ('22', 'lx', 'lx');
INSERT INTO tb_manager VALUES ('23', 'al', 'al');
INSERT INTO tb_manager VALUES ('2', '1', '1');
INSERT INTO tb_manager VALUES ('3', 'ZEYANG', 'ZEYANG');



-- ----------------------------
-- Table structure for `tb_parameter`
-- ----------------------------
DROP TABLE IF EXISTS `tb_parameter`;
CREATE TABLE `tb_parameter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cost` int(10) unsigned DEFAULT NULL,
  `validity` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of tb_parameter
-- ----------------------------
INSERT INTO tb_parameter VALUES ('1', '120', '12');

-- ----------------------------
-- Table structure for `tb_publishing`
-- ----------------------------
DROP TABLE IF EXISTS `tb_publishing`;
CREATE TABLE `tb_publishing` (
  `ISBN` varchar(20) DEFAULT NULL,
  `pubname` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of tb_publishing
-- ----------------------------
INSERT INTO tb_publishing VALUES ('7-115', '清华出版社');
INSERT INTO tb_publishing VALUES ('7-111', '机械工业出版');
INSERT INTO tb_publishing VALUES ('7-121', '人民邮电出版社');

-- ----------------------------
-- Table structure for `tb_purview`
-- ----------------------------
DROP TABLE IF EXISTS `tb_purview`;
CREATE TABLE `tb_purview` (
  `id` int(11) NOT NULL DEFAULT '0',
  `sysset` tinyint(1) DEFAULT '0',
  `readerset` tinyint(1) DEFAULT '0',
  `bookset` tinyint(1) DEFAULT '0',
  `borrowback` tinyint(1) DEFAULT '0',
  `sysquery` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of tb_purview
-- ----------------------------
INSERT INTO tb_purview VALUES ('22', '1', '1', '1', '0', '0');
INSERT INTO tb_purview VALUES ('1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `tb_reader`
-- ----------------------------
DROP TABLE IF EXISTS `tb_reader`;
CREATE TABLE `tb_reader` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `barcode` varchar(30) DEFAULT NULL,
  `vocation` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `paperType` varchar(10) DEFAULT NULL,
  `paperNO` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `remark` mediumtext,
  `typeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of tb_reader
-- ----------------------------
INSERT INTO tb_reader VALUES ('1', '陈丽', '女', '123456789', '程序员', '1980-09-29', '身份证', '22010412331***', '13633333****', 'wgh***@s**u.com', '2006-05-27', 'admin', '哈哈', '4');
INSERT INTO tb_reader VALUES ('2', '张勇', '男', '3214555555', '职员', '1983-02-22', '军官证', '2201043222******', '113655422555', 'dream****@**u.com', '2006-05-27', 'admin', '??', '1');
INSERT INTO tb_reader VALUES ('16', '小丽', '女', '123456', '程序员', '1985-02-25', '身份证', '54515452***', '136********', 'xl***@163.com', '2007-12-06', 'Tsoft', '无', '16');
INSERT INTO tb_reader VALUES ('8', '纯净水', '女', '13579', '职员', '1982-12-14', '身份证', '2220000000***', '1375666***', '44**@sina.com', '2006-06-10', 'mr', '图书迷', '14');
INSERT INTO tb_reader VALUES ('19', '小刚', '男', '222222', '硬件维护', '1982-05-06', '身份证', '2132123*****', '136********', 'xg**@163.com', '2007-12-06', 'Tsoft', '无', '20');
INSERT INTO tb_reader VALUES ('11', '小凡', '女', '1255***', 'IT业', '1980-02-25', '工作证', '55255**', '421552***', '53**34@sina.com', '2007-12-01', 'Tsoft', '我是一个图书迷', '13');
INSERT INTO tb_reader VALUES ('18', '小欣', '女', '111111', '程序员', '1985-02-25', '身份证', '21212345546***', '136********', 'xx***@163.com', '2007-12-06', 'Tsoft', '无', '14');

-- ----------------------------
-- Table structure for `tb_readertype`
-- ----------------------------
DROP TABLE IF EXISTS `tb_readertype`;
CREATE TABLE `tb_readertype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `number` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of tb_readertype
-- ----------------------------
INSERT INTO tb_readertype VALUES ('1', '学生', '4');
INSERT INTO tb_readertype VALUES ('4', '公务员', '5');
INSERT INTO tb_readertype VALUES ('14', '图书爱好者', '3');
INSERT INTO tb_readertype VALUES ('15', '教师', '2');
INSERT INTO tb_readertype VALUES ('16', '程序员', '2');
INSERT INTO tb_readertype VALUES ('20', '硬件维护', '10');
