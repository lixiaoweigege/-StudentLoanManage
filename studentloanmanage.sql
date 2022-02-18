/*
Navicat MySQL Data Transfer

Source Server         : 黎小伟哥哥本地连接
Source Server Version : 50528
Source Host           : 127.0.0.1:3306
Source Database       : studentloanmanage

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2020-06-06 15:30:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for conloaner
-- ----------------------------
DROP TABLE IF EXISTS `conloaner`;
CREATE TABLE `conloaner` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) DEFAULT NULL,
  `cidcard` varchar(50) DEFAULT NULL,
  `cscardtart` varchar(50) DEFAULT NULL,
  `ccardend` varchar(50) DEFAULT NULL,
  `cphone` char(11) DEFAULT NULL,
  `cbody` varchar(50) DEFAULT NULL,
  `caddress` varchar(50) DEFAULT NULL,
  `coaddress` varchar(50) DEFAULT NULL,
  `user_idcard` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`,`user_idcard`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
  `id` int(11) NOT NULL,
  `ayear` varchar(50) DEFAULT NULL,
  `pname` varchar(50) DEFAULT NULL,
  `pidcard` varchar(50) DEFAULT NULL,
  `pphone` char(11) DEFAULT NULL,
  `pcollege` varchar(50) DEFAULT NULL,
  `pyear` varchar(50) DEFAULT NULL,
  `cname` varchar(50) DEFAULT NULL,
  `relative` varchar(50) DEFAULT NULL,
  `cidcard` varchar(50) DEFAULT NULL,
  `cphone` char(11) DEFAULT NULL,
  `caddress` varchar(50) DEFAULT NULL,
  `cobank` varchar(50) DEFAULT NULL,
  `cobankphone` varchar(50) DEFAULT NULL,
  `cobankaddress` varchar(50) DEFAULT NULL,
  `coentrust` varchar(50) DEFAULT NULL,
  `coentrustcontacts` varchar(50) DEFAULT NULL,
  `coentrustaddress` varchar(50) DEFAULT NULL,
  `coentrustphone` varchar(50) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `amountchinese` varchar(50) DEFAULT NULL,
  `coendyear` varchar(50) DEFAULT NULL,
  `coaccount` varchar(50) DEFAULT NULL,
  `cointerestrate` varchar(50) DEFAULT NULL,
  `conumber` varchar(50) NOT NULL,
  PRIMARY KEY (`id`,`conumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for loanapply
-- ----------------------------
DROP TABLE IF EXISTS `loanapply`;
CREATE TABLE `loanapply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) NOT NULL,
  `pidcard` varchar(50) NOT NULL,
  `paddress` varchar(50) NOT NULL,
  `phighschool` varchar(50) NOT NULL,
  `pphone` char(11) NOT NULL,
  `pcollege` varchar(50) NOT NULL,
  `pmajor` varchar(50) NOT NULL,
  `pyear` varchar(50) NOT NULL,
  `pendyear` varchar(50) NOT NULL,
  `cname` varchar(50) NOT NULL,
  `relative` varchar(50) NOT NULL,
  `cidcard` varchar(50) NOT NULL,
  `cphone` char(11) NOT NULL,
  `caddress` varchar(50) NOT NULL,
  `amount` varchar(50) NOT NULL,
  `ayear` varchar(50) NOT NULL,
  `aterm` varchar(50) NOT NULL,
  `areason` text NOT NULL,
  `astate` varchar(50) NOT NULL DEFAULT '待审核',
  `gaineddate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for personal
-- ----------------------------
DROP TABLE IF EXISTS `personal`;
CREATE TABLE `personal` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) DEFAULT NULL,
  `pidcard` varchar(50) NOT NULL DEFAULT '000000000000000000',
  `pscardtart` varchar(50) DEFAULT NULL,
  `pcardend` varchar(50) DEFAULT NULL,
  `psex` varchar(50) NOT NULL DEFAULT '男',
  `pnation` varchar(50) DEFAULT NULL,
  `phighschool` varchar(50) DEFAULT NULL,
  `phukou` varchar(50) DEFAULT NULL,
  `ploanarea` varchar(50) DEFAULT NULL,
  `paddress` varchar(50) DEFAULT NULL,
  `pphone` char(11) DEFAULT NULL,
  `pemail` varchar(50) DEFAULT NULL,
  `pqq` varchar(50) DEFAULT NULL,
  `pweixin` varchar(50) DEFAULT NULL,
  `prname` varchar(50) DEFAULT NULL,
  `prphone` char(11) DEFAULT NULL,
  `pridcard` varchar(50) DEFAULT NULL,
  `pcollege` varchar(50) DEFAULT NULL,
  `pdept` varchar(50) DEFAULT NULL,
  `pmajor` varchar(50) DEFAULT NULL,
  `pyear` varchar(50) DEFAULT NULL,
  `psno` int(11) DEFAULT NULL,
  `pendyear` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pid`,`pidcard`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for repayment
-- ----------------------------
DROP TABLE IF EXISTS `repayment`;
CREATE TABLE `repayment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ayear` varchar(50) DEFAULT NULL,
  `conumber` varchar(50) DEFAULT NULL,
  `coaccount` varchar(50) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `total` varchar(50) DEFAULT NULL,
  `ramount` varchar(50) DEFAULT NULL,
  `rapplydate` varchar(50) DEFAULT NULL,
  `ractualdate` varchar(50) DEFAULT NULL,
  `nowarrears` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL DEFAULT '111111',
  `user_idcard` varchar(50) NOT NULL DEFAULT '000000000000000000',
  `user_email` varchar(50) DEFAULT NULL,
  `user_state` varchar(50) NOT NULL DEFAULT '学生',
  PRIMARY KEY (`user_id`,`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
