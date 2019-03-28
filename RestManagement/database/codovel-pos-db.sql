/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : codovel-pos-db

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-11-24 07:45:42
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `customers`
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('1', 'Owner', '100.00', '1', '2016-05-30 12:37:03', '2017-02-18 16:11:35');
INSERT INTO `customers` VALUES ('2', 'Rojano', '100.00', '1', '2017-02-18 16:05:34', '2017-02-18 16:05:34');
INSERT INTO `customers` VALUES ('3', 'Kimseoun', '100.00', '2', '2017-02-18 16:05:46', '2017-02-26 16:46:03');
INSERT INTO `customers` VALUES ('4', 'Concert Team', '100.00', '2', '2017-02-19 10:29:42', '2017-02-19 10:29:42');

-- ----------------------------
-- Table structure for `items`
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `item_category_id` int(11) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES ('4', 'សាច់ទា', '1', 'ក្បាល', null, '2', '2016-05-30 15:25:22', '2017-11-20 19:45:29');
INSERT INTO `items` VALUES ('5', 'សាច់មាន់', '1', 'kg', null, '1', '2016-06-07 10:47:39', '2016-09-11 10:22:17');

-- ----------------------------
-- Table structure for `item_categories`
-- ----------------------------
DROP TABLE IF EXISTS `item_categories`;
CREATE TABLE `item_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_categories
-- ----------------------------
INSERT INTO `item_categories` VALUES ('1', 'Meat', '2015-12-20 20:58:06', '2016-12-26 20:28:00');
INSERT INTO `item_categories` VALUES ('2', 'Vegetable', '2015-12-20 20:58:10', '2016-12-26 20:28:07');
INSERT INTO `item_categories` VALUES ('3', 'Noodle', '2015-12-20 20:58:20', '2016-06-03 18:38:23');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_id` int(11) DEFAULT NULL,
  `status` enum('Busy','Printed','Completed') DEFAULT 'Busy',
  `customer_id` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT '0',
  `usd` decimal(10,2) DEFAULT '0.00',
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `checked_in` datetime DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for `order_details`
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `ordered_date` datetime DEFAULT NULL,
  `discount` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_details
-- ----------------------------

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  `product_type_id` int(11) DEFAULT NULL,
  `unitprice` decimal(10,2) DEFAULT '0.00',
  `image` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1251 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'គុយទាវធម្មតា', '11', '4', '3.50', null, '7', null, '2017-03-09 15:02:50');
