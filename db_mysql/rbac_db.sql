-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017-07-20 11:15:54
-- 服务器版本： 5.6.36-log
-- PHP Version: 7.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rbac_db`
--

-- --------------------------------------------------------

--
-- 表的结构 `access`
--

CREATE TABLE IF NOT EXISTS `access` (
  `id` int(11) unsigned NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '权限名称',
  `urls` varchar(1000) NOT NULL DEFAULT '' COMMENT 'json 数组',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1：有效 0：无效',
  `updated_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '插入时间'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='权限详情表';

--
-- 转存表中的数据 `access`
--

INSERT INTO `access` (`id`, `title`, `urls`, `status`, `updated_time`, `created_time`) VALUES
(1, '测试一', '["test\\/page1"]', 1, '2017-07-19 05:23:53', '2017-07-19 05:23:53'),
(2, '测试二', '["test\\/page2"]', 1, '2017-07-19 05:24:45', '2017-07-19 05:24:45'),
(3, '测试三', '["test\\/page3"]', 1, '2017-07-19 05:25:06', '2017-07-19 05:25:06'),
(4, '测试四', '["test\\/page4"]', 1, '2017-07-19 05:25:27', '2017-07-19 05:25:27'),
(5, '测试五', '["test\\/page5"]', 1, '2017-07-19 05:25:52', '2017-07-19 05:25:52');

-- --------------------------------------------------------

--
-- 表的结构 `app_access_log`
--

