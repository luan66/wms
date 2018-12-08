/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_3306
Source Server Version : 50525
Source Host           : 127.0.0.1:3306
Source Database       : wms

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2018-12-08 15:28:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', '苹果', 'Apple');
INSERT INTO `brand` VALUES ('2', '华为', 'HUAWEI');
INSERT INTO `brand` VALUES ('3', '小米', 'MI');
INSERT INTO `brand` VALUES ('4', '锤子', 'SMARTISAN');
INSERT INTO `brand` VALUES ('5', '360', '360');
INSERT INTO `brand` VALUES ('6', '菲尔可', 'FILCO');
INSERT INTO `brand` VALUES ('7', '西部数据', 'WD');
INSERT INTO `brand` VALUES ('8', '闪迪', 'SANDISK');
INSERT INTO `brand` VALUES ('9', '斯伯丁', 'SPALDING');

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('1', '郑州客户', 'XMG_JAVA', '123');
INSERT INTO `client` VALUES ('2', '北京客户', 'XMG_IOS', '123');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '总经办', 'General Deparment');
INSERT INTO `department` VALUES ('2', '人力资源部', 'Human Resources Department');
INSERT INTO `department` VALUES ('3', '采购部', 'Order Department');
INSERT INTO `department` VALUES ('4', '仓储部', 'Warehousing Department');
INSERT INTO `department` VALUES ('5', '财务部', 'Finance Department');
INSERT INTO `department` VALUES ('6', '技术部', 'Technolog Department ');
INSERT INTO `department` VALUES ('7', '行政部', 'Admin Department ');

-- ----------------------------
-- Table structure for depot
-- ----------------------------
DROP TABLE IF EXISTS `depot`;
CREATE TABLE `depot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of depot
-- ----------------------------
INSERT INTO `depot` VALUES ('1', '天河区1号仓', '天河区');
INSERT INTO `depot` VALUES ('2', '白云区2号仓', '白云区');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `admin` bit(1) DEFAULT NULL,
  `dept_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', 'admin', 'b7fb5f77d7c3efd9358ea1c55bb74734', 'admin@abc.com', '20', '', '7');
INSERT INTO `employee` VALUES ('2', '赵总', 'C4CA4238A0B923820DCC509A6F75849B', 'xx@xx.com', '35', '\0', '1');
INSERT INTO `employee` VALUES ('3', '赵一明', 'C4CA4238A0B923820DCC509A6F75849B', 'xx@xx.com', '25', '\0', '1');
INSERT INTO `employee` VALUES ('4', '钱总', 'C4CA4238A0B923820DCC509A6F75849B', 'xx@xx.com', '35', '\0', '2');
INSERT INTO `employee` VALUES ('5', '钱二明', 'C4CA4238A0B923820DCC509A6F75849B', 'xx@xx.com', '25', '\0', '2');
INSERT INTO `employee` VALUES ('6', '孙总', 'C4CA4238A0B923820DCC509A6F75849B', 'xx@xx.com', '35', '\0', '3');
INSERT INTO `employee` VALUES ('7', '孙三明', 'C4CA4238A0B923820DCC509A6F75849B', 'xx@xx.com', '25', '\0', '3');
INSERT INTO `employee` VALUES ('8', '李总', 'C4CA4238A0B923820DCC509A6F75849B', 'xx@xx.com', '35', '\0', '4');
INSERT INTO `employee` VALUES ('9', '李四明', 'C4CA4238A0B923820DCC509A6F75849B', 'xx@xx.com', '25', '\0', '4');
INSERT INTO `employee` VALUES ('10', '周总', 'C4CA4238A0B923820DCC509A6F75849B', 'xx@xx.com', '35', '\0', '5');
INSERT INTO `employee` VALUES ('11', '周五明', 'C4CA4238A0B923820DCC509A6F75849B', 'xx@xx.com', '25', '\0', '5');
INSERT INTO `employee` VALUES ('12', '吴总', 'C4CA4238A0B923820DCC509A6F75849B', 'xx@xx.com', '35', '\0', '6');
INSERT INTO `employee` VALUES ('13', '吴六明', 'C4CA4238A0B923820DCC509A6F75849B', 'xx@xx.com', '25', '\0', '6');
INSERT INTO `employee` VALUES ('14', '郑总', 'C4CA4238A0B923820DCC509A6F75849B', 'xx@xx.com', '35', '\0', '7');
INSERT INTO `employee` VALUES ('15', '郑七明', 'C4CA4238A0B923820DCC509A6F75849B', 'xx@xx.com', '25', '\0', '7');
INSERT INTO `employee` VALUES ('16', '孙四明', 'C4CA4238A0B923820DCC509A6F75849B', 'xx@xx.com', '25', '\0', '3');
INSERT INTO `employee` VALUES ('17', '孙五明', 'C4CA4238A0B923820DCC509A6F75849B', 'xx@xx.com', '25', '\0', '3');
INSERT INTO `employee` VALUES ('18', '李五明', 'C4CA4238A0B923820DCC509A6F75849B', 'xx@xx.com', '25', '\0', '4');
INSERT INTO `employee` VALUES ('19', '李六明', 'C4CA4238A0B923820DCC509A6F75849B', 'xx@xx.com', '25', '\0', '4');

