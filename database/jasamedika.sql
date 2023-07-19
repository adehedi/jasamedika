/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100422
 Source Host           : localhost:3306
 Source Schema         : jasamedika

 Target Server Type    : MySQL
 Target Server Version : 100422
 File Encoding         : 65001

 Date: 19/07/2023 17:15:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `connection` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `queue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `failed_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for kelurahan
-- ----------------------------
DROP TABLE IF EXISTS `kelurahan`;
CREATE TABLE `kelurahan`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `subdistrict` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'kecamatan',
  `village_district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'kelurahan',
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kelurahan
-- ----------------------------
INSERT INTO `kelurahan` VALUES (12, 'Jawa Barat', 'Bandung', 'Ujungberung', 'Pasir Endah', '40619', '2023-07-19 11:29:52', '2023-07-19 14:11:39');
INSERT INTO `kelurahan` VALUES (22, 'Jawa Barat', 'Bandung', 'Batununggal', 'Maleer', '40279', '2023-07-19 13:57:41', '2023-07-19 13:57:41');
INSERT INTO `kelurahan` VALUES (23, 'Jawa Barat', 'Bandung', 'Arcamanik', 'Antapani Tengah', '42111', '2023-07-19 14:12:04', '2023-07-19 14:12:04');

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `check_point_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `building_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `floor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `barcode_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `subdistrict` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `village_district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `longitude` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `latitude` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES (1, 'Ruang IT Division', 'SCTV Tower', '8', 'IT_Division', 'Jakarta', 'a', 'a', 'a', 'Senayan', 'a', 'a', 'a', '2023-05-11 03:19:11', '2023-06-07 06:25:41');
INSERT INTO `location` VALUES (2, 'Checkpoint B', 'Gedung B', 'BBB', 'Barcode BB', 'Alamat B', 'Provinsi B', 'Kabupaten B', 'Kecamatan B', 'Kelurahan B', 'BBBBB', 'Longitude B', 'Latitude B', '2023-05-16 03:06:52', '2023-05-25 04:31:24');
INSERT INTO `location` VALUES (3, 'Checkpoint C', 'Gedung C', 'CCC', 'Barcode CC', 'Alamat C', 'Provinsi C', 'Kabupaten C', 'Kecamatan C', 'Kelurahan C', 'CCCCC', 'Longitude C', 'Latitude C', '2023-05-16 03:12:58', '2023-05-25 04:31:48');
INSERT INTO `location` VALUES (5, 'Checkpoint D', 'Gedung D', 'DDD', 'Barcode DD', 'Alamat D', 'Provinsi D', 'Kabupaten D', 'Kecamatan D', 'Kelurahan D', 'DDDDD', 'Longitude D', 'Latitude D', '2023-05-16 03:23:41', '2023-05-25 04:33:42');
INSERT INTO `location` VALUES (6, 'Checkpoint E', 'Gedung E', '123', 'Barcode EE', 'Alamat E', 'Provinsi E', 'Kabupaten E', 'Kecamatan E', 'Kelurahan E', '12345', 'Longitude E', 'Latitude E', '2023-05-24 08:29:15', '2023-05-25 04:33:57');
INSERT INTO `location` VALUES (8, 'Checkpoint F', 'Gedung F', 'FFF', 'Barcode F', 'Alamat F', 'Provinsi F', 'Kabupaten F', 'Kecamatan F', 'Kelurahan F', 'FFFFF', 'Longitude F', 'Latitude F', '2023-05-26 06:16:25', '2023-05-26 06:16:25');
INSERT INTO `location` VALUES (10, 'Checkpoint zzz', 'zzz', '99', '7363232', 'bdg', 'jabar', 'bdg', 'bdg', 'bdg', '13232', '32324', '3243', '2023-06-02 08:28:33', '2023-06-02 08:28:33');
INSERT INTO `location` VALUES (13, 'Checkpoint GG', 'Gedung GG', 'GGG', 'Barcode G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-07 08:02:44', '2023-06-08 03:32:23');
INSERT INTO `location` VALUES (14, 'a', 'a', 'a', 'a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-08 01:21:26', '2023-06-08 01:21:26');
INSERT INTO `location` VALUES (15, 'Resepsionis SCTV Tower', 'SCTV Tower', '1', 'SCTV-0001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-20 11:12:56', '2023-06-20 11:12:56');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(11) NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2023_01_09_064822_create_permission_tables', 1);
INSERT INTO `migrations` VALUES (6, '2023_05_08_045826_create_location_table', 1);
INSERT INTO `migrations` VALUES (7, '2023_05_08_050933_create_patrol_table', 1);
INSERT INTO `migrations` VALUES (8, '2023_05_10_072734_add_remember_token_and_two_factor_secret_to_users_table', 2);
INSERT INTO `migrations` VALUES (9, '2023_05_10_074540_add_image_to_users_table', 3);
INSERT INTO `migrations` VALUES (10, '2023_06_07_082650_modify_user_table', 4);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` bigint(20) NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model_id` bigint(20) NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_permissions_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` bigint(20) NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 1);
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 5);
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 11);
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 14);
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 16);
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 19);
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 21);
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 23);
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\User', 25);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 4);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 6);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 7);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 8);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 9);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 10);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 12);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 13);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 15);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 17);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 18);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 20);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 22);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 24);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\User', 26);

-- ----------------------------
-- Table structure for pasien
-- ----------------------------
DROP TABLE IF EXISTS `pasien`;
CREATE TABLE `pasien`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'L / P',
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `rtrw` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `subdistrict` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'kecamatan',
  `village_district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'kelurahan',
  `village_district_id` int(11) NULL DEFAULT NULL COMMENT 'kelurahan id',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pasien