CREATE TABLE IF NOT EXISTS `app_access_log` (
  `id` int(11) NOT NULL,
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '品牌UID',
  `target_url` varchar(255) NOT NULL DEFAULT '' COMMENT '访问的url',
  `query_params` longtext NOT NULL COMMENT 'get和post参数',
  `ua` varchar(255) NOT NULL DEFAULT '' COMMENT '访问ua',
  `ip` varchar(32) NOT NULL DEFAULT '' COMMENT '访问ip',
  `note` varchar(1000) NOT NULL DEFAULT '' COMMENT 'json格式备注字段',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8 COMMENT='用户操作记录表';

--
-- 转存表中的数据 `app_access_log`
--

INSERT INTO `app_access_log` (`id`, `uid`, `target_url`, `query_params`, `ua`, `ip`, `note`, `created_time`) VALUES
(1, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:10:55'),
(2, 0, '/user/vlogin?uid=1', '{"uid":"1"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:11:10'),
(3, 1, '/', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:11:10'),
(4, 1, '/user/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:11:17'),
(5, 1, '/user/set', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:11:23'),
(6, 1, '/user/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:11:39'),
(7, 1, '/role/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:11:40'),
(8, 1, '/access/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:11:43'),
(9, 1, '/role/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:11:45'),
(10, 1, '/user/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:11:47'),
(11, 1, '/test/page1', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:11:51'),
(12, 1, '/test/page2', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:11:53'),
(13, 1, '/test/page3', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:11:54'),
(14, 1, '/test/page4', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:11:56'),
(15, 1, '/test/page5', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:11:57'),
(16, 1, '/gii', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:15:59'),
(17, 1, '/index.php', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:16:33'),
(18, 1, '/index.php?r=gii', '{"r":"gii"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:16:46'),
(19, 1, '/index.php/gii', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:16:55'),
(20, 1, '/index.php/gii', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:19:14'),
(21, 1, '/gii', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:19:25'),
(22, 1, '/test/page1', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:19:56'),
(23, 1, '/', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:20:00'),
(24, 1, '/user/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:20:11'),
(25, 1, '/user/set?id=1', '{"id":"1"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:20:17'),
(26, 1, '/user/set', '{"id":"1","name":"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458","email":"apanly@163.com"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:20:20'),
(27, 1, '/user/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:20:22'),
(28, 1, '/user/set', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:20:25'),
(29, 1, '/user/set', '{"id":"0","name":"lara","email":"1260127789@qq.com"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:20:48'),
(30, 1, '/user/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:20:49'),
(31, 1, '/user/set', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:20:53'),
(32, 1, '/user/set', '{"id":"0","name":"lali","email":"15651798869@163.com"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:21:32'),
(33, 1, '/user/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:21:33'),
(34, 1, '/role/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:21:39'),
(35, 1, '/role/set', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:21:41'),
(36, 1, '/role/set', '{"id":"","name":"\\u603b\\u7ecf\\u7406"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:21:56'),
(37, 1, '/role/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:21:57'),
(38, 1, '/role/set', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:22:04'),
(39, 1, '/role/set', '{"id":"","name":"\\u9500\\u552e"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:22:13'),
(40, 1, '/role/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:22:15'),
(41, 1, '/access/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:22:22'),
(42, 1, '/access/set', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:22:26'),
(43, 1, '/role/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:22:32'),
(44, 1, '/role/access?id=2', '{"id":"2"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:22:35'),
(45, 1, '/access/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:22:39'),
(46, 1, '/access/set', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:22:43'),
(47, 1, '/test/page1', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:23:13'),
(48, 1, '/role/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:23:25'),
(49, 1, '/role/access?id=2', '{"id":"2"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:23:27'),
(50, 1, '/role/access', '{"id":"2"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:23:31'),
(51, 1, '/role/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:23:34'),
(52, 1, '/access/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:23:37'),
(53, 1, '/access/set', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:23:39'),
(54, 1, '/access/set', '{"id":"0","title":"\\u6d4b\\u8bd5\\u4e00","urls":"test\\/page1"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:23:53'),
(55, 1, '/access/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:23:55'),
(56, 1, '/role/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:24:00'),
(57, 1, '/role/access?id=2', '{"id":"2"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:24:02'),
(58, 1, '/role/access', '{"id":"2","access_ids":["1"]}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:24:11'),
(59, 1, '/role/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:24:13'),
(60, 1, '/test/page1', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:24:20'),
(61, 1, '/access/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:24:25'),
(62, 1, '/access/set', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:24:30'),
(63, 1, '/access/set', '{"id":"0","title":"\\u6d4b\\u8bd5\\u4e8c","urls":"test\\/page2"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:24:45'),
(64, 1, '/access/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:24:47'),
(65, 1, '/access/set', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:24:49'),
(66, 1, '/access/set', '{"id":"0","title":"\\u6d4b\\u8bd5\\u4e09","urls":"test\\/page3"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:25:06'),
(67, 1, '/access/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:25:08'),
(68, 1, '/access/set', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:25:10'),
(69, 1, '/access/set', '{"id":"0","title":"\\u6d4b\\u8bd5\\u56db","urls":"test\\/page4"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:25:27'),
(70, 1, '/access/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:25:30'),
(71, 1, '/access/set', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:25:35'),
(72, 1, '/access/set', '{"id":"0","title":"\\u6d4b\\u8bd5\\u4e94","urls":"test\\/page5"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:25:52'),
(73, 1, '/access/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:25:54'),
(74, 1, '/role/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:26:12'),
(75, 1, '/user/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:26:18'),
(76, 1, '/user/set?id=2', '{"id":"2"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:26:26'),
(77, 1, '/user/set', '{"id":"2","name":"lara","email":"1260127789@qq.com","role_ids":["1"]}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:26:30'),
(78, 1, '/user/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:26:33'),
(79, 1, '/user/set?id=3', '{"id":"3"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:26:35'),
(80, 1, '/user/set', '{"id":"3","name":"lali","email":"15651798869@163.com","role_ids":["2"]}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:26:39'),
(81, 1, '/user/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:26:41'),
(82, 1, '/role/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:26:44'),
(83, 1, '/role/access?id=2', '{"id":"2"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:26:48'),
(84, 1, '/role/access', '{"id":"2","access_ids":["2","1"]}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:26:52'),
(85, 1, '/role/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:26:54'),
(86, 1, '/role/access?id=1', '{"id":"1"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:26:55'),
(87, 1, '/role/access', '{"id":"1","access_ids":["5","4","3","2","1"]}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:27:02'),
(88, 1, '/role/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:27:04'),
(89, 1, '/', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:27:11'),
(90, 1, '/user/vlogin?uid=1', '{"uid":"1"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:27:57'),
(91, 1, '/', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:27:57'),
(92, 1, '/user/vlogin?uid=2', '{"uid":"2"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:28:26'),
(93, 2, '/', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:28:26'),
(94, 2, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:28:26'),
(95, 2, '/test/page1', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:28:40'),
(96, 2, '/test/page2', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:28:42'),
(97, 2, '/test/page3', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:28:43'),
(98, 2, '/test/page4', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:28:44'),
(99, 2, '/test/page5', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:28:45'),
(100, 2, '/user/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:28:49'),
(101, 2, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:28:50'),
(102, 2, '/role/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:28:51'),
(103, 2, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:28:51'),
(104, 2, '/access/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:28:53'),
(105, 2, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:28:53'),
(106, 2, '/test/page1', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:28:58'),
(107, 2, '/', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:29:00'),
(108, 2, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:29:00'),
(109, 2, '/', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:29:04'),
(110, 2, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:29:04'),
(111, 2, '/user/vlogin/?uid=3', '{"uid":"3"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:30:01'),
(112, 3, '/', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:30:01'),
(113, 3, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:30:01'),
(114, 3, '/test/page1', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:30:04'),
(115, 3, '/test/page2', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:30:05'),
(116, 3, '/test/page3', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:30:06'),
(117, 3, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:30:07'),
(118, 3, '/test/page4', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:30:09'),
(119, 3, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:30:09'),
(120, 3, '/test/page5', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:30:10'),
(121, 3, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:30:10'),
(122, 3, '/user/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:30:13'),
(123, 3, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:30:13'),
(124, 3, '/test/page1', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:30:16'),
(125, 3, '/test/page2', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:30:17'),
(126, 3, '/test/page1', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:30:19'),
(127, 3, '/test/page2', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:30:20'),
(128, 3, '/gii', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:30:53'),
(129, 3, '/', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:31:16'),
(130, 3, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:31:16'),
(131, 3, '/test/page2', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:31:27'),
(132, 3, '/test/page1', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:31:29'),
(133, 3, '/test/page1', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:31:30'),
(134, 3, '/test/page2', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:31:32'),
(135, 3, '/test/page1', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:31:34'),
(136, 3, '/test/page2', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:31:35'),
(137, 3, '/test/page1', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:31:36'),
(138, 3, '/test/page2', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:31:37'),
(139, 3, '/test/page1', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:31:39'),
(140, 3, '/test/page3', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:31:40'),
(141, 3, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:31:40'),
(142, 3, '/test/page1', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:31:42'),
(143, 3, '/user/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:31:54'),
(144, 3, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:31:55'),
(145, 3, '/role/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:31:56'),
(146, 3, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:31:56'),
(147, 3, '/access/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:31:58'),
(148, 3, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 05:31:58'),
(149, 3, '/', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 06:58:02'),
(150, 3, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 06:58:03'),
(151, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 13:27:02'),
(152, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 13:27:10'),
(153, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 13:32:00'),
(154, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 13:32:01'),
(155, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 13:32:02'),
(156, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 13:32:03'),
(157, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 13:32:03'),
(158, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 13:32:11'),
(159, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 13:32:22'),
(160, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 13:32:49'),
(161, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 13:42:40'),
(162, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 14:05:42'),
(163, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 14:05:51'),
(164, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 14:05:52'),
(165, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 14:05:53'),
(166, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 14:05:54'),
(167, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 14:05:55'),
(168, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 14:05:56'),
(169, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 14:05:57'),
(170, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 14:05:57'),
(171, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-19 14:21:23'),
(172, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 00:51:19'),
(173, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:44:41'),
(174, 0, '/user/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:44:43'),
(175, 0, '/user/vlogin?uid=2', '{"uid":"2"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:45:06'),
(176, 2, '/', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:45:06'),
(177, 2, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:45:07'),
(178, 2, '/test/page1', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:45:10'),
(179, 2, '/test/page2', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:45:12'),
(180, 2, '/test/page3', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:45:13'),
(181, 2, '/test/page4', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:45:14'),
(182, 2, '/test/page5', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:45:15'),
(183, 2, '/user/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:45:17'),
(184, 2, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:45:17'),
(185, 2, '/role/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:45:18'),
(186, 2, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:45:19'),
(187, 2, '/access/index', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:45:20'),
(188, 2, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:45:20'),
(189, 2, '/user/vlogin?uid=2', '{"uid":"2"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:45:38'),
(190, 2, '/', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:45:38'),
(191, 2, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:45:39'),
(192, 2, '/user/vlogin?uid=3', '{"uid":"3"}', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:45:56'),
(193, 3, '/', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:45:56'),
(194, 3, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:45:56'),
(195, 3, '/test/page2', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:46:00'),
(196, 3, '/test/page1', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:46:01'),
(197, 3, '/test/page3', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:46:03'),
(198, 3, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:46:03'),
(199, 3, '/test/page4', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:46:05'),
(200, 3, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:46:05'),
(201, 3, '/test/page5', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:46:06'),
(202, 3, '/error/forbidden', '[]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3144.0 Safari/537.36', '10.0.2.2', '', '2017-07-20 02:46:07');

-- --------------------------------------------------------

--
-- 表的结构 `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '角色名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1：有效 0：无效',
  `updated_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '插入时间'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';

--
-- 转存表中的数据 `role`
--

INSERT INTO `role` (`id`, `name`, `status`, `updated_time`, `created_time`) VALUES
(1, '总经理', 1, '2017-07-19 05:21:56', '2017-07-19 05:21:56'),
(2, '销售', 1, '2017-07-19 05:22:13', '2017-07-19 05:22:13');

-- --------------------------------------------------------

--
-- 表的结构 `role_access`
--

CREATE TABLE IF NOT EXISTS `role_access` (
  `id` int(11) unsigned NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色id',
  `access_id` int(11) NOT NULL DEFAULT '0' COMMENT '权限id',
  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '插入时间'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='角色权限表';

--
-- 转存表中的数据 `role_access`
--

INSERT INTO `role_access` (`id`, `role_id`, `access_id`, `created_time`) VALUES
(1, 2, 1, '2017-07-19 05:24:11'),
(2, 2, 2, '2017-07-19 05:26:52'),
(3, 1, 5, '2017-07-19 05:27:02'),
(4, 1, 4, '2017-07-19 05:27:02'),
(5, 1, 3, '2017-07-19 05:27:02'),
(6, 1, 2, '2017-07-19 05:27:02'),
(7, 1, 1, '2017-07-19 05:27:02');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `email` varchar(30) NOT NULL DEFAULT '' COMMENT '邮箱',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是超级管理员 1表示是 0 表示不是',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1：有效 0：无效',
  `updated_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后一次更新时间',
  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '插入时间'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `is_admin`, `status`, `updated_time`, `created_time`) VALUES
(1, '超级管理员', 'apanly@163.com', 1, 1, '2017-07-19 05:20:20', '2016-11-15 05:36:30'),
(2, 'lara', '1260127789@qq.com', 0, 1, '2017-07-19 05:26:30', '2017-07-19 05:20:48'),
(3, 'lali', '15651798869@163.com', 0, 1, '2017-07-19 05:26:39', '2017-07-19 05:21:32');

-- --------------------------------------------------------

--
-- 表的结构 `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `id` int(11) unsigned NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `created_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '插入时间'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

--
-- 转存表中的数据 `user_role`
--

INSERT INTO `user_role` (`id`, `uid`, `role_id`, `created_time`) VALUES
(1, 2, 1, '2017-07-19 05:26:30'),
(2, 3, 2, '2017-07-19 05:26:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access`
--
ALTER TABLE `access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_access_log`
--
ALTER TABLE `app_access_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uid` (`uid`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_access`
--
ALTER TABLE `role_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_role_id` (`role_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_email` (`email`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uid` (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access`
--
ALTER TABLE `access`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `app_access_log`
--
ALTER TABLE `app_access_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=203;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `role_access`
--
ALTER TABLE `role_access`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