INSERT INTO `products` VALUES ('2', 'គុយទាវពិសេស', '11', '4', '4.00', null, '7', null, '2017-03-09 15:03:44');
INSERT INTO `products` VALUES ('3', 'គុយទាវគ្រឿងសមុទ្រ', '11', '4', '4.00', null, '7', null, '2017-03-09 15:01:45');
INSERT INTO `products` VALUES ('4', 'គុយទាវសាច់ចិព្ច្រាំពិសេស', '11', '4', '3.50', null, '7', null, '2017-03-09 15:04:01');
INSERT INTO `products` VALUES ('5', 'គុយទាវគ្រឿងក្នុង', '11', '4', '3.50', null, '7', null, '2017-03-09 15:01:38');
INSERT INTO `products` VALUES ('6', 'គុយទាវប្រហិតសាច់គោ', '11', '4', '4.00', null, '7', null, '2017-03-09 15:03:14');
INSERT INTO `products` VALUES ('7', 'គុយទាវសាច់ស្រួយ', '11', '4', '4.00', null, '7', null, '2017-03-09 15:04:41');
INSERT INTO `products` VALUES ('8', 'គុយទាវ​ខគោ', '11', '4', '3.50', null, '7', null, '2017-03-09 15:04:51');
INSERT INTO `products` VALUES ('9', 'គុយទាវទាខ្វៃ', '11', '4', '4.00', null, '7', null, '2017-03-09 15:02:38');
INSERT INTO `products` VALUES ('10', 'គុយទាវឆាបាត់ដំបង', '11', '4', '4.00', null, '7', null, '2017-03-09 15:02:12');
INSERT INTO `products` VALUES ('11', 'គុយទាវកាត់', '11', '4', '3.50', null, '7', null, '2017-03-09 15:01:29');
INSERT INTO `products` VALUES ('12', 'គុយទាវសាច់មាន់', '11', '4', '3.50', null, '7', null, '2017-03-09 15:04:32');
INSERT INTO `products` VALUES ('13', 'គុយទាវសាច់គោ', '11', '4', '3.50', null, '7', null, '2017-03-09 15:03:56');
INSERT INTO `products` VALUES ('14', 'គុយទាវឆ្អឹងស៊ុប', '11', '4', '3.50', null, '7', null, '2017-03-09 15:02:25');
INSERT INTO `products` VALUES ('15', 'គុយទាវឆាសាច់គោ', '11', '4', '3.50', null, '7', null, '2017-03-09 15:02:04');
INSERT INTO `products` VALUES ('16', 'គុយទាវប្រហិតត្រី', '11', '4', '3.50', null, '7', null, '2017-03-09 15:03:08');
INSERT INTO `products` VALUES ('17', 'គុយទាវឆាគ្រឿងសមុទ្រ', '11', '4', '3.50', null, '7', null, '2017-03-09 15:01:52');
INSERT INTO `products` VALUES ('18', 'គុយទាវប្រហិតសាច់ជ្រូក', '11', '4', '3.50', null, '7', null, '2017-03-09 15:03:25');
INSERT INTO `products` VALUES ('19', 'ស៊ុបប្រហិតសាច់គោ', '11', '4', '2.75', null, '7', null, '2017-03-09 15:05:29');
INSERT INTO `products` VALUES ('21', 'ស៊ុបឆ្អឹង', '11', '4', '3.00', null, '7', null, '2017-03-09 15:05:12');
INSERT INTO `products` VALUES ('22', 'គុយទាវផាក់ឡូវ', '11', '4', '4.00', null, '7', null, '2017-03-09 15:03:38');
INSERT INTO `products` VALUES ('23', 'គុយទាវប្រហិតសាច់ស្រួយ', '11', '4', '4.00', null, '7', null, '2017-03-09 15:03:30');
INSERT INTO `products` VALUES ('24', 'គុយទាវបាក់សៀក', '11', '4', '3.50', null, '7', null, '2017-03-09 15:02:59');
INSERT INTO `products` VALUES ('25', 'ហ្វឺរពិសេស', '11', '4', '4.00', null, '7', null, '2017-03-09 15:05:46');
INSERT INTO `products` VALUES ('26', 'គុយទាវពោះជ្រូក', '11', '4', '4.00', null, '7', null, '2017-03-09 15:03:50');
INSERT INTO `products` VALUES ('27', 'បាយមាន់ហៃណាំ', '1', '4', '4.00', null, '7', null, '2017-04-02 14:25:21');
INSERT INTO `products` VALUES ('28', 'បាយភ្លៅមាន់ចៀន', '1', '2', '4.00', null, '7', null, '2017-03-10 14:15:10');
INSERT INTO `products` VALUES ('29', 'បាយសាច់ជ្រូកអាំង', '1', '2', '3.00', null, '7', null, '2017-04-02 14:26:01');
INSERT INTO `products` VALUES ('30', 'បាយទាខ្វៃ', '1', '4', '4.00', null, '7', null, '2017-04-02 14:24:32');
INSERT INTO `products` VALUES ('31', 'បាយសាច់ជ្រូកជាមួយពងទាខ', '1', '2', '4.00', null, '7', null, '2017-04-02 14:25:51');
INSERT INTO `products` VALUES ('32', 'បាយឆាម្រេះព្រៅសាច់មាន់​​', '1', '1', '4.00', null, '7', null, '2017-03-10 14:15:22');
INSERT INTO `products` VALUES ('33', 'បាយ​ឆា​កាពិ', '1', '1', '4.00', null, '7', null, '2017-04-02 14:26:45');
INSERT INTO `products` VALUES ('34', 'បាយ​ឆា​គ្រឿង​សមុទ្រ', '1', '1', '4.00', null, '7', null, '2017-04-02 14:26:59');
INSERT INTO `products` VALUES ('35', 'បាយឆាសាច់គោ', '1', '1', '3.50', null, '7', null, '2017-03-10 14:18:56');
INSERT INTO `products` VALUES ('36', 'បាយស', '1', '1', '1.00', null, '7', null, '2017-04-02 14:25:41');
INSERT INTO `products` VALUES ('37', 'បាយសាច់មាន់', '1', '2', '3.50', null, '7', null, '2017-04-02 14:26:14');
INSERT INTO `products` VALUES ('38', 'បាយឆាឡុកឡាក់', '1', '1', '4.00', null, '7', null, '2017-04-02 14:24:11');
INSERT INTO `products` VALUES ('39', 'បាយពងទាចៀន', '1', '2', '3.00', null, '7', null, '2017-04-02 14:24:52');
INSERT INTO `products` VALUES ('40', 'បាយមាន់ស្ងោរ', '1', '4', '3.50', null, '7', null, '2017-04-02 14:25:04');
INSERT INTO `products` VALUES ('41', 'ពងទាចៀន', '1', '1', '0.85', null, '7', null, '2017-04-02 14:27:08');
INSERT INTO `products` VALUES ('42', 'បាយលឿង', '1', '4', '1.00', null, '7', null, '2017-04-02 14:25:33');
INSERT INTO `products` VALUES ('43', 'មីគាវពិសេស', '14', null, '4.00', null, null, null, null);
INSERT INTO `products` VALUES ('44', 'មីពិសេស', '14', null, '4.00', null, null, null, null);
INSERT INTO `products` VALUES ('45', '045  ហ្វាន់គ័រចំហុយបង្គាស្រស់', '6', '3', '2.85', null, '2', null, '2017-02-24 18:14:38');
INSERT INTO `products` VALUES ('46', '046  គាវស្នូលបង្គាចម្រុះពណ៍', '6', '3', '2.85', null, '7', null, '2017-03-04 15:04:05');
INSERT INTO `products` VALUES ('47', '047  គាវស្នូលស្លឺកគូឆាយចំហុយ', '6', '3', '2.85', null, '7', null, '2017-03-04 15:04:37');
INSERT INTO `products` VALUES ('48', '048 ស៊ីវម៉ៃចំហុយពងក្តាម', '6', '3', '2.85', null, '7', null, '2017-03-09 13:09:08');
INSERT INTO `products` VALUES ('49', '049  ហ្វាន់គ័របែបទាជីវ', '6', '3', '2.85', null, '7', null, '2017-03-09 13:09:38');
INSERT INTO `products` VALUES ('50', '050  គាវព្រុយត្រីឆ្លាមចំហុយ', '6', '3', '2.85', null, '7', null, '2017-03-09 13:09:52');
INSERT INTO `products` VALUES ('51', '051 ជើងមាន់ចំហុយទឹកជ្រលក់ពិសេស', '6', '3', '2.85', null, '7', null, '2017-03-09 13:10:02');
INSERT INTO `products` VALUES ('52', '052  ឆ្អឹងជំនីចំហុយសៀងខ្មៅ', '6', '1', '2.85', null, '7', null, '2017-03-09 13:10:21');
INSERT INTO `products` VALUES ('53', '053  ពោះគោចំហុយ', '13', '2', '2.50', null, '7', null, '2017-03-09 13:11:02');
INSERT INTO `products` VALUES ('55', '055  ពោះជ្រូកចំហុយស្ពៃជូរ', '13', '2', '2.50', null, '7', null, '2017-03-09 13:11:42');
INSERT INTO `products` VALUES ('56', '056  ពោះវៀនធំចំហុយស្ពៃជូរ', '6', '3', '2.50', null, '7', null, '2017-03-09 13:21:14');
INSERT INTO `products` VALUES ('57', '057  ប្រហិតក្តាមចំហុយជីឆាយ', '6', '3', '2.85', null, '7', null, '2017-03-09 13:20:49');
INSERT INTO `products` VALUES ('58', '058  ប្រហិតសាច់ជ្រូកជាមួយម្រេចខ្មៅ', '6', '3', '2.85', null, '7', null, '2017-03-09 13:20:35');
INSERT INTO `products` VALUES ('59', '059  ពពុះសណ្តែកចំហុយបង្គា', '6', '3', '2.85', null, '7', null, '2017-03-09 13:16:15');
INSERT INTO `products` VALUES ('60', '060  បាយដំណើបចំហុយស្លឹកឈូក', '6', '3', '2.85', null, '7', null, '2017-03-09 13:16:42');
INSERT INTO `products` VALUES ('61', '061  ស៊ែវឡុងប៉ាវ', '6', '3', '2.85', null, '7', null, '2017-03-09 13:16:57');
INSERT INTO `products` VALUES ('62', '062 នំប៉ាវសាវស៊ីវ', '6', '3', '2.85', null, '7', null, '2017-03-09 13:20:21');
INSERT INTO `products` VALUES ('63', '063 នំប៉ាវស្នូលពងទាប្រៃ', '6', '3', '2.85', null, '7', null, '2017-03-09 13:19:56');
INSERT INTO `products` VALUES ('64', '064  នំប៉ាវស្នូលពងមាន់', '6', '3', '2.85', null, '7', null, '2017-03-09 13:20:09');
INSERT INTO `products` VALUES ('65', '065 នំប៉ាវស្នូលសាច់ចិញ្រ្ចាំ', '6', '3', '2.85', null, '7', null, '2017-03-09 13:19:45');
INSERT INTO `products` VALUES ('66', '066  នំប៉ាវស្នូលសណ្តែកក្រហម', '6', '3', '2.85', null, '7', null, '2017-03-09 13:19:31');
INSERT INTO `products` VALUES ('67', '067 នំប៉ាវស្នូលត្រាវ', '6', '3', '2.85', null, '7', null, '2017-03-09 13:19:19');
INSERT INTO `products` VALUES ('68', '068 នំប៉ាវអត់ស្នូល', '6', '3', '2.85', null, '7', null, '2017-03-09 13:19:09');
INSERT INTO `products` VALUES ('69', '069 ម៉ាឡាយគូ', '6', '3', '2.85', null, '7', null, '2017-03-09 13:17:19');
INSERT INTO `products` VALUES ('70', '070​ នំប៉ាវស្នូលបន្លែចៀន', '6', '3', '2.85', null, '7', null, '2017-03-09 13:17:47');
INSERT INTO `products` VALUES ('71', '071  គាវទឹកជ្រលក់ពិសេស', '6', '3', '2.85', null, '7', null, '2017-03-09 13:18:06');
INSERT INTO `products` VALUES ('72', '072  ជើងមាន់ពពកស', '6', '3', '2.50', null, '7', null, '2017-03-09 13:18:18');
INSERT INTO `products` VALUES ('73', '073 នំត្រាវបំពងស្រួយ', '6', '3', '2.85', null, '7', null, '2017-03-09 13:18:29');
INSERT INTO `products` VALUES ('74', '074 ​ នំបំពងប្រៃ', '6', '3', '2.85', null, '7', null, '2017-03-09 13:18:45');
INSERT INTO `products` VALUES ('75', '075 នំល្ងបំពង', '6', '3', '2.85', null, '7', null, '2017-03-09 13:18:56');
INSERT INTO `products` VALUES ('76', '076  ពពុះសណ្តែកចៀនស្នូលបង្គា', '6', '3', '2.85', null, '7', null, '2017-03-09 13:25:36');
INSERT INTO `products` VALUES ('77', '077 ​ គាវស្លឹកគូឆាយចៀន', '6', '3', '2.85', null, '7', null, '2017-03-09 13:25:49');
INSERT INTO `products` VALUES ('78', '078  នំឆៃថាវឆាXO', '6', '3', '2.85', null, '7', null, '2017-03-09 13:26:00');
INSERT INTO `products` VALUES ('79', '079  នំឆៃថាវចៀន', '6', '3', '2.85', null, '7', null, '2017-03-09 13:26:10');
INSERT INTO `products` VALUES ('80', '080  នំបាយដំណើបដូង', '6', '3', '2.50', null, '7', null, '2017-03-09 13:26:19');
INSERT INTO `products` VALUES ('81', '081  នំពងមាន់ដុត', '6', '3', '2.85', null, '7', null, '2017-03-09 13:26:31');
INSERT INTO `products` VALUES ('82', '082  នំប៉ាវដុតស្នូលពងមាន់', '6', '3', '2.85', null, '7', null, '2017-03-09 13:26:41');
INSERT INTO `products` VALUES ('83', '083  នំប៉ាវដុតស្នូលសាស៊ីវ', '6', '3', '2.85', null, '7', null, '2017-03-09 13:26:50');
INSERT INTO `products` VALUES ('84', '084 នំសាស៊ីវ', '6', '3', '2.50', null, '7', null, '2017-03-09 13:27:01');
INSERT INTO `products` VALUES ('85', '085  គុយទាវកាត់ចំហុយបង្គាស្រស់', '6', '3', '2.85', null, '7', null, '2017-03-09 13:27:13');
INSERT INTO `products` VALUES ('86', '086  គុយទាវកាត់ចំហុយសាស៊ីវ', '6', '3', '2.85', null, '7', null, '2017-03-09 13:27:22');
INSERT INTO `products` VALUES ('87', '087  គុយទាវកាត់ចំហុយសាច់ជ្រូក', '6', '3', '2.85', null, '7', null, '2017-03-09 13:23:59');
INSERT INTO `products` VALUES ('88', '088 ​ គុយទាវកាត់បួស', '6', '3', '2.85', null, '7', null, '2017-03-09 13:27:43');
INSERT INTO `products` VALUES ('89', '089  ចាខ្វៃ', '6', '3', '0.85', null, '7', null, '2017-03-09 13:30:39');
INSERT INTO `products` VALUES ('90', '003-Marques Casa Concha,Carmenere', '25', '6', '45.00', null, '7', null, '2017-03-04 15:03:55');
INSERT INTO `products` VALUES ('91', '004-Vina Maipo,Limited Edition', '25', '6', '65.00', null, '7', null, '2017-03-04 15:13:42');
INSERT INTO `products` VALUES ('92', '005-Torres Celeste Crianza', '25', '6', '40.00', null, '7', null, '2017-03-09 13:08:32');
INSERT INTO `products` VALUES ('93', 'RED LION 240ML CAN', '18', null, '1.00', null, null, null, null);
INSERT INTO `products` VALUES ('94', 'ALOE  ORIGINAL 500ML (L)', '18', '6', '2.50', null, '7', null, '2017-03-09 13:36:10');
INSERT INTO `products` VALUES ('95', 'ALOE  SUGAR FREE 500ML (L)', '18', '6', '2.50', null, '7', null, '2017-03-09 13:36:35');
INSERT INTO `products` VALUES ('96', 'ALOE  PINEAPPLE 500ML (L)', '18', '6', '2.50', null, '7', null, '2017-03-09 13:36:16');
INSERT INTO `products` VALUES ('97', 'ALOE  GUAVA 500ML (L)', '18', '6', '2.50', null, '7', null, '2017-03-09 13:35:58');
INSERT INTO `products` VALUES ('98', 'ALOE  PEACH 500ML (L)', '18', '6', '2.50', null, '7', null, '2017-03-09 13:36:12');
INSERT INTO `products` VALUES ('99', 'ALOE  STRAWBERRY 500ML (L)', '18', '6', '2.50', null, '7', null, '2017-03-09 13:36:28');
INSERT INTO `products` VALUES ('100', 'ALOE  MANGO 500ML (L)', '18', '6', '2.50', null, '7', null, '2017-03-09 13:36:03');
INSERT INTO `products` VALUES ('101', 'ALOE  POMEGRANATE 500ML (L)', '18', '6', '2.50', null, '7', null, '2017-03-09 13:36:20');
INSERT INTO `products` VALUES ('102', 'ALOE  GRAGE 500ML (L)', '18', '6', '2.50', null, '7', null, '2017-03-09 13:36:50');
INSERT INTO `products` VALUES ('103', 'ALOE  LYCHEE 500ML (L)', '18', '6', '2.50', null, '7', null, '2017-03-09 13:36:00');
INSERT INTO `products` VALUES ('104', 'ALOE  ORIGINAL 240ML (M)', '18', '6', '1.10', null, '7', null, '2017-03-09 13:36:07');
INSERT INTO `products` VALUES ('105', 'ALOE  BLUEBERRY 240ML (M)', '18', '6', '1.10', null, '7', null, '2017-03-09 13:35:51');
INSERT INTO `products` VALUES ('106', 'ALOE  STRAWBERRY 240ML (M)', '18', '6', '1.10', null, '7', null, '2017-03-09 13:36:24');
INSERT INTO `products` VALUES ('107', 'ALOE  GRAPE 240ML (M)', '18', '6', '1.10', null, '7', null, '2017-03-09 13:35:56');
INSERT INTO `products` VALUES ('108', '7 up', '18', '6', '1.00', null, '7', null, '2017-03-09 13:35:49');
INSERT INTO `products` VALUES ('109', 'ALOE  CHERRY 240ML (M)', '18', '6', '1.10', null, '7', null, '2017-03-09 13:35:54');
INSERT INTO `products` VALUES ('110', 'FRUIT JUICE ORANGE 238ML(S)', '18', null, '1.00', null, null, null, null);
INSERT INTO `products` VALUES ('111', 'FRUIT JUICE GRAPE 238ML(S)', '18', null, '1.00', null, null, null, null);
INSERT INTO `products` VALUES ('112', 'FRUIT JUICE ALOE 238ML(S)', '18', null, '1.00', null, null, null, null);
INSERT INTO `products` VALUES ('113', 'CAMBODIA BEER', '4', '6', '2.50', null, '7', null, '2017-03-09 13:38:18');
INSERT INTO `products` VALUES ('114', 'មីប្រហិតសាច់ជ្រូក(ឌុបមី)', '14', null, '4.00', null, null, null, null);
INSERT INTO `products` VALUES ('115', 'ស៊ុបគាវ', '11', '4', '3.00', null, '7', null, '2017-03-09 15:05:03');
INSERT INTO `products` VALUES ('116', 'បាញ់សុងឆាសាច់គោ', '2', '2', '4.00', null, '7', null, '2017-04-02 14:22:42');
INSERT INTO `products` VALUES ('117', 'បាញ់ហយឆាសាច់គោ', '2', '2', '4.00', null, '7', null, '2017-04-02 14:23:35');
INSERT INTO `products` VALUES ('118', 'ICE LATE', '22', '6', '1.50', null, '7', null, '2017-03-09 14:19:34');
INSERT INTO `products` VALUES ('119', 'ឆាខ្ញីសាច់មាន់១ចំហៀង', '12', '2', '9.00', null, '7', null, '2017-03-09 14:35:26');
INSERT INTO `products` VALUES ('120', 'ឆាខ្ញីសាច់មាន់១ក្បាល', '12', '2', '18.00', null, '7', null, '2017-03-09 14:35:15');
INSERT INTO `products` VALUES ('121', 'ខទីវត្រីសណ្តាយ(ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('122', 'ខទីវត្រីសណ្តាយ(ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('123', 'បង្អែមបបរចាដូវ', '5', '5', '1.50', null, '7', null, '2017-03-10 14:09:48');
INSERT INTO `products` VALUES ('124', 'បង្អែមបបរពោត', '5', '5', '1.50', null, '7', null, '2017-03-10 14:10:12');
INSERT INTO `products` VALUES ('125', 'បង្អែមបបរត្រាវ', '5', '5', '1.50', null, '7', null, '2017-03-10 14:10:06');
INSERT INTO `products` VALUES ('126', 'បង្អែមចេកខ្ទិះ', '5', '5', '1.50', null, '7', null, '2017-03-10 14:09:17');
INSERT INTO `products` VALUES ('127', 'បង្អែមសាយឿ', '5', '5', '1.50', null, '7', null, '2017-03-10 14:11:17');
INSERT INTO `products` VALUES ('128', 'បង្អែមសារ៉ាយអប់ផ្កាម្លិះ', '5', '5', '1.50', null, '7', null, '2017-03-10 14:11:33');
INSERT INTO `products` VALUES ('129', 'បង្អែមបាញ់ចានឿក', '5', '5', '1.50', null, '7', null, '2017-03-10 14:11:06');
INSERT INTO `products` VALUES ('130', 'បង្អែមបបរគ្រាប់ឈូក', '5', '5', '1.50', null, '7', null, '2017-03-10 14:09:39');
INSERT INTO `products` VALUES ('131', 'បង្អែមបបរសណ្តែកខៀវ', '5', '5', '1.50', null, '7', null, '2017-03-10 14:10:27');
INSERT INTO `products` VALUES ('132', 'កាហ្វេខ្មៅក្តៅ', '22', '6', '1.30', null, '7', null, '2017-03-09 14:22:23');
INSERT INTO `products` VALUES ('133', 'បង្អែមខ្មែរ', '5', '5', '2.50', null, '7', null, '2017-03-10 14:09:07');
INSERT INTO `products` VALUES ('134', 'ចេកឆឹង', '5', '5', '1.50', null, '7', null, '2017-03-10 14:07:03');
INSERT INTO `products` VALUES ('135', 'បាយដំណើបសង់ខ្យា', '5', '5', '2.00', null, '7', null, '2017-03-10 14:12:00');
INSERT INTO `products` VALUES ('136', 'បាយដំណើបសង់ខ្យាធុរេន', '5', '5', '2.00', null, '7', null, '2017-03-10 14:12:10');
INSERT INTO `products` VALUES ('137', 'បាយដំណើបធុរេន', '5', '5', '2.00', null, '7', null, '2017-03-10 14:11:50');
INSERT INTO `products` VALUES ('138', 'បង្អែមតៅស៊ូន់', '5', '5', '1.50', null, '7', null, '2017-03-10 14:09:24');
INSERT INTO `products` VALUES ('139', 'កាហ្វេទឹកកក', '22', '6', '1.30', null, '7', null, '2017-03-09 14:22:29');
INSERT INTO `products` VALUES ('140', 'កាហ្វេ​ទឹក​ដោះ​គោ​ក្ដៅ', '22', '6', '1.50', null, '7', null, '2017-03-09 14:23:09');
INSERT INTO `products` VALUES ('141', 'កាហ្វេ​ទឹក​ដោះ​គោទឹកកក', '22', '6', '1.50', null, '7', null, '2017-03-09 14:23:02');
INSERT INTO `products` VALUES ('142', 'តែ​ក្រូចឆ្មា​ក្ដៅ / ទឹកកក', '22', '6', '1.30', null, '7', null, '2017-03-09 14:23:53');
INSERT INTO `products` VALUES ('143', 'ទឹក​សណ្ដែក​ក្ដៅ / ទឹកកក', '22', '6', '1.50', null, '7', null, '2017-03-09 14:25:00');
INSERT INTO `products` VALUES ('144', 'ស៊ីរ៉ូ​ក្រូចឆ្មា​ទឹកកក', '15', '6', '1.50', null, '7', null, '2017-03-09 13:35:16');
INSERT INTO `products` VALUES ('145', 'ទឹក​គាម​​បួយទឹកកក', '15', '6', '1.50', null, '7', null, '2017-03-09 13:34:53');
INSERT INTO `products` VALUES ('146', 'ស៊ីរ៉ូ​ទឹក​ដោះ​គោ​ឆៅ', '15', '6', '2.00', null, '7', null, '2017-03-09 13:35:20');
INSERT INTO `products` VALUES ('147', 'ទឹក​ប៉ោម​ស្រស់', '10', null, '3.00', null, null, null, null);
INSERT INTO `products` VALUES ('148', 'ទឹក​ក្រូច​ច្របាច់​ស្រស់', '10', null, '3.00', null, null, null, null);
INSERT INTO `products` VALUES ('149', 'ទឹក​ការ៉ុត', '10', null, '3.00', null, null, null, null);
INSERT INTO `products` VALUES ('150', 'ទឹក​ឪឡឹក', '10', null, '3.00', null, null, null, null);
INSERT INTO `products` VALUES ('151', 'ផ្លែ​ប័រ​ក្រឡុក', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('152', 'ផ្លែ​ឈើ​គ្រប់​មុខ​ក្រឡុក', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('153', 'ផ្លែ Passion ក្រឡុក', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('154', 'តែទឹកកក', '22', '6', '0.50', null, '7', null, '2017-03-09 14:23:30');
INSERT INTO `products` VALUES ('155', 'Camparri', '25', '6', '3.50', null, '7', null, '2017-03-09 13:37:39');
INSERT INTO `products` VALUES ('156', 'Dubonnet', '25', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('157', 'Martini Bianco', '25', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('158', 'Martine Rosso', '25', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('159', 'Martini Sec', '25', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('160', 'Gordons', '25', null, '4.50', null, null, null, null);
INSERT INTO `products` VALUES ('161', 'Stolichnaya', '25', null, '4.50', null, null, null, null);
INSERT INTO `products` VALUES ('162', 'Smirnoff', '25', null, '4.50', null, null, null, null);
INSERT INTO `products` VALUES ('163', 'Absolute', '25', '6', '5.00', null, '7', null, '2017-03-09 13:37:04');
INSERT INTO `products` VALUES ('164', 'El Viejito', '25', null, '4.50', null, null, null, null);
INSERT INTO `products` VALUES ('165', 'Bacardi Goldr', '25', '6', '4.50', null, '7', null, '2017-03-09 13:37:11');
INSERT INTO `products` VALUES ('166', 'Calao Rumr', '25', '6', '4.50', null, '7', null, '2017-03-09 13:37:36');
INSERT INTO `products` VALUES ('167', 'Sempe Viel Armagnac ASOP', '25', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('168', 'Remy Martin VSOP', '25', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('169', 'Hennessy VSOP', '25', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('170', 'Remy Martin XO', '25', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('171', 'Hennessy XO', '25', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('172', 'Ballantines', '25', '6', '4.50', null, '7', null, '2017-03-09 13:37:26');
INSERT INTO `products` VALUES ('173', 'Je-B', '25', null, '4.50', null, null, null, null);
INSERT INTO `products` VALUES ('174', 'Famous Grouse', '25', null, '4.50', null, null, null, null);
INSERT INTO `products` VALUES ('175', 'Johnie Walker Red Label', '25', null, '4.50', null, null, null, null);
INSERT INTO `products` VALUES ('176', 'Vitel-1000ml', '24', '6', '3.00', null, '7', null, '2017-03-09 13:33:43');
INSERT INTO `products` VALUES ('177', 'Johnnie Worker Black Label', '25', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('178', 'Jim Beam', '25', null, '5.00', null, null, null, null);
INSERT INTO `products` VALUES ('179', 'Jack Daniels', '25', null, '5.00', null, null, null, null);
INSERT INTO `products` VALUES ('180', 'Wild Turkey', '25', null, '5.00', null, null, null, null);
INSERT INTO `products` VALUES ('181', 'Canadian Club', '25', null, '5.00', null, null, null, null);
INSERT INTO `products` VALUES ('182', 'John Jameson', '25', null, '5.00', null, null, null, null);
INSERT INTO `products` VALUES ('183', 'Amaretto', '25', '6', '3.50', null, '7', null, '2017-03-09 13:37:08');
INSERT INTO `products` VALUES ('184', 'Cointreau', '25', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('185', 'Drambuie', '25', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('186', 'Grand Marnier', '25', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('187', 'Kahlua', '25', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('188', 'Malibu', '25', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('189', 'Tia Maria', '25', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('190', 'Angkor Beer Large Blte', '4', '6', '3.50', null, '7', null, '2017-03-09 13:38:02');
INSERT INTO `products` VALUES ('191', 'Angkor Beer Small Btle', '4', '6', '2.50', null, '7', null, '2017-03-09 13:38:05');
INSERT INTO `products` VALUES ('192', 'Angkor Beer (Can)', '4', '6', '1.85', null, '7', null, '2017-03-09 13:37:59');
INSERT INTO `products` VALUES ('193', 'Budwieser Small Btle', '4', '6', '3.00', null, '7', null, '2017-03-09 13:38:15');
INSERT INTO `products` VALUES ('194', 'Heineken Small Btle', '4', '6', '3.00', null, '7', null, '2017-03-09 13:38:58');
INSERT INTO `products` VALUES ('195', 'Heineken Can', '4', '6', '2.50', null, '7', null, '2017-03-09 13:38:48');
INSERT INTO `products` VALUES ('196', 'Houser Wine by Glass', '25', null, '4.00', null, null, null, null);
INSERT INTO `products` VALUES ('197', 'Americano', '7', '6', '3.50', null, '7', null, '2017-03-09 13:39:34');
INSERT INTO `products` VALUES ('198', 'Alexander Gin', '7', '6', '3.50', null, '7', null, '2017-03-09 13:39:31');
INSERT INTO `products` VALUES ('199', 'B52', '7', '6', '3.50', null, '7', null, '2017-03-09 13:39:37');
INSERT INTO `products` VALUES ('200', 'Bloody Mary', '7', '6', '3.50', null, '7', null, '2017-03-09 13:39:43');
INSERT INTO `products` VALUES ('201', 'Black Russian', '7', '6', '3.50', null, '7', null, '2017-03-09 13:39:40');
INSERT INTO `products` VALUES ('202', 'BMW', '7', '6', '3.50', null, '7', null, '2017-03-09 13:39:51');
INSERT INTO `products` VALUES ('203', 'Blue Hawaii', '7', '6', '3.50', null, '7', null, '2017-03-09 13:39:46');
INSERT INTO `products` VALUES ('204', 'Blue Legoon', '7', '6', '3.50', null, '7', null, '2017-03-09 13:39:48');
INSERT INTO `products` VALUES ('205', 'Cuba Libra', '7', '6', '3.50', null, '7', null, '2017-03-09 13:39:53');
INSERT INTO `products` VALUES ('206', 'Daiquiri', '7', '6', '3.50', null, '7', null, '2017-03-09 13:39:56');
INSERT INTO `products` VALUES ('207', 'Grand Cadeau', '7', '6', '3.50', null, '7', null, '2017-03-09 13:40:06');
INSERT INTO `products` VALUES ('208', 'Gin Fizz', '7', '6', '3.50', null, '7', null, '2017-03-09 13:40:03');
INSERT INTO `products` VALUES ('209', 'Long Iland Ice Tea', '7', '6', '3.50', null, '7', null, '2017-03-09 13:40:11');
INSERT INTO `products` VALUES ('210', 'Mai Tai', '7', '6', '3.50', null, '7', null, '2017-03-09 13:40:14');
INSERT INTO `products` VALUES ('211', 'Margarita', '7', '6', '3.50', null, '7', null, '2017-03-09 13:40:18');
INSERT INTO `products` VALUES ('212', 'Million Dollar', '7', '6', '3.50', null, '7', null, '2017-03-09 13:40:22');
INSERT INTO `products` VALUES ('213', 'Negroni', '7', '6', '3.50', null, '7', null, '2017-03-09 13:40:27');
INSERT INTO `products` VALUES ('214', 'Pussy Foot', '7', '6', '3.00', null, '7', null, '2017-03-09 13:42:34');
INSERT INTO `products` VALUES ('215', 'The Paradies', '7', '6', '3.00', null, '7', null, '2017-03-09 13:41:39');
INSERT INTO `products` VALUES ('216', 'Tropical Love', '7', '6', '3.00', null, '7', null, '2017-03-09 13:41:26');
INSERT INTO `products` VALUES ('217', 'Coke', '18', '6', '1.00', null, '7', null, '2017-03-09 13:35:43');
INSERT INTO `products` VALUES ('218', 'Diet Coke', '18', '6', '1.00', null, '7', null, '2017-03-09 13:36:39');
INSERT INTO `products` VALUES ('219', 'Sprite', '18', null, '1.00', null, null, null, null);
INSERT INTO `products` VALUES ('220', 'Fanta', '18', '6', '1.00', null, '7', null, '2017-03-09 13:36:43');
INSERT INTO `products` VALUES ('221', 'Red Bull', '18', null, '1.00', null, null, null, null);
INSERT INTO `products` VALUES ('222', 'Tonic water', '18', null, '1.00', null, null, null, null);
INSERT INTO `products` VALUES ('223', 'Soda water', '18', null, '1.00', null, null, null, null);
INSERT INTO `products` VALUES ('224', 'Freshy Grape', '18', null, '1.50', null, null, null, null);
INSERT INTO `products` VALUES ('225', 'Orange​ box', '10', null, '2.00', null, null, null, null);
INSERT INTO `products` VALUES ('226', 'Pineapple box', '10', null, '2.00', null, null, null, null);
INSERT INTO `products` VALUES ('227', 'Vitel-500ml', '24', '6', '1.50', null, '7', null, '2017-03-09 13:33:53');
INSERT INTO `products` VALUES ('228', 'Vitel-1500ml', '24', '6', '5.00', null, '7', null, '2017-03-09 13:33:49');
INSERT INTO `products` VALUES ('229', 'Lyyon-500ml', '24', '6', '1.00', null, '7', null, '2017-03-09 13:33:25');
INSERT INTO `products` VALUES ('230', 'Lyyon-1500ml', '24', '6', '3.00', null, '7', null, '2017-03-09 13:33:20');
INSERT INTO `products` VALUES ('231', 'Evian-500ml', '24', '6', '3.00', null, '7', null, '2017-03-09 13:33:11');
INSERT INTO `products` VALUES ('232', 'Evian-1000ml', '24', '6', '5.00', null, '7', null, '2017-03-09 13:33:08');
INSERT INTO `products` VALUES ('233', 'Fresh Brewed Coffee', '22', '6', '2.50', null, '7', null, '2017-03-09 14:19:09');
INSERT INTO `products` VALUES ('234', 'Decaffeinated Coffee', '22', '6', '2.50', null, '7', null, '2017-03-09 14:18:55');
INSERT INTO `products` VALUES ('235', 'Coffee late', '22', '6', '2.50', null, '7', null, '2017-03-09 14:13:46');
INSERT INTO `products` VALUES ('236', 'Coffee au lee', '22', '6', '2.50', null, '7', null, '2017-03-09 14:13:44');
INSERT INTO `products` VALUES ('237', 'Coffee mocha', '22', '6', '2.50', null, '7', null, '2017-03-09 14:17:05');
INSERT INTO `products` VALUES ('238', 'Cappuccino', '22', '6', '3.00', null, '7', null, '2017-03-09 14:13:29');
INSERT INTO `products` VALUES ('239', 'Espresso', '22', '6', '2.50', null, '7', null, '2017-03-09 14:19:05');
INSERT INTO `products` VALUES ('240', 'Double Espresso', '22', '6', '2.50', null, '7', null, '2017-03-09 14:18:58');
INSERT INTO `products` VALUES ('241', 'Hot Chocolate', '22', '6', '2.50', null, '7', null, '2017-03-09 14:19:20');
INSERT INTO `products` VALUES ('242', 'Earl Gray', '22', '6', '2.50', null, '7', null, '2017-03-09 14:19:02');
INSERT INTO `products` VALUES ('243', 'Darjeeling', '22', '6', '2.50', null, '7', null, '2017-03-09 14:18:52');
INSERT INTO `products` VALUES ('244', 'Camomile', '22', '6', '2.50', null, '7', null, '2017-03-09 14:13:26');
INSERT INTO `products` VALUES ('245', 'Jasmine', '22', '6', '2.50', null, '7', null, '2017-03-09 14:21:08');
INSERT INTO `products` VALUES ('246', 'Green Tea', '22', '6', '1.50', null, '7', null, '2017-03-09 14:19:12');
INSERT INTO `products` VALUES ('247', 'Mint Tea', '22', '6', '1.50', null, '7', null, '2017-03-09 14:21:37');
INSERT INTO `products` VALUES ('248', 'Coffee a la mode', '22', '6', '2.50', null, '7', null, '2017-03-09 14:13:41');
INSERT INTO `products` VALUES ('249', 'Ice Blended Cafe Latte', '22', '6', '2.50', null, '7', null, '2017-03-09 14:19:27');
INSERT INTO `products` VALUES ('250', 'Ice Blended Cafe Mocha', '22', '6', '2.50', null, '7', null, '2017-03-09 14:19:31');
INSERT INTO `products` VALUES ('251', 'Lemon Iced Tea', '22', '6', '1.50', null, '7', null, '2017-03-09 14:21:16');
INSERT INTO `products` VALUES ('252', 'Sourkea Coffee', '22', '6', '6.50', null, '7', null, '2017-03-09 14:22:00');
INSERT INTO `products` VALUES ('253', 'Irish Coffee', '22', '6', '6.50', null, '7', null, '2017-03-09 14:20:55');
INSERT INTO `products` VALUES ('254', 'ចេកក្រឡុក', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('255', 'ខ្នុលក្រឡុក', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('256', 'ស្វាយក្រឡុក', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('257', 'ល្ហុងក្រឡុក', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('258', 'Strawberry', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('259', 'ផ្លែឈើក្រឡុកគ្រប់មុខ', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('260', 'Banana Smoothie', '10', null, '4.50', null, null, null, null);
INSERT INTO `products` VALUES ('261', 'Bayon Smile', '10', null, '4.50', null, null, null, null);
INSERT INTO `products` VALUES ('262', 'Paradise Puch', '10', null, '4.50', null, null, null, null);
INSERT INTO `products` VALUES ('263', 'Tropical Paradies', '10', null, '4.50', null, null, null, null);
INSERT INTO `products` VALUES ('264', 'Strawberry Yogurt Cooler', '10', null, '4.50', null, null, null, null);
INSERT INTO `products` VALUES ('265', 'Strawberry milkshake', '10', null, '4.50', null, null, null, null);
INSERT INTO `products` VALUES ('266', 'Vanilla milkshake', '7', '6', '3.00', null, '7', null, '2017-03-09 13:41:20');
INSERT INTO `products` VALUES ('267', 'Strawberry and Passion milkshake', '10', null, '4.50', null, null, null, null);
INSERT INTO `products` VALUES ('268', 'Banana chocolate milkshake', '10', null, '4.50', null, null, null, null);
INSERT INTO `products` VALUES ('269', 'Mocha and vanilla milkshake', '10', null, '4.50', null, null, null, null);
INSERT INTO `products` VALUES ('270', 'Pina Colada', '7', '6', '3.50', null, '7', null, '2017-03-09 13:42:14');
INSERT INTO `products` VALUES ('271', 'Planter Punch', '7', '6', '3.50', null, '7', null, '2017-03-09 13:42:27');
INSERT INTO `products` VALUES ('272', 'Pink Lady', '7', '6', '3.50', null, '7', null, '2017-03-09 13:42:21');
INSERT INTO `products` VALUES ('273', 'Rainbow', '7', '6', '3.50', null, '7', null, '2017-03-09 13:42:50');
INSERT INTO `products` VALUES ('274', 'Singapore Sling', '7', '6', '3.50', null, '7', null, '2017-03-09 13:41:52');
INSERT INTO `products` VALUES ('275', 'Sex on the beach', '7', '6', '3.50', null, '7', null, '2017-03-09 13:43:02');
INSERT INTO `products` VALUES ('276', 'Tequila Sunrise', '7', '6', '3.50', null, '7', null, '2017-03-09 13:41:46');
INSERT INTO `products` VALUES ('277', 'Tom Collins', '7', '6', '3.50', null, '7', null, '2017-03-09 13:41:32');
INSERT INTO `products` VALUES ('278', 'Whisky Sour', '7', '6', '3.50', null, '7', null, '2017-03-09 13:41:13');
INSERT INTO `products` VALUES ('279', 'Zombie', '7', '6', '3.50', null, '7', null, '2017-03-09 13:40:42');
INSERT INTO `products` VALUES ('280', 'Sourkea Sunet', '7', '6', '4.50', null, '7', null, '2017-03-09 13:41:59');
INSERT INTO `products` VALUES ('281', 'Sourkea Delght', '7', '6', '4.50', null, '7', null, '2017-03-09 13:42:07');
INSERT INTO `products` VALUES ('282', 'Paradies Zenith', '7', '6', '4.50', null, '7', null, '2017-03-09 13:40:31');
INSERT INTO `products` VALUES ('283', 'Phnom Penh Cozy', '7', '6', '4.50', null, '7', null, '2017-03-09 13:40:34');
INSERT INTO `products` VALUES ('284', 'Fruit Punch', '7', '6', '3.00', null, '7', null, '2017-03-09 13:39:59');
INSERT INTO `products` VALUES ('285', 'Shirley Temple', '7', '6', '3.00', null, '7', null, '2017-03-09 13:43:12');
INSERT INTO `products` VALUES ('286', 'ទឹកដោះគោឆៅក្តៅ', '15', '6', '1.50', null, '7', null, '2017-03-09 13:34:40');
INSERT INTO `products` VALUES ('287', 'Iced Chocolate', '22', '6', '2.50', null, '7', null, '2017-03-09 14:20:44');
INSERT INTO `products` VALUES ('288', 'Ovantine', '22', '6', '1.50', null, '7', null, '2017-03-09 14:21:52');
INSERT INTO `products` VALUES ('289', 'សារ៉ូទឹកដោះគោទឹកកក', '15', '6', '2.00', null, '7', null, '2017-03-09 13:35:06');
INSERT INTO `products` VALUES ('290', 'តែទឹកដោះគោទឹកកក', '15', '6', '1.50', null, '7', null, '2017-03-09 13:34:31');
INSERT INTO `products` VALUES ('291', 'មីឡូទឹកដោះគោទឹកកក', '15', '6', '1.50', null, '7', null, '2017-03-09 13:35:00');
INSERT INTO `products` VALUES ('292', 'តែជ្រក់', '22', '6', '1.30', null, '7', null, '2017-03-09 14:23:23');
INSERT INTO `products` VALUES ('293', 'មីឡូកំប៉ុង', '18', null, '1.00', null, null, null, null);
INSERT INTO `products` VALUES ('294', 'ទឹកដោះគោឆៅទឹកកក', '15', '6', '1.50', null, '7', null, '2017-03-09 13:34:43');
INSERT INTO `products` VALUES ('295', 'តែក្តៅ', '22', '6', '1.00', null, '7', null, '2017-03-09 14:23:16');
INSERT INTO `products` VALUES ('296', 'សូដាក្រូចឆ្មារ', '18', null, '2.00', null, null, null, null);
INSERT INTO `products` VALUES ('297', 'Lemon Juice', '10', null, '2.50', null, null, null, null);
INSERT INTO `products` VALUES ('298', 'តែទឹកដោះគោ', '22', '6', '1.50', null, '7', null, '2017-03-09 14:23:36');
INSERT INTO `products` VALUES ('299', 'Tiger Beer Large Btle', '4', '6', '3.50', null, '7', null, '2017-03-09 13:39:06');
INSERT INTO `products` VALUES ('300', 'Perriere Large', '24', '6', '5.00', null, '7', null, '2017-03-09 13:33:29');
INSERT INTO `products` VALUES ('301', 'Tiger Beer Small Btle', '4', '6', '3.00', null, '7', null, '2017-03-09 13:39:09');
INSERT INTO `products` VALUES ('302', 'Tiger Beer Can', '4', '6', '2.00', null, '7', null, '2017-03-09 13:39:02');
INSERT INTO `products` VALUES ('303', 'Freshy Apple', '18', null, '1.50', null, null, null, null);
INSERT INTO `products` VALUES ('304', 'Freshy Orange', '18', null, '1.50', null, null, null, null);
INSERT INTO `products` VALUES ('305', 'Lychee', '18', null, '1.00', null, null, null, null);
INSERT INTO `products` VALUES ('306', 'Yeo s Winter Melon ', '18', null, '1.00', null, null, null, null);
INSERT INTO `products` VALUES ('307', 'Grass Jelly', '18', null, '1.00', null, null, null, null);
INSERT INTO `products` VALUES ('308', 'Soy Milk', '18', null, '1.00', null, null, null, null);
INSERT INTO `products` VALUES ('309', 'Sour Sup', '18', null, '1.00', null, null, null, null);
INSERT INTO `products` VALUES ('310', 'ABC Stout Can', '4', '6', '3.00', null, '7', null, '2017-03-09 13:37:57');
INSERT INTO `products` VALUES ('311', 'Guiness Beer Small Btle', '4', '6', '3.00', null, '7', null, '2017-03-09 13:38:44');
INSERT INTO `products` VALUES ('312', 'Guiness Beer Can', '4', '6', '2.00', null, '7', null, '2017-03-09 13:38:39');
INSERT INTO `products` VALUES ('313', 'Angkor Beer Stout Btle', '4', '6', '3.00', null, '7', null, '2017-03-09 13:38:08');
INSERT INTO `products` VALUES ('314', 'Angkor Beer Stout Can', '4', '6', '2.50', null, '7', null, '2017-03-09 13:38:13');
INSERT INTO `products` VALUES ('315', 'Recard', '25', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('316', 'Martini Dry', '25', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('317', 'Bacardi White', '25', '6', '4.50', null, '7', null, '2017-03-09 13:37:14');
INSERT INTO `products` VALUES ('318', 'Tequila white', '25', null, '4.50', null, null, null, null);
INSERT INTO `products` VALUES ('319', 'Tequila gold', '25', null, '4.50', null, null, null, null);
INSERT INTO `products` VALUES ('320', 'Baileys', '25', '6', '3.00', null, '7', null, '2017-03-09 13:37:18');
INSERT INTO `products` VALUES ('321', 'Platinum Label', '25', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('322', 'Otard X.O', '25', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('323', 'Royal Salute 21 years', '25', null, '0.00', null, null, null, null);
INSERT INTO `products` VALUES ('324', 'Chivas Regal 18 Year', '25', null, '75.00', null, null, null, null);
INSERT INTO `products` VALUES ('325', 'Jonnei Black Label', '25', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('326', 'សូដាក្រូចឆ្មា', '15', '6', '2.00', null, '7', null, '2017-03-09 13:35:02');
INSERT INTO `products` VALUES ('327', 'ទឹកងំាង៉ូវ', '15', '6', '2.00', null, '7', null, '2017-03-09 13:34:34');
INSERT INTO `products` VALUES ('328', 'Ice Americano', '22', '6', '2.50', null, '7', null, '2017-03-09 14:19:23');
INSERT INTO `products` VALUES ('329', 'Hot Americano', '22', '6', '2.50', null, '7', null, '2017-03-09 14:19:16');
INSERT INTO `products` VALUES ('330', 'កាហ្វេទឹកដោះគោឆៅ', '22', '6', '2.00', null, '7', null, '2017-03-09 14:22:42');
INSERT INTO `products` VALUES ('331', 'កាកាវទឹកដោះគោ', '22', '6', '1.50', null, '7', null, '2017-03-09 14:22:09');
INSERT INTO `products` VALUES ('332', 'ទឹកម្នាស់ស្រស់', '10', null, '3.00', null, null, null, null);
INSERT INTO `products` VALUES ('333', 'Passion ទឹកកក', '10', null, '2.00', null, null, null, null);
INSERT INTO `products` VALUES ('334', 'Passion ទឹកដោះគោទឹកក', '10', null, '2.50', null, null, null, null);
INSERT INTO `products` VALUES ('335', 'ទៀបក្រឡុក', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('336', 'ម្នាស់ក្រឡុក', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('337', 'ឪឡឹកក្រឡុក', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('338', 'ប៉ោមក្រឡុក', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('339', 'Chocolate ក្រឡុក', '22', '6', '3.00', null, '7', null, '2017-03-09 14:13:32');
INSERT INTO `products` VALUES ('340', 'Chivas Regal 18year 1ML', '25', null, '95.00', null, null, null, null);
INSERT INTO `products` VALUES ('341', 'ហាវកាវប្រចាំហាង', '6', '3', '2.50', null, '7', null, '2017-03-09 13:28:16');
INSERT INTO `products` VALUES ('342', 'ប្រហិតសាច់គោជាមួយបន្លែស្រស់', '6', '3', '2.50', null, '7', null, '2017-03-09 13:27:58');
INSERT INTO `products` VALUES ('343', 'ខ្ញីចំហុយពោះគោមួយរយស្រទាប់', '6', '3', '2.50', null, '7', null, '2017-03-09 13:31:13');
INSERT INTO `products` VALUES ('344', 'នំត្រាវចៀន', '6', '3', '2.50', null, '7', null, '2017-03-09 13:30:04');
INSERT INTO `products` VALUES ('345', 'បបរបែបគ័ងចូវ', '3', '1', '3.50', null, '7', null, '2017-04-02 14:19:54');
INSERT INTO `products` VALUES ('346', 'បបរពងទាខ្មៅជាមួយសាច់ជ្រូក', '3', '1', '3.50', null, '7', null, '2017-04-02 14:20:14');
INSERT INTO `products` VALUES ('347', 'បបរសាច់ត្រីបន្ទះ', '3', '2', '3.50', null, '7', null, '2017-04-02 14:21:12');
INSERT INTO `products` VALUES ('348', 'បបរក្បាលត្រី', '3', '2', '3.50', null, '7', null, '2017-04-02 14:19:24');
INSERT INTO `products` VALUES ('349', 'បបរសាច់គោពងមាន់', '3', '1', '3.50', null, '7', null, '2017-04-02 14:20:57');
INSERT INTO `products` VALUES ('350', 'បបរឆ្អឹងជំនីជាមួយខ្យងក្រៀម', '3', '2', '3.50', null, '7', null, '2017-04-02 14:19:32');
INSERT INTO `products` VALUES ('351', 'បបរមាន់ជាមួយខ្យងផ្លិតក្រៀម', '3', '4', '3.50', null, '7', null, '2017-04-02 14:20:37');
INSERT INTO `products` VALUES ('352', 'គុយទាវកាត់ចំហុយសាច់គោ', '6', '3', '2.50', null, '7', null, '2017-03-09 13:31:22');
INSERT INTO `products` VALUES ('353', 'គុយទាវកាត់ចំហុយចាខ្វៃ', '6', '3', '2.50', null, '7', null, '2017-03-09 13:30:51');
INSERT INTO `products` VALUES ('354', 'គុយទាវកាត់បង្គាក្រៀមចៀន', '6', '3', '2.50', null, '7', null, '2017-03-09 13:30:28');
INSERT INTO `products` VALUES ('355', 'នំមួយពាន់ស្រទាប់', '6', '3', '2.50', null, '7', null, '2017-03-09 13:29:50');
INSERT INTO `products` VALUES ('356', 'ចៃយ៉បំពង', '6', '3', '2.50', null, '7', null, '2017-03-09 13:30:16');
INSERT INTO `products` VALUES ('357', 'បាយដំណើប', '6', '3', '2.50', null, '7', null, '2017-03-09 13:29:06');
INSERT INTO `products` VALUES ('358', 'សម្លកកូរឆ្អឹងជំនីជ្រូក (ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('359', 'សម្លកកូរសាច់មាន់ (ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('360', 'សម្លកកូរសាច់មាន់ (ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('361', 'សម្លកកូរសាច់មាន់ (ធ)', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('362', 'សម្លកកូរសាច់ជ្រូកបីជាន់​​ (ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('363', 'សម្លកកូរសាច់ជ្រូកបីជាន់​​ (ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('364', 'សម្លកកូរសាច់ជ្រូកបីជាន់​​ (ធ)', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('365', 'សម្លកកូរឆ្អឹងជំនីជ្រូក (ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('366', 'សម្លកកូរឆ្អឹងជំនីជ្រូក (ធ)', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('367', 'សម្លកកូរត្រីឆ្លាំង (ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('368', 'សម្លកកូរត្រីឆ្លាំង (ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('369', 'សម្លកកូរត្រីឆ្លាំង (ធ)', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('370', 'សម្លកកូរត្រីពោធិ៍ (ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('371', 'សម្លកកូរត្រីពោធិ៍ (ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('372', 'សម្លកកូរត្រីពោធិ៍ (ធ)', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('373', 'មីគាវ', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('374', 'មីគាវទាខ្វៃ', '14', null, '4.00', null, null, null, null);
INSERT INTO `products` VALUES ('375', 'មីទាខ្វៃ', '14', null, '4.00', null, null, null, null);
INSERT INTO `products` VALUES ('376', 'មីទាផាក់ឡូវ', '14', null, '4.00', null, null, null, null);
INSERT INTO `products` VALUES ('377', 'មីសួរសាច់មាន់', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('378', 'មីសួរសាច់​ចិញ្រ្ចាំ', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('379', 'មីសួរ​ធម្មតា', '14', null, '3.00', null, null, null, null);
INSERT INTO `products` VALUES ('380', 'មីសួរ​ទាខ្វៃ', '14', null, '4.00', null, null, null, null);
INSERT INTO `products` VALUES ('381', 'លតឆាសាច់ចិញ្រ្ចាំ', '16', '1', '3.50', null, '7', null, '2017-03-10 13:59:15');
INSERT INTO `products` VALUES ('382', 'លតឆាសាច់គោ', '16', '1', '3.50', null, '7', null, '2017-03-10 13:59:28');
INSERT INTO `products` VALUES ('383', 'លតឆាពិសេស', '16', '1', '4.00', null, '7', null, '2017-03-10 13:59:04');
INSERT INTO `products` VALUES ('384', 'នំបុង័ខគោ', '5', '4', '3.50', null, '7', null, '2017-03-10 14:08:36');
INSERT INTO `products` VALUES ('385', 'មីឆាគ្រឿងសមុទ្រ', '14', null, '4.00', null, null, null, null);
INSERT INTO `products` VALUES ('386', 'មីកូឡាបាត់ដំបង', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('387', 'បាញ់ស៊ុង', '2', '2', '3.50', null, '7', null, '2017-04-02 14:22:49');
INSERT INTO `products` VALUES ('388', 'បាញ់ហយ', '2', '2', '3.50', null, '7', null, '2017-04-02 14:23:26');
INSERT INTO `products` VALUES ('389', 'នំបញ្ចុក​សម្លខ្មែរ', '16', '2', '3.50', null, '7', null, '2017-03-10 13:57:03');
INSERT INTO `products` VALUES ('390', 'នំបញ្ចុក​សម្លណាំយ៉ា', '16', '2', '3.50', null, '7', null, '2017-03-10 13:57:11');
INSERT INTO `products` VALUES ('391', 'នំ​បញ្ចុក​សម្លការីសាច់​មាន់', '16', '2', '3.50', null, '7', null, '2017-03-10 13:57:27');
INSERT INTO `products` VALUES ('392', 'នំ​បញ្ចុក​កំពត', '16', '2', '3.50', null, '7', null, '2017-03-10 13:57:18');
INSERT INTO `products` VALUES ('393', 'បបរ​ជាមួយ​ត្រី​ខ', '3', '2', '4.00', null, '7', null, '2017-04-02 14:21:30');
INSERT INTO `products` VALUES ('394', 'បបរ​ត្រី', '3', '2', '3.00', null, '7', null, '2017-04-02 14:21:42');
INSERT INTO `products` VALUES ('395', 'បបរ​សាច់​ជ្រូក', '3', '4', '3.50', null, '7', null, '2017-04-02 14:22:00');
INSERT INTO `products` VALUES ('396', 'បបរ​សាម​ចូក', '3', '4', '3.50', null, '7', null, '2017-04-02 14:22:07');
INSERT INTO `products` VALUES ('397', 'បបរ​លតធម្មតា', '3', '4', '3.00', null, '7', null, '2017-04-02 14:21:49');
INSERT INTO `products` VALUES ('398', 'ពពុះ​សណ្កែក​ខ្ចប់ ត្រចៀក​កណ្ដុរ', '6', '3', '2.50', null, '7', null, '2017-03-09 13:28:37');
INSERT INTO `products` VALUES ('399', '០44​   ហា​កាវ', '6', '3', '2.85', null, '7', null, '2017-03-09 13:31:46');
INSERT INTO `products` VALUES ('400', 'ស៊ីវ​ម៉ៃ', '6', '3', '2.50', null, '7', null, '2017-03-09 13:28:27');
INSERT INTO `products` VALUES ('401', 'បាយ​ដំណើប​ស្នូល សាច់​មាន់', '6', '3', '3.00', null, '7', null, '2017-03-09 13:28:46');
INSERT INTO `products` VALUES ('402', 'នំ​ប៉ាវ​ប្រៃ​ពិសេស', '6', '3', '2.50', null, '7', null, '2017-03-09 13:29:37');
INSERT INTO `products` VALUES ('403', 'នំ​ប៉ាវ​ស្នូល​ត្រាវ', '6', '3', '2.50', null, '7', null, '2017-03-09 13:29:29');
INSERT INTO `products` VALUES ('404', 'នំ​ប៉ាវ​ស្នូល​សណ្ដែក', '6', '3', '2.50', null, '7', null, '2017-03-09 13:29:20');
INSERT INTO `products` VALUES ('405', 'នំ​បុ័ង​ប៉ាតេ', '5', '1', '2.50', null, '7', null, '2017-04-02 14:17:51');
INSERT INTO `products` VALUES ('406', 'ញាំបន្លែស្រស់គ្រឿងសមុទ្រ​(ត)', '19', '2', '8.00', null, '7', null, '2017-03-09 15:14:45');
INSERT INTO `products` VALUES ('407', 'ញាំបន្លែស្រស់គ្រឿងសមុទ្រ(ក)', '19', '2', '10.00', null, '7', null, '2017-03-09 15:08:01');
INSERT INTO `products` VALUES ('408', 'ញាំបន្លែស្រស់គ្រឿងសមុទ្រ(ធំ)', '19', '2', '12.00', null, '7', null, '2017-03-09 15:08:09');
INSERT INTO `products` VALUES ('409', 'ញាំម្កាក់ត្រីឆ្អើរ (តូច)', '19', '2', '9.00', null, '7', null, '2017-03-09 15:15:12');
INSERT INTO `products` VALUES ('410', 'ញាំម្កាក់ត្រីឆ្អើរ (ក)', '19', '2', '11.00', null, '7', null, '2017-03-09 15:15:04');
INSERT INTO `products` VALUES ('411', 'ញាំម្កាក់ត្រីឆ្អើរ (ធំ)', '19', '2', '13.00', null, '7', null, '2017-03-09 15:15:19');
INSERT INTO `products` VALUES ('412', 'ញាំស្វាយត្រីឆ្អើរ​(ត)', '19', '2', '9.00', null, '7', null, '2017-03-09 15:16:14');
INSERT INTO `products` VALUES ('413', 'ញាំស្វាយត្រីឆ្អើរ​(ក)', '19', '2', '11.00', null, '7', null, '2017-03-09 15:16:05');
INSERT INTO `products` VALUES ('414', 'ញាំស្វាយត្រីឆ្អើរ​(ធំ)', '19', '2', '13.00', null, '7', null, '2017-03-09 15:16:32');
INSERT INTO `products` VALUES ('415', 'បុកសណ្តែកកួរត្រីឆ្អើរ(តូ)', '19', '2', '9.00', null, '7', null, '2017-03-09 15:19:06');
INSERT INTO `products` VALUES ('416', 'បុកសណ្តែកកួរត្រីឆ្អើរ(ក)', '19', '2', '11.00', null, '7', null, '2017-03-09 15:18:58');
INSERT INTO `products` VALUES ('417', 'បុកសណ្តែកកួរត្រីឆ្អើរ(ធំ)', '19', '2', '13.00', null, '7', null, '2017-03-09 15:19:24');
INSERT INTO `products` VALUES ('418', 'បុកស្វាយបង្គាក្រៀម(ត)', '19', '2', '8.00', null, '7', null, '2017-03-09 15:20:21');
INSERT INTO `products` VALUES ('419', 'បុកស្វាយបង្គាក្រៀម(ក)', '19', '2', '10.00', null, '7', null, '2017-03-09 15:20:11');
INSERT INTO `products` VALUES ('420', 'បុកស្វាយបង្គាក្រៀម (ធំ)', '19', '2', '12.00', null, '7', null, '2017-03-09 15:20:03');
INSERT INTO `products` VALUES ('421', 'សាច់គោបុកម្អម (ត)', '19', '2', '9.00', null, '7', null, '2017-03-09 15:22:46');
INSERT INTO `products` VALUES ('422', 'សាច់គោបុកម្អម (ក)', '19', '2', '11.00', null, '7', null, '2017-03-09 15:23:35');
INSERT INTO `products` VALUES ('423', 'សាច់គោបុកម្អម (ធំ)', '19', '2', '13.00', null, '7', null, '2017-03-09 15:23:44');
INSERT INTO `products` VALUES ('424', 'បុកត្រប់ពុតញងនិងត្រីរ៉ស់ (ត)', '19', '2', '7.00', null, '7', null, '2017-03-09 15:18:44');
INSERT INTO `products` VALUES ('425', 'បុកត្រប់ពុតញងនិងត្រីរ៉ស់ (ក)', '19', '2', '9.00', null, '7', null, '2017-03-09 15:18:35');
INSERT INTO `products` VALUES ('426', 'បុកត្រប់ពុតញងនិងត្រីរ៉ស់ (ធំ)', '19', '2', '11.00', null, '7', null, '2017-03-09 15:18:51');
INSERT INTO `products` VALUES ('427', 'ភ្លាកំពឹស (ត)', '19', '2', '7.00', null, '7', null, '2017-03-09 15:21:02');
INSERT INTO `products` VALUES ('428', 'ភ្លាកំពឹស(ក)', '19', '2', '9.00', null, '7', null, '2017-03-09 15:21:21');
INSERT INTO `products` VALUES ('429', 'ភ្លាកំពឹស (ធំ)', '19', '2', '11.00', null, '7', null, '2017-03-09 15:21:12');
INSERT INTO `products` VALUES ('430', 'ភ្លាត្រីរ៉ស់(ត)', '19', '2', '9.00', null, '7', null, '2017-03-09 15:22:56');
INSERT INTO `products` VALUES ('431', 'ភ្លាត្រីរ៉ស់(ក)', '19', '2', '11.00', null, '7', null, '2017-03-09 15:22:32');
INSERT INTO `products` VALUES ('432', 'ភ្លាត្រីរ៉ស់ (ធំ)', '19', '2', '13.00', null, '7', null, '2017-03-09 15:22:25');
INSERT INTO `products` VALUES ('433', 'ភ្លាសាច់គោ (ត)', '19', '2', '9.00', null, '7', null, '2017-03-09 15:23:03');
INSERT INTO `products` VALUES ('434', 'ភ្លាសាច់គោ(ក)', '19', '2', '11.00', null, '7', null, '2017-03-09 15:23:26');
INSERT INTO `products` VALUES ('435', 'ភ្លាសាច់គោ (ធំ)', '19', '2', '13.00', null, '7', null, '2017-03-09 15:23:11');
INSERT INTO `products` VALUES ('436', 'ភ្លាត្រីម្រះ(ត)', '19', '2', '9.00', null, '7', null, '2017-03-09 15:22:10');
INSERT INTO `products` VALUES ('437', 'ភ្លាត្រីម្រះ(ក)', '19', '2', '11.00', null, '7', null, '2017-03-09 15:22:02');
INSERT INTO `products` VALUES ('438', 'ភ្លាត្រីម្រះ(ធំ)', '19', '2', '13.00', null, '7', null, '2017-03-09 15:22:17');
INSERT INTO `products` VALUES ('439', 'ឡាបសាច់គោ (ត)', '19', '2', '10.00', null, '7', null, '2017-03-09 15:24:00');
INSERT INTO `products` VALUES ('440', 'ឡាបសាច់គោ (ក)', '19', '2', '12.00', null, '7', null, '2017-03-09 15:23:53');
INSERT INTO `products` VALUES ('441', 'ឡាបសាច់គោ (ធំ)', '19', '2', '15.00', null, '7', null, '2017-03-09 15:24:08');
INSERT INTO `products` VALUES ('442', 'ញំាសាច់មាន់ត្រយូងចេក(ត)', '19', '2', '10.00', null, '7', null, '2017-03-09 15:17:30');
INSERT INTO `products` VALUES ('443', 'ញំាសាច់មាន់ត្រយូងចេក(ក)', '19', '2', '12.00', null, '7', null, '2017-03-09 15:17:22');
INSERT INTO `products` VALUES ('444', 'ញំាសាច់មាន់ត្រយូងចេក (ធំ)', '19', '2', '15.00', null, '7', null, '2017-03-09 15:17:12');
INSERT INTO `products` VALUES ('445', 'ញំាំមីសួរគ្រឿងសមុទ្រ(ត)', '19', '2', '10.00', null, '7', null, '2017-03-09 15:17:48');
INSERT INTO `products` VALUES ('446', 'ញំាំមីសួរគ្រឿងសមុទ្រ(ក)', '19', '2', '12.00', null, '7', null, '2017-03-09 15:17:38');
INSERT INTO `products` VALUES ('447', 'ញំាំមីសួរគ្រឿងសមុទ្រ(ធំ)', '19', '2', '15.00', null, '7', null, '2017-03-09 15:17:57');
INSERT INTO `products` VALUES ('448', 'ចេកខ្ចីបុកកំពឹស(ត)', '19', '2', '9.00', null, '7', null, '2017-03-09 15:07:19');
INSERT INTO `products` VALUES ('449', 'ចេកខ្ចីបុកកំពឹស(ក)', '19', '2', '11.00', null, '7', null, '2017-03-09 15:07:11');
INSERT INTO `products` VALUES ('450', 'ចេកខ្ចីបុកកំពឹស(ធំ)', '19', '2', '13.00', null, '7', null, '2017-03-09 15:07:24');
INSERT INTO `products` VALUES ('451', 'ភ្លាក្រៅអង្ការ(ត)', '19', '2', '9.00', null, '7', null, '2017-03-09 15:21:53');
INSERT INTO `products` VALUES ('452', 'ភ្លាក្រៅអង្ការ(ក)', '19', '2', '11.00', null, '7', null, '2017-03-09 15:21:36');
INSERT INTO `products` VALUES ('453', 'ភ្លាក្រៅអង្ការ(ធំ)', '19', '2', '13.00', null, '7', null, '2017-03-09 15:21:45');
INSERT INTO `products` VALUES ('454', 'ទឹកគ្រឿងខ្មែរ(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:53:40');
INSERT INTO `products` VALUES ('455', 'ទឹកគ្រឿងខ្មែរ(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:53:23');
INSERT INTO `products` VALUES ('456', 'ទឹកគ្រឿងខ្មែរ(ធំ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:54:00');
INSERT INTO `products` VALUES ('457', 'ទឹកគ្រឿងបាត់ដំបង(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:54:20');
INSERT INTO `products` VALUES ('458', 'ទឹកគ្រឿងបាត់ដំបង(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:54:10');
INSERT INTO `products` VALUES ('459', 'ប្រហុកលិងពិសេស(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:56:30');
INSERT INTO `products` VALUES ('460', 'ប្រហុកលិងពិសេស(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:56:22');
INSERT INTO `products` VALUES ('461', 'ប្រហុកលិងពិសេស (ធំ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:56:13');
INSERT INTO `products` VALUES ('462', 'មុំាឆៅពោះតាន់(ក)', '12', '2', '13.00', null, '7', null, '2017-03-09 15:00:14');
INSERT INTO `products` VALUES ('463', 'មុំាឆៅពោះតាន់(ធំ)', '12', '2', '15.00', null, '7', null, '2017-03-09 15:00:32');
INSERT INTO `products` VALUES ('464', 'ផ្អកត្រីសណ្តាយចៀន ឬ ត្រីពោធឺ៏(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:57:02');
INSERT INTO `products` VALUES ('465', 'ផ្អកត្រីសណ្តាយចៀន ឬ ត្រីពោធឺ៏(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:56:51');
INSERT INTO `products` VALUES ('466', 'ផ្អកត្រីសណ្តាយចៀន ឬ ត្រីពោធឺ៏(ធំ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:57:12');
INSERT INTO `products` VALUES ('467', 'ខ្នប់កូនត្រី(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:31:32');
INSERT INTO `products` VALUES ('468', 'ខ្នប់កូនត្រី(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:31:19');
INSERT INTO `products` VALUES ('469', 'ខ្នប់កូនត្រី(ធំ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:31:45');
INSERT INTO `products` VALUES ('470', 'ប្រហុកឆៅត្រីឆ្អើរ(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:55:57');
INSERT INTO `products` VALUES ('471', 'ប្រហុកឆៅត្រីឆ្អើរ(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:55:48');
INSERT INTO `products` VALUES ('472', 'ប្រហុកឆៅត្រីឆ្អើរ(ធំ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:56:05');
INSERT INTO `products` VALUES ('473', 'កង្កែបអាំងអំបិលម្ទេស(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:28:57');
INSERT INTO `products` VALUES ('474', 'កង្កែបអាំងអំបិលម្ទេស(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:28:45');
INSERT INTO `products` VALUES ('475', 'កង្កែបអាំងអំបិលម្ទេស(ធំ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:29:06');
INSERT INTO `products` VALUES ('476', 'ត្រីរ៉ស់ដុតអំបិលទឹកត្រីស្វាយ', '12', '2', '9.50', null, '7', null, '2017-03-09 14:52:53');
INSERT INTO `products` VALUES ('477', 'បង្កងអប់គ្រឿង', '20', '2', '0.00', null, '7', null, '2017-04-02 14:10:42');
INSERT INTO `products` VALUES ('478', 'ត្រីកេះចៀនជ្រក់ចេក(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:42:50');
INSERT INTO `products` VALUES ('479', 'ត្រីកេះចៀនជ្រក់ចេក(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:42:32');
INSERT INTO `products` VALUES ('480', 'ត្រីកេះចៀនជ្រក់ចេក(ធំ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:43:02');
INSERT INTO `products` VALUES ('481', 'ត្រីកេះចៀនជូន(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:41:43');
INSERT INTO `products` VALUES ('482', 'ត្រីកេះចៀនជូន(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:41:32');
INSERT INTO `products` VALUES ('483', 'ត្រីកេះចៀនជូន(ធំ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:41:53');
INSERT INTO `products` VALUES ('484', 'ត្រីឆ្លូញចៀនបុកអំពិលខ្ចី(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:50:51');
INSERT INTO `products` VALUES ('485', 'ត្រីឆ្លូញចៀនបុកអំពិលខ្ចី(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:50:21');
INSERT INTO `products` VALUES ('486', 'ត្រីឆ្លូញចៀនបុកអំពិលខ្ចី(ធំ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:51:15');
INSERT INTO `products` VALUES ('487', 'កូនត្រីបំពងសួ្រយ(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:29:55');
INSERT INTO `products` VALUES ('488', 'កូនត្រីបំពងសួ្រយ(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:29:46');
INSERT INTO `products` VALUES ('489', 'កូនត្រីបំពងសួ្រយ(ធំ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:30:14');
INSERT INTO `products` VALUES ('490', 'អាម៉ុកត្រីរ៉ស់(ត)', '12', '2', '10.00', null, '7', null, '2017-03-09 15:00:47');
INSERT INTO `products` VALUES ('491', 'អាម៉ុកត្រីរ៉ស់(ក)', '12', '2', '12.00', null, '7', null, '2017-03-09 15:00:40');
INSERT INTO `products` VALUES ('492', 'អាម៉ុកត្រីរ៉ស់(ធំ)', '12', '2', '15.00', null, '7', null, '2017-03-09 15:00:54');
INSERT INTO `products` VALUES ('493', 'ត្រីរ៉ស់បំពងទឹកត្រីស្វាយ', '12', '2', '9.50', null, '7', null, '2017-03-09 14:53:02');
INSERT INTO `products` VALUES ('494', 'ត្រីប្រម៉ាចៀន(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:52:10');
INSERT INTO `products` VALUES ('495', 'ត្រីប្រម៉ាចៀន(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:52:00');
INSERT INTO `products` VALUES ('496', 'ត្រីប្រម៉ាចៀន(ធំ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:52:18');
INSERT INTO `products` VALUES ('497', 'ខទីវត្រីរ៉ស់(ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('498', 'ខទីវត្រីរ៉ស់(ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('499', 'ខទីវត្រីរ៉ស់(ធំ)', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('500', 'ខទីវបង្កង', '21', null, '0.00', null, null, null, null);
INSERT INTO `products` VALUES ('501', 'ខមុំា(ត)', '21', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('502', 'ខមុំា(ក)', '21', null, '12.00', null, null, null, null);
INSERT INTO `products` VALUES ('503', 'ខមុំា(ធំ)', '21', null, '15.00', null, null, null, null);
INSERT INTO `products` VALUES ('504', 'សម្លកកូរត្រីអណ្តែង(ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('505', 'គុយទាវឆាគ្រឿងសមទ្រ(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('506', 'គុយទាវឆាគ្រឿងសមុទ្រ(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('507', 'គុយទាវឆាគ្រឿងសមុទ្រ(ធំ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('508', 'គុយទាវឆាសាច់គោ(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('509', 'គុយទាវឆាសាច់គោ(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('510', 'គុយទាវឆាសាច់គោ(ធំ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('511', 'គុយទាវឆាសាច់ជ្រូក(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('512', 'សម្លកកូរត្រីអណ្តែង(ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('513', 'សម្លកកូរត្រីអណ្តែង(ធំ)', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('514', 'នំប៉ាវចំហុយនិងនំប៉ាវបំពង', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('515', 'នំប៉ាវចំហុយនិងនំប៉ាវបំពង', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('516', 'គុយទាវឆាសាច់ជ្រូក(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('517', 'គុយទាវឆាសាច់ជ្រូក(ធំ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('518', 'មីឆ្អឹងស៊ុប', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('519', 'សម្លសន្លក់ត្រី​អាំង(ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('520', 'សម្លសន្លក់ត្រី​អាំង(ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('521', 'សម្លសន្លក់ត្រី​អាំង ( ធំ )', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('522', 'សម្លប្រហើរបុកគ្រឿង(ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('523', 'សម្លប្រហើរបុកគ្រឿង(ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('524', 'សម្លប្រហើរបុកគ្រឿង(ធំ)', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('525', 'ម្ជួរគ្រឿងសាច់គោ(ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('526', 'ម្ជួរគ្រឿងសាច់គោ(ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('527', 'ម្ជួរគ្រឿងសាច់គោ ( ធំ )', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('528', 'ម្ជួរសៀមរាប(ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('529', 'ម្ជួរសៀមរាប(ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('530', 'ម្ជួរសៀមរាប( ធំ )', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('531', 'ម្ជួរក្តាតកូនត្រី(ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('532', 'ម្ជួរក្តាតកូនត្រី(ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('533', 'ម្ជួរក្តាតកូនត្រី( ធំ )', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('534', 'ម្ជូរមាន់ខ្មែរលើ(ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('535', 'ម្ជូរមាន់ខ្មែរលើ(ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('536', 'ម្ជូរមាន់ខ្មែរលើ( ធំ )', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('537', 'ស្ងោរជ្រក់មាន់(ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('538', 'ស្ងោរជ្រក់មាន់(ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('539', 'ស្ងោរជ្រក់មាន់ ( ធំ )', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('540', 'ម្ជួរព្រៃពងត្រីសណ្តាយ(ត)', '21', null, '12.00', null, null, null, null);
INSERT INTO `products` VALUES ('541', 'ម្ជួរព្រៃពងត្រីសណ្តាយ(ក)', '21', null, '15.00', null, null, null, null);
INSERT INTO `products` VALUES ('542', 'ម្ជួរព្រៃពងត្រីសណ្តាយ ( ធំ )', '21', null, '18.00', null, null, null, null);
INSERT INTO `products` VALUES ('543', 'ស៊ុបត្រាវត្រីឆ្កោក(ត)', '21', null, '12.00', null, null, null, null);
INSERT INTO `products` VALUES ('544', 'ស៊ុបត្រាវត្រីឆ្កោក(ក)', '21', null, '15.00', null, null, null, null);
INSERT INTO `products` VALUES ('545', 'ស៊ុបត្រាវត្រីឆ្កោក(ធំ)', '21', null, '18.00', null, null, null, null);
INSERT INTO `products` VALUES ('546', 'ម្ជួរគ្រឿងសាច់មាន់(ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('547', 'ម្ជួរគ្រឿងសាច់មាន់(ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('548', 'ម្ជួរគ្រឿងសាច់មាន់ ( ធំ )', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('549', 'ងាវឆាអំពិលទុំ(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:32:19');
INSERT INTO `products` VALUES ('550', 'ងាវឆាអំពិលទុំ(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:32:06');
INSERT INTO `products` VALUES ('551', 'ងាវឆាអំពិលទុំ ( ធំ )', '12', '2', '11.00', null, '7', null, '2017-03-09 14:31:57');
INSERT INTO `products` VALUES ('552', 'ឆាគ្រឿងសាច់គោ(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:35:58');
INSERT INTO `products` VALUES ('553', 'ឆាគ្រឿងសាច់គោ(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:35:45');
INSERT INTO `products` VALUES ('554', 'ឆាគ្រឿងសាច់គោ( ធំ )', '12', '2', '11.00', null, '7', null, '2017-03-09 14:35:36');
INSERT INTO `products` VALUES ('555', 'ពោះតាន់ឆាស្ពៃជូរ(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:58:04');
INSERT INTO `products` VALUES ('556', 'ពោះតាន់ឆាស្ពៃជូរ(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:57:55');
INSERT INTO `products` VALUES ('557', 'ពោះតាន់ឆាស្ពៃជូរ​ ( ធំ )', '12', '2', '11.00', null, '7', null, '2017-03-09 14:58:13');
INSERT INTO `products` VALUES ('558', 'ឆាម្រះព្រៅសាច់គោ(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:37:35');
INSERT INTO `products` VALUES ('559', 'ឆាម្រះព្រៅសាច់គោ(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:37:25');
INSERT INTO `products` VALUES ('560', 'ឆាម្រះព្រៅសាច់គោ( ធំ )', '12', '2', '11.00', null, '7', null, '2017-03-09 14:37:15');
INSERT INTO `products` VALUES ('561', 'បង្កា ក្នូងមួយគីឡូ​​ 25ដុល្លា', '20', '1', '0.00', null, '7', null, '2017-04-02 14:11:09');
INSERT INTO `products` VALUES ('562', 'ត្រីស្ពុង ក្នូងមួយគីឡូ​​ 2០ដុល្លា', '8', '1', '0.00', null, '7', null, '2017-04-02 14:32:16');
INSERT INTO `products` VALUES ('563', 'ប៉ាវហ៊ឺ', '20', '1', '0.00', null, '7', null, '2017-04-02 14:13:52');
INSERT INTO `products` VALUES ('564', 'សាច់ជ្រូកឆាហឺរ(ត)', '13', '1', '7.00', null, '7', null, '2017-04-02 15:02:56');
INSERT INTO `products` VALUES ('565', 'សាច់ជ្រូកឆាហឺរ(ក)', '13', '1', '9.00', null, '7', null, '2017-04-02 15:02:48');
INSERT INTO `products` VALUES ('566', 'សាច់ជ្រូកឆាហឺរ(ធំ)', '13', '1', '11.00', null, '7', null, '2017-04-02 15:03:05');
INSERT INTO `products` VALUES ('567', 'សាច់ជ្រូកបន្ទះដែកតៅហ៊ូ(ត)', '13', '1', '9.00', null, '7', null, '2017-04-02 15:03:27');
INSERT INTO `products` VALUES ('568', 'សាច់ជ្រូកបន្ទះដែកតៅហ៊ូ(ក)', '13', '1', '11.00', null, '7', null, '2017-04-02 15:03:16');
INSERT INTO `products` VALUES ('569', 'សាច់ជ្រូកបន្ទះដែកតៅហ៊ូ(ធំ)', '13', '1', '13.00', null, '7', null, '2017-04-02 15:03:37');
INSERT INTO `products` VALUES ('570', 'សាច់ជ្រូកឆាជូរអែម(ត)', '13', '1', '7.00', null, '7', null, '2017-04-02 15:02:31');
INSERT INTO `products` VALUES ('571', 'សាច់ជ្រូកឆាជូរអែម(ក)', '13', '1', '9.00', null, '7', null, '2017-04-02 15:02:22');
INSERT INTO `products` VALUES ('572', 'សាច់ជ្រូកឆាជូរអែម(ធំ)', '13', '1', '11.00', null, '7', null, '2017-04-02 15:02:38');
INSERT INTO `products` VALUES ('573', 'ឆ្អឹងជំនីជ្រូកចំហុយសៀងខ្មៅ(ត)', '13', '1', '8.00', null, '7', null, '2017-04-02 14:50:41');
INSERT INTO `products` VALUES ('574', 'ឆ្អឹងជំនីជ្រូកចំហុយសៀងខ្មៅ(ក)', '13', '1', '10.00', null, '7', null, '2017-04-02 14:50:23');
INSERT INTO `products` VALUES ('575', 'ឆ្អឹងជំនីជ្រូកចំហុយសៀងខ្មៅ(ធំ)', '13', '1', '12.00', null, '7', null, '2017-04-02 14:50:55');
INSERT INTO `products` VALUES ('576', 'ឆ្អឹងជំនីជ្រូកឆាជួអែម(ត)', '13', '1', '8.00', null, '7', null, '2017-04-02 14:51:20');
INSERT INTO `products` VALUES ('577', 'ឆ្អឹងជំនីជ្រូកឆាជូរអែម(ក)', '13', '1', '10.00', null, '7', null, '2017-04-02 14:51:07');
INSERT INTO `products` VALUES ('578', 'ឆ្អឹងជំនីជ្រូកឆាជូរអែម(ធំ)', '13', '1', '12.00', null, '7', null, '2017-04-02 14:51:14');
INSERT INTO `products` VALUES ('579', 'សាច់គោឡុកឡា​ក់(ត)', '13', '1', '8.00', null, '7', null, '2017-04-02 15:01:09');
INSERT INTO `products` VALUES ('580', 'សាច់គោឡុកឡា​ក់(ក)', '13', '1', '10.00', null, '7', null, '2017-04-02 15:00:57');
INSERT INTO `products` VALUES ('581', 'សាច់គោឡុកឡា​ក់(ធំ)', '13', '1', '12.00', null, '7', null, '2017-04-02 15:01:23');
INSERT INTO `products` VALUES ('582', 'ឆ្អឹងជំនីជ្រូកបំពងខ្ទឹមស(ត)', '13', '1', '8.00', null, '7', null, '2017-04-02 14:51:34');
INSERT INTO `products` VALUES ('583', 'ឆ្អឹងជំនីជ្រូកបំពងខ្ទឹមស(ក)', '13', '1', '10.00', null, '7', null, '2017-04-02 14:51:26');
INSERT INTO `products` VALUES ('584', 'ឆ្អឹងជំនីជ្រូកបំពងខ្ទឹមស(ធំ)', '13', '1', '12.00', null, '7', null, '2017-04-02 14:51:40');
INSERT INTO `products` VALUES ('585', 'ឆ្អឹងជំនីគោបន្ទះដែក(ត)', '13', '1', '14.00', null, '7', null, '2017-04-02 14:50:09');
INSERT INTO `products` VALUES ('586', 'ឆ្អឹងជំនីគោបន្ទះដែក(ក)', '13', '1', '16.00', null, '7', null, '2017-04-02 14:49:59');
INSERT INTO `products` VALUES ('587', 'សាច់គោបន្ទះដែក(ត)', '13', '1', '10.00', null, '7', null, '2017-04-02 14:59:38');
INSERT INTO `products` VALUES ('588', 'សាច់គោបន្ទះដែក(ក)', '13', '1', '12.00', null, '7', null, '2017-04-02 14:59:31');
INSERT INTO `products` VALUES ('589', 'សាច់គោបន្ទះដែក ( ធំ )', '13', '1', '14.00', null, '7', null, '2017-04-02 14:59:22');
INSERT INTO `products` VALUES ('590', 'មឹកបន្ទះដែក(ត)', '20', '1', '8.00', null, '7', null, '2017-04-02 14:15:21');
INSERT INTO `products` VALUES ('591', 'មឹកបន្ទះដែក(ក)', '20', '1', '10.00', null, '7', null, '2017-04-02 14:15:08');
INSERT INTO `products` VALUES ('592', 'មឹកបន្ទះដែក( ធំ )', '20', '1', '12.00', null, '7', null, '2017-04-02 14:14:55');
INSERT INTO `products` VALUES ('593', 'មឹកបំពងខ្ទឹមស(ត)', '20', '1', '8.00', null, '7', null, '2017-04-02 14:15:56');
INSERT INTO `products` VALUES ('594', 'មឹកបំពងខ្ទឹមស(ក)', '20', '1', '10.00', null, '7', null, '2017-04-02 14:15:45');
INSERT INTO `products` VALUES ('595', 'មឹកបំពងខ្ទឹមស ( ធំ )', '20', '1', '12.00', null, '7', null, '2017-04-02 14:15:32');
INSERT INTO `products` VALUES ('596', 'តៅហ៊ូបំពងខ្ទឹមស(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:39:38');
INSERT INTO `products` VALUES ('597', 'តៅហ៊ូបំពងខ្ទឹមស(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:39:30');
INSERT INTO `products` VALUES ('598', 'តៅហ៊ូបំពងខ្ទឹមស( ធំ )', '12', '2', '11.00', null, '7', null, '2017-03-09 14:39:21');
INSERT INTO `products` VALUES ('599', 'ម៉ាប៉តៅហ៊ូ(ត)', '17', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('600', 'ម៉ាប៉តៅហ៊ូ(ក)', '17', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('601', 'ម៉ាប៉តៅហ៊ូ(ធំ)', '17', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('602', 'តៅហ៊ូខឆ្នំាងដី(ត)', '17', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('603', 'តៅហ៊ូខឆ្នំាងដី(ក)', '17', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('604', 'តៅហ៊ូខឆ្នំាងដី(ធំ)', '17', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('605', 'មីឆាគ្រឿង​សមុទ្រ​ (ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('606', 'មីឆាគ្រឿង​សមុទ្រ​ (ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('607', 'មីឆាគ្រឿង​សមុទ្រ​ (ធំ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('608', 'មីឆាសាច់គោ(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('609', 'មីឆាសាច់គោ(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('610', 'មីឆាសាច់គោ(ធំ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('611', 'មីឆាសាច់ជ្រូក(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('612', 'មីឆាសាច់ជ្រូក(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('613', 'មីឆាសាច់ជ្រូក ( ធំ )', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('614', 'មីឆាផ្សិតខ្មៅ(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('615', 'មីឆាផ្សិតខ្មៅ(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('616', 'មីឆាផ្សិតខ្មៅ​ (ធំ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('617', 'បាយឆាគ្រឿងសមុទ្រ(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('618', 'បាយឆាគ្រឿងសមុទ្រ(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('619', 'បាយឆាគ្រឿងសមុទ្រ(ធំ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('620', 'បាយឆាយ៉ាងចូវ(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('621', 'បាយឆាយ៉ាងចូវ(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('622', 'បាយឆាយ៉ាងចូវ(ធំ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('623', 'បាយឆាសាច់ក្តាម(ត)​', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('624', 'បាយឆាសាច់ក្តាម(ក)​', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('625', 'បាយឆាសាច់ក្តាម(ធំ)​', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('626', 'បាយឆាឡុកឡាក់(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('627', 'បាយឆាឡុកឡាក់(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('628', 'បាយឆាឡុកឡាក់(ធំ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('629', 'ចៃយ៉គ្រឿង​សមុទ្រ ( ត )', '17', null, '5.00', null, null, null, null);
INSERT INTO `products` VALUES ('630', 'ចៃយ៉គ្រឿង​សមុទ្រ (ក)', '17', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('631', 'ចៃយ៉គ្រឿង​សមុទ្រ (ធំ)', '17', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('632', 'នំប៉ាវចំហុយនិងនំប៉ាវបំពង', '17', null, '4.00', null, null, null, null);
INSERT INTO `products` VALUES ('633', 'ពោតបំពងស្រួយ(ត)', '17', null, '4.00', null, null, null, null);
INSERT INTO `products` VALUES ('634', 'ពោតបំពងស្រួយ(ក)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('635', 'ពោតបំពងស្រួយ(ធំ)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('636', 'ណែមស្បែកជ្រូក (កណ្តាល)', '19', '2', '11.00', null, '7', null, '2017-03-09 15:18:06');
INSERT INTO `products` VALUES ('637', 'ណែមស្បែកជ្រូក (ធំ)', '19', '2', '13.00', null, '7', null, '2017-03-09 15:18:27');
INSERT INTO `products` VALUES ('638', 'នំបុ័ង', '5', '4', '1.00', null, '7', null, '2017-03-10 14:08:45');
INSERT INTO `products` VALUES ('639', 'សាំងវ៉ិច', '5', '1', '1.50', null, '7', null, '2017-04-02 14:18:14');
INSERT INTO `products` VALUES ('640', 'មីសាច់បាក់សៀក', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('641', 'មីឆាសាច់គោ', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('642', 'លតឆាគ្រឿងសមុទ្រ', '16', '1', '4.00', null, '7', null, '2017-03-10 13:57:56');
INSERT INTO `products` VALUES ('643', 'លតឆាសាច់ជ្រូក', '16', '1', '3.50', null, '7', null, '2017-03-10 13:59:34');
INSERT INTO `products` VALUES ('644', 'មីឆាសាច់ជ្រូក', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('645', 'មីប្រហិតត្រី', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('646', 'មីសាច់ស្រួយ', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('647', 'មីសាច់ជ្រូក', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('648', 'កាកាវទឹកដោះគោទឹកកក', '22', '6', '1.50', null, '7', null, '2017-03-09 14:22:16');
INSERT INTO `products` VALUES ('649', 'មីប្រហិតសាច់ជ្រូក', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('650', 'មីធម្មតា', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('651', 'មីគ្រឿងសមុទ្រ', '14', null, '4.00', null, null, null, null);
INSERT INTO `products` VALUES ('652', 'មីឆាសាច់ស្រួយពងក្រឡុក', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('653', 'មីខគោ', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('654', 'សាយ៉', '2', '2', '2.50', null, '7', null, '2017-04-02 14:23:43');
INSERT INTO `products` VALUES ('655', 'មីឆាសាច់មាន់', '14', null, '3.00', null, null, null, null);
INSERT INTO `products` VALUES ('656', 'សូដាពងមាន់ទឹកដោះគោទឹកកក', '15', '6', '2.00', null, '7', null, '2017-03-09 13:35:10');
INSERT INTO `products` VALUES ('657', 'មីគ្រឿងក្នុង', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('658', 'មីសាច់ជ្រូកចិញ្ច្រាំ', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('659', 'ពោះតាន់ឆាស្ពៃជូរ​ (តូច)', '12', '2', '8.00', null, '7', null, '2017-03-09 14:58:32');
INSERT INTO `products` VALUES ('660', 'ពោះតាន់ឆាស្ពៃជូរ​ (កណ្តាល)', '12', '2', '10.00', null, '7', null, '2017-03-09 14:58:22');
INSERT INTO `products` VALUES ('661', 'ពោះតាន់ឆាស្ពៃជូរ​ (ធំ)', '12', '2', '12.00', null, '7', null, '2017-03-09 14:58:42');
INSERT INTO `products` VALUES ('662', 'ឆាមាន់គល់ស្លឹកគ្រៃ (តូច)', '12', '2', '7.50', null, '7', null, '2017-03-09 14:36:55');
INSERT INTO `products` VALUES ('663', 'ឆាមាន់គល់ស្លឹកគ្រៃ (កណ្តាល)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:36:44');
INSERT INTO `products` VALUES ('664', 'ឆាមាន់គល់ស្លឹកគ្រៃ (ធំ)', '12', '2', '11.50', null, '7', null, '2017-03-09 14:37:04');
INSERT INTO `products` VALUES ('665', 'មីប្រហិតសាច់គោ', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('666', 'តៅហ៊ូចំហុយទឹកផ្សិត (តូច)', '8', '1', '8.50', null, '7', null, '2017-04-02 14:28:19');
INSERT INTO `products` VALUES ('667', 'តៅហ៊ូចំហុយទឹកផ្សិត (កណ្តាល)', '8', '1', '10.50', null, '7', null, '2017-04-02 14:28:12');
INSERT INTO `products` VALUES ('668', 'តៅហ៊ូចំហុយទឹកផ្សិត (ធំ)', '8', '1', '12.50', null, '7', null, '2017-04-02 14:28:32');
INSERT INTO `products` VALUES ('669', 'ឆាត្រកូនប្រេងខ្យង (តូច)', '23', '1', '5.00', null, '7', null, '2017-04-02 14:36:25');
INSERT INTO `products` VALUES ('670', 'ឆាត្រកូនប្រេងខ្យង (កណ្តាល)', '23', '1', '7.00', null, '7', null, '2017-04-02 14:36:08');
INSERT INTO `products` VALUES ('671', 'ឆាត្រកូនប្រេងខ្យង (ធំ)', '23', '1', '9.00', null, '7', null, '2017-04-02 14:36:33');
INSERT INTO `products` VALUES ('672', 'កង្កែបឆាក្តៅ (តូច)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:26:51');
INSERT INTO `products` VALUES ('673', 'កង្កែបឆាក្តៅ (កណ្តាល)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:26:40');
INSERT INTO `products` VALUES ('674', 'កង្កែបឆាក្តៅ (ធំ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:27:03');
INSERT INTO `products` VALUES ('675', 'មឹកឆាម្រេចខ្ចី (តូច)', '12', '2', '8.50', null, '7', null, '2017-03-09 14:59:55');
INSERT INTO `products` VALUES ('676', 'មឹកឆាម្រេចខ្ចី (គណ្តាល)', '12', '2', '10.50', null, '7', null, '2017-03-09 14:59:47');
INSERT INTO `products` VALUES ('677', 'មឹកឆាម្រេចខ្ចី (ធំ)', '12', '2', '13.00', null, '7', null, '2017-03-09 15:00:03');
INSERT INTO `products` VALUES ('678', 'លតឆាប្រហិតត្រីចៀន', '16', '1', '3.00', null, '7', null, '2017-03-10 13:58:44');
INSERT INTO `products` VALUES ('679', 'គាវគ្រឿងសមុទ្រ', '14', null, '3.00', null, null, null, null);
INSERT INTO `products` VALUES ('680', 'មីគាវប្រហិតត្រី', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('681', 'គុយទាវឆាដាក់បបរ', '3', '2', '0.85', null, '7', null, '2017-04-02 14:18:31');
INSERT INTO `products` VALUES ('682', 'ស៊ុបមាន់ខ្មៅ', '21', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('683', 'ណែមស្បែកជ្រូក (តូច)', '19', '2', '8.50', null, '7', null, '2017-03-09 15:18:19');
INSERT INTO `products` VALUES ('684', 'ផ្កាខាត់ណាឆាប្រេងខ្យង(ក)', '23', '1', '9.00', null, '7', null, '2017-04-02 14:42:12');
INSERT INTO `products` VALUES ('685', 'ផ្កាខាត់ណាឆាប្រេងខ្យង(ធ)', '23', '1', '11.00', null, '7', null, '2017-04-02 14:42:42');
INSERT INTO `products` VALUES ('686', 'មុំាឆៅពោះតាន់(ត)', '12', '2', '10.00', null, '7', null, '2017-03-09 15:00:24');
INSERT INTO `products` VALUES ('687', 'នំបញ្ចុកឆាសាច់គោ', '16', '2', '4.00', null, '7', null, '2017-03-10 13:56:45');
INSERT INTO `products` VALUES ('688', 'បបរឈាមជ្រូក', '3', '4', '3.00', null, '7', null, '2017-04-02 14:19:41');
INSERT INTO `products` VALUES ('689', 'ស៊ុបឈាម', '11', '4', '2.75', null, '7', null, '2017-03-09 15:05:22');
INSERT INTO `products` VALUES ('690', 'ព្រាបរ៉ូទី', '13', '1', '12.00', null, '7', null, '2017-04-02 14:55:39');
INSERT INTO `products` VALUES ('691', 'មាន់រ៉ូទី ​​(មួយក្បាល)', '13', '1', '16.00', null, '7', null, '2017-04-02 14:58:03');
INSERT INTO `products` VALUES ('692', 'មាន់រ៉ូទី  (មួយចំហៀង)', '13', '1', '8.00', null, '7', null, '2017-04-02 14:57:53');
INSERT INTO `products` VALUES ('693', 'ម្ជូរគ្រឿងសាច់ជ្រូក(ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('694', 'ម្ជូរគ្រឿងសាច់ជ្រូក(ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('695', 'ម្ជូរគ្រឿងសាច់ជ្រូក(ធ)', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('696', 'ញាំស្តៅត្រីឆ្អើរ(ត)', '19', '2', '9.00', null, '7', null, '2017-03-09 15:15:53');
INSERT INTO `products` VALUES ('697', 'ញាំស្តៅត្រីឆ្អើរ(ក)', '19', '2', '11.00', null, '7', null, '2017-03-09 15:15:47');
INSERT INTO `products` VALUES ('698', 'ញាំស្តៅត្រីឆ្អើរ(ធ)', '19', '2', '13.00', null, '7', null, '2017-03-09 15:16:00');
INSERT INTO `products` VALUES ('699', 'ម្ជូរស្លឹកអំពិល(ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('700', 'ម្ជូរស្លឹកអំពិល(ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('701', 'ម្ជូរស្លឹកអំពិល(ធ)', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('702', 'បបរព្រាប', '17', null, '12.00', null, null, null, null);
INSERT INTO `products` VALUES ('703', 'ខមុំាពោះតាន់(ត)', '12', '2', '10.00', null, '7', null, '2017-03-09 14:30:45');
INSERT INTO `products` VALUES ('704', 'ខមុំាពោះតាន់(ក)', '12', '2', '13.00', null, '7', null, '2017-03-09 14:30:34');
INSERT INTO `products` VALUES ('705', 'ខមុំាពោះតាន់(ធ)', '12', '2', '15.00', null, '7', null, '2017-03-09 14:31:06');
INSERT INTO `products` VALUES ('706', 'ណាំង៉ូវមាន់(ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('707', 'ណាំង៉ូវមាន់(ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('708', 'ណាំង៉ូវមាន់(ធ)', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('709', 'ពុយឡេងឆាខ្ទឹមស(ត)', '23', '1', '5.00', null, '7', null, '2017-04-02 14:43:03');
INSERT INTO `products` VALUES ('710', 'ពុយឡេងឆាខ្ទឹមស(ក)', '23', '1', '7.00', null, '7', null, '2017-04-02 14:42:53');
INSERT INTO `products` VALUES ('711', 'ពុយឡេងឆាខ្ទឹមស(ធ)', '23', '1', '9.00', null, '7', null, '2017-04-02 14:43:17');
INSERT INTO `products` VALUES ('712', 'ឆាបន្លែគ្រប់មុខប្រេងខ្យង(ត)', '23', '1', '5.00', null, '7', null, '2017-04-02 14:37:17');
INSERT INTO `products` VALUES ('713', 'ឆាបន្លែគ្រប់មុខប្រេងខ្យង(ក)', '23', '1', '7.00', null, '7', null, '2017-04-02 14:37:10');
INSERT INTO `products` VALUES ('714', 'ឆាបន្លែគ្រប់មុខប្រេងខ្យង(ធ)', '23', '1', '9.00', null, '7', null, '2017-04-02 14:37:29');
INSERT INTO `products` VALUES ('715', 'បាយក្តាំងពិសេស(ត)', '17', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('716', 'បាយក្តាំងពិសេស(ក)', '17', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('717', 'បាយក្តាំងពិសេស(ធ)', '17', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('718', 'ស្ងោរជ្រក់ក្បាលត្រី(ត)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('719', 'ស្ងោរជ្រក់ក្បាលត្រី(ក)', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('720', 'ស្ងោរជ្រក់ក្បាលត្រី(ធ)', '21', null, '13.00', null, null, null, null);
INSERT INTO `products` VALUES ('721', 'ស៊ុបបន្លែ(ត)', '21', null, '5.00', null, null, null, null);
INSERT INTO `products` VALUES ('722', 'ស៊ុបបន្លែ(ក)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('723', 'ស៊ុបបន្លែ(ធ)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('724', 'តុមយុំាំគ្រឿងសមុទ្រ(ត)', '8', '2', '9.00', null, '7', null, '2017-04-02 14:27:39');
INSERT INTO `products` VALUES ('725', 'តុមយុំាំគ្រឿងសមុទ្រ(ក)', '8', '2', '11.00', null, '7', null, '2017-04-02 14:27:32');
INSERT INTO `products` VALUES ('726', 'តុមយុំាំគ្រឿងសមុទ្រ(ធ)', '8', '2', '13.00', null, '7', null, '2017-04-02 14:27:47');
INSERT INTO `products` VALUES ('727', 'តុមយុំាំបង្គា(ត)', '8', '2', '9.00', null, '7', null, '2017-04-02 14:27:59');
INSERT INTO `products` VALUES ('728', 'ចង្ហាន់ទី១', '17', null, '19.90', null, null, null, null);
INSERT INTO `products` VALUES ('729', 'ធូកទៀន', '17', null, '1.00', null, null, null, null);
INSERT INTO `products` VALUES ('730', 'ផ្កាឈូក១ដុំ', '17', null, '1.00', null, null, null, null);
INSERT INTO `products` VALUES ('731', 'ចង្ហាន់ទី2', '17', null, '19.90', null, null, null, null);
INSERT INTO `products` VALUES ('732', 'ចង្ហាន់ទី3', '17', null, '19.90', null, null, null, null);
INSERT INTO `products` VALUES ('733', 'ចង្ហាន់ទី4', '17', null, '19.90', null, null, null, null);
INSERT INTO `products` VALUES ('734', 'ចង្ហាន់ទី1 (ទាំងស្រាក)', '17', null, '29.90', null, null, null, null);
INSERT INTO `products` VALUES ('735', 'ចង្ហាន់ទី2 (ទាំងស្រាក)', '17', null, '29.90', null, null, null, null);
INSERT INTO `products` VALUES ('736', 'ចង្ហាន់ទី3 (ទាំងស្រាក)', '17', null, '29.90', null, null, null, null);
INSERT INTO `products` VALUES ('737', 'ចង្ហាន់ទី4 (ទាំងស្រាក)', '17', null, '29.90', null, null, null, null);
INSERT INTO `products` VALUES ('738', 'ភេសជ្ជះប្រគេនព្រះសង្ឃ', '17', null, '7.50', null, null, null, null);
INSERT INTO `products` VALUES ('739', 'បបរសត្រីងៀត', '3', '2', '3.50', null, '7', null, '2017-04-02 14:20:45');
INSERT INTO `products` VALUES ('740', 'ញាំសាច់គោត្រកួនស្រួយ(ត)', '19', '2', '9.00', null, '7', null, '2017-03-09 15:15:32');
INSERT INTO `products` VALUES ('741', 'ញាំសាច់គោត្រកួនស្រួយ(ក)', '19', '2', '11.00', null, '7', null, '2017-03-09 15:15:25');
INSERT INTO `products` VALUES ('742', 'ញាំសាច់គោត្រកួនស្រួយ(ធ)', '19', '2', '13.00', null, '7', null, '2017-03-09 15:15:40');
INSERT INTO `products` VALUES ('743', 'មាន់ដុតត្រួយូងចេក(​មួយក្បាល)', '13', '2', '16.00', null, '7', null, '2017-04-02 14:57:18');
INSERT INTO `products` VALUES ('744', 'សាច់គោរុំផ្សិតម្ជុលបន្ទះដែក(ត)', '13', '1', '14.00', null, '7', null, '2017-04-02 14:59:56');
INSERT INTO `products` VALUES ('745', 'សាច់គោរុំផ្សិតម្ជុលបន្ទះដែក(ក)', '13', '1', '16.00', null, '7', null, '2017-04-02 14:59:48');
INSERT INTO `products` VALUES ('746', 'សាច់គោរុំផ្សិតម្ជុលបន្ទះដែក(ធ)', '13', '1', '18.00', null, '7', null, '2017-04-02 15:00:03');
INSERT INTO `products` VALUES ('747', 'សាច់គោសរសៃកែងខឆ្មាំងដី', '13', '1', '14.00', null, '7', null, '2017-04-02 15:00:13');
INSERT INTO `products` VALUES ('748', 'ទឹកដោះគោឆៅ  (មួយកំប៉ុង)', '15', '6', '1.00', null, '7', null, '2017-03-09 13:34:37');
INSERT INTO `products` VALUES ('749', 'នំបញ្ចុកផាក់ឡូវ', '16', '2', '4.00', null, '7', null, '2017-03-10 13:56:56');
INSERT INTO `products` VALUES ('750', 'បបរត្នោត', '5', '5', '1.50', null, '7', null, '2017-03-10 14:11:41');
INSERT INTO `products` VALUES ('751', 'អូមីឡែត', '6', '3', '2.50', null, '7', null, '2017-03-09 13:24:17');
INSERT INTO `products` VALUES ('752', 'មីសួរប្រហិតសាច់ជ្រូូក', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('753', 'មីសួរប្រហិតសាច់គោ', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('754', 'មីសួរសាច់ជ្រូូក', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('755', 'មីសួរសាច់គោ', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('756', 'មីគាវប្រហិតសាច់គោ', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('757', 'លតធម្មតា (ទឹកស៊ុប)', '16', '4', '3.50', null, '7', null, '2017-03-10 14:03:58');
INSERT INTO `products` VALUES ('758', 'លតសាច់គោ (ទឹកស៊ុប)', '16', '4', '3.50', null, '7', null, '2017-03-10 14:05:00');
INSERT INTO `products` VALUES ('759', 'លតសាច់ជ្រូូក (ទឹកស៊ុប)', '16', '4', '3.50', null, '7', null, '2017-03-10 14:04:19');
INSERT INTO `products` VALUES ('760', 'លតប្រហិតសាច់ជ្រូូក (ទឹកស៊ុប)', '16', '4', '3.50', null, '7', null, '2017-03-10 14:04:48');
INSERT INTO `products` VALUES ('761', 'លតប្រហិតសាច់គោ (ទឹកស៊ុប)', '16', '4', '4.00', null, '7', null, '2017-03-10 14:04:40');
INSERT INTO `products` VALUES ('762', 'លតប្រហិតសាច់ត្រី (ទឹកស៊ុប)', '16', '4', '3.50', null, '7', null, '2017-03-10 14:04:54');
INSERT INTO `products` VALUES ('763', 'សួដាពងមាន់', '15', '6', '2.00', null, '7', null, '2017-03-09 13:35:13');
INSERT INTO `products` VALUES ('764', 'តៅហ៊ូខឆ្នាំងដីគ្រឿងសមុទ្រ(ត)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('765', 'តៅហ៊ូខឆ្នាំងដីគ្រឿងសមុទ្រ(ក)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('766', 'តៅហ៊ូខឆ្នាំងដីគ្រឿងសមុទ្រ(ធ)', '17', null, '12.00', null, null, null, null);
INSERT INTO `products` VALUES ('767', 'ឆាត្រកួនខ្ទឹមស(ត)', '23', '1', '5.00', null, '7', null, '2017-04-02 14:36:53');
INSERT INTO `products` VALUES ('768', 'ឆាត្រកួនខ្ទឹមស(ក)', '23', '1', '7.00', null, '7', null, '2017-04-02 14:36:44');
INSERT INTO `products` VALUES ('769', 'ឆាត្រកួនខ្ទឹមស(ធ)', '23', '1', '9.00', null, '7', null, '2017-04-02 14:37:01');
INSERT INTO `products` VALUES ('770', 'ខមាំុត្រីបឹងឡាវ(ត)', '21', null, '12.00', null, null, null, null);
INSERT INTO `products` VALUES ('771', 'ខមាំុត្រីបឹងឡាវ(ក)', '21', null, '15.00', null, null, null, null);
INSERT INTO `products` VALUES ('772', 'ខមាំុត្រីបឹងឡាវ(ធ)', '21', null, '18.00', null, null, null, null);
INSERT INTO `products` VALUES ('773', 'ទឹកគ្រឿងបាត់ដំបង(ធំ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:54:36');
INSERT INTO `products` VALUES ('774', 'ស្ពៃចិនឆាខ្ទឹមស(ត)', '23', '1', '5.00', null, '7', null, '2017-04-02 14:46:10');
INSERT INTO `products` VALUES ('775', 'ស្ពៃចិនឆាខ្ទឹមស(ក)', '23', '1', '7.00', null, '7', null, '2017-04-02 14:45:59');
INSERT INTO `products` VALUES ('776', 'ស្ពៃចិនឆាខ្ទឹមស(ធំ)', '23', '1', '9.00', null, '7', null, '2017-04-02 14:46:18');
INSERT INTO `products` VALUES ('777', 'ស្ពៃចិនឆាប្រេងខ្យង(ត)', '23', '1', '5.00', null, '7', null, '2017-04-02 14:46:36');
INSERT INTO `products` VALUES ('778', 'ស្ពៃចិនឆាប្រេងខ្យង(ក)', '23', '1', '7.00', null, '7', null, '2017-04-02 14:46:26');
INSERT INTO `products` VALUES ('779', 'ស្ពៃចិនឆាប្រេងខ្យង(ធំ)', '23', '1', '9.00', null, '7', null, '2017-04-02 14:46:47');
INSERT INTO `products` VALUES ('780', 'ស្ពៃចិនស្រុះទឹកស៊ុប(ត)', '23', '1', '5.00', null, '7', null, '2017-04-02 14:47:07');
INSERT INTO `products` VALUES ('781', 'ស្ពៃចិនស្រុះទឹកស៊ុប(ក)', '23', '1', '7.00', null, '7', null, '2017-04-02 14:46:56');
INSERT INTO `products` VALUES ('782', 'ស្ពៃចិនស្រុះទឹកស៊ុប(ធំ)', '23', '1', '9.00', null, '7', null, '2017-04-02 14:47:16');
INSERT INTO `products` VALUES ('783', 'ស្ពៃតឿឆាខ្ទឹមស(ត)', '23', '1', '5.00', null, '7', null, '2017-04-02 14:47:41');
INSERT INTO `products` VALUES ('784', 'ស្ពៃតឿឆាខ្ទឹមស(ក)', '23', '1', '7.00', null, '7', null, '2017-04-02 14:47:30');
INSERT INTO `products` VALUES ('785', 'ស្ពៃតឿឆាខ្ទឹមស(ធំ)', '23', '1', '9.00', null, '7', null, '2017-04-02 14:47:51');
INSERT INTO `products` VALUES ('786', 'ស្ពៃតឿឆាប្រេងខ្យង(ត)', '23', '1', '5.00', null, '7', null, '2017-04-02 14:48:11');
INSERT INTO `products` VALUES ('787', 'ស្ពៃតឿឆាប្រេងខ្យង(ក)', '23', '1', '7.00', null, '7', null, '2017-04-02 14:48:01');
INSERT INTO `products` VALUES ('788', 'ស្ពៃតឿឆាប្រេងខ្យង(ធំ)', '23', '1', '9.00', null, '7', null, '2017-04-02 14:48:19');
INSERT INTO `products` VALUES ('789', 'ស្ពៃតឿស្រុះទឹកស៊ុប(ត)', '23', '1', '5.00', null, '7', null, '2017-04-02 14:48:36');
INSERT INTO `products` VALUES ('790', 'ស្ពៃតឿស្រុះទឹកស៊ុប(ក)', '23', '1', '7.00', null, '7', null, '2017-04-02 14:48:27');
INSERT INTO `products` VALUES ('791', 'ស្ពៃតឿស្រុះទឹកស៊ុប(ធំ)', '23', '1', '9.00', null, '7', null, '2017-04-02 14:48:44');
INSERT INTO `products` VALUES ('792', 'ផ្កាខាត់ណាឆាខ្ទឹមស(ត)', '23', '1', '5.00', null, '7', null, '2017-04-02 14:40:49');
INSERT INTO `products` VALUES ('793', 'ផ្កាខាត់ណាឆាខ្ទឹមស(ក)', '23', '1', '7.00', null, '7', null, '2017-04-02 14:40:37');
INSERT INTO `products` VALUES ('794', 'ផ្កាខាត់ណាឆាប្រេងខ្យង(ត)', '23', '1', '5.00', null, '7', null, '2017-04-02 14:42:23');
INSERT INTO `products` VALUES ('795', 'ផ្កាខាត់ណាឆាប្រេងខ្យង(ក)', '23', '1', '7.00', null, '7', null, '2017-04-02 14:42:03');
INSERT INTO `products` VALUES ('796', 'ផ្កាខាត់ណាឆាប្រេងខ្យង(ធ)', '23', '1', '9.00', null, '7', null, '2017-04-02 14:42:31');
INSERT INTO `products` VALUES ('797', 'ផ្កាខាត់ណាឆានឹងផ្សិតប៉ាវហ៊ឹ(ត)', '23', '1', '5.00', null, '7', null, '2017-04-02 14:41:13');
INSERT INTO `products` VALUES ('798', 'ផ្កាខាត់ណាឆានឹងផ្សិតប៉ាវហ៊ឹ(ក)', '23', '1', '7.00', null, '7', null, '2017-04-02 14:40:59');
INSERT INTO `products` VALUES ('799', 'ផ្កាខាត់ណាឆានឹងផ្សិតប៉ាវហ៊ឹ(ធ)', '23', '1', '9.00', null, '7', null, '2017-04-02 14:41:29');
INSERT INTO `products` VALUES ('800', 'ប៉ឆាយឆាខ្ទឹមស(ត)', '23', '1', '5.00', null, '7', null, '2017-04-02 14:40:18');
INSERT INTO `products` VALUES ('801', 'ប៉ឆាយឆាខ្ទឹមស(ក)', '23', '1', '7.00', null, '7', null, '2017-04-02 14:40:08');
INSERT INTO `products` VALUES ('802', 'ប៉ឆាយឆាខ្ទឹមស(ធ)', '23', '1', '9.00', null, '7', null, '2017-04-02 14:40:27');
INSERT INTO `products` VALUES ('803', 'សាឡាត់សងឆាខ្ទឹមស(ត)', '23', '1', '5.00', null, '7', null, '2017-04-02 14:44:55');
INSERT INTO `products` VALUES ('804', 'សាឡាត់សងឆាខ្ទឹមស(ក)', '23', '1', '7.00', null, '7', null, '2017-04-02 14:44:45');
INSERT INTO `products` VALUES ('805', 'សាឡាត់សងឆាខ្ទឹមស(ធ)', '23', '1', '9.00', null, '7', null, '2017-04-02 14:45:04');
INSERT INTO `products` VALUES ('806', 'សាឡាត់សងស្រុះទឹកស៊ុប(ត)', '23', '1', '5.00', null, '7', null, '2017-04-02 14:45:35');
INSERT INTO `products` VALUES ('807', 'សាឡាត់សងស្រុះទឹកស៊ុប(ក)', '23', '1', '7.00', null, '7', null, '2017-04-02 14:45:24');
INSERT INTO `products` VALUES ('808', 'សាឡាត់សងស្រុះទឹកស៊ុប(ធ)', '23', '1', '9.00', null, '7', null, '2017-04-02 14:45:49');
INSERT INTO `products` VALUES ('809', 'ត្រប់ចៀនខ្ចប់សាច់(ត)', '12', '2', '5.00', null, '7', null, '2017-03-09 14:39:59');
INSERT INTO `products` VALUES ('810', 'ត្រប់ចៀនខ្ចប់សាច់(ក)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:39:48');
INSERT INTO `products` VALUES ('811', 'ត្រប់ចៀនខ្ចប់សាច់(ធ)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:40:16');
INSERT INTO `products` VALUES ('812', 'ស៊ុបផ្លោះរបង', '8', '1', '6.00', null, '7', null, '2017-04-02 14:34:14');
INSERT INTO `products` VALUES ('813', 'ស៊ុបក្រពះត្រីសាច់ក្តាម', '8', '1', '6.00', null, '7', null, '2017-04-02 14:33:53');
INSERT INTO `products` VALUES ('814', 'ស៊ុបពោតសាច់ក្តាម', '8', '1', '6.00', null, '7', null, '2017-04-02 14:34:23');
INSERT INTO `products` VALUES ('815', 'ស៊ុបកន្ទាយ​​​ (មួយក្រឡ)', '8', '1', '14.00', null, '7', null, '2017-04-02 14:33:44');
INSERT INTO `products` VALUES ('816', 'ស៊ុបឆ្លាមដង្កៀបក្តាម', '8', '1', '55.00', null, '7', null, '2017-04-02 14:34:01');
INSERT INTO `products` VALUES ('817', 'ស៊ុបព្រុយត្រីឆ្លាមសាច់ក្តាម', '8', '1', '55.00', null, '7', null, '2017-04-02 14:34:58');
INSERT INTO `products` VALUES ('818', 'ស៊ុបព្រុយត្រីឆ្លាមពិសេស', '8', '1', '55.00', null, '7', null, '2017-04-02 14:34:48');
INSERT INTO `products` VALUES ('819', 'ស៊ុបព្រុយត្រីឆ្លាមបែបថៃ', '8', '1', '55.00', null, '7', null, '2017-04-02 14:34:32');
INSERT INTO `products` VALUES ('820', 'ប៉ាវហ៊ឹបន្ទះផ្កាខាត់ណាខៀវ', '8', '1', '25.00', null, '7', null, '2017-04-02 14:33:24');
INSERT INTO `products` VALUES ('821', 'ប៉ាវហ៊ឹ8គ្រាប់ក្នុងចានតែ1', '8', '1', '25.00', null, '7', null, '2017-04-02 14:33:16');
INSERT INTO `products` VALUES ('822', 'ទាប៉េកាំង​​  (មួយចំហៀង)', '13', '1', '15.00', null, '7', null, '2017-04-02 14:55:32');
INSERT INTO `products` VALUES ('823', 'ទាប៉េកាំង  (មួយក្បាល)', '13', '1', '30.00', null, '7', null, '2017-04-02 14:55:25');
INSERT INTO `products` VALUES ('824', 'ទាធម្មតា', '13', '1', '26.00', null, '7', null, '2017-04-02 14:55:06');
INSERT INTO `products` VALUES ('825', 'ទាធម្មតា(ត)', '13', '1', '13.00', null, '7', null, '2017-04-02 14:55:16');
INSERT INTO `products` VALUES ('826', 'សាច់គោងៀត(ត)', '13', '2', '7.00', null, '7', null, '2017-04-02 14:59:01');
INSERT INTO `products` VALUES ('827', 'សាច់គោងៀត(ក)', '13', '2', '9.00', null, '7', null, '2017-04-02 14:58:53');
INSERT INTO `products` VALUES ('828', 'សាច់គោងៀត(ធ)', '13', '2', '11.00', null, '7', null, '2017-04-02 14:59:09');
INSERT INTO `products` VALUES ('829', 'ឆ្អឹងជំនីគោបន្ទះដែក(ធំ)', '13', '1', '18.00', null, '7', null, '2017-04-02 14:50:16');
INSERT INTO `products` VALUES ('830', 'បាយភ្លៅមាន់ចៀន(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('831', 'បាយភ្លៅមាន់ចៀន(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('832', 'បាយភ្លៅមាន់ចៀន(ធ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('833', 'ប្រហិតត្រីចៀន(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:55:26');
INSERT INTO `products` VALUES ('834', 'ប្រហិតត្រីចៀន(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:55:17');
INSERT INTO `products` VALUES ('835', 'ប្រហិតត្រីចៀន(ធ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:55:40');
INSERT INTO `products` VALUES ('836', 'ឡុកឡាក់អង់គ្លេស(ត)', '13', '1', '8.00', null, '7', null, '2017-04-02 15:08:47');
INSERT INTO `products` VALUES ('837', 'ឡុកឡាក់អង់គ្លេស(ក)', '13', '1', '10.00', null, '7', null, '2017-04-02 15:08:17');
INSERT INTO `products` VALUES ('838', 'ឡុកឡាក់អង់គ្លេស(ធ)', '13', '1', '12.00', null, '7', null, '2017-04-02 15:08:56');
INSERT INTO `products` VALUES ('839', 'ត្រីស្ពុងចំហុយស៊ីអ៊ីវ', '8', '1', '0.00', null, '7', null, '2017-04-02 14:32:53');
INSERT INTO `products` VALUES ('840', 'អយស្ទ័រ', '13', '1', '0.80', null, '7', null, '2017-04-02 15:09:34');
INSERT INTO `products` VALUES ('841', 'ដើមខាត់ណាឆាប្រេងខ្យង(ត)', '23', '1', '5.00', null, '7', null, '2017-04-02 14:38:25');
INSERT INTO `products` VALUES ('842', 'ណែមស្បែកជ្រូក(ធ)', '13', '2', '12.00', null, '7', null, '2017-04-02 14:53:13');
INSERT INTO `products` VALUES ('843', 'ណែមស្បែកជ្រូក(ក)', '13', '2', '10.00', null, '7', null, '2017-04-02 14:52:53');
INSERT INTO `products` VALUES ('844', 'ណែមស្បែកជ្រូក(ត)', '13', '2', '8.00', null, '7', null, '2017-04-02 14:53:02');
INSERT INTO `products` VALUES ('845', 'ដើមខាត់ណាឆាប្រេងខ្យង(ក)', '23', '1', '7.00', null, '7', null, '2017-04-02 14:38:16');
INSERT INTO `products` VALUES ('846', 'បាញ់ស៊ុង​ ជើងជ្រូក', '2', '2', '4.00', null, '7', null, '2017-04-02 14:23:18');
INSERT INTO `products` VALUES ('847', 'មីកន្តាំង', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('848', 'បាញ់ឆែវ​ ស្នូលបង្គា រឺ សាច់ជ្រូក', '2', '2', '3.00', null, '7', null, '2017-04-02 14:22:34');
INSERT INTO `products` VALUES ('849', 'នំគ្រក់', '2', '2', '2.50', null, '7', null, '2017-04-02 14:22:22');
INSERT INTO `products` VALUES ('850', 'ដើមខាត់ណាឆាប្រេងខ្យង(ធំ)', '23', '1', '9.00', null, '7', null, '2017-04-02 14:38:37');
INSERT INTO `products` VALUES ('851', 'ស្លាបមាន់រ៉ូទី(ត)', '13', '1', '7.00', null, '7', null, '2017-04-02 15:07:38');
INSERT INTO `products` VALUES ('852', 'ស្លាបមាន់រ៉ូទី(ក)', '13', '1', '9.00', null, '7', null, '2017-04-02 15:07:28');
INSERT INTO `products` VALUES ('853', 'មីឆាសាច់មាន់(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('854', 'មីឆាសាច់មាន់(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('855', 'មីឆាសាច់មាន់(ធ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('856', 'បង្គាខ្ចប់ដំឡូងបារាំង', '20', '1', '0.00', null, '7', null, '2017-04-02 14:11:37');
INSERT INTO `products` VALUES ('857', 'ដើមខាតណាឆាសាច់គោ(ត)', '23', '1', '7.00', null, '7', null, '2017-04-02 14:37:55');
INSERT INTO `products` VALUES ('858', 'ដើមខាតណាឆាសាច់គោ(ក)', '23', '1', '9.00', null, '7', null, '2017-04-02 14:37:43');
INSERT INTO `products` VALUES ('859', 'ដើមខាតណាឆាសាច់គោ(ធ)', '23', '1', '11.00', null, '7', null, '2017-04-02 14:38:03');
INSERT INTO `products` VALUES ('860', 'ត្រីក្រហមចំហុយស៊ីអ៊ីវ', '8', '1', '0.00', null, '7', null, '2017-04-02 14:28:57');
INSERT INTO `products` VALUES ('861', 'មាន់អាំងអំបិលម្ទេស(មួយចំហៀង)', '13', '2', '8.00', null, '7', null, '2017-04-02 14:58:44');
INSERT INTO `products` VALUES ('862', 'ស្លាបមាន់រ៉ូទី(ធំ)', '13', '1', '11.00', null, '7', null, '2017-04-02 15:07:58');
INSERT INTO `products` VALUES ('863', 'មាន់អាំងអំបិលម្ទេស(មួយក្បាល)', '13', '2', '16.00', null, '7', null, '2017-04-02 14:58:37');
INSERT INTO `products` VALUES ('864', 'បង្កងអប់អំបិល', '20', '2', '0.00', null, '7', null, '2017-04-02 14:10:56');
INSERT INTO `products` VALUES ('865', 'ស៊ុបសាច់ក្តាម', '21', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('866', 'បាយឆាខ្ញីសាច់មាន់(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('867', 'បាយឆាខ្ញីសាច់មាន់(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('868', 'បាយឆាខ្ញីសាច់មាន់(ធំ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('869', 'កង្កែបឆាខ្ញី(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:27:26');
INSERT INTO `products` VALUES ('870', 'ខ្យងប៉ារ៉ាឆាកែង', '20', '2', '0.00', null, '7', null, '2017-04-02 14:08:29');
INSERT INTO `products` VALUES ('871', 'បង្កងបាក់បំពងខ្ទឹមស', '20', '1', '0.00', null, '7', null, '2017-04-02 14:10:25');
INSERT INTO `products` VALUES ('872', 'មាន់លីងគល់ស្លឹកគ្រៃ(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:59:05');
INSERT INTO `products` VALUES ('873', 'មាន់លីងគល់ស្លឹកគ្រៃ(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:58:53');
INSERT INTO `products` VALUES ('874', 'មាន់លីងគល់ស្លឹកគ្រៃ(ធ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:59:15');
INSERT INTO `products` VALUES ('875', 'បង្គាកោះកុង', '20', '2', '0.00', null, '7', null, '2017-04-02 14:11:25');
INSERT INTO `products` VALUES ('876', 'កង្កែបឆាខ្ញី(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:27:15');
INSERT INTO `products` VALUES ('877', 'នីស្វ័រសាឡាត(ត)', '23', '2', '12.00', null, '7', null, '2017-04-02 14:39:14');
INSERT INTO `products` VALUES ('878', 'នីស្វ័រសាឡាត(ក)', '23', '2', '14.00', null, '7', null, '2017-04-02 14:38:56');
INSERT INTO `products` VALUES ('879', 'នីស្វ័រសាឡាត(ធ)', '23', '2', '16.00', null, '7', null, '2017-04-02 14:39:25');
INSERT INTO `products` VALUES ('880', 'ស៊ុបយ៉ាវហន(ត)', '21', null, '13.00', null, null, null, null);
INSERT INTO `products` VALUES ('881', 'ស៊ុបយ៉ាវហន(ក)', '21', null, '15.00', null, null, null, null);
INSERT INTO `products` VALUES ('882', 'កង្កែបឆាខ្ញី(ធំ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:27:37');
INSERT INTO `products` VALUES ('883', 'ស៊ុបយ៉ាវហន(ធ)', '21', null, '17.00', null, null, null, null);
INSERT INTO `products` VALUES ('884', 'មឹកឆាម្រេចខ្ចី(ត)', '20', '1', '8.00', null, '7', null, '2017-04-02 14:14:36');
INSERT INTO `products` VALUES ('885', 'មឹកឆាម្រេចខ្ចី(ក)', '20', '1', '10.00', null, '7', null, '2017-04-02 14:14:13');
INSERT INTO `products` VALUES ('886', 'មឹកឆាម្រេចខ្ចី(ធំ)', '20', '1', '12.00', null, '7', null, '2017-04-02 14:14:45');
INSERT INTO `products` VALUES ('887', 'Tuna  Salad  (S)', '23', '2', '8.00', null, '7', null, '2017-04-02 14:35:33');
INSERT INTO `products` VALUES ('888', 'Tuna  Salad  (M)', '23', '2', '10.00', null, '7', null, '2017-04-02 14:35:25');
INSERT INTO `products` VALUES ('889', 'Tuna  Salad  (L)', '23', '2', '12.00', null, '7', null, '2017-04-02 14:35:14');
INSERT INTO `products` VALUES ('890', 'ពងទាចំហុយបីរសជាតិ(ត)', '12', '2', '5.00', null, '7', null, '2017-03-09 14:57:38');
INSERT INTO `products` VALUES ('891', 'ពងទាចំហុយបីរសជាតិ(ក)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:57:28');
INSERT INTO `products` VALUES ('892', 'ពងទាចំហុយបីរសជាតិ(ធំ)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:57:47');
INSERT INTO `products` VALUES ('893', 'ស៊ុបពោតសាច់ក្តាម', '21', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('894', 'Fresh Beer Black', '4', '6', '2.40', null, '7', null, '2017-03-09 13:38:22');
INSERT INTO `products` VALUES ('895', 'Fresh Beer Gold', '4', '6', '1.90', null, '7', null, '2017-03-09 13:38:28');
INSERT INTO `products` VALUES ('896', 'Fresh Beer Gold Free', '4', '6', '0.00', null, '7', null, '2017-03-09 13:38:32');
INSERT INTO `products` VALUES ('897', 'ចៃយ៉(ធ)', '17', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('898', 'ខាត់ណាឆាសាច់ជ្រូក(ត)', '23', '1', '7.00', null, '7', null, '2017-04-02 14:35:51');
INSERT INTO `products` VALUES ('899', 'ខាត់ណាឆាសាច់ជ្រូក(ក)', '23', '1', '9.00', null, '7', null, '2017-04-02 14:35:43');
INSERT INTO `products` VALUES ('900', 'ខាត់ណាឆាសាច់ជ្រូក(ធ)', '23', '1', '11.00', null, '7', null, '2017-04-02 14:35:58');
INSERT INTO `products` VALUES ('901', 'ត្រីងៀត(ត)', '13', '2', '7.00', null, '7', null, '2017-04-02 14:53:44');
INSERT INTO `products` VALUES ('902', 'ត្រីងៀត(ក)', '13', '2', '9.00', null, '7', null, '2017-04-02 14:53:26');
INSERT INTO `products` VALUES ('903', 'ត្រីងៀត(ធ)', '13', '2', '11.00', null, '7', null, '2017-04-02 14:53:53');
INSERT INTO `products` VALUES ('904', 'ឆាទំពាំងសាច់គោ(ធ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:36:33');
INSERT INTO `products` VALUES ('905', 'ឆាទំពាំងសាច់គោ(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:36:10');
INSERT INTO `products` VALUES ('906', 'ឆាទំពាំងសាច់គោ(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:36:21');
INSERT INTO `products` VALUES ('907', 'កង្កែបឆាគ្រឿង(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:27:56');
INSERT INTO `products` VALUES ('908', 'កង្កែបឆាគ្រឿង(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:27:48');
INSERT INTO `products` VALUES ('909', 'កង្កែបឆាគ្រឿង(ធ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:28:04');
INSERT INTO `products` VALUES ('910', 'កង្កែបរ៉ូទី(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:28:24');
INSERT INTO `products` VALUES ('911', 'កង្កែបរ៉ូទី(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:28:15');
INSERT INTO `products` VALUES ('912', 'កង្កែបរ៉ូទី(ធ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:28:34');
INSERT INTO `products` VALUES ('913', 'ម្ជូរយួនសាច់មាន់(ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('914', 'ម្ជូរយួនសាច់មាន់(ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('915', 'ម្ជូរយួនសាច់មាន់(ធ)', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('916', 'បង្កងឆាស៊ីអ៊ីវ', '20', '1', '0.00', null, '7', null, '2017-04-02 14:09:47');
INSERT INTO `products` VALUES ('917', 'មាន់លីងប្រៃផ្អែម(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:59:31');
INSERT INTO `products` VALUES ('918', 'មាន់លីងប្រៃផ្អែម(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:59:23');
INSERT INTO `products` VALUES ('919', 'មាន់លីងប្រៃផ្អែម(ធ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:59:39');
INSERT INTO `products` VALUES ('920', 'ញាំត្រយូងចេកគ្រឿងសមូទ្រ(ធ)', '19', '2', '12.00', null, '7', null, '2017-03-09 15:07:55');
INSERT INTO `products` VALUES ('921', 'ញាំត្រយូងចេកគ្រឿងសមូទ្រ(ក)', '19', '2', '10.00', null, '7', null, '2017-03-09 15:07:38');
INSERT INTO `products` VALUES ('922', 'ញាំត្រយូងចេកគ្រឿងសមូទ្រ(ត)', '19', '2', '8.00', null, '7', null, '2017-03-09 15:07:49');
INSERT INTO `products` VALUES ('923', 'សាច់គោអូស្រ្តាលី(ធ)', '13', '1', '18.00', null, '7', null, '2017-04-02 15:01:53');
INSERT INTO `products` VALUES ('924', 'សាច់គោអូស្រ្តាលី(ក)', '13', '1', '16.00', null, '7', null, '2017-04-02 15:01:36');
INSERT INTO `products` VALUES ('925', 'សាច់គោអូស្រ្តាលី(ត)', '13', '1', '14.00', null, '7', null, '2017-04-02 15:01:46');
INSERT INTO `products` VALUES ('926', 'ឆាកែងកង្កែប(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:33:12');
INSERT INTO `products` VALUES ('927', 'ឆាកែងកង្កែប(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:32:30');
INSERT INTO `products` VALUES ('928', 'ឆាកែងកង្កែប(ធ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:33:21');
INSERT INTO `products` VALUES ('929', 'ឆាក្តៅសាច់មាន់(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:34:12');
INSERT INTO `products` VALUES ('930', 'ឆាក្តៅសាច់មាន់(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:34:02');
INSERT INTO `products` VALUES ('931', 'ឆាក្តៅសាច់មាន់(ធ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:34:22');
INSERT INTO `products` VALUES ('932', 'ឆាសាច់មាន់(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:38:27');
INSERT INTO `products` VALUES ('933', 'ឆាសាច់មាន់(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:38:13');
INSERT INTO `products` VALUES ('934', 'ឆាសាច់មាន់(ធ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:38:40');
INSERT INTO `products` VALUES ('935', 'ត្រីកេះចៀន(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:41:06');
INSERT INTO `products` VALUES ('936', 'ត្រីក្រហម​​ក្នុងមួយគីឡុ 10ដុល្លារ', '8', '1', '0.00', null, '7', null, '2017-04-02 14:29:29');
INSERT INTO `products` VALUES ('937', 'ក្តាមថ្ម', '20', '1', '25.00', null, '7', null, '2017-04-02 14:05:31');
INSERT INTO `products` VALUES ('938', 'ប៊ាវហ៊ឺបន្ទះផ្កាខាត់ណាខៀវ', '21', null, '25.00', null, null, null, null);
INSERT INTO `products` VALUES ('939', 'ត្រីកេះចៀន(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:40:55');
INSERT INTO `products` VALUES ('940', 'ត្រីកេះចៀន(ធ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:41:16');
INSERT INTO `products` VALUES ('941', 'ឆាកែងសាច់គោ(ធ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:33:52');
INSERT INTO `products` VALUES ('942', 'ឆាកែងសាច់គោ(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:33:31');
INSERT INTO `products` VALUES ('943', 'ឆាកែងសាច់គោ(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:33:42');
INSERT INTO `products` VALUES ('944', 'ប៊ាវហ៊ឺស្រូបទឹកប៉ាហ៊ឺ', '21', null, '25.00', null, null, null, null);
INSERT INTO `products` VALUES ('945', 'ប៊ាវហ៊ឺ​​ ៨​​គ្រប់ក្នុងចានតែ១', '21', null, '25.00', null, null, null, null);
INSERT INTO `products` VALUES ('946', 'Vina Mapo', '25', null, '20.00', null, null, null, null);
INSERT INTO `products` VALUES ('947', 'Blue Moqarieta', '25', '6', '3.50', null, '7', null, '2017-03-09 13:37:29');
INSERT INTO `products` VALUES ('948', 'Jin Ro', '25', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('949', 'បង្កងទឹកសាបក្នុងមួយគីឡូ60ដុល្លារ', '20', '1', '0.00', null, '7', null, '2017-04-02 14:10:11');
INSERT INTO `products` VALUES ('950', 'ខ្យងប៉ារ៉ាក្នុងមួយគីឡូ26ដុល្លារ', '20', '1', '0.00', null, '7', null, '2017-04-02 14:07:03');
INSERT INTO `products` VALUES ('951', 'ខ្យងសែលក្នុងមួយគីឡូ30ដុល្លារ', '20', '1', '0.00', null, '7', null, '2017-04-02 14:09:14');
INSERT INTO `products` VALUES ('952', 'មឹកក្នុងមួយគីឡូ15ដុល្លារ', '20', '1', '0.00', null, '7', null, '2017-04-02 14:14:02');
INSERT INTO `products` VALUES ('953', 'ក្តាមថ្មពងលេខមួយក្នុងមួយគីឡូ30ដុល្លារ', '20', '1', '0.00', null, '7', null, '2017-04-02 14:05:47');
INSERT INTO `products` VALUES ('954', 'ក្តាមសកក្នុងមួយគីឡូ23ដុល្លារ', '20', '1', '0.00', null, '7', null, '2017-04-02 14:06:21');
INSERT INTO `products` VALUES ('955', 'ត្រីក្រហមក្នុងមួយគីឡូ10ដុល្លារ', '8', '1', '0.00', null, '7', null, '2017-04-02 14:28:47');
INSERT INTO `products` VALUES ('956', 'ងាវលេខមួយក្នុងមួយគីឡូ10ដុល្លារ', '20', '2', '0.00', null, '7', null, '2017-04-02 14:09:31');
INSERT INTO `products` VALUES ('957', 'លតឆាសាច់គោ(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('958', 'លតឆាសាច់គោ(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('959', 'លតឆាសាច់គោ(ធំ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('960', 'ខ្យងប៉ារ៉ាស្រុះ', '20', '1', '0.00', null, '7', null, '2017-04-02 14:08:40');
INSERT INTO `products` VALUES ('961', 'ត្រប់ត្រីប្រម៉ាសាច់ជ្រូក(ត)', '12', '2', '5.00', null, '7', null, '2017-03-09 14:40:37');
INSERT INTO `products` VALUES ('962', 'ត្រប់ត្រីប្រម៉ាសាច់ជ្រូក(ក)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:40:27');
INSERT INTO `products` VALUES ('963', 'ត្រប់ត្រីប្រម៉ាសាច់ជ្រូក(ធំ)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:40:45');
INSERT INTO `products` VALUES ('964', 'ក្តាមឆាមីសួរឆ្នាំងដី', '20', '1', '0.00', null, '7', null, '2017-04-02 14:04:20');
INSERT INTO `products` VALUES ('965', 'បង្គាឆាស៊ីអ៊ីវ', '20', '1', '0.00', null, '7', null, '2017-04-02 14:12:56');
INSERT INTO `products` VALUES ('966', 'ក្តាមឆាម្រេចខ្ចី', '20', '1', '0.00', null, '7', null, '2017-04-02 14:04:32');
INSERT INTO `products` VALUES ('967', 'មាន់ត្រជាក់   មួយក្បាល ', '13', '1', '16.00', null, '7', null, '2017-04-02 14:57:30');
INSERT INTO `products` VALUES ('968', 'មាន់ត្រជាក់   មួយចំហៀង', '13', '1', '8.00', null, '7', null, '2017-04-02 14:57:39');
INSERT INTO `products` VALUES ('969', 'ត្រីតុកកែចំហុយស៊ីអ៊ីវ', '8', '1', '0.00', null, '7', null, '2017-04-02 14:31:28');
INSERT INTO `products` VALUES ('970', 'បាយឆាខ្ញីសាច់ជ្រូក(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('971', 'បាយឆាខ្ញីសាច់ជ្រូក(ធំ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('972', 'បុកល្ហុង(ត)', '23', '2', '6.00', null, '7', null, '2017-04-02 14:39:46');
INSERT INTO `products` VALUES ('973', 'បុកល្ហុង(ក)', '23', '2', '8.00', null, '7', null, '2017-04-02 14:39:35');
INSERT INTO `products` VALUES ('974', 'បុកល្ហុង(ធំ)', '23', '2', '10.00', null, '7', null, '2017-04-02 14:39:58');
INSERT INTO `products` VALUES ('975', 'ត្រីគ្រំចំហុយទឹកត្រីអំពិលទុំ', '8', '2', '0.00', null, '7', null, '2017-04-02 14:30:16');
INSERT INTO `products` VALUES ('976', 'មាន់ឆាអំពិលទុំ(ត)', '13', '2', '7.00', null, '7', null, '2017-04-02 14:56:33');
INSERT INTO `products` VALUES ('977', 'មាន់ឆាអំពិលទុំ(ក)', '13', '2', '9.00', null, '7', null, '2017-04-02 14:56:24');
INSERT INTO `products` VALUES ('978', 'ជង្គងមាន់បំពងខ្ទឹមស(ត)', '13', '1', '7.00', null, '7', null, '2017-04-02 14:51:58');
INSERT INTO `products` VALUES ('979', 'ជង្គងមាន់បំពងខ្ទឹមស(ក)', '13', '1', '9.00', null, '7', null, '2017-04-02 14:51:52');
INSERT INTO `products` VALUES ('980', 'មាន់អាំងទឹកឃ្មុំ​ ​មួយក្បាល', '13', '2', '16.00', null, '7', null, '2017-04-02 14:58:20');
INSERT INTO `products` VALUES ('981', 'មាន់អាំងទឹកឃ្មុំ​ ​មួយចំហៀង', '13', '2', '8.00', null, '7', null, '2017-04-02 14:58:28');
INSERT INTO `products` VALUES ('982', 'ជង្គងមាន់បំពងខ្ទឹមស(ធំ)', '13', '1', '11.00', null, '7', null, '2017-04-02 14:52:09');
INSERT INTO `products` VALUES ('983', 'មាន់ឆាអំពិលទុំ(ធំ)', '13', '2', '11.00', null, '7', null, '2017-04-02 14:56:43');
INSERT INTO `products` VALUES ('984', 'បបរស', '17', null, '1.00', null, null, null, null);
INSERT INTO `products` VALUES ('985', 'ញាំស្វាយបង្គាក្រៀម(ត)', '19', '2', '8.00', null, '7', null, '2017-03-09 15:16:54');
INSERT INTO `products` VALUES ('986', 'ញាំស្វាយបង្គាក្រៀម(ក)', '19', '2', '10.00', null, '7', null, '2017-03-09 15:16:45');
INSERT INTO `products` VALUES ('987', 'ញាំស្វាយបង្គាក្រៀម(ធំ)', '19', '2', '12.00', null, '7', null, '2017-03-09 15:17:04');
INSERT INTO `products` VALUES ('988', 'ស្ងោរងាំង៉ូវសាច់មាន់(ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('989', 'ស្ងោរងាំង៉ូវសាច់មាន់(ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('990', 'ស្ងោរងាំង៉ូវសាច់មាន់(ធំ)', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('991', 'ស្ងោរងាំង៉ូវសាច់កង្កែប(ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('992', 'ស្ងោរងាំង៉ូវសាច់កង្កែប(ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('993', 'ស្ងោរងាំង៉ូវសាច់កង្កែប(ធំ)', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('994', 'ស្ងោរជ្រក់ត្រីឆ្កោក(ត)', '21', null, '12.00', null, null, null, null);
INSERT INTO `products` VALUES ('995', 'ស្ងោរជ្រក់ត្រីឆ្កោក(ក)', '21', null, '14.00', null, null, null, null);
INSERT INTO `products` VALUES ('996', 'ស្ងោរជ្រក់ត្រីឆ្កោក(ធំ)', '21', null, '16.00', null, null, null, null);
INSERT INTO `products` VALUES ('997', 'ស្ងោរជ្រក់បង្កង', '20', '2', '0.00', null, '7', null, '2017-04-02 14:16:05');
INSERT INTO `products` VALUES ('998', 'ក្តាមឆាអំពិលទុំ', '20', '2', '0.00', null, '7', null, '2017-04-02 14:05:04');
INSERT INTO `products` VALUES ('999', 'ត្រីដំរីចំហុយស៊ីអ៊ីវ', '8', '1', '0.00', null, '7', null, '2017-04-02 14:30:31');
INSERT INTO `products` VALUES ('1000', 'ដូងក្រឡុក', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('1001', 'ទឹកដូងស្រស់', '10', null, '2.50', null, null, null, null);
INSERT INTO `products` VALUES ('1002', 'តែត្រជាក់', '18', null, '1.50', null, null, null, null);
INSERT INTO `products` VALUES ('1003', 'ដំឡូងបំពង(ត)', '17', null, '3.00', null, null, null, null);
INSERT INTO `products` VALUES ('1004', 'ដំឡូងបំពង(ក)', '17', null, '5.00', null, null, null, null);
INSERT INTO `products` VALUES ('1005', 'ដំឡូងបំពង(ធំ)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('1006', 'Steak  (ត)', '13', '1', '10.00', null, '7', null, '2017-04-02 14:49:33');
INSERT INTO `products` VALUES ('1007', 'Steak  (ក)', '13', '1', '12.00', null, '7', null, '2017-04-02 14:49:26');
INSERT INTO `products` VALUES ('1008', 'Steak  (ធំ)', '13', '1', '14.00', null, '7', null, '2017-04-02 14:49:43');
INSERT INTO `products` VALUES ('1009', 'សាឡាត់ក្តោបឆាប្រេងខ្យង(ត)', '23', '1', '5.00', null, '7', null, '2017-04-02 14:44:25');
INSERT INTO `products` VALUES ('1010', 'ចៃយ៉(ត)', '17', null, '5.00', null, null, null, null);
INSERT INTO `products` VALUES ('1011', 'បាយឡុកឡាកអង់គ្លេស', '1', '1', '5.50', null, '7', null, '2017-04-02 14:26:37');
INSERT INTO `products` VALUES ('1012', 'បាយឆ្អឹងជំនីជ្រូកប្រឡាក់ចៀន', '1', '1', '3.50', null, '7', null, '2017-04-02 14:24:21');
INSERT INTO `products` VALUES ('1013', 'បាយឆាសាច់ត្រីសាម៉ុន', '1', '1', '4.50', null, '7', null, '2017-04-02 14:24:01');
INSERT INTO `products` VALUES ('1014', 'បាយឆាយ៉ាងចូវ', '1', '1', '4.00', null, '7', null, '2017-03-10 14:18:42');
INSERT INTO `products` VALUES ('1015', 'បាយឆាម្រះព្រៅសាច់គោ', '1', '1', '4.00', null, '7', null, '2017-03-10 14:15:50');
INSERT INTO `products` VALUES ('1016', 'បាយហៃណាំភ្លៅ', '1', '4', '4.50', null, '7', null, '2017-04-02 14:26:30');
INSERT INTO `products` VALUES ('1017', 'បបរសាច់មាន់', '3', '4', '3.50', null, '7', null, '2017-04-02 14:21:21');
INSERT INTO `products` VALUES ('1018', 'Fresh Beer Black Free', '4', '6', '0.00', null, '7', null, '2017-03-09 13:38:24');
INSERT INTO `products` VALUES ('1019', 'Gorona BEER', '4', '6', '2.95', null, '7', null, '2017-03-09 13:38:36');
INSERT INTO `products` VALUES ('1020', 'ការីនំបុ័ង', '5', '2', '3.50', null, '7', null, '2017-04-02 14:17:37');
INSERT INTO `products` VALUES ('1021', 'សាច់គោបន្ទះដែក', '5', '1', '4.00', null, '7', null, '2017-03-10 14:14:01');
INSERT INTO `products` VALUES ('1022', 'អូស៊ីថ្លា', '6', '3', '2.50', null, '7', null, '2017-03-09 13:31:38');
INSERT INTO `products` VALUES ('1023', '002-MOUNTON CADAT,ROUGE', '25', '6', '25.00', null, '7', null, '2017-03-04 15:03:51');
INSERT INTO `products` VALUES ('1024', 'WHITE WING', '7', '6', '3.50', null, '7', null, '2017-03-09 13:40:48');
INSERT INTO `products` VALUES ('1025', 'ត្រីដំរីស្ងោរស្ពៃជ្រក់', '8', '1', '0.00', null, '7', null, '2017-04-02 14:30:57');
INSERT INTO `products` VALUES ('1026', 'ត្រីគ្រំចំហុយទឹកត្រីកោះកុង', '8', '2', '0.00', null, '7', null, '2017-04-02 14:30:00');
INSERT INTO `products` VALUES ('1027', 'ត្រីតុកកែចំហុយក្រូចឆ្មា', '8', '1', '0.00', null, '7', null, '2017-04-02 14:31:19');
INSERT INTO `products` VALUES ('1028', 'ត្រីក្រហមដុតអំបិល', '8', '2', '0.00', null, '7', null, '2017-04-02 14:29:09');
INSERT INTO `products` VALUES ('1029', 'ត្រីស្ពុងបំពងផ្អែម', '8', '1', '0.00', null, '7', null, '2017-04-02 14:33:04');
INSERT INTO `products` VALUES ('1030', 'ត្រីគ្រុំដុតអំបិល', '8', '2', '0.00', null, '7', null, '2017-04-02 14:29:47');
INSERT INTO `products` VALUES ('1031', 'ប៉ាវហ៊ឺស្រូបទឹកប៉ាវហ៊ឺ', '8', '1', '25.00', null, '7', null, '2017-04-02 14:33:34');
INSERT INTO `products` VALUES ('1032', 'ត្រីតុកកែខឆ្នាំងដី', '8', '1', '0.00', null, '7', null, '2017-04-02 14:31:07');
INSERT INTO `products` VALUES ('1033', 'ត្រីតុកកែញុំាឆៅ', '8', '1', '0.00', null, '7', null, '2017-04-02 14:31:39');
INSERT INTO `products` VALUES ('1034', 'ត្រីដំរីចំហុយក្រូចឆ្មា', '8', '1', '0.00', null, '7', null, '2017-04-02 14:30:23');
INSERT INTO `products` VALUES ('1035', 'ត្រីដំរីបំពងស្រួយ', '8', '1', '0.00', null, '7', null, '2017-04-02 14:30:50');
INSERT INTO `products` VALUES ('1036', 'ត្រីដំរីបំពងជូរអែម', '8', '1', '0.00', null, '7', null, '2017-04-02 14:30:41');
INSERT INTO `products` VALUES ('1037', 'ត្រីស្ពុងចំហុយក្រូចឆ្មា', '8', '1', '0.00', null, '7', null, '2017-04-02 14:32:26');
INSERT INTO `products` VALUES ('1038', 'ត្រីស្ពុងចំហុយសៀងខ្មៅ', '8', '1', '0.00', null, '7', null, '2017-04-02 14:32:42');
INSERT INTO `products` VALUES ('1039', 'ត្រីតុកកែបំពងស្រួយ', '8', '1', '0.00', null, '7', null, '2017-04-02 14:31:52');
INSERT INTO `products` VALUES ('1040', 'Green Mint Chocopie', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('1041', 'Caramel Frappe', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('1042', 'Honey soda', '10', null, '2.00', null, null, null, null);
INSERT INTO `products` VALUES ('1043', 'Strawberry soda', '10', null, '2.00', null, null, null, null);
INSERT INTO `products` VALUES ('1044', 'Passion soda', '10', null, '2.00', null, null, null, null);
INSERT INTO `products` VALUES ('1045', 'Chocolate Banana', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('1046', 'Kiwi Smoothies', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('1047', 'ទឺកសូកូឡាក្រឡុក', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('1048', 'ទឺកតែបៃតងក្រឡុក', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('1049', 'ទឺកគីវីក្រឡុក', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('1050', 'ត្រាវក្រឡុក', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('1051', 'ទឹកក្រូចថ្លុងស្រស់', '10', null, '3.00', null, null, null, null);
INSERT INTO `products` VALUES ('1052', 'ក្រូចថ្លុងក្រឡុក', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('1053', 'ការ៉ុតក្រឡុក', '10', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('1054', 'ហ្វឺ', '11', '4', '3.50', null, '7', null, '2017-03-09 15:05:38');
INSERT INTO `products` VALUES ('1055', 'គុយទាវសាច់ត្រី', '11', '4', '3.00', null, '7', null, '2017-03-09 15:04:24');
INSERT INTO `products` VALUES ('1056', 'គុយទាវសាច់ជ្រូក', '11', '4', '3.50', null, '7', null, '2017-03-09 15:04:09');
INSERT INTO `products` VALUES ('1057', 'គុយទាវឆាសាច់ជ្រូក', '11', '4', '3.50', null, '7', null, '2017-03-09 15:02:18');
INSERT INTO `products` VALUES ('1058', 'ត្រីប្រម៉ាចៀនពង(ក)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:52:28');
INSERT INTO `products` VALUES ('1059', 'ត្រីប្រម៉ាចៀនពង(ត)', '12', '2', '5.00', null, '7', null, '2017-03-09 14:52:35');
INSERT INTO `products` VALUES ('1060', 'ត្រីប្រម៉ាចៀនពង(ធ)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:52:43');
INSERT INTO `products` VALUES ('1061', 'ឆាក្តៅអន្ទង់(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:34:48');
INSERT INTO `products` VALUES ('1062', 'ឆាក្តៅអន្ទង់(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:34:32');
INSERT INTO `products` VALUES ('1063', 'ឆាក្តៅអន្ទង់(ធំ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:35:02');
INSERT INTO `products` VALUES ('1064', 'កាពិឆាសាច់ចិញ្រ្ចាំ(ធ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:29:38');
INSERT INTO `products` VALUES ('1065', 'កាពិឆាសាច់ចិញ្រ្ចាំ(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:29:15');
INSERT INTO `products` VALUES ('1066', 'កាពិឆាសាច់ចិញ្រ្ចាំ(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:29:26');
INSERT INTO `products` VALUES ('1067', 'ប៉េងប៉ោះឆាពងទា(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:54:58');
INSERT INTO `products` VALUES ('1068', 'ប៉េងប៉ោះឆាពងទា(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:54:48');
INSERT INTO `products` VALUES ('1069', 'ប៉េងប៉ោះឆាពងទា(ធ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:55:09');
INSERT INTO `products` VALUES ('1070', 'ត្រីសណ្តាយប្រឡាក់ចៀន', '12', '2', '0.00', null, '7', null, '2017-03-09 14:53:12');
INSERT INTO `products` VALUES ('1071', 'ជង្គងមាន់រ៉ទី(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:39:01');
INSERT INTO `products` VALUES ('1072', 'ជង្គងមាន់រ៉ទី(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:38:50');
INSERT INTO `products` VALUES ('1073', 'ជង្គងមាន់រ៉ទី(ធំ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:39:12');
INSERT INTO `products` VALUES ('1074', 'ត្រីកេះចៀនទឹកត្រីស្វាយ(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:43:26');
INSERT INTO `products` VALUES ('1075', 'ត្រីកេះចៀនទឹកត្រីស្វាយ(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:43:15');
INSERT INTO `products` VALUES ('1076', 'ត្រីកេះចៀនទឹកត្រីស្វាយ(ធ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:43:36');
INSERT INTO `products` VALUES ('1077', 'ឆាម្រះព្រៅសាច់មាន់(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:37:56');
INSERT INTO `products` VALUES ('1078', 'ឆាម្រះព្រៅសាច់មាន់(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:37:47');
INSERT INTO `products` VALUES ('1079', 'ឆាម្រះព្រៅសាច់មាន់(ធ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:38:05');
INSERT INTO `products` VALUES ('1080', 'សាច់មាន់ប្រឡាក់ចៀន(ធ)', '13', '2', '11.00', null, '7', null, '2017-04-02 15:05:26');
INSERT INTO `products` VALUES ('1081', 'សាច់មាន់ប្រឡាក់ចៀន(ក)', '13', '2', '9.00', null, '7', null, '2017-04-02 15:04:44');
INSERT INTO `products` VALUES ('1082', 'សាច់មាន់ប្រឡាក់ចៀន(ត)', '13', '2', '7.00', null, '7', null, '2017-04-02 15:05:10');
INSERT INTO `products` VALUES ('1083', 'ត្រីសាម៉ុងចៀនស៊ីអ៊ីវ(ធ)', '13', '1', '25.00', null, '7', null, '2017-04-02 14:54:36');
INSERT INTO `products` VALUES ('1084', 'ត្រីសាម៉ុងចៀនស៊ីអ៊ីវ(ត)', '13', '1', '13.00', null, '7', null, '2017-04-02 14:54:21');
INSERT INTO `products` VALUES ('1085', 'ត្រីសាម៉ុងចៀនស៊ីអ៊ីវ(ក)', '13', '1', '18.00', null, '7', null, '2017-04-02 14:54:10');
INSERT INTO `products` VALUES ('1086', 'ស្លាបមាន់បំពង(ធ)', '13', '1', '11.00', null, '7', null, '2017-04-02 15:05:58');
INSERT INTO `products` VALUES ('1087', 'ស្លាបមាន់បំពង(ក)', '13', '1', '9.00', null, '7', null, '2017-04-02 15:05:40');
INSERT INTO `products` VALUES ('1088', 'ស្លាបមាន់បំពង(ត)', '13', '1', '7.00', null, '7', null, '2017-04-02 15:05:48');
INSERT INTO `products` VALUES ('1089', 'សាច់គោស្វាយរៀង(ត)', '13', '2', '7.00', null, '7', null, '2017-04-02 15:00:38');
INSERT INTO `products` VALUES ('1090', 'សាច់គោស្វាយរៀង(ក)', '13', '2', '9.00', null, '7', null, '2017-04-02 15:00:30');
INSERT INTO `products` VALUES ('1091', 'សាច់គោស្វាយរៀង(ធ)', '13', '2', '11.00', null, '7', null, '2017-04-02 15:00:47');
INSERT INTO `products` VALUES ('1092', 'ស្លាបមាន់ប្រឡាក់ចៀន(ត)', '13', '2', '7.00', null, '7', null, '2017-04-02 15:07:11');
INSERT INTO `products` VALUES ('1093', 'ស្លាបមាន់ប្រឡាក់ចៀន(ក)', '13', '2', '9.00', null, '7', null, '2017-04-02 15:07:01');
INSERT INTO `products` VALUES ('1094', 'ស្លាបមាន់ប្រឡាក់ចៀន(ធ)', '13', '2', '11.00', null, '7', null, '2017-04-02 15:07:19');
INSERT INTO `products` VALUES ('1095', 'អណ្តាតទាបំពងខ្ទឹមស(ត)', '13', '1', '7.00', null, '7', null, '2017-04-02 15:09:13');
INSERT INTO `products` VALUES ('1096', 'អណ្តាតទាបំពងខ្ទឹមស(ក)', '13', '1', '9.00', null, '7', null, '2017-04-02 15:09:05');
INSERT INTO `products` VALUES ('1097', 'អណ្តាតទាបំពងខ្ទឹមស(ធ)', '13', '1', '11.00', null, '7', null, '2017-04-02 15:09:21');
INSERT INTO `products` VALUES ('1098', 'ភ្លៅមាន់ចៀន(ត)', '13', '2', '7.00', null, '7', null, '2017-04-02 14:56:04');
INSERT INTO `products` VALUES ('1099', 'ភ្លៅមាន់ចៀន(ក)', '13', '2', '9.00', null, '7', null, '2017-04-02 14:55:51');
INSERT INTO `products` VALUES ('1100', 'ភ្លៅមាន់ចៀន(ធ)', '13', '2', '11.00', null, '7', null, '2017-04-02 14:56:13');
INSERT INTO `products` VALUES ('1101', 'ទាខ្វៃ  (មួយក្បាល)', '13', '1', '21.98', null, '7', null, '2017-04-02 14:54:46');
INSERT INTO `products` VALUES ('1102', 'ទាខ្វៃ  (មួយចំហៀង)', '13', '1', '10.99', null, '7', null, '2017-04-02 14:54:54');
INSERT INTO `products` VALUES ('1103', 'ជង្គងមាន់បំពងស្វាយចន្ទី(ត)', '13', '1', '7.00', null, '7', null, '2017-04-02 14:52:29');
INSERT INTO `products` VALUES ('1104', 'ជង្គងមាន់បំពងស្វាយចន្ទី(ក)', '13', '1', '9.00', null, '7', null, '2017-04-02 14:52:20');
INSERT INTO `products` VALUES ('1105', 'ជង្គងមាន់បំពងស្វាយចន្ទី(ធ)', '13', '1', '11.00', null, '7', null, '2017-04-02 14:52:42');
INSERT INTO `products` VALUES ('1106', 'សាច់គោអូស្រ្តាលីបន្ទះដែក(ត)', '13', '1', '14.00', null, '7', null, '2017-04-02 15:02:07');
INSERT INTO `products` VALUES ('1107', 'សាច់គោអូស្រ្តាលីបន្ទះដែក(ក)', '13', '1', '16.00', null, '7', null, '2017-04-02 15:02:00');
INSERT INTO `products` VALUES ('1108', 'សាច់គោអូស្រ្តាលីបន្ទះដែក(ធ)', '13', '1', '18.00', null, '7', null, '2017-04-02 15:02:14');
INSERT INTO `products` VALUES ('1109', 'សាច់ជ្រូកស្វាយរៀង(ត)', '13', '2', '7.00', null, '7', null, '2017-04-02 15:04:03');
INSERT INTO `products` VALUES ('1110', 'សាច់ជ្រូកស្វាយរៀង(ក)', '13', '2', '9.00', null, '7', null, '2017-04-02 15:03:53');
INSERT INTO `products` VALUES ('1111', 'សាច់ជ្រូកស្វាយរៀង(ធ)', '13', '2', '11.00', null, '7', null, '2017-04-02 15:04:11');
INSERT INTO `products` VALUES ('1112', 'មាន់ដុតកូកា  (មួយចំហៀង)', '13', '2', '8.00', null, '7', null, '2017-04-02 14:57:05');
INSERT INTO `products` VALUES ('1113', 'មាន់ដុតកូកា  (មួយក្បាល)', '13', '2', '16.00', null, '7', null, '2017-04-02 14:56:53');
INSERT INTO `products` VALUES ('1114', 'ងៀតក្រពើ ', '13', '1', '6.00', null, '7', null, '2017-04-02 14:49:52');
INSERT INTO `products` VALUES ('1115', 'មីគាវគ្រឿងសមុទ្រ', '14', null, '4.00', null, null, null, null);
INSERT INTO `products` VALUES ('1116', 'មីឆាក្រឡុកពង', '14', null, '3.00', null, null, null, null);
INSERT INTO `products` VALUES ('1117', 'មីប្រហិតសាច់គោ(ឌុបមី)', '14', null, '4.00', null, null, null, null);
INSERT INTO `products` VALUES ('1118', 'មីសាច់គោ', '14', null, '3.50', null, null, null, null);
INSERT INTO `products` VALUES ('1119', 'លតឆាបន្លែ', '16', '1', '3.00', null, '7', null, '2017-03-10 13:58:08');
INSERT INTO `products` VALUES ('1120', 'លតឆាពងទា', '16', '1', '3.00', null, '7', null, '2017-03-10 13:58:53');
INSERT INTO `products` VALUES ('1121', 'លតឆាប៉ាតេ', '16', '1', '3.50', null, '7', null, '2017-03-10 13:58:30');
INSERT INTO `products` VALUES ('1122', 'ចៃយ៉(ក)', '17', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('1123', 'លតឆាសាច់ជ្រូក(ធ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('1124', 'លតឆាប៉ាតេ(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('1125', 'លតឆាប៉ាតេ(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('1126', 'លតឆាប៉ាតេ(ធ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('1127', 'លតឆាពិសេស(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('1128', 'លតឆាពិសេស(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('1129', 'លតឆាពិសេស(ធ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('1130', 'បបរត្រី(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('1131', 'បបរត្រី(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('1132', 'បបរត្រី(ធំ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('1133', 'លតឆាសាច់ជ្រូក(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('1134', 'លតឆាសាច់ជ្រូក(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('1135', 'បាយឆាម្រះព្រៅសាច់មាន់(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('1136', 'បាយឆាម្រះព្រៅសាច់មាន់(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('1137', 'បាយឆាម្រះព្រៅសាច់មាន់(ធ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('1138', 'បាយឆាសាច់ជ្រូក(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('1139', 'បាយឆាសាច់ជ្រូក(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('1140', 'បាយឆាសាច់ជ្រូក(ធ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('1141', 'បាយឆាសាច់គោ(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('1142', 'បាយឆាសាច់គោ(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('1143', 'បាយឆាសាច់គោ(ធ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('1144', 'មីកន្តាំងឆាសាច់គោ(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('1145', 'មីកន្តាំងឆាសាច់គោ(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('1146', 'មីកន្តាំងឆាសាច់គោ(ធ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('1147', 'បាយឆាកាពិ(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('1148', 'បាយឆាកាពិ(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('1149', 'បាយឆាកាពិ(ធ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('1150', 'គួងបង្គាលាយសាច់ជ្រូក(ត)', '17', null, '5.00', null, null, null, null);
INSERT INTO `products` VALUES ('1151', 'គួងបង្គាលាយសាច់ជ្រូក(ក)', '17', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('1152', 'គួងបង្គាលាយសាច់ជ្រូក(ធ)', '17', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('1153', 'បាយឆាម្រះព្រៅសាច់គោ(ត)', '17', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('1154', 'បាយឆាម្រះព្រៅសាច់គោ(ក)', '17', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('1155', 'បាយឆាម្រះព្រៅសាច់គោ(ធ)', '17', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('1156', 'Cheng bou leong', '18', '6', '1.00', null, '7', null, '2017-03-09 13:36:31');
INSERT INTO `products` VALUES ('1157', 'ពោះគោញាំត្រយូងចេក(ត)', '19', '2', '10.00', null, '7', null, '2017-03-09 15:20:38');
INSERT INTO `products` VALUES ('1158', 'ពោះគោញាំត្រយូងចេក(ក)', '19', '2', '12.00', null, '7', null, '2017-03-09 15:20:30');
INSERT INTO `products` VALUES ('1159', 'ពោះគោញាំត្រយូងចេក(ធំ)', '19', '2', '14.00', null, '7', null, '2017-03-09 15:20:48');
INSERT INTO `products` VALUES ('1160', 'ញាំម្កាក់ត្រីឆ្អើរ', '19', '2', '5.50', null, '7', null, '2017-03-09 15:14:58');
INSERT INTO `products` VALUES ('1161', 'បុកស្វាយត្រីឆ្អើរ(ត)', '19', '2', '9.00', null, '7', null, '2017-03-09 15:19:45');
INSERT INTO `products` VALUES ('1162', 'បុកស្វាយត្រីឆ្អើរ(ក)', '19', '2', '11.00', null, '7', null, '2017-03-09 15:19:36');
INSERT INTO `products` VALUES ('1163', 'បុកស្វាយត្រីឆ្អើរ(ធ)', '19', '2', '13.00', null, '7', null, '2017-03-09 15:19:53');
INSERT INTO `products` VALUES ('1166', 'ឡាបសាច់មាន់(ធ)', '19', '2', '15.00', null, '7', null, '2017-03-09 15:24:59');
INSERT INTO `products` VALUES ('1167', 'ក្តាមចំហុយមីសួរ', '20', '1', '0.00', null, '7', null, '2017-04-02 14:03:11');
INSERT INTO `products` VALUES ('1168', 'បង្គាចំហុយខ្ទឹមស', '20', '1', '0.00', null, '7', null, '2017-04-02 14:11:55');
INSERT INTO `products` VALUES ('1169', 'បង្គាស្រុះ', '20', '1', '0.00', null, '7', null, '2017-04-02 14:13:41');
INSERT INTO `products` VALUES ('1170', 'ក្តាមឆាមីសួរ', '20', '1', '0.00', null, '7', null, '2017-04-02 14:04:08');
INSERT INTO `products` VALUES ('1171', 'បង្គាចំហុយមីសួរឆ្នាំងដី', '20', '1', '0.00', null, '7', null, '2017-04-02 14:12:23');
INSERT INTO `products` VALUES ('1172', 'ខ្យងប៉ារ៉ាឆាគ្រឿង', '20', '2', '0.00', null, '7', null, '2017-04-02 14:08:19');
INSERT INTO `products` VALUES ('1173', 'ក្តាមចំហុយមីសួរឆ្នាំង', '20', '1', '0.00', null, '7', null, '2017-04-02 14:03:26');
INSERT INTO `products` VALUES ('1174', 'បង្គាឆាពងទាប្រៃ', '20', '1', '0.00', null, '7', null, '2017-04-02 14:12:43');
INSERT INTO `products` VALUES ('1175', 'បង្គាឆាអំបិលម្រេច', '20', '1', '0.00', null, '7', null, '2017-04-02 14:13:06');
INSERT INTO `products` VALUES ('1176', 'ក្តាមឆាពងទាប្រៃ', '20', '1', '0.00', null, '7', null, '2017-04-02 14:03:52');
INSERT INTO `products` VALUES ('1177', 'បង្គាចំហុយមីសួរ', '20', '1', '0.00', null, '7', null, '2017-04-02 14:12:09');
INSERT INTO `products` VALUES ('1178', 'ក្តាមបំពង់ខ្ទឹមស', '20', '1', '0.00', null, '7', null, '2017-04-02 14:06:05');
INSERT INTO `products` VALUES ('1179', 'ក្តាមសកបំពងខ្ទឹមស', '20', '1', '0.00', null, '7', null, '2017-04-02 14:06:38');
INSERT INTO `products` VALUES ('1180', 'ខ្យងប៉ារ៉ាអំាង', '20', '2', '0.00', null, '7', null, '2017-04-02 14:08:52');
INSERT INTO `products` VALUES ('1181', 'ខ្យងប៉ារ៉ាខ្ចប់អំបិល', '20', '1', '0.00', null, '7', null, '2017-04-02 14:07:51');
INSERT INTO `products` VALUES ('1182', 'បង្គាបំពងខ្ទឹមស', '20', '1', '0.00', null, '7', null, '2017-04-02 14:13:17');
INSERT INTO `products` VALUES ('1183', 'ក្តាមឆាសាតេ', '20', '1', '0.00', null, '7', null, '2017-04-02 14:04:47');
INSERT INTO `products` VALUES ('1184', 'តុមយាំុសាច់មាន់(ធ)', '21', null, '12.00', null, null, null, null);
INSERT INTO `products` VALUES ('1185', 'តុមយាំុសាច់មាន់(ក)', '21', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('1186', 'តុមយាំុសាច់មាន់(ត)', '21', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('1187', 'ម្ជូរយួនក្បាលត្រីសណ្តាយ(ត)', '21', null, '12.00', null, null, null, null);
INSERT INTO `products` VALUES ('1188', 'ម្ជូរយួនក្បាលត្រីសណ្តាយ(ក)', '21', null, '15.00', null, null, null, null);
INSERT INTO `products` VALUES ('1189', 'ម្ជូរយួនក្បាលត្រីសណ្តាយ(ធ)', '21', null, '18.00', null, null, null, null);
INSERT INTO `products` VALUES ('1190', 'ម្ជូរគ្រឿងពងត្រីសណ្តាយ(ត)', '21', null, '12.00', null, null, null, null);
INSERT INTO `products` VALUES ('1191', 'ម្ជូរគ្រឿងពងត្រីសណ្តាយ(ក)', '21', null, '15.00', null, null, null, null);
INSERT INTO `products` VALUES ('1192', 'ម្ជូរគ្រឿងពងត្រីសណ្តាយ(ធ)', '21', null, '18.00', null, null, null, null);
INSERT INTO `products` VALUES ('1193', 'ម្ជូរពងត្រីសណ្តាយ(ត)', '21', null, '12.00', null, null, null, null);
INSERT INTO `products` VALUES ('1194', 'ម្ជូរពងត្រីសណ្តាយ(ក)', '21', null, '15.00', null, null, null, null);
INSERT INTO `products` VALUES ('1195', 'ម្ជូរពងត្រីសណ្តាយ(ធ)', '21', null, '18.00', null, null, null, null);
INSERT INTO `products` VALUES ('1196', 'ខជើងជ្រូក(ក)', '21', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('1197', 'ខជើងជ្រូក(ត)', '21', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('1198', 'ខជើងជ្រូក(ធ)', '21', null, '12.00', null, null, null, null);
INSERT INTO `products` VALUES ('1199', 'ម្ជូរគ្រឿងឆ្អឹងជំនី(ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('1200', 'ម្ជូរគ្រឿងឆ្អឹងជំនី(ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('1201', 'ម្ជូរគ្រឿងឆ្អឹងជំនី(ធ)', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('1202', 'ស៊ុបបន្លែសាច់មាន់(ត)', '21', null, '6.00', null, null, null, null);
INSERT INTO `products` VALUES ('1203', 'ស៊ុបបន្លែសាច់មាន់(ក)', '21', null, '8.00', null, null, null, null);
INSERT INTO `products` VALUES ('1204', 'ស៊ុបបន្លែសាច់មាន់(ធ)', '21', null, '10.00', null, null, null, null);
INSERT INTO `products` VALUES ('1205', 'ម្ជូរយួនត្រីរ៉ស់(ត)', '21', null, '7.00', null, null, null, null);
INSERT INTO `products` VALUES ('1206', 'ម្ជូរយួនត្រីរ៉ស់(ក)', '21', null, '9.00', null, null, null, null);
INSERT INTO `products` VALUES ('1207', 'ម្ជូរយួនត្រីរ៉ស់(ធ)', '21', null, '11.00', null, null, null, null);
INSERT INTO `products` VALUES ('1208', 'កាហ្វេទឹកដោះគោក្រឡុក', '22', '6', '2.00', null, '7', null, '2017-03-09 14:22:52');
INSERT INTO `products` VALUES ('1209', 'ទឹកតែ', '22', '6', '1.00', null, '7', null, '2017-03-09 14:24:45');
INSERT INTO `products` VALUES ('1210', 'ទឹកត្រជាក់', '22', '6', '1.50', null, '7', null, '2017-03-09 14:24:53');
INSERT INTO `products` VALUES ('1211', 'សាឡាត់ក្តោបឆាខ្ទឹមស(ក)', '23', '1', '7.00', null, '7', null, '2017-04-02 14:43:29');
INSERT INTO `products` VALUES ('1212', 'សាឡាត់ក្តោបឆាខ្ទឹមស(ធំ)', '23', '1', '9.00', null, '7', null, '2017-04-02 14:43:59');
INSERT INTO `products` VALUES ('1213', 'សាឡាត់ក្តោបឆាប្រេងខ្យង(ក)', '23', '1', '7.00', null, '7', null, '2017-04-02 14:44:09');
INSERT INTO `products` VALUES ('1214', 'សាឡាត់ក្តោបឆាប្រេងខ្យង(ធំ)', '23', '1', '9.00', null, '7', null, '2017-04-02 14:44:35');
INSERT INTO `products` VALUES ('1215', 'សាឡាត់ក្តោបឆាខ្ទឹមស(ត)', '23', '1', '5.00', null, '7', null, '2017-04-02 14:43:40');
INSERT INTO `products` VALUES ('1216', 'KULEN- 1500ML', '24', '6', '3.00', null, '7', null, '2017-03-09 13:33:14');
INSERT INTO `products` VALUES ('1217', 'KULEN-500ML', '24', '6', '1.00', null, '7', null, '2017-03-09 13:33:16');
INSERT INTO `products` VALUES ('1218', 'Bruntys Strawberry', '24', '6', '3.00', null, '7', null, '2017-03-09 13:33:04');
INSERT INTO `products` VALUES ('1219', 'Bruntys Pear', '24', '6', '3.00', null, '7', null, '2017-03-09 13:32:59');
INSERT INTO `products` VALUES ('1220', 'Bruntys Apple', '24', '6', '3.00', null, '7', null, '2017-03-09 13:32:54');
INSERT INTO `products` VALUES ('1221', 'PLAN GRANIER BLANC 75CL', '25', null, '21.00', null, null, null, null);
INSERT INTO `products` VALUES ('1222', 'RED KNOT SHIRAZ', '25', null, '25.00', null, null, null, null);
INSERT INTO `products` VALUES ('1223', 'PLAN GRANIER', '25', null, '25.00', null, null, null, null);
INSERT INTO `products` VALUES ('1224', 'THE GATE', '25', null, '65.00', null, null, null, null);
INSERT INTO `products` VALUES ('1225', 'DAVEY ESTATE', '25', null, '55.00', null, null, null, null);
INSERT INTO `products` VALUES ('1226', 'BIN 2', '25', '6', '25.00', null, '7', null, '2017-03-09 13:37:21');
INSERT INTO `products` VALUES ('1227', 'KOONUNGA HILL', '25', null, '25.00', null, null, null, null);
INSERT INTO `products` VALUES ('1228', 'RIMAPERE', '25', null, '55.00', null, null, null, null);
INSERT INTO `products` VALUES ('1229', 'RUPERT AND ROTHSCHILD', '25', null, '75.00', null, null, null, null);
INSERT INTO `products` VALUES ('1230', 'CELESTE CRIANZA', '25', null, '45.00', null, null, null, null);
INSERT INTO `products` VALUES ('1231', 'TAITTINGER', '25', null, '70.00', null, null, null, null);
INSERT INTO `products` VALUES ('1232', 'VILLA BEL AIR', '25', null, '65.00', null, null, null, null);
INSERT INTO `products` VALUES ('1233', 'CHATEAU JUNAYME CANON 2007', '25', null, '60.00', null, null, null, null);
INSERT INTO `products` VALUES ('1234', 'CHATEAU LAURES 2009 75CL', '25', null, '40.00', null, null, null, null);
INSERT INTO `products` VALUES ('1235', 'BORDEAU BARON VILLARS 2009 75CL', '25', '6', '45.00', null, '7', null, '2017-03-09 13:37:33');
INSERT INTO `products` VALUES ('1236', 'CHATEAU HAUT BERNADON 2011 75CL', '25', null, '25.00', null, null, null, null);
INSERT INTO `products` VALUES ('1237', 'PLAN GRANIER ROUGE  75CL', '25', null, '20.00', null, null, null, null);
INSERT INTO `products` VALUES ('1238', 'PENFOLDS BIN 2', '25', null, '25.00', null, null, null, null);
INSERT INTO `products` VALUES ('1239', 'PENFOLDS KOONUNGA', '25', null, '23.00', null, null, null, null);
INSERT INTO `products` VALUES ('1240', '006-CHATEAU JUNAYME', '25', '6', '60.00', null, '7', null, '2017-03-09 13:07:54');
INSERT INTO `products` VALUES ('1241', '007-BARON VILLARS', '25', '6', '45.00', null, '7', null, '2017-03-04 15:13:49');
INSERT INTO `products` VALUES ('1242', '010-CHAMPAGNE  TAITINGER', '25', '6', '70.00', null, '7', null, '2017-03-09 13:08:54');
INSERT INTO `products` VALUES ('1243', '001MOUNTON  CANDET,GRAVE', '25', '6', '45.00', 'nfGHgKtxtrml640g.png', '1', null, '2017-06-28 09:27:30');
INSERT INTO `products` VALUES ('1244', '009-MOET CHAMPAGNE', '25', '6', '75.00', null, '7', null, '2017-03-09 13:08:46');
INSERT INTO `products` VALUES ('1245', 'ត្រីកេះចៀនជូរអែម(ត)', '12', '2', '7.00', null, '7', null, '2017-03-09 14:42:14');
INSERT INTO `products` VALUES ('1246', 'ត្រីកេះចៀនជូរអែម(ក)', '12', '2', '9.00', null, '7', null, '2017-03-09 14:42:04');
INSERT INTO `products` VALUES ('1247', 'ត្រីកេះចៀនជូរអែម(ធ)', '12', '2', '11.00', null, '7', null, '2017-03-09 14:42:22');
INSERT INTO `products` VALUES ('1248', 'កាហ្វេទឹកដោះគោក្តៅ/ទឹកកក(ធ)', '22', '6', '2.00', null, '7', null, '2017-03-09 14:22:36');
INSERT INTO `products` VALUES ('1249', 'Vital(s) 500ml', '24', '6', '1.00', null, '7', null, '2017-03-09 13:33:39');
INSERT INTO `products` VALUES ('1250', 'Vital(s) 1500ml', '24', '6', '3.00', null, '7', null, '2017-03-09 13:33:34');

-- ----------------------------
-- Table structure for `product_categories`
-- ----------------------------
DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `ordering` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_categories
-- ----------------------------
INSERT INTO `product_categories` VALUES ('1', 'Rice', '7', null, '2017-11-21 14:12:49');
INSERT INTO `product_categories` VALUES ('4', 'Beer', '14', null, '2017-11-21 14:17:43');
INSERT INTO `product_categories` VALUES ('5', 'Dessert', '22', null, '2017-11-21 14:19:34');
INSERT INTO `product_categories` VALUES ('6', 'Dim Sum', '19', null, '2017-11-21 14:18:21');
INSERT INTO `product_categories` VALUES ('7', 'Cocktail', '23', null, '2017-11-21 14:19:44');
INSERT INTO `product_categories` VALUES ('8', 'Fish Food', '15', null, '2017-11-21 14:19:08');
INSERT INTO `product_categories` VALUES ('10', 'Fruit Juice', '17', null, '2017-11-21 14:18:39');
INSERT INTO `product_categories` VALUES ('11', 'Noodle', '1', null, '2017-11-21 14:12:20');
INSERT INTO `product_categories` VALUES ('13', 'Meat Food', '18', null, '2017-11-21 14:18:58');
INSERT INTO `product_categories` VALUES ('15', 'Milk', '8', null, '2017-11-21 14:12:54');
INSERT INTO `product_categories` VALUES ('18', 'Soft Drink', '11', null, '2017-11-21 14:13:07');
INSERT INTO `product_categories` VALUES ('20', 'Sea Food', '12', null, '2017-11-21 14:18:47');
INSERT INTO `product_categories` VALUES ('22', 'Tea / Coffee', '2', null, '2017-11-21 14:12:30');
INSERT INTO `product_categories` VALUES ('24', 'Water', '5', null, '2017-11-21 14:12:43');
INSERT INTO `product_categories` VALUES ('25', 'Wine', '20', null, '2017-11-21 14:18:02');

-- ----------------------------
-- Table structure for `recipes`
-- ----------------------------
DROP TABLE IF EXISTS `recipes`;
CREATE TABLE `recipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT '0.00',
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recipes
-- ----------------------------
INSERT INTO `recipes` VALUES ('10', '14', '3', '0.10', '1', '2016-09-11 10:24:38', '2016-09-11 10:24:38');
INSERT INTO `recipes` VALUES ('11', '12', '5', '0.20', '1', '2016-09-11 10:24:55', '2016-09-11 10:24:55');
INSERT INTO `recipes` VALUES ('13', '1', '5', '0.10', '1', '2016-09-11 10:25:33', '2016-09-11 10:25:33');
INSERT INTO `recipes` VALUES ('14', '1167', '4', '1.00', '1', '2017-11-19 20:38:43', '2017-11-19 20:38:43');

-- ----------------------------
-- Table structure for `tables`
-- ----------------------------
DROP TABLE IF EXISTS `tables`;
CREATE TABLE `tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `status` enum('Free','Busy','Printed') DEFAULT 'Free',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tables
-- ----------------------------
INSERT INTO `tables` VALUES ('2', '10', 'Free', null, '2017-04-09 08:39:02');
INSERT INTO `tables` VALUES ('3', '11', 'Free', null, '2017-04-09 08:30:15');
INSERT INTO `tables` VALUES ('4', '12', 'Free', null, '2017-04-09 07:57:46');
INSERT INTO `tables` VALUES ('5', '13', 'Free', null, '2017-03-29 10:08:05');
INSERT INTO `tables` VALUES ('6', '14', 'Free', null, '2017-04-09 08:38:24');
INSERT INTO `tables` VALUES ('7', '15', 'Busy', null, '2017-04-24 07:22:33');
INSERT INTO `tables` VALUES ('8', '16', 'Free', null, '2017-11-21 13:16:07');
INSERT INTO `tables` VALUES ('9', '17', 'Free', null, '2017-11-21 13:16:11');
INSERT INTO `tables` VALUES ('10', '18', 'Free', null, '2017-11-21 13:19:37');
INSERT INTO `tables` VALUES ('11', '20', 'Free', null, '2017-04-09 09:04:46');
INSERT INTO `tables` VALUES ('12', '21', 'Free', null, '2017-04-23 18:17:06');
INSERT INTO `tables` VALUES ('13', '22', 'Free', null, '2017-04-09 08:51:13');
INSERT INTO `tables` VALUES ('14', '23', 'Free', null, '2017-04-09 07:52:55');
INSERT INTO `tables` VALUES ('15', '24', 'Free', null, '2017-04-09 08:57:11');
INSERT INTO `tables` VALUES ('16', '25', 'Free', null, '2017-04-09 08:47:56');
INSERT INTO `tables` VALUES ('17', '26', 'Free', null, '2017-04-09 09:01:29');
INSERT INTO `tables` VALUES ('18', '27', 'Free', null, '2017-06-30 16:26:18');
INSERT INTO `tables` VALUES ('19', '28', 'Free', null, '2017-03-05 21:01:55');
INSERT INTO `tables` VALUES ('20', '30', 'Busy', null, '2017-04-09 08:45:58');
INSERT INTO `tables` VALUES ('22', '32', 'Free', null, '2017-04-09 08:32:36');
INSERT INTO `tables` VALUES ('23', '33', 'Busy', null, '2017-04-09 08:53:56');
INSERT INTO `tables` VALUES ('24', '34', 'Free', null, '2017-04-09 08:46:55');
INSERT INTO `tables` VALUES ('25', '35', 'Busy', null, '2017-08-25 15:46:54');
INSERT INTO `tables` VALUES ('26', '36', 'Free', null, '2017-04-09 08:48:41');
INSERT INTO `tables` VALUES ('27', '37', 'Free', null, '2017-04-09 08:43:19');
INSERT INTO `tables` VALUES ('28', '38', 'Busy', null, '2017-05-05 10:32:22');
INSERT INTO `tables` VALUES ('29', '39', 'Free', null, '2017-04-09 09:08:54');
INSERT INTO `tables` VALUES ('30', '40', 'Printed', null, '2017-11-22 14:32:44');
INSERT INTO `tables` VALUES ('31', '41', 'Busy', null, '2017-04-09 09:00:48');
INSERT INTO `tables` VALUES ('32', '42', 'Busy', null, '2017-05-03 15:26:45');
INSERT INTO `tables` VALUES ('33', '43', 'Free', null, '2017-03-08 10:50:25');
INSERT INTO `tables` VALUES ('34', 'VIP 1', 'Busy', null, '2017-04-09 08:12:18');
INSERT INTO `tables` VALUES ('35', 'VIP 2', 'Free', null, '2017-03-07 10:01:15');
INSERT INTO `tables` VALUES ('36', 'VIP 3', 'Free', null, '2017-04-09 08:54:18');
INSERT INTO `tables` VALUES ('37', 'VIP 4', 'Busy', null, '2017-04-09 08:48:05');
INSERT INTO `tables` VALUES ('38', 'VIP 5', 'Free', null, '2017-04-08 20:12:20');
INSERT INTO `tables` VALUES ('39', 'VIP 6', 'Busy', null, '2017-04-09 08:37:35');
INSERT INTO `tables` VALUES ('40', 'VIP 7', 'Busy', null, '2017-04-09 08:37:48');
INSERT INTO `tables` VALUES ('41', 'VIP 8', 'Busy', null, '2017-04-23 18:17:05');
INSERT INTO `tables` VALUES ('42', 'VIP 9', 'Free', null, '2017-04-09 09:06:41');
INSERT INTO `tables` VALUES ('43', 'VIP 5A', 'Free', null, '2017-04-08 20:12:08');
INSERT INTO `tables` VALUES ('44', 'VIP 5B', 'Free', null, '2017-04-06 22:26:11');
INSERT INTO `tables` VALUES ('45', 'VIP 5C', 'Free', null, '2017-04-03 07:15:52');
INSERT INTO `tables` VALUES ('46', '44', 'Free', null, '2017-02-25 12:45:33');
INSERT INTO `tables` VALUES ('47', '45', 'Free', null, '2017-03-08 10:40:40');
INSERT INTO `tables` VALUES ('48', '46', 'Free', null, '2017-03-08 10:02:06');
INSERT INTO `tables` VALUES ('49', '47', 'Free', null, '2017-03-22 20:42:21');
INSERT INTO `tables` VALUES ('50', '48', 'Free', null, '2017-03-15 19:15:01');
INSERT INTO `tables` VALUES ('51', '49', 'Free', null, '2017-04-05 19:24:05');
INSERT INTO `tables` VALUES ('52', '50', 'Free', null, '2017-04-08 08:40:45');
INSERT INTO `tables` VALUES ('53', '51', 'Free', null, '2017-04-05 09:05:16');
INSERT INTO `tables` VALUES ('54', '52', 'Free', null, null);
INSERT INTO `tables` VALUES ('55', '53', 'Free', null, '2017-03-09 19:53:47');
INSERT INTO `tables` VALUES ('56', '54', 'Free', null, '2017-02-18 15:35:24');
INSERT INTO `tables` VALUES ('57', '55', 'Free', null, '2017-04-05 08:54:46');
INSERT INTO `tables` VALUES ('58', '56', 'Free', null, '2017-04-06 07:29:43');
INSERT INTO `tables` VALUES ('59', '57', 'Free', null, '2017-04-08 10:07:58');
INSERT INTO `tables` VALUES ('60', '31', 'Busy', '2017-02-22 12:10:00', '2017-04-09 09:03:38');
INSERT INTO `tables` VALUES ('61', '1', 'Free', '2017-02-23 08:26:55', '2017-11-21 13:54:53');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` enum('SuperAdmin','Admin','Cashier') COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'super', '$2y$10$Zy1XTuyhK3zxTdkkmFicmOXpIEtRpwzoNTZPuna/L9i08C/Bp8aCC', 'ssZV35uZXXxqksSnqdZLZ9ywwRRAbp6132B7CDHOocFOspV6IJrsVZjLM9LH', 'SuperAdmin', '1', '2016-03-03 10:18:30', '2017-11-22 13:39:52');
INSERT INTO `users` VALUES ('2', 'admin', '$2y$10$OzvezM1JTpSyLjBnuxueg.NC9yDNovAGWSi1FFw6yZczE5y6tMpfO', 'hjCjjDeREQf1sc6DH4G6i8CDnOqB8BURraqoiUWXoO7HEk9bKC5MXH4pLRk7', 'Admin', '1', '2016-06-04 11:24:02', '2017-11-24 00:43:43');
INSERT INTO `users` VALUES ('3', 'cashier', '$2y$10$RGlUQWowwJ8ZCNcll9ByN.rvjp2ZN7HRMonM6wrF5T2ubIXLK8Sh.', '6cTOA4h9y63bRd6eMB8kkeTrxHMpZypsGzKLqQdMzhRnGqOA9e0w4bGol3Lm', 'Cashier', '1', '2016-06-04 11:24:02', '2017-11-24 00:43:51');
