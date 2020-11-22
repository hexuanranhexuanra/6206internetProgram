/*
 Navicat Premium Data Transfer

 Source Server         : zmt
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : localhost:3306
 Source Schema         : mooc

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 30/10/2020 07:02:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for coursebase
-- ----------------------------
DROP TABLE IF EXISTS `coursebase`;
CREATE TABLE `coursebase`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `coursesummary` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `courseintroduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '计算机入门课',
  `teacherid` int(11) NOT NULL,
  `clickRate` int(11) NOT NULL DEFAULT 0 COMMENT '课程点击量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course`(`coursename`) USING BTREE,
  INDEX `teacherid`(`teacherid`) USING BTREE,
  CONSTRAINT `teacherid` FOREIGN KEY (`teacherid`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coursebase
-- ----------------------------
INSERT INTO `coursebase` VALUES (1, 'Principles of Computer Composition', 'This course, entitled \"Charismatic Linguistics\", is an introduction to language studies and aims to lay a preliminary foundation for students to learn and study languages at university level.To be specific, through the study of this course, students can understand the basic knowledge of linguistics (basic concepts, basic theories);Take an interest in English linguistics;Develop language awareness (sensitivity to language itself and its use);Improve your English language skills.This course mainly involves the basic knowledge and main concepts of the origin of language, the essential characteristics of language, phonetics, lexicology, grammar, semantics, pragmatics, variations of language, punctuation and other aspects.Through some incomplete academic problems, this paper introduces some language phenomena, and discusses the nature, laws and use of language by combining these phenomena.', 'img/course/zuchengyuanli.jpg', 2025, 'Introductory Computer Course', 1, 49);
INSERT INTO `coursebase` VALUES (2, 'C language programming', 'C language is an excellent representative of structured programming languages, and has been the top three programming languages for many years.In this course, we will learn the three basic structures of C programming, modular programming ideas and implementations, and the rich data types of C.Through the learning of these knowledge and programming practice, students can master the basic methods of programming;To cultivate the ability of computational thinking and the ability to analyze and solve problems with computers.Read more programs, more programming and computer debugging program, you can learn C language program design.', 'img/course/cyuyan.jpg', 19, 'Introductory Computer Course', 2, 13);
INSERT INTO `coursebase` VALUES (3, 'Java language programming', 'Java course is a necessary course for Java software engineers to learn and apply Java. Java course mainly studies: Java programming language, Java class file format, Java Virtual Machine and Java Application Program Interface (Java API), Java game project development and other courses.', 'img/course/javacourse.jpg', 1205, 'Introductory Computer Course', 1, 8);

-- ----------------------------
-- Table structure for coursefirstcatalog
-- ----------------------------
DROP TABLE IF EXISTS `coursefirstcatalog`;
CREATE TABLE `coursefirstcatalog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` int(11) NOT NULL,
  `catalogname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ctext` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cvideo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `corder` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courseid`(`courseid`) USING BTREE,
  CONSTRAINT `courseid` FOREIGN KEY (`courseid`) REFERENCES `coursebase` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coursefirstcatalog
-- ----------------------------
INSERT INTO `coursefirstcatalog` VALUES (26, 1, 'Overview of Computer Systems', '<p></p><p></p><p></p><p>A computer system consists of two parts: hardware and software.</p><p>\n\n<br></p><p></p><p><br></p><p></p><p><br></p>', 'video/test.mp4', 0);
INSERT INTO `coursefirstcatalog` VALUES (27, 1, 'Representation, operation and validation of data', NULL, 'video/test.mp4', 1);
INSERT INTO `coursefirstcatalog` VALUES (28, 1, 'New chapter', NULL, 'video/test.mp4', 2);
INSERT INTO `coursefirstcatalog` VALUES (29, 3, 'Contents', '<p></p><p>Java is a popular programming language.</p><p><img src=\"/mooc/static/img/course/c4a4e88e-3311-4c60-8f5f-ec5f641b71fe.png\" style=\"max-width: 100%; width: 326px; height: 238px;\"></p>', 'video/test.mp4', 1);
INSERT INTO `coursefirstcatalog` VALUES (30, 3, 'New chapter', NULL, 'video/test.mp4', 2);

-- ----------------------------
-- Table structure for coursesecondcatalog
-- ----------------------------
DROP TABLE IF EXISTS `coursesecondcatalog`;
CREATE TABLE `coursesecondcatalog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogid` int(11) NOT NULL,
  `scname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sctext` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `scvideo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scorder` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `catalogid`(`catalogid`) USING BTREE,
  CONSTRAINT `catalogid` FOREIGN KEY (`catalogid`) REFERENCES `coursefirstcatalog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coursesecondcatalog
-- ----------------------------
INSERT INTO `coursesecondcatalog` VALUES (1, 26, 'The concept and type of computer', '<p></p><p>\nThe so-called \"hardware\" refers to the physical part of the computer, which is composed of a variety of visible and tangible electronic components, various kinds of light, electricity, machine equipment.Such as host, external equipment, etc.\n\n</p>', 'video/test.mp4', 0);
INSERT INTO `coursesecondcatalog` VALUES (2, 27, 'Data processing and storage', NULL, 'video/test.mp4', 0);
INSERT INTO `coursesecondcatalog` VALUES (3, 26, 'The birth and development of computer', '<p></p><p>\r\n</p><p><span>1）</span>First-generation computer（<span>1946-1957</span>）——Tube Time</p>\r\n<p><span>2）</span>Second-generation computer（<span>1958-1964</span>）——Transistor Time</p>\r\n<p><span>3）</span>Third-generation computer（<span>1965-1971</span>）——Small And Medium Scale Integrated Circuits Time</p>\r\n<p><span>4）</span>Fourth-generation computer（<span>1972-</span>现在）—— vLSI Time</p>\r\n<p>Development trend: smaller and smaller, smaller and smaller, lower and lower cost, higher and higher computing speed.</p>\r\n\r\n', 'video/test.mp4', 1);
INSERT INTO `coursesecondcatalog` VALUES (4, 26, 'New subchapters', NULL, NULL, 2);
INSERT INTO `coursesecondcatalog` VALUES (5, 28, 'New subchapters', NULL, NULL, 0);
INSERT INTO `coursesecondcatalog` VALUES (6, 29, 'New subchapters', NULL, NULL, 0);
INSERT INTO `coursesecondcatalog` VALUES (7, 29, 'New subchapters', NULL, NULL, 1);

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userid_`(`userid`) USING BTREE,
  INDEX `courseid__`(`courseid`) USING BTREE,
  CONSTRAINT `courseid__` FOREIGN KEY (`courseid`) REFERENCES `coursebase` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `userid_` FOREIGN KEY (`userid`) REFERENCES `user_login_info` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student_course
-- ----------------------------
INSERT INTO `student_course` VALUES (4, 18, 1);
INSERT INTO `student_course` VALUES (13, 17, 2);
INSERT INTO `student_course` VALUES (16, 22, 1);
INSERT INTO `student_course` VALUES (17, 30, 1);
INSERT INTO `student_course` VALUES (18, 27, 1);
INSERT INTO `student_course` VALUES (19, 27, 2);
INSERT INTO `student_course` VALUES (20, 29, 1);
INSERT INTO `student_course` VALUES (21, 29, 3);
INSERT INTO `student_course` VALUES (22, 29, 2);
INSERT INTO `student_course` VALUES (23, 28, 1);
INSERT INTO `student_course` VALUES (28, 32, 1);
INSERT INTO `student_course` VALUES (42, 1, 1);

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskid` int(11) NOT NULL,
  `subjecttext` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `optiona` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `optionb` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `optionc` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `optiond` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `correctoption` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `analysis` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subject-taskid`(`taskid`) USING BTREE,
  CONSTRAINT `subject-taskid` FOREIGN KEY (`taskid`) REFERENCES `task` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (4, 2, '对于第一台电子数字计算机ENIAC，下列描述正确的是（    ）', '存储器采用的是磁芯存储器 ', '中央处理器把运算器和控制器做在同一个芯片中', '基本元器件为体积很大的真空电子管  ', '采用的是冯若依曼体系结构', 'D', '提出冯若依曼体系结构后，美国军方催促项目尽管结束，所以没有来得及按冯若依曼体系来实现。');
INSERT INTO `subject` VALUES (5, 2, '冯诺依曼关于现代计算机体系的理论贡献中,最重要的一点是(  )', '采用二进制代码来表示各类信息', '首次提出了存储程序的思想', '他首次提出了把计算机划分为5个主要部件的结构方案', '提出了指令的并行执行思路;', 'B', '---这项最重要，因为之前的计算机不能存储程序，这是一个理论突破');
INSERT INTO `subject` VALUES (6, 2, '下列关于计算机的描述，错误的是(  )', '第一台微型计算机MCS-4，由intel公司1971年研制成功', '天河系列超级计算机，属于松散偶合型大型多机系统;', '第一台严格意义上的电子计算机，是1946年在宾西法尼亚大学研制成功.', '现代计算机的体系架构，已经彻底不采用冯诺依曼体系', 'D', '--现代计算机，特别是微机，仍然还是采用了冯诺依曼体系');
INSERT INTO `subject` VALUES (7, 2, '我国的计算机起步较晚，为国防科技作出了重大贡献并被誉为“功勋计算机”是(  )', '大型晶体管计算机109乙', '大型晶体管计算机109丙', '银河系列巨型计算机', '天河系列的超级计算机', 'B', '无');
INSERT INTO `subject` VALUES (8, 2, '下列关于计算机软硬件系统描述，其中错误的是(  )', '操作系统是计算机软硬件层次的分界面', '计算机系统主要由软件和硬件构成，两者互为依托和补充', '指令系统是计算机软硬件层次的分界面', '计算机的软硬件功能是逻辑等价的，因此某些软硬件模块可以固化或者软化', 'A', '无');
INSERT INTO `subject` VALUES (9, 2, '某设备接口的数据位宽64，工作频率2600MHz，CPU主频3.2GHz，则设备带宽约为（  ）', '166400MBps', '20800MBps', '204800MBps', '25600MBps', 'B', '----带宽等于每次传输的字节数乘以传输频率。 这里的CPU主频为干扰项，不需要使用。');
INSERT INTO `subject` VALUES (10, 3, '1221', '为期翁', '为期翁', '儿我去而我', '为期翁', 'A', '为期翁');
INSERT INTO `subject` VALUES (11, 3, '大沙地', '打书打', '阿萨德', ' 撒大声地', ' dsadas', 'A', '奥术大师 啊');
INSERT INTO `subject` VALUES (12, 4, '大沙地', 'dsadas', '大沙地', '大沙地', '大沙地', 'B', '额打所多所啊');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` int(11) NOT NULL,
  `taskname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `starttime` date NOT NULL,
  `endtime` date NOT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `task-courseid`(`courseid`) USING BTREE,
  CONSTRAINT `task-courseid` FOREIGN KEY (`courseid`) REFERENCES `coursebase` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (2, 1, '单元测验-第一单元', '2018-05-21', '2018-05-22', 1);
INSERT INTO `task` VALUES (3, 1, '第二章测试', '2018-05-21', '2018-05-22', 0);
INSERT INTO `task` VALUES (4, 3, 'C语言第一章测试', '2018-05-23', '2018-05-24', 1);

-- ----------------------------
-- Table structure for task_complete
-- ----------------------------
DROP TABLE IF EXISTS `task_complete`;
CREATE TABLE `task_complete`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `taskid` int(11) NOT NULL,
  `selectresult` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `correctlv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userid_task_complete`(`userid`) USING BTREE,
  INDEX `taskid_task_complete`(`taskid`) USING BTREE,
  CONSTRAINT `taskid_task_complete` FOREIGN KEY (`taskid`) REFERENCES `task` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `userid_task_complete` FOREIGN KEY (`userid`) REFERENCES `user_login_info` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_complete
-- ----------------------------
INSERT INTO `task_complete` VALUES (4, 22, 2, 'C,B,B,D,C,C', '16.67%');
INSERT INTO `task_complete` VALUES (5, 23, 2, 'A,B,B,C,C,C', '16.67%');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `teacheremail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `teacherImg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `teachersex` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `user_login_info` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 17, '76954392@qq.com', NULL, b'0');
INSERT INTO `teacher` VALUES (2, 11, NULL, NULL, b'1');

-- ----------------------------
-- Table structure for theme
-- ----------------------------
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '课程id',
  `uid` int(11) NOT NULL COMMENT '创建此话题用户的id',
  `themetime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '话题创建时间',
  `theme` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '话题内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of theme
-- ----------------------------
INSERT INTO `theme` VALUES (16, 1, 22, '2018-05-23 13:18:06', '杨春聪大帅比');
INSERT INTO `theme` VALUES (17, 1, 22, '2018-05-23 13:27:21', '神挡杀神多');
INSERT INTO `theme` VALUES (18, 3, 17, '2018-05-23 15:26:53', '单加傻乎乎就看到');

-- ----------------------------
-- Table structure for theme_reply
-- ----------------------------
DROP TABLE IF EXISTS `theme_reply`;
CREATE TABLE `theme_reply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL COMMENT '话题的id',
  `uid` int(11) NOT NULL COMMENT '回复话题人id',
  `replytime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '回复时间',
  `replycontent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`tid`) USING BTREE,
  CONSTRAINT `id` FOREIGN KEY (`tid`) REFERENCES `theme` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of theme_reply
-- ----------------------------
INSERT INTO `theme_reply` VALUES (55, 16, 22, '2018-05-23 13:18:12', '嗯');
INSERT INTO `theme_reply` VALUES (56, 16, 22, '2018-05-23 13:18:16', '嗯');
INSERT INTO `theme_reply` VALUES (57, 16, 22, '2018-05-23 13:18:24', '嗯');
INSERT INTO `theme_reply` VALUES (58, 16, 22, '2018-05-23 13:18:26', '嗯');
INSERT INTO `theme_reply` VALUES (59, 16, 17, '2018-05-23 13:19:31', '嗯');
INSERT INTO `theme_reply` VALUES (60, 16, 17, '2018-05-23 13:24:17', '额');
INSERT INTO `theme_reply` VALUES (61, 16, 22, '2018-05-23 13:24:47', '嗯嗯嗯');
INSERT INTO `theme_reply` VALUES (62, 16, 22, '2018-05-23 13:24:58', '嗯嗯嗯');
INSERT INTO `theme_reply` VALUES (63, 17, 22, '2018-05-23 13:27:25', '撒大声地');
INSERT INTO `theme_reply` VALUES (64, 17, 17, '2018-05-23 13:30:27', '大沙地');
INSERT INTO `theme_reply` VALUES (65, 17, 22, '2018-05-23 13:30:48', '大叔大婶');
INSERT INTO `theme_reply` VALUES (66, 16, 23, '2018-05-23 15:18:45', '嗯');
INSERT INTO `theme_reply` VALUES (67, 18, 17, '2018-05-23 15:26:58', '大沙地');

-- ----------------------------
-- Table structure for user_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `user_basic_info`;
CREATE TABLE `user_basic_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `sex` bit(1) NULL DEFAULT NULL COMMENT '用户性别',
  `card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_basic_info
-- ----------------------------
INSERT INTO `user_basic_info` VALUES (1, 1, '769543928@163.com', b'1', '460200199707204435');
INSERT INTO `user_basic_info` VALUES (3, 18, NULL, b'0', NULL);
INSERT INTO `user_basic_info` VALUES (4, 20, '123@qq.com', b'0', '410182199610292918');
INSERT INTO `user_basic_info` VALUES (5, 22, NULL, b'0', NULL);
INSERT INTO `user_basic_info` VALUES (6, 23, NULL, b'0', NULL);
INSERT INTO `user_basic_info` VALUES (7, 24, '1@qq.com', b'1', '530802199005089624');
INSERT INTO `user_basic_info` VALUES (8, 25, '2@qq.com', b'1', '13030319870704800X');
INSERT INTO `user_basic_info` VALUES (9, 26, '3@qq.com', b'0', '230224197508162000');
INSERT INTO `user_basic_info` VALUES (10, 27, '4@qq.com', b'0', '440232199408109000');

-- ----------------------------
-- Table structure for user_login_info
-- ----------------------------
DROP TABLE IF EXISTS `user_login_info`;
CREATE TABLE `user_login_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `headImg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'img/person.png',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `telephone` bigint(20) NOT NULL COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `state` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_tel`(`telephone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_login_info
-- ----------------------------
INSERT INTO `user_login_info` VALUES (1, 'img/personage/ded9cd3c-4aaf-4a62-a7b0-deb56d3b81b8.png', 'DOG', 13027520126, 'E10ADC3949BA59ABBE56E057F20F883E', 1);
INSERT INTO `user_login_info` VALUES (11, 'img/person.png', 'aaaaa', 13027520104, '0B4E7A0E5FE84AD35FB5F95B9CEEAC79', 1);
INSERT INTO `user_login_info` VALUES (17, 'img/personage/105bb326-eb67-4bc2-a3e8-5c2fb05a2f88.jpg', '杨学颖', 13027520121, 'E10ADC3949BA59ABBE56E057F20F883E', 1);
INSERT INTO `user_login_info` VALUES (18, 'img/person.png', 'sdcasdsad', 13027520100, 'E10ADC3949BA59ABBE56E057F20F883E', 0);
INSERT INTO `user_login_info` VALUES (20, 'img/person.png', 'DOG1', 13027520120, 'E10ADC3949BA59ABBE56E057F20F883E', 0);
INSERT INTO `user_login_info` VALUES (22, 'img/person.png', '吴良学', 13027528888, 'E10ADC3949BA59ABBE56E057F20F883E', 0);
INSERT INTO `user_login_info` VALUES (23, 'img/person.png', '王五我', 13027526666, 'E10ADC3949BA59ABBE56E057F20F883E', 0);
INSERT INTO `user_login_info` VALUES (24, 'img/person.png', '张三', 13027520299, 'E10ADC3949BA59ABBE56E057F20F883E', 0);
INSERT INTO `user_login_info` VALUES (25, 'img/person.png', '李四', 13027520298, 'E10ADC3949BA59ABBE56E057F20F883E', 0);
INSERT INTO `user_login_info` VALUES (26, 'img/person.png', '王五', 13027520297, 'E10ADC3949BA59ABBE56E057F20F883E', 0);
INSERT INTO `user_login_info` VALUES (27, 'img/person.png', '张三三', 13027520296, 'aaavvv', 0);
INSERT INTO `user_login_info` VALUES (28, 'img/person.png', 'zmt', 13203828782, '123456abc', 0);
INSERT INTO `user_login_info` VALUES (29, 'img/person.png', 'test', 13203828100, '123456abc', 0);
INSERT INTO `user_login_info` VALUES (30, 'img/person.png', 'zzz', 13203828101, 'abcabc', 0);
INSERT INTO `user_login_info` VALUES (31, 'img/person.png', 'bbb', 13203828102, 'aaavvv', 0);
INSERT INTO `user_login_info` VALUES (32, 'img/person.png', 'ccc', 13203828103, '123456', 0);

SET FOREIGN_KEY_CHECKS = 1;