-- ----------------------------
INSERT INTO `pasien` VALUES (1, 'Ade Hedi', 'L', 'bandung', '3/3', 'Jawa Barat', 'Bandung', 'Ujungberung', 'Pasir Endah', 12, '11111', '40619', NULL, '2023-07-19 16:52:20', '2023-07-19 16:56:26');
INSERT INTO `pasien` VALUES (2, 'Test Lagi', 'L', 'Bandung', '3/3', 'Jawa Barat', 'Bandung', 'Arcamanik', 'Antapani Tengah', NULL, '1111', '42111', '2307000002', '2023-07-19 17:08:14', '2023-07-19 17:08:14');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for patrol
-- ----------------------------
DROP TABLE IF EXISTS `patrol`;
CREATE TABLE `patrol`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `condition_note` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `photo_one` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `photo_two` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `photo_three` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `video` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 407 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patrol
-- ----------------------------
INSERT INTO `patrol` VALUES (1, 1, 1, 'Aman', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ratione vel at exercitationem, minima perferendis ex, eum ullam natus, ut quasi pariatur amet facere non mollitia incidunt facilis blanditiis quibusdam eos provident esse quia voluptate in! Quam perferendis minus dolor vel, rem impedit eos necessitatibus possimus libero laboriosam saepe earum unde.', 'uploads/images/1683705295.png', 'uploads/images/1683705295.png', 'uploads/images/1683705295.png', 'countdown.mp4', '2023-05-11 13:36:43', NULL);
INSERT INTO `patrol` VALUES (9, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (10, 3, 6, 'Rusak', 'Perlu perbaikan atap', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-24 04:27:56', NULL);
INSERT INTO `patrol` VALUES (11, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (12, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (13, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (14, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (15, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (16, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (17, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (18, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (19, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (20, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (21, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (22, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (23, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (24, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (25, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (26, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (27, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (28, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (29, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (30, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (31, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (32, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (33, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (34, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (35, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (36, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (37, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (38, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (39, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (40, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (41, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (42, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (43, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (44, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (45, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (46, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (47, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (48, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (49, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (50, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (51, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (52, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (53, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (54, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (55, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (56, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (57, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (58, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (59, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (60, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (61, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (62, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (63, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (64, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (65, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (66, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (67, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (68, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (69, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (70, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (71, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (72, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (73, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (74, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (75, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (76, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (77, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (78, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (79, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (80, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (81, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (82, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (83, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (84, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (85, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (86, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (87, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (88, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (89, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (90, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (91, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (92, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (93, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (94, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (95, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (96, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (97, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (98, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (99, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (100, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (101, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (102, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (103, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (104, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (105, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (106, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (107, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (108, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (109, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (110, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (111, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (112, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (113, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (114, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (115, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (116, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpeg', 'uploads/image/Checkpoint_C_Gedung_C1.jpeg', 'uploads/image/Checkpoint_C_Gedung_C2.jpeg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-05 03:33:15', NULL);
INSERT INTO `patrol` VALUES (117, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpg', 'uploads/image/Checkpoint_C_Gedung_C1.jpg', 'uploads/image/Checkpoint_C_Gedung_C2.jpg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-08 03:28:13', NULL);
INSERT INTO `patrol` VALUES (118, 3, 1, 'Rusak', 'Rusak', 'uploads/image/Checkpoint_C_Gedung_C0.jpg', 'uploads/image/Checkpoint_C_Gedung_C1.jpg', 'uploads/image/Checkpoint_C_Gedung_C2.jpg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-08 03:28:29', NULL);
INSERT INTO `patrol` VALUES (119, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (120, 3, 1, 'Rusak', 'Rusak', 'uploads/image/Checkpoint_C_Gedung_C0.jpg', 'uploads/image/Checkpoint_C_Gedung_C1.jpg', 'uploads/image/Checkpoint_C_Gedung_C2.jpg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-08 03:28:36', NULL);
INSERT INTO `patrol` VALUES (121, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (122, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (123, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (124, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (125, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (126, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (127, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (128, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (129, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (130, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (131, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (132, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (133, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (134, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (135, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (136, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (137, 3, 1, 'Rusak', 'Rusak', 'uploads/image/Checkpoint_C_Gedung_C0.jpg', 'uploads/image/Checkpoint_C_Gedung_C1.jpg', 'uploads/image/Checkpoint_C_Gedung_C2.jpg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-08 03:28:41', NULL);
INSERT INTO `patrol` VALUES (138, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (139, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (140, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (141, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (142, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (143, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (144, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (145, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (146, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (147, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (148, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (149, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (150, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (151, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (152, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (153, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (154, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (155, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (156, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (157, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (158, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (159, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (160, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (161, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (162, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (163, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (164, 3, 1, 'Rusak', 'Rusak', 'uploads/image/Checkpoint_C_Gedung_C0.jpg', 'uploads/image/Checkpoint_C_Gedung_C1.jpg', 'uploads/image/Checkpoint_C_Gedung_C2.jpg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-08 03:28:46', NULL);
INSERT INTO `patrol` VALUES (165, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (166, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (167, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (168, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (169, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (170, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (171, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (172, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (173, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (174, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (175, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (176, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (177, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (178, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (179, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (180, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (181, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (182, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (183, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (184, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (185, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (186, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (187, 3, 1, 'Rusak', 'Rusak', 'uploads/image/Checkpoint_C_Gedung_C0.jpg', 'uploads/image/Checkpoint_C_Gedung_C1.jpg', 'uploads/image/Checkpoint_C_Gedung_C2.jpg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-08 03:28:51', NULL);
INSERT INTO `patrol` VALUES (188, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (189, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (190, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (191, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (192, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (193, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (194, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (195, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (196, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (197, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (198, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (199, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (200, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (201, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (202, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (203, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (204, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (205, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (206, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (207, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (208, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (209, 3, 1, 'Rusak', 'Rusak', 'uploads/image/Checkpoint_C_Gedung_C0.jpg', 'uploads/image/Checkpoint_C_Gedung_C1.jpg', 'uploads/image/Checkpoint_C_Gedung_C2.jpg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-08 03:28:56', NULL);
INSERT INTO `patrol` VALUES (210, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (211, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (212, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (213, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (214, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (215, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (216, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (217, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (218, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (219, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (220, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (221, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (222, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (223, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (224, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (225, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (226, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (227, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (228, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (229, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (230, 3, 1, 'Butuh Tindakan', 'Perlu perbaikan tembok', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.png', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-05-29 09:17:54', NULL);
INSERT INTO `patrol` VALUES (231, 3, 1, 'Aman', 'Rusak', 'uploads/image/Checkpoint_C_Gedung_C0.jpg', 'uploads/image/Checkpoint_C_Gedung_C1.jpg', 'uploads/image/Checkpoint_C_Gedung_C2.jpg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-08 03:29:10', NULL);
INSERT INTO `patrol` VALUES (232, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (233, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (234, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (235, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (236, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (237, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (238, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (239, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (240, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (241, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (242, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (243, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (244, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (245, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (246, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (247, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (248, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (249, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (250, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (251, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (252, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (253, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (254, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (255, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (256, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (257, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (258, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (259, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (260, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (261, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (262, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (263, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (264, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (265, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (266, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (267, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (268, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (269, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (270, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (271, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (272, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (273, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (274, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (275, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (276, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (277, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (278, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (279, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (280, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (281, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (282, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (283, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (284, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (285, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (286, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (287, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (288, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (289, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (290, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (291, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (292, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (293, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (294, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (295, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (296, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (297, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (298, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (299, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (300, 2, 1, 'Aman', 'Aman terkendali', 'Checkpoint_B_Gedung_B0.jpeg', 'uploads/image/Checkpoint_B_Gedung_B1.jpeg', 'uploads/image/Checkpoint_B_Gedung_B2.jpeg', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-05-24 02:36:08', NULL);
INSERT INTO `patrol` VALUES (301, 3, 1, 'Aman', 'Rusak', 'uploads/image/Checkpoint_C_Gedung_C0.jpg', 'uploads/image/Checkpoint_C_Gedung_C1.jpg', 'uploads/image/Checkpoint_C_Gedung_C2.jpg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-08 03:31:21', NULL);
INSERT INTO `patrol` VALUES (302, 3, 1, 'Aman', 'Rusak', 'uploads/image/Checkpoint_C_Gedung_C0.jpg', 'uploads/image/Checkpoint_C_Gedung_C1.jpg', 'uploads/image/Checkpoint_C_Gedung_C2.jpg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-08 03:31:27', NULL);
INSERT INTO `patrol` VALUES (303, 3, 1, 'Aman', 'Rusak', 'uploads/image/Checkpoint_C_Gedung_C0.jpg', 'uploads/image/Checkpoint_C_Gedung_C1.jpg', 'uploads/image/Checkpoint_C_Gedung_C2.jpg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-08 03:31:33', NULL);
INSERT INTO `patrol` VALUES (304, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpg', 'uploads/image/Checkpoint_C_Gedung_C1.jpg', 'uploads/image/Checkpoint_C_Gedung_C2.jpg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-08 03:36:00', NULL);
INSERT INTO `patrol` VALUES (305, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpg', 'uploads/image/Checkpoint_C_Gedung_C1.jpg', 'uploads/image/Checkpoint_C_Gedung_C2.jpg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-08 03:36:08', NULL);
INSERT INTO `patrol` VALUES (306, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpg', 'uploads/image/Checkpoint_C_Gedung_C1.jpg', 'uploads/image/Checkpoint_C_Gedung_C2.jpg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-08 03:36:12', NULL);
INSERT INTO `patrol` VALUES (307, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpg', 'uploads/image/Checkpoint_C_Gedung_C1.jpg', 'uploads/image/Checkpoint_C_Gedung_C2.jpg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-08 03:36:17', NULL);
INSERT INTO `patrol` VALUES (308, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpg', 'uploads/image/Checkpoint_C_Gedung_C1.jpg', 'uploads/image/Checkpoint_C_Gedung_C2.jpg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-08 03:36:21', NULL);
INSERT INTO `patrol` VALUES (309, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpg', 'uploads/image/Checkpoint_C_Gedung_C1.jpg', 'uploads/image/Checkpoint_C_Gedung_C2.jpg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-08 03:36:26', NULL);
INSERT INTO `patrol` VALUES (310, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.jpg', 'uploads/image/Checkpoint_C_Gedung_C1.jpg', 'uploads/image/Checkpoint_C_Gedung_C2.jpg', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-08 03:43:55', NULL);
INSERT INTO `patrol` VALUES (311, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.jpg', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-09 14:07:40', NULL);
INSERT INTO `patrol` VALUES (312, 1, 1, 'Aman', 'Aman, mengkilap seperti baru', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.jpg', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-09 14:54:34', NULL);
INSERT INTO `patrol` VALUES (313, 3, 1, 'Tidak Aman', 'Tidak mengkilap', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.jpg', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-09 15:06:36', NULL);
INSERT INTO `patrol` VALUES (314, 1, 1, 'Tidak Aman', 'Tidak mengkilap', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.png', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.png', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-09 15:07:47', NULL);
INSERT INTO `patrol` VALUES (315, 1, 1, 'Tidak Aman', 'Tidak mengkilap 2', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.png', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.png', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-09 15:07:55', NULL);
INSERT INTO `patrol` VALUES (316, 1, 1, 'Kendala', 'Tidak mengkilap', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.png', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.png', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-09 15:08:18', NULL);
INSERT INTO `patrol` VALUES (317, 1, 1, 'Kendala', 'Tidak mengkilap 2', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.png', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.png', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-09 15:08:21', NULL);
INSERT INTO `patrol` VALUES (318, 1, 1, 'Kendala', 'Tidak mengkilap 3', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.png', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.png', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-09 15:08:24', NULL);
INSERT INTO `patrol` VALUES (319, 1, 1, 'Kendala', 'Tidak mengkilap 4', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.png', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.png', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-09 15:08:27', NULL);
INSERT INTO `patrol` VALUES (320, 1, 1, 'Kendala', 'Tidak mengkilap 5', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.png', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.png', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-09 15:08:30', NULL);
INSERT INTO `patrol` VALUES (321, 1, 1, 'Kendala', 'Tidak mengkilap 6', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.png', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.png', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-09 15:09:39', NULL);
INSERT INTO `patrol` VALUES (322, 1, 1, 'Kendala', 'Tidak mengkilap 7', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.png', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.png', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-09 15:09:43', NULL);
INSERT INTO `patrol` VALUES (323, 1, 1, 'Kendala', 'Tidak mengkilap 8', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.png', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.png', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-09 15:09:47', NULL);
INSERT INTO `patrol` VALUES (324, 1, 1, 'Kendala', 'Tidak mengkilap 9', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.png', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.png', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-09 15:09:50', NULL);
INSERT INTO `patrol` VALUES (325, 1, 1, 'Kendala', 'Tidak mengkilap 10', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.png', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.png', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-09 15:09:54', NULL);
INSERT INTO `patrol` VALUES (326, 1, 1, 'Aman', 'Mengkilap', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.png', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.png', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-09 15:10:03', NULL);
INSERT INTO `patrol` VALUES (327, 1, 1, 'Aman', 'Bersinar', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.jpg', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-09 15:17:34', NULL);
INSERT INTO `patrol` VALUES (328, 3, 1, 'Aman', 'Mengkilap', 'uploads/image/Checkpoint_C_Gedung_C0.png', 'uploads/image/Checkpoint_C_Gedung_C1.jpg', 'uploads/image/Checkpoint_C_Gedung_C2.png', 'uploads/video/Checkpoint_C_Gedung_C.mp4', '2023-06-09 15:31:11', NULL);
INSERT INTO `patrol` VALUES (329, 2, 1, 'Aman', 'Mengkilap', 'uploads/image/Checkpoint_B_Gedung_B0.png', 'uploads/image/Checkpoint_B_Gedung_B1.jpg', 'uploads/image/Checkpoint_B_Gedung_B2.png', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-06-09 15:32:18', NULL);
INSERT INTO `patrol` VALUES (330, 2, 1, 'Aman', 'Mengkilap', 'uploads/image/Checkpoint_B_Gedung_B0.png', 'uploads/image/Checkpoint_B_Gedung_B1.jpg', 'uploads/image/Checkpoint_B_Gedung_B2.png', 'uploads/video/Checkpoint_B_Gedung_B.mp4', '2023-06-09 15:34:24', NULL);
INSERT INTO `patrol` VALUES (331, 1, 1, 'Aman', 'sdsadasd', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.jpg', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-11 12:11:28', NULL);
INSERT INTO `patrol` VALUES (332, 1, 1, 'Kendala', 'Bocorr', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.jpg', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-11 12:15:45', NULL);
INSERT INTO `patrol` VALUES (333, 1, 1, 'Aman', 'Aman', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.jpg', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-11 13:20:22', NULL);
INSERT INTO `patrol` VALUES (334, 1, 22, 'Aman', 'Aman', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.jpg', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-11 14:52:47', NULL);
INSERT INTO `patrol` VALUES (335, 1, 22, 'Kendala', 'Mampet', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.jpg', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-11 15:02:11', NULL);
INSERT INTO `patrol` VALUES (336, 1, 22, 'Aman', 'Aman bos', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.jpg', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-11 22:47:47', NULL);
INSERT INTO `patrol` VALUES (337, 1, 22, 'Aman', 'Aman kok', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.jpg', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-11 22:50:02', NULL);
INSERT INTO `patrol` VALUES (338, 1, 1, 'Aman', 'Aman', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.jpeg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpeg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.jpeg', 'uploads/video/Ruang_IT_Division_SCTV_Tower.mp4', '2023-06-12 02:47:54', NULL);
INSERT INTO `patrol` VALUES (339, 1, 1, 'Aman', 'Aman', 'uploads/image/Ruang_IT_Division_SCTV_Tower0.jpeg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1.jpeg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2.jpeg', 'uploads/video/Ruang_IT_Division_SCTV_Tower_1686538220.mp4', '2023-06-12 02:50:20', NULL);
INSERT INTO `patrol` VALUES (340, 1, 1, 'Aman', 'Aman', 'uploads/image/Ruang_IT_Division_SCTV_Tower0_1686538285.jpeg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1_1686538285.jpeg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2_1686538285.jpeg', 'uploads/video/Ruang_IT_Division_SCTV_Tower_1686538285.mp4', '2023-06-12 02:51:25', NULL);
INSERT INTO `patrol` VALUES (341, 1, 22, 'Aman', 'Tembok Jebol', 'uploads/image/Ruang_IT_Division_SCTV_Tower0_1686546451.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1_1686546451.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2_1686546451.jpg', 'uploads/video/Ruang_IT_Division_SCTV_Tower_1686546451.mp4', '2023-06-12 05:07:31', NULL);
INSERT INTO `patrol` VALUES (342, 1, 22, 'Aman', 'Aman', 'uploads/image/Ruang_IT_Division_SCTV_Tower0_1686546641.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1_1686546641.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2_1686546641.jpg', 'uploads/video/Ruang_IT_Division_SCTV_Tower_1686546641.mp4', '2023-06-12 05:10:41', NULL);
INSERT INTO `patrol` VALUES (343, 1, 22, 'Aman', 'Aman', 'uploads/image/Ruang_IT_Division_SCTV_Tower0_1686552293.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1_1686552293.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2_1686552293.jpg', 'uploads/video/Ruang_IT_Division_SCTV_Tower_1686552293.mp4', '2023-06-12 06:44:53', NULL);
INSERT INTO `patrol` VALUES (344, 1, 22, 'Aman', 'Aman', 'uploads/image/Ruang_IT_Division_SCTV_Tower0_1686555988.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1_1686555988.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2_1686555988.jpg', 'uploads/video/Ruang_IT_Division_SCTV_Tower_1686555988.mp4', '2023-06-12 14:46:28', NULL);
INSERT INTO `patrol` VALUES (345, 2, 22, 'Aman', 'test sit', 'uploads/image/Checkpoint_B_Gedung_B0_1686557552.jpg', 'uploads/image/Checkpoint_B_Gedung_B1_1686557552.jpg', 'uploads/image/Checkpoint_B_Gedung_B2_1686557552.jpg', 'uploads/video/Checkpoint_B_Gedung_B_1686557552.mp4', '2023-06-12 15:12:32', NULL);
INSERT INTO `patrol` VALUES (346, 1, 15, 'Aman', 'aman terus', 'uploads/image/Ruang_IT_Division_SCTV_Tower0_1687157474.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1_1687157474.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2_1687157474.jpg', 'uploads/video/Ruang_IT_Division_SCTV_Tower_1687157474.mp4', '2023-06-19 13:51:14', NULL);
INSERT INTO `patrol` VALUES (347, 15, 24, 'Aman', 'aman aman aman', 'uploads/image/Resepsionis_SCTV_Tower_SCTV_Tower0_1687235174.jpg', 'uploads/image/Resepsionis_SCTV_Tower_SCTV_Tower1_1687235174.jpg', 'uploads/image/Resepsionis_SCTV_Tower_SCTV_Tower2_1687235174.jpg', 'uploads/video/Resepsionis_SCTV_Tower_SCTV_Tower_1687235174.mp4', '2023-06-20 11:26:14', NULL);
INSERT INTO `patrol` VALUES (348, 1, 24, 'Butuh Tindakan', 'lampu mati', 'uploads/image/Ruang_IT_Division_SCTV_Tower0_1687235373.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1_1687235373.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2_1687235373.jpg', 'uploads/video/Ruang_IT_Division_SCTV_Tower_1687235373.mp4', '2023-06-20 11:29:33', NULL);
INSERT INTO `patrol` VALUES (349, 1, 1, 'Aman', 'Aman Tess', 'uploads/image/Ruang_IT_Division_SCTV_Tower0_1687318930.jpeg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1_1687318930.jpeg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2_1687318930.jpeg', 'uploads/video/Ruang_IT_Division_SCTV_Tower_1687318930.mp4', '2023-06-21 10:42:10', NULL);
INSERT INTO `patrol` VALUES (350, 1, 22, 'Aman', 'Aman', 'uploads/image/Ruang_IT_Division_SCTV_Tower0_1687324105.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1_1687324105.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2_1687324105.jpg', 'uploads/video/Ruang_IT_Division_SCTV_Tower_1687324105.mp4', '2023-06-21 05:08:25', NULL);
INSERT INTO `patrol` VALUES (353, 1, 1, 'Aman', 'Aman Test Asia/Jakarta', 'uploads/image/Ruang_IT_Division_SCTV_Tower0_1687325218.jpeg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1_1687325218.jpeg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2_1687325218.jpeg', 'uploads/video/Ruang_IT_Division_SCTV_Tower_1687325218.mp4', '2023-06-21 12:26:58', NULL);
INSERT INTO `patrol` VALUES (354, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0_1687400636.jpg', 'uploads/image/Checkpoint_C_Gedung_C1_1687400636.jpg', 'uploads/image/Checkpoint_C_Gedung_C2_1687400636.jpg', 'uploads/video/Checkpoint_C_Gedung_C_1687400636.mp4', '2023-06-22 09:23:56', NULL);
INSERT INTO `patrol` VALUES (355, 3, 1, 'Aman', 'Mantap', 'uploads/image/Checkpoint_C_Gedung_C0_1687400777.jpg', 'uploads/image/Checkpoint_C_Gedung_C1_1687400777.jpg', 'uploads/image/Checkpoint_C_Gedung_C2_1687400777.jpg', 'uploads/video/Checkpoint_C_Gedung_C_1687400777.mp4', '2023-06-22 09:26:17', NULL);
INSERT INTO `patrol` VALUES (357, 1, 1, 'Aman', 'Aman Test Null', NULL, NULL, NULL, NULL, '2023-06-22 12:27:22', NULL);
INSERT INTO `patrol` VALUES (358, 1, 1, 'Aman', 'Aman Test Null', NULL, NULL, NULL, NULL, '2023-06-22 12:27:42', NULL);
INSERT INTO `patrol` VALUES (359, 1, 1, 'Aman', 'Aman Test Null', NULL, NULL, NULL, NULL, '2023-06-22 14:11:44', NULL);
INSERT INTO `patrol` VALUES (360, 1, 1, 'Aman', 'Aman Test Null', NULL, NULL, NULL, NULL, '2023-06-22 14:12:06', NULL);
INSERT INTO `patrol` VALUES (361, 3, 1, 'Aman', 'Aman', NULL, NULL, NULL, NULL, '2023-06-22 14:54:05', NULL);
INSERT INTO `patrol` VALUES (362, 3, 1, 'Aman', 'Aman', NULL, NULL, NULL, NULL, '2023-06-22 15:04:41', NULL);
INSERT INTO `patrol` VALUES (363, 3, 1, 'Aman', 'Aman', NULL, NULL, NULL, NULL, '2023-06-22 15:04:46', NULL);
INSERT INTO `patrol` VALUES (364, 3, 1, 'Aman', 'TestNewAman', NULL, NULL, NULL, NULL, '2023-06-22 15:08:00', NULL);
INSERT INTO `patrol` VALUES (365, 3, 1, 'Aman', 'TestNewAman', NULL, NULL, NULL, NULL, '2023-06-22 15:08:56', NULL);
INSERT INTO `patrol` VALUES (366, 3, 1, 'Aman', 'TestNewAman', NULL, NULL, NULL, NULL, '2023-06-22 15:12:11', NULL);
INSERT INTO `patrol` VALUES (367, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0_1687421576.png', 'uploads/image/Checkpoint_C_Gedung_C1_1687421576.jpg', 'uploads/image/Checkpoint_C_Gedung_C2_1687421576.png', 'uploads/video/Checkpoint_C_Gedung_C_1687421576.mp4', '2023-06-22 15:12:56', NULL);
INSERT INTO `patrol` VALUES (368, 3, 1, 'Aman', 'Aman', 'uploads/image/Checkpoint_C_Gedung_C0_1687422168.png', 'uploads/image/Checkpoint_C_Gedung_C1_1687422168.jpg', 'uploads/image/Checkpoint_C_Gedung_C2_1687422168.png', 'uploads/video/Checkpoint_C_Gedung_C_1687422168.mp4', '2023-06-22 15:22:48', NULL);
INSERT INTO `patrol` VALUES (369, 1, 21, 'Aman', 'Aman sejahtera', 'uploads/image/Ruang_IT_Division_SCTV_Tower0_1687507508.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1_1687507508.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2_1687507508.jpg', 'uploads/video/Ruang_IT_Division_SCTV_Tower_1687507508.mp4', '2023-06-23 15:05:08', NULL);
INSERT INTO `patrol` VALUES (370, 1, 21, 'Aman', 'Aman sejahtera', 'uploads/image/Ruang_IT_Division_SCTV_Tower0_1687511344.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1_1687511344.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2_1687511344.jpg', 'uploads/video/Ruang_IT_Division_SCTV_Tower_1687511344.mp4', '2023-06-23 16:09:04', NULL);
INSERT INTO `patrol` VALUES (371, 3, 1, 'Aman', 'TestNewAman', NULL, NULL, NULL, NULL, '2023-06-27 10:27:22', NULL);
INSERT INTO `patrol` VALUES (372, 3, 1, 'Aman', 'TestNewAman', NULL, NULL, NULL, NULL, '2023-06-27 10:27:29', NULL);
INSERT INTO `patrol` VALUES (373, 3, 1, 'Aman', 'TestNewAman', NULL, NULL, NULL, NULL, '2023-06-27 10:28:23', NULL);
INSERT INTO `patrol` VALUES (374, 3, 1, 'Aman', 'TestNewAman', NULL, NULL, NULL, NULL, '2023-06-27 10:28:28', NULL);
INSERT INTO `patrol` VALUES (375, 1, 1, 'Aman', 'Mantap 1', NULL, NULL, NULL, NULL, '2023-06-27 10:28:32', NULL);
INSERT INTO `patrol` VALUES (376, 3, 1, 'Aman', 'TestNewAman', NULL, NULL, NULL, NULL, '2023-06-27 10:28:52', NULL);
INSERT INTO `patrol` VALUES (377, 1, 1, 'Aman', 'Mantap 1', NULL, NULL, NULL, NULL, '2023-06-27 10:31:30', NULL);
INSERT INTO `patrol` VALUES (378, 1, 21, 'Aman', 'Mantup', 'uploads/image/Ruang_IT_Division_SCTV_Tower0_1687837408.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower1_1687837408.jpg', 'uploads/image/Ruang_IT_Division_SCTV_Tower2_1687837408.jpg', 'uploads/video/Ruang_IT_Division_SCTV_Tower_1687837408.mp4', '2023-06-27 10:43:28', NULL);
INSERT INTO `patrol` VALUES (379, 1, 21, 'Aman', 'Mantup 2', NULL, NULL, NULL, NULL, '2023-06-27 10:43:58', NULL);
INSERT INTO `patrol` VALUES (380, 2, 1, 'Aman', 'Aman terkendali', NULL, NULL, NULL, NULL, '2023-06-28 08:06:04', NULL);
INSERT INTO `patrol` VALUES (381, 2, 1, 'Aman', 'Aman Tes Foto', 'uploads/image/Checkpoint_B_Gedung_B0_1687915785.jpeg', NULL, NULL, NULL, '2023-06-28 08:29:45', NULL);
INSERT INTO `patrol` VALUES (382, 15, 24, 'Aman', 'aman aman', NULL, NULL, NULL, NULL, '2023-06-30 09:57:59', NULL);
INSERT INTO `patrol` VALUES (383, 1, 24, 'Kendala', 'pecah', 'uploads/image/Ruang_IT_Division_SCTV_Tower0_1688094206.jpg', NULL, NULL, NULL, '2023-06-30 10:03:26', NULL);
INSERT INTO `patrol` VALUES (384, 14, 24, 'Butuh Tindakan', 'aw', NULL, 'uploads/image/a_a1_1688094395.jpg', NULL, NULL, '2023-06-30 10:06:35', NULL);
INSERT INTO `patrol` VALUES (385, 3, 1, 'Aman', 'TestNewAman', NULL, NULL, NULL, NULL, '2023-06-30 10:07:04', NULL);
INSERT INTO `patrol` VALUES (386, 14, 24, 'Aman', 'aman', NULL, NULL, 'uploads/image/a_a2_1688094533.jpg', NULL, '2023-06-30 10:08:53', NULL);
INSERT INTO `patrol` VALUES (387, 2, 1, 'Aman', 'Aman terkendali', NULL, NULL, NULL, NULL, '2023-06-30 10:50:22', NULL);
INSERT INTO `patrol` VALUES (388, 2, 1, 'Aman', 'Aman terkendali', NULL, NULL, NULL, 'uploads/video/Checkpoint_B_Gedung_B_1688097845.mp4', '2023-06-30 11:04:05', NULL);
INSERT INTO `patrol` VALUES (389, 2, 1, 'Aman', 'Aman terkendali', 'uploads/image/Checkpoint_B_Gedung_B0_1688098067.jpeg', NULL, NULL, 'uploads/video/Checkpoint_B_Gedung_B_1688098067.mp4', '2023-06-30 11:07:47', NULL);
INSERT INTO `patrol` VALUES (390, 2, 1, 'Aman', 'Aman terkendali', NULL, NULL, NULL, 'uploads/video/Checkpoint_B_Gedung_B_1688098088.mp4', '2023-06-30 11:08:08', NULL);
INSERT INTO `patrol` VALUES (391, 2, 1, 'Aman', 'Aman terkendali', NULL, NULL, NULL, 'uploads/video/Checkpoint_B_Gedung_B_1688106465.mp4', '2023-06-30 13:27:45', NULL);
INSERT INTO `patrol` VALUES (392, 2, 1, 'Aman', 'Aman terkendali', 'uploads/image/Checkpoint_B_Gedung_B0_1688106597.jpeg', NULL, NULL, 'uploads/video/Checkpoint_B_Gedung_B_1688106597.mp4', '2023-06-30 13:29:57', NULL);
INSERT INTO `patrol` VALUES (393, 2, 1, 'Aman', 'Aman terkendali', 'uploads/image/Checkpoint_B_Gedung_B0_1688106613.jpeg', NULL, NULL, NULL, '2023-06-30 13:30:13', NULL);
INSERT INTO `patrol` VALUES (394, 2, 1, 'Aman', 'Aman terkendali', NULL, NULL, NULL, NULL, '2023-06-30 13:30:29', NULL);
INSERT INTO `patrol` VALUES (395, 3, 1, 'Aman', 'TestNewAman', NULL, NULL, NULL, 'uploads/video/Checkpoint_C_Gedung_C_1688108789.mp4', '2023-06-30 14:06:29', NULL);
INSERT INTO `patrol` VALUES (396, 3, 1, 'Aman', 'TestNewAman', 'uploads/image/Checkpoint_C_Gedung_C0_1688108811.png', NULL, NULL, NULL, '2023-06-30 14:06:51', NULL);
INSERT INTO `patrol` VALUES (397, 14, 24, 'Aman', 'wah aman', 'uploads/image/a_a0_1688111368.jpg', 'uploads/image/a_a1_1688111368.jpg', NULL, NULL, '2023-06-30 14:49:28', NULL);
INSERT INTO `patrol` VALUES (398, 14, 24, 'Butuh Tindakan', 'weh', 'uploads/image/a_a0_1688111557.jpg', 'uploads/image/a_a1_1688111557.jpg', 'uploads/image/a_a2_1688111557.jpg', NULL, '2023-06-30 14:52:37', NULL);
INSERT INTO `patrol` VALUES (399, 14, 24, 'Kendala', 'weh', NULL, NULL, NULL, 'uploads/video/a_a_1688111614.mp4', '2023-06-30 14:53:34', NULL);
INSERT INTO `patrol` VALUES (400, 14, 24, 'Kendala', 'astaga', 'uploads/image/a_a0_1688111695.jpg', NULL, NULL, 'uploads/video/a_a_1688111695.mp4', '2023-06-30 14:54:55', NULL);
INSERT INTO `patrol` VALUES (401, 2, 1, 'Aman', 'Aman terkendali', NULL, 'uploads/image/Checkpoint_B_Gedung_B2_1688114336.jpeg', NULL, 'uploads/video/Checkpoint_B_Gedung_B_1688114336.mp4', '2023-06-30 15:38:56', NULL);
INSERT INTO `patrol` VALUES (402, 2, 1, 'Aman', 'Aman terkendali', NULL, 'uploads/image/Checkpoint_B_Gedung_B2_1688114351.jpeg', NULL, 'uploads/video/Checkpoint_B_Gedung_B_1688114351.mp4', '2023-06-30 15:39:11', NULL);
INSERT INTO `patrol` VALUES (403, 2, 1, 'Aman', 'Aman terkendali', NULL, NULL, 'uploads/image/Checkpoint_B_Gedung_B3_1688114365.jpeg', 'uploads/video/Checkpoint_B_Gedung_B_1688114365.mp4', '2023-06-30 15:39:25', NULL);
INSERT INTO `patrol` VALUES (404, 3, 1, 'Aman', 'TestNewAman', NULL, 'uploads/image/Checkpoint_C_Gedung_C2_1688115690.png', 'uploads/image/Checkpoint_C_Gedung_C3_1688115690.png', NULL, '2023-06-30 16:01:30', NULL);
INSERT INTO `patrol` VALUES (405, 14, 24, 'Kendala', 'aw', NULL, 'uploads/image/a_a2_1688115949.jpg', NULL, NULL, '2023-06-30 16:05:49', NULL);
INSERT INTO `patrol` VALUES (406, 14, 24, 'Butuh Tindakan', 'aw', NULL, NULL, 'uploads/image/a_a3_1688116008.jpg', 'uploads/video/a_a_1688116008.mp4', '2023-06-30 16:06:48', NULL);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permissions_name_guard_name_unique`(`name`, `guard_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tokenable_id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `abilities` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `last_used_at` datetime(0) NULL DEFAULT NULL,
  `expires_at` datetime(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (1, 'App\\Models\\User', 1, 'epatrolToken', '20345eefabfc110e5206e09b80fa10b59c2fde2848bad493a9b34356ecbcc73c', '[\"*\"]', NULL, NULL, '2023-05-10 07:49:17', '2023-05-10 07:49:17');
INSERT INTO `personal_access_tokens` VALUES (2, 'App\\Models\\User', 1, 'epatrolToken', '700b54ad2244560d6657e30ab77d9206ed94c92c9f182a20aaff75666f7c4513', '[\"*\"]', NULL, NULL, '2023-05-10 08:11:11', '2023-05-10 08:11:11');
INSERT INTO `personal_access_tokens` VALUES (3, 'App\\Models\\User', 1, 'epatrolToken', '8dd82ca221c7efae754376d4a031c737349c4cfb2405dde4040b1262cb603842', '[\"*\"]', NULL, NULL, '2023-05-10 08:13:39', '2023-05-10 08:13:39');
INSERT INTO `personal_access_tokens` VALUES (4, 'App\\Models\\User', 1, 'epatrolToken', '809dc5a6db0d9fc1404a7aa326de18f9f0d0ab719553199dc81292e343bf1155', '[\"*\"]', NULL, NULL, '2023-05-10 08:18:48', '2023-05-10 08:18:48');
INSERT INTO `personal_access_tokens` VALUES (6, 'App\\Models\\User', 1, 'epatrolToken', 'd631025cf8766d80aa029ca1d1ca20b4f0306a9191199e1684951a8d56c418e3', '[\"*\"]', '2023-05-10 08:35:21', NULL, '2023-05-10 08:25:57', '2023-05-10 08:35:21');
INSERT INTO `personal_access_tokens` VALUES (10, 'App\\Models\\User', 1, 'epatrolToken', 'c5f38e8b703e90bc1013f36c56f722512cae1a9b561a1d4a58b5bc74e2cb3fde', '[\"*\"]', '2023-06-22 15:22:35', NULL, '2023-05-24 04:16:38', '2023-06-22 15:22:35');
INSERT INTO `personal_access_tokens` VALUES (11, 'App\\Models\\User', 1, 'epatrolToken', '74713074ec1be02e99a7ccb4f8afecb3d1f054d61b3d0f3f5e1e62e2987e1fe3', '[\"*\"]', NULL, NULL, '2023-05-24 08:18:36', '2023-05-24 08:18:36');
INSERT INTO `personal_access_tokens` VALUES (12, 'App\\Models\\User', 1, 'epatrolToken', 'f14f217b270080a0f8e70223378d0278cc282ca1270b69f6d12babb6e95b1eee', '[\"*\"]', NULL, NULL, '2023-05-24 08:20:04', '2023-05-24 08:20:04');
INSERT INTO `personal_access_tokens` VALUES (13, 'App\\Models\\User', 1, 'epatrolToken', '3fdb32e78fc3ff0bcdfe8c9559448cc00d4b0d782db7b4946ecdcebbd45c3f75', '[\"*\"]', NULL, NULL, '2023-05-24 08:20:09', '2023-05-24 08:20:09');
INSERT INTO `personal_access_tokens` VALUES (15, 'App\\Models\\User', 1, 'epatrolToken', 'c03e483028ad4218f0578db6a9f6761241b303bdde3a8b9413c57421242f5500', '[\"*\"]', NULL, NULL, '2023-05-26 09:04:05', '2023-05-26 09:04:05');
INSERT INTO `personal_access_tokens` VALUES (16, 'App\\Models\\User', 1, 'epatrolToken', '005e1670dc28ff6124d651aaf440f5d6e9277c5309aaebbc8a8e89dda873acc3', '[\"*\"]', '2023-06-08 07:06:56', NULL, '2023-05-26 09:59:07', '2023-06-08 07:06:56');
INSERT INTO `personal_access_tokens` VALUES (18, 'App\\Models\\User', 1, 'epatrolToken', 'd93c8fb2fb5d71d08f4e2b6851949ed9c5f8965ae99f895ec46a3d098fbe6def', '[\"*\"]', '2023-05-28 00:55:14', NULL, '2023-05-28 00:25:26', '2023-05-28 00:55:14');
INSERT INTO `personal_access_tokens` VALUES (19, 'App\\Models\\User', 1, 'epatrolToken', '66e45d85e9b304bede06c36d50bfe8c3f61f62f3456f91261627ee4dbdc6d3b1', '[\"*\"]', NULL, NULL, '2023-05-28 01:05:20', '2023-05-28 01:05:20');
INSERT INTO `personal_access_tokens` VALUES (20, 'App\\Models\\User', 1, 'epatrolToken', 'f6d5dae7ae945a37892e6a28b1c612ec872d1742bec28a8bf1214fd48651f268', '[\"*\"]', NULL, NULL, '2023-05-28 01:19:27', '2023-05-28 01:19:27');
INSERT INTO `personal_access_tokens` VALUES (21, 'App\\Models\\User', 1, 'epatrolToken', '817e9745165588387a8fff3f097ca712a12f6ef5d0e41447c5b43f9322130bd7', '[\"*\"]', NULL, NULL, '2023-05-28 01:20:18', '2023-05-28 01:20:18');
INSERT INTO `personal_access_tokens` VALUES (22, 'App\\Models\\User', 1, 'epatrolToken', 'e053098340bfd52d6a312bd1d8196dee2d32d0d02dda34e65737ff2004398bdc', '[\"*\"]', NULL, NULL, '2023-05-28 01:28:11', '2023-05-28 01:28:11');
INSERT INTO `personal_access_tokens` VALUES (23, 'App\\Models\\User', 1, 'epatrolToken', '4bcab9cc74098b4b94b4090c2a08fd9f028ec526aa63578ad54c8a6f888a0115', '[\"*\"]', NULL, NULL, '2023-05-28 01:31:45', '2023-05-28 01:31:45');
INSERT INTO `personal_access_tokens` VALUES (24, 'App\\Models\\User', 1, 'epatrolToken', 'd5d1898badac602f214088db560bcaf28792cdf5689f0a7cd7ba807486f25f5e', '[\"*\"]', '2023-05-28 01:35:36', NULL, '2023-05-28 01:33:03', '2023-05-28 01:35:36');
INSERT INTO `personal_access_tokens` VALUES (25, 'App\\Models\\User', 1, 'epatrolToken', '570a10c33e58dac14d316de72fdb70defb6022136dd1cf45dc80274b247873a4', '[\"*\"]', NULL, NULL, '2023-05-28 01:38:56', '2023-05-28 01:38:56');
INSERT INTO `personal_access_tokens` VALUES (26, 'App\\Models\\User', 1, 'epatrolToken', '57c77c72bdf61cd9827fce10150edef30590bff6a96f2a7cf836fd8da5305855', '[\"*\"]', NULL, NULL, '2023-05-28 01:43:53', '2023-05-28 01:43:53');
INSERT INTO `personal_access_tokens` VALUES (27, 'App\\Models\\User', 1, 'epatrolToken', 'e60f25d5df9368fe92e601aadbb06e6638286016cb6bac7a3f9841cb4f2e73ce', '[\"*\"]', NULL, NULL, '2023-05-28 01:44:00', '2023-05-28 01:44:00');
INSERT INTO `personal_access_tokens` VALUES (28, 'App\\Models\\User', 1, 'epatrolToken', '022a7d7f143fcd261ad64672ff6ea55e58575ca296f66a89c4f075638affe220', '[\"*\"]', NULL, NULL, '2023-05-28 01:44:12', '2023-05-28 01:44:12');
INSERT INTO `personal_access_tokens` VALUES (30, 'App\\Models\\User', 1, 'epatrolToken', '031da609b88681197055a1d2d12e1a8a363daefb5d9025be9e3e3e8a36e5cbd6', '[\"*\"]', NULL, NULL, '2023-05-28 01:59:28', '2023-05-28 01:59:28');
INSERT INTO `personal_access_tokens` VALUES (31, 'App\\Models\\User', 1, 'epatrolToken', 'd52969b22d24d70c346d23692899dad4ab3447747dc48eeb3c5054ec0b0ebc16', '[\"*\"]', '2023-05-28 02:01:28', NULL, '2023-05-28 02:01:27', '2023-05-28 02:01:28');
INSERT INTO `personal_access_tokens` VALUES (32, 'App\\Models\\User', 1, 'epatrolToken', '29a1beded88fc42a864274c34d89421ce6ab1670a8b0a474be01172dec9daab4', '[\"*\"]', '2023-05-28 02:07:20', NULL, '2023-05-28 02:07:20', '2023-05-28 02:07:20');
INSERT INTO `personal_access_tokens` VALUES (33, 'App\\Models\\User', 1, 'epatrolToken', '003bcd08db435ea2c4391468883088220a305e38487c431c1be5bd532bd4b54a', '[\"*\"]', '2023-05-28 02:50:05', NULL, '2023-05-28 02:31:56', '2023-05-28 02:50:05');
INSERT INTO `personal_access_tokens` VALUES (34, 'App\\Models\\User', 1, 'epatrolToken', 'a93f1c860d8a998d1609da585c26674dfb15b29c0ec3b5851c73ffc8d01ee921', '[\"*\"]', '2023-05-28 03:04:56', NULL, '2023-05-28 03:04:55', '2023-05-28 03:04:56');
INSERT INTO `personal_access_tokens` VALUES (35, 'App\\Models\\User', 1, 'epatrolToken', '5c430ec38b0222d15159d4ba8862fe20af817922a7357804044a6d526883c53f', '[\"*\"]', '2023-05-28 03:06:14', NULL, '2023-05-28 03:06:13', '2023-05-28 03:06:14');
INSERT INTO `personal_access_tokens` VALUES (36, 'App\\Models\\User', 1, 'epatrolToken', '045db2be46905407f1372e950021f6d6950684d5ecb68ebf45f4f1659a7609b6', '[\"*\"]', '2023-05-28 03:06:52', NULL, '2023-05-28 03:06:49', '2023-05-28 03:06:52');
INSERT INTO `personal_access_tokens` VALUES (37, 'App\\Models\\User', 1, 'epatrolToken', 'fdf6e04334f1160619f4a3f819fd20d9332283d827910c0c7f141be88eba763e', '[\"*\"]', '2023-05-28 03:07:58', NULL, '2023-05-28 03:07:58', '2023-05-28 03:07:58');
INSERT INTO `personal_access_tokens` VALUES (38, 'App\\Models\\User', 1, 'epatrolToken', '108fda16abf0a79aff61199ad292fee4c7378b276aba49aef9597855ba8ece5e', '[\"*\"]', '2023-05-28 03:09:59', NULL, '2023-05-28 03:09:58', '2023-05-28 03:09:59');
INSERT INTO `personal_access_tokens` VALUES (39, 'App\\Models\\User', 1, 'epatrolToken', '0ea1f1c670bb9b0514a84c356c84ad1043251d083c88a7226e39007681029210', '[\"*\"]', '2023-05-28 03:10:15', NULL, '2023-05-28 03:10:13', '2023-05-28 03:10:15');
INSERT INTO `personal_access_tokens` VALUES (40, 'App\\Models\\User', 1, 'epatrolToken', 'f1ffa005a0cff7cc7cd9da3d817b7a9abd2cfcd59e6ae2db1294bff8bbd23c5e', '[\"*\"]', '2023-05-28 03:11:23', NULL, '2023-05-28 03:11:23', '2023-05-28 03:11:23');
INSERT INTO `personal_access_tokens` VALUES (41, 'App\\Models\\User', 1, 'epatrolToken', '33257f1d888f7129adf49e1f716c250d9c77c8d10a97d7a393e4d1378ee088ab', '[\"*\"]', '2023-05-28 03:14:33', NULL, '2023-05-28 03:14:31', '2023-05-28 03:14:33');
INSERT INTO `personal_access_tokens` VALUES (42, 'App\\Models\\User', 1, 'epatrolToken', '0cebcaae3385d128e4ed5c5d77026334b43efc30c47872b3ab541d9a7f8e5426', '[\"*\"]', '2023-05-28 03:19:09', NULL, '2023-05-28 03:19:08', '2023-05-28 03:19:09');
INSERT INTO `personal_access_tokens` VALUES (43, 'App\\Models\\User', 1, 'epatrolToken', '898c44afd55d8784ac8fde3d5b00f11b55a5faf148c859bbff831ed7ab958e9d', '[\"*\"]', '2023-05-28 03:20:08', NULL, '2023-05-28 03:20:06', '2023-05-28 03:20:08');
INSERT INTO `personal_access_tokens` VALUES (44, 'App\\Models\\User', 1, 'epatrolToken', '675db4f0852b2c5e510798b65a51022897a9d638eb05fe09d0137d25dc460866', '[\"*\"]', '2023-05-28 03:21:33', NULL, '2023-05-28 03:21:31', '2023-05-28 03:21:33');
INSERT INTO `personal_access_tokens` VALUES (45, 'App\\Models\\User', 1, 'epatrolToken', '01cb39af0f846d384aa9630f77222c8e02edd49d8ce779507b604c6caa79c6e4', '[\"*\"]', '2023-05-28 03:23:41', NULL, '2023-05-28 03:23:40', '2023-05-28 03:23:41');
INSERT INTO `personal_access_tokens` VALUES (46, 'App\\Models\\User', 1, 'epatrolToken', '1bc4d68822905899cec87ea8d54ef52a28307ae5ede698099dc2876d2cbdaac2', '[\"*\"]', '2023-05-28 03:24:04', NULL, '2023-05-28 03:24:03', '2023-05-28 03:24:04');
INSERT INTO `personal_access_tokens` VALUES (47, 'App\\Models\\User', 1, 'epatrolToken', '9d3292844a9971b0460daf61ee9f7d2d16e56e4739d77ab62972b1b56c79398c', '[\"*\"]', '2023-05-28 03:24:45', NULL, '2023-05-28 03:24:44', '2023-05-28 03:24:45');
INSERT INTO `personal_access_tokens` VALUES (48, 'App\\Models\\User', 1, 'epatrolToken', 'e35974dfe786275af3da2feca4297e9a44eaa00153e827be2d76d4efdf632d80', '[\"*\"]', '2023-05-28 03:25:12', NULL, '2023-05-28 03:25:11', '2023-05-28 03:25:12');
INSERT INTO `personal_access_tokens` VALUES (49, 'App\\Models\\User', 1, 'epatrolToken', '96f858a8dbea409016b79bc3b7863c4640ff2589064f76f1558d93d01a0b3a0c', '[\"*\"]', '2023-05-28 03:25:41', NULL, '2023-05-28 03:25:40', '2023-05-28 03:25:41');
INSERT INTO `personal_access_tokens` VALUES (50, 'App\\Models\\User', 1, 'epatrolToken', '6ac541cb2e4ead5e274b1546e0251e2d3f899097c533af49f33b776992717a00', '[\"*\"]', '2023-05-28 03:26:44', NULL, '2023-05-28 03:26:43', '2023-05-28 03:26:44');
INSERT INTO `personal_access_tokens` VALUES (51, 'App\\Models\\User', 1, 'epatrolToken', '6d7f89c3015526ffbfb1a211e8914a3e805641ce729955b5d86027efc554a104', '[\"*\"]', '2023-05-28 03:27:41', NULL, '2023-05-28 03:27:40', '2023-05-28 03:27:41');
INSERT INTO `personal_access_tokens` VALUES (52, 'App\\Models\\User', 1, 'epatrolToken', '73293857bb0515b035f04cda7674b76706d0704ca4d821fddf2bd5af0db3154e', '[\"*\"]', '2023-05-28 03:29:01', NULL, '2023-05-28 03:29:01', '2023-05-28 03:29:01');
INSERT INTO `personal_access_tokens` VALUES (53, 'App\\Models\\User', 1, 'epatrolToken', '0ee067c0a2a8bdd681535a7aea6e84afcca508980123ae284607c630bdea103f', '[\"*\"]', '2023-05-28 03:30:03', NULL, '2023-05-28 03:30:02', '2023-05-28 03:30:03');
INSERT INTO `personal_access_tokens` VALUES (54, 'App\\Models\\User', 1, 'epatrolToken', '109da595753bb07221523fc1207d36d9a80578954b2df3a704dc88e1ad40193c', '[\"*\"]', '2023-05-28 03:32:17', NULL, '2023-05-28 03:32:17', '2023-05-28 03:32:17');
INSERT INTO `personal_access_tokens` VALUES (55, 'App\\Models\\User', 1, 'epatrolToken', 'ce5308d88dcfd6d68f40cbfea21d668e6a599c7ec7ef03ba6a2d41ec4665fc75', '[\"*\"]', '2023-05-28 03:34:28', NULL, '2023-05-28 03:34:27', '2023-05-28 03:34:28');
INSERT INTO `personal_access_tokens` VALUES (56, 'App\\Models\\User', 1, 'epatrolToken', '226380c4d7b47e81234f4ebbdc789c188486aa6e88e6e5f9f46d8017cd8f3775', '[\"*\"]', '2023-05-28 03:35:12', NULL, '2023-05-28 03:35:12', '2023-05-28 03:35:12');
INSERT INTO `personal_access_tokens` VALUES (57, 'App\\Models\\User', 1, 'epatrolToken', '5acefa7284096a870f47fda371b4b6bb6fb7e263b5f2b1ace2e74075c0c31b0a', '[\"*\"]', '2023-05-28 03:35:43', NULL, '2023-05-28 03:35:41', '2023-05-28 03:35:43');
INSERT INTO `personal_access_tokens` VALUES (58, 'App\\Models\\User', 1, 'epatrolToken', '3c90382bb4f0e29b7d100fa2f6c0ba03c5b9297eccecb5cb82974cf288c70ffa', '[\"*\"]', '2023-05-29 09:03:41', NULL, '2023-05-29 09:03:40', '2023-05-29 09:03:41');
INSERT INTO `personal_access_tokens` VALUES (59, 'App\\Models\\User', 1, 'epatrolToken', '942d7fc927e2ff73d1523d1dee8f211d9a82706c54753b77b905ef987fe26d82', '[\"*\"]', '2023-05-29 09:04:12', NULL, '2023-05-29 09:04:05', '2023-05-29 09:04:12');
INSERT INTO `personal_access_tokens` VALUES (60, 'App\\Models\\User', 1, 'epatrolToken', 'a567fffeedf8c1abdca70d761d2274664a7176ca802bcbdb87695b2141d891c3', '[\"*\"]', '2023-05-29 09:26:32', NULL, '2023-05-29 09:06:50', '2023-05-29 09:26:32');
INSERT INTO `personal_access_tokens` VALUES (61, 'App\\Models\\User', 1, 'epatrolToken', '0a8c9a358fadf5ef19c6acbd439271550f9aaea6718e2ef6c1f482ba9c9039e0', '[\"*\"]', '2023-05-29 09:19:47', NULL, '2023-05-29 09:10:47', '2023-05-29 09:19:47');
INSERT INTO `personal_access_tokens` VALUES (62, 'App\\Models\\User', 1, 'epatrolToken', '7af4f5ba34c8746ff38f3e6107b3619b9277dd57d8b802a4bfccff16f6f01bd2', '[\"*\"]', '2023-05-29 09:29:10', NULL, '2023-05-29 09:29:08', '2023-05-29 09:29:10');
INSERT INTO `personal_access_tokens` VALUES (63, 'App\\Models\\User', 1, 'epatrolToken', '6d61eef2386d97beb10929767f9da5157df8028c374d7d068106ce3c4c9065ad', '[\"*\"]', '2023-05-29 09:29:18', NULL, '2023-05-29 09:29:17', '2023-05-29 09:29:18');
INSERT INTO `personal_access_tokens` VALUES (64, 'App\\Models\\User', 1, 'epatrolToken', '3ecc3265f05241a9324d005b5ed83c900435a3dd3f00b0335fb56f051d5b77a5', '[\"*\"]', '2023-05-29 09:29:43', NULL, '2023-05-29 09:29:42', '2023-05-29 09:29:43');
INSERT INTO `personal_access_tokens` VALUES (65, 'App\\Models\\User', 1, 'epatrolToken', 'cbb6409effce23e379ee4650f453f8374913282fdd04d16fb3cb474e34a5fd64', '[\"*\"]', '2023-06-01 03:02:59', NULL, '2023-05-29 09:31:32', '2023-06-01 03:02:59');
INSERT INTO `personal_access_tokens` VALUES (66, 'App\\Models\\User', 1, 'epatrolToken', 'bc0ee307b398cc849b7cb4592f35ef24b228f7b63ace561b9366e4f8d24f8621', '[\"*\"]', '2023-06-01 03:03:14', NULL, '2023-06-01 03:03:14', '2023-06-01 03:03:14');
INSERT INTO `personal_access_tokens` VALUES (67, 'App\\Models\\User', 1, 'epatrolToken', '15abfb28cf02438d35eb54b1f6149a5f73da751733e837e0f1c42e2ba83336b6', '[\"*\"]', '2023-06-01 08:18:55', NULL, '2023-06-01 08:18:55', '2023-06-01 08:18:55');
INSERT INTO `personal_access_tokens` VALUES (68, 'App\\Models\\User', 1, 'epatrolToken', 'a07a25eb27dc080a775b8b1c8d2b3620e64b5db900ec4a487f93b44b221dad3f', '[\"*\"]', '2023-06-01 08:25:44', NULL, '2023-06-01 08:25:44', '2023-06-01 08:25:44');
INSERT INTO `personal_access_tokens` VALUES (69, 'App\\Models\\User', 1, 'epatrolToken', '65e13871b6cb70f107d935acc1424147b7c78d350033f90b1c2f5dcf6849f84c', '[\"*\"]', '2023-06-01 08:25:51', NULL, '2023-06-01 08:25:51', '2023-06-01 08:25:51');
INSERT INTO `personal_access_tokens` VALUES (70, 'App\\Models\\User', 1, 'epatrolToken', '80a18f76d47be02b154a0a2f59d20b3a15f4124f24ac15b4df46ace1110f5cda', '[\"*\"]', '2023-06-01 08:27:49', NULL, '2023-06-01 08:27:49', '2023-06-01 08:27:49');
INSERT INTO `personal_access_tokens` VALUES (71, 'App\\Models\\User', 1, 'epatrolToken', '9d6e009f06515284838df7dbf0cdafcfd7bb3bac12d320b35babdd6426abbef8', '[\"*\"]', '2023-06-01 08:27:58', NULL, '2023-06-01 08:27:58', '2023-06-01 08:27:58');
INSERT INTO `personal_access_tokens` VALUES (72, 'App\\Models\\User', 1, 'epatrolToken', 'c62e9f54a9a04d49f13727e21fdb46421e32c7dc5188ff214972878611f90f30', '[\"*\"]', '2023-06-01 08:29:28', NULL, '2023-06-01 08:29:27', '2023-06-01 08:29:28');
INSERT INTO `personal_access_tokens` VALUES (73, 'App\\Models\\User', 1, 'epatrolToken', '3a1498e33009394eb503e148ecc3be4de406c65ffc59726806def0f3da3482f5', '[\"*\"]', '2023-06-01 08:29:46', NULL, '2023-06-01 08:29:45', '2023-06-01 08:29:46');
INSERT INTO `personal_access_tokens` VALUES (74, 'App\\Models\\User', 1, 'epatrolToken', '8393e468de44b9137d523ec5f32bd8550b13236db88dcf51cfb0f23b3f64ea85', '[\"*\"]', '2023-06-01 08:30:49', NULL, '2023-06-01 08:30:48', '2023-06-01 08:30:49');
INSERT INTO `personal_access_tokens` VALUES (75, 'App\\Models\\User', 1, 'epatrolToken', '4568a37fe4182ef7d8687904424a821879acd44da7b78868d9d3df75d978047f', '[\"*\"]', '2023-06-01 08:32:12', NULL, '2023-06-01 08:32:12', '2023-06-01 08:32:12');
INSERT INTO `personal_access_tokens` VALUES (76, 'App\\Models\\User', 1, 'epatrolToken', '503fa704bfa6190cca9c7af428aabac1abc559aa9e5884636fb718e50d1c35fa', '[\"*\"]', '2023-06-01 08:33:30', NULL, '2023-06-01 08:33:30', '2023-06-01 08:33:30');
INSERT INTO `personal_access_tokens` VALUES (77, 'App\\Models\\User', 1, 'epatrolToken', '11ff238d4ccdf4f2dfff0b1a538a0ba273ace810d59a2ec9f3474e97b6dddfc4', '[\"*\"]', '2023-06-01 08:36:13', NULL, '2023-06-01 08:36:13', '2023-06-01 08:36:13');
INSERT INTO `personal_access_tokens` VALUES (78, 'App\\Models\\User', 1, 'epatrolToken', '84051580531a721811407f367813546b301bbaf279943546cc498622689fa19e', '[\"*\"]', '2023-06-01 08:40:00', NULL, '2023-06-01 08:39:59', '2023-06-01 08:40:00');
INSERT INTO `personal_access_tokens` VALUES (79, 'App\\Models\\User', 1, 'epatrolToken', '928a0870dc037b96d3b27637b049294cf52f38c2f7b0096d43c8feda20f42489', '[\"*\"]', '2023-06-01 08:40:36', NULL, '2023-06-01 08:40:36', '2023-06-01 08:40:36');
INSERT INTO `personal_access_tokens` VALUES (80, 'App\\Models\\User', 1, 'epatrolToken', '2cc6c406675b491375b7ce94f579c488603f6deb71ff031eabd089bce5b3b8f4', '[\"*\"]', '2023-06-01 08:41:33', NULL, '2023-06-01 08:41:33', '2023-06-01 08:41:33');
INSERT INTO `personal_access_tokens` VALUES (81, 'App\\Models\\User', 1, 'epatrolToken', 'ba35091a54122814d2094689c7d42dc3c8a853b1de37e0d5af329d7e60a952e2', '[\"*\"]', '2023-06-01 08:41:50', NULL, '2023-06-01 08:41:50', '2023-06-01 08:41:50');
INSERT INTO `personal_access_tokens` VALUES (82, 'App\\Models\\User', 1, 'epatrolToken', '0e0d0a9669a57f9db8e4872326c5bbc7760eca436b19dc12d8341442e76d536f', '[\"*\"]', '2023-06-01 08:42:24', NULL, '2023-06-01 08:42:23', '2023-06-01 08:42:24');
INSERT INTO `personal_access_tokens` VALUES (83, 'App\\Models\\User', 1, 'epatrolToken', '2d7437318d2de81e12d619c1cffdc88570a4f62b6b1e7d824387acc59662717a', '[\"*\"]', '2023-06-01 08:42:51', NULL, '2023-06-01 08:42:51', '2023-06-01 08:42:51');
INSERT INTO `personal_access_tokens` VALUES (84, 'App\\Models\\User', 1, 'epatrolToken', '5dc94a64172d5663d51004e85ec5266397aafc31f8900ce85d5ce7fef979f9b2', '[\"*\"]', '2023-06-01 08:43:28', NULL, '2023-06-01 08:43:28', '2023-06-01 08:43:28');
INSERT INTO `personal_access_tokens` VALUES (85, 'App\\Models\\User', 1, 'epatrolToken', 'e70243596511136fc8a60d22e240ef469b921309163e16928d81f46850b41262', '[\"*\"]', '2023-06-01 08:43:34', NULL, '2023-06-01 08:43:34', '2023-06-01 08:43:34');
INSERT INTO `personal_access_tokens` VALUES (86, 'App\\Models\\User', 1, 'epatrolToken', 'f441863cf5169f4d56c595cab7deb56ab733f522048479fbe12808e6ed06c0fa', '[\"*\"]', '2023-06-01 08:43:40', NULL, '2023-06-01 08:43:40', '2023-06-01 08:43:40');
INSERT INTO `personal_access_tokens` VALUES (87, 'App\\Models\\User', 1, 'epatrolToken', '5531ac2af8e633c6d63645caaa7ae08cf5e57d1b5e869acd085323c1d880f223', '[\"*\"]', '2023-06-01 08:43:52', NULL, '2023-06-01 08:43:52', '2023-06-01 08:43:52');
INSERT INTO `personal_access_tokens` VALUES (88, 'App\\Models\\User', 1, 'epatrolToken', 'a6754784ac0d36995a0a81b65814b5c5c96aa6d373297f57a096b7022a2d4f69', '[\"*\"]', '2023-06-09 15:34:24', NULL, '2023-06-06 23:43:45', '2023-06-09 15:34:24');
INSERT INTO `personal_access_tokens` VALUES (89, 'App\\Models\\User', 1, 'epatrolToken', 'b95ea5ba210c10fdf2a0394424d4146a5ddaadd2818f07ed9998dbf8d2ec74f7', '[\"*\"]', '2023-06-08 15:07:18', NULL, '2023-06-07 02:07:14', '2023-06-08 15:07:18');
INSERT INTO `personal_access_tokens` VALUES (90, 'App\\Models\\User', 1, 'epatrolToken', '192c6b2bf90ba6179425dee70a1e2458a71e2988cb35ca87354e817090aedfa5', '[\"*\"]', '2023-06-11 15:26:13', NULL, '2023-06-07 13:47:58', '2023-06-11 15:26:13');
INSERT INTO `personal_access_tokens` VALUES (91, 'App\\Models\\User', 1, 'epatrolToken', '1fd81647db98ca0d4c03c4a7ae70f5f6cbe4e203baf1df5f740d2b5875826313', '[\"*\"]', '2023-06-22 15:12:11', NULL, '2023-06-08 07:07:20', '2023-06-22 15:12:11');
INSERT INTO `personal_access_tokens` VALUES (92, 'App\\Models\\User', 1, 'epatrolToken', '3ef8271f62378b5bef4c838dbdf8e20c886846784f54c33088292023652c2c2a', '[\"*\"]', '2023-06-11 13:20:41', NULL, '2023-06-08 15:52:29', '2023-06-11 13:20:41');
INSERT INTO `personal_access_tokens` VALUES (93, 'App\\Models\\User', 1, 'epatrolToken', 'c0c96453b83a51bde80f2de2ed3ef5ae0571fc88574eaa68dc6ec80b5c543fca', '[\"*\"]', '2023-06-11 07:07:07', NULL, '2023-06-11 07:05:25', '2023-06-11 07:07:07');
INSERT INTO `personal_access_tokens` VALUES (94, 'App\\Models\\User', 21, 'epatrolToken', '7835f91721aae797baf2b8c8da5b3000856a86a2cfeef949e17d1e74815fac78', '[\"*\"]', '2023-06-11 14:31:00', NULL, '2023-06-11 14:30:59', '2023-06-11 14:31:00');
INSERT INTO `personal_access_tokens` VALUES (95, 'App\\Models\\User', 22, 'epatrolToken', '46a3aca72dbb8090b779ea5f5e058c5929262c79dedab46da7438ed6fd848b0e', '[\"*\"]', '2023-06-11 14:38:47', NULL, '2023-06-11 14:31:25', '2023-06-11 14:38:47');
INSERT INTO `personal_access_tokens` VALUES (96, 'App\\Models\\User', 21, 'epatrolToken', '171a23422125e24526f6e7f6206ceb9b091f9d5a486e0ec24d43ccc12228dbba', '[\"*\"]', '2023-06-11 14:39:16', NULL, '2023-06-11 14:39:16', '2023-06-11 14:39:16');
INSERT INTO `personal_access_tokens` VALUES (97, 'App\\Models\\User', 21, 'epatrolToken', '2e35b6e54aac8f9a33a307cd56545838cfbef9e7ea352f8c9682097866b61fb2', '[\"*\"]', '2023-06-11 14:45:12', NULL, '2023-06-11 14:45:12', '2023-06-11 14:45:12');
INSERT INTO `personal_access_tokens` VALUES (98, 'App\\Models\\User', 22, 'epatrolToken', '96bae96f28b8355197342267630bce8ebf54587af4f42d49404c7b9ebed9cb12', '[\"*\"]', '2023-06-11 14:45:23', NULL, '2023-06-11 14:45:22', '2023-06-11 14:45:23');
INSERT INTO `personal_access_tokens` VALUES (99, 'App\\Models\\User', 22, 'epatrolToken', '560f9366f0fc9eef5ea08f47ab453898de077302c990661a9ee1a63779370a75', '[\"*\"]', '2023-06-11 14:45:35', NULL, '2023-06-11 14:45:35', '2023-06-11 14:45:35');
INSERT INTO `personal_access_tokens` VALUES (100, 'App\\Models\\User', 22, 'epatrolToken', '1da1d9f1f092f350f64c40941380f0cd835532f83f53f0927979de6fdcab8612', '[\"*\"]', '2023-06-11 14:46:49', NULL, '2023-06-11 14:46:49', '2023-06-11 14:46:49');
INSERT INTO `personal_access_tokens` VALUES (101, 'App\\Models\\User', 22, 'epatrolToken', 'dde42ce757935e539a160c878f3aeabf896a8bfe53906c00a932ebd07ded5776', '[\"*\"]', '2023-06-11 21:28:37', NULL, '2023-06-11 14:47:49', '2023-06-11 21:28:37');
INSERT INTO `personal_access_tokens` VALUES (102, 'App\\Models\\User', 1, 'epatrolToken', '782b26b05317c610a7bdd4b7b9208617aa7d2f58bc4c2e65e754242088d0e72f', '[\"*\"]', '2023-06-12 04:57:07', NULL, '2023-06-11 14:48:57', '2023-06-12 04:57:07');
INSERT INTO `personal_access_tokens` VALUES (103, 'App\\Models\\User', 21, 'epatrolToken', 'e1e51c4a8544a620d4e9b472ed9dfa59627347fe52a4be3fb350a2bc8a76b98b', '[\"*\"]', '2023-06-11 22:11:10', NULL, '2023-06-11 21:29:22', '2023-06-11 22:11:10');
INSERT INTO `personal_access_tokens` VALUES (104, 'App\\Models\\User', 22, 'epatrolToken', '818e61c23f0c16532622459eb16ccf2202e4816167a69dc4a86bee97f06a8e8f', '[\"*\"]', '2023-06-11 22:50:02', NULL, '2023-06-11 22:41:08', '2023-06-11 22:50:02');
INSERT INTO `personal_access_tokens` VALUES (105, 'App\\Models\\User', 22, 'epatrolToken', '15592a0c5d6b0f981887f1594aac4c160f9d931b77bf9f5f072c69172b4473ea', '[\"*\"]', '2023-06-11 22:51:38', NULL, '2023-06-11 22:51:34', '2023-06-11 22:51:38');
INSERT INTO `personal_access_tokens` VALUES (106, 'App\\Models\\User', 1, 'epatrolToken', '679b2498fbeff1027a59cb738f91ffbbe547f1c5414d48ea70ec3b0f9f5fbdff', '[\"*\"]', '2023-06-12 02:43:32', NULL, '2023-06-12 02:43:05', '2023-06-12 02:43:32');
INSERT INTO `personal_access_tokens` VALUES (107, 'App\\Models\\User', 22, 'epatrolToken', '7c696bdcb0a18972a846f9c857939d760e8a13e53f7d8da5fb5fee01a01a59d3', '[\"*\"]', '2023-06-12 05:00:41', NULL, '2023-06-12 05:00:36', '2023-06-12 05:00:41');
INSERT INTO `personal_access_tokens` VALUES (108, 'App\\Models\\User', 1, 'epatrolToken', 'b6e309d4b9780ed783a55c1ec4c463fbbb953b430c107dc18e6852268e4be655', '[\"*\"]', '2023-06-22 09:26:17', NULL, '2023-06-12 05:01:59', '2023-06-22 09:26:17');
INSERT INTO `personal_access_tokens` VALUES (109, 'App\\Models\\User', 1, 'epatrolToken', '7e4d411fbe7fa0558d36f778068dca74fbd09f81834014c642ed1b7ff2f8a72b', '[\"*\"]', '2023-06-12 05:02:20', NULL, '2023-06-12 05:02:05', '2023-06-12 05:02:20');
INSERT INTO `personal_access_tokens` VALUES (110, 'App\\Models\\User', 22, 'epatrolToken', 'cf667b1a0f9952d43eb5db6c886420dfbb574cd418dfd6b33e8ff520201fcabe', '[\"*\"]', '2023-06-12 14:46:30', NULL, '2023-06-12 05:02:40', '2023-06-12 14:46:30');
INSERT INTO `personal_access_tokens` VALUES (111, 'App\\Models\\User', 21, 'epatrolToken', 'c35a7fbb22a54e4c000269777e19810059efd00f0b0f85e72122a565f6651b9d', '[\"*\"]', '2023-06-12 06:52:27', NULL, '2023-06-12 06:52:10', '2023-06-12 06:52:27');
INSERT INTO `personal_access_tokens` VALUES (112, 'App\\Models\\User', 21, 'epatrolToken', '48636c29d387fb96e00298190659d124d618333be488fb2e1a045a7fb2888c37', '[\"*\"]', '2023-06-12 14:28:23', NULL, '2023-06-12 07:01:33', '2023-06-12 14:28:23');
INSERT INTO `personal_access_tokens` VALUES (113, 'App\\Models\\User', 21, 'epatrolToken', 'a61b023fc290d3cac60d3923adfa0cac3febea333fec9a3a54c779aff10852e3', '[\"*\"]', '2023-06-12 15:48:44', NULL, '2023-06-12 14:26:18', '2023-06-12 15:48:44');
INSERT INTO `personal_access_tokens` VALUES (114, 'App\\Models\\User', 21, 'epatrolToken', 'e9d69199ffdc028d463cddd07738fae9a7a3e07b2e406b9a593faa3b7f3ebb34', '[\"*\"]', '2023-06-12 14:57:35', NULL, '2023-06-12 14:57:04', '2023-06-12 14:57:35');
INSERT INTO `personal_access_tokens` VALUES (115, 'App\\Models\\User', 22, 'epatrolToken', 'f3e4088040d091ce573e34c46a7198f311880e398874a2119ddf251f6da86ff6', '[\"*\"]', '2023-06-12 15:02:14', NULL, '2023-06-12 15:01:57', '2023-06-12 15:02:14');
INSERT INTO `personal_access_tokens` VALUES (116, 'App\\Models\\User', 22, 'epatrolToken', '2a288a57d76cedf83e79d8bc4d7dfff5dc152a52a7256fd122fdb220ec0d776d', '[\"*\"]', '2023-06-12 15:03:11', NULL, '2023-06-12 15:02:41', '2023-06-12 15:03:11');
INSERT INTO `personal_access_tokens` VALUES (117, 'App\\Models\\User', 22, 'epatrolToken', '9c6ea654f2150c8a1758799eec82d07f8bfa1681d7d0aa5b8033b9ed8b3196f9', '[\"*\"]', '2023-06-12 15:16:02', NULL, '2023-06-12 15:08:34', '2023-06-12 15:16:02');
INSERT INTO `personal_access_tokens` VALUES (118, 'App\\Models\\User', 21, 'epatrolToken', 'e493892aa05c36c13d86d61ad7e21f873ff9ac1572ff3fc5edf0055c7d36d82c', '[\"*\"]', '2023-06-12 15:25:17', NULL, '2023-06-12 15:16:32', '2023-06-12 15:25:17');
INSERT INTO `personal_access_tokens` VALUES (119, 'App\\Models\\User', 22, 'epatrolToken', 'de564fb80d03b386d56f0e9ba63a61a83b262d12a25fae85344a9bdb21225a47', '[\"*\"]', '2023-06-21 05:08:38', NULL, '2023-06-12 15:20:58', '2023-06-21 05:08:38');
INSERT INTO `personal_access_tokens` VALUES (120, 'App\\Models\\User', 22, 'epatrolToken', 'a8186e13cb12be92950f08f225f730a8d3fea5d2869af535f92a02814e83bd7b', '[\"*\"]', '2023-06-12 15:29:38', NULL, '2023-06-12 15:25:26', '2023-06-12 15:29:38');
INSERT INTO `personal_access_tokens` VALUES (121, 'App\\Models\\User', 21, 'epatrolToken', 'a99f2f8de8f05604dac8e2ce2888e030dd5a6a75405e4088888e69256f7d56aa', '[\"*\"]', '2023-06-12 16:06:14', NULL, '2023-06-12 16:05:57', '2023-06-12 16:06:14');
INSERT INTO `personal_access_tokens` VALUES (122, 'App\\Models\\User', 22, 'epatrolToken', '95389f17294f481f85a48002a820328040a56b33548647061eefb445a273446c', '[\"*\"]', '2023-06-12 16:08:27', NULL, '2023-06-12 16:06:30', '2023-06-12 16:08:27');
INSERT INTO `personal_access_tokens` VALUES (123, 'App\\Models\\User', 21, 'epatrolToken', '3ec2473e133797d15a702cd2fb4b0b72f73aaa3fc6dafbc4ba75e12527bbce9c', '[\"*\"]', '2023-07-14 14:01:01', NULL, '2023-06-12 16:09:26', '2023-07-14 14:01:01');
INSERT INTO `personal_access_tokens` VALUES (124, 'App\\Models\\User', 15, 'epatrolToken', '9289acb1ed8aa817abcf9c45eb69a50cb2d74dac71d0eb66a119ff513b8f27ab', '[\"*\"]', '2023-06-19 13:51:19', NULL, '2023-06-19 13:47:02', '2023-06-19 13:51:19');
INSERT INTO `personal_access_tokens` VALUES (125, 'App\\Models\\User', 1, 'epatrolToken', '83d7dbb01c98ac873257ef0ed77f77f170a6ef8e0b46341bf6550e377b04681c', '[\"*\"]', '2023-06-19 16:18:28', NULL, '2023-06-19 16:18:27', '2023-06-19 16:18:28');
INSERT INTO `personal_access_tokens` VALUES (126, 'App\\Models\\User', 24, 'epatrolToken', 'b91abdf9fa095ca75cca4a0160d2edcf5ef822fd11e05a83b25aef7c64ef9f23', '[\"*\"]', '2023-06-20 11:29:41', NULL, '2023-06-20 11:20:52', '2023-06-20 11:29:41');
INSERT INTO `personal_access_tokens` VALUES (127, 'App\\Models\\User', 21, 'epatrolToken', '9c40957543d7f70ce2ffc305aa9f0d97ab320235bc9a47149ae859be96fa0bbf', '[\"*\"]', '2023-06-22 15:45:18', NULL, '2023-06-21 08:25:14', '2023-06-22 15:45:18');
INSERT INTO `personal_access_tokens` VALUES (128, 'App\\Models\\User', 1, 'epatrolToken', '28797b0fdc0f9385cef7ddd0889b4f7523ad053095ae28e65b4e127b84c47900', '[\"*\"]', '2023-06-30 16:01:30', NULL, '2023-06-22 15:12:14', '2023-06-30 16:01:30');
INSERT INTO `personal_access_tokens` VALUES (129, 'App\\Models\\User', 1, 'epatrolToken', '6b0542eddb82c50269f7281d4b6a32a62eb330ee1b8ce90d93b529cad65c6a92', '[\"*\"]', '2023-07-17 12:46:27', NULL, '2023-06-22 15:12:47', '2023-07-17 12:46:27');
INSERT INTO `personal_access_tokens` VALUES (130, 'App\\Models\\User', 1, 'epatrolToken', 'd415f8b0faad956007d88333d74e67844c7297523d39e7d97ed536e6d3cd4ab6', '[\"*\"]', '2023-06-22 15:57:32', NULL, '2023-06-22 15:52:57', '2023-06-22 15:57:32');
INSERT INTO `personal_access_tokens` VALUES (131, 'App\\Models\\User', 22, 'epatrolToken', '3368d54c3370b0dc3caef4be83e20c2fb9acd4eebac7d5505a33bc9c4e2bf4ec', '[\"*\"]', '2023-06-23 14:36:55', NULL, '2023-06-23 14:36:54', '2023-06-23 14:36:55');
INSERT INTO `personal_access_tokens` VALUES (132, 'App\\Models\\User', 22, 'epatrolToken', '11803b709e4e60354553bef8af62b0f970ac0712a0f9c70bacee8be1d40d7377', '[\"*\"]', '2023-06-23 14:37:11', NULL, '2023-06-23 14:37:11', '2023-06-23 14:37:11');
INSERT INTO `personal_access_tokens` VALUES (133, 'App\\Models\\User', 21, 'epatrolToken', 'c8cd494808b2017f925a4fd32bf97e0069431e88ef85bd58fff8c2480562da5c', '[\"*\"]', '2023-06-23 15:06:13', NULL, '2023-06-23 14:37:31', '2023-06-23 15:06:13');
INSERT INTO `personal_access_tokens` VALUES (134, 'App\\Models\\User', 21, 'epatrolToken', 'f7120d3f7fc84b17b63ab35a2625e1b3c3adc26f682cd93d05563568474bc897', '[\"*\"]', '2023-06-23 16:10:38', NULL, '2023-06-23 16:05:39', '2023-06-23 16:10:38');
INSERT INTO `personal_access_tokens` VALUES (135, 'App\\Models\\User', 22, 'epatrolToken', 'e870aba267bbe96a64a17688c506a5c82dadd51cba0dda2b42d62a670b030522', '[\"*\"]', '2023-06-23 16:11:58', NULL, '2023-06-23 16:11:41', '2023-06-23 16:11:58');
INSERT INTO `personal_access_tokens` VALUES (136, 'App\\Models\\User', 21, 'epatrolToken', 'b2fe1dbd15ad320c659d7e7e21bc582bd8502076a915cc179018e809e9c5dfc7', '[\"*\"]', '2023-06-27 10:57:21', NULL, '2023-06-23 16:12:08', '2023-06-27 10:57:21');
INSERT INTO `personal_access_tokens` VALUES (137, 'App\\Models\\User', 1, 'epatrolToken', '516d05a2b1b5fd76c74d182f7699c1ef4bbe4a86cccd0ae297d4b4a8a34095d8', '[\"*\"]', '2023-06-27 10:52:18', NULL, '2023-06-27 10:26:58', '2023-06-27 10:52:18');
INSERT INTO `personal_access_tokens` VALUES (138, 'App\\Models\\User', 1, 'epatrolToken', '9392c9244ecaa5b5591c71c15299645058ba0efe8719d39294ddadc57545f5fa', '[\"*\"]', '2023-06-28 08:37:12', NULL, '2023-06-28 08:05:42', '2023-06-28 08:37:12');
INSERT INTO `personal_access_tokens` VALUES (139, 'App\\Models\\User', 24, 'epatrolToken', 'e72753624ed202de5894244bdf4b733a429711b513882817dbfde2f7c13ebaa9', '[\"*\"]', '2023-07-13 10:46:24', NULL, '2023-06-30 09:57:13', '2023-07-13 10:46:24');
INSERT INTO `personal_access_tokens` VALUES (140, 'App\\Models\\User', 1, 'epatrolToken', 'e40c43bab0f5be8fa61dcb85aa316bacd6466f4eced0ccc93f8d3d388aebc57f', '[\"*\"]', '2023-06-30 15:39:25', NULL, '2023-06-30 10:50:02', '2023-06-30 15:39:25');
INSERT INTO `personal_access_tokens` VALUES (141, 'App\\Models\\User', 1, 'epatrolToken', '9e25e69d6410f10fbddce86395c2574573642d70ccaa86476062b04fab3bdd5a', '[\"*\"]', NULL, NULL, '2023-07-13 15:40:58', '2023-07-13 15:40:58');
INSERT INTO `personal_access_tokens` VALUES (142, 'App\\Models\\User', 1, 'epatrolToken', '8188600124192372f1099c92188e23accab3844a5c0f5c954dc33a33b4e4db74', '[\"*\"]', '2023-07-13 08:50:02', NULL, '2023-07-13 08:46:33', '2023-07-13 08:50:02');
INSERT INTO `personal_access_tokens` VALUES (143, 'App\\Models\\User', 1, 'epatrolToken', 'd846d02225d3ddba0e4bfafea30d65655c75f82ac0c61ed7c747fd2d9354ef3d', '[\"*\"]', NULL, NULL, '2023-07-13 08:48:15', '2023-07-13 08:48:15');
INSERT INTO `personal_access_tokens` VALUES (144, 'App\\Models\\User', 1, 'epatrolToken', 'b1bfc4a5500e22a55bdbc2186ba01af08f517b6a3e99f23019350f39ef129228', '[\"*\"]', '2023-07-13 08:48:39', NULL, '2023-07-13 08:48:16', '2023-07-13 08:48:39');
INSERT INTO `personal_access_tokens` VALUES (145, 'App\\Models\\User', 1, 'epatrolToken', '6b5698e78fa0cc52a8c44c7deecd0518da519603c6e150ac7ac827e17b928c2a', '[\"*\"]', '2023-07-14 03:31:53', NULL, '2023-07-14 03:27:51', '2023-07-14 03:31:53');
INSERT INTO `personal_access_tokens` VALUES (146, 'App\\Models\\User', 1, 'epatrolToken', 'c73c7e691bd3db751b373d2d2454a66981d6ca6fe5fc0fcb0101f722d0534967', '[\"*\"]', '2023-07-17 12:46:31', NULL, '2023-07-14 03:28:21', '2023-07-17 12:46:31');
INSERT INTO `personal_access_tokens` VALUES (147, 'App\\Models\\User', 1, 'epatrolToken', '6da18fe2c0f283090e4e89ff518c262eec45c2afaef4b210f4f5e0fdbdf6a956', '[\"*\"]', '2023-07-14 14:14:31', NULL, '2023-07-14 14:01:21', '2023-07-14 14:14:31');
INSERT INTO `personal_access_tokens` VALUES (148, 'App\\Models\\User', 1, 'epatrolToken', '1e04e7817c1b7f33f36374fba616576bfe90557bf7d3a32f9ec4af60f067f652', '[\"*\"]', '2023-07-17 02:26:44', NULL, '2023-07-17 02:24:17', '2023-07-17 02:26:44');
INSERT INTO `personal_access_tokens` VALUES (149, 'App\\Models\\User', 1, 'epatrolToken', '2890603caf7ab7a55af263d5da5d3faa7b06df4933b3db1f6aa33e0a09e549af', '[\"*\"]', '2023-07-17 02:26:58', NULL, '2023-07-17 02:26:55', '2023-07-17 02:26:58');
INSERT INTO `personal_access_tokens` VALUES (150, 'App\\Models\\User', 1, 'epatrolToken', '6105e84dfc34cc33010be6a49495e18fe949ad142e9cedd5ef76faa72bfe79fe', '[\"*\"]', '2023-07-17 12:39:54', NULL, '2023-07-17 09:43:42', '2023-07-17 12:39:54');
INSERT INTO `personal_access_tokens` VALUES (151, 'App\\Models\\User', 1, 'epatrolToken', '1cb5b3a99fac408f6291a18b678a4c16c12fdfd996bd642984ec84e2fb68f93d', '[\"*\"]', '2023-07-17 05:40:06', NULL, '2023-07-17 02:55:08', '2023-07-17 05:40:06');
INSERT INTO `personal_access_tokens` VALUES (152, 'App\\Models\\User', 1, 'epatrolToken', '59d596cd5cd407d0e9e0bfb883c87a5b7fc266646e9f67265a064bf24d46131d', '[\"*\"]', '2023-07-17 12:47:16', NULL, '2023-07-17 05:40:24', '2023-07-17 12:47:16');
INSERT INTO `personal_access_tokens` VALUES (153, 'App\\Models\\User', 1, 'epatrolToken', '37eebf9483da66cdbded0a96d2a97be4538ad7f36cd3a65126784c1659585ee0', '[\"*\"]', '2023-07-17 14:26:12', NULL, '2023-07-17 14:26:12', '2023-07-17 14:26:12');
INSERT INTO `personal_access_tokens` VALUES (154, 'App\\Models\\User', 1, 'epatrolToken', '8aa980283aa70b30ba9550d644fbd7bfaf224a89671edcbec339cb172175ba00', '[\"*\"]', '2023-07-18 08:23:35', NULL, '2023-07-18 08:23:31', '2023-07-18 08:23:35');
INSERT INTO `personal_access_tokens` VALUES (155, 'App\\Models\\User', 1, 'epatrolToken', '50e29f87ab61a98a3c29e4ea6eaeded927e5e33b308351c4642ca5c34fa1ebd5', '[\"*\"]', '2023-07-18 11:25:58', NULL, '2023-07-18 11:25:25', '2023-07-18 11:25:58');

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_guard_name_unique`(`name`, `guard_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'admin', 'web', '2023-05-10 11:03:28', '2023-05-10 11:03:32');
INSERT INTO `roles` VALUES (2, 'user', 'web', '2023-05-10 11:03:48', '2023-05-10 11:03:50');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `birth_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `birth_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gender` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `employee_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email_verified_at` datetime(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `two_factor_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `two_factor_recovery_codes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'E0001', 'Admin User', 'Jakarta', '2023-5-8', 'Jakarta', NULL, 'Manajer', 'test@example.com', NULL, '$2y$10$diJpE.MGLQdbyDJUSJb14ukWXT52rxefGBFTV6dEhMhH1JCI1Giou', 'LEI0stes2bcYcE7i0nGiUx3zoaXCs2e979Whk95HhT6sBZkctpLJFEKJ0SkF', '2023-05-08 07:49:14', '2023-06-19 14:36:03', NULL, NULL, 'uploads/employee/1683705295.png');
INSERT INTO `users` VALUES (25, 'admin1', 'Admin', 'Bandung', '2023-1-1', 'Bandung', 'L', 'Admin', 'admin@gmail.com', NULL, '$2y$10$pXoQArmwZYpTGC3MBlbz/.3/idd1bnLN6QinVdocFRDmBeP4WnTtq', NULL, '2023-07-19 17:10:17', '2023-07-19 17:10:17', NULL, NULL, NULL);
INSERT INTO `users` VALUES (26, 'user1', 'User', 'bandung', NULL, 'Bandung', NULL, 'User', 'user@gmail.com', NULL, '$2y$10$awerSNtyoaFc5P8BkcO9redf0NvVrBJb11Mc1JaeW4LIyF/wKtD3q', NULL, '2023-07-19 17:10:48', '2023-07-19 17:10:48', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
