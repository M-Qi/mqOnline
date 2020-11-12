-- MySQL dump 10.13  Distrib 5.7.25, for Win64 (x86_64)
--
-- Host: localhost    Database: mq_Online
-- ------------------------------------------------------
-- Server version	5.7.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add 用户信息',6,'add_userprofile'),(22,'Can change 用户信息',6,'change_userprofile'),(23,'Can delete 用户信息',6,'delete_userprofile'),(24,'Can view 用户信息',6,'view_userprofile'),(25,'Can add 轮播图',7,'add_banner'),(26,'Can change 轮播图',7,'change_banner'),(27,'Can delete 轮播图',7,'delete_banner'),(28,'Can view 轮播图',7,'view_banner'),(29,'Can add 邮箱验证码',8,'add_emailverfyrecord'),(30,'Can change 邮箱验证码',8,'change_emailverfyrecord'),(31,'Can delete 邮箱验证码',8,'delete_emailverfyrecord'),(32,'Can view 邮箱验证码',8,'view_emailverfyrecord'),(33,'Can add 课程资源',9,'add_courseresourse'),(34,'Can change 课程资源',9,'change_courseresourse'),(35,'Can delete 课程资源',9,'delete_courseresourse'),(36,'Can view 课程资源',9,'view_courseresourse'),(37,'Can add 章节',10,'add_lesson'),(38,'Can change 章节',10,'change_lesson'),(39,'Can delete 章节',10,'delete_lesson'),(40,'Can view 章节',10,'view_lesson'),(41,'Can add 课程',11,'add_course'),(42,'Can change 课程',11,'change_course'),(43,'Can delete 课程',11,'delete_course'),(44,'Can view 课程',11,'view_course'),(45,'Can add 视频',12,'add_viedo'),(46,'Can change 视频',12,'change_viedo'),(47,'Can delete 视频',12,'delete_viedo'),(48,'Can view 视频',12,'view_viedo'),(49,'Can add 城市',13,'add_citydict'),(50,'Can change 城市',13,'change_citydict'),(51,'Can delete 城市',13,'delete_citydict'),(52,'Can view 城市',13,'view_citydict'),(53,'Can add 课程机构',14,'add_courseorg'),(54,'Can change 课程机构',14,'change_courseorg'),(55,'Can delete 课程机构',14,'delete_courseorg'),(56,'Can view 课程机构',14,'view_courseorg'),(57,'Can add 教师',15,'add_teacher'),(58,'Can change 教师',15,'change_teacher'),(59,'Can delete 教师',15,'delete_teacher'),(60,'Can view 教师',15,'view_teacher'),(61,'Can add 用户咨询',16,'add_userask'),(62,'Can change 用户咨询',16,'change_userask'),(63,'Can delete 用户咨询',16,'delete_userask'),(64,'Can view 用户咨询',16,'view_userask'),(65,'Can add 用户消息',17,'add_usermessage'),(66,'Can change 用户消息',17,'change_usermessage'),(67,'Can delete 用户消息',17,'delete_usermessage'),(68,'Can view 用户消息',17,'view_usermessage'),(69,'Can add 课程评论',18,'add_coursecomments'),(70,'Can change 课程评论',18,'change_coursecomments'),(71,'Can delete 课程评论',18,'delete_coursecomments'),(72,'Can view 课程评论',18,'view_coursecomments'),(73,'Can add 用户收藏',19,'add_userfavorite'),(74,'Can change 用户收藏',19,'change_userfavorite'),(75,'Can delete 用户收藏',19,'delete_userfavorite'),(76,'Can view 用户收藏',19,'view_userfavorite'),(77,'Can add 用户课程',20,'add_usercourse'),(78,'Can change 用户课程',20,'change_usercourse'),(79,'Can delete 用户课程',20,'delete_usercourse'),(80,'Can view 用户课程',20,'view_usercourse'),(81,'Can add Bookmark',21,'add_bookmark'),(82,'Can change Bookmark',21,'change_bookmark'),(83,'Can delete Bookmark',21,'delete_bookmark'),(84,'Can view Bookmark',21,'view_bookmark'),(85,'Can add User Setting',22,'add_usersettings'),(86,'Can change User Setting',22,'change_usersettings'),(87,'Can delete User Setting',22,'delete_usersettings'),(88,'Can view User Setting',22,'view_usersettings'),(89,'Can add User Widget',23,'add_userwidget'),(90,'Can change User Widget',23,'change_userwidget'),(91,'Can delete User Widget',23,'delete_userwidget'),(92,'Can view User Widget',23,'view_userwidget'),(93,'Can add log entry',24,'add_log'),(94,'Can change log entry',24,'change_log'),(95,'Can delete log entry',24,'delete_log'),(96,'Can view log entry',24,'view_log'),(97,'Can add revision',25,'add_revision'),(98,'Can change revision',25,'change_revision'),(99,'Can delete revision',25,'delete_revision'),(100,'Can view revision',25,'view_revision'),(101,'Can add version',26,'add_version'),(102,'Can change version',26,'change_version'),(103,'Can delete version',26,'delete_version'),(104,'Can view version',26,'view_version'),(105,'Can add captcha store',27,'add_captchastore'),(106,'Can change captcha store',27,'change_captchastore'),(107,'Can delete captcha store',27,'delete_captchastore'),(108,'Can view captcha store',27,'view_captchastore');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (115,'TSUZ','tsuz','8e0b8ae576b092e554881442f65f8403988a370b','2020-11-08 02:00:47.838468'),(117,'CHHC','chhc','b18cdb725ea86d3e13b8e29e90ce31d55b76c16e','2020-11-09 07:15:26.967299'),(118,'TTQV','ttqv','533d441cee77e265530f3a4da278721f44cf04c4','2020-11-09 07:16:12.060760'),(119,'PSVJ','psvj','9ded69d1a140e5eb352a2e5fdc149126fca263a2','2020-11-09 07:16:12.727885'),(120,'YYEC','yyec','c604ec589a8944fbd94d9d653c0c1f12e65a42e9','2020-11-09 07:16:14.676175'),(121,'JGGX','jggx','41300cdabe524d8465d54f430ef2bc2bdfdf2972','2020-11-09 07:16:15.570298'),(122,'ZXEN','zxen','b19b17a36e675d65893260755fc2e461b8810d34','2020-11-09 07:16:42.882537'),(123,'IXAG','ixag','f54825474840e5702caf27af2eda3a52a3069c5d','2020-11-09 07:16:43.617401'),(124,'TCSJ','tcsj','f1c346e492050c0476d693af8b113f3cf71fb215','2020-11-12 01:36:21.504568');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_course`
--

DROP TABLE IF EXISTS `course_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(2) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `student_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_times` datetime(6) NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `teacher_tell` varchar(300) NOT NULL,
  `youneed_know` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_course_course_org_id_6a10e205_fk_organizat` (`course_org_id`),
  KEY `course_course_teacher_id_f04a37b5_fk_organization_teacher_id` (`teacher_id`),
  CONSTRAINT `course_course_course_org_id_6a10e205_fk_organizat` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `course_course_teacher_id_f04a37b5_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_course`
--