-- ----------------------------
-- Table structure for employee_role
-- ----------------------------
DROP TABLE IF EXISTS `employee_role`;
CREATE TABLE `employee_role` (
  `employee_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_role
-- ----------------------------
INSERT INTO `employee_role` VALUES ('4', '1');

-- ----------------------------
-- Table structure for orderbill
-- ----------------------------
DROP TABLE IF EXISTS `orderbill`;
CREATE TABLE `orderbill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) DEFAULT NULL,
  `vdate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `totalAmount` decimal(19,2) DEFAULT NULL,
  `totalNumber` decimal(19,2) DEFAULT NULL,
  `auditTime` datetime DEFAULT NULL,
  `inputTime` datetime DEFAULT NULL,
  `inputUser_id` bigint(20) DEFAULT NULL,
  `auditor_id` bigint(20) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderbill
-- ----------------------------
INSERT INTO `orderbill` VALUES ('1', '001', '2016-01-01 00:00:00', '1', '646500.00', '600.00', '2016-08-19 21:31:19', '2016-08-19 20:59:07', '7', '1', '1');
INSERT INTO `orderbill` VALUES ('2', '002', '2016-01-11 00:00:00', '1', '1420800.00', '720.00', '2016-08-19 21:31:23', '2016-08-19 21:01:08', '16', '1', '2');
INSERT INTO `orderbill` VALUES ('3', '003', '2016-01-21 00:00:00', '1', '896500.00', '650.00', '2016-08-19 21:31:27', '2016-08-19 21:04:14', '17', '1', '3');
INSERT INTO `orderbill` VALUES ('4', '004', '2016-02-05 00:00:00', '1', '1116500.00', '600.00', '2016-08-31 17:23:53', '2016-08-19 21:07:24', '7', '1', '1');
INSERT INTO `orderbill` VALUES ('5', '005', '2016-02-15 00:00:00', '0', '645000.00', '500.00', null, '2016-08-19 21:09:32', '16', null, '2');
INSERT INTO `orderbill` VALUES ('6', '006', '2016-02-25 00:00:00', '1', '1001500.00', '550.00', '2017-08-30 17:40:15', '2016-08-19 21:11:58', '7', '1', '3');
INSERT INTO `orderbill` VALUES ('7', 'A', '2017-08-22 00:00:00', '1', '130000.00', '500.00', '2017-08-30 17:40:51', '2017-08-30 17:08:59', '1', '1', '1');

-- ----------------------------
-- Table structure for orderbillitem
-- ----------------------------
DROP TABLE IF EXISTS `orderbillitem`;
CREATE TABLE `orderbillitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `costPrice` decimal(19,2) DEFAULT NULL,
  `number` decimal(19,2) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `bill_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderbillitem
-- ----------------------------
INSERT INTO `orderbillitem` VALUES ('1', '200.00', '50.00', '10000.00', '', '1', '1');
INSERT INTO `orderbillitem` VALUES ('2', '300.00', '50.00', '15000.00', '', '2', '1');
INSERT INTO `orderbillitem` VALUES ('3', '800.00', '50.00', '40000.00', '', '3', '1');
INSERT INTO `orderbillitem` VALUES ('4', '2000.00', '50.00', '100000.00', '', '4', '1');
INSERT INTO `orderbillitem` VALUES ('5', '600.00', '50.00', '30000.00', '', '5', '1');
INSERT INTO `orderbillitem` VALUES ('6', '600.00', '50.00', '30000.00', '', '6', '1');
INSERT INTO `orderbillitem` VALUES ('7', '2000.00', '50.00', '100000.00', '', '7', '1');
INSERT INTO `orderbillitem` VALUES ('8', '800.00', '50.00', '40000.00', '', '8', '1');
INSERT INTO `orderbillitem` VALUES ('9', '5000.00', '50.00', '250000.00', '', '9', '1');
INSERT INTO `orderbillitem` VALUES ('10', '80.00', '50.00', '4000.00', '', '12', '1');
INSERT INTO `orderbillitem` VALUES ('11', '350.00', '50.00', '17500.00', '', '14', '1');
INSERT INTO `orderbillitem` VALUES ('12', '200.00', '50.00', '10000.00', '', '16', '1');
INSERT INTO `orderbillitem` VALUES ('13', '7000.00', '60.00', '420000.00', '', '20', '2');
INSERT INTO `orderbillitem` VALUES ('14', '2500.00', '60.00', '150000.00', '', '19', '2');
INSERT INTO `orderbillitem` VALUES ('15', '8000.00', '60.00', '480000.00', '', '18', '2');
INSERT INTO `orderbillitem` VALUES ('16', '600.00', '60.00', '36000.00', '', '5', '2');
INSERT INTO `orderbillitem` VALUES ('17', '200.00', '60.00', '12000.00', '', '1', '2');
INSERT INTO `orderbillitem` VALUES ('18', '800.00', '60.00', '48000.00', '', '8', '2');
INSERT INTO `orderbillitem` VALUES ('19', '600.00', '60.00', '36000.00', '', '6', '2');
INSERT INTO `orderbillitem` VALUES ('20', '80.00', '60.00', '4800.00', '', '12', '2');
INSERT INTO `orderbillitem` VALUES ('21', '2000.00', '60.00', '120000.00', '', '4', '2');
INSERT INTO `orderbillitem` VALUES ('22', '200.00', '60.00', '12000.00', '', '16', '2');
INSERT INTO `orderbillitem` VALUES ('23', '1500.00', '60.00', '90000.00', '', '15', '2');
INSERT INTO `orderbillitem` VALUES ('24', '200.00', '60.00', '12000.00', '', '10', '2');
INSERT INTO `orderbillitem` VALUES ('25', '200.00', '50.00', '10000.00', '', '10', '3');
INSERT INTO `orderbillitem` VALUES ('26', '600.00', '50.00', '30000.00', '', '5', '3');
INSERT INTO `orderbillitem` VALUES ('27', '2000.00', '50.00', '100000.00', '', '4', '3');
INSERT INTO `orderbillitem` VALUES ('28', '200.00', '50.00', '10000.00', '', '1', '3');
INSERT INTO `orderbillitem` VALUES ('29', '800.00', '50.00', '40000.00', '', '3', '3');
INSERT INTO `orderbillitem` VALUES ('30', '80.00', '50.00', '4000.00', '', '12', '3');
INSERT INTO `orderbillitem` VALUES ('31', '500.00', '50.00', '25000.00', '', '13', '3');
INSERT INTO `orderbillitem` VALUES ('32', '1500.00', '50.00', '75000.00', '', '15', '3');
INSERT INTO `orderbillitem` VALUES ('33', '200.00', '50.00', '10000.00', '', '16', '3');
INSERT INTO `orderbillitem` VALUES ('34', '2500.00', '50.00', '125000.00', '', '19', '3');
INSERT INTO `orderbillitem` VALUES ('35', '7000.00', '50.00', '350000.00', '', '20', '3');
INSERT INTO `orderbillitem` VALUES ('36', '350.00', '50.00', '17500.00', '', '14', '3');
INSERT INTO `orderbillitem` VALUES ('37', '2000.00', '50.00', '100000.00', '', '11', '3');
INSERT INTO `orderbillitem` VALUES ('38', '2000.00', '50.00', '100000.00', '', '4', '4');
INSERT INTO `orderbillitem` VALUES ('39', '200.00', '50.00', '10000.00', '', '1', '4');
INSERT INTO `orderbillitem` VALUES ('40', '600.00', '50.00', '30000.00', '', '6', '4');
INSERT INTO `orderbillitem` VALUES ('41', '80.00', '50.00', '4000.00', '', '12', '4');
INSERT INTO `orderbillitem` VALUES ('42', '350.00', '50.00', '17500.00', '', '14', '4');
INSERT INTO `orderbillitem` VALUES ('43', '7000.00', '50.00', '350000.00', '', '20', '4');
INSERT INTO `orderbillitem` VALUES ('44', '2500.00', '50.00', '125000.00', '', '19', '4');
INSERT INTO `orderbillitem` VALUES ('45', '6000.00', '50.00', '300000.00', '', '17', '4');
INSERT INTO `orderbillitem` VALUES ('46', '200.00', '50.00', '10000.00', '', '10', '4');
INSERT INTO `orderbillitem` VALUES ('47', '600.00', '50.00', '30000.00', '', '5', '4');
INSERT INTO `orderbillitem` VALUES ('48', '800.00', '50.00', '40000.00', '', '8', '4');
INSERT INTO `orderbillitem` VALUES ('49', '2000.00', '50.00', '100000.00', '', '7', '4');
INSERT INTO `orderbillitem` VALUES ('50', '200.00', '50.00', '10000.00', '', '1', '5');
INSERT INTO `orderbillitem` VALUES ('51', '600.00', '50.00', '30000.00', '', '5', '5');
INSERT INTO `orderbillitem` VALUES ('52', '800.00', '50.00', '40000.00', '', '8', '5');
INSERT INTO `orderbillitem` VALUES ('53', '5000.00', '50.00', '250000.00', '', '9', '5');
INSERT INTO `orderbillitem` VALUES ('54', '500.00', '50.00', '25000.00', '', '13', '5');
INSERT INTO `orderbillitem` VALUES ('55', '200.00', '50.00', '10000.00', '1', '16', '5');
INSERT INTO `orderbillitem` VALUES ('56', '2500.00', '50.00', '125000.00', '1', '19', '5');
INSERT INTO `orderbillitem` VALUES ('57', '800.00', '50.00', '40000.00', '1', '3', '5');
INSERT INTO `orderbillitem` VALUES ('58', '2000.00', '50.00', '100000.00', '1', '7', '5');
INSERT INTO `orderbillitem` VALUES ('59', '300.00', '50.00', '15000.00', '1', '2', '5');
INSERT INTO `orderbillitem` VALUES ('75', '200.00', '200.00', '40000.00', '12', '1', '7');
INSERT INTO `orderbillitem` VALUES ('76', '300.00', '300.00', '90000.00', '12', '2', '7');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `expression` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('64', '部门列表', 'com._520it.wms.web.controller.DepartmentController:list');
INSERT INTO `permission` VALUES ('65', '部门删除', 'com._520it.wms.web.controller.DepartmentController:delete');
INSERT INTO `permission` VALUES ('66', '部门编辑', 'com._520it.wms.web.controller.DepartmentController:input');
INSERT INTO `permission` VALUES ('67', '部门保存或更新', 'com._520it.wms.web.controller.DepartmentController:saveOrUpdate');
INSERT INTO `permission` VALUES ('68', '员工列表', 'com._520it.wms.web.controller.EmployeeController:list');
INSERT INTO `permission` VALUES ('69', '员工删除', 'com._520it.wms.web.controller.EmployeeController:delete');
INSERT INTO `permission` VALUES ('70', '员工编辑', 'com._520it.wms.web.controller.EmployeeController:input');
INSERT INTO `permission` VALUES ('71', '员工保存或更新', 'com._520it.wms.web.controller.EmployeeController:saveOrUpdate');
INSERT INTO `permission` VALUES ('72', '员工批量删除', 'com._520it.wms.web.controller.EmployeeController:batchDelete');
INSERT INTO `permission` VALUES ('73', '权限列表', 'com._520it.wms.web.controller.PermissionController:list');
INSERT INTO `permission` VALUES ('74', '权限删除', 'com._520it.wms.web.controller.PermissionController:delete');
INSERT INTO `permission` VALUES ('75', '权限加载', 'com._520it.wms.web.controller.PermissionController:reload');
INSERT INTO `permission` VALUES ('76', '角色列表', 'com._520it.wms.web.controller.RoleController:list');
INSERT INTO `permission` VALUES ('77', '角色删除', 'com._520it.wms.web.controller.RoleController:delete');
INSERT INTO `permission` VALUES ('78', '角色编辑', 'com._520it.wms.web.controller.RoleController:input');
INSERT INTO `permission` VALUES ('79', '角色保存或更新', 'com._520it.wms.web.controller.RoleController:saveOrUpdate');
INSERT INTO `permission` VALUES ('80', '品牌列表', 'com._520it.wms.web.controller.BrandController:list');
INSERT INTO `permission` VALUES ('81', '品牌删除', 'com._520it.wms.web.controller.BrandController:delete');
INSERT INTO `permission` VALUES ('82', '品牌编辑', 'com._520it.wms.web.controller.BrandController:input');
INSERT INTO `permission` VALUES ('83', '品牌保存或更新', 'com._520it.wms.web.controller.BrandController:saveOrUpdate');
INSERT INTO `permission` VALUES ('84', '订货报表', 'com._520it.wms.web.controller.ChartController:orderBillChart');
INSERT INTO `permission` VALUES ('85', '销售报表', 'com._520it.wms.web.controller.ChartController:saleChart');
INSERT INTO `permission` VALUES ('86', '客户列表', 'com._520it.wms.web.controller.ClientController:list');
INSERT INTO `permission` VALUES ('87', '客户删除', 'com._520it.wms.web.controller.ClientController:delete');
INSERT INTO `permission` VALUES ('88', '客户编辑', 'com._520it.wms.web.controller.ClientController:input');
INSERT INTO `permission` VALUES ('89', '客户保存或更新', 'com._520it.wms.web.controller.ClientController:saveOrUpdate');
INSERT INTO `permission` VALUES ('90', '仓库列表', 'com._520it.wms.web.controller.DepotController:list');
INSERT INTO `permission` VALUES ('91', '仓库删除', 'com._520it.wms.web.controller.DepotController:delete');
INSERT INTO `permission` VALUES ('92', '仓库编辑', 'com._520it.wms.web.controller.DepotController:input');
INSERT INTO `permission` VALUES ('93', '仓库保存或更新', 'com._520it.wms.web.controller.DepotController:saveOrUpdate');
INSERT INTO `permission` VALUES ('94', '采购订单列表', 'com._520it.wms.web.controller.OrderBillController:list');
INSERT INTO `permission` VALUES ('95', '采购订单删除', 'com._520it.wms.web.controller.OrderBillController:delete');
INSERT INTO `permission` VALUES ('96', '采购订单编辑', 'com._520it.wms.web.controller.OrderBillController:input');
INSERT INTO `permission` VALUES ('97', '采购订单保存/更新', 'com._520it.wms.web.controller.OrderBillController:saveOrUpdate');
INSERT INTO `permission` VALUES ('98', '采购订单查看', 'com._520it.wms.web.controller.OrderBillController:view');
INSERT INTO `permission` VALUES ('99', '采购订单审核', 'com._520it.wms.web.controller.OrderBillController:audit');
INSERT INTO `permission` VALUES ('100', '货品列表', 'com._520it.wms.web.controller.ProductController:list');
INSERT INTO `permission` VALUES ('101', '货品删除', 'com._520it.wms.web.controller.ProductController:delete');
INSERT INTO `permission` VALUES ('102', '货品编辑', 'com._520it.wms.web.controller.ProductController:input');
INSERT INTO `permission` VALUES ('103', '货品保存或更新', 'com._520it.wms.web.controller.ProductController:saveOrUpdate');
INSERT INTO `permission` VALUES ('104', '及时库存', 'com._520it.wms.web.controller.ProductStockController:list');
INSERT INTO `permission` VALUES ('105', '到货入库单列表', 'com._520it.wms.web.controller.StockIncomeBillController:list');
INSERT INTO `permission` VALUES ('106', '到货入库单删除', 'com._520it.wms.web.controller.StockIncomeBillController:delete');
INSERT INTO `permission` VALUES ('107', '到货入库单编辑', 'com._520it.wms.web.controller.StockIncomeBillController:input');
INSERT INTO `permission` VALUES ('108', '到货入库单保存/更新', 'com._520it.wms.web.controller.StockIncomeBillController:saveOrUpdate');
INSERT INTO `permission` VALUES ('109', '到货入库单查看', 'com._520it.wms.web.controller.StockIncomeBillController:view');
INSERT INTO `permission` VALUES ('110', '到货入库单审核', 'com._520it.wms.web.controller.StockIncomeBillController:audit');
INSERT INTO `permission` VALUES ('111', '销售出库单列表', 'com._520it.wms.web.controller.StockOutcomeBillController:list');
INSERT INTO `permission` VALUES ('112', '销售出库单删除', 'com._520it.wms.web.controller.StockOutcomeBillController:delete');
INSERT INTO `permission` VALUES ('113', '销售出库单编辑', 'com._520it.wms.web.controller.StockOutcomeBillController:input');
INSERT INTO `permission` VALUES ('114', '销售出库单保存/更新', 'com._520it.wms.web.controller.StockOutcomeBillController:saveOrUpdate');
INSERT INTO `permission` VALUES ('115', '销售出库单查看', 'com._520it.wms.web.controller.StockOutcomeBillController:view');
INSERT INTO `permission` VALUES ('116', '销售出库单审核', 'com._520it.wms.web.controller.StockOutcomeBillController:audit');
INSERT INTO `permission` VALUES ('117', '供应商列表', 'com._520it.wms.web.controller.SupplierController:list');
INSERT INTO `permission` VALUES ('118', '供应商删除', 'com._520it.wms.web.controller.SupplierController:delete');
INSERT INTO `permission` VALUES ('119', '供应商编辑', 'com._520it.wms.web.controller.SupplierController:input');
INSERT INTO `permission` VALUES ('120', '供应商保存或更新', 'com._520it.wms.web.controller.SupplierController:saveOrUpdate');
INSERT INTO `permission` VALUES ('121', '系统菜单列表', 'com._520it.wms.web.controller.SystemMenuController:list');
INSERT INTO `permission` VALUES ('122', '系统菜单删除', 'com._520it.wms.web.controller.SystemMenuController:delete');
INSERT INTO `permission` VALUES ('123', '系统菜单编辑', 'com._520it.wms.web.controller.SystemMenuController:input');
INSERT INTO `permission` VALUES ('124', '系统菜单保存/更新', 'com._520it.wms.web.controller.SystemMenuController:saveOrUpdate');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `costPrice` decimal(19,2) DEFAULT NULL,
  `salePrice` decimal(19,2) DEFAULT NULL,
  `imagePath` varchar(255) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `brandName` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1td6gorl25rsvufiiive2svlx` (`brand_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '360儿童手表', '001', '200.00', '400.00', '/upload/1e0fceec-6336-4ee8-9546-254fb7d42ca3.jpg', '360儿童手表 巴迪龙儿童手表5 W563 360儿童卫士 智能彩屏电话手表 静谧蓝', '5', '360');
INSERT INTO `product` VALUES ('2', '360智能摄像机', '002', '300.00', '500.00', '/upload/eba39186-e82b-4fd0-8adf-4b88b2f4dedf.jpg', '360智能摄像机夜视版 D503 小水滴 家用网络摄像机 无线WiFi摄像头 手机远程监控 夜视版标', '5', '360');
INSERT INTO `product` VALUES ('3', '360N4S手机', '003', '800.00', '900.00', '/upload/8a0f3bf1-3ee5-431e-9475-8de604933013.jpg', '360n4s手机 流光金 全网通4G(4G RAM+32G ROM)标准版', '5', '360');
INSERT INTO `product` VALUES ('4', '锤子(smartisan) T2手机', '004', '2000.00', '2800.00', '/upload/70704b20-8661-4fd8-821e-8e2f0605636c.jpg', '锤子(smartisan) T2 4G手机 黑色 全网通(3G RAM+16G ROM)标配', '4', '锤子');
INSERT INTO `product` VALUES ('5', '锤子坚果手机', '005', '600.00', '800.00', '/upload/ba5ecc4c-ce9f-4dc0-b141-0dfe2c5f0adc.jpg', '锤子坚果手机4G手机 红色 全网通(2G RAM+32G ROM)标配', '4', '锤子');
INSERT INTO `product` VALUES ('6', '斐尔可（FILCO）机械键盘', '006', '600.00', '1000.00', '/upload/10676642-22c0-4be3-9efa-8a25edb7dc67.jpg', '斐尔可（FILCO）「87圣手二代」机械键盘 黑色 茶轴 ', '6', '菲尔可');
INSERT INTO `product` VALUES ('7', '华为荣耀V8手机', '007', '2000.00', '2500.00', '/upload/4f49a852-b70b-4354-b771-6b39e987ff3f.jpg', '华为 荣耀 V8 4GB+32GB 铂光金 移动联通4G手机 双卡双待双通', '2', '华为');
INSERT INTO `product` VALUES ('8', '华为 手环B3 ', '008', '800.00', '1200.00', '/upload/6934febd-f63f-436b-ab7b-3bd83e263174.jpg', '华为 手环B3 (蓝牙耳机与智能手环结合+金属机身+触控屏幕+真皮腕带) 商务版 摩卡棕', '2', '华为');
INSERT INTO `product` VALUES ('9', '华为 MateBook 12英寸平板笔记本电脑', '009', '5000.00', '6500.00', '/upload/e4f6e5da-ca36-4e9d-a353-a84fbf877410.jpg', '华为 MateBook 12英寸平板二合一笔记本电脑 (Intel core m5 4G内存 128G存储', '2', '华为');
INSERT INTO `product` VALUES ('10', '华为盒子', '010', '200.00', '350.00', '/upload/2d0a679b-79ab-48d9-ba6b-cea538b9773f.jpg', '华为 MediaQ M330华为盒子真4K高清网络播放器带蓝牙增强版', '2', '华为');
INSERT INTO `product` VALUES ('11', '华为 P9手机', '011', '2000.00', '3500.00', '/upload/bd7c3020-b543-40da-ae73-7b2223308903.jpg', '华为 P9 全网通 3GB+32GB版 流光金 移动联通电信4G手机 双卡双待', '2', '华为');
INSERT INTO `product` VALUES ('12', '闪迪（SanDisk）至尊高速3.0U盘', '012', '80.00', '150.00', '/upload/2319866c-6023-4c4f-9d5b-1282ac4a80fe.jpg', '闪迪（SanDisk）至尊高速（CZ48） 256GB USB3.0 U盘 读100MBs 写40MBs', '8', '闪迪');
INSERT INTO `product` VALUES ('13', '斯伯丁NBA篮球', '013', '500.00', '800.00', '/upload/fbca9b1b-63b6-4be3-b793-a805bd2b7ff1.jpg', '斯伯丁 NBA金色经典系列 耐磨防滑 室内外兼用 篮球', '9', '斯伯丁');
INSERT INTO `product` VALUES ('14', '西部数据（WD）移动硬盘', '014', '350.00', '500.00', '/upload/774daaf8-86e6-4d0b-b0a1-8044244f0220.jpg', '西部数据（WD）My Passport Ultra 升级版 1TB 2.5英寸 野莓红 移动硬盘', '7', '西部数据');
INSERT INTO `product` VALUES ('15', '小米(MI) 小米5手机', '015', '1500.00', '2000.00', '/upload/26c924f4-60ac-4d2d-b428-65ecdf9c25cb.jpg', '小米(MI) 小米5 全网通4G手机 双卡双待 黑色 尊享版(4G RAM+128G ROM) 标配', '3', '小米');
INSERT INTO `product` VALUES ('16', '小米（MI）蓝牙音箱', '016', '200.00', '250.00', '/upload/ca5a5d50-3f4a-4343-aabc-b5cbb597341c.jpg', '小米（MI）蓝牙音箱 音响 无线迷你便携音箱 车载音箱 支持SD卡 免提通话（蓝色）', '3', '小米');
INSERT INTO `product` VALUES ('17', '小米（MI）智能4K分体电视', '017', '6000.00', '8000.00', '/upload/e0d1a76d-87dd-4a15-90d1-56af1d3280f6.jpg', '小米（MI）L70M4-AA 70英寸 智能4K分体电视', '3', '小米');
INSERT INTO `product` VALUES ('18', '苹果Apple iMac 21.5英寸一体机(', '018', '8000.00', '11000.00', '/upload/848b9edb-1172-4abb-a6e2-284267475d01.jpg', 'Apple iMac 21.5英寸一体机(四核 Core i5 处理器8GB内存1TB存储Retina 4K屏).jpg', '1', '苹果');
INSERT INTO `product` VALUES ('19', '苹果Apple iPad Air 2 平板电脑 9', '019', '2500.00', '3500.00', '/upload/4b76d10e-f286-4048-842a-8f5bd18b75fe.jpg', 'Apple iPad Air 2 平板电脑 9.7英寸（64G WLAN版A8X 芯片Retina显示屏Touch ID技术 MH182CH）金色', '1', '苹果');
INSERT INTO `product` VALUES ('20', '苹果Apple MacBook 12英寸笔记本电脑 玫瑰金色', '020', '7000.00', '10000.00', '/upload/2ba88fd9-6f2e-478e-be32-d89294d4bada.jpg', 'Apple MacBook 12英寸笔记本电脑 玫瑰金色 256GB闪存', '1', '苹果');
INSERT INTO `product` VALUES ('28', '12', '12', '1.00', '1.00', '/upload/3e14bd3b-73d7-4d42-958a-74caae2539f6.jpg', '11122', '4', '锤子');

-- ----------------------------
-- Table structure for productstock
-- ----------------------------
DROP TABLE IF EXISTS `productstock`;
CREATE TABLE `productstock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price` decimal(19,2) DEFAULT NULL,
  `storeNumber` decimal(19,2) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `depot_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of productstock
-- ----------------------------
INSERT INTO `productstock` VALUES ('1', '200.00', '29.00', '5800.00', '1', '1');
INSERT INTO `productstock` VALUES ('2', '300.00', '49.00', '14700.00', '2', '1');
INSERT INTO `productstock` VALUES ('3', '800.00', '90.00', '72000.00', '3', '1');
INSERT INTO `productstock` VALUES ('4', '2000.00', '50.00', '100000.00', '4', '1');
INSERT INTO `productstock` VALUES ('5', '600.00', '80.00', '48000.00', '5', '1');
INSERT INTO `productstock` VALUES ('6', '600.00', '50.00', '30000.00', '6', '1');
INSERT INTO `productstock` VALUES ('7', '2000.00', '80.00', '160000.00', '7', '1');
INSERT INTO `productstock` VALUES ('8', '800.00', '50.00', '40000.00', '8', '1');
INSERT INTO `productstock` VALUES ('9', '200.00', '50.00', '10000.00', '10', '1');
INSERT INTO `productstock` VALUES ('10', '2000.00', '80.00', '160000.00', '11', '1');
INSERT INTO `productstock` VALUES ('11', '80.00', '60.00', '4800.00', '12', '1');
INSERT INTO `productstock` VALUES ('12', '350.00', '100.00', '35000.00', '14', '1');
INSERT INTO `productstock` VALUES ('13', '1500.00', '70.00', '105000.00', '15', '1');
INSERT INTO `productstock` VALUES ('14', '7000.00', '130.00', '910000.00', '20', '1');
INSERT INTO `productstock` VALUES ('15', '200.00', '30.00', '6000.00', '16', '1');
INSERT INTO `productstock` VALUES ('16', '7000.00', '20.00', '140000.00', '20', '2');
INSERT INTO `productstock` VALUES ('17', '2500.00', '50.00', '125000.00', '19', '2');
INSERT INTO `productstock` VALUES ('18', '200.00', '50.00', '10000.00', '16', '2');
INSERT INTO `productstock` VALUES ('19', '350.00', '20.00', '7000.00', '14', '2');
INSERT INTO `productstock` VALUES ('20', '600.00', '50.00', '30000.00', '6', '2');
INSERT INTO `productstock` VALUES ('21', '80.00', '20.00', '1600.00', '12', '2');
INSERT INTO `productstock` VALUES ('22', '2000.00', '20.00', '40000.00', '4', '2');
INSERT INTO `productstock` VALUES ('23', '800.00', '50.00', '40000.00', '3', '2');
INSERT INTO `productstock` VALUES ('24', '2000.00', '20.00', '40000.00', '7', '2');
INSERT INTO `productstock` VALUES ('25', '200.00', '20.00', '4000.00', '10', '2');
INSERT INTO `productstock` VALUES ('26', '500.00', '20.00', '10000.00', '13', '2');
INSERT INTO `productstock` VALUES ('27', '200.00', '50.00', '10000.00', '1', '2');
INSERT INTO `productstock` VALUES ('28', '300.00', '20.00', '6000.00', '2', '2');
INSERT INTO `productstock` VALUES ('29', '600.00', '50.00', '30000.00', '5', '2');
INSERT INTO `productstock` VALUES ('30', '1500.00', '20.00', '30000.00', '15', '2');
INSERT INTO `productstock` VALUES ('31', '2500.00', '80.00', '200000.00', '19', '1');
INSERT INTO `productstock` VALUES ('32', '500.00', '60.00', '30000.00', '13', '1');
INSERT INTO `productstock` VALUES ('33', '5000.00', '0.00', '0.00', '9', '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '人事管理', 'HR MGR');
INSERT INTO `role` VALUES ('2', '采购管理', 'ORDER MGR');
INSERT INTO `role` VALUES ('3', '仓储管理', 'WAREHOUSING MGR');
INSERT INTO `role` VALUES ('4', '行政部管理', 'Admin MGR');
INSERT INTO `role` VALUES ('9', 'A1', 'A1');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('1', '4');
INSERT INTO `role_menu` VALUES ('1', '5');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('9', '64');
INSERT INTO `role_permission` VALUES ('9', '65');
INSERT INTO `role_permission` VALUES ('9', '66');
INSERT INTO `role_permission` VALUES ('9', '67');
INSERT INTO `role_permission` VALUES ('1', '64');
INSERT INTO `role_permission` VALUES ('1', '65');
INSERT INTO `role_permission` VALUES ('1', '66');
INSERT INTO `role_permission` VALUES ('1', '67');
INSERT INTO `role_permission` VALUES ('1', '68');
INSERT INTO `role_permission` VALUES ('1', '69');
INSERT INTO `role_permission` VALUES ('1', '70');
INSERT INTO `role_permission` VALUES ('1', '71');
INSERT INTO `role_permission` VALUES ('1', '72');

-- ----------------------------
-- Table structure for saleaccount
-- ----------------------------
DROP TABLE IF EXISTS `saleaccount`;
CREATE TABLE `saleaccount` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vdate` datetime DEFAULT NULL,
  `number` decimal(19,2) DEFAULT NULL,
  `costPrice` decimal(19,2) DEFAULT NULL,
  `costAmount` decimal(19,2) DEFAULT NULL,
  `salePrice` decimal(19,2) DEFAULT NULL,
  `saleAmount` decimal(19,2) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `saleman_id` bigint(20) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of saleaccount
-- ----------------------------
INSERT INTO `saleaccount` VALUES ('29', '2016-07-11 00:00:00', '30.00', '300.00', '9000.00', '500.00', '15000.00', '2', '1', '1');
INSERT INTO `saleaccount` VALUES ('30', '2016-07-11 00:00:00', '30.00', '7000.00', '210000.00', '10000.00', '300000.00', '20', '1', '1');
INSERT INTO `saleaccount` VALUES ('31', '2016-07-11 00:00:00', '30.00', '350.00', '10500.00', '500.00', '15000.00', '14', '1', '1');
INSERT INTO `saleaccount` VALUES ('32', '2016-07-11 00:00:00', '30.00', '2000.00', '60000.00', '2800.00', '84000.00', '4', '1', '1');
INSERT INTO `saleaccount` VALUES ('33', '2016-07-11 00:00:00', '30.00', '2000.00', '60000.00', '2500.00', '75000.00', '7', '1', '1');
INSERT INTO `saleaccount` VALUES ('34', '2016-07-11 00:00:00', '30.00', '200.00', '6000.00', '350.00', '10500.00', '10', '1', '1');
INSERT INTO `saleaccount` VALUES ('35', '2016-07-11 00:00:00', '30.00', '500.00', '15000.00', '800.00', '24000.00', '13', '1', '1');
INSERT INTO `saleaccount` VALUES ('36', '2016-07-11 00:00:00', '30.00', '1500.00', '45000.00', '2000.00', '60000.00', '15', '1', '1');
INSERT INTO `saleaccount` VALUES ('37', '2016-07-11 00:00:00', '30.00', '80.00', '2400.00', '150.00', '4500.00', '12', '1', '1');
INSERT INTO `saleaccount` VALUES ('74', '2016-07-01 00:00:00', '30.00', '200.00', '6000.00', '400.00', '12000.00', '1', '1', '1');
INSERT INTO `saleaccount` VALUES ('75', '2016-07-01 00:00:00', '30.00', '2000.00', '60000.00', '2800.00', '84000.00', '4', '1', '1');
INSERT INTO `saleaccount` VALUES ('76', '2016-07-01 00:00:00', '30.00', '600.00', '18000.00', '1000.00', '30000.00', '6', '1', '1');
INSERT INTO `saleaccount` VALUES ('77', '2016-07-01 00:00:00', '30.00', '2000.00', '60000.00', '2500.00', '75000.00', '7', '1', '1');
INSERT INTO `saleaccount` VALUES ('78', '2016-07-01 00:00:00', '30.00', '2500.00', '75000.00', '3500.00', '105000.00', '19', '1', '1');
INSERT INTO `saleaccount` VALUES ('79', '2016-07-01 00:00:00', '30.00', '80.00', '2400.00', '150.00', '4500.00', '12', '1', '1');
INSERT INTO `saleaccount` VALUES ('80', '2016-07-01 00:00:00', '30.00', '800.00', '24000.00', '1200.00', '36000.00', '8', '1', '1');
INSERT INTO `saleaccount` VALUES ('81', '2016-07-01 00:00:00', '30.00', '200.00', '6000.00', '250.00', '7500.00', '16', '1', '1');
INSERT INTO `saleaccount` VALUES ('82', '2016-07-01 00:00:00', '30.00', '350.00', '10500.00', '500.00', '15000.00', '14', '1', '1');
INSERT INTO `saleaccount` VALUES ('83', '2016-07-15 00:00:00', '30.00', '7000.00', '210000.00', '10000.00', '300000.00', '20', '1', '2');
INSERT INTO `saleaccount` VALUES ('84', '2016-07-15 00:00:00', '30.00', '200.00', '6000.00', '400.00', '12000.00', '1', '1', '2');
INSERT INTO `saleaccount` VALUES ('85', '2016-07-15 00:00:00', '30.00', '2000.00', '60000.00', '2800.00', '84000.00', '4', '1', '2');
INSERT INTO `saleaccount` VALUES ('86', '2016-07-15 00:00:00', '30.00', '800.00', '24000.00', '1200.00', '36000.00', '8', '1', '2');
INSERT INTO `saleaccount` VALUES ('87', '2016-07-15 00:00:00', '30.00', '350.00', '10500.00', '500.00', '15000.00', '14', '1', '2');
INSERT INTO `saleaccount` VALUES ('88', '2016-07-15 00:00:00', '30.00', '200.00', '6000.00', '250.00', '7500.00', '16', '1', '2');
INSERT INTO `saleaccount` VALUES ('89', '2016-07-15 00:00:00', '30.00', '1500.00', '45000.00', '2000.00', '60000.00', '15', '1', '2');
INSERT INTO `saleaccount` VALUES ('90', '2016-07-15 00:00:00', '30.00', '5000.00', '150000.00', '6500.00', '195000.00', '9', '1', '2');
INSERT INTO `saleaccount` VALUES ('94', '2016-07-25 00:00:00', '20.00', '2000.00', '40000.00', '3500.00', '70000.00', '11', '9', '1');
INSERT INTO `saleaccount` VALUES ('95', '2016-07-25 00:00:00', '20.00', '200.00', '4000.00', '250.00', '5000.00', '16', '9', '1');
INSERT INTO `saleaccount` VALUES ('96', '2016-07-25 00:00:00', '20.00', '200.00', '4000.00', '400.00', '8000.00', '1', '9', '1');
INSERT INTO `saleaccount` VALUES ('97', '2016-07-25 00:00:00', '20.00', '800.00', '16000.00', '900.00', '18000.00', '3', '9', '1');
INSERT INTO `saleaccount` VALUES ('98', '2016-07-25 00:00:00', '30.00', '600.00', '18000.00', '800.00', '24000.00', '5', '9', '1');
INSERT INTO `saleaccount` VALUES ('99', '2016-07-25 00:00:00', '30.00', '600.00', '18000.00', '1000.00', '30000.00', '6', '9', '1');
INSERT INTO `saleaccount` VALUES ('100', '2016-07-25 00:00:00', '20.00', '80.00', '1600.00', '150.00', '3000.00', '12', '9', '1');
INSERT INTO `saleaccount` VALUES ('101', '2016-07-25 00:00:00', '20.00', '5000.00', '100000.00', '6500.00', '130000.00', '9', '9', '1');
INSERT INTO `saleaccount` VALUES ('102', '2017-08-31 14:19:40', '1.00', '200.00', '200.00', '400.00', '400.00', '1', '1', '1');
INSERT INTO `saleaccount` VALUES ('103', '2017-08-31 14:19:40', '1.00', '300.00', '300.00', '500.00', '500.00', '2', '1', '1');

-- ----------------------------
-- Table structure for stockincomebill
-- ----------------------------
DROP TABLE IF EXISTS `stockincomebill`;
CREATE TABLE `stockincomebill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) DEFAULT NULL,
  `vdate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `totalAmount` decimal(19,2) DEFAULT NULL,
  `totalNumber` decimal(19,2) DEFAULT NULL,
  `auditTime` datetime DEFAULT NULL,
  `inputTime` datetime DEFAULT NULL,
  `inputUser_id` bigint(20) DEFAULT NULL,
  `auditor_id` bigint(20) DEFAULT NULL,
  `depot_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stockincomebill
-- ----------------------------
INSERT INTO `stockincomebill` VALUES ('1', '001', '2016-05-05 00:00:00', '1', '931500.00', '750.00', '2016-08-19 21:27:47', '2016-08-19 21:15:48', '9', '1', '1');
INSERT INTO `stockincomebill` VALUES ('2', '002', '2016-05-15 00:00:00', '1', '941500.00', '750.00', '2016-08-19 21:27:48', '2016-08-19 21:21:52', '18', '1', '2');
INSERT INTO `stockincomebill` VALUES ('3', '003', '2016-06-10 00:00:00', '1', '1057800.00', '780.00', '2016-08-19 21:48:12', '2016-08-19 21:24:34', '19', '1', '1');
INSERT INTO `stockincomebill` VALUES ('4', '004', '2016-06-20 00:00:00', '0', '907800.00', '780.00', null, '2016-08-19 21:27:28', '19', null, '2');
INSERT INTO `stockincomebill` VALUES ('5', '005', '2016-06-30 00:00:00', '1', '917500.00', '300.00', '2016-08-19 21:50:51', '2016-08-19 21:50:45', '1', '1', '1');
INSERT INTO `stockincomebill` VALUES ('6', '11', '2017-08-18 00:00:00', '0', '5000.00', '20.00', null, '2017-08-30 19:47:28', '1', null, '1');

-- ----------------------------
-- Table structure for stockincomebillitem
-- ----------------------------
DROP TABLE IF EXISTS `stockincomebillitem`;
CREATE TABLE `stockincomebillitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `costPrice` decimal(19,2) DEFAULT NULL,
  `number` decimal(19,2) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `bill_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stockincomebillitem
-- ----------------------------
INSERT INTO `stockincomebillitem` VALUES ('16', '200.00', '50.00', '10000.00', '', '1', '1');
INSERT INTO `stockincomebillitem` VALUES ('17', '300.00', '50.00', '15000.00', '', '2', '1');
INSERT INTO `stockincomebillitem` VALUES ('18', '800.00', '50.00', '40000.00', '', '3', '1');
INSERT INTO `stockincomebillitem` VALUES ('19', '2000.00', '50.00', '100000.00', '', '4', '1');
INSERT INTO `stockincomebillitem` VALUES ('20', '600.00', '50.00', '30000.00', '', '5', '1');
INSERT INTO `stockincomebillitem` VALUES ('21', '600.00', '50.00', '30000.00', '', '6', '1');
INSERT INTO `stockincomebillitem` VALUES ('22', '2000.00', '50.00', '100000.00', '', '7', '1');
INSERT INTO `stockincomebillitem` VALUES ('23', '800.00', '50.00', '40000.00', '', '8', '1');
INSERT INTO `stockincomebillitem` VALUES ('24', '200.00', '50.00', '10000.00', '', '10', '1');
INSERT INTO `stockincomebillitem` VALUES ('25', '2000.00', '50.00', '100000.00', '', '11', '1');
INSERT INTO `stockincomebillitem` VALUES ('26', '80.00', '50.00', '4000.00', '', '12', '1');
INSERT INTO `stockincomebillitem` VALUES ('27', '350.00', '50.00', '17500.00', '', '14', '1');
INSERT INTO `stockincomebillitem` VALUES ('28', '1500.00', '50.00', '75000.00', '', '15', '1');
INSERT INTO `stockincomebillitem` VALUES ('29', '7000.00', '50.00', '350000.00', '', '20', '1');
INSERT INTO `stockincomebillitem` VALUES ('30', '200.00', '50.00', '10000.00', '', '16', '1');
INSERT INTO `stockincomebillitem` VALUES ('31', '7000.00', '50.00', '350000.00', '', '20', '2');
INSERT INTO `stockincomebillitem` VALUES ('32', '2500.00', '50.00', '125000.00', '', '19', '2');
INSERT INTO `stockincomebillitem` VALUES ('33', '200.00', '50.00', '10000.00', '', '16', '2');
INSERT INTO `stockincomebillitem` VALUES ('34', '350.00', '50.00', '17500.00', '', '14', '2');
INSERT INTO `stockincomebillitem` VALUES ('35', '600.00', '50.00', '30000.00', '', '6', '2');
INSERT INTO `stockincomebillitem` VALUES ('36', '80.00', '50.00', '4000.00', '', '12', '2');
INSERT INTO `stockincomebillitem` VALUES ('37', '2000.00', '50.00', '100000.00', '', '4', '2');
INSERT INTO `stockincomebillitem` VALUES ('38', '800.00', '50.00', '40000.00', '', '3', '2');
INSERT INTO `stockincomebillitem` VALUES ('39', '2000.00', '50.00', '100000.00', '', '7', '2');
INSERT INTO `stockincomebillitem` VALUES ('40', '200.00', '50.00', '10000.00', '', '10', '2');
INSERT INTO `stockincomebillitem` VALUES ('41', '500.00', '50.00', '25000.00', '', '13', '2');
INSERT INTO `stockincomebillitem` VALUES ('42', '200.00', '50.00', '10000.00', '', '1', '2');
INSERT INTO `stockincomebillitem` VALUES ('43', '300.00', '50.00', '15000.00', '', '2', '2');
INSERT INTO `stockincomebillitem` VALUES ('44', '600.00', '50.00', '30000.00', '', '5', '2');
INSERT INTO `stockincomebillitem` VALUES ('45', '1500.00', '50.00', '75000.00', '', '15', '2');
INSERT INTO `stockincomebillitem` VALUES ('46', '2500.00', '60.00', '150000.00', '', '19', '3');
INSERT INTO `stockincomebillitem` VALUES ('47', '7000.00', '60.00', '420000.00', '', '20', '3');
INSERT INTO `stockincomebillitem` VALUES ('48', '2000.00', '60.00', '120000.00', '', '4', '3');
INSERT INTO `stockincomebillitem` VALUES ('49', '200.00', '60.00', '12000.00', '', '1', '3');
INSERT INTO `stockincomebillitem` VALUES ('50', '600.00', '60.00', '36000.00', '', '5', '3');
INSERT INTO `stockincomebillitem` VALUES ('51', '600.00', '60.00', '36000.00', '', '6', '3');
INSERT INTO `stockincomebillitem` VALUES ('52', '2000.00', '60.00', '120000.00', '', '7', '3');
INSERT INTO `stockincomebillitem` VALUES ('53', '800.00', '60.00', '48000.00', '', '8', '3');
INSERT INTO `stockincomebillitem` VALUES ('54', '500.00', '60.00', '30000.00', '', '13', '3');
INSERT INTO `stockincomebillitem` VALUES ('55', '350.00', '60.00', '21000.00', '', '14', '3');
INSERT INTO `stockincomebillitem` VALUES ('56', '200.00', '60.00', '12000.00', '', '16', '3');
INSERT INTO `stockincomebillitem` VALUES ('57', '80.00', '60.00', '4800.00', '', '12', '3');
INSERT INTO `stockincomebillitem` VALUES ('58', '800.00', '60.00', '48000.00', '', '3', '3');
INSERT INTO `stockincomebillitem` VALUES ('59', '200.00', '60.00', '12000.00', '', '1', '4');
INSERT INTO `stockincomebillitem` VALUES ('60', '300.00', '60.00', '18000.00', '', '2', '4');
INSERT INTO `stockincomebillitem` VALUES ('61', '2000.00', '60.00', '120000.00', '', '4', '4');
INSERT INTO `stockincomebillitem` VALUES ('62', '600.00', '60.00', '36000.00', '', '5', '4');
INSERT INTO `stockincomebillitem` VALUES ('63', '600.00', '60.00', '36000.00', '', '6', '4');
INSERT INTO `stockincomebillitem` VALUES ('64', '800.00', '60.00', '48000.00', '', '8', '4');
INSERT INTO `stockincomebillitem` VALUES ('65', '2000.00', '60.00', '120000.00', '', '11', '4');
INSERT INTO `stockincomebillitem` VALUES ('66', '350.00', '60.00', '21000.00', '', '14', '4');
INSERT INTO `stockincomebillitem` VALUES ('67', '5000.00', '60.00', '300000.00', '', '9', '4');
INSERT INTO `stockincomebillitem` VALUES ('68', '2500.00', '60.00', '150000.00', '', '19', '4');
INSERT INTO `stockincomebillitem` VALUES ('69', '200.00', '60.00', '12000.00', '', '16', '4');
INSERT INTO `stockincomebillitem` VALUES ('70', '500.00', '60.00', '30000.00', '', '13', '4');
INSERT INTO `stockincomebillitem` VALUES ('71', '80.00', '60.00', '4800.00', '', '12', '4');
INSERT INTO `stockincomebillitem` VALUES ('72', '7000.00', '50.00', '350000.00', '', '20', '5');
INSERT INTO `stockincomebillitem` VALUES ('73', '2500.00', '50.00', '125000.00', '', '19', '5');
INSERT INTO `stockincomebillitem` VALUES ('74', '1500.00', '50.00', '75000.00', '', '15', '5');
INSERT INTO `stockincomebillitem` VALUES ('75', '350.00', '50.00', '17500.00', '', '14', '5');
INSERT INTO `stockincomebillitem` VALUES ('76', '5000.00', '50.00', '250000.00', '', '9', '5');
INSERT INTO `stockincomebillitem` VALUES ('77', '2000.00', '50.00', '100000.00', '', '11', '5');
INSERT INTO `stockincomebillitem` VALUES ('78', '200.00', '1.00', '200.00', '11', '1', '6');
INSERT INTO `stockincomebillitem` VALUES ('79', '300.00', '1.00', '300.00', '11', '2', '6');
INSERT INTO `stockincomebillitem` VALUES ('80', '200.00', '10.00', '2000.00', '111', '1', '6');
INSERT INTO `stockincomebillitem` VALUES ('81', '300.00', '10.00', '3000.00', '111', '2', '6');

-- ----------------------------
-- Table structure for stockoutcomebill
-- ----------------------------
DROP TABLE IF EXISTS `stockoutcomebill`;
CREATE TABLE `stockoutcomebill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) DEFAULT NULL,
  `vdate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `totalAmount` decimal(19,2) DEFAULT NULL,
  `totalNumber` decimal(19,2) DEFAULT NULL,
  `auditTime` datetime DEFAULT NULL,
  `inputTime` datetime DEFAULT NULL,
  `inputUser_id` bigint(20) DEFAULT NULL,
  `auditor_id` bigint(20) DEFAULT NULL,
  `depot_id` bigint(20) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stockoutcomebill
-- ----------------------------
INSERT INTO `stockoutcomebill` VALUES ('1', '001', '2016-07-01 00:00:00', '1', '369000.00', '270.00', '2016-08-19 21:48:32', '2016-08-19 21:33:55', '1', '1', '1', '1');
INSERT INTO `stockoutcomebill` VALUES ('2', '002', '2016-07-11 00:00:00', '1', '588000.00', '270.00', '2016-08-19 21:43:41', '2016-08-19 21:36:20', '1', '1', '2', '1');
INSERT INTO `stockoutcomebill` VALUES ('3', '003', '2016-07-25 00:00:00', '1', '288000.00', '180.00', '2016-08-31 17:24:10', '2016-08-19 21:38:26', '9', '1', '1', '1');
INSERT INTO `stockoutcomebill` VALUES ('4', '004', '2016-07-15 00:00:00', '1', '709500.00', '240.00', '2016-08-19 21:51:03', '2016-08-19 21:46:19', '1', '1', '1', '2');
INSERT INTO `stockoutcomebill` VALUES ('5', '005', '2016-08-05 00:00:00', '0', '312000.00', '120.00', null, '2016-08-19 21:52:40', '18', null, '2', '2');
INSERT INTO `stockoutcomebill` VALUES ('6', '1', '2017-08-31 00:00:00', '1', '900.00', '2.00', '2017-08-31 14:19:40', '2017-08-31 12:13:03', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for stockoutcomebillitem
-- ----------------------------
DROP TABLE IF EXISTS `stockoutcomebillitem`;
CREATE TABLE `stockoutcomebillitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `salePrice` decimal(19,2) DEFAULT NULL,
  `number` decimal(19,2) DEFAULT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `bill_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stockoutcomebillitem
-- ----------------------------
INSERT INTO `stockoutcomebillitem` VALUES ('1', '400.00', '30.00', '12000.00', '', '1', '1');
INSERT INTO `stockoutcomebillitem` VALUES ('2', '2800.00', '30.00', '84000.00', '', '4', '1');
INSERT INTO `stockoutcomebillitem` VALUES ('3', '1000.00', '30.00', '30000.00', '', '6', '1');
INSERT INTO `stockoutcomebillitem` VALUES ('4', '2500.00', '30.00', '75000.00', '', '7', '1');
INSERT INTO `stockoutcomebillitem` VALUES ('5', '3500.00', '30.00', '105000.00', '', '19', '1');
INSERT INTO `stockoutcomebillitem` VALUES ('6', '150.00', '30.00', '4500.00', '', '12', '1');
INSERT INTO `stockoutcomebillitem` VALUES ('7', '1200.00', '30.00', '36000.00', '', '8', '1');
INSERT INTO `stockoutcomebillitem` VALUES ('8', '250.00', '30.00', '7500.00', '', '16', '1');
INSERT INTO `stockoutcomebillitem` VALUES ('9', '500.00', '30.00', '15000.00', '', '14', '1');
INSERT INTO `stockoutcomebillitem` VALUES ('10', '500.00', '30.00', '15000.00', '', '2', '2');
INSERT INTO `stockoutcomebillitem` VALUES ('11', '10000.00', '30.00', '300000.00', '', '20', '2');
INSERT INTO `stockoutcomebillitem` VALUES ('12', '500.00', '30.00', '15000.00', '', '14', '2');
INSERT INTO `stockoutcomebillitem` VALUES ('13', '2800.00', '30.00', '84000.00', '', '4', '2');
INSERT INTO `stockoutcomebillitem` VALUES ('14', '2500.00', '30.00', '75000.00', '', '7', '2');
INSERT INTO `stockoutcomebillitem` VALUES ('15', '350.00', '30.00', '10500.00', '', '10', '2');
INSERT INTO `stockoutcomebillitem` VALUES ('16', '800.00', '30.00', '24000.00', '', '13', '2');
INSERT INTO `stockoutcomebillitem` VALUES ('17', '2000.00', '30.00', '60000.00', '', '15', '2');
INSERT INTO `stockoutcomebillitem` VALUES ('18', '150.00', '30.00', '4500.00', '', '12', '2');
INSERT INTO `stockoutcomebillitem` VALUES ('19', '3500.00', '20.00', '70000.00', '', '11', '3');
INSERT INTO `stockoutcomebillitem` VALUES ('20', '250.00', '20.00', '5000.00', '', '16', '3');
INSERT INTO `stockoutcomebillitem` VALUES ('21', '400.00', '20.00', '8000.00', '', '1', '3');
INSERT INTO `stockoutcomebillitem` VALUES ('22', '900.00', '20.00', '18000.00', '', '3', '3');
INSERT INTO `stockoutcomebillitem` VALUES ('23', '800.00', '30.00', '24000.00', '', '5', '3');
INSERT INTO `stockoutcomebillitem` VALUES ('24', '1000.00', '30.00', '30000.00', '', '6', '3');
INSERT INTO `stockoutcomebillitem` VALUES ('25', '150.00', '20.00', '3000.00', '', '12', '3');
INSERT INTO `stockoutcomebillitem` VALUES ('26', '6500.00', '20.00', '130000.00', '', '9', '3');
INSERT INTO `stockoutcomebillitem` VALUES ('27', '10000.00', '30.00', '300000.00', '', '20', '4');
INSERT INTO `stockoutcomebillitem` VALUES ('28', '400.00', '30.00', '12000.00', '', '1', '4');
INSERT INTO `stockoutcomebillitem` VALUES ('29', '2800.00', '30.00', '84000.00', '', '4', '4');
INSERT INTO `stockoutcomebillitem` VALUES ('30', '1200.00', '30.00', '36000.00', '', '8', '4');
INSERT INTO `stockoutcomebillitem` VALUES ('31', '500.00', '30.00', '15000.00', '', '14', '4');
INSERT INTO `stockoutcomebillitem` VALUES ('32', '250.00', '30.00', '7500.00', '', '16', '4');
INSERT INTO `stockoutcomebillitem` VALUES ('33', '2000.00', '30.00', '60000.00', '', '15', '4');
INSERT INTO `stockoutcomebillitem` VALUES ('34', '6500.00', '30.00', '195000.00', '', '9', '4');
INSERT INTO `stockoutcomebillitem` VALUES ('35', '10000.00', '20.00', '200000.00', '', '20', '5');
INSERT INTO `stockoutcomebillitem` VALUES ('36', '3500.00', '20.00', '70000.00', '', '19', '5');
INSERT INTO `stockoutcomebillitem` VALUES ('37', '150.00', '20.00', '3000.00', '', '12', '5');
INSERT INTO `stockoutcomebillitem` VALUES ('38', '1200.00', '20.00', '24000.00', '', '8', '5');
INSERT INTO `stockoutcomebillitem` VALUES ('39', '500.00', '20.00', '10000.00', '', '2', '5');
INSERT INTO `stockoutcomebillitem` VALUES ('40', '250.00', '20.00', '5000.00', '', '16', '5');
INSERT INTO `stockoutcomebillitem` VALUES ('41', '400.00', '1.00', '400.00', '1', '1', '6');
INSERT INTO `stockoutcomebillitem` VALUES ('42', '500.00', '1.00', '500.00', '1', '2', '6');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', '北京XX公司', '123', '北京');
INSERT INTO `supplier` VALUES ('2', '上海XX公司', '456', '上海');
INSERT INTO `supplier` VALUES ('3', '广州XX公司', '789', '广州');

-- ----------------------------
-- Table structure for systemmenu
-- ----------------------------
DROP TABLE IF EXISTS `systemmenu`;
CREATE TABLE `systemmenu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systemmenu
-- ----------------------------
INSERT INTO `systemmenu` VALUES ('1', '系统模块', '', 'system', null);
INSERT INTO `systemmenu` VALUES ('2', '业务模块', '', 'business', null);
INSERT INTO `systemmenu` VALUES ('3', '报表模块', '', 'chart', null);
INSERT INTO `systemmenu` VALUES ('4', '部门管理', 'department/query.do', '', '1');
INSERT INTO `systemmenu` VALUES ('5', '员工管理', 'employee/query.do', '', '1');
INSERT INTO `systemmenu` VALUES ('6', '权限管理', 'permission/query.do', '', '1');
INSERT INTO `systemmenu` VALUES ('7', '角色管理', 'role/query.do', '', '1');
INSERT INTO `systemmenu` VALUES ('8', '系统菜单管理', 'systemMenu/query.do', '', '1');
INSERT INTO `systemmenu` VALUES ('9', '品牌管理', 'brand/query.do', '', '2');
INSERT INTO `systemmenu` VALUES ('10', '供应商管理', 'supplier/query.do', '', '2');
INSERT INTO `systemmenu` VALUES ('11', '商品管理', 'product/query.do', '', '2');
INSERT INTO `systemmenu` VALUES ('12', '仓库管理', 'depot/query.do', '', '2');
INSERT INTO `systemmenu` VALUES ('13', '客户管理', 'client/query.do', '', '2');
INSERT INTO `systemmenu` VALUES ('14', '采购订单管理', 'orderBill/query.do', '', '2');
INSERT INTO `systemmenu` VALUES ('17', '即时库存报表', 'productStock/query.do', '', '3');
INSERT INTO `systemmenu` VALUES ('18', '订货报表', 'chart/orderChart.do', '', '3');
INSERT INTO `systemmenu` VALUES ('19', '销售报表', 'chart/saleChart.do', '', '3');

-- ----------------------------
-- Table structure for user_test
-- ----------------------------
DROP TABLE IF EXISTS `user_test`;
CREATE TABLE `user_test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `passWord` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_test
-- ----------------------------
INSERT INTO `user_test` VALUES ('2', 'luan', '1111', '1');

-- ----------------------------
-- View structure for test
-- ----------------------------
DROP VIEW IF EXISTS `test`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `test` AS SELECT
role.id,
role.`name`,
rm.role_id,
rm.menu_id
FROM
role AS role
INNER JOIN role_menu AS rm ON role.id = rm.role_id ;
