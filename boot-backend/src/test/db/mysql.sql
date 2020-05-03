/*
 Navicat Premium Data Transfer

 Source Server         : localhost_ict
 Source Server Type    : MySQL
 Source Server Version : 50641
 Source Host           : localhost:3306
 Source Schema         : rmas

 Target Server Type    : MySQL
 Target Server Version : 50641
 File Encoding         : 65001

 Date: 03/05/2020 18:24:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for community
-- ----------------------------
DROP TABLE IF EXISTS `community`;
CREATE TABLE `community` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '社团名称',
  `introduce` varchar(500) DEFAULT NULL COMMENT '社团介绍',
  `status` int(2) DEFAULT '1' COMMENT '1、显示2、不显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of community
-- ----------------------------
BEGIN;
INSERT INTO `community` VALUES (5, '学生会', '学生会作为最大的学生自我管理组织。具有官方性和权威性。以小编所在的邢台学院为例，初等教育学院的学生会已经走过了十几个年头，学生会机构分工合理，组织明确，社团活动开展的井井有条。教师教育学院学生会是学生和老师之间联系的纽带，成为学校日常教学工作的有力助手。在学生会最大的好处就是有机会自己独立组织活动，写策划，拉外联，以及一系列的活动实施。可以为自己的口才训练以及个人组织能力的提高提供一个良好的平台。', 1);
INSERT INTO `community` VALUES (6, '音乐社团', '音乐社团主要针对音乐系的学生。他们从高中甚至初中开始就经过了专业的训练，可以在音乐社团里边继续锤炼自己的技艺，为自己以后的工作奠定良好的基础。', 1);
INSERT INTO `community` VALUES (7, '美术社团', '美术社团同音乐社团一样大多数社团成员都是有着深厚的美术功底，在这里他们可以尽情展露自己的美术才华，用手里的画笔描绘绚烂的明天。', 1);
INSERT INTO `community` VALUES (8, '舞蹈社团', '美术社团同音乐社团一样大多数社团成员都是有着深厚的美术功底，在这里他们可以尽情展露自己的美术才华，用手里的画笔描绘绚烂的明天。', 1);
INSERT INTO `community` VALUES (9, '计算机类社团', '电脑对于如今人们的生活的重要性不言而喻，我们日常的工作生活都必须使用电脑，因此电脑社团便应运而生。电脑社团与其他艺术类社团相比，学生基础更加广泛，不光是计算机专业的学生可以参与，其他所有专业的学生都可以进行学习，而且计算机的入门知识繁多复杂，加入计算机社团对于提升计算机水平有巨大帮助。同时参加计算机社团对于计算机一级二证书的考取有着无法替代的作用。小编认为计算机社团对于大学生日后工作有着极大的帮助。', 1);
INSERT INTO `community` VALUES (10, '文学类社团', '中华文化灿烂文明历史悠远，传统中国文学底蕴深厚。小编认为，文学类社团是最有魅力的社团，加入文学社可以提升文化底蕴，养成优雅的气质。诗词歌赋，散文，小说是我们每天都要接触的文学体裁，在这里我们可以尽情挥洒自己的想象力和文学天赋，成为名副其实的文学才子。', 1);
INSERT INTO `community` VALUES (11, '新兴社团', '随着改革开放程度的不断加深，我国的社会风气发生了巨大的变化。越来越多的新兴事物开始被大家接受。大学生作为我国知识学历最高，教育水平最好的人物群体，对于新鲜事物的接受能力往往要比其他人更乐于接受新鲜事物。在大学社团主要体现在cosplay社团，话剧社团等新兴方式的表演社团的兴起。新时代的大学生充满朝气和活力，因此新兴社团成为高校主流社团之外，一股逐渐崛起的力量。在这里我们可以尽情地展示自己，释放自己的内心世界。使自己的大学生活充满意义。', 1);
COMMIT;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of customer
-- ----------------------------
BEGIN;
INSERT INTO `customer` VALUES (1, 'admin', 25, 'henan');
INSERT INTO `customer` VALUES (2, 'mick', 23, 'hubei');
COMMIT;

-- ----------------------------
-- Table structure for department_type
-- ----------------------------
DROP TABLE IF EXISTS `department_type`;
CREATE TABLE `department_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departments` varchar(100) DEFAULT NULL COMMENT '院系',
  `status` int(11) DEFAULT '1' COMMENT '1、显示 2、不显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of department_type
-- ----------------------------
BEGIN;
INSERT INTO `department_type` VALUES (4, '数学与统计学院', 1);
INSERT INTO `department_type` VALUES (5, '物理学院（微电子学院）', 1);
COMMIT;

-- ----------------------------
-- Table structure for file_info
-- ----------------------------
DROP TABLE IF EXISTS `file_info`;
CREATE TABLE `file_info` (
  `id` varchar(32) NOT NULL COMMENT '文件md5',
  `contentType` varchar(128) NOT NULL,
  `size` int(11) NOT NULL,
  `path` varchar(255) NOT NULL COMMENT '物理路径',
  `url` varchar(1024) NOT NULL,
  `type` int(1) NOT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '新闻标题',
  `content` text COMMENT '新闻内容',
  `create_time` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of news
-- ----------------------------
BEGIN;
INSERT INTO `news` VALUES (3, '玄武区疫情防控工作督查验收组来校督查验收开学准备工作', '【南林新闻中心讯】4月15日上午，玄武区副区长戴航率玄武区疫情防控工作指挥部督查验收组一行来校督查验收我校开学前疫情防控工作。校党委书记蒋建清，校党委副书记、副校长刘中亮，副校长聂永江，学校相关职能部门负责人出席会议。\n\n        会上，蒋建清对督查验收组一行表示欢迎，并对玄武区给予我校防疫工作的大力支持表示感谢。他表示，学校将把开学返校做为疫情防控的头等大事来抓，继续细化、完善学生返校工作方案和应急处理预案，全力确保顺利平安开学、师生员工健康。戴航表示，玄武区将认真落实属地责任，强化保障担当，持续加强沟通，推进建立校地联防联控机制，为打赢疫情防控阻击战保驾护航。\n\n        督查验收组一行听取了聂永江关于我校疫情防控工作暨开学前准备工作的汇报，现场查阅相关资料，并分赴学生宿舍、教室、食堂、物资防控储备处、隔离场所等地实地检查。\n\n        督查验收后，工作组对我校疫情防控和开学准备相关工作表示肯定，并就相关细节提出进一步完善的建议。', '2020-04-16 09:26:21');
INSERT INTO `news` VALUES (4, '我校召开2020毕届业生就业创业工作会议', '【南林新闻中心讯】为深入贯彻落实党中央、国务院和江苏省委、省政府关于做好高校毕业生就业创业工作的指示精神，积极应对新冠肺炎疫情对就业创业工作影响，4月14日下午， 2020毕届业生就业创业工作会议在图书馆8B116会议室召开。校党委副书记、副校长刘中亮出席会议。学生工作部（处）、研究生工作部、创新创业学院等单位负责人，各学院分管学生工作的负责人及相关工作人员参加会议。\n\n        会上，学生工作部（处）、研究生工作部相关负责人传达了教育部、省教育厅关于就业创业工作文件精神，并就我校2020届毕业生就业创业工作情况做了介绍，对下一阶段重点工作做了部署。\n\n        刘中亮在讲话中对疫情防控常态化背景下，进一步做好我校毕业生就业创业工作提出五点要求：一是要进一步提升政治站位、强化责任担当，落地落实各层级责任，统筹推进疫情防控和毕业生就业工作，全力保障2020届毕业生充分就业。二是要深刻领会上级文件精神，强化政策宣传解读、及时跟进落实，帮助毕业生了解政策、用好政策。三是要创新工作思路、改进工作方法，强化线上指导、聚焦热点产业，不断提升工作实效。四是要细化服务保障，持续完善就业状态信息数据库、就业困难学生“一人一策”帮扶、就业材料“不见面审批”等举措，为做好毕业生就业工作提供优质保障。五是要严守纪律红线，严格落实“三严禁”“四不准”要求，建立健全毕业生就业状况统计检查制度，确保就业状况真实性、准确性。', '2020-04-16 09:26:57');
INSERT INTO `news` VALUES (5, '守望相助、共克时艰——我校与境外合作高校互致慰问', '【南林新闻中心讯】当前，新冠肺炎疫情在全球蔓延，成为波及全球的公共卫生安全事件。我校在全力做好校园疫情防控工作的同时，与境外合作高校互致问候，互道关心，共叙真情，同抗疫情。\n\n        新冠肺炎疫情发生后，我校得到了诸多境外合作高校及各国友人的关心、慰问和支持。日本岛根大学、新西兰坎特布雷大学、澳大利亚西澳大学、加拿大新不伦瑞克大学、美国加州大学伯克利分校、英国牛津大学交流中心等长期合作伙伴第一时间来函来电，向我校师生致以真挚的问候，并祝愿疫情早日得到有效控制。岛根大学国际交流中心长出口显先生在函中引用中国古诗“青山一道同云雨，明月何曾是两乡”，表示对我国疫情磨难感同身受并表达慰问。新不伦瑞克大学副校长Kershaw先生致电，对国内疫情形势表达关切并表示将切实保护我校在加学生安全。坎特布雷大学来函来电，对我国抗疫成效表达赞赏，向全校师生员工致以问候。牛津大学交流中心Emily主任在来函中高度肯定了近年来与我校合作开展的学生联合培养工作，对师生表达慰问。西澳大学来函表示将采取最妥善措施，保障我校在澳师生安全。\n\n        目前，国内疫情防控形势逐步向好，海外疫情形势严峻，我校心系合作伙伴，致函去电、捐赠抗疫物资表达关心慰问。学校委托美国阿拉巴马农工大学孔子学院，向当地医院捐赠2000套医用口罩、200套防护服、200个医用面罩等防疫物质，助力民众抵御疫情。相关学院纷纷向海外合作伙伴发函慰问、协力抗疫，各兄弟高校纷纷回复表达感谢。意大利比萨大学副校长Francesco Marcelloni教授在回函中表示，“收获贵校支持，我们将变得更为强大，更有信心打赢这场人类共同战役”。美国明尼苏达大学回函，“感谢南林悉心问候，获悉中国已逐步恢复正常工作生活，相信通过协力合作，我们将迎来更加灿烂的未来”。美国北德克萨斯大学、爱丁堡罗大学、佐治亚大学、麻省大学lowell分校，芬兰赫尔辛基大学，瑞士苏黎世大学，英国伦敦大学学院，爱尔兰都柏林大学，比利时根特大学，澳大利亚迪肯大学，哥伦比亚哈韦里亚纳主教大学，南非半岛科技大学等兄弟高校均回复致谢，期待共同合作、早日战胜疫情。', '2020-04-16 09:27:21');
INSERT INTO `news` VALUES (7, '我校新增应用统计硕士专业学位授权类别', '【南林新闻中心讯】近日，国务院学位委员会正式公布《关于下达2019年动态调整撤销和增列的学位授权点名单的通知》，我校新增应用统计硕士专业学位授权类别，现有金融、应用统计、翻译、新闻与传播、电子信息、机械、材料与化工、资源与环境、土木水利、生物与医药、交通运输、农业、风景园林、林业、工商管理、会计、工程管理、艺术等18个专业学位授权类别。        自上世纪80年代，我校开始运用统计学在森林资源调查及保护等研究和应用领域开展相关教学和科研工作，形成了鲜明的农林特色。我校应用统计硕士专业学位紧密依托林业工程和林学两大主干学科，融合数学、农林经济管理、控制理论与控制工程、生物信息学等学科知识和资源,以现代统计理论和统计分析方法为基础，对生物统计与建模、随机复杂系统统计分析与仿真、林业系统风险研究及控制等相关应用领域进行深入系统的研究，旨在培养高层次应用型统计人才。', '2020-04-16 09:35:10');
INSERT INTO `news` VALUES (11, '213', '123123', '2020-04-16 14:48:12');
INSERT INTO `news` VALUES (12, '1', '123', '2020-04-21 10:14:01');
INSERT INTO `news` VALUES (13, 'aa', 'test', '2020-04-23 14:27:11');
COMMIT;

-- ----------------------------
-- Table structure for professional
-- ----------------------------
DROP TABLE IF EXISTS `professional`;
CREATE TABLE `professional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `professional` varchar(100) DEFAULT NULL COMMENT '专业名称',
  `did` int(11) DEFAULT NULL COMMENT '院系ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of professional
-- ----------------------------
BEGIN;
INSERT INTO `professional` VALUES (3, '数学与应用数学', 4);
INSERT INTO `professional` VALUES (4, '信息与计算科学', 4);
INSERT INTO `professional` VALUES (5, '统计学', 4);
INSERT INTO `professional` VALUES (6, '金融数学', 4);
INSERT INTO `professional` VALUES (7, '物理学', 5);
INSERT INTO `professional` VALUES (8, '应用物理学', 5);
INSERT INTO `professional` VALUES (9, '测控技术与仪器', 5);
COMMIT;

-- ----------------------------
-- Table structure for push_type
-- ----------------------------
DROP TABLE IF EXISTS `push_type`;
CREATE TABLE `push_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL COMMENT '推送类型',
  `status` int(2) DEFAULT '1' COMMENT '1（默认）、显示 2、不显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of push_type
-- ----------------------------
BEGIN;
INSERT INTO `push_type` VALUES (3, '留校信息', 1);
INSERT INTO `push_type` VALUES (4, '去向推送', 1);
INSERT INTO `push_type` VALUES (5, '宿舍违纪', 1);
INSERT INTO `push_type` VALUES (6, '夜不归宿', 1);
INSERT INTO `push_type` VALUES (7, '学业预警', 1);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `CALENDAR_NAME` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `CRON_EXPRESSION` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TIME_ZONE_ID` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `ENTRY_ID` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `INSTANCE_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `JOB_NAME` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `JOB_GROUP` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `JOB_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `JOB_GROUP` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPTION` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `IS_DURABLE` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `IS_NONCONCURRENT` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `IS_UPDATE_DATA` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `LOCK_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_locks` VALUES ('adminQuartzScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('adminQuartzScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `INSTANCE_NAME` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_scheduler_state` VALUES ('adminQuartzScheduler', 'liushikangdeMacBook-Pro.local1588501379609', 1588501421963, 15000);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `STR_PROP_1` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  `STR_PROP_2` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  `STR_PROP_3` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_GROUP` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `JOB_NAME` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `JOB_GROUP` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `DESCRIPTION` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `TRIGGER_TYPE` varchar(8) COLLATE utf8mb4_bin NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for rmas_asign
-- ----------------------------
DROP TABLE IF EXISTS `rmas_asign`;
CREATE TABLE `rmas_asign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `date` date DEFAULT NULL,
  `room` varchar(20) DEFAULT NULL,
  `student` varchar(20) DEFAULT NULL,
  `content` text,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for rmas_dian
-- ----------------------------
DROP TABLE IF EXISTS `rmas_dian`;
CREATE TABLE `rmas_dian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `date` date DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `amt` decimal(17,2) DEFAULT NULL,
  `content` text,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of rmas_dian
-- ----------------------------
BEGIN;
INSERT INTO `rmas_dian` VALUES (2, '18#202', '2020-04-27', '电费', 200.00, 'success', '2020-04-27 21:45:07', '2020-04-27 21:45:07');
INSERT INTO `rmas_dian` VALUES (3, '17#205', '2020-03-12', '电费', 200.00, '无', '2020-05-03 18:01:41', '2020-05-03 18:01:41');
COMMIT;

-- ----------------------------
-- Table structure for rmas_exam
-- ----------------------------
DROP TABLE IF EXISTS `rmas_exam`;
CREATE TABLE `rmas_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examName` varchar(128) NOT NULL,
  `examDate` date NOT NULL,
  `context` varchar(128) NOT NULL,
  `grade` tinyint(4) NOT NULL,
  `term` tinyint(4) NOT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of rmas_exam
-- ----------------------------
BEGIN;
INSERT INTO `rmas_exam` VALUES (1, '2019年期末考试', '2019-12-31', 'test', 1, 1, '2020-04-25 13:13:13', '2020-04-25 13:13:13');
INSERT INTO `rmas_exam` VALUES (2, '2019年期末考试', '2019-06-02', 'test', 2, 2, '2020-04-25 17:26:13', '2020-04-25 17:26:13');
COMMIT;

-- ----------------------------
-- Table structure for rmas_goback
-- ----------------------------
DROP TABLE IF EXISTS `rmas_goback`;
CREATE TABLE `rmas_goback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `date` date DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `student` varchar(20) DEFAULT NULL,
  `content` text,
  `gobackCont` varchar(200) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `isCheck` tinyint(4) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of rmas_goback
-- ----------------------------
BEGIN;
INSERT INTO `rmas_goback` VALUES (2, '探亲', '2020-04-27', '晚归', 'admin', 'success', '陪女朋友了', 2, 1, '2020-05-03 00:40:04', '2020-05-03 00:40:04');
INSERT INTO `rmas_goback` VALUES (4, '17#205', '2020-03-12', '晚归', 'admin', '无', NULL, 1, 0, '2020-05-03 18:09:36', '2020-05-03 18:09:36');
COMMIT;

-- ----------------------------
-- Table structure for rmas_light
-- ----------------------------
DROP TABLE IF EXISTS `rmas_light`;
CREATE TABLE `rmas_light` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `date` date DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `room` varchar(20) DEFAULT NULL,
  `content` text,
  `lightCont` varchar(200) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `isCheck` tinyint(4) DEFAULT NULL,
  `student` varchar(50) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of rmas_light
-- ----------------------------
BEGIN;
INSERT INTO `rmas_light` VALUES (2, '18#205', '2020-04-27', '晚熄灯', '205', 'success', '看书学习~~', 2, 1, 'admin', '2020-05-03 12:39:58', '2020-05-03 12:39:58');
INSERT INTO `rmas_light` VALUES (5, '17#205', '2020-03-12', '晚熄灯', '205', '无', NULL, 1, 0, 'admin', '2020-05-03 18:23:33', '2020-05-03 18:23:33');
COMMIT;

-- ----------------------------
-- Table structure for rmas_room
-- ----------------------------
DROP TABLE IF EXISTS `rmas_room`;
CREATE TABLE `rmas_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `floor` varchar(20) DEFAULT NULL,
  `door` varchar(20) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `content` text,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of rmas_room
-- ----------------------------
BEGIN;
INSERT INTO `rmas_room` VALUES (2, '17#202', '17号楼', '202', 4, 'ok', '2020-04-27 18:07:28', '2020-04-27 18:07:28');
INSERT INTO `rmas_room` VALUES (7, '17#205', '17号楼', '205', 4, '无', '2020-05-03 17:31:18', '2020-05-03 17:31:18');
COMMIT;

-- ----------------------------
-- Table structure for rmas_sheshi
-- ----------------------------
DROP TABLE IF EXISTS `rmas_sheshi`;
CREATE TABLE `rmas_sheshi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `bxDate` date DEFAULT NULL,
  `bxUser` varchar(20) DEFAULT NULL,
  `tell` varchar(20) DEFAULT NULL,
  `content` text NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of rmas_sheshi
-- ----------------------------
BEGIN;
INSERT INTO `rmas_sheshi` VALUES (2, '501宿舍扫把', '2020-04-27', 'admin', '18501231231', 'enen', 2, '2020-04-27 17:07:46', '2020-04-27 17:07:46');
COMMIT;

-- ----------------------------
-- Table structure for rmas_student_things
-- ----------------------------
DROP TABLE IF EXISTS `rmas_student_things`;
CREATE TABLE `rmas_student_things` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `context` varchar(128) NOT NULL,
  `stuName` varchar(128) NOT NULL,
  `birthday` date NOT NULL,
  `imgUrl` varchar(200) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of rmas_student_things
-- ----------------------------
BEGIN;
INSERT INTO `rmas_student_things` VALUES (1, '春游集 ', '好开心呀好开心呀好开好开心呀好开心呀好开好开心呀好开心呀好开好开心呀好开心呀好开好开心呀好开心呀好开好开心呀好开心呀好开好开心呀好开心呀好开', '刘山', '2020-04-21', NULL, '2020-04-25 10:19:33', '2020-04-25 10:19:33');
COMMIT;

-- ----------------------------
-- Table structure for rmas_sturoom
-- ----------------------------
DROP TABLE IF EXISTS `rmas_sturoom`;
CREATE TABLE `rmas_sturoom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `floor` varchar(20) DEFAULT NULL,
  `people` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `content` text,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for rmas_sut_exam
-- ----------------------------
DROP TABLE IF EXISTS `rmas_sut_exam`;
CREATE TABLE `rmas_sut_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examId` int(11) NOT NULL,
  `examName` varchar(128) DEFAULT NULL,
  `examDate` date DEFAULT NULL,
  `grade` tinyint(4) DEFAULT NULL,
  `term` tinyint(4) DEFAULT NULL,
  `stuId` varchar(100) NOT NULL,
  `stuName` varchar(100) DEFAULT NULL,
  `yuwen` decimal(17,2) DEFAULT NULL,
  `yuwenJc` decimal(17,2) DEFAULT NULL,
  `yuwenyd` decimal(17,2) DEFAULT NULL,
  `yuwenZw` decimal(17,2) DEFAULT NULL,
  `shuxue` decimal(17,2) DEFAULT NULL,
  `shuxueXz` decimal(17,2) DEFAULT NULL,
  `shuxueJs` decimal(17,2) DEFAULT NULL,
  `english` decimal(17,2) DEFAULT NULL,
  `sipin` decimal(17,2) DEFAULT NULL,
  `zf` decimal(17,2) DEFAULT NULL,
  `context` varchar(200) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of rmas_sut_exam
-- ----------------------------
BEGIN;
INSERT INTO `rmas_sut_exam` VALUES (1, 2, NULL, NULL, NULL, NULL, 'test', NULL, 100.00, 50.00, 20.00, 30.00, 90.00, 60.00, 30.00, 100.00, 90.00, 380.00, '这次成绩非常棒', '2020-04-25 15:47:44', '2020-04-25 15:47:44');
INSERT INTO `rmas_sut_exam` VALUES (2, 1, '2019年期末考试', '2019-12-31', 1, 1, 'test2', '王天', 70.00, 30.00, 30.00, 10.00, 70.00, 30.00, 40.00, 100.00, 100.00, 340.00, '偏科严重', '2020-04-25 15:59:28', '2020-04-25 15:59:28');
INSERT INTO `rmas_sut_exam` VALUES (3, 1, '2019年期末考试', '2019-12-31', 1, 1, 'admin', 'admin', 70.00, 30.00, 30.00, 10.00, 100.00, 50.00, 50.00, 100.00, 100.00, 370.00, '太棒了你', '2020-04-25 17:02:31', '2020-04-25 17:02:31');
INSERT INTO `rmas_sut_exam` VALUES (5, 1, '2019年期末考试', '2019-12-31', 1, 1, 'ttt', '该生未通过校验', 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 4.00, '有点问题哦', '2020-04-25 21:01:22', '2020-04-25 21:01:22');
COMMIT;

-- ----------------------------
-- Table structure for rmas_tongji
-- ----------------------------
DROP TABLE IF EXISTS `rmas_tongji`;
CREATE TABLE `rmas_tongji` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(128) NOT NULL,
  `january` tinyint(4) DEFAULT NULL,
  `february` tinyint(4) DEFAULT NULL,
  `march` tinyint(4) DEFAULT NULL,
  `april` tinyint(4) DEFAULT NULL,
  `may` tinyint(4) DEFAULT NULL,
  `june` tinyint(4) DEFAULT NULL,
  `july` tinyint(4) DEFAULT NULL,
  `august` tinyint(4) DEFAULT NULL,
  `september` tinyint(4) DEFAULT NULL,
  `october` tinyint(4) DEFAULT NULL,
  `november` tinyint(4) DEFAULT NULL,
  `december` tinyint(4) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of rmas_tongji
-- ----------------------------
BEGIN;
INSERT INTO `rmas_tongji` VALUES (80, '晚熄灯', 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, '2020-05-03 17:29:08', '2020-05-03 17:29:08');
INSERT INTO `rmas_tongji` VALUES (81, '晚归', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2020-05-03 17:29:08', '2020-05-03 17:29:08');
COMMIT;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(50) DEFAULT NULL COMMENT '学号 唯一',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(5) DEFAULT NULL COMMENT '性别',
  `grade` varchar(50) DEFAULT NULL COMMENT '年级 大一 大二 大三 大四',
  `did` int(11) DEFAULT NULL COMMENT '学院ID',
  `pid` int(11) DEFAULT NULL COMMENT '专业ID',
  `clasz` varchar(100) DEFAULT NULL COMMENT '班级',
  `record` varchar(50) DEFAULT NULL COMMENT '学历',
  `Id_card` varchar(30) DEFAULT NULL COMMENT '身份证',
  `eid` int(11) DEFAULT NULL COMMENT '长辈ID 家长ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for sys_logs
-- ----------------------------
DROP TABLE IF EXISTS `sys_logs`;
CREATE TABLE `sys_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `module` varchar(50) DEFAULT NULL COMMENT '模块名',
  `flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '成功失败',
  `remark` text COMMENT '备注',
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `createTime` (`createTime`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_logs
-- ----------------------------
BEGIN;
INSERT INTO `sys_logs` VALUES (1, 1, 'web端登陆', 1, NULL, '2020-04-24 12:26:19');
INSERT INTO `sys_logs` VALUES (2, 1, '保存角色', 1, NULL, '2020-04-24 12:27:33');
INSERT INTO `sys_logs` VALUES (3, 1, '保存角色', 1, NULL, '2020-04-24 12:27:44');
INSERT INTO `sys_logs` VALUES (4, 1, '保存角色', 1, NULL, '2020-04-24 12:28:00');
INSERT INTO `sys_logs` VALUES (5, 1, '根据sql在页面显示结果', 1, NULL, '2020-04-24 12:38:23');
INSERT INTO `sys_logs` VALUES (6, 1, '根据sql在页面显示结果', 1, NULL, '2020-04-24 12:38:26');
INSERT INTO `sys_logs` VALUES (7, 1, 'web端登陆', 1, NULL, '2020-04-24 23:03:24');
INSERT INTO `sys_logs` VALUES (8, 1, 'web端登陆', 1, NULL, '2020-04-24 23:03:24');
INSERT INTO `sys_logs` VALUES (9, 1, '修改用户', 1, NULL, '2020-04-24 23:03:52');
INSERT INTO `sys_logs` VALUES (10, 1, 'web端登陆', 1, NULL, '2020-04-24 23:36:34');
INSERT INTO `sys_logs` VALUES (11, 1, '保存公告', 1, NULL, '2020-04-24 23:37:03');
INSERT INTO `sys_logs` VALUES (12, 1, 'web端登陆', 1, NULL, '2020-04-24 23:38:24');
INSERT INTO `sys_logs` VALUES (13, 1, '修改公告', 1, NULL, '2020-04-24 23:38:37');
INSERT INTO `sys_logs` VALUES (14, 1, 'web端登陆', 1, NULL, '2020-04-24 23:42:15');
INSERT INTO `sys_logs` VALUES (15, 1, 'web端登陆', 1, NULL, '2020-04-27 11:18:56');
INSERT INTO `sys_logs` VALUES (16, 1, 'web端登陆', 1, NULL, '2020-04-27 13:40:44');
INSERT INTO `sys_logs` VALUES (17, 1, '保存菜单', 1, NULL, '2020-04-27 13:41:33');
INSERT INTO `sys_logs` VALUES (18, 1, '保存角色', 1, NULL, '2020-04-27 13:41:48');
INSERT INTO `sys_logs` VALUES (19, 1, '生成代码', 1, NULL, '2020-04-27 13:50:06');
INSERT INTO `sys_logs` VALUES (20, 1, 'web端登陆', 1, NULL, '2020-04-27 14:07:25');
INSERT INTO `sys_logs` VALUES (21, 1, '保存菜单', 1, NULL, '2020-04-27 14:08:46');
INSERT INTO `sys_logs` VALUES (22, 1, '修改菜单', 1, NULL, '2020-04-27 14:09:17');
INSERT INTO `sys_logs` VALUES (23, 1, '保存菜单', 1, NULL, '2020-04-27 14:09:44');
INSERT INTO `sys_logs` VALUES (24, 1, '保存菜单', 1, NULL, '2020-04-27 14:10:06');
INSERT INTO `sys_logs` VALUES (25, 1, '保存菜单', 1, NULL, '2020-04-27 14:10:27');
INSERT INTO `sys_logs` VALUES (26, 1, '保存角色', 1, NULL, '2020-04-27 14:14:11');
INSERT INTO `sys_logs` VALUES (27, 1, '退出', 1, NULL, '2020-04-27 14:16:17');
INSERT INTO `sys_logs` VALUES (28, 1, 'web端登陆', 1, NULL, '2020-04-27 15:08:03');
INSERT INTO `sys_logs` VALUES (29, 1, '修改菜单', 1, NULL, '2020-04-27 15:08:35');
INSERT INTO `sys_logs` VALUES (30, 1, '修改菜单', 1, NULL, '2020-04-27 15:08:47');
INSERT INTO `sys_logs` VALUES (31, 1, '修改菜单', 1, NULL, '2020-04-27 15:08:57');
INSERT INTO `sys_logs` VALUES (32, 1, '退出', 1, NULL, '2020-04-27 15:08:59');
INSERT INTO `sys_logs` VALUES (33, 1, 'web端登陆', 1, NULL, '2020-04-27 15:09:06');
INSERT INTO `sys_logs` VALUES (34, 1, 'web端登陆', 1, NULL, '2020-04-27 16:52:23');
INSERT INTO `sys_logs` VALUES (35, 1, 'web端登陆', 1, NULL, '2020-04-27 16:58:22');
INSERT INTO `sys_logs` VALUES (36, 1, 'web端登陆', 1, NULL, '2020-04-27 17:04:54');
INSERT INTO `sys_logs` VALUES (37, 1, 'web端登陆', 1, NULL, '2020-04-27 17:07:06');
INSERT INTO `sys_logs` VALUES (38, 1, '生成代码', 1, NULL, '2020-04-27 17:10:40');
INSERT INTO `sys_logs` VALUES (39, 1, '保存菜单', 1, NULL, '2020-04-27 17:43:41');
INSERT INTO `sys_logs` VALUES (40, 1, '修改菜单', 1, NULL, '2020-04-27 17:43:51');
INSERT INTO `sys_logs` VALUES (41, 1, '保存菜单', 1, NULL, '2020-04-27 17:44:07');
INSERT INTO `sys_logs` VALUES (42, 1, '保存菜单', 1, NULL, '2020-04-27 17:44:28');
INSERT INTO `sys_logs` VALUES (43, 1, '保存菜单', 1, NULL, '2020-04-27 17:44:55');
INSERT INTO `sys_logs` VALUES (44, 1, '保存菜单', 1, NULL, '2020-04-27 17:45:13');
INSERT INTO `sys_logs` VALUES (45, 1, '保存角色', 1, NULL, '2020-04-27 17:45:27');
INSERT INTO `sys_logs` VALUES (46, 1, 'web端登陆', 1, NULL, '2020-04-27 17:49:14');
INSERT INTO `sys_logs` VALUES (47, 1, '修改菜单', 1, NULL, '2020-04-27 17:50:06');
INSERT INTO `sys_logs` VALUES (48, 1, '修改菜单', 1, NULL, '2020-04-27 17:50:23');
INSERT INTO `sys_logs` VALUES (49, 1, '修改菜单', 1, NULL, '2020-04-27 17:50:34');
INSERT INTO `sys_logs` VALUES (50, 1, '修改菜单', 1, NULL, '2020-04-27 17:50:47');
INSERT INTO `sys_logs` VALUES (51, 1, '修改菜单', 1, NULL, '2020-04-27 17:50:59');
INSERT INTO `sys_logs` VALUES (52, 1, '退出', 1, NULL, '2020-04-27 17:51:07');
INSERT INTO `sys_logs` VALUES (53, 1, 'web端登陆', 1, NULL, '2020-04-27 17:51:12');
INSERT INTO `sys_logs` VALUES (54, 1, 'web端登陆', 1, NULL, '2020-04-27 17:55:52');
INSERT INTO `sys_logs` VALUES (55, 1, 'web端登陆', 1, NULL, '2020-04-27 17:57:35');
INSERT INTO `sys_logs` VALUES (56, 1, 'web端登陆', 1, NULL, '2020-04-27 18:06:07');
INSERT INTO `sys_logs` VALUES (57, 1, 'web端登陆', 1, NULL, '2020-04-27 21:08:42');
INSERT INTO `sys_logs` VALUES (58, 1, '生成代码', 1, NULL, '2020-04-27 21:29:40');
INSERT INTO `sys_logs` VALUES (59, 1, '保存菜单', 1, NULL, '2020-04-27 21:37:58');
INSERT INTO `sys_logs` VALUES (60, 1, '保存菜单', 1, NULL, '2020-04-27 21:38:30');
INSERT INTO `sys_logs` VALUES (61, 1, '保存菜单', 1, NULL, '2020-04-27 21:38:46');
INSERT INTO `sys_logs` VALUES (62, 1, '保存菜单', 1, NULL, '2020-04-27 21:39:04');
INSERT INTO `sys_logs` VALUES (63, 1, '保存菜单', 1, NULL, '2020-04-27 21:39:25');
INSERT INTO `sys_logs` VALUES (64, 1, '保存角色', 1, NULL, '2020-04-27 21:39:44');
INSERT INTO `sys_logs` VALUES (65, 1, '保存菜单', 1, NULL, '2020-04-27 21:40:15');
INSERT INTO `sys_logs` VALUES (66, 1, '修改菜单', 1, NULL, '2020-04-27 21:40:38');
INSERT INTO `sys_logs` VALUES (67, 1, '退出', 1, NULL, '2020-04-27 21:40:42');
INSERT INTO `sys_logs` VALUES (68, 1, 'web端登陆', 1, NULL, '2020-04-27 21:42:44');
INSERT INTO `sys_logs` VALUES (69, 1, 'web端登陆', 1, NULL, '2020-04-27 21:44:39');
INSERT INTO `sys_logs` VALUES (70, 1, '生成代码', 1, NULL, '2020-04-27 21:48:37');
INSERT INTO `sys_logs` VALUES (71, 1, 'web端登陆', 1, NULL, '2020-04-27 22:19:35');
INSERT INTO `sys_logs` VALUES (72, 1, '保存菜单', 1, NULL, '2020-04-27 22:21:12');
INSERT INTO `sys_logs` VALUES (73, 1, '保存菜单', 1, NULL, '2020-04-27 22:21:41');
INSERT INTO `sys_logs` VALUES (74, 1, '保存菜单', 1, NULL, '2020-04-27 22:22:09');
INSERT INTO `sys_logs` VALUES (75, 1, '保存菜单', 1, NULL, '2020-04-27 22:22:25');
INSERT INTO `sys_logs` VALUES (76, 1, '保存菜单', 1, NULL, '2020-04-27 22:22:41');
INSERT INTO `sys_logs` VALUES (77, 1, '保存角色', 1, NULL, '2020-04-27 22:22:52');
INSERT INTO `sys_logs` VALUES (78, 1, '退出', 1, NULL, '2020-04-27 22:22:54');
INSERT INTO `sys_logs` VALUES (79, 1, 'web端登陆', 1, NULL, '2020-04-27 22:23:07');
INSERT INTO `sys_logs` VALUES (80, 1, 'web端登陆', 1, NULL, '2020-04-27 22:30:00');
INSERT INTO `sys_logs` VALUES (81, 1, '生成代码', 1, NULL, '2020-04-27 22:53:28');
INSERT INTO `sys_logs` VALUES (82, 1, '保存菜单', 1, NULL, '2020-04-27 23:09:31');
INSERT INTO `sys_logs` VALUES (83, 1, '保存菜单', 1, NULL, '2020-04-27 23:10:09');
INSERT INTO `sys_logs` VALUES (84, 1, '修改菜单', 1, NULL, '2020-04-27 23:10:32');
INSERT INTO `sys_logs` VALUES (85, 1, '保存菜单', 1, NULL, '2020-04-27 23:10:53');
INSERT INTO `sys_logs` VALUES (86, 1, '保存菜单', 1, NULL, '2020-04-27 23:11:13');
INSERT INTO `sys_logs` VALUES (87, 1, '保存菜单', 1, NULL, '2020-04-27 23:11:32');
INSERT INTO `sys_logs` VALUES (88, 1, '保存角色', 1, NULL, '2020-04-27 23:11:42');
INSERT INTO `sys_logs` VALUES (89, 1, '退出', 1, NULL, '2020-04-27 23:11:43');
INSERT INTO `sys_logs` VALUES (90, 1, 'web端登陆', 1, NULL, '2020-04-27 23:15:28');
INSERT INTO `sys_logs` VALUES (91, 1, 'web端登陆', 1, NULL, '2020-04-27 23:45:53');
INSERT INTO `sys_logs` VALUES (92, 1, '生成代码', 1, NULL, '2020-04-27 23:46:53');
INSERT INTO `sys_logs` VALUES (93, 1, '保存菜单', 1, NULL, '2020-04-27 23:53:14');
INSERT INTO `sys_logs` VALUES (94, 1, '保存菜单', 1, NULL, '2020-04-27 23:53:35');
INSERT INTO `sys_logs` VALUES (95, 1, '保存菜单', 1, NULL, '2020-04-27 23:54:01');
INSERT INTO `sys_logs` VALUES (96, 1, '保存菜单', 1, NULL, '2020-04-27 23:54:21');
INSERT INTO `sys_logs` VALUES (97, 1, '保存菜单', 1, NULL, '2020-04-27 23:54:56');
INSERT INTO `sys_logs` VALUES (98, 1, '保存角色', 1, NULL, '2020-04-27 23:55:11');
INSERT INTO `sys_logs` VALUES (99, 1, 'web端登陆', 1, NULL, '2020-04-28 00:02:29');
INSERT INTO `sys_logs` VALUES (100, 1, '修改菜单', 1, NULL, '2020-04-28 00:03:38');
INSERT INTO `sys_logs` VALUES (101, 1, '修改菜单', 1, NULL, '2020-04-28 00:03:49');
INSERT INTO `sys_logs` VALUES (102, 1, '修改菜单', 1, NULL, '2020-04-28 00:03:59');
INSERT INTO `sys_logs` VALUES (103, 1, '修改菜单', 1, NULL, '2020-04-28 00:04:08');
INSERT INTO `sys_logs` VALUES (104, 1, '生成代码', 1, NULL, '2020-04-28 00:05:02');
INSERT INTO `sys_logs` VALUES (105, 1, '保存菜单', 1, NULL, '2020-04-28 00:09:12');
INSERT INTO `sys_logs` VALUES (106, 1, '保存菜单', 1, NULL, '2020-04-28 00:09:38');
INSERT INTO `sys_logs` VALUES (107, 1, '保存菜单', 1, NULL, '2020-04-28 00:09:57');
INSERT INTO `sys_logs` VALUES (108, 1, '保存菜单', 1, NULL, '2020-04-28 00:10:17');
INSERT INTO `sys_logs` VALUES (109, 1, '保存菜单', 1, NULL, '2020-04-28 00:10:49');
INSERT INTO `sys_logs` VALUES (110, 1, '保存角色', 1, NULL, '2020-04-28 00:10:56');
INSERT INTO `sys_logs` VALUES (111, 1, 'web端登陆', 1, NULL, '2020-04-28 00:13:35');
INSERT INTO `sys_logs` VALUES (112, 1, '修改菜单', 1, NULL, '2020-04-28 00:14:14');
INSERT INTO `sys_logs` VALUES (113, 1, '退出', 1, NULL, '2020-04-28 00:14:46');
INSERT INTO `sys_logs` VALUES (114, 1, 'web端登陆', 1, NULL, '2020-04-28 00:14:53');
INSERT INTO `sys_logs` VALUES (115, 1, '退出', 1, NULL, '2020-04-28 00:16:17');
INSERT INTO `sys_logs` VALUES (116, 1, 'web端登陆', 1, NULL, '2020-04-28 00:16:28');
INSERT INTO `sys_logs` VALUES (117, 1, '修改菜单', 1, NULL, '2020-04-28 00:18:15');
INSERT INTO `sys_logs` VALUES (118, 1, '退出', 1, NULL, '2020-04-28 00:18:21');
INSERT INTO `sys_logs` VALUES (119, 1, 'web端登陆', 1, NULL, '2020-04-28 00:18:31');
INSERT INTO `sys_logs` VALUES (120, 1, '退出', 1, NULL, '2020-04-28 00:18:59');
INSERT INTO `sys_logs` VALUES (121, 1, 'web端登陆', 1, NULL, '2020-05-02 09:38:31');
INSERT INTO `sys_logs` VALUES (122, 1, '根据sql导出excel', 1, NULL, '2020-05-02 09:45:01');
INSERT INTO `sys_logs` VALUES (123, 1, '根据sql在页面显示结果', 1, NULL, '2020-05-02 09:45:01');
INSERT INTO `sys_logs` VALUES (124, 1, '保存邮件', 1, NULL, '2020-05-02 10:07:17');
INSERT INTO `sys_logs` VALUES (125, 1, '生成代码', 1, NULL, '2020-05-02 10:29:25');
INSERT INTO `sys_logs` VALUES (126, 1, '保存菜单', 1, NULL, '2020-05-02 10:33:30');
INSERT INTO `sys_logs` VALUES (127, 1, '保存角色', 1, NULL, '2020-05-02 10:33:59');
INSERT INTO `sys_logs` VALUES (128, 1, 'web端登陆', 1, NULL, '2020-05-02 10:37:30');
INSERT INTO `sys_logs` VALUES (129, 1, 'web端登陆', 1, NULL, '2020-05-02 12:27:18');
INSERT INTO `sys_logs` VALUES (130, 1, 'web端登陆', 1, NULL, '2020-05-02 12:30:15');
INSERT INTO `sys_logs` VALUES (131, 1, 'web端登陆', 1, NULL, '2020-05-02 12:31:59');
INSERT INTO `sys_logs` VALUES (132, 1, 'web端登陆', 1, NULL, '2020-05-02 21:29:32');
INSERT INTO `sys_logs` VALUES (133, 1, 'web端登陆', 1, NULL, '2020-05-02 21:33:23');
INSERT INTO `sys_logs` VALUES (134, 1, 'web端登陆', 1, NULL, '2020-05-02 21:45:31');
INSERT INTO `sys_logs` VALUES (135, 1, 'web端登陆', 1, NULL, '2020-05-02 21:53:25');
INSERT INTO `sys_logs` VALUES (136, 1, 'web端登陆', 1, NULL, '2020-05-02 21:58:14');
INSERT INTO `sys_logs` VALUES (137, 1, 'web端登陆', 1, NULL, '2020-05-02 21:58:58');
INSERT INTO `sys_logs` VALUES (138, 1, 'web端登陆', 1, NULL, '2020-05-02 22:02:06');
INSERT INTO `sys_logs` VALUES (139, 1, 'web端登陆', 1, NULL, '2020-05-02 22:06:47');
INSERT INTO `sys_logs` VALUES (140, 1, 'web端登陆', 1, NULL, '2020-05-02 22:09:06');
INSERT INTO `sys_logs` VALUES (141, 1, '退出', 1, NULL, '2020-05-02 23:33:22');
INSERT INTO `sys_logs` VALUES (142, 1, 'web端登陆', 1, NULL, '2020-05-02 23:33:29');
INSERT INTO `sys_logs` VALUES (143, 1, '保存菜单', 1, NULL, '2020-05-02 23:35:37');
INSERT INTO `sys_logs` VALUES (144, 1, '修改菜单', 1, NULL, '2020-05-02 23:35:52');
INSERT INTO `sys_logs` VALUES (145, 1, '保存菜单', 1, NULL, '2020-05-02 23:36:26');
INSERT INTO `sys_logs` VALUES (146, 1, '保存菜单', 1, NULL, '2020-05-02 23:36:52');
INSERT INTO `sys_logs` VALUES (147, 1, '保存角色', 1, NULL, '2020-05-02 23:37:10');
INSERT INTO `sys_logs` VALUES (148, 1, '退出', 1, NULL, '2020-05-02 23:37:12');
INSERT INTO `sys_logs` VALUES (149, 1, 'web端登陆', 1, NULL, '2020-05-02 23:37:17');
INSERT INTO `sys_logs` VALUES (150, 1, '修改菜单', 1, NULL, '2020-05-02 23:42:47');
INSERT INTO `sys_logs` VALUES (151, 1, 'web端登陆', 1, NULL, '2020-05-03 00:01:39');
INSERT INTO `sys_logs` VALUES (152, 1, 'web端登陆', 1, NULL, '2020-05-03 00:09:29');
INSERT INTO `sys_logs` VALUES (153, 1, 'web端登陆', 1, NULL, '2020-05-03 00:14:43');
INSERT INTO `sys_logs` VALUES (154, 1, 'web端登陆', 1, NULL, '2020-05-03 00:32:05');
INSERT INTO `sys_logs` VALUES (155, 1, 'web端登陆', 1, NULL, '2020-05-03 00:37:44');
INSERT INTO `sys_logs` VALUES (156, 1, 'web端登陆', 1, NULL, '2020-05-03 00:39:17');
INSERT INTO `sys_logs` VALUES (157, 1, 'web端登陆', 1, NULL, '2020-05-03 00:49:12');
INSERT INTO `sys_logs` VALUES (158, 1, 'web端登陆', 1, NULL, '2020-05-03 00:50:56');
INSERT INTO `sys_logs` VALUES (159, 1, 'web端登陆', 1, NULL, '2020-05-03 00:55:33');
INSERT INTO `sys_logs` VALUES (160, 1, 'web端登陆', 1, NULL, '2020-05-03 01:21:52');
INSERT INTO `sys_logs` VALUES (161, 1, 'web端登陆', 1, NULL, '2020-05-03 01:25:13');
INSERT INTO `sys_logs` VALUES (162, 1, 'web端登陆', 1, NULL, '2020-05-03 01:26:02');
INSERT INTO `sys_logs` VALUES (163, 1, 'web端登陆', 1, NULL, '2020-05-03 01:31:10');
INSERT INTO `sys_logs` VALUES (164, 1, '退出', 1, NULL, '2020-05-03 01:31:46');
INSERT INTO `sys_logs` VALUES (165, 1, 'web端登陆', 1, NULL, '2020-05-03 01:32:05');
INSERT INTO `sys_logs` VALUES (166, 1, 'web端登陆', 1, NULL, '2020-05-03 10:34:03');
INSERT INTO `sys_logs` VALUES (167, 1, 'web端登陆', 1, NULL, '2020-05-03 11:46:52');
INSERT INTO `sys_logs` VALUES (168, 1, '保存菜单', 1, NULL, '2020-05-03 11:48:19');
INSERT INTO `sys_logs` VALUES (169, 1, '保存菜单', 1, NULL, '2020-05-03 11:48:47');
INSERT INTO `sys_logs` VALUES (170, 1, '保存角色', 1, NULL, '2020-05-03 11:49:11');
INSERT INTO `sys_logs` VALUES (171, 1, '退出', 1, NULL, '2020-05-03 11:49:12');
INSERT INTO `sys_logs` VALUES (172, 1, 'web端登陆', 1, NULL, '2020-05-03 11:49:22');
INSERT INTO `sys_logs` VALUES (173, 1, 'web端登陆', 1, NULL, '2020-05-03 12:04:18');
INSERT INTO `sys_logs` VALUES (174, 1, 'web端登陆', 1, NULL, '2020-05-03 12:08:15');
INSERT INTO `sys_logs` VALUES (175, 1, 'web端登陆', 1, NULL, '2020-05-03 12:20:40');
INSERT INTO `sys_logs` VALUES (176, 1, 'web端登陆', 1, NULL, '2020-05-03 12:24:55');
INSERT INTO `sys_logs` VALUES (177, 1, '修改菜单', 1, NULL, '2020-05-03 12:28:01');
INSERT INTO `sys_logs` VALUES (178, 1, 'web端登陆', 1, NULL, '2020-05-03 12:39:41');
INSERT INTO `sys_logs` VALUES (179, 1, 'web端登陆', 1, NULL, '2020-05-03 12:44:57');
INSERT INTO `sys_logs` VALUES (180, 1, '修改菜单', 1, NULL, '2020-05-03 12:55:35');
INSERT INTO `sys_logs` VALUES (181, 1, 'web端登陆', 1, NULL, '2020-05-03 13:16:06');
INSERT INTO `sys_logs` VALUES (182, 1, 'web端登陆', 1, NULL, '2020-05-03 13:16:45');
INSERT INTO `sys_logs` VALUES (183, 1, 'web端登陆', 1, NULL, '2020-05-03 13:36:19');
INSERT INTO `sys_logs` VALUES (184, 1, 'web端登陆', 1, NULL, '2020-05-03 13:50:24');
INSERT INTO `sys_logs` VALUES (185, 1, '保存菜单', 1, NULL, '2020-05-03 13:57:44');
INSERT INTO `sys_logs` VALUES (186, 1, '保存角色', 1, NULL, '2020-05-03 13:58:04');
INSERT INTO `sys_logs` VALUES (187, 1, '退出', 1, NULL, '2020-05-03 13:58:07');
INSERT INTO `sys_logs` VALUES (188, 1, 'web端登陆', 1, NULL, '2020-05-03 13:58:13');
INSERT INTO `sys_logs` VALUES (189, 1, 'web端登陆', 1, NULL, '2020-05-03 14:35:50');
INSERT INTO `sys_logs` VALUES (190, 1, 'web端登陆', 1, NULL, '2020-05-03 15:37:54');
INSERT INTO `sys_logs` VALUES (191, 1, 'web端登陆', 1, NULL, '2020-05-03 15:52:10');
INSERT INTO `sys_logs` VALUES (192, 1, 'web端登陆', 1, NULL, '2020-05-03 15:52:31');
INSERT INTO `sys_logs` VALUES (193, 1, 'web端登陆', 1, NULL, '2020-05-03 16:34:26');
INSERT INTO `sys_logs` VALUES (194, 1, 'web端登陆', 1, NULL, '2020-05-03 17:08:34');
INSERT INTO `sys_logs` VALUES (195, 1, '文件上传', 1, NULL, '2020-05-03 17:08:44');
INSERT INTO `sys_logs` VALUES (196, 1, '文件上传', 1, NULL, '2020-05-03 17:09:08');
INSERT INTO `sys_logs` VALUES (197, 1, 'web端登陆', 1, NULL, '2020-05-03 17:12:49');
INSERT INTO `sys_logs` VALUES (198, 1, '文件上传', 1, NULL, '2020-05-03 17:13:06');
INSERT INTO `sys_logs` VALUES (199, 1, '文件上传', 1, NULL, '2020-05-03 17:23:42');
INSERT INTO `sys_logs` VALUES (200, 1, 'web端登陆', 1, NULL, '2020-05-03 17:28:44');
INSERT INTO `sys_logs` VALUES (201, 1, '文件上传', 1, NULL, '2020-05-03 17:29:28');
INSERT INTO `sys_logs` VALUES (202, 1, 'web端登陆', 1, NULL, '2020-05-03 18:01:07');
INSERT INTO `sys_logs` VALUES (203, 1, '文件上传', 1, NULL, '2020-05-03 18:01:40');
INSERT INTO `sys_logs` VALUES (204, 1, '文件上传', 1, NULL, '2020-05-03 18:02:30');
INSERT INTO `sys_logs` VALUES (205, 1, 'web端登陆', 1, NULL, '2020-05-03 18:05:39');
INSERT INTO `sys_logs` VALUES (206, 1, '文件上传', 1, NULL, '2020-05-03 18:06:00');
INSERT INTO `sys_logs` VALUES (207, 1, '文件上传', 1, NULL, '2020-05-03 18:09:35');
INSERT INTO `sys_logs` VALUES (208, 1, '文件上传', 1, NULL, '2020-05-03 18:12:56');
INSERT INTO `sys_logs` VALUES (209, 1, 'web端登陆', 1, NULL, '2020-05-03 18:15:33');
INSERT INTO `sys_logs` VALUES (210, 1, '文件上传', 1, NULL, '2020-05-03 18:16:06');
INSERT INTO `sys_logs` VALUES (211, 1, 'web端登陆', 1, NULL, '2020-05-03 18:21:27');
INSERT INTO `sys_logs` VALUES (212, 1, '文件上传', 1, NULL, '2020-05-03 18:21:41');
INSERT INTO `sys_logs` VALUES (213, 1, 'web端登陆', 1, NULL, '2020-05-03 18:23:10');
INSERT INTO `sys_logs` VALUES (214, 1, '文件上传', 1, NULL, '2020-05-03 18:23:33');
COMMIT;

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `css` varchar(30) DEFAULT NULL,
  `href` varchar(1000) DEFAULT NULL,
  `type` tinyint(1) NOT NULL,
  `permission` varchar(50) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
BEGIN;
INSERT INTO `sys_permission` VALUES (1, 0, '用户管理', 'fa-users', 'pages/user/userList.html', 1, '', 1);
INSERT INTO `sys_permission` VALUES (2, 1, '用户查询', 'fa-user', 'pages/user/userList.html', 1, '', 2);
INSERT INTO `sys_permission` VALUES (3, 2, '查询', '', '', 2, 'sys:user:query', 100);
INSERT INTO `sys_permission` VALUES (4, 2, '新增', '', '', 2, 'sys:user:add', 100);
INSERT INTO `sys_permission` VALUES (6, 0, '修改密码', 'fa-pencil-square-o', 'pages/user/changePassword.html', 1, 'sys:user:password', 4);
INSERT INTO `sys_permission` VALUES (7, 0, '系统设置', 'fa-gears', '', 1, '', 5);
INSERT INTO `sys_permission` VALUES (8, 7, '菜单', 'fa-cog', 'pages/menu/menuList.html', 1, '', 6);
INSERT INTO `sys_permission` VALUES (9, 8, '查询', '', '', 2, 'sys:menu:query', 100);
INSERT INTO `sys_permission` VALUES (10, 8, '新增', '', '', 2, 'sys:menu:add', 100);
INSERT INTO `sys_permission` VALUES (11, 8, '删除', '', '', 2, 'sys:menu:del', 100);
INSERT INTO `sys_permission` VALUES (12, 7, '角色', 'fa-user-secret', 'pages/role/roleList.html', 1, '', 7);
INSERT INTO `sys_permission` VALUES (13, 12, '查询', '', '', 2, 'sys:role:query', 100);
INSERT INTO `sys_permission` VALUES (14, 12, '新增', '', '', 2, 'sys:role:add', 100);
INSERT INTO `sys_permission` VALUES (15, 12, '删除', '', '', 2, 'sys:role:del', 100);
INSERT INTO `sys_permission` VALUES (16, 0, '文件管理', 'fa-folder-open', 'pages/file/fileList.html', 1, '', 8);
INSERT INTO `sys_permission` VALUES (17, 16, '查询', '', '', 2, 'sys:file:query', 100);
INSERT INTO `sys_permission` VALUES (18, 16, '删除', '', '', 2, 'sys:file:del', 100);
INSERT INTO `sys_permission` VALUES (19, 0, '数据源监控', 'fa-eye', 'druid/index.html', 1, '', 9);
INSERT INTO `sys_permission` VALUES (20, 0, '接口swagger', 'fa-file-pdf-o', 'swagger-ui.html', 1, '', 10);
INSERT INTO `sys_permission` VALUES (21, 0, '代码生成', 'fa-wrench', 'pages/generate/edit.html', 1, 'generate:edit', 11);
INSERT INTO `sys_permission` VALUES (22, 0, '公告/发帖管理', 'fa-book', 'pages/notice/noticeList.html', 1, '', 12);
INSERT INTO `sys_permission` VALUES (23, 22, '查询', '', '', 2, 'notice:query', 100);
INSERT INTO `sys_permission` VALUES (24, 22, '添加', '', '', 2, 'notice:add', 100);
INSERT INTO `sys_permission` VALUES (25, 22, '删除', '', '', 2, 'notice:del', 100);
INSERT INTO `sys_permission` VALUES (26, 0, '日志查询', 'fa-reorder', 'pages/log/logList.html', 1, 'sys:log:query', 13);
INSERT INTO `sys_permission` VALUES (27, 0, '邮件管理', 'fa-envelope', 'pages/mail/mailList.html', 1, '', 14);
INSERT INTO `sys_permission` VALUES (28, 27, '发送邮件', '', '', 2, 'mail:send', 100);
INSERT INTO `sys_permission` VALUES (29, 27, '查询', '', '', 2, 'mail:all:query', 100);
INSERT INTO `sys_permission` VALUES (30, 0, '定时任务管理', 'fa-tasks', 'pages/job/jobList.html', 1, '', 15);
INSERT INTO `sys_permission` VALUES (31, 30, '查询', '', '', 2, 'job:query', 100);
INSERT INTO `sys_permission` VALUES (32, 30, '新增', '', '', 2, 'job:add', 100);
INSERT INTO `sys_permission` VALUES (33, 30, '删除', '', '', 2, 'job:del', 100);
INSERT INTO `sys_permission` VALUES (34, 0, 'excel导出', 'fa-arrow-circle-down', 'pages/excel/sql.html', 1, '', 16);
INSERT INTO `sys_permission` VALUES (35, 34, '导出', '', '', 2, 'excel:down', 100);
INSERT INTO `sys_permission` VALUES (36, 34, '页面显示数据', '', '', 2, 'excel:show:datas', 100);
INSERT INTO `sys_permission` VALUES (37, 0, '字典管理', 'fa-reddit', 'pages/dict/dictList.html', 1, '', 17);
INSERT INTO `sys_permission` VALUES (38, 37, '查询', '', '', 2, 'dict:query', 100);
INSERT INTO `sys_permission` VALUES (39, 37, '新增', '', '', 2, 'dict:add', 100);
INSERT INTO `sys_permission` VALUES (40, 37, '删除', '', '', 2, 'dict:del', 100);
INSERT INTO `sys_permission` VALUES (41, 0, '工作台', 'fa-tencent-weibo', '', 1, '', 100);
INSERT INTO `sys_permission` VALUES (42, 41, '设施保修管理', 'fa-recycle', '/pages/sheshi/rmasSheshiList.html', 1, '', 100);
INSERT INTO `sys_permission` VALUES (43, 42, '查询', '', '', 2, 'sheshi:query', 100);
INSERT INTO `sys_permission` VALUES (44, 42, '新增', '', '', 2, 'sheshi:add', 100);
INSERT INTO `sys_permission` VALUES (45, 42, '修改', '', '', 2, 'sheshi:update', 100);
INSERT INTO `sys_permission` VALUES (46, 41, '宿舍管理', 'fa-heart', '/pages/room/rmasRoomList.html', 1, '', 100);
INSERT INTO `sys_permission` VALUES (47, 46, '查询', '', '', 2, 'room:query', 100);
INSERT INTO `sys_permission` VALUES (48, 46, '新增', '', '', 2, 'room:add', 100);
INSERT INTO `sys_permission` VALUES (49, 46, '修改', '', '', 2, 'room:update', 100);
INSERT INTO `sys_permission` VALUES (50, 46, '删除', '', '', 2, 'room:del', 100);
INSERT INTO `sys_permission` VALUES (51, 41, '费用管理', 'fa-send-o', '/pages/dian/rmasDianList.html', 1, '', 100);
INSERT INTO `sys_permission` VALUES (52, 51, '查询', '', '', 2, 'dian:query', 100);
INSERT INTO `sys_permission` VALUES (53, 51, '新增', '', '', 2, 'dian:add', 100);
INSERT INTO `sys_permission` VALUES (54, 51, '修改', '', '', 2, 'dian:update', 100);
INSERT INTO `sys_permission` VALUES (55, 51, '删除', '', '', 2, 'dian:del', 100);
INSERT INTO `sys_permission` VALUES (56, 42, '删除', '', '', 2, 'sheshi:del', 100);
INSERT INTO `sys_permission` VALUES (57, 41, '晚归管理', 'fa-google', '/pages/goback/rmasGobackList.html', 1, '', 100);
INSERT INTO `sys_permission` VALUES (58, 57, '查询', '', '', 2, 'goback:query', 100);
INSERT INTO `sys_permission` VALUES (59, 57, '新增', '', '', 2, 'goback:add', 100);
INSERT INTO `sys_permission` VALUES (60, 57, '修改', '', '', 2, 'goback:update', 100);
INSERT INTO `sys_permission` VALUES (61, 57, '删除', '', '', 2, 'goback:del', 100);
INSERT INTO `sys_permission` VALUES (62, 41, '晚熄灯管理', 'fa-tree', '/pages/light/rmasLightList.html', 1, '', 100);
INSERT INTO `sys_permission` VALUES (63, 62, '查询', '', '', 2, 'light:query', 100);
INSERT INTO `sys_permission` VALUES (64, 62, '新增', '', '', 2, 'light:add', 100);
INSERT INTO `sys_permission` VALUES (65, 62, '修改', '', '', 2, 'light:update', 100);
INSERT INTO `sys_permission` VALUES (66, 62, '删除', '', '', 2, 'light:del', 100);
INSERT INTO `sys_permission` VALUES (67, 41, '来访登记', 'fa-check', '/pages/asign/rmasAsignList.html', 1, '', 100);
INSERT INTO `sys_permission` VALUES (68, 67, '查询', '', '', 2, 'asign:query', 100);
INSERT INTO `sys_permission` VALUES (69, 67, '新增', '', '', 2, 'asign:add', 100);
INSERT INTO `sys_permission` VALUES (70, 67, '修改', '', '', 2, 'asign:update', 100);
INSERT INTO `sys_permission` VALUES (71, 67, '删除', '', '', 2, 'asign:del', 100);
INSERT INTO `sys_permission` VALUES (72, 41, '自习室管理', 'fa-location-arrow', '/pages/sturoom/rmasSturoomList.html', 1, '', 100);
INSERT INTO `sys_permission` VALUES (73, 72, '查询', '', '', 2, 'sturoom:query', 100);
INSERT INTO `sys_permission` VALUES (74, 72, '新增', '', '', 2, 'sturoom:add', 100);
INSERT INTO `sys_permission` VALUES (75, 72, '修改', '', '', 2, 'sturoom:update', 100);
INSERT INTO `sys_permission` VALUES (76, 72, '删除', '', '', 2, 'sturoom:del', 100);
INSERT INTO `sys_permission` VALUES (77, 41, '统计管理', 'fa-sliders', '/pages/tongji/rmasTongjiList.html', 1, '', 100);
INSERT INTO `sys_permission` VALUES (78, 41, '学生端晚归管理', 'fa-check', '/pages/goback/rmasGobackListToStu.html', 1, '', 100);
INSERT INTO `sys_permission` VALUES (79, 78, '查询', '', '', 2, 'goback:query', 100);
INSERT INTO `sys_permission` VALUES (80, 78, '修改', '', '', 2, 'goback:updateToStu', 100);
INSERT INTO `sys_permission` VALUES (81, 41, '学生端晚熄灯管理', '', '/pages/light/rmasLightListToStu.html', 1, '', 100);
INSERT INTO `sys_permission` VALUES (82, 81, '修改', '', '', 2, 'light:updateToStu', 100);
INSERT INTO `sys_permission` VALUES (83, 42, '处理确认', '', '', 2, 'sheshi:queren', 100);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '管理员', '管理员', '2017-05-01 13:25:39', '2020-05-03 13:58:04');
INSERT INTO `sys_role` VALUES (2, '教师', '教师', '2017-08-01 21:47:31', '2020-04-24 12:27:44');
INSERT INTO `sys_role` VALUES (3, '学生', '学生', '2020-04-24 12:28:00', '2020-04-24 12:28:00');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `roleId` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`,`permissionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_permission` VALUES (1, 1);
INSERT INTO `sys_role_permission` VALUES (1, 2);
INSERT INTO `sys_role_permission` VALUES (1, 3);
INSERT INTO `sys_role_permission` VALUES (1, 4);
INSERT INTO `sys_role_permission` VALUES (1, 6);
INSERT INTO `sys_role_permission` VALUES (1, 7);
INSERT INTO `sys_role_permission` VALUES (1, 8);
INSERT INTO `sys_role_permission` VALUES (1, 9);
INSERT INTO `sys_role_permission` VALUES (1, 10);
INSERT INTO `sys_role_permission` VALUES (1, 11);
INSERT INTO `sys_role_permission` VALUES (1, 12);
INSERT INTO `sys_role_permission` VALUES (1, 13);
INSERT INTO `sys_role_permission` VALUES (1, 14);
INSERT INTO `sys_role_permission` VALUES (1, 15);
INSERT INTO `sys_role_permission` VALUES (1, 16);
INSERT INTO `sys_role_permission` VALUES (1, 17);
INSERT INTO `sys_role_permission` VALUES (1, 18);
INSERT INTO `sys_role_permission` VALUES (1, 19);
INSERT INTO `sys_role_permission` VALUES (1, 20);
INSERT INTO `sys_role_permission` VALUES (1, 21);
INSERT INTO `sys_role_permission` VALUES (1, 22);
INSERT INTO `sys_role_permission` VALUES (1, 23);
INSERT INTO `sys_role_permission` VALUES (1, 24);
INSERT INTO `sys_role_permission` VALUES (1, 25);
INSERT INTO `sys_role_permission` VALUES (1, 26);
INSERT INTO `sys_role_permission` VALUES (1, 27);
INSERT INTO `sys_role_permission` VALUES (1, 28);
INSERT INTO `sys_role_permission` VALUES (1, 29);
INSERT INTO `sys_role_permission` VALUES (1, 30);
INSERT INTO `sys_role_permission` VALUES (1, 31);
INSERT INTO `sys_role_permission` VALUES (1, 32);
INSERT INTO `sys_role_permission` VALUES (1, 33);
INSERT INTO `sys_role_permission` VALUES (1, 34);
INSERT INTO `sys_role_permission` VALUES (1, 35);
INSERT INTO `sys_role_permission` VALUES (1, 36);
INSERT INTO `sys_role_permission` VALUES (1, 37);
INSERT INTO `sys_role_permission` VALUES (1, 38);
INSERT INTO `sys_role_permission` VALUES (1, 39);
INSERT INTO `sys_role_permission` VALUES (1, 40);
INSERT INTO `sys_role_permission` VALUES (1, 41);
INSERT INTO `sys_role_permission` VALUES (1, 42);
INSERT INTO `sys_role_permission` VALUES (1, 43);
INSERT INTO `sys_role_permission` VALUES (1, 44);
INSERT INTO `sys_role_permission` VALUES (1, 45);
INSERT INTO `sys_role_permission` VALUES (1, 46);
INSERT INTO `sys_role_permission` VALUES (1, 47);
INSERT INTO `sys_role_permission` VALUES (1, 48);
INSERT INTO `sys_role_permission` VALUES (1, 49);
INSERT INTO `sys_role_permission` VALUES (1, 50);
INSERT INTO `sys_role_permission` VALUES (1, 51);
INSERT INTO `sys_role_permission` VALUES (1, 52);
INSERT INTO `sys_role_permission` VALUES (1, 53);
INSERT INTO `sys_role_permission` VALUES (1, 54);
INSERT INTO `sys_role_permission` VALUES (1, 55);
INSERT INTO `sys_role_permission` VALUES (1, 57);
INSERT INTO `sys_role_permission` VALUES (1, 58);
INSERT INTO `sys_role_permission` VALUES (1, 59);
INSERT INTO `sys_role_permission` VALUES (1, 60);
INSERT INTO `sys_role_permission` VALUES (1, 61);
INSERT INTO `sys_role_permission` VALUES (1, 62);
INSERT INTO `sys_role_permission` VALUES (1, 63);
INSERT INTO `sys_role_permission` VALUES (1, 64);
INSERT INTO `sys_role_permission` VALUES (1, 65);
INSERT INTO `sys_role_permission` VALUES (1, 66);
INSERT INTO `sys_role_permission` VALUES (1, 67);
INSERT INTO `sys_role_permission` VALUES (1, 68);
INSERT INTO `sys_role_permission` VALUES (1, 69);
INSERT INTO `sys_role_permission` VALUES (1, 70);
INSERT INTO `sys_role_permission` VALUES (1, 71);
INSERT INTO `sys_role_permission` VALUES (1, 72);
INSERT INTO `sys_role_permission` VALUES (1, 73);
INSERT INTO `sys_role_permission` VALUES (1, 74);
INSERT INTO `sys_role_permission` VALUES (1, 75);
INSERT INTO `sys_role_permission` VALUES (1, 76);
INSERT INTO `sys_role_permission` VALUES (1, 77);
INSERT INTO `sys_role_permission` VALUES (1, 78);
INSERT INTO `sys_role_permission` VALUES (1, 79);
INSERT INTO `sys_role_permission` VALUES (1, 80);
INSERT INTO `sys_role_permission` VALUES (1, 81);
INSERT INTO `sys_role_permission` VALUES (1, 82);
INSERT INTO `sys_role_permission` VALUES (1, 83);
INSERT INTO `sys_role_permission` VALUES (2, 1);
INSERT INTO `sys_role_permission` VALUES (2, 2);
INSERT INTO `sys_role_permission` VALUES (2, 3);
INSERT INTO `sys_role_permission` VALUES (2, 4);
INSERT INTO `sys_role_permission` VALUES (2, 6);
INSERT INTO `sys_role_permission` VALUES (2, 7);
INSERT INTO `sys_role_permission` VALUES (2, 8);
INSERT INTO `sys_role_permission` VALUES (2, 9);
INSERT INTO `sys_role_permission` VALUES (2, 10);
INSERT INTO `sys_role_permission` VALUES (2, 11);
INSERT INTO `sys_role_permission` VALUES (2, 12);
INSERT INTO `sys_role_permission` VALUES (2, 13);
INSERT INTO `sys_role_permission` VALUES (2, 14);
INSERT INTO `sys_role_permission` VALUES (2, 15);
INSERT INTO `sys_role_permission` VALUES (2, 16);
INSERT INTO `sys_role_permission` VALUES (2, 17);
INSERT INTO `sys_role_permission` VALUES (2, 18);
INSERT INTO `sys_role_permission` VALUES (2, 19);
INSERT INTO `sys_role_permission` VALUES (2, 20);
INSERT INTO `sys_role_permission` VALUES (2, 21);
INSERT INTO `sys_role_permission` VALUES (2, 22);
INSERT INTO `sys_role_permission` VALUES (2, 23);
INSERT INTO `sys_role_permission` VALUES (2, 24);
INSERT INTO `sys_role_permission` VALUES (2, 25);
INSERT INTO `sys_role_permission` VALUES (2, 30);
INSERT INTO `sys_role_permission` VALUES (2, 31);
INSERT INTO `sys_role_permission` VALUES (2, 34);
INSERT INTO `sys_role_permission` VALUES (2, 36);
INSERT INTO `sys_role_permission` VALUES (3, 6);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_user` VALUES (1, 1);
INSERT INTO `sys_role_user` VALUES (2, 3);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `headImgUrl` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `telephone` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `site` varchar(255) NOT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', '1015ed3b5f1345911198c995f9ad097e', '87e03afa1f0122531f729c9a7453f475', '管理员', NULL, '', '', '', '1998-07-01', '', 0, 1, '2017-04-10 15:21:38', '2017-07-06 09:20:19');
INSERT INTO `sys_user` VALUES (2, 'user', '72c2e62dba72e5f178542313803f33d1', '143292269df8c63e2da1a9ba2aeff43c', '用户', NULL, '', '', '', NULL, '', 1, 1, '2017-08-01 21:47:18', '2020-04-24 23:03:53');
COMMIT;

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(16) NOT NULL,
  `k` varchar(16) NOT NULL,
  `val` varchar(64) NOT NULL,
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`k`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
BEGIN;
INSERT INTO `t_dict` VALUES (1, 'sex', '0', '女', '2017-11-17 09:58:24', '2017-11-18 14:21:05');
INSERT INTO `t_dict` VALUES (2, 'sex', '1', '男', '2017-11-17 10:03:46', '2017-11-17 10:03:46');
INSERT INTO `t_dict` VALUES (3, 'userStatus', '0', '无效', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES (4, 'userStatus', '1', '正常', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES (5, 'userStatus', '2', '锁定', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES (6, 'noticeStatus', '0', '草稿', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES (7, 'noticeStatus', '1', '发布', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES (8, 'isRead', '0', '未读', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
INSERT INTO `t_dict` VALUES (9, 'isRead', '1', '已读', '2017-11-17 16:26:06', '2017-11-17 16:26:09');
COMMIT;

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobName` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `cron` varchar(64) NOT NULL,
  `springBeanName` varchar(64) NOT NULL COMMENT 'springBean名',
  `methodName` varchar(64) NOT NULL COMMENT '方法名',
  `isSysJob` tinyint(1) NOT NULL COMMENT '是否是系统job',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobName` (`jobName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for t_mail
-- ----------------------------
DROP TABLE IF EXISTS `t_mail`;
CREATE TABLE `t_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '发送人',
  `subject` varchar(255) NOT NULL COMMENT '标题',
  `content` longtext NOT NULL COMMENT '正文',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_mail
-- ----------------------------
BEGIN;
INSERT INTO `t_mail` VALUES (1, 1, 'e', 'test<img src=\"http://localhost:8080/layui/images/face/25.gif\" alt=\"[抱抱]\">', '2020-05-02 10:07:17', '2020-05-02 10:07:17');
COMMIT;

-- ----------------------------
-- Table structure for t_mail_to
-- ----------------------------
DROP TABLE IF EXISTS `t_mail_to`;
CREATE TABLE `t_mail_to` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mailId` int(11) NOT NULL,
  `toUser` varchar(128) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1成功，0失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_mail_to
-- ----------------------------
BEGIN;
INSERT INTO `t_mail_to` VALUES (1, 1, '18501723710@163.com', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `createTime` datetime NOT NULL,
  `updateTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
BEGIN;
INSERT INTO `t_notice` VALUES (1, 'qweqwe', 'qwewqeqw&nbsp;', 1, '2020-04-24 23:37:04', '2020-04-24 23:38:38');
COMMIT;

-- ----------------------------
-- Table structure for t_notice_read
-- ----------------------------
DROP TABLE IF EXISTS `t_notice_read`;
CREATE TABLE `t_notice_read` (
  `noticeId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`noticeId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_notice_read
-- ----------------------------
BEGIN;
INSERT INTO `t_notice_read` VALUES (1, 1, '2020-04-24 23:38:40');
COMMIT;

-- ----------------------------
-- Table structure for wzapply
-- ----------------------------
DROP TABLE IF EXISTS `wzapply`;
CREATE TABLE `wzapply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wztype` varchar(100) DEFAULT NULL COMMENT '物资品类',
  `wzaddress` varchar(100) DEFAULT NULL COMMENT '物资来源地',
  `wzprice` decimal(17,2) DEFAULT NULL COMMENT '物资价格',
  `wzbigprice` decimal(17,2) DEFAULT NULL COMMENT '物资最高申请额度',
  `wznum` int(11) DEFAULT NULL COMMENT '申请量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wzapply
-- ----------------------------
BEGIN;
INSERT INTO `wzapply` VALUES (13, '医用N95口罩', '湖北武汉', 3.50, 30000.00, 20, NULL);
INSERT INTO `wzapply` VALUES (14, '医用防护服', '湖北宜昌', 20.00, 10000.00, 2000, NULL);
INSERT INTO `wzapply` VALUES (15, '医用护目镜', '北京', 3.80, 50000.00, 20000, '2020-04-23 17:19:24');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
