-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 01-02-2019 a las 22:44:05
-- Versión del servidor: 5.6.39-log
-- Versión de PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

 Base de datos: `c1311024_softcad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(50) NOT NULL COMMENT 'id',
  `name` varchar(50) NOT NULL COMMENT 'nombre',
  `pwd` varchar(50) NOT NULL COMMENT 'password',
  `createtime` datetime DEFAULT NULL COMMENT 'creacion',
  `isdelete` int(12) DEFAULT NULL COMMENT 'isdelete',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admin_users`
--

INSERT INTO `admin_users` (`id`, `name`, `pwd`, `createtime`, `isdelete`, `email`, `phone`) VALUES
(1, 'admin', 'admin', '2019-03-01 00:00:00', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `application`
--

CREATE TABLE `application` (
  `id` int(20) NOT NULL COMMENT 'id',
  `category_id` int(20) DEFAULT NULL COMMENT 'category_id',
  `title` varchar(100) DEFAULT NULL COMMENT 'title',
  `descp` text COMMENT 'descp',
  `content` longtext COMMENT 'content',
  `thumb_img` varchar(100) DEFAULT NULL COMMENT '图标',
  `file_url` varchar(100) DEFAULT NULL COMMENT '下载地址',
  `file_url64` varchar(100) DEFAULT NULL COMMENT '64位下载地址',
  `seo_title` longtext CHARACTER SET utf8 COMMENT 'SEO标题',
  `seo_keywords` longtext CHARACTER SET utf8 COMMENT 'SEO_keywords',
  `seo_description` longtext CHARACTER SET utf8 COMMENT 'SEO描述',
  `snip_img` longtext COMMENT '截图',
  `website_url` varchar(100) DEFAULT NULL COMMENT '公司网址',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `isdelete` int(2) DEFAULT NULL COMMENT '是否删除：0、是；1、否',
  `feature` text COMMENT '程序特征'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `application_category`
--

CREATE TABLE `application_category` (
  `id` int(20) NOT NULL COMMENT '新闻分类ID',
  `name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `isdelete` int(2) DEFAULT NULL COMMENT '是否删除',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `down_record`
--

CREATE TABLE `down_record` (
  `id` int(20) NOT NULL COMMENT 'ID',
  `soft_name` varchar(150) DEFAULT NULL COMMENT '软件id',
  `down_time` datetime DEFAULT NULL COMMENT '下载时间',
  `uid` int(50) DEFAULT NULL COMMENT '下载人uid',
  `user_name` varchar(100) DEFAULT NULL COMMENT '下载人姓名',
  `email` varchar(100) DEFAULT NULL COMMENT '下载人邮箱',
  `country` varchar(50) DEFAULT NULL COMMENT '国家',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `workunit` varchar(30) DEFAULT NULL COMMENT '公司名称、工作单位'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ecommerce`
--

CREATE TABLE `ecommerce` (
  `id` int(10) NOT NULL COMMENT '电商ID',
  `name` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `descp` text COMMENT '产品描述',
  `background_img` varchar(100) DEFAULT NULL COMMENT '背景图片',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `isdelete` int(2) DEFAULT NULL COMMENT '是否删除',
  `sort` int(11) DEFAULT NULL COMMENT '排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ec_price`
--

CREATE TABLE `ec_price` (
  `id` int(20) NOT NULL COMMENT 'id',
  `ec_id` int(20) DEFAULT NULL COMMENT 'ec_id',
  `name` varchar(50) DEFAULT NULL COMMENT 'name',
  `thumb_img` varchar(100) DEFAULT NULL,
  `is_sale` int(2) DEFAULT NULL COMMENT 'is_sale',
  `price` double(18,2) DEFAULT NULL COMMENT 'price',
  `buy_url` varchar(150) DEFAULT NULL COMMENT 'buy_url',
  `formerprice` double(18,2) DEFAULT NULL COMMENT 'formerprice',
  `upgrade_price` double(18,2) DEFAULT NULL COMMENT '升级价格',
  `upgrade_formerprice` double(18,2) DEFAULT NULL COMMENT 'upgrade_formerprice',
  `upgrade_url` varchar(150) DEFAULT NULL COMMENT '升级Url',
  `createtime` datetime DEFAULT NULL,
  `isdelete` int(2) DEFAULT NULL COMMENT 'isdelete',
  `sort` int(2) DEFAULT NULL COMMENT 'sort'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enquiry`
--

CREATE TABLE `enquiry` (
  `id` int(20) NOT NULL COMMENT 'ID',
  `software` text COMMENT '软件id',
  `given_name` varchar(50) DEFAULT NULL COMMENT 'Given Name',
  `family_name` varchar(50) DEFAULT NULL COMMENT 'Family Name',
  `company` varchar(50) DEFAULT NULL COMMENT '公司',
  `e_mail` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL COMMENT '手机号',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `isdelete` int(2) DEFAULT NULL COMMENT '是否删除：0、是；1、否',
  `is_deal` int(2) DEFAULT NULL COMMENT '是否已处理：0、未处理；1、已处理',
  `processor` varchar(50) DEFAULT NULL COMMENT '处理人',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_receive` int(2) DEFAULT NULL COMMENT '是否接收发送邮件：1、接收；2、不接收'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hot_words`
--

CREATE TABLE `hot_words` (
  `id` int(20) NOT NULL COMMENT 'ID',
  `keywords` varchar(100) DEFAULT NULL COMMENT '国家搜索词',
  `nums` bigint(100) DEFAULT NULL COMMENT '搜索次数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_type`
--

CREATE TABLE `menu_type` (
  `id` int(20) NOT NULL COMMENT '菜单分类id',
  `name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `isdelete` int(2) DEFAULT NULL COMMENT '是否删除：0、是；1、否',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `news`
--

CREATE TABLE `news` (
  `id` int(20) NOT NULL COMMENT 'id',
  `new_category` int(20) DEFAULT NULL COMMENT 'new_category',
  `seo_show` int(2) DEFAULT NULL COMMENT 'seo_show',
  `user_id` int(30) DEFAULT NULL COMMENT '发布人id',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `tags` varchar(50) DEFAULT NULL COMMENT '标签',
  `digest` text COMMENT '摘要',
  `release_status` int(4) DEFAULT NULL COMMENT '发布状态：0、草稿；1、发布',
  `thumb_img` varchar(200) DEFAULT NULL COMMENT '缩略图地址（首页）',
  `thumb_img2` varchar(200) DEFAULT NULL COMMENT '缩略图地址（列表）',
  `content` longtext,
  `seo_content` longtext COMMENT '去HTML标签的内容',
  `seo_title` longtext COMMENT 'SEO标题',
  `seo_keywords` longtext COMMENT 'SEO_keywords',
  `seo_description` longtext COMMENT 'SEO描述',
  `isdelete` int(12) DEFAULT NULL COMMENT '是否删除：0、是；1、是',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `release_time` datetime DEFAULT NULL COMMENT '发布时间',
  `views` bigint(100) DEFAULT '0' COMMENT '浏览量',
  `index_show` int(20) DEFAULT '0' COMMENT '是否显示在首页：0、否；1、是；'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `news_category`
--

CREATE TABLE `news_category` (
  `id` int(20) NOT NULL COMMENT '新闻分类ID',
  `name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `isdelete` int(2) DEFAULT NULL COMMENT '是否删除',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_category`
--

CREATE TABLE `product_category` (
  `id` int(20) NOT NULL COMMENT '产品分类ID',
  `name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `isdelete` int(2) DEFAULT NULL COMMENT '是否删除',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_feature`
--

CREATE TABLE `p_feature` (
  `id` int(20) NOT NULL COMMENT 'id',
  `feature` varchar(100) DEFAULT NULL COMMENT 'feature',
  `is_support` int(2) DEFAULT NULL COMMENT 'is_support',
  `isdelete` int(2) DEFAULT NULL COMMENT '是否删除：0、否；1、是',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `p_id` int(20) DEFAULT NULL COMMENT '价格id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reseller`
--

CREATE TABLE `reseller` (
  `id` int(20) NOT NULL COMMENT 'ID',
  `thumb_img` varchar(100) DEFAULT NULL COMMENT 'LOGO',
  `company` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `descp` text COMMENT '概要',
  `country` varchar(50) DEFAULT NULL COMMENT '国家',
  `address` varchar(150) DEFAULT NULL COMMENT '地址',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `fax` varchar(50) DEFAULT NULL COMMENT '传真',
  `e_mail` varchar(50) DEFAULT NULL COMMENT 'e-mail',
  `web_url` varchar(100) DEFAULT NULL COMMENT 'web路径',
  `isdelete` int(2) DEFAULT NULL COMMENT '是否删除：0、是；1、否',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seo_manage`
--

CREATE TABLE `seo_manage` (
  `id` int(20) NOT NULL COMMENT 'SEO管理表id',
  `menu_id` int(10) DEFAULT NULL COMMENT '分类id',
  `page_name` varchar(200) DEFAULT NULL COMMENT '页名',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `keywords` varchar(200) DEFAULT NULL COMMENT '关键词',
  `description` longtext COMMENT '描述',
  `isdelete` int(4) DEFAULT '1' COMMENT '是否删除：0、是；1、否',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `software`
--

CREATE TABLE `software` (
  `id` int(20) NOT NULL COMMENT 'id',
  `name` varchar(50) DEFAULT NULL COMMENT 'software名称',
  `isdelete` int(2) DEFAULT NULL COMMENT '是否删除：0、是；1、否',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soft_info`
--

CREATE TABLE `soft_info` (
  `id` int(20) NOT NULL COMMENT '软件id',
  `category` varchar(50) DEFAULT NULL COMMENT '下载分类',
  `down_icon` varchar(200) DEFAULT NULL COMMENT 'LOGO图片url',
  `soft_name` varchar(50) DEFAULT NULL COMMENT '软件名',
  `descp` text COMMENT '简介描述',
  `content` text COMMENT '内容简介',
  `run_envir` varchar(150) DEFAULT NULL COMMENT '运行环境',
  `local32_url` varchar(200) DEFAULT NULL COMMENT '32位下载地址',
  `local64_url` varchar(200) DEFAULT NULL COMMENT '64下载地址',
  `soft_size` bigint(200) DEFAULT NULL COMMENT '软件大小(单位字节)',
  `release_time` datetime DEFAULT NULL COMMENT '发布时间',
  `isdelete` int(4) DEFAULT NULL COMMENT '是否删除：0、是；1、否',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `sort` int(12) DEFAULT '1' COMMENT '排序等级：1、2、3、4、',
  `more_url` varchar(100) DEFAULT NULL COMMENT '了解更多跳转地址',
  `show_target` varchar(50) DEFAULT NULL COMMENT '展示标记'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `support`
--

CREATE TABLE `support` (
  `id` int(20) NOT NULL COMMENT '支持id',
  `type` int(2) DEFAULT NULL COMMENT '视频类型：1、overview；2、tutorial；3、tips；4、features',
  `column_type` int(2) DEFAULT NULL COMMENT '栏目分类：1、Installation& Activation；2、User Guide；3、Video Library；4、Tips & Tricks',
  `product_category_id` int(20) DEFAULT NULL COMMENT '产品分类id',
  `version_id` int(20) DEFAULT NULL COMMENT '版本id',
  `seo_show` int(2) DEFAULT NULL COMMENT '0、页面自动抓取；1、使用手动设置',
  `user_id` int(30) DEFAULT NULL COMMENT '发布人id',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `tags` varchar(50) DEFAULT NULL COMMENT '标签',
  `thumb_img` varchar(200) DEFAULT NULL COMMENT '缩略图地址（首页）',
  `file_url` varchar(200) DEFAULT NULL COMMENT '文件路径',
  `descp` text COMMENT '描述',
  `content` longtext,
  `seo_content` longtext COMMENT '去HTML标签的内容',
  `seo_title` longtext COMMENT 'SEO标题',
  `seo_keywords` longtext COMMENT 'SEO_keywords',
  `seo_description` longtext COMMENT 'SEO描述',
  `isdelete` int(12) DEFAULT NULL COMMENT '是否删除：0、是；1、是',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `release_time` datetime DEFAULT NULL COMMENT '发布时间',
  `views` bigint(100) DEFAULT NULL COMMENT '浏览量',
  `downs` bigint(100) DEFAULT NULL COMMENT '下载次数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_info`
--

CREATE TABLE `user_info` (
  `id` int(12) NOT NULL COMMENT '用户信息表id',
  `uid` int(13) NOT NULL COMMENT '用户uid',
  `country` varchar(50) NOT NULL COMMENT '国家',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) NOT NULL COMMENT '电话',
  `workunit` varchar(30) DEFAULT NULL COMMENT '公司名称、工作单位',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `version`
--

CREATE TABLE `version` (
  `id` int(20) NOT NULL COMMENT '版本ID',
  `name` varchar(50) DEFAULT NULL COMMENT '版本名称',
  `isdelete` int(2) DEFAULT NULL COMMENT '是否删除:0、是；1、否',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `application_category`
--
ALTER TABLE `application_category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `down_record`
--
ALTER TABLE `down_record`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ecommerce`
--
ALTER TABLE `ecommerce`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ec_price`
--
ALTER TABLE `ec_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_id` (`ec_id`);

--
-- Indices de la tabla `enquiry`
--
ALTER TABLE `enquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `hot_words`
--
ALTER TABLE `hot_words`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menu_type`
--
ALTER TABLE `menu_type`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `new_category` (`new_category`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `news_category`
--
ALTER TABLE `news_category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `p_feature`
--
ALTER TABLE `p_feature`
  ADD PRIMARY KEY (`id`),
  ADD KEY `p_id` (`p_id`);

--
-- Indices de la tabla `reseller`
--
ALTER TABLE `reseller`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `seo_manage`
--
ALTER TABLE `seo_manage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indices de la tabla `software`
--
ALTER TABLE `software`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `soft_info`
--
ALTER TABLE `soft_info`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_category_id` (`product_category_id`);

--
-- Indices de la tabla `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `version`
--
ALTER TABLE `version`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `application`
--
ALTER TABLE `application`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `application_category`
--
ALTER TABLE `application_category`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '新闻分类ID', AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `down_record`
--
ALTER TABLE `down_record`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=1170;

--
-- AUTO_INCREMENT de la tabla `ecommerce`
--
ALTER TABLE `ecommerce`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '电商ID', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ec_price`
--
ALTER TABLE `ec_price`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `enquiry`
--
ALTER TABLE `enquiry`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `hot_words`
--
ALTER TABLE `hot_words`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de la tabla `menu_type`
--
ALTER TABLE `menu_type`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '菜单分类id', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `news`
--
ALTER TABLE `news`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=208;

--
-- AUTO_INCREMENT de la tabla `news_category`
--
ALTER TABLE `news_category`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '新闻分类ID', AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '产品分类ID', AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `p_feature`
--
ALTER TABLE `p_feature`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `reseller`
--
ALTER TABLE `reseller`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `seo_manage`
--
ALTER TABLE `seo_manage`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'SEO管理表id', AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT de la tabla `software`
--
ALTER TABLE `software`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `soft_info`
--
ALTER TABLE `soft_info`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '软件id', AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT de la tabla `support`
--
ALTER TABLE `support`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '支持id', AUTO_INCREMENT=406;

--
-- AUTO_INCREMENT de la tabla `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '用户信息表id', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `version`
--
ALTER TABLE `version`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '版本ID', AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `application_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `application_category` (`id`);

--
-- Filtros para la tabla `ec_price`
--
ALTER TABLE `ec_price`
  ADD CONSTRAINT `ec_price_ibfk_1` FOREIGN KEY (`ec_id`) REFERENCES `ecommerce` (`id`);

--
-- Filtros para la tabla `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`new_category`) REFERENCES `news_category` (`id`),
  ADD CONSTRAINT `news_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `admin_users` (`id`);

--
-- Filtros para la tabla `p_feature`
--
ALTER TABLE `p_feature`
  ADD CONSTRAINT `p_feature_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `ec_price` (`id`);

--
-- Filtros para la tabla `seo_manage`
--
ALTER TABLE `seo_manage`
  ADD CONSTRAINT `seo_manage_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu_type` (`id`);

--
-- Filtros para la tabla `support`
--
ALTER TABLE `support`
  ADD CONSTRAINT `support_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `admin_users` (`id`),
  ADD CONSTRAINT `support_ibfk_2` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
