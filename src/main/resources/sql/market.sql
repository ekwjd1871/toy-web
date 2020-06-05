/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : market

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 05/06/2020 19:00:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `item_id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `discounted` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `delivery_fee` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `count` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `img1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `img2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES (1, '[메디테라피] 리프레쉬 씨솔트 샴푸 두피케어 ', '식품/생필품', '20000', '18000', '무료', '100', 'shampoo.jpg', 'shampoo_de.jpg');
INSERT INTO `item` VALUES (2, '청송 햇사과 사과 10kg', '식품/생필품', '21000', '18500', '2,500원', '1,000', 'apple.jpg', 'apple_de.jpg');
INSERT INTO `item` VALUES (45, '[크리넥스] 도톰한 천연펄프 3겹 카카오 화장지 30m', '식품/생필품', '13000', '12700', '무료', '100', 'tissue.jpg', 'tissue_de.png');
INSERT INTO `item` VALUES (46, '[일리]프란시스 Y3.2 커피머신(화이트, 레드, 블랙, 블루)', '가전/컴퓨터/디지털', '174000', '165900', '2,500원', '100', 'coffee.jpg', 'coffee_de.jpg');
INSERT INTO `item` VALUES (47, '[시디즈]T500HLDA 에어 화이트쉘 메쉬의자', '가전/컴퓨터/디지털', '98000', '85600', '무료', '100', 'chair.jpg', 'chair_de.jpg');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `item_id` int(0) NOT NULL,
  `count` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_pay` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_delivery` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `user_id_fk`(`user_id`) USING BTREE,
  INDEX `item_id_fk`(`item_id`) USING BTREE,
  CONSTRAINT `item_id_fk` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (15, 'test', 1, '3', '0', '0', '2020-05-30\n18:29');
INSERT INTO `orders` VALUES (16, 'test', 1, '5', '0', '0', '2020-05-30\n18:30');
INSERT INTO `orders` VALUES (17, 'test', 2, '1', '1', '0', '2020-05-30\n18:30');
INSERT INTO `orders` VALUES (18, 'test', 1, '8', '1', '0', '2020-05-30\n19:03');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('admin', '123', '관리자', 'ADMIN');
INSERT INTO `users` VALUES ('test', '123', '박다정', 'USER');

SET FOREIGN_KEY_CHECKS = 1;