LOCK TABLES `course_course` WRITE;
/*!40000 ALTER TABLE `course_course` DISABLE KEYS */;
INSERT INTO `course_course` VALUES (1,'Django速成','本教程适合有Python基础的开发者学习。','Python下有许多款不同的 Web 框架。Django是重量级选手中最有代表性的一位。许多成功的网站和APP都基于Django。 \r\nDjango 是一个开放源代码的 Web 应用框架，由 Python 写成。 \r\nDjango 遵守 BSD 版权，初次发布于 2005 年 7 月, 并于 2008 年 9 月发布了第一个正式版本 1.0 。\r\nDjango 采用了 MVT 的软件设计模式，即模型（Model），视图（View）和模板（Template）。','cj',300,8,0,'courses/202011/django_6neiGVe.jpg',75,'2020-11-08 07:24:00.000000',1,'python','django',1,'学完本套课程，可掌握django。','本机构适用于具有python基础的人群'),(2,'Flask','系统掌握Flask框架的使用+博客项目实战+项目部署','系统介绍基于Flask框架的Web应用开发，小快轻，当然依然水煮风格','cj',220,2,0,'courses/202011/flask_aarfHTt.jpg',4,'2020-11-09 12:05:00.000000',1,'python','flask',2,'学完本套课程，可掌握flask。','本机构适用于具有python基础的人群'),(3,'精华Python小课 3天零基础入门','零基础入门，想学习Python的朋友','Python是目前最火的编程语言（没有之一），特别是在人工智能和深度学习领域，有关Python的课程也和雨后春笋一般大量涌现，但是这些课程大多目的性不强，过多扣语法，大而全，但是实用性不强，一段时间不用很容易就忘记了。因此本课程专为想学习/从事人工智能领域的同学设计，重点介绍人工智能中最常用的Python知识，重点讲解numpy等实用模块，同时大量结合习题和实战，帮助大家快速上手Python。\r\n1、Python开发环境的准备(Anaconda, Jupyter Notebook, Spyder) \r\n2、Python基础知识（变量类型，基础数学运算，基础语法，常用数据结构，比较和逻辑运算，循环语句，Python函数，文件IO，时间模块与OS模块，异常处理） \r\n3、Numpy的使用（ndarray，向量与矩阵的形变和运算，向量和矩阵的生成、运算、拼接、和索引，常用numpy科学计算方法） \r\n4、Pandas 和 Matplotlib \r\n5、爬虫实战（Request，BeautifulSoup）','zj',500,3,0,'courses/202011/python_TREkmVQ.jpg',8,'2020-11-09 12:09:00.000000',1,'python','django',1,'学完本套课程，可掌握django。','本机构适用于具有python基础的人群'),(4,'大数据','大数据（big data），IT行业术语，是指无法在一定时间范围内用常规软件工具进行捕捉、管理和处理的数据集合，是需要新处理模式才能具有更强的决策力、洞察发现力和流程优化能力的海量、高增长率和多样化的信息资产。','对于“大数据”（Big data）研究机构Gartner给出了这样的定义。“大数据”是需要新处理模式才能具有更强的决策力、洞察发现力和流程优化能力来适应海量、高增长率和多样化的信息资产。\r\n麦肯锡全球研究所给出的定义是：一种规模大到在获取、存储、管理、分析方面大大超出了传统数据库软件工具能力范围的数据集合，具有海量的数据规模、快速的数据流转、多样的数据类型和价值密度低四大特征大数据需要特殊的技术，以有效地处理大量的容忍经过时间内的数据。适用于大数据的技术，包括大规模并行处理（MPP）数据库、数据挖掘、分布式文件系统、分布式数据库、云计算平台、互联网和可扩展的存储系统。','gj',350,3,0,'courses/202011/大数据.jpg',0,'2020-11-09 12:11:00.000000',4,'','',NULL,'',''),(5,'5G','第五代移动通信系统','通信行业是一个极端民主的行业，一切成功与失败需要每位用户投票选择。是重资产投入行业，没人会在电信技术发展的轨道上进行“试错式”赌博。通信技术在发展的过程中不断与其他科技发展线索进行交互产生共鸣式影响。5G之前的通信网络是面向人群的，终端设备与网络特征非常一致。5G则是面向物群，不同的物需求而计算能力和计算目的都不同，5G不仅需要满足物对网络能力的不同需求，也要按他们呢所处的应用场景，用户化提供能力','gj',600,15,0,'courses/202011/5g.png',1,'2020-11-09 12:17:00.000000',5,'','',NULL,'',''),(6,'音视频开发','理工科的大学生，想参与协议栈开发的工程师，参与ble相关开发工程师，物联网相关行业的工程师','本课程主要深度剖析蓝牙技术联盟关于蓝牙组网（mesh）的技术，相比于Zigbee，Wifi等技术，使用蓝牙组网是近几年非常火的一个新技术方案，阿里的天猫精灵、小米的小爱都是采用蓝牙mesh的方案进行组网，详细的说每年都是百亿级的蓝牙设备进行mesh组网。笔者是芯片原厂的开发组长，mesh的开发1年半的经验，目前芯片的mesh方案已经被很多客户量产且mesh的方案已过了SIG和天猫精灵的认证。最后说一句，本课程是非盈利目的只是为了和大家做个朋友。\r\n1、本课程将会带领大家学习比较前沿的BLE MESH 组网技术，这个能培养学员的英文阅读能力和对前沿知识的探索能力。 \r\n2、通过sig mesh的标准文档升入浅出的说明技术的细节，帮助学员了解mesh 组网的全部细节。 \r\n3、也会通过协议细节举一反三应用的实际工程上去，提高学员迁移和创新能力。 \r\n3、通过实际组网的demo向大家展示组网的效果，分析行业的趋势动态。','zj',100,0,0,'courses/202011/音频开发.jpg',0,'2020-11-09 12:18:00.000000',2,'','',NULL,'',''),(7,'Linux','Linux系统编程视频课程为《Linux系统编程》入门篇，主要针对零基础的Linux开发学员科普Linux系统编程的概念以及需要掌握的各种技能，掌握Linux命令编写、Linux学习路线并熟悉嵌入式设备编程的方法。为后续的Linux系统编程深入学习打下良好的基础。','Linux开发工程师，嵌入式工程师，学生\r\n掌握Linux系统编程的概念和学习路线\r\n掌握Linux系统编程常用命令：man、info、strace\r\n编写一个音频播放器','zj',300,0,0,'courses/202011/Linux.jpg',0,'2020-11-09 12:20:00.000000',6,'','',NULL,'',''),(8,'机器学习','SVM的教程在网上已经有很多了，比如经典的《支持向量机通俗导论：理解SVM的三层境界》，但本课程作为《机器学习集训营》的试听课程，会手把手带你推导SVM和XGBoost。','XGBoost一直是kaggle竞赛中的神器，是boosting算法的其中一种，而Boosting算法的思想是将许多弱分类器集成在一起形成一个强分类器。XGBoost作为一种提升树模型，将许多树模型集成在一起，形成一个强分类器，所用到的树模型则是CART回归树模型。 \r\n通过本集训营试听课程快速掌握SVM和Xgboost 两大算法的理论推导后，可以进一步学习《机器学习集训营》。 \r\n  \r\n《机器学习集训营》总计八大阶段，十三个实战项目（三大企业项目、十个实训项目），涵盖Python基础与数据分析、机器学习原理、机器学习实战、深度学习原理、深度学习实战，以及CV 推荐 NLP三大方向的BAT工业级大项目实战、面试就业指导等等，助力你的就业、转型、提升之路，3个月挑战年薪40万。','gj',150,1,0,'courses/202011/机器学习.jpg',0,'2020-11-09 12:22:00.000000',7,'','',NULL,'',''),(9,'python数据分析与机器学习实战【2019新版】','Python数据分析与机器学习实战教程，该课程精心挑选真实的数据集为案例','1.掌握Python数据科学工具包，包括矩阵数据处理与可视化展示。 2.掌握机器学习算法原理推导，从数学上理解算法是怎么来的以及其中涉及的细节。 3.掌握每一个算法所涉及的参数，详解其中每一步对结果的影响。 4.熟练使用Python进行建模实战，基于真实数据集展开分析，一步步完成整个建模实战任务。 \r\n1.零基础快速掌握python数据分析与机器学习算法实战；\r\n2.快速入门python最流行的数据分析库numpy,pandas,matplotlib；\r\n3.对于繁琐的机器学习算法，先从原理上进行推导，以算法流程为主结合实际案例完成算法代码,使用scikit-learn机器学习库完成快速建立模型，评估以及预测；\r\n4.结合经典kaggle案例，从数据预处理开始一步步完成整个项目，使大家对如何应用python库完成实际的项目有完整的经验与概念。','zj',600,1,0,'courses/202011/py机器.jpg',0,'2020-11-09 12:23:00.000000',6,'','',NULL,'',''),(10,'轻松搞定八大机器学习算法','很多人认为机器学习难学，主要是因为其过于关注各种复杂数学公式的推导，从而忽略了公式的本质。','本课程通过对课件的精心编排，课程内容的不断打磨，重磅推出机器学习8大经典模型算法，对晦涩难懂的数学公式，\r\n通过图形展示其特点和本质，快速掌握机器学习模型的核心理论，将重点回归到机器学习算法本身。\r\n本课程选取了机器学习经典的8大模型： \r\n线性回归、逻辑回归、决策树、贝叶斯分类器、支持向量机(SVM)、集成学习、聚类以及降维 \r\n再也不用东拼西凑，一门课程真正掌握机器学习核心技术。\r\n它们是人工智能必经之路，机器学习必学技术，企业面试必备技能。\r\n全面掌握机器学习8大经典模型理论\r\n能够使用Python编写出8大经典模型的代码并实现预测功能\r\n学完即可参加kaggle和阿里天池各种AI竞赛','gj',300,0,0,'courses/202011/算法.jpg',0,'2020-11-09 12:24:00.000000',8,'','',NULL,'',''),(11,'java实现变声效果','ava-eclipse程序，实现变声效果，有萝莉、大叔、肥仔、搞怪、慢吞吞、网红女、困兽。原理是改编速率和音调。','提供了一个完整的可运行的java—eclipse程序，实现变声效果，调用的TarsosDSP包\r\n想学习java变声的同学\r\n想学习TarsosDSP的同学\r\n想在android实现变声的同学，也可以借鉴一下','zj',300,0,0,'courses/202011/变声器.jpg',0,'2020-11-09 12:30:00.000000',4,'','',NULL,'','');
/*!40000 ALTER TABLE `course_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_courseresourse`
--

DROP TABLE IF EXISTS `course_courseresourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_courseresourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_courseresourse_course_id_e2da8922_fk_course_course_id` (`course_id`),
  CONSTRAINT `course_courseresourse_course_id_e2da8922_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_courseresourse`
--

LOCK TABLES `course_courseresourse` WRITE;
/*!40000 ALTER TABLE `course_courseresourse` DISABLE KEYS */;
INSERT INTO `course_courseresourse` VALUES (1,'课件','course/resourse/2020/11/5g.png','2020-11-11 12:14:00.000000',1),(2,'测试文件','course/resourse/2020/11/vgroup.json','2020-11-11 12:16:00.000000',1);
/*!40000 ALTER TABLE `course_courseresourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_lesson`
--

DROP TABLE IF EXISTS `course_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_lesson_course_id_65df4a1c_fk_course_course_id` (`course_id`),
  CONSTRAINT `course_lesson_course_id_65df4a1c_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_lesson`
--

LOCK TABLES `course_lesson` WRITE;
/*!40000 ALTER TABLE `course_lesson` DISABLE KEYS */;
INSERT INTO `course_lesson` VALUES (1,'第一章  Django简介','2020-11-11 07:20:00.000000',1),(2,'第二章  Django环境搭建','2020-11-11 07:22:00.000000',1),(3,'第三章  Django视图与路由','2020-11-11 07:23:00.000000',1),(4,'第四章  Django模板','2020-11-11 07:23:00.000000',1),(5,'第五章  Django表单','2020-11-11 07:24:00.000000',1),(6,'第六章  Django配置','2020-11-11 07:24:00.000000',1);
/*!40000 ALTER TABLE `course_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_viedo`
--

DROP TABLE IF EXISTS `course_viedo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_viedo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `learn_times` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_viedo_lesson_id_c1bb7542_fk_course_lesson_id` (`lesson_id`),
  CONSTRAINT `course_viedo_lesson_id_c1bb7542_fk_course_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `course_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_viedo`
--

LOCK TABLES `course_viedo` WRITE;
/*!40000 ALTER TABLE `course_viedo` DISABLE KEYS */;
INSERT INTO `course_viedo` VALUES (1,'Django 全貌','2020-11-11 07:27:00.000000',1,'http://vjs.zencdn.net/v/oceans.mp4',13),(2,'Django基本认识与了解','2020-11-11 07:28:00.000000',1,'https://code.ziqiangxuetang.com/django/django-intro.html',22),(3,'Django基础','2020-11-11 07:28:00.000000',1,'https://code.ziqiangxuetang.com/django/django-tutorial.html',31),(4,'环境搭建1','2020-11-11 07:29:00.000000',2,'https://code.ziqiangxuetang.com/django/django-install.html',11),(5,'环境搭建2','2020-11-11 07:30:00.000000',2,'https://code.ziqiangxuetang.com/django/django-install.html',15),(6,'视图与网址1','2020-11-11 07:30:00.000000',3,'https://code.ziqiangxuetang.com/django/django-views-urls.html',18),(7,'视图与路由','2020-11-11 07:30:00.000000',3,'https://code.ziqiangxuetang.com/django/django-views-urls.html',12),(8,'视图与网址进阶','2020-11-11 07:30:00.000000',4,'https://code.ziqiangxuetang.com/django/django-intro.html',41),(9,'模板基础2','2020-11-11 07:31:00.000000',4,'https://code.ziqiangxuetang.com/django/django-install.html',12),(10,'模板3','2020-11-11 07:31:00.000000',4,'https://code.ziqiangxuetang.com/django/django-tutorial.html',34),(11,'表单视频1','2020-11-11 07:31:00.000000',5,'https://www.baidu.com',21),(12,'表单3','2020-11-11 07:31:00.000000',5,'https://code.ziqiangxuetang.com/django/django-tutorial.html',13),(13,'配置视频1','2020-11-11 07:32:00.000000',6,'https://code.ziqiangxuetang.com/django/django-intro.html',10),(14,'配置4','2020-11-11 07:32:00.000000',6,'https://code.ziqiangxuetang.com/django/django-intro.html',52);
/*!40000 ALTER TABLE `course_viedo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(27,'captcha','captchastore'),(4,'contenttypes','contenttype'),(11,'course','course'),(9,'course','courseresourse'),(10,'course','lesson'),(12,'course','viedo'),(18,'operation','coursecomments'),(16,'operation','userask'),(20,'operation','usercourse'),(19,'operation','userfavorite'),(17,'operation','usermessage'),(13,'organization','citydict'),(14,'organization','courseorg'),(15,'organization','teacher'),(25,'reversion','revision'),(26,'reversion','version'),(5,'sessions','session'),(7,'users','banner'),(8,'users','emailverfyrecord'),(6,'users','userprofile'),(21,'xadmin','bookmark'),(24,'xadmin','log'),(22,'xadmin','usersettings'),(23,'xadmin','userwidget');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-11-02 11:40:35.415441'),(2,'contenttypes','0002_remove_content_type_name','2020-11-02 11:40:37.723857'),(3,'auth','0001_initial','2020-11-02 11:40:39.731727'),(4,'auth','0002_alter_permission_name_max_length','2020-11-02 11:40:43.803156'),(5,'auth','0003_alter_user_email_max_length','2020-11-02 11:40:43.849032'),(6,'auth','0004_alter_user_username_opts','2020-11-02 11:40:43.894940'),(7,'auth','0005_alter_user_last_login_null','2020-11-02 11:40:44.001623'),(8,'auth','0006_require_contenttypes_0002','2020-11-02 11:40:44.059468'),(9,'auth','0007_alter_validators_add_error_messages','2020-11-02 11:40:44.104349'),(10,'auth','0008_alter_user_username_max_length','2020-11-02 11:40:44.156211'),(11,'auth','0009_alter_user_last_name_max_length','2020-11-02 11:40:44.213057'),(12,'auth','0010_alter_group_name_max_length','2020-11-02 11:40:44.375624'),(13,'auth','0011_update_proxy_permissions','2020-11-02 11:40:44.411527'),(14,'users','0001_initial','2020-11-02 11:40:45.347156'),(15,'admin','0001_initial','2020-11-02 11:40:48.926359'),(16,'admin','0002_logentry_remove_auto_add','2020-11-02 11:40:50.350863'),(17,'admin','0003_logentry_add_action_flag_choices','2020-11-02 11:40:50.405716'),(18,'sessions','0001_initial','2020-11-02 11:40:50.713892'),(19,'users','0002_banner_emailverfyrecord','2020-11-02 12:36:50.117475'),(20,'course','0001_initial','2020-11-03 01:21:55.444902'),(21,'organization','0001_initial','2020-11-03 01:22:00.310887'),(22,'operation','0001_initial','2020-11-03 01:57:23.592220'),(23,'reversion','0001_squashed_0004_auto_20160611_1202','2020-11-03 02:44:46.140346'),(24,'xadmin','0001_initial','2020-11-03 02:44:49.386577'),(25,'xadmin','0002_log','2020-11-03 02:44:52.329665'),(26,'xadmin','0003_auto_20160715_0100','2020-11-03 02:44:54.539586'),(27,'captcha','0001_initial','2020-11-04 12:34:06.051113'),(28,'users','0003_auto_20201104_2033','2020-11-04 12:34:06.792356'),(29,'organization','0002_auto_20201106_1431','2020-11-06 06:32:05.404355'),(30,'organization','0003_auto_20201106_1939','2020-11-06 11:39:15.282824'),(31,'course','0002_course_course_org','2020-11-08 01:32:49.466182'),(32,'organization','0004_teacher_image','2020-11-08 07:20:55.338839'),(33,'course','0003_course_category','2020-11-10 12:35:16.450951'),(34,'course','0004_course_tag','2020-11-11 01:31:23.962546'),(35,'course','0005_lesson_url','2020-11-11 07:14:22.991769'),(36,'course','0006_auto_20201111_1518','2020-11-11 07:18:23.017545'),(37,'course','0007_viedo_learn_times','2020-11-11 07:40:25.590122'),(38,'course','0008_auto_20201111_2029','2020-11-11 12:29:46.817798'),(39,'organization','0005_teacher_teacher_age','2020-11-12 06:31:36.474243');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('439lh4f6bdsyelfdjb2ul2jzh6n9kf19','YmM2NWM1MTFjYzIzNTQzMjJhOTUzY2YxNDRlMWZhM2M0ODU1OGYyMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjIxMWU0YmJlZjk3ODE3NjQ3YWMyMDI4NzFmNzQ3Y2ZlMTllNTUwMDgiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2UiLCJjb3Vyc2UiXSwiIl19','2020-11-26 11:52:21.467515'),('c5j29ynkisvwidpmiwwq9sl33tuuxqbx','MGE0OTI5MDExMjRmMGY4OGJiNjYyOTAyNmQyMTVmYjIxZTM4ZTkyYzp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzZlMzEwMTkzMmE4MzU1ODAyNWI4ZjU3OTg2YjdlMjdhZGE0ODNjIn0=','2020-11-19 11:42:14.810317'),('dr23tjrhh3sc8943pds10b8ol4erz46j','YmM2NWM1MTFjYzIzNTQzMjJhOTUzY2YxNDRlMWZhM2M0ODU1OGYyMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjIxMWU0YmJlZjk3ODE3NjQ3YWMyMDI4NzFmNzQ3Y2ZlMTllNTUwMDgiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2UiLCJjb3Vyc2UiXSwiIl19','2020-11-18 12:01:29.901407'),('kcav6ll2kocnieyumzvic9kg1gdqnxaf','ZTY4Y2JhNmYxZThiNmQyNzY1NTQ1NGIwZGVhNmI3YmI1MTUyOWUzMjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjYxODljZTY2NTk5NTBjYjkzNDU1YjU5N2YwMGE5NjEwYTNhYmMyYmUifQ==','2020-11-26 00:49:07.149157'),('y7bjhlk1izlfybe6ldwag8xd5mi1yxj8','NmViODg4Yzc1YzJmODY1ODdlN2Q3ZWQ0OGFiZDMwYTQ3MThiMDllYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjIxMWU0YmJlZjk3ODE3NjQ3YWMyMDI4NzFmNzQ3Y2ZlMTllNTUwMDgiLCJMSVNUX1FVRVJZIjpbWyJvcmdhbml6YXRpb24iLCJjb3Vyc2VvcmciXSwiIl19','2020-11-20 07:01:52.313352'),('zzt4bcl096ymtjp26eji7d9ibms5dgeu','ZTZmMDU2MWE0NWUyMTg1NThkMmIyNDE1ZjlmOTRiYzlmM2RiOTRiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMTFlNGJiZWY5NzgxNzY0N2FjMjAyODcxZjc0N2NmZTE5ZTU1MDA4IiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJ1c2VycHJvZmlsZSJdLCIiXX0=','2020-11-17 09:21:44.903400');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_coursecomments`
--

DROP TABLE IF EXISTS `operation_coursecomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_course_id_c88f1b6a_fk_course_course_id` (`course_id`),
  KEY `operation_coursecomm_user_id_f5ff70b3_fk_users_use` (`user_id`),
  CONSTRAINT `operation_coursecomm_user_id_f5ff70b3_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_coursecomments`
--

LOCK TABLES `operation_coursecomments` WRITE;
/*!40000 ALTER TABLE `operation_coursecomments` DISABLE KEYS */;
INSERT INTO `operation_coursecomments` VALUES (1,'123','2020-11-12 00:52:06.970749',1,2),(2,'00\n','2020-11-12 00:52:59.574026',1,2),(3,'0','2020-11-12 00:53:19.720323',1,2),(4,'aa ','2020-11-12 11:56:34.711659',2,1),(5,'22\n','2020-11-12 11:57:31.048114',3,1);
/*!40000 ALTER TABLE `operation_coursecomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userask`
--

DROP TABLE IF EXISTS `operation_userask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userask`
--

LOCK TABLES `operation_userask` WRITE;
/*!40000 ALTER TABLE `operation_userask` DISABLE KEYS */;
INSERT INTO `operation_userask` VALUES (1,'三国演义','18295903333','123','2020-11-06 13:06:34.910654'),(2,'三国演义','18295903333','123','2020-11-06 13:06:34.908660'),(3,'三国演义','18295903333','ad','2020-11-08 00:50:00.542054'),(4,'三国演义','18295903333','ad','2020-11-08 00:50:00.545047'),(5,'马琦','18295903333','djang','2020-11-08 02:44:29.966347'),(6,'马琦','18295903333','djang','2020-11-08 02:44:29.961361');
/*!40000 ALTER TABLE `operation_userask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usercourse`
--

DROP TABLE IF EXISTS `operation_usercourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_course_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usercourse`
--

LOCK TABLES `operation_usercourse` WRITE;
/*!40000 ALTER TABLE `operation_usercourse` DISABLE KEYS */;
INSERT INTO `operation_usercourse` VALUES (1,'2020-11-12 02:17:07.322733',1,2),(2,'2020-11-12 02:25:37.050341',1,1),(3,'2020-11-12 11:56:26.873634',2,1),(4,'2020-11-12 11:56:43.443373',3,1);
/*!40000 ALTER TABLE `operation_usercourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userfavorite`
--

DROP TABLE IF EXISTS `operation_userfavorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userfavorite`
--

LOCK TABLES `operation_userfavorite` WRITE;
/*!40000 ALTER TABLE `operation_userfavorite` DISABLE KEYS */;
INSERT INTO `operation_userfavorite` VALUES (39,1,1,'2020-11-12 07:50:37.313524',1),(42,1,2,'2020-11-12 08:04:47.456502',1),(45,1,3,'2020-11-12 08:18:00.828860',1),(48,2,2,'2020-11-12 11:56:12.440259',1);
/*!40000 ALTER TABLE `operation_userfavorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usermessage`
--

DROP TABLE IF EXISTS `operation_usermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usermessage`
--

LOCK TABLES `operation_usermessage` WRITE;
/*!40000 ALTER TABLE `operation_usermessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_usermessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_citydict`
--

DROP TABLE IF EXISTS `organization_citydict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_citydict`
--

LOCK TABLES `organization_citydict` WRITE;
/*!40000 ALTER TABLE `organization_citydict` DISABLE KEYS */;
INSERT INTO `organization_citydict` VALUES (1,'北京市','北京位于华北地区，中心位置东经116°20′、北纬39°56′，东与天津毗连，其余均与河北相邻，北京市总面积16410.54平方千米 。截至2019年9月，北京市下辖16个市辖区。','2020-11-06 06:46:00.000000'),(2,'上海市','春秋战国时期，上海是楚国春申君黄歇的封邑，故别称申。四、五世纪晋朝时期，因渔民创造捕鱼工具“扈”，江流入海处称“渎”，因此松江下游一带称为“扈渎”，以后又改“沪”，故上海简称“沪”。','2020-11-06 06:47:00.000000'),(3,'深圳市','深圳之名始见史籍于明朝永乐八年（1410年），清朝初年建墟，1979年成立深圳市，1980年设置经济特区，是中国设立的第一个经济特区，中国改革开放的窗口和新兴移民城市，创造了举世瞩目的“深圳速度”。','2020-11-06 06:47:00.000000'),(4,'广州市','广州地处中国南部、濒临南海、珠江三角洲北缘，是中国南部战区司令部驻地 ，国家综合性门户城市，首批沿海开放城市，是中国通往世界的南大门，粤港澳大湾区、泛珠江三角洲经济区的中心城市以及一带一路的枢纽城市。','2020-11-06 06:47:00.000000'),(5,'杭州市','杭州位于中国华东地区、东南沿海、浙江省北部、钱塘江下游、京杭大运河南端，是环杭州湾大湾区核心城市 、沪嘉杭G60科创走廊中心城市 、国际重要的电子商务中心 。','2020-11-06 06:47:00.000000'),(6,'重庆市','重庆地处中国内陆西南部，总面积8.24万平方千米，辖38个区（县、自治县）；2018年，重庆常住人口3101.79万，地区生产总值20363.19亿元； 有中国火锅之都 、中国会展名城 、世界温泉之都 之称。','2020-11-06 06:48:00.000000'),(7,'成都市','成都位于中国西南地区，四川盆地西部，成都平原腹地，境内地势平坦、河网纵横、物产丰富、农业发达，属亚热带季风性湿润气候，自古享有“天府之国”的美誉。','2020-11-06 06:48:00.000000'),(8,'南京市','南京地处中国东部、长江下游、濒江近海，是中国东部战区司令部驻地，国家物流枢纽 ，长江国际航运物流中心 ，长三角辐射带动中西部地区发展的国家重要门户城市，也是东部沿海经济带与长江经济带战略交汇的重要节点城市。','2020-11-06 06:48:00.000000'),(9,'天津市','天津地处中国华北地区、华北平原东北部、海河流域下游，东临渤海，是海河五大支流南运河、子牙河、大清河、永定河、北运河的汇合处和入海口，素有“九河下梢”“河海要冲”之称。','2020-11-06 06:48:00.000000'),(10,'苏州市','苏州，简称“苏”，古称吴、姑苏、平江府，是江苏省下辖的地级市、扬子江城市群的重要组成部分，国务院批复确定的国家历史文化名城和风景旅游城市、国家高新技术产业基地、长江三角洲重要的中心城市之一。','2020-11-06 06:48:00.000000');
/*!40000 ALTER TABLE `organization_citydict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_courseorg`
--

DROP TABLE IF EXISTS `organization_courseorg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `add_time` datetime(6),
  `address` varchar(150) DEFAULT NULL,
  `category` varchar(20),
  `city_id` int(11) DEFAULT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_courseo_city_id_4a842f85_fk_organizat` (`city_id`),
  CONSTRAINT `organization_courseo_city_id_4a842f85_fk_organizat` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_courseorg`
--

LOCK TABLES `organization_courseorg` WRITE;
/*!40000 ALTER TABLE `organization_courseorg` DISABLE KEYS */;
INSERT INTO `organization_courseorg` VALUES (1,'新东方','全名北bai京新东方教育科技（集团）有限公司，总部位于北京市海淀区中关村，是规模最大的综合性教育集团，同时也是教育培训集团。公司业务包括外语培训、中小学基础教育、学前教育、在线教育、出国咨询、图书出版等各个领域。',0,0,'org/202011/新东方.gif','2020-11-06 06:49:00.000000','北京市海淀区中关村','pxjg',1,0,0),(2,'安博教育集团','安博教育连续多年被新浪、搜狐、腾讯、《人民日报》、新华社等国内权威媒体誉为中国十大教育服务品牌，被《中国企业家》杂志评为“中国最具成长性企业21星”，被《商务周刊》连续三年评为“中国100快”公司。2007年、2008年，安博教育分别获投资5400万美元和1.03亿美元，连续创造我国教育私募融资之最。2010年8月5日，安博教育成功登陆纽交所。',0,0,'org/202011/安博教育.gif','2020-11-06 06:51:00.000000','上海陆家嘴','pxjg',2,0,0),(3,'环球雅思教育','环球雅思隶属于环球天下教育科技集团，环球雅思学校成立于2001年。19年专注出国语言，主营雅思、托福、SAT、AP、ACT、国际高中课程，游学等业务。在全国183个城市设立了500多家考试培训中心，开发了影响中国雅思教学培训课程体系，师资雄厚，教学成果斐然。',0,0,'org/202011/雅思.gif','2020-11-06 06:52:00.000000','全国都有','pxjg',3,0,0),(4,'达内教育','成立于2007年，由美国国际数据集团IDG投资，由来自SUN、IBM、亚信、华为、东软、用友等国际知名IT公司的技术骨干、海外留学生和加拿大专业技术人员创办。引进北美IT技术，结合中国IT企业的现状，定制化培养高端IT人才。致力于为中高端IT企业培训并输送基于Unix/Linux平台、Oracle大型关系数据库、IP网络协议、Web和企业级应用的中高级软件人才。达内科技集团已经于2014年4月3日赴美国纳斯达克成功上市（股票代码TEDU）。',0,0,'org/202011/达内交易.gif','2020-11-06 06:53:00.000000','北疆','pxjg',5,0,0),(5,'北大青鸟','北大青鸟APTECH成立于1999年，依托北京大学 优质雄厚的教育资源和背景，秉承“教育改变生活”的发展理念，一直致力于培养中国IT技能型紧缺人才。北大青鸟以完善的标准化管理为依托实现了体系的规模化发展，200余家授权培训中心遍布全国60多个重要城市，全国合作院校超过600所，同10000余家知名企业建立了战略合作伙伴关系，累计培养和输送80余万IT职业化人才进入IT行业，得到了社会各界认可。',0,0,'org/202011/北大.gif','2020-11-06 06:54:00.000000','四川重庆','pxjg',6,0,0),(6,'弘成教育集团','弘成教育集团成立于1999年，是国内最早从事网络高等学历教育服务的机构。多年来，凭借在教育服务、教育技术、教育资源上的优势。\r\n集团业务覆盖各个学龄阶段和多种教育形式，提供从中小学教育到高等教育，从学历教育到非学历教育，从校内教育到网络教育的全方位教育服务。',0,0,'org/202011/弘成教育.gif','2020-11-06 06:55:00.000000','江苏','pxjg',10,0,0),(7,'中公教育','中公教育创建于1999年，公司总部位于北京；自创立以来，中公教育已由一家北大毕业生自主创业的信息技术与教育服务机构，发展为教育服务业的综合性企业集团。一个集公务员、参照公务员管理人员、事业单位工作人员、村干部等各类公职人员录用考试教育教学研究、考前培训，公职类考试辅导图书、音像、网络、教材等产品编辑、出版、发行于一体的知识产业实体。',0,0,'org/202011/中公教育.gif','2020-11-06 06:56:00.000000','北京','pxjg',1,0,0),(8,'北京大学','北大的logo是鲁迅先生在1917年8月设计完成，在2007年有稍作修改。“北大”两个篆字的上下排列，其中“北字”构成背对背的两个侧立的人像，而“大字”构成了一个正面站立的人像。校徽突出的理念在于，要“以人为本”；校徽的象征意义在于，北大当肩负开启民智的重大使命。传达出“以人为本”、“立人”的理念。',0,0,'org/202011/北大.jpg','2020-11-06 06:56:00.000000','北京','gx',1,0,0),(9,'深圳大学','深圳大学校徽含义：主体造型为一只鸟名字叫“大鹏”，意为“大鹏展翅，鹏程万里”，同时，也暗含深圳的意思，深圳的别称是”鹏城“。深圳大学“四字为小篆，凸显文化厚重感。 ”深圳大学“四字为四方形，外面轮廓为”八方型“，意为特区大学汇聚“四面八方”英才。',0,0,'org/202011/深圳大学.jpg','2020-11-06 06:58:00.000000','深圳','pxjg',3,0,0),(10,'复旦大学','设计整体以天圆地方之结构，寓意与复旦融天地之气、博大精深；主体沿用原篆体“复旦”篆刻体来表示悠悠历史、世代传承，给复旦学子们亲切感拉近距离；标志将蕴涵在篆体“复旦”中的“100”字样，以红色渲染，凸现出百年历史为特殊含义和走过风雨沧桑的路，中心图形又似“旦复旦兮”。\r\n英文“FUDAN UNIVERSITY”表明复旦大学国际化办学的宗旨，数字“1905-2010年”传承了100多年的沧桑历程。标志设计整体稳重、深厚、大气、喜庆、传播全球。',0,0,'org/202011/负担大学.jpg','2020-11-06 06:59:00.000000','上海','gx',2,0,0),(11,'天津大学','天津大学校徽logo设计图案由紫红、纯白和金色组成。总体色调稍暗色，古朴、庄重，隐现出学校源远流长的历史。校徽中心盾形图案，为继承原北洋大学校徽部分。 盾形上数字“1895”为创建年代，反映了学校的悠久历史。英文天津大学后括号内的“北洋大学”与盾形图案相互映衬，说明天津大学是由北洋大学发展而来的。校徽外齿轮象征天津大学是一所以工为主，理、工、文、管相结合的综合性大学。',0,0,'org/202011/天津大学.jpg','2020-11-06 07:00:00.000000','天津','gx',9,0,0),(12,'苏州科技大学','苏州科技大学（学院）标志校徽由双环组成，外环上半部是大写的英文校名，下半部为中文校名，内环为学校英文简称的字母组合，呈活泼上升的造型。校徽主色调为蓝色，中文校名为黑色毛体。',0,0,'org/202011/苏州大学.jpg','2020-11-06 07:00:00.000000','苏州','pxjg',10,0,0),(13,'厦门大学','1921年陈嘉庚先生创办厦门大学时即把“自强不息，止于至善”定为校训。“自强不息”指自觉地积极向上、奋发图强、永不懈怠。最早见于《周易 乾》：“天行健，君子以自强不息”。“止于至善”指通过不懈的努力，以臻尽善尽美而后才停止，也就是说不达到十分完美的境界绝不停止自己的努力。语出《礼记 大学》：“大学之道，在明明德，在亲民，在止于至善”。',0,0,'org/202011/沙门大学jpg.jpg','2020-11-06 07:01:00.000000','厦门','pxjg',8,0,0);
/*!40000 ALTER TABLE `organization_courseorg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_teacher`
--

DROP TABLE IF EXISTS `organization_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `teacher_age` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teacher_org_id_cd000a1a_fk_organizat` (`org_id`),
  CONSTRAINT `organization_teacher_org_id_cd000a1a_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_teacher`
--

LOCK TABLES `organization_teacher` WRITE;
/*!40000 ALTER TABLE `organization_teacher` DISABLE KEYS */;
INSERT INTO `organization_teacher` VALUES (1,'王国菁',3,'北京清华附属网络职业学院','计算机组长','能说、会道',1,2,'2020-11-08 07:24:43.098716',1,'teacher/2020/11/王老师.jpg',25),(2,'王雨晶',3,'山西师范专科高等学院','学科主任','讲的通俗理解、讲课风格幽默风趣',10,0,'2020-11-12 06:40:05.996078',2,'teacher/2020/11/c9b55e64ab7a680c2888783d7f3b502.jpg',25);
/*!40000 ALTER TABLE `organization_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reversion_revision`
--

DROP TABLE IF EXISTS `reversion_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reversion_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reversion_revision_user_id_17095f45_fk_users_userprofile_id` (`user_id`),
  KEY `reversion_revision_date_created_96f7c20c` (`date_created`),
  CONSTRAINT `reversion_revision_user_id_17095f45_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reversion_revision`
--

LOCK TABLES `reversion_revision` WRITE;
/*!40000 ALTER TABLE `reversion_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `reversion_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reversion_version`
--

DROP TABLE IF EXISTS `reversion_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reversion_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(191) NOT NULL,
  `format` varchar(255) NOT NULL,
  `serialized_data` longtext NOT NULL,
  `object_repr` longtext NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  `db` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reversion_version_db_content_type_id_objec_b2c54f65_uniq` (`db`,`content_type_id`,`object_id`,`revision_id`),
  KEY `reversion_version_content_type_id_7d0ff25c_fk_django_co` (`content_type_id`),
  KEY `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` (`revision_id`),
  CONSTRAINT `reversion_version_content_type_id_7d0ff25c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` FOREIGN KEY (`revision_id`) REFERENCES `reversion_revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reversion_version`
--

LOCK TABLES `reversion_version` WRITE;
/*!40000 ALTER TABLE `reversion_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `reversion_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_banner`
--

DROP TABLE IF EXISTS `users_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_banner`
--

LOCK TABLES `users_banner` WRITE;
/*!40000 ALTER TABLE `users_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_emailverfyrecord`
--

DROP TABLE IF EXISTS `users_emailverfyrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_emailverfyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(10) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_emailverfyrecord`
--

LOCK TABLES `users_emailverfyrecord` WRITE;
/*!40000 ALTER TABLE `users_emailverfyrecord` DISABLE KEYS */;
INSERT INTO `users_emailverfyrecord` VALUES (1,'atlmQoSp','18295903413@163.com','register','2020-11-05 07:56:12.490650'),(2,'f5hEZT0b','18295903413@163.com','register','2020-11-05 09:22:57.897714'),(3,'uWyb6NvT','18295903413@qq.com','register','2020-11-05 09:24:21.211992'),(4,'otmUqPcP','18295903413@163.com','register','2020-11-05 09:25:28.793641'),(5,'lhmzR65S','18295903413@163.com','register','2020-11-05 11:41:02.268919'),(6,'GnU7G1Q4','18295903413@163.com','forget','2020-11-06 02:58:12.182727'),(7,'TnKuC0X5','18295903413@163.com','forget','2020-11-06 03:00:16.465767'),(8,'zq9ktTyR','18295903413@163.com','forget','2020-11-06 03:01:52.746663'),(9,'Cd2cilhj','18295903413@163.com','forget','2020-11-08 01:56:14.819938');
/*!40000 ALTER TABLE `users_emailverfyrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `address` longtext NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'pbkdf2_sha256$150000$FsYClwisT0o1$QY2Xpzwo+cAuIYoCHeMcVZyESyLEFWROjuQEb5YdJmU=','2020-11-12 11:40:00.000000',1,'admin','','','92@qq.com',1,1,'2020-11-03 02:47:01.461868','',NULL,'female','<p>aaaa</p>',NULL,'image/202011/虾丸额.jpg'),(2,'pbkdf2_sha256$150000$xQ9D6A73FbcB$q35Do9f6jN5SnyxuLa/PR6R+WouFNyIiq0VSQxvB+jE=','2020-11-12 11:40:00.000000',0,'maqi','','','',0,1,'2020-11-03 02:50:17.405333','',NULL,'female','<p>66</p>',NULL,'image/202011/白菜4.jpg'),(3,'maqi123..',NULL,0,'小马','','','',0,1,'2020-11-03 08:23:00.000000','maqi22',NULL,'male','<p>&nbsp; &nbsp; adddr<img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/>\r\n </p>',NULL,'image/202011/6e46cd62e03635a07229ffb6528b0641.jpg'),(4,'pbkdf2_sha256$150000$hoobrFVr9N3K$wQWw/0q/JcK2PJM8wclkUnXRftIxUd+jN8W+9+qDqCc=',NULL,0,'123@qq.com','','','123@qq.com',0,0,'2020-11-05 06:58:15.559005','',NULL,'female','',NULL,'image/default.png'),(5,'pbkdf2_sha256$150000$IGDRu56c2vYk$dN36UmnKKSLRBBILzm8i1BRL4nVuClI9P8oS58rYCU4=',NULL,0,'asd@qq.com','','','asd@qq.com',0,0,'2020-11-05 06:58:53.341266','',NULL,'female','',NULL,'image/default.png'),(10,'pbkdf2_sha256$150000$3yp1kScVdwqB$lLTuKRdqQMs2/YiwG/o35sAs9iEVEX/OUjl1lVJedBc=','2020-11-05 11:42:14.720523',0,'18295903413@163.com','','','18295903413@163.com',0,1,'2020-11-05 11:41:02.051522','',NULL,'female','',NULL,'image/default.png');
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_groups`
--

DROP TABLE IF EXISTS `users_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_groups`
--

LOCK TABLES `users_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `users_userprofile_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_user_permissions`
--

LOCK TABLES `users_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2020-11-03 02:50:17.566874','127.0.0.1','2','maqi','create','已添加。',6,1),(2,'2020-11-03 08:23:57.250872','127.0.0.1','3','小马','create','已添加。',6,1),(3,'2020-11-03 09:21:44.737197','127.0.0.1','3','小马','change','修改 address 和 image',6,1),(4,'2020-11-06 06:47:21.099081','127.0.0.1','1','CityDict object (1)','create','已添加。',13,1),(5,'2020-11-06 06:47:30.310755','127.0.0.1','2','CityDict object (2)','create','已添加。',13,1),(6,'2020-11-06 06:47:40.367587','127.0.0.1','3','CityDict object (3)','create','已添加。',13,1),(7,'2020-11-06 06:47:50.133890','127.0.0.1','4','CityDict object (4)','create','已添加。',13,1),(8,'2020-11-06 06:48:14.195516','127.0.0.1','5','杭州市','create','已添加。',13,1),(9,'2020-11-06 06:48:24.233772','127.0.0.1','6','重庆市','create','已添加。',13,1),(10,'2020-11-06 06:48:34.779442','127.0.0.1','7','成都市','create','已添加。',13,1),(11,'2020-11-06 06:48:46.078559','127.0.0.1','8','南京市','create','已添加。',13,1),(12,'2020-11-06 06:48:55.798362','127.0.0.1','9','天津市','create','已添加。',13,1),(13,'2020-11-06 06:49:03.692927','127.0.0.1','10','苏州市','create','已添加。',13,1),(14,'2020-11-06 06:49:05.806671','127.0.0.1','10','苏州市','change','没有字段被修改。',13,1),(15,'2020-11-06 06:51:20.564687','127.0.0.1','1','新东方','create','已添加。',14,1),(16,'2020-11-06 06:52:17.613405','127.0.0.1','2','安博教育集团','create','已添加。',14,1),(17,'2020-11-06 06:53:41.138430','127.0.0.1','3','环球雅思教育','create','已添加。',14,1),(18,'2020-11-06 06:54:31.119850','127.0.0.1','4','达内教育','create','已添加。',14,1),(19,'2020-11-06 06:55:18.662646','127.0.0.1','5','北大青鸟','create','已添加。',14,1),(20,'2020-11-06 06:56:05.285881','127.0.0.1','6','弘成教育集团','create','已添加。',14,1),(21,'2020-11-06 06:56:50.686989','127.0.0.1','7','中公教育','create','已添加。',14,1),(22,'2020-11-06 06:58:56.040702','127.0.0.1','8','北京大学','create','已添加。',14,1),(23,'2020-11-06 06:59:35.180906','127.0.0.1','9','深圳大学','create','已添加。',14,1),(24,'2020-11-06 07:00:12.989803','127.0.0.1','10','复旦大学','create','已添加。',14,1),(25,'2020-11-06 07:00:45.435514','127.0.0.1','11','天津大学','create','已添加。',14,1),(26,'2020-11-06 07:01:15.478618','127.0.0.1','12','苏州科技大学','create','已添加。',14,1),(27,'2020-11-06 07:01:52.080942','127.0.0.1','13','厦门大学','create','已添加。',14,1),(28,'2020-11-08 07:24:43.440317','127.0.0.1','1','[新东方]的教师: 王国菁','create','已添加。',15,1),(29,'2020-11-08 07:26:05.023373','127.0.0.1','1','Django速成','create','已添加。',11,1),(30,'2020-11-09 12:09:33.894764','127.0.0.1','2','Flask','create','已添加。',11,1),(31,'2020-11-09 12:11:20.294744','127.0.0.1','3','精华Python小课 3天零基础入门','create','已添加。',11,1),(32,'2020-11-09 12:17:08.960720','127.0.0.1','4','大数据','create','已添加。',11,1),(33,'2020-11-09 12:18:25.819304','127.0.0.1','5','5G','create','已添加。',11,1),(34,'2020-11-09 12:20:58.533657','127.0.0.1','6','音视频开发','create','已添加。',11,1),(35,'2020-11-09 12:22:07.098716','127.0.0.1','7','Linux','create','已添加。',11,1),(36,'2020-11-09 12:23:23.038676','127.0.0.1','8','机器学习','create','已添加。',11,1),(37,'2020-11-09 12:24:42.939190','127.0.0.1','9','python数据分析与机器学习实战【2019新版】','create','已添加。',11,1),(38,'2020-11-09 12:26:42.719460','127.0.0.1','10','轻松搞定八大机器学习算法','create','已添加。',11,1),(39,'2020-11-09 12:31:35.942231','127.0.0.1','11','java实现变声效果','create','已添加。',11,1),(40,'2020-11-11 07:22:46.907561','127.0.0.1','1','《Django速成》课程的章节 >> Django简介','create','已添加。',10,1),(41,'2020-11-11 07:23:27.841701','127.0.0.1','2','《Django速成》课程的章节 >> Django环境搭建','create','已添加。',10,1),(42,'2020-11-11 07:23:52.690208','127.0.0.1','3','《Django速成》课程的章节 >> Django视图与路由','create','已添加。',10,1),(43,'2020-11-11 07:24:03.186485','127.0.0.1','4','《Django速成》课程的章节 >> Django模板','create','已添加。',10,1),(44,'2020-11-11 07:24:17.116860','127.0.0.1','5','《Django速成》课程的章节 >> Django表单','create','已添加。',10,1),(45,'2020-11-11 07:24:33.828583','127.0.0.1','6','《Django速成》课程的章节 >> Django配置','create','已添加。',10,1),(46,'2020-11-11 07:28:24.886673','127.0.0.1','1','Viedo object (1)','create','已添加。',12,1),(47,'2020-11-11 07:28:51.178752','127.0.0.1','2','Viedo object (2)','create','已添加。',12,1),(48,'2020-11-11 07:29:20.012121','127.0.0.1','3','Viedo object (3)','create','已添加。',12,1),(49,'2020-11-11 07:30:14.704849','127.0.0.1','4','Viedo object (4)','create','已添加。',12,1),(50,'2020-11-11 07:30:24.281795','127.0.0.1','5','Viedo object (5)','create','已添加。',12,1),(51,'2020-11-11 07:30:45.593073','127.0.0.1','6','Viedo object (6)','create','已添加。',12,1),(52,'2020-11-11 07:30:57.625603','127.0.0.1','7','Viedo object (7)','create','已添加。',12,1),(53,'2020-11-11 07:31:14.039874','127.0.0.1','8','Viedo object (8)','create','已添加。',12,1),(54,'2020-11-11 07:31:26.464357','127.0.0.1','9','Viedo object (9)','create','已添加。',12,1),(55,'2020-11-11 07:31:35.917791','127.0.0.1','10','Viedo object (10)','create','已添加。',12,1),(56,'2020-11-11 07:31:50.927644','127.0.0.1','11','Viedo object (11)','create','已添加。',12,1),(57,'2020-11-11 07:32:04.635250','127.0.0.1','12','Viedo object (12)','create','已添加。',12,1),(58,'2020-11-11 07:32:14.047999','127.0.0.1','13','Viedo object (13)','create','已添加。',12,1),(59,'2020-11-11 07:32:15.871193','127.0.0.1','13','Viedo object (13)','change','没有字段被修改。',12,1),(60,'2020-11-11 07:32:25.627158','127.0.0.1','14','Viedo object (14)','create','已添加。',12,1),(61,'2020-11-11 12:14:48.243859','127.0.0.1','1','CourseResourse object (1)','create','已添加。',9,1),(62,'2020-11-11 12:17:07.005209','127.0.0.1','2','CourseResourse object (2)','create','已添加。',9,1),(63,'2020-11-11 12:31:52.967467','127.0.0.1','1','Django速成','change','修改 image，category，tag，youneed_know 和 teacher_tell',11,1),(64,'2020-11-11 12:44:07.259473','127.0.0.1','1','Django速成','change','修改 image 和 teacher',11,1),(65,'2020-11-12 03:37:07.135801','127.0.0.1','1','Viedo object (1)','change','修改 url',12,1),(66,'2020-11-12 06:40:06.338174','127.0.0.1','2','[安博教育集团]的教师: 王雨晶','create','已添加。',15,1),(67,'2020-11-12 11:42:03.530870','127.0.0.1','2','maqi','change','修改 last_login，address 和 image',6,1),(68,'2020-11-12 11:42:24.397038','127.0.0.1','1','admin','change','修改 last_login，address 和 image',6,1),(69,'2020-11-12 11:48:17.740941','127.0.0.1','2','Flask','change','修改 course_org，image，category，tag，teacher，youneed_know 和 teacher_tell',11,1),(70,'2020-11-12 11:52:21.245110','127.0.0.1','3','精华Python小课 3天零基础入门','change','修改 image，category，tag，teacher，youneed_know 和 teacher_tell',11,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','',1),(2,'site-theme','/static/xadmin/css/themes/bootstrap-xadmin.css',1);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-12 20:13:36
