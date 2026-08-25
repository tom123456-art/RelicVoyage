/*
 Navicat Premium Data Transfer

 Source Server         : 数据库密码root
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : relic_voyage

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 25/08/2026 15:27:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for artifact_comments
-- ----------------------------
DROP TABLE IF EXISTS `artifact_comments`;
CREATE TABLE `artifact_comments`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `artifact_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_artifact_comments_artifact_created`(`artifact_id` ASC, `created_at` ASC) USING BTREE,
  INDEX `idx_artifact_comments_user_created`(`user_id` ASC, `created_at` ASC) USING BTREE,
  CONSTRAINT `fk_artifact_comments_artifact` FOREIGN KEY (`artifact_id`) REFERENCES `cultural_artifacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_artifact_comments_user` FOREIGN KEY (`user_id`) REFERENCES `user_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of artifact_comments
-- ----------------------------
INSERT INTO `artifact_comments` VALUES (1, 1, 4, '画面细节非常丰富，人物和舟车的安排让长卷阅读很有层次。', '2026-08-18 14:20:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (2, 1, 5, '如果详情页能补充作品流传经过，会更容易理解它的历史价值。', '2026-08-23 09:45:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (3, 2, 3, '青绿山水的色彩保存得很有辨识度，适合放大观察山水和人物细节。', '2026-08-20 11:08:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (4, 16, 6, '立人像的尺度和站姿很有仪式感，和三星堆其他青铜造像放在一起很有冲击力。', '2026-08-21 09:55:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (5, 17, 4, '纵目造型非常独特，希望能看到更多关于造像用途的说明。', '2026-08-22 16:12:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (6, 18, 3, '神树的结构很复杂，适合在详情页增加分层结构或局部图。', '2026-08-23 09:20:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (7, 11, 5, '帛画的上下结构很有秩序，能看出汉代对天界和人间关系的想象。', '2026-08-20 13:50:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (8, 12, 5, '素纱衣的轻薄程度很令人惊叹，建议补充纺织工艺的解释。', '2026-08-21 08:32:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (9, 27, 6, '兽首造型和玛瑙材质组合得很有特色，能体现唐代工艺的开放性。', '2026-08-22 16:40:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (10, 28, 4, '舞马纹样很有故事感，和唐代宴饮文化联系起来看更有意思。', '2026-08-24 08:32:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (11, 7, 3, '四羊方尊的装饰确实很精细，想了解它和礼仪制度之间的关系。', '2026-08-24 08:45:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (12, 23, 4, '琮式瓶的造型把玉器和瓷器联系起来，适合作为宋代器物审美的例子。', '2026-08-24 09:40:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (13, 3, 8, '五牛图中每头牛的姿态都不一样，能看出画家对动物观察得非常细。', '2026-08-18 10:28:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (14, 4, 15, '古琴的器形很克制，想进一步了解唐代琴体和后世古琴的区别。', '2026-08-18 18:24:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (15, 5, 20, '汝窑的天青釉颜色很安静，三足樽的造型也保留了礼器的感觉。', '2026-08-19 09:12:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (16, 6, 9, '后母戊鼎的体量和铭文都很有分量，适合和其他商代方鼎对照观看。', '2026-08-19 13:26:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (17, 8, 18, '人面鱼纹彩陶盆的图案很有想象力，鱼纹和人面之间的关系值得细看。', '2026-08-19 16:08:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (18, 9, 14, '妇好鸮尊把鸟的形态和礼器功能结合得很自然，造型辨识度很高。', '2026-08-20 09:38:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (19, 10, 22, '鹰形陶鼎的轮廓很有力量，能看到仰韶文化陶塑的另一种表达方式。', '2026-08-20 11:24:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (20, 13, 11, '彩绘漆棺上的云气纹让器物表面很有流动感，和汉代信仰联系很紧密。', '2026-08-20 15:16:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (21, 14, 5, '奏乐木俑让墓葬中的宴飨场景更具体了，想知道乐器分别是什么。', '2026-08-20 18:42:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (22, 15, 11, '云纹漆案的纹样很细密，漆器的日常使用和礼仪使用应该都很有讲究。', '2026-08-21 09:48:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (23, 19, 13, '戴金面罩青铜人头像的金色和青铜底色形成了很强的视觉对比。', '2026-08-21 13:08:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (24, 20, 13, '玉璋上的人物和象牙图像很特别，希望能补充它与祭祀仪式的关系。', '2026-08-21 15:32:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (25, 21, 12, '青釉兽首鼎能看出早期瓷器对青铜器造型的借鉴，器形很有意思。', '2026-08-21 18:26:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (26, 22, 14, '镇墓兽的造型有威慑感，彩色釉陶让它又多了一层装饰性。', '2026-08-22 09:22:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (27, 24, 12, '人物图盘的构图很适合从故事场景角度阅读，青花线条也很流畅。', '2026-08-22 11:18:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (28, 25, 20, '珐琅彩的颜色很明亮，竹菊鹌鹑的题材也很符合清代宫廷审美。', '2026-08-22 14:46:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (29, 26, 16, '骆驼背上的乐队让人想到唐代交通和商贸往来，叙事感非常强。', '2026-08-22 17:12:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (30, 29, 17, '多友鼎铭文提供了很多历史信息，青铜器不只是礼仪器物也是文字载体。', '2026-08-23 08:36:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (31, 30, 17, '五祀卫鼎的铭文内容很适合结合西周土地关系和贵族秩序来理解。', '2026-08-23 10:24:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (32, 1, 8, '清明上河图中的市井细节很耐看，每次放大都能发现新的生活场景。', '2026-08-23 12:18:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (33, 2, 24, '千里江山图的青绿山水很有层次，远近山势的安排特别成熟。', '2026-08-23 13:42:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (34, 3, 15, '五牛图没有复杂背景，但牛的神态把画面的节奏撑起来了。', '2026-08-23 15:08:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (35, 6, 9, '方鼎的纹饰和器形结合得很紧密，铭文也让它具有明确的历史身份。', '2026-08-23 16:34:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (36, 8, 18, '彩陶盆的图案不像单纯装饰，可能还承载着特定的文化观念。', '2026-08-23 17:28:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (37, 10, 22, '陶鹰的翅膀和腿部处理很有动感，能看出工匠对动物结构的理解。', '2026-08-23 18:16:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (38, 14, 5, '木俑的姿态让汉代宴饮和乐舞不再只是文字记载，画面感很强。', '2026-08-23 19:08:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (39, 16, 13, '青铜大立人的手势很耐人寻味，应该和祭祀或仪式场景有关。', '2026-08-23 20:12:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (40, 18, 21, '青铜神树的结构复杂得像一套完整的神话系统，值得分层观察。', '2026-08-23 21:26:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (41, 20, 13, '玉璋边缘的纹饰很精细，和三星堆青铜器放在一起能看到不同材质的礼仪表达。', '2026-08-24 07:46:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (42, 22, 14, '镇墓兽的姿态很有张力，能体现唐代墓葬艺术对想象生物的塑造。', '2026-08-24 08:12:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (43, 24, 12, '盘面人物布局很紧凑但不拥挤，青花色阶也比较丰富。', '2026-08-24 08:28:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (44, 25, 20, '瓶身的竹菊题材很雅致，珐琅彩的细节适合放大观看。', '2026-08-24 08:44:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (45, 26, 16, '骆驼和乐队组合在一起，很直观地表现出唐代开放的社会气象。', '2026-08-24 09:02:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (46, 27, 23, '玛瑙的天然纹理和兽首造型结合得很巧，难怪会成为唐代工艺的代表。', '2026-08-24 09:18:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (47, 28, 23, '舞马衔杯纹样很有动感，器物本身也带有宴饮和庆典的氛围。', '2026-08-24 09:34:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (48, 29, 17, '多友鼎的铭文让西周历史变得更具体，也能看到当时的政治秩序。', '2026-08-24 09:50:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (49, 30, 17, '五祀卫鼎可以从铭文、器形和出土地三个角度一起研究。', '2026-08-24 10:06:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (50, 4, 15, '大圣遗音琴的历史感很强，希望详情页可以增加琴面题刻的局部图。', '2026-08-24 10:22:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (51, 9, 14, '妇好鸮尊的动物造型既庄重又有神秘感，很适合了解商代礼器审美。', '2026-08-24 10:38:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (52, 15, 11, '漆案的云纹布局很有秩序，和汉代器物中的云气主题相互呼应。', '2026-08-24 10:54:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (53, 5, 20, '三足樽的圈足比例很协调，器物的线条比单纯看釉色更值得注意。', '2026-08-23 11:12:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (54, 5, 8, '汝窑釉面给人的感觉很温润，想知道不同光线下的颜色是否会变化。', '2026-08-23 11:48:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (55, 7, 9, '四羊方尊的四个羊首并不是简单重复，细节处理很有层次。', '2026-08-23 12:26:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (56, 7, 15, '方尊的整体轮廓很稳定，装饰集中在肩部和腹部，视觉重点很明确。', '2026-08-23 13:14:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (57, 7, 18, '如果能把羊首局部和器身纹饰并排展示，会更方便观察铸造细节。', '2026-08-23 14:02:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (58, 11, 5, '帛画的颜色和层次很有秩序，天地、人间和地下的区分非常明显。', '2026-08-23 14:48:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (59, 11, 24, 'T形帛画的构图体现了汉代人的宇宙想象，图像之间的联系值得梳理。', '2026-08-23 15:34:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (60, 12, 11, '衣料如此轻薄仍能保持完整，说明汉代丝织工艺已经非常成熟。', '2026-08-23 16:20:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (61, 13, 5, '漆棺上的纹样密度很高，近看和远看会产生完全不同的视觉效果。', '2026-08-23 17:06:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (62, 13, 11, '黑地和彩绘形成很强的对比，器物的礼仪属性也因此更加突出。', '2026-08-23 17:52:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (63, 17, 13, '纵目面具的眼部比例很夸张，和普通人物面部造像明显不同。', '2026-08-23 18:38:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (64, 19, 21, '金面罩边缘与青铜头像的结合很精细，贴合关系值得放大查看。', '2026-08-23 19:24:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (65, 19, 13, '金色表面让头像的仪式感更强，也体现了古蜀工艺的复杂程度。', '2026-08-23 20:10:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (66, 21, 12, '兽首装饰让青釉器物具有了更强的礼器意味，造型转换很有启发。', '2026-08-23 20:56:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (67, 21, 20, '早期青釉的质感和后世成熟瓷器不同，适合做器物发展比较。', '2026-08-23 21:42:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (68, 23, 12, '琮式瓶的外轮廓很有玉器感，说明宋代瓷器常常会借鉴古代器物。', '2026-08-24 07:20:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (69, 1, 24, '画卷中的桥梁、店铺和人物都安排得很自然，整体叙事节奏很舒服。', '2026-08-24 07:58:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (70, 2, 8, '山水之间的留白让画面呼吸感很强，青绿颜色也没有压住空间感。', '2026-08-24 08:36:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (71, 3, 15, '五牛图的线条很有力量，牛的眼神和姿态各有性格。', '2026-08-24 09:14:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (72, 6, 9, '方鼎的足部和腹部比例很有重量感，能体现商代铸造技术。', '2026-08-24 09:52:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (73, 10, 22, '鹰形陶鼎的背部和腿部处理很简洁，但整体动态非常鲜明。', '2026-08-24 10:30:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (74, 16, 13, '立人像的身体比例和手势都带有强烈的仪式感，不像普通人物雕塑。', '2026-08-24 11:08:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (75, 16, 21, '青铜表面的铸造痕迹让人物形象更有历史重量，适合看局部细节。', '2026-08-24 11:46:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (76, 18, 13, '神树的枝叶和鸟形装饰让它兼具植物形态和神话意味。', '2026-08-24 12:24:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (77, 22, 14, '镇墓兽的表情很有威慑力，彩釉又让它保留了唐代工艺的华丽感。', '2026-08-24 13:02:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (78, 22, 21, '这类想象生物很适合结合墓葬空间来理解，而不只是单独看造型。', '2026-08-24 13:40:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (79, 25, 20, '瓶身的绘画性很强，竹、菊和鹌鹑之间的疏密关系处理得很雅致。', '2026-08-24 14:18:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (80, 28, 23, '银壶上的舞马纹样有明显的运动感，器物用途和装饰主题联系得很好。', '2026-08-24 14:56:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (81, 28, 16, '鎏金部分让纹样更加突出，也让人联想到唐代宴饮中的音乐和舞蹈。', '2026-08-24 15:34:00', '2026-08-25 14:08:36');
INSERT INTO `artifact_comments` VALUES (82, 30, 17, '铭文内容和器物形制结合起来看，更能理解西周礼器背后的政治秩序。', '2026-08-24 16:12:00', '2026-08-25 14:08:36');

-- ----------------------------
-- Table structure for artifact_favorites
-- ----------------------------
DROP TABLE IF EXISTS `artifact_favorites`;
CREATE TABLE `artifact_favorites`  (
  `user_id` bigint UNSIGNED NOT NULL,
  `artifact_id` bigint UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`, `artifact_id`) USING BTREE,
  INDEX `idx_artifact_favorites_artifact`(`artifact_id` ASC) USING BTREE,
  CONSTRAINT `fk_artifact_favorites_artifact` FOREIGN KEY (`artifact_id`) REFERENCES `cultural_artifacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_artifact_favorites_user` FOREIGN KEY (`user_id`) REFERENCES `user_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of artifact_favorites
-- ----------------------------
INSERT INTO `artifact_favorites` VALUES (3, 1, '2026-08-18 10:20:00');
INSERT INTO `artifact_favorites` VALUES (3, 4, '2026-08-19 15:10:00');
INSERT INTO `artifact_favorites` VALUES (3, 6, '2026-08-18 16:20:00');
INSERT INTO `artifact_favorites` VALUES (3, 11, '2026-08-20 12:35:00');
INSERT INTO `artifact_favorites` VALUES (3, 18, '2026-08-23 15:22:00');
INSERT INTO `artifact_favorites` VALUES (3, 27, '2026-08-23 11:45:00');
INSERT INTO `artifact_favorites` VALUES (4, 2, '2026-08-17 09:30:00');
INSERT INTO `artifact_favorites` VALUES (4, 7, '2026-08-18 10:08:00');
INSERT INTO `artifact_favorites` VALUES (4, 16, '2026-08-21 17:30:00');
INSERT INTO `artifact_favorites` VALUES (4, 21, '2026-08-20 16:20:00');
INSERT INTO `artifact_favorites` VALUES (4, 24, '2026-08-22 13:05:00');
INSERT INTO `artifact_favorites` VALUES (4, 27, '2026-08-23 19:12:00');
INSERT INTO `artifact_favorites` VALUES (4, 28, '2026-08-23 18:40:00');
INSERT INTO `artifact_favorites` VALUES (5, 11, '2026-08-16 14:12:00');
INSERT INTO `artifact_favorites` VALUES (5, 12, '2026-08-16 14:18:00');
INSERT INTO `artifact_favorites` VALUES (5, 13, '2026-08-17 09:15:00');
INSERT INTO `artifact_favorites` VALUES (5, 14, '2026-08-21 10:08:00');
INSERT INTO `artifact_favorites` VALUES (5, 15, '2026-08-20 10:26:00');
INSERT INTO `artifact_favorites` VALUES (5, 25, '2026-08-22 16:48:00');
INSERT INTO `artifact_favorites` VALUES (6, 3, '2026-08-19 18:08:00');
INSERT INTO `artifact_favorites` VALUES (6, 16, '2026-08-21 20:14:00');
INSERT INTO `artifact_favorites` VALUES (6, 26, '2026-08-18 19:25:00');
INSERT INTO `artifact_favorites` VALUES (6, 27, '2026-08-19 20:35:00');
INSERT INTO `artifact_favorites` VALUES (6, 28, '2026-08-20 21:10:00');
INSERT INTO `artifact_favorites` VALUES (6, 29, '2026-08-22 09:42:00');
INSERT INTO `artifact_favorites` VALUES (6, 30, '2026-08-23 21:05:00');
INSERT INTO `artifact_favorites` VALUES (8, 1, '2026-08-18 09:42:00');
INSERT INTO `artifact_favorites` VALUES (8, 2, '2026-08-18 10:18:00');
INSERT INTO `artifact_favorites` VALUES (8, 3, '2026-08-19 11:36:00');
INSERT INTO `artifact_favorites` VALUES (8, 5, '2026-08-22 14:20:00');
INSERT INTO `artifact_favorites` VALUES (8, 18, '2026-08-19 12:00:00');
INSERT INTO `artifact_favorites` VALUES (9, 6, '2026-08-17 13:40:00');
INSERT INTO `artifact_favorites` VALUES (9, 7, '2026-08-18 15:12:00');
INSERT INTO `artifact_favorites` VALUES (9, 8, '2026-08-19 08:42:00');
INSERT INTO `artifact_favorites` VALUES (9, 9, '2026-08-20 09:26:00');
INSERT INTO `artifact_favorites` VALUES (9, 10, '2026-08-19 09:18:00');
INSERT INTO `artifact_favorites` VALUES (9, 11, '2026-08-20 10:04:00');
INSERT INTO `artifact_favorites` VALUES (9, 12, '2026-08-20 10:46:00');
INSERT INTO `artifact_favorites` VALUES (9, 29, '2026-08-23 16:44:00');
INSERT INTO `artifact_favorites` VALUES (10, 1, '2026-08-18 09:26:00');
INSERT INTO `artifact_favorites` VALUES (10, 6, '2026-08-19 14:18:00');
INSERT INTO `artifact_favorites` VALUES (10, 10, '2026-08-18 08:55:00');
INSERT INTO `artifact_favorites` VALUES (10, 11, '2026-08-19 13:10:00');
INSERT INTO `artifact_favorites` VALUES (10, 26, '2026-08-21 17:22:00');
INSERT INTO `artifact_favorites` VALUES (10, 27, '2026-08-22 20:02:00');
INSERT INTO `artifact_favorites` VALUES (11, 11, '2026-08-17 12:16:00');
INSERT INTO `artifact_favorites` VALUES (11, 12, '2026-08-16 11:18:00');
INSERT INTO `artifact_favorites` VALUES (11, 13, '2026-08-17 11:32:00');
INSERT INTO `artifact_favorites` VALUES (11, 14, '2026-08-20 15:42:00');
INSERT INTO `artifact_favorites` VALUES (11, 15, '2026-08-22 09:14:00');
INSERT INTO `artifact_favorites` VALUES (11, 22, '2026-08-21 10:32:00');
INSERT INTO `artifact_favorites` VALUES (11, 23, '2026-08-22 10:18:00');
INSERT INTO `artifact_favorites` VALUES (12, 21, '2026-08-18 17:25:00');
INSERT INTO `artifact_favorites` VALUES (12, 22, '2026-08-20 11:42:00');
INSERT INTO `artifact_favorites` VALUES (12, 23, '2026-08-19 18:40:00');
INSERT INTO `artifact_favorites` VALUES (12, 24, '2026-08-21 12:05:00');
INSERT INTO `artifact_favorites` VALUES (12, 25, '2026-08-23 10:35:00');
INSERT INTO `artifact_favorites` VALUES (12, 26, '2026-08-22 15:08:00');
INSERT INTO `artifact_favorites` VALUES (13, 16, '2026-08-17 20:10:00');
INSERT INTO `artifact_favorites` VALUES (13, 17, '2026-08-18 20:28:00');
INSERT INTO `artifact_favorites` VALUES (13, 18, '2026-08-20 21:16:00');
INSERT INTO `artifact_favorites` VALUES (13, 19, '2026-08-19 21:04:00');
INSERT INTO `artifact_favorites` VALUES (13, 20, '2026-08-22 22:04:00');
INSERT INTO `artifact_favorites` VALUES (13, 21, '2026-08-21 20:26:00');
INSERT INTO `artifact_favorites` VALUES (13, 22, '2026-08-22 08:42:00');
INSERT INTO `artifact_favorites` VALUES (13, 23, '2026-08-22 09:24:00');
INSERT INTO `artifact_favorites` VALUES (14, 1, '2026-08-17 10:16:00');
INSERT INTO `artifact_favorites` VALUES (14, 2, '2026-08-18 15:08:00');
INSERT INTO `artifact_favorites` VALUES (14, 4, '2026-08-16 09:44:00');
INSERT INTO `artifact_favorites` VALUES (14, 8, '2026-08-18 14:22:00');
INSERT INTO `artifact_favorites` VALUES (14, 22, '2026-08-21 16:18:00');
INSERT INTO `artifact_favorites` VALUES (14, 30, '2026-08-23 08:46:00');
INSERT INTO `artifact_favorites` VALUES (15, 1, '2026-08-17 15:08:00');
INSERT INTO `artifact_favorites` VALUES (15, 2, '2026-08-17 16:14:00');
INSERT INTO `artifact_favorites` VALUES (15, 3, '2026-08-19 11:18:00');
INSERT INTO `artifact_favorites` VALUES (15, 4, '2026-08-20 12:06:00');
INSERT INTO `artifact_favorites` VALUES (15, 6, '2026-08-19 10:42:00');
INSERT INTO `artifact_favorites` VALUES (15, 19, '2026-08-21 19:26:00');
INSERT INTO `artifact_favorites` VALUES (15, 29, '2026-08-22 17:52:00');
INSERT INTO `artifact_favorites` VALUES (16, 2, '2026-08-18 12:16:00');
INSERT INTO `artifact_favorites` VALUES (16, 6, '2026-08-19 13:24:00');
INSERT INTO `artifact_favorites` VALUES (16, 7, '2026-08-20 14:12:00');
INSERT INTO `artifact_favorites` VALUES (16, 11, '2026-08-20 13:48:00');
INSERT INTO `artifact_favorites` VALUES (16, 26, '2026-08-22 18:30:00');
INSERT INTO `artifact_favorites` VALUES (16, 28, '2026-08-23 20:18:00');
INSERT INTO `artifact_favorites` VALUES (17, 5, '2026-08-16 16:10:00');
INSERT INTO `artifact_favorites` VALUES (17, 6, '2026-08-17 16:48:00');
INSERT INTO `artifact_favorites` VALUES (17, 7, '2026-08-18 11:04:00');
INSERT INTO `artifact_favorites` VALUES (17, 8, '2026-08-18 12:26:00');
INSERT INTO `artifact_favorites` VALUES (17, 9, '2026-08-21 09:56:00');
INSERT INTO `artifact_favorites` VALUES (17, 10, '2026-08-21 10:38:00');
INSERT INTO `artifact_favorites` VALUES (17, 29, '2026-08-22 18:14:00');
INSERT INTO `artifact_favorites` VALUES (17, 30, '2026-08-23 14:36:00');
INSERT INTO `artifact_favorites` VALUES (18, 8, '2026-08-17 18:16:00');
INSERT INTO `artifact_favorites` VALUES (18, 10, '2026-08-19 16:42:00');
INSERT INTO `artifact_favorites` VALUES (18, 12, '2026-08-18 19:42:00');
INSERT INTO `artifact_favorites` VALUES (18, 13, '2026-08-21 11:08:00');
INSERT INTO `artifact_favorites` VALUES (18, 14, '2026-08-20 15:26:00');
INSERT INTO `artifact_favorites` VALUES (18, 15, '2026-08-22 12:44:00');
INSERT INTO `artifact_favorites` VALUES (18, 16, '2026-08-21 12:18:00');
INSERT INTO `artifact_favorites` VALUES (19, 16, '2026-08-18 19:08:00');
INSERT INTO `artifact_favorites` VALUES (19, 17, '2026-08-19 20:24:00');
INSERT INTO `artifact_favorites` VALUES (19, 20, '2026-08-20 17:34:00');
INSERT INTO `artifact_favorites` VALUES (19, 22, '2026-08-22 15:28:00');
INSERT INTO `artifact_favorites` VALUES (19, 24, '2026-08-23 11:26:00');
INSERT INTO `artifact_favorites` VALUES (20, 2, '2026-08-18 11:12:00');
INSERT INTO `artifact_favorites` VALUES (20, 3, '2026-08-17 10:30:00');
INSERT INTO `artifact_favorites` VALUES (20, 4, '2026-08-20 13:36:00');
INSERT INTO `artifact_favorites` VALUES (20, 5, '2026-08-19 12:08:00');
INSERT INTO `artifact_favorites` VALUES (20, 6, '2026-08-21 15:14:00');
INSERT INTO `artifact_favorites` VALUES (20, 7, '2026-08-22 16:06:00');
INSERT INTO `artifact_favorites` VALUES (20, 21, '2026-08-21 14:16:00');
INSERT INTO `artifact_favorites` VALUES (20, 23, '2026-08-22 19:40:00');
INSERT INTO `artifact_favorites` VALUES (21, 16, '2026-08-19 14:48:00');
INSERT INTO `artifact_favorites` VALUES (21, 17, '2026-08-18 13:22:00');
INSERT INTO `artifact_favorites` VALUES (21, 18, '2026-08-20 14:54:00');
INSERT INTO `artifact_favorites` VALUES (21, 19, '2026-08-22 08:18:00');
INSERT INTO `artifact_favorites` VALUES (21, 20, '2026-08-20 15:36:00');
INSERT INTO `artifact_favorites` VALUES (21, 27, '2026-08-23 17:06:00');
INSERT INTO `artifact_favorites` VALUES (21, 28, '2026-08-22 09:52:00');
INSERT INTO `artifact_favorites` VALUES (22, 4, '2026-08-16 12:42:00');
INSERT INTO `artifact_favorites` VALUES (22, 5, '2026-08-17 13:18:00');
INSERT INTO `artifact_favorites` VALUES (22, 13, '2026-08-20 17:08:00');
INSERT INTO `artifact_favorites` VALUES (22, 14, '2026-08-18 17:16:00');
INSERT INTO `artifact_favorites` VALUES (22, 25, '2026-08-21 16:52:00');
INSERT INTO `artifact_favorites` VALUES (22, 29, '2026-08-23 09:34:00');
INSERT INTO `artifact_favorites` VALUES (23, 12, '2026-08-17 20:22:00');
INSERT INTO `artifact_favorites` VALUES (23, 16, '2026-08-18 21:20:00');
INSERT INTO `artifact_favorites` VALUES (23, 18, '2026-08-20 22:06:00');
INSERT INTO `artifact_favorites` VALUES (23, 24, '2026-08-22 12:34:00');
INSERT INTO `artifact_favorites` VALUES (23, 26, '2026-08-19 21:10:00');
INSERT INTO `artifact_favorites` VALUES (23, 27, '2026-08-23 14:22:00');
INSERT INTO `artifact_favorites` VALUES (23, 28, '2026-08-22 22:18:00');
INSERT INTO `artifact_favorites` VALUES (23, 30, '2026-08-24 08:08:00');
INSERT INTO `artifact_favorites` VALUES (24, 1, '2026-08-18 16:46:00');
INSERT INTO `artifact_favorites` VALUES (24, 2, '2026-08-19 09:56:00');
INSERT INTO `artifact_favorites` VALUES (24, 3, '2026-08-20 10:12:00');
INSERT INTO `artifact_favorites` VALUES (24, 5, '2026-08-20 10:44:00');
INSERT INTO `artifact_favorites` VALUES (24, 8, '2026-08-21 11:28:00');
INSERT INTO `artifact_favorites` VALUES (24, 24, '2026-08-22 11:36:00');
INSERT INTO `artifact_favorites` VALUES (24, 27, '2026-08-23 13:48:00');

-- ----------------------------
-- Table structure for comment_likes
-- ----------------------------
DROP TABLE IF EXISTS `comment_likes`;
CREATE TABLE `comment_likes`  (
  `comment_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`, `user_id`) USING BTREE,
  INDEX `idx_comment_likes_user`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_comment_likes_comment` FOREIGN KEY (`comment_id`) REFERENCES `artifact_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_likes_user` FOREIGN KEY (`user_id`) REFERENCES `user_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment_likes
-- ----------------------------
INSERT INTO `comment_likes` VALUES (1, 3, '2026-08-18 15:20:00');
INSERT INTO `comment_likes` VALUES (1, 4, '2026-08-18 14:25:00');
INSERT INTO `comment_likes` VALUES (1, 5, '2026-08-18 16:10:00');
INSERT INTO `comment_likes` VALUES (1, 6, '2026-08-19 08:12:00');
INSERT INTO `comment_likes` VALUES (1, 8, '2026-08-18 14:29:00');
INSERT INTO `comment_likes` VALUES (1, 9, '2026-08-18 14:30:00');
INSERT INTO `comment_likes` VALUES (1, 10, '2026-08-18 14:31:00');
INSERT INTO `comment_likes` VALUES (2, 3, '2026-08-23 09:50:00');
INSERT INTO `comment_likes` VALUES (2, 4, '2026-08-23 09:51:00');
INSERT INTO `comment_likes` VALUES (2, 5, '2026-08-23 09:52:00');
INSERT INTO `comment_likes` VALUES (2, 6, '2026-08-23 09:53:00');
INSERT INTO `comment_likes` VALUES (2, 8, '2026-08-23 10:28:00');
INSERT INTO `comment_likes` VALUES (2, 9, '2026-08-23 09:56:00');
INSERT INTO `comment_likes` VALUES (2, 10, '2026-08-23 11:06:00');
INSERT INTO `comment_likes` VALUES (2, 11, '2026-08-23 09:58:00');
INSERT INTO `comment_likes` VALUES (2, 12, '2026-08-23 09:59:00');
INSERT INTO `comment_likes` VALUES (2, 13, '2026-08-23 10:00:00');
INSERT INTO `comment_likes` VALUES (2, 14, '2026-08-23 10:01:00');
INSERT INTO `comment_likes` VALUES (2, 15, '2026-08-23 10:02:00');
INSERT INTO `comment_likes` VALUES (2, 16, '2026-08-23 10:03:00');
INSERT INTO `comment_likes` VALUES (2, 17, '2026-08-23 10:04:00');
INSERT INTO `comment_likes` VALUES (3, 3, '2026-08-20 11:14:00');
INSERT INTO `comment_likes` VALUES (3, 4, '2026-08-20 12:05:00');
INSERT INTO `comment_likes` VALUES (3, 5, '2026-08-20 11:16:00');
INSERT INTO `comment_likes` VALUES (3, 6, '2026-08-20 13:25:00');
INSERT INTO `comment_likes` VALUES (3, 8, '2026-08-20 12:05:00');
INSERT INTO `comment_likes` VALUES (3, 9, '2026-08-20 11:20:00');
INSERT INTO `comment_likes` VALUES (3, 12, '2026-08-20 13:25:00');
INSERT INTO `comment_likes` VALUES (4, 3, '2026-08-21 11:10:00');
INSERT INTO `comment_likes` VALUES (4, 4, '2026-08-21 10:03:00');
INSERT INTO `comment_likes` VALUES (4, 5, '2026-08-21 12:30:00');
INSERT INTO `comment_likes` VALUES (4, 6, '2026-08-21 10:05:00');
INSERT INTO `comment_likes` VALUES (4, 8, '2026-08-21 10:07:00');
INSERT INTO `comment_likes` VALUES (4, 9, '2026-08-21 11:10:00');
INSERT INTO `comment_likes` VALUES (4, 10, '2026-08-21 10:09:00');
INSERT INTO `comment_likes` VALUES (4, 11, '2026-08-21 10:10:00');
INSERT INTO `comment_likes` VALUES (4, 12, '2026-08-21 10:11:00');
INSERT INTO `comment_likes` VALUES (4, 13, '2026-08-21 12:30:00');
INSERT INTO `comment_likes` VALUES (4, 14, '2026-08-21 10:13:00');
INSERT INTO `comment_likes` VALUES (4, 15, '2026-08-21 10:14:00');
INSERT INTO `comment_likes` VALUES (4, 16, '2026-08-21 10:15:00');
INSERT INTO `comment_likes` VALUES (5, 3, '2026-08-22 16:20:00');
INSERT INTO `comment_likes` VALUES (5, 4, '2026-08-22 16:21:00');
INSERT INTO `comment_likes` VALUES (5, 5, '2026-08-22 16:22:00');
INSERT INTO `comment_likes` VALUES (5, 6, '2026-08-22 16:23:00');
INSERT INTO `comment_likes` VALUES (5, 8, '2026-08-22 17:42:00');
INSERT INTO `comment_likes` VALUES (5, 14, '2026-08-22 18:16:00');
INSERT INTO `comment_likes` VALUES (6, 3, '2026-08-23 11:20:00');
INSERT INTO `comment_likes` VALUES (6, 4, '2026-08-23 12:40:00');
INSERT INTO `comment_likes` VALUES (6, 5, '2026-08-23 09:31:00');
INSERT INTO `comment_likes` VALUES (6, 6, '2026-08-23 09:32:00');
INSERT INTO `comment_likes` VALUES (6, 8, '2026-08-23 11:20:00');
INSERT INTO `comment_likes` VALUES (6, 9, '2026-08-23 09:35:00');
INSERT INTO `comment_likes` VALUES (6, 10, '2026-08-23 09:36:00');
INSERT INTO `comment_likes` VALUES (6, 11, '2026-08-23 12:40:00');
INSERT INTO `comment_likes` VALUES (6, 12, '2026-08-23 09:38:00');
INSERT INTO `comment_likes` VALUES (6, 13, '2026-08-23 09:39:00');
INSERT INTO `comment_likes` VALUES (6, 14, '2026-08-23 09:40:00');
INSERT INTO `comment_likes` VALUES (6, 15, '2026-08-23 09:41:00');
INSERT INTO `comment_likes` VALUES (7, 3, '2026-08-20 15:00:00');
INSERT INTO `comment_likes` VALUES (7, 4, '2026-08-20 14:01:00');
INSERT INTO `comment_likes` VALUES (7, 5, '2026-08-24 08:58:00');
INSERT INTO `comment_likes` VALUES (7, 6, '2026-08-20 14:03:00');
INSERT INTO `comment_likes` VALUES (7, 9, '2026-08-24 09:12:00');
INSERT INTO `comment_likes` VALUES (8, 3, '2026-08-21 08:43:00');
INSERT INTO `comment_likes` VALUES (8, 4, '2026-08-21 08:44:00');
INSERT INTO `comment_likes` VALUES (8, 5, '2026-08-21 08:45:00');
INSERT INTO `comment_likes` VALUES (8, 6, '2026-08-21 10:00:00');
INSERT INTO `comment_likes` VALUES (8, 8, '2026-08-21 08:48:00');
INSERT INTO `comment_likes` VALUES (8, 9, '2026-08-21 08:49:00');
INSERT INTO `comment_likes` VALUES (8, 10, '2026-08-21 08:50:00');
INSERT INTO `comment_likes` VALUES (8, 11, '2026-08-21 10:00:00');
INSERT INTO `comment_likes` VALUES (8, 12, '2026-08-21 08:52:00');
INSERT INTO `comment_likes` VALUES (8, 13, '2026-08-21 08:53:00');
INSERT INTO `comment_likes` VALUES (8, 14, '2026-08-21 10:34:00');
INSERT INTO `comment_likes` VALUES (9, 3, '2026-08-22 16:52:00');
INSERT INTO `comment_likes` VALUES (9, 4, '2026-08-22 18:20:00');
INSERT INTO `comment_likes` VALUES (9, 5, '2026-08-22 16:54:00');
INSERT INTO `comment_likes` VALUES (9, 6, '2026-08-22 18:42:00');
INSERT INTO `comment_likes` VALUES (9, 10, '2026-08-22 19:20:00');
INSERT INTO `comment_likes` VALUES (10, 3, '2026-08-24 08:45:00');
INSERT INTO `comment_likes` VALUES (10, 4, '2026-08-24 08:46:00');
INSERT INTO `comment_likes` VALUES (10, 5, '2026-08-24 08:47:00');
INSERT INTO `comment_likes` VALUES (10, 6, '2026-08-24 08:48:00');
INSERT INTO `comment_likes` VALUES (10, 8, '2026-08-24 08:50:00');
INSERT INTO `comment_likes` VALUES (10, 9, '2026-08-24 08:51:00');
INSERT INTO `comment_likes` VALUES (10, 10, '2026-08-24 08:52:00');
INSERT INTO `comment_likes` VALUES (10, 11, '2026-08-24 08:53:00');
INSERT INTO `comment_likes` VALUES (10, 12, '2026-08-24 09:12:00');
INSERT INTO `comment_likes` VALUES (10, 13, '2026-08-24 08:55:00');
INSERT INTO `comment_likes` VALUES (10, 16, '2026-08-24 09:48:00');
INSERT INTO `comment_likes` VALUES (11, 3, '2026-08-24 08:59:00');
INSERT INTO `comment_likes` VALUES (11, 4, '2026-08-24 09:00:00');
INSERT INTO `comment_likes` VALUES (11, 5, '2026-08-24 09:01:00');
INSERT INTO `comment_likes` VALUES (11, 13, '2026-08-24 09:22:00');
INSERT INTO `comment_likes` VALUES (11, 15, '2026-08-24 09:40:00');
INSERT INTO `comment_likes` VALUES (12, 3, '2026-08-24 10:30:00');
INSERT INTO `comment_likes` VALUES (12, 4, '2026-08-24 10:48:00');
INSERT INTO `comment_likes` VALUES (12, 5, '2026-08-24 09:57:00');
INSERT INTO `comment_likes` VALUES (12, 6, '2026-08-24 09:58:00');
INSERT INTO `comment_likes` VALUES (12, 8, '2026-08-24 10:00:00');
INSERT INTO `comment_likes` VALUES (12, 9, '2026-08-24 10:01:00');
INSERT INTO `comment_likes` VALUES (12, 10, '2026-08-24 10:02:00');
INSERT INTO `comment_likes` VALUES (12, 11, '2026-08-24 10:03:00');
INSERT INTO `comment_likes` VALUES (12, 12, '2026-08-24 11:06:00');
INSERT INTO `comment_likes` VALUES (13, 3, '2026-08-18 10:44:00');
INSERT INTO `comment_likes` VALUES (13, 4, '2026-08-18 10:45:00');
INSERT INTO `comment_likes` VALUES (13, 8, '2026-08-18 11:32:00');
INSERT INTO `comment_likes` VALUES (13, 15, '2026-08-18 12:08:00');
INSERT INTO `comment_likes` VALUES (14, 3, '2026-08-18 18:41:00');
INSERT INTO `comment_likes` VALUES (14, 4, '2026-08-18 18:42:00');
INSERT INTO `comment_likes` VALUES (14, 5, '2026-08-18 19:20:00');
INSERT INTO `comment_likes` VALUES (14, 6, '2026-08-18 18:44:00');
INSERT INTO `comment_likes` VALUES (14, 8, '2026-08-18 18:46:00');
INSERT INTO `comment_likes` VALUES (14, 9, '2026-08-18 18:47:00');
INSERT INTO `comment_likes` VALUES (14, 10, '2026-08-18 18:48:00');
INSERT INTO `comment_likes` VALUES (14, 11, '2026-08-18 19:42:00');
INSERT INTO `comment_likes` VALUES (15, 3, '2026-08-19 09:30:00');
INSERT INTO `comment_likes` VALUES (15, 12, '2026-08-19 10:22:00');
INSERT INTO `comment_likes` VALUES (15, 20, '2026-08-19 10:48:00');
INSERT INTO `comment_likes` VALUES (16, 3, '2026-08-19 13:45:00');
INSERT INTO `comment_likes` VALUES (16, 4, '2026-08-19 13:46:00');
INSERT INTO `comment_likes` VALUES (16, 5, '2026-08-19 13:47:00');
INSERT INTO `comment_likes` VALUES (16, 6, '2026-08-19 13:48:00');
INSERT INTO `comment_likes` VALUES (16, 8, '2026-08-19 13:50:00');
INSERT INTO `comment_likes` VALUES (16, 9, '2026-08-19 14:38:00');
INSERT INTO `comment_likes` VALUES (16, 10, '2026-08-19 13:52:00');
INSERT INTO `comment_likes` VALUES (16, 17, '2026-08-19 15:02:00');
INSERT INTO `comment_likes` VALUES (17, 3, '2026-08-19 16:28:00');
INSERT INTO `comment_likes` VALUES (17, 4, '2026-08-19 16:29:00');
INSERT INTO `comment_likes` VALUES (17, 5, '2026-08-19 16:30:00');
INSERT INTO `comment_likes` VALUES (17, 6, '2026-08-19 16:31:00');
INSERT INTO `comment_likes` VALUES (17, 8, '2026-08-19 16:33:00');
INSERT INTO `comment_likes` VALUES (17, 9, '2026-08-19 16:34:00');
INSERT INTO `comment_likes` VALUES (17, 10, '2026-08-19 16:35:00');
INSERT INTO `comment_likes` VALUES (17, 11, '2026-08-19 16:36:00');
INSERT INTO `comment_likes` VALUES (17, 12, '2026-08-19 16:37:00');
INSERT INTO `comment_likes` VALUES (17, 13, '2026-08-19 16:38:00');
INSERT INTO `comment_likes` VALUES (17, 14, '2026-08-19 16:39:00');
INSERT INTO `comment_likes` VALUES (17, 15, '2026-08-19 16:40:00');
INSERT INTO `comment_likes` VALUES (17, 16, '2026-08-19 16:41:00');
INSERT INTO `comment_likes` VALUES (17, 17, '2026-08-19 16:42:00');
INSERT INTO `comment_likes` VALUES (17, 18, '2026-08-19 17:24:00');
INSERT INTO `comment_likes` VALUES (17, 22, '2026-08-19 17:58:00');
INSERT INTO `comment_likes` VALUES (18, 3, '2026-08-20 09:59:00');
INSERT INTO `comment_likes` VALUES (18, 4, '2026-08-20 10:00:00');
INSERT INTO `comment_likes` VALUES (18, 5, '2026-08-20 10:01:00');
INSERT INTO `comment_likes` VALUES (18, 6, '2026-08-20 10:02:00');
INSERT INTO `comment_likes` VALUES (18, 8, '2026-08-20 10:04:00');
INSERT INTO `comment_likes` VALUES (18, 9, '2026-08-20 10:05:00');
INSERT INTO `comment_likes` VALUES (18, 13, '2026-08-20 10:42:00');
INSERT INTO `comment_likes` VALUES (18, 14, '2026-08-20 11:16:00');
INSERT INTO `comment_likes` VALUES (19, 3, '2026-08-20 11:46:00');
INSERT INTO `comment_likes` VALUES (19, 4, '2026-08-20 11:47:00');
INSERT INTO `comment_likes` VALUES (19, 5, '2026-08-20 11:48:00');
INSERT INTO `comment_likes` VALUES (19, 6, '2026-08-20 11:49:00');
INSERT INTO `comment_likes` VALUES (19, 8, '2026-08-20 11:51:00');
INSERT INTO `comment_likes` VALUES (19, 9, '2026-08-20 11:52:00');
INSERT INTO `comment_likes` VALUES (19, 10, '2026-08-20 11:53:00');
INSERT INTO `comment_likes` VALUES (19, 11, '2026-08-20 11:54:00');
INSERT INTO `comment_likes` VALUES (19, 12, '2026-08-20 11:55:00');
INSERT INTO `comment_likes` VALUES (19, 13, '2026-08-20 11:56:00');
INSERT INTO `comment_likes` VALUES (19, 14, '2026-08-20 11:57:00');
INSERT INTO `comment_likes` VALUES (19, 15, '2026-08-20 11:58:00');
INSERT INTO `comment_likes` VALUES (19, 16, '2026-08-20 11:59:00');
INSERT INTO `comment_likes` VALUES (19, 18, '2026-08-20 12:18:00');
INSERT INTO `comment_likes` VALUES (19, 22, '2026-08-20 12:52:00');
INSERT INTO `comment_likes` VALUES (20, 3, '2026-08-20 15:39:00');
INSERT INTO `comment_likes` VALUES (20, 4, '2026-08-20 15:40:00');
INSERT INTO `comment_likes` VALUES (20, 5, '2026-08-20 15:41:00');
INSERT INTO `comment_likes` VALUES (20, 6, '2026-08-20 15:42:00');
INSERT INTO `comment_likes` VALUES (20, 8, '2026-08-20 15:44:00');
INSERT INTO `comment_likes` VALUES (20, 11, '2026-08-20 16:22:00');
INSERT INTO `comment_likes` VALUES (20, 15, '2026-08-20 16:50:00');
INSERT INTO `comment_likes` VALUES (21, 3, '2026-08-20 19:06:00');
INSERT INTO `comment_likes` VALUES (21, 4, '2026-08-20 19:07:00');
INSERT INTO `comment_likes` VALUES (21, 5, '2026-08-20 19:42:00');
INSERT INTO `comment_likes` VALUES (21, 6, '2026-08-20 19:09:00');
INSERT INTO `comment_likes` VALUES (21, 8, '2026-08-20 19:11:00');
INSERT INTO `comment_likes` VALUES (21, 9, '2026-08-20 19:12:00');
INSERT INTO `comment_likes` VALUES (21, 10, '2026-08-20 19:13:00');
INSERT INTO `comment_likes` VALUES (21, 11, '2026-08-20 19:14:00');
INSERT INTO `comment_likes` VALUES (21, 12, '2026-08-20 19:15:00');
INSERT INTO `comment_likes` VALUES (21, 13, '2026-08-20 19:16:00');
INSERT INTO `comment_likes` VALUES (21, 14, '2026-08-20 20:18:00');
INSERT INTO `comment_likes` VALUES (21, 15, '2026-08-20 19:18:00');
INSERT INTO `comment_likes` VALUES (22, 3, '2026-08-21 10:13:00');
INSERT INTO `comment_likes` VALUES (22, 4, '2026-08-21 10:14:00');
INSERT INTO `comment_likes` VALUES (22, 5, '2026-08-21 10:15:00');
INSERT INTO `comment_likes` VALUES (22, 6, '2026-08-21 10:16:00');
INSERT INTO `comment_likes` VALUES (22, 11, '2026-08-21 10:48:00');
INSERT INTO `comment_likes` VALUES (22, 20, '2026-08-21 11:20:00');
INSERT INTO `comment_likes` VALUES (23, 3, '2026-08-21 13:34:00');
INSERT INTO `comment_likes` VALUES (23, 4, '2026-08-21 13:35:00');
INSERT INTO `comment_likes` VALUES (23, 5, '2026-08-21 13:36:00');
INSERT INTO `comment_likes` VALUES (23, 6, '2026-08-21 13:37:00');
INSERT INTO `comment_likes` VALUES (23, 8, '2026-08-21 13:39:00');
INSERT INTO `comment_likes` VALUES (23, 9, '2026-08-21 13:40:00');
INSERT INTO `comment_likes` VALUES (23, 10, '2026-08-21 13:41:00');
INSERT INTO `comment_likes` VALUES (23, 11, '2026-08-21 13:42:00');
INSERT INTO `comment_likes` VALUES (23, 12, '2026-08-21 13:43:00');
INSERT INTO `comment_likes` VALUES (23, 13, '2026-08-21 14:42:00');
INSERT INTO `comment_likes` VALUES (23, 14, '2026-08-21 13:45:00');
INSERT INTO `comment_likes` VALUES (23, 21, '2026-08-21 15:18:00');
INSERT INTO `comment_likes` VALUES (24, 3, '2026-08-21 15:59:00');
INSERT INTO `comment_likes` VALUES (24, 4, '2026-08-21 16:00:00');
INSERT INTO `comment_likes` VALUES (24, 5, '2026-08-21 16:01:00');
INSERT INTO `comment_likes` VALUES (24, 6, '2026-08-21 16:02:00');
INSERT INTO `comment_likes` VALUES (24, 13, '2026-08-21 16:52:00');
INSERT INTO `comment_likes` VALUES (24, 19, '2026-08-21 17:28:00');
INSERT INTO `comment_likes` VALUES (25, 3, '2026-08-21 18:54:00');
INSERT INTO `comment_likes` VALUES (25, 4, '2026-08-21 18:55:00');
INSERT INTO `comment_likes` VALUES (25, 5, '2026-08-21 18:56:00');
INSERT INTO `comment_likes` VALUES (25, 6, '2026-08-21 18:57:00');
INSERT INTO `comment_likes` VALUES (25, 8, '2026-08-21 18:59:00');
INSERT INTO `comment_likes` VALUES (25, 9, '2026-08-21 19:00:00');
INSERT INTO `comment_likes` VALUES (25, 10, '2026-08-21 19:01:00');
INSERT INTO `comment_likes` VALUES (25, 11, '2026-08-21 19:02:00');
INSERT INTO `comment_likes` VALUES (25, 12, '2026-08-21 19:24:00');
INSERT INTO `comment_likes` VALUES (25, 13, '2026-08-21 19:04:00');
INSERT INTO `comment_likes` VALUES (25, 20, '2026-08-21 19:58:00');
INSERT INTO `comment_likes` VALUES (26, 3, '2026-08-22 09:51:00');
INSERT INTO `comment_likes` VALUES (26, 4, '2026-08-22 09:52:00');
INSERT INTO `comment_likes` VALUES (26, 5, '2026-08-22 09:53:00');
INSERT INTO `comment_likes` VALUES (26, 14, '2026-08-22 10:38:00');
INSERT INTO `comment_likes` VALUES (26, 16, '2026-08-22 11:14:00');
INSERT INTO `comment_likes` VALUES (27, 3, '2026-08-22 11:48:00');
INSERT INTO `comment_likes` VALUES (27, 4, '2026-08-22 11:49:00');
INSERT INTO `comment_likes` VALUES (27, 5, '2026-08-22 11:50:00');
INSERT INTO `comment_likes` VALUES (27, 6, '2026-08-22 11:51:00');
INSERT INTO `comment_likes` VALUES (27, 8, '2026-08-22 11:53:00');
INSERT INTO `comment_likes` VALUES (27, 9, '2026-08-22 11:54:00');
INSERT INTO `comment_likes` VALUES (27, 10, '2026-08-22 11:55:00');
INSERT INTO `comment_likes` VALUES (27, 11, '2026-08-22 11:56:00');
INSERT INTO `comment_likes` VALUES (27, 12, '2026-08-22 12:42:00');
INSERT INTO `comment_likes` VALUES (27, 24, '2026-08-22 13:20:00');
INSERT INTO `comment_likes` VALUES (28, 3, '2026-08-22 15:17:00');
INSERT INTO `comment_likes` VALUES (28, 4, '2026-08-22 15:18:00');
INSERT INTO `comment_likes` VALUES (28, 20, '2026-08-22 15:56:00');
INSERT INTO `comment_likes` VALUES (28, 22, '2026-08-22 16:22:00');
INSERT INTO `comment_likes` VALUES (29, 3, '2026-08-22 17:44:00');
INSERT INTO `comment_likes` VALUES (29, 4, '2026-08-22 17:45:00');
INSERT INTO `comment_likes` VALUES (29, 5, '2026-08-22 17:46:00');
INSERT INTO `comment_likes` VALUES (29, 6, '2026-08-22 17:47:00');
INSERT INTO `comment_likes` VALUES (29, 8, '2026-08-22 17:49:00');
INSERT INTO `comment_likes` VALUES (29, 9, '2026-08-22 17:50:00');
INSERT INTO `comment_likes` VALUES (29, 10, '2026-08-22 17:51:00');
INSERT INTO `comment_likes` VALUES (29, 11, '2026-08-22 17:52:00');
INSERT INTO `comment_likes` VALUES (29, 16, '2026-08-22 18:32:00');
INSERT INTO `comment_likes` VALUES (29, 23, '2026-08-22 19:08:00');
INSERT INTO `comment_likes` VALUES (30, 3, '2026-08-23 09:09:00');
INSERT INTO `comment_likes` VALUES (30, 17, '2026-08-23 09:44:00');
INSERT INTO `comment_likes` VALUES (30, 21, '2026-08-23 10:16:00');
INSERT INTO `comment_likes` VALUES (31, 3, '2026-08-23 10:58:00');
INSERT INTO `comment_likes` VALUES (31, 4, '2026-08-23 10:59:00');
INSERT INTO `comment_likes` VALUES (31, 5, '2026-08-23 11:00:00');
INSERT INTO `comment_likes` VALUES (31, 6, '2026-08-23 11:01:00');
INSERT INTO `comment_likes` VALUES (31, 8, '2026-08-23 11:03:00');
INSERT INTO `comment_likes` VALUES (31, 9, '2026-08-23 11:04:00');
INSERT INTO `comment_likes` VALUES (31, 10, '2026-08-23 11:05:00');
INSERT INTO `comment_likes` VALUES (31, 17, '2026-08-23 11:42:00');
INSERT INTO `comment_likes` VALUES (31, 22, '2026-08-23 12:14:00');
INSERT INTO `comment_likes` VALUES (32, 3, '2026-08-23 12:53:00');
INSERT INTO `comment_likes` VALUES (32, 4, '2026-08-23 12:54:00');
INSERT INTO `comment_likes` VALUES (32, 5, '2026-08-23 12:55:00');
INSERT INTO `comment_likes` VALUES (32, 6, '2026-08-23 12:56:00');
INSERT INTO `comment_likes` VALUES (32, 8, '2026-08-23 13:28:00');
INSERT INTO `comment_likes` VALUES (32, 9, '2026-08-23 12:59:00');
INSERT INTO `comment_likes` VALUES (32, 10, '2026-08-23 13:00:00');
INSERT INTO `comment_likes` VALUES (32, 11, '2026-08-23 13:01:00');
INSERT INTO `comment_likes` VALUES (32, 12, '2026-08-23 13:02:00');
INSERT INTO `comment_likes` VALUES (32, 13, '2026-08-23 13:03:00');
INSERT INTO `comment_likes` VALUES (32, 14, '2026-08-23 13:04:00');
INSERT INTO `comment_likes` VALUES (32, 15, '2026-08-23 13:05:00');
INSERT INTO `comment_likes` VALUES (32, 16, '2026-08-23 13:06:00');
INSERT INTO `comment_likes` VALUES (32, 17, '2026-08-23 13:07:00');
INSERT INTO `comment_likes` VALUES (32, 24, '2026-08-23 13:56:00');
INSERT INTO `comment_likes` VALUES (33, 3, '2026-08-23 14:18:00');
INSERT INTO `comment_likes` VALUES (33, 4, '2026-08-23 14:19:00');
INSERT INTO `comment_likes` VALUES (33, 5, '2026-08-23 14:20:00');
INSERT INTO `comment_likes` VALUES (33, 6, '2026-08-23 14:21:00');
INSERT INTO `comment_likes` VALUES (33, 8, '2026-08-23 14:18:00');
INSERT INTO `comment_likes` VALUES (33, 9, '2026-08-23 14:24:00');
INSERT INTO `comment_likes` VALUES (33, 15, '2026-08-23 14:52:00');
INSERT INTO `comment_likes` VALUES (34, 3, '2026-08-23 15:45:00');
INSERT INTO `comment_likes` VALUES (34, 4, '2026-08-23 15:46:00');
INSERT INTO `comment_likes` VALUES (34, 5, '2026-08-23 15:47:00');
INSERT INTO `comment_likes` VALUES (34, 6, '2026-08-23 15:48:00');
INSERT INTO `comment_likes` VALUES (34, 8, '2026-08-23 15:50:00');
INSERT INTO `comment_likes` VALUES (34, 9, '2026-08-23 15:51:00');
INSERT INTO `comment_likes` VALUES (34, 10, '2026-08-23 15:52:00');
INSERT INTO `comment_likes` VALUES (34, 11, '2026-08-23 15:53:00');
INSERT INTO `comment_likes` VALUES (34, 12, '2026-08-23 15:54:00');
INSERT INTO `comment_likes` VALUES (34, 13, '2026-08-23 15:55:00');
INSERT INTO `comment_likes` VALUES (34, 14, '2026-08-23 15:56:00');
INSERT INTO `comment_likes` VALUES (34, 15, '2026-08-23 15:36:00');
INSERT INTO `comment_likes` VALUES (34, 16, '2026-08-23 15:58:00');
INSERT INTO `comment_likes` VALUES (34, 20, '2026-08-23 16:08:00');
INSERT INTO `comment_likes` VALUES (35, 3, '2026-08-23 17:12:00');
INSERT INTO `comment_likes` VALUES (35, 4, '2026-08-23 17:13:00');
INSERT INTO `comment_likes` VALUES (35, 5, '2026-08-23 17:14:00');
INSERT INTO `comment_likes` VALUES (35, 6, '2026-08-23 17:15:00');
INSERT INTO `comment_likes` VALUES (35, 8, '2026-08-23 17:17:00');
INSERT INTO `comment_likes` VALUES (35, 9, '2026-08-23 17:02:00');
INSERT INTO `comment_likes` VALUES (35, 17, '2026-08-23 17:36:00');
INSERT INTO `comment_likes` VALUES (36, 3, '2026-08-23 18:07:00');
INSERT INTO `comment_likes` VALUES (36, 4, '2026-08-23 18:08:00');
INSERT INTO `comment_likes` VALUES (36, 5, '2026-08-23 18:09:00');
INSERT INTO `comment_likes` VALUES (36, 6, '2026-08-23 18:10:00');
INSERT INTO `comment_likes` VALUES (36, 8, '2026-08-23 18:12:00');
INSERT INTO `comment_likes` VALUES (36, 9, '2026-08-23 18:13:00');
INSERT INTO `comment_likes` VALUES (36, 10, '2026-08-23 18:14:00');
INSERT INTO `comment_likes` VALUES (36, 11, '2026-08-23 18:15:00');
INSERT INTO `comment_likes` VALUES (36, 12, '2026-08-23 18:16:00');
INSERT INTO `comment_likes` VALUES (36, 13, '2026-08-23 18:17:00');
INSERT INTO `comment_likes` VALUES (36, 14, '2026-08-23 18:18:00');
INSERT INTO `comment_likes` VALUES (36, 15, '2026-08-23 18:19:00');
INSERT INTO `comment_likes` VALUES (36, 18, '2026-08-23 18:06:00');
INSERT INTO `comment_likes` VALUES (36, 19, '2026-08-23 18:42:00');
INSERT INTO `comment_likes` VALUES (37, 3, '2026-08-23 18:56:00');
INSERT INTO `comment_likes` VALUES (37, 4, '2026-08-23 18:57:00');
INSERT INTO `comment_likes` VALUES (37, 5, '2026-08-23 18:58:00');
INSERT INTO `comment_likes` VALUES (37, 6, '2026-08-23 18:59:00');
INSERT INTO `comment_likes` VALUES (37, 18, '2026-08-23 19:02:00');
INSERT INTO `comment_likes` VALUES (37, 22, '2026-08-23 19:36:00');
INSERT INTO `comment_likes` VALUES (38, 3, '2026-08-23 19:49:00');
INSERT INTO `comment_likes` VALUES (38, 4, '2026-08-23 19:50:00');
INSERT INTO `comment_likes` VALUES (38, 5, '2026-08-23 19:28:00');
INSERT INTO `comment_likes` VALUES (38, 6, '2026-08-23 19:52:00');
INSERT INTO `comment_likes` VALUES (38, 8, '2026-08-23 19:54:00');
INSERT INTO `comment_likes` VALUES (38, 9, '2026-08-23 19:55:00');
INSERT INTO `comment_likes` VALUES (38, 10, '2026-08-23 19:56:00');
INSERT INTO `comment_likes` VALUES (38, 11, '2026-08-23 19:54:00');
INSERT INTO `comment_likes` VALUES (38, 12, '2026-08-23 19:58:00');
INSERT INTO `comment_likes` VALUES (38, 13, '2026-08-23 19:59:00');
INSERT INTO `comment_likes` VALUES (38, 14, '2026-08-23 20:00:00');
INSERT INTO `comment_likes` VALUES (39, 3, '2026-08-23 20:54:00');
INSERT INTO `comment_likes` VALUES (39, 4, '2026-08-23 20:55:00');
INSERT INTO `comment_likes` VALUES (39, 5, '2026-08-23 20:56:00');
INSERT INTO `comment_likes` VALUES (39, 6, '2026-08-23 20:57:00');
INSERT INTO `comment_likes` VALUES (39, 13, '2026-08-23 20:34:00');
INSERT INTO `comment_likes` VALUES (39, 21, '2026-08-23 21:02:00');
INSERT INTO `comment_likes` VALUES (40, 3, '2026-08-23 22:09:00');
INSERT INTO `comment_likes` VALUES (40, 4, '2026-08-23 22:10:00');
INSERT INTO `comment_likes` VALUES (40, 5, '2026-08-23 22:11:00');
INSERT INTO `comment_likes` VALUES (40, 6, '2026-08-23 22:12:00');
INSERT INTO `comment_likes` VALUES (40, 8, '2026-08-23 22:14:00');
INSERT INTO `comment_likes` VALUES (40, 9, '2026-08-23 22:15:00');
INSERT INTO `comment_likes` VALUES (40, 10, '2026-08-23 22:16:00');
INSERT INTO `comment_likes` VALUES (40, 11, '2026-08-23 22:17:00');
INSERT INTO `comment_likes` VALUES (40, 12, '2026-08-23 22:18:00');
INSERT INTO `comment_likes` VALUES (40, 13, '2026-08-23 21:48:00');
INSERT INTO `comment_likes` VALUES (40, 23, '2026-08-23 22:16:00');
INSERT INTO `comment_likes` VALUES (41, 3, '2026-08-24 08:30:00');
INSERT INTO `comment_likes` VALUES (41, 4, '2026-08-24 08:31:00');
INSERT INTO `comment_likes` VALUES (41, 5, '2026-08-24 08:32:00');
INSERT INTO `comment_likes` VALUES (41, 13, '2026-08-24 08:02:00');
INSERT INTO `comment_likes` VALUES (41, 19, '2026-08-24 08:26:00');
INSERT INTO `comment_likes` VALUES (42, 3, '2026-08-24 08:57:00');
INSERT INTO `comment_likes` VALUES (42, 4, '2026-08-24 08:58:00');
INSERT INTO `comment_likes` VALUES (42, 5, '2026-08-24 08:59:00');
INSERT INTO `comment_likes` VALUES (42, 6, '2026-08-24 09:00:00');
INSERT INTO `comment_likes` VALUES (42, 8, '2026-08-24 09:02:00');
INSERT INTO `comment_likes` VALUES (42, 9, '2026-08-24 09:03:00');
INSERT INTO `comment_likes` VALUES (42, 10, '2026-08-24 09:04:00');
INSERT INTO `comment_likes` VALUES (42, 11, '2026-08-24 09:05:00');
INSERT INTO `comment_likes` VALUES (42, 12, '2026-08-24 09:06:00');
INSERT INTO `comment_likes` VALUES (42, 14, '2026-08-24 08:44:00');
INSERT INTO `comment_likes` VALUES (42, 21, '2026-08-24 09:06:00');
INSERT INTO `comment_likes` VALUES (43, 3, '2026-08-24 09:14:00');
INSERT INTO `comment_likes` VALUES (43, 4, '2026-08-24 09:15:00');
INSERT INTO `comment_likes` VALUES (43, 12, '2026-08-24 09:20:00');
INSERT INTO `comment_likes` VALUES (43, 24, '2026-08-24 09:42:00');
INSERT INTO `comment_likes` VALUES (44, 3, '2026-08-24 09:31:00');
INSERT INTO `comment_likes` VALUES (44, 4, '2026-08-24 09:32:00');
INSERT INTO `comment_likes` VALUES (44, 5, '2026-08-24 09:33:00');
INSERT INTO `comment_likes` VALUES (44, 6, '2026-08-24 09:34:00');
INSERT INTO `comment_likes` VALUES (44, 8, '2026-08-24 09:36:00');
INSERT INTO `comment_likes` VALUES (44, 9, '2026-08-24 09:37:00');
INSERT INTO `comment_likes` VALUES (44, 10, '2026-08-24 09:38:00');
INSERT INTO `comment_likes` VALUES (44, 11, '2026-08-24 09:39:00');
INSERT INTO `comment_likes` VALUES (44, 20, '2026-08-24 09:56:00');
INSERT INTO `comment_likes` VALUES (44, 22, '2026-08-24 10:14:00');
INSERT INTO `comment_likes` VALUES (45, 3, '2026-08-24 09:50:00');
INSERT INTO `comment_likes` VALUES (45, 16, '2026-08-24 10:30:00');
INSERT INTO `comment_likes` VALUES (45, 23, '2026-08-24 10:48:00');
INSERT INTO `comment_likes` VALUES (46, 3, '2026-08-24 10:07:00');
INSERT INTO `comment_likes` VALUES (46, 4, '2026-08-24 10:08:00');
INSERT INTO `comment_likes` VALUES (46, 5, '2026-08-24 10:09:00');
INSERT INTO `comment_likes` VALUES (46, 6, '2026-08-24 10:56:00');
INSERT INTO `comment_likes` VALUES (46, 8, '2026-08-24 10:12:00');
INSERT INTO `comment_likes` VALUES (46, 9, '2026-08-24 10:13:00');
INSERT INTO `comment_likes` VALUES (46, 10, '2026-08-24 10:14:00');
INSERT INTO `comment_likes` VALUES (46, 23, '2026-08-24 11:12:00');
INSERT INTO `comment_likes` VALUES (47, 3, '2026-08-24 10:24:00');
INSERT INTO `comment_likes` VALUES (47, 4, '2026-08-24 11:26:00');
INSERT INTO `comment_likes` VALUES (47, 5, '2026-08-24 10:26:00');
INSERT INTO `comment_likes` VALUES (47, 6, '2026-08-24 10:27:00');
INSERT INTO `comment_likes` VALUES (47, 8, '2026-08-24 10:29:00');
INSERT INTO `comment_likes` VALUES (47, 9, '2026-08-24 10:30:00');
INSERT INTO `comment_likes` VALUES (47, 10, '2026-08-24 10:31:00');
INSERT INTO `comment_likes` VALUES (47, 11, '2026-08-24 10:32:00');
INSERT INTO `comment_likes` VALUES (47, 12, '2026-08-24 10:33:00');
INSERT INTO `comment_likes` VALUES (47, 13, '2026-08-24 10:34:00');
INSERT INTO `comment_likes` VALUES (47, 14, '2026-08-24 10:35:00');
INSERT INTO `comment_likes` VALUES (47, 15, '2026-08-24 10:36:00');
INSERT INTO `comment_likes` VALUES (47, 16, '2026-08-24 10:37:00');
INSERT INTO `comment_likes` VALUES (47, 17, '2026-08-24 10:38:00');
INSERT INTO `comment_likes` VALUES (47, 23, '2026-08-24 11:44:00');
INSERT INTO `comment_likes` VALUES (48, 3, '2026-08-24 10:41:00');
INSERT INTO `comment_likes` VALUES (48, 4, '2026-08-24 10:42:00');
INSERT INTO `comment_likes` VALUES (48, 5, '2026-08-24 10:43:00');
INSERT INTO `comment_likes` VALUES (48, 6, '2026-08-24 10:44:00');
INSERT INTO `comment_likes` VALUES (48, 8, '2026-08-24 10:46:00');
INSERT INTO `comment_likes` VALUES (48, 9, '2026-08-24 10:47:00');
INSERT INTO `comment_likes` VALUES (48, 17, '2026-08-24 11:58:00');
INSERT INTO `comment_likes` VALUES (48, 22, '2026-08-24 12:14:00');
INSERT INTO `comment_likes` VALUES (49, 3, '2026-08-24 10:58:00');
INSERT INTO `comment_likes` VALUES (49, 4, '2026-08-24 10:59:00');
INSERT INTO `comment_likes` VALUES (49, 5, '2026-08-24 11:00:00');
INSERT INTO `comment_likes` VALUES (49, 6, '2026-08-24 11:01:00');
INSERT INTO `comment_likes` VALUES (49, 8, '2026-08-24 11:03:00');
INSERT INTO `comment_likes` VALUES (49, 9, '2026-08-24 11:04:00');
INSERT INTO `comment_likes` VALUES (49, 10, '2026-08-24 11:05:00');
INSERT INTO `comment_likes` VALUES (49, 11, '2026-08-24 11:06:00');
INSERT INTO `comment_likes` VALUES (49, 12, '2026-08-24 11:07:00');
INSERT INTO `comment_likes` VALUES (49, 13, '2026-08-24 11:08:00');
INSERT INTO `comment_likes` VALUES (49, 14, '2026-08-24 11:09:00');
INSERT INTO `comment_likes` VALUES (49, 15, '2026-08-24 11:10:00');
INSERT INTO `comment_likes` VALUES (49, 16, '2026-08-24 11:11:00');
INSERT INTO `comment_likes` VALUES (49, 17, '2026-08-24 12:32:00');
INSERT INTO `comment_likes` VALUES (49, 21, '2026-08-24 12:50:00');
INSERT INTO `comment_likes` VALUES (50, 3, '2026-08-24 11:15:00');
INSERT INTO `comment_likes` VALUES (50, 4, '2026-08-24 11:16:00');
INSERT INTO `comment_likes` VALUES (50, 5, '2026-08-24 11:17:00');
INSERT INTO `comment_likes` VALUES (50, 6, '2026-08-24 11:18:00');
INSERT INTO `comment_likes` VALUES (50, 8, '2026-08-24 11:20:00');
INSERT INTO `comment_likes` VALUES (50, 15, '2026-08-24 13:08:00');
INSERT INTO `comment_likes` VALUES (50, 24, '2026-08-24 13:26:00');
INSERT INTO `comment_likes` VALUES (51, 3, '2026-08-24 11:32:00');
INSERT INTO `comment_likes` VALUES (51, 4, '2026-08-24 11:33:00');
INSERT INTO `comment_likes` VALUES (51, 5, '2026-08-24 11:34:00');
INSERT INTO `comment_likes` VALUES (51, 6, '2026-08-24 11:35:00');
INSERT INTO `comment_likes` VALUES (51, 8, '2026-08-24 11:37:00');
INSERT INTO `comment_likes` VALUES (51, 9, '2026-08-24 11:38:00');
INSERT INTO `comment_likes` VALUES (51, 10, '2026-08-24 11:39:00');
INSERT INTO `comment_likes` VALUES (51, 11, '2026-08-24 11:40:00');
INSERT INTO `comment_likes` VALUES (51, 12, '2026-08-24 11:41:00');
INSERT INTO `comment_likes` VALUES (51, 13, '2026-08-24 11:42:00');
INSERT INTO `comment_likes` VALUES (51, 14, '2026-08-24 13:44:00');
INSERT INTO `comment_likes` VALUES (51, 15, '2026-08-24 11:44:00');
INSERT INTO `comment_likes` VALUES (51, 20, '2026-08-24 14:02:00');
INSERT INTO `comment_likes` VALUES (52, 3, '2026-08-24 11:49:00');
INSERT INTO `comment_likes` VALUES (52, 4, '2026-08-24 11:50:00');
INSERT INTO `comment_likes` VALUES (52, 5, '2026-08-24 11:51:00');
INSERT INTO `comment_likes` VALUES (52, 6, '2026-08-24 11:52:00');
INSERT INTO `comment_likes` VALUES (52, 11, '2026-08-24 14:20:00');
INSERT INTO `comment_likes` VALUES (52, 18, '2026-08-24 14:38:00');
INSERT INTO `comment_likes` VALUES (53, 3, '2026-08-23 12:08:00');
INSERT INTO `comment_likes` VALUES (53, 4, '2026-08-23 12:09:00');
INSERT INTO `comment_likes` VALUES (53, 5, '2026-08-23 12:10:00');
INSERT INTO `comment_likes` VALUES (53, 6, '2026-08-23 12:11:00');
INSERT INTO `comment_likes` VALUES (53, 8, '2026-08-23 12:13:00');
INSERT INTO `comment_likes` VALUES (53, 9, '2026-08-23 12:14:00');
INSERT INTO `comment_likes` VALUES (53, 10, '2026-08-23 12:15:00');
INSERT INTO `comment_likes` VALUES (53, 11, '2026-08-23 12:16:00');
INSERT INTO `comment_likes` VALUES (53, 12, '2026-08-23 12:17:00');
INSERT INTO `comment_likes` VALUES (53, 13, '2026-08-23 12:18:00');
INSERT INTO `comment_likes` VALUES (53, 14, '2026-08-23 12:19:00');
INSERT INTO `comment_likes` VALUES (54, 3, '2026-08-23 12:45:00');
INSERT INTO `comment_likes` VALUES (54, 4, '2026-08-23 12:46:00');
INSERT INTO `comment_likes` VALUES (54, 5, '2026-08-23 12:47:00');
INSERT INTO `comment_likes` VALUES (54, 6, '2026-08-23 12:48:00');
INSERT INTO `comment_likes` VALUES (55, 3, '2026-08-23 13:24:00');
INSERT INTO `comment_likes` VALUES (55, 4, '2026-08-23 13:25:00');
INSERT INTO `comment_likes` VALUES (55, 5, '2026-08-23 13:26:00');
INSERT INTO `comment_likes` VALUES (55, 6, '2026-08-23 13:27:00');
INSERT INTO `comment_likes` VALUES (55, 8, '2026-08-23 13:29:00');
INSERT INTO `comment_likes` VALUES (55, 9, '2026-08-23 13:30:00');
INSERT INTO `comment_likes` VALUES (55, 10, '2026-08-23 13:31:00');
INSERT INTO `comment_likes` VALUES (55, 11, '2026-08-23 13:32:00');
INSERT INTO `comment_likes` VALUES (55, 12, '2026-08-23 13:33:00');
INSERT INTO `comment_likes` VALUES (55, 13, '2026-08-23 13:34:00');
INSERT INTO `comment_likes` VALUES (56, 3, '2026-08-23 14:13:00');
INSERT INTO `comment_likes` VALUES (56, 4, '2026-08-23 14:14:00');
INSERT INTO `comment_likes` VALUES (56, 5, '2026-08-23 14:15:00');
INSERT INTO `comment_likes` VALUES (57, 3, '2026-08-23 15:02:00');
INSERT INTO `comment_likes` VALUES (57, 4, '2026-08-23 15:03:00');
INSERT INTO `comment_likes` VALUES (57, 5, '2026-08-23 15:04:00');
INSERT INTO `comment_likes` VALUES (57, 6, '2026-08-23 15:05:00');
INSERT INTO `comment_likes` VALUES (57, 8, '2026-08-23 15:07:00');
INSERT INTO `comment_likes` VALUES (57, 9, '2026-08-23 15:08:00');
INSERT INTO `comment_likes` VALUES (57, 10, '2026-08-23 15:09:00');
INSERT INTO `comment_likes` VALUES (57, 11, '2026-08-23 15:10:00');
INSERT INTO `comment_likes` VALUES (57, 12, '2026-08-23 15:11:00');
INSERT INTO `comment_likes` VALUES (58, 3, '2026-08-23 15:49:00');
INSERT INTO `comment_likes` VALUES (58, 4, '2026-08-23 15:50:00');
INSERT INTO `comment_likes` VALUES (59, 3, '2026-08-23 16:36:00');
INSERT INTO `comment_likes` VALUES (59, 4, '2026-08-23 16:37:00');
INSERT INTO `comment_likes` VALUES (59, 5, '2026-08-23 16:38:00');
INSERT INTO `comment_likes` VALUES (59, 6, '2026-08-23 16:39:00');
INSERT INTO `comment_likes` VALUES (59, 8, '2026-08-23 16:41:00');
INSERT INTO `comment_likes` VALUES (59, 9, '2026-08-23 16:42:00');
INSERT INTO `comment_likes` VALUES (59, 10, '2026-08-23 16:43:00');
INSERT INTO `comment_likes` VALUES (59, 11, '2026-08-23 16:44:00');
INSERT INTO `comment_likes` VALUES (60, 3, '2026-08-23 17:23:00');
INSERT INTO `comment_likes` VALUES (61, 3, '2026-08-23 18:10:00');
INSERT INTO `comment_likes` VALUES (61, 4, '2026-08-23 18:11:00');
INSERT INTO `comment_likes` VALUES (61, 5, '2026-08-23 18:12:00');
INSERT INTO `comment_likes` VALUES (61, 6, '2026-08-23 18:13:00');
INSERT INTO `comment_likes` VALUES (61, 8, '2026-08-23 18:15:00');
INSERT INTO `comment_likes` VALUES (61, 9, '2026-08-23 18:16:00');
INSERT INTO `comment_likes` VALUES (61, 10, '2026-08-23 18:17:00');
INSERT INTO `comment_likes` VALUES (62, 3, '2026-08-23 18:57:00');
INSERT INTO `comment_likes` VALUES (62, 4, '2026-08-23 18:58:00');
INSERT INTO `comment_likes` VALUES (62, 5, '2026-08-23 18:59:00');
INSERT INTO `comment_likes` VALUES (62, 6, '2026-08-23 19:00:00');
INSERT INTO `comment_likes` VALUES (62, 8, '2026-08-23 19:02:00');
INSERT INTO `comment_likes` VALUES (62, 9, '2026-08-23 19:03:00');
INSERT INTO `comment_likes` VALUES (62, 10, '2026-08-23 19:04:00');
INSERT INTO `comment_likes` VALUES (62, 11, '2026-08-23 19:05:00');
INSERT INTO `comment_likes` VALUES (62, 12, '2026-08-23 19:06:00');
INSERT INTO `comment_likes` VALUES (62, 13, '2026-08-23 19:07:00');
INSERT INTO `comment_likes` VALUES (62, 14, '2026-08-23 19:08:00');
INSERT INTO `comment_likes` VALUES (62, 15, '2026-08-23 19:09:00');
INSERT INTO `comment_likes` VALUES (62, 16, '2026-08-23 19:10:00');
INSERT INTO `comment_likes` VALUES (62, 17, '2026-08-23 19:11:00');
INSERT INTO `comment_likes` VALUES (63, 3, '2026-08-23 19:44:00');
INSERT INTO `comment_likes` VALUES (63, 4, '2026-08-23 19:45:00');
INSERT INTO `comment_likes` VALUES (63, 5, '2026-08-23 19:46:00');
INSERT INTO `comment_likes` VALUES (63, 6, '2026-08-23 19:47:00');
INSERT INTO `comment_likes` VALUES (63, 8, '2026-08-23 19:49:00');
INSERT INTO `comment_likes` VALUES (63, 9, '2026-08-23 19:50:00');
INSERT INTO `comment_likes` VALUES (64, 3, '2026-08-23 20:31:00');
INSERT INTO `comment_likes` VALUES (64, 4, '2026-08-23 20:32:00');
INSERT INTO `comment_likes` VALUES (64, 5, '2026-08-23 20:33:00');
INSERT INTO `comment_likes` VALUES (64, 6, '2026-08-23 20:34:00');
INSERT INTO `comment_likes` VALUES (64, 8, '2026-08-23 20:36:00');
INSERT INTO `comment_likes` VALUES (64, 9, '2026-08-23 20:37:00');
INSERT INTO `comment_likes` VALUES (64, 10, '2026-08-23 20:38:00');
INSERT INTO `comment_likes` VALUES (64, 11, '2026-08-23 20:39:00');
INSERT INTO `comment_likes` VALUES (64, 12, '2026-08-23 20:40:00');
INSERT INTO `comment_likes` VALUES (64, 13, '2026-08-23 20:41:00');
INSERT INTO `comment_likes` VALUES (64, 14, '2026-08-23 20:42:00');
INSERT INTO `comment_likes` VALUES (64, 15, '2026-08-23 20:43:00');
INSERT INTO `comment_likes` VALUES (64, 16, '2026-08-23 20:44:00');
INSERT INTO `comment_likes` VALUES (65, 3, '2026-08-23 21:18:00');
INSERT INTO `comment_likes` VALUES (65, 4, '2026-08-23 21:19:00');
INSERT INTO `comment_likes` VALUES (65, 5, '2026-08-23 21:20:00');
INSERT INTO `comment_likes` VALUES (65, 6, '2026-08-23 21:21:00');
INSERT INTO `comment_likes` VALUES (65, 8, '2026-08-23 21:23:00');
INSERT INTO `comment_likes` VALUES (66, 3, '2026-08-23 22:05:00');
INSERT INTO `comment_likes` VALUES (66, 4, '2026-08-23 22:06:00');
INSERT INTO `comment_likes` VALUES (66, 5, '2026-08-23 22:07:00');
INSERT INTO `comment_likes` VALUES (66, 6, '2026-08-23 22:08:00');
INSERT INTO `comment_likes` VALUES (66, 8, '2026-08-23 22:10:00');
INSERT INTO `comment_likes` VALUES (66, 9, '2026-08-23 22:11:00');
INSERT INTO `comment_likes` VALUES (66, 10, '2026-08-23 22:12:00');
INSERT INTO `comment_likes` VALUES (66, 11, '2026-08-23 22:13:00');
INSERT INTO `comment_likes` VALUES (66, 12, '2026-08-23 22:14:00');
INSERT INTO `comment_likes` VALUES (66, 13, '2026-08-23 22:15:00');
INSERT INTO `comment_likes` VALUES (66, 14, '2026-08-23 22:16:00');
INSERT INTO `comment_likes` VALUES (66, 15, '2026-08-23 22:17:00');
INSERT INTO `comment_likes` VALUES (67, 3, '2026-08-23 22:52:00');
INSERT INTO `comment_likes` VALUES (67, 4, '2026-08-23 22:53:00');
INSERT INTO `comment_likes` VALUES (67, 5, '2026-08-23 22:54:00');
INSERT INTO `comment_likes` VALUES (67, 6, '2026-08-23 22:55:00');
INSERT INTO `comment_likes` VALUES (68, 3, '2026-08-24 08:31:00');
INSERT INTO `comment_likes` VALUES (68, 4, '2026-08-24 08:32:00');
INSERT INTO `comment_likes` VALUES (68, 5, '2026-08-24 08:33:00');
INSERT INTO `comment_likes` VALUES (68, 6, '2026-08-24 08:34:00');
INSERT INTO `comment_likes` VALUES (68, 8, '2026-08-24 08:36:00');
INSERT INTO `comment_likes` VALUES (68, 9, '2026-08-24 08:37:00');
INSERT INTO `comment_likes` VALUES (68, 10, '2026-08-24 08:38:00');
INSERT INTO `comment_likes` VALUES (68, 11, '2026-08-24 08:39:00');
INSERT INTO `comment_likes` VALUES (68, 12, '2026-08-24 08:40:00');
INSERT INTO `comment_likes` VALUES (68, 13, '2026-08-24 08:41:00');
INSERT INTO `comment_likes` VALUES (68, 14, '2026-08-24 08:42:00');
INSERT INTO `comment_likes` VALUES (69, 3, '2026-08-24 09:10:00');
INSERT INTO `comment_likes` VALUES (69, 4, '2026-08-24 09:11:00');
INSERT INTO `comment_likes` VALUES (69, 5, '2026-08-24 09:12:00');
INSERT INTO `comment_likes` VALUES (69, 6, '2026-08-24 09:13:00');
INSERT INTO `comment_likes` VALUES (70, 3, '2026-08-24 09:49:00');
INSERT INTO `comment_likes` VALUES (70, 4, '2026-08-24 09:50:00');
INSERT INTO `comment_likes` VALUES (70, 5, '2026-08-24 09:51:00');
INSERT INTO `comment_likes` VALUES (70, 6, '2026-08-24 09:52:00');
INSERT INTO `comment_likes` VALUES (70, 8, '2026-08-24 09:54:00');
INSERT INTO `comment_likes` VALUES (70, 9, '2026-08-24 09:55:00');
INSERT INTO `comment_likes` VALUES (70, 10, '2026-08-24 09:56:00');
INSERT INTO `comment_likes` VALUES (70, 11, '2026-08-24 09:57:00');
INSERT INTO `comment_likes` VALUES (70, 12, '2026-08-24 09:58:00');
INSERT INTO `comment_likes` VALUES (70, 13, '2026-08-24 09:59:00');
INSERT INTO `comment_likes` VALUES (71, 3, '2026-08-24 10:28:00');
INSERT INTO `comment_likes` VALUES (71, 4, '2026-08-24 10:29:00');
INSERT INTO `comment_likes` VALUES (71, 5, '2026-08-24 10:30:00');
INSERT INTO `comment_likes` VALUES (72, 3, '2026-08-24 11:07:00');
INSERT INTO `comment_likes` VALUES (72, 4, '2026-08-24 11:08:00');
INSERT INTO `comment_likes` VALUES (72, 5, '2026-08-24 11:09:00');
INSERT INTO `comment_likes` VALUES (72, 6, '2026-08-24 11:10:00');
INSERT INTO `comment_likes` VALUES (72, 8, '2026-08-24 11:12:00');
INSERT INTO `comment_likes` VALUES (72, 9, '2026-08-24 11:13:00');
INSERT INTO `comment_likes` VALUES (72, 10, '2026-08-24 11:14:00');
INSERT INTO `comment_likes` VALUES (72, 11, '2026-08-24 11:15:00');
INSERT INTO `comment_likes` VALUES (72, 12, '2026-08-24 11:16:00');
INSERT INTO `comment_likes` VALUES (73, 3, '2026-08-24 11:46:00');
INSERT INTO `comment_likes` VALUES (73, 4, '2026-08-24 11:47:00');
INSERT INTO `comment_likes` VALUES (74, 3, '2026-08-24 12:25:00');
INSERT INTO `comment_likes` VALUES (74, 4, '2026-08-24 12:26:00');
INSERT INTO `comment_likes` VALUES (74, 5, '2026-08-24 12:27:00');
INSERT INTO `comment_likes` VALUES (74, 6, '2026-08-24 12:28:00');
INSERT INTO `comment_likes` VALUES (74, 8, '2026-08-24 12:30:00');
INSERT INTO `comment_likes` VALUES (74, 9, '2026-08-24 12:31:00');
INSERT INTO `comment_likes` VALUES (74, 10, '2026-08-24 12:32:00');
INSERT INTO `comment_likes` VALUES (74, 11, '2026-08-24 12:33:00');
INSERT INTO `comment_likes` VALUES (75, 3, '2026-08-24 13:04:00');
INSERT INTO `comment_likes` VALUES (76, 3, '2026-08-24 13:43:00');
INSERT INTO `comment_likes` VALUES (76, 4, '2026-08-24 13:44:00');
INSERT INTO `comment_likes` VALUES (76, 5, '2026-08-24 13:45:00');
INSERT INTO `comment_likes` VALUES (76, 6, '2026-08-24 13:46:00');
INSERT INTO `comment_likes` VALUES (76, 8, '2026-08-24 13:48:00');
INSERT INTO `comment_likes` VALUES (76, 9, '2026-08-24 13:49:00');
INSERT INTO `comment_likes` VALUES (76, 10, '2026-08-24 13:50:00');
INSERT INTO `comment_likes` VALUES (77, 3, '2026-08-24 14:22:00');
INSERT INTO `comment_likes` VALUES (77, 4, '2026-08-24 14:23:00');
INSERT INTO `comment_likes` VALUES (77, 5, '2026-08-24 14:24:00');
INSERT INTO `comment_likes` VALUES (77, 6, '2026-08-24 14:25:00');
INSERT INTO `comment_likes` VALUES (77, 8, '2026-08-24 14:27:00');
INSERT INTO `comment_likes` VALUES (77, 9, '2026-08-24 14:28:00');
INSERT INTO `comment_likes` VALUES (77, 10, '2026-08-24 14:29:00');
INSERT INTO `comment_likes` VALUES (77, 11, '2026-08-24 14:30:00');
INSERT INTO `comment_likes` VALUES (77, 12, '2026-08-24 14:31:00');
INSERT INTO `comment_likes` VALUES (77, 13, '2026-08-24 14:32:00');
INSERT INTO `comment_likes` VALUES (77, 14, '2026-08-24 14:33:00');
INSERT INTO `comment_likes` VALUES (77, 15, '2026-08-24 14:34:00');
INSERT INTO `comment_likes` VALUES (77, 16, '2026-08-24 14:35:00');
INSERT INTO `comment_likes` VALUES (77, 17, '2026-08-24 14:36:00');
INSERT INTO `comment_likes` VALUES (78, 3, '2026-08-24 15:01:00');
INSERT INTO `comment_likes` VALUES (78, 4, '2026-08-24 15:02:00');
INSERT INTO `comment_likes` VALUES (78, 5, '2026-08-24 15:03:00');
INSERT INTO `comment_likes` VALUES (78, 6, '2026-08-24 15:04:00');
INSERT INTO `comment_likes` VALUES (78, 8, '2026-08-24 15:06:00');
INSERT INTO `comment_likes` VALUES (78, 9, '2026-08-24 15:07:00');
INSERT INTO `comment_likes` VALUES (79, 3, '2026-08-24 15:40:00');
INSERT INTO `comment_likes` VALUES (79, 4, '2026-08-24 15:41:00');
INSERT INTO `comment_likes` VALUES (79, 5, '2026-08-24 15:42:00');
INSERT INTO `comment_likes` VALUES (79, 6, '2026-08-24 15:43:00');
INSERT INTO `comment_likes` VALUES (79, 8, '2026-08-24 15:45:00');
INSERT INTO `comment_likes` VALUES (79, 9, '2026-08-24 15:46:00');
INSERT INTO `comment_likes` VALUES (79, 10, '2026-08-24 15:47:00');
INSERT INTO `comment_likes` VALUES (79, 11, '2026-08-24 15:48:00');
INSERT INTO `comment_likes` VALUES (79, 12, '2026-08-24 15:49:00');
INSERT INTO `comment_likes` VALUES (79, 13, '2026-08-24 15:50:00');
INSERT INTO `comment_likes` VALUES (79, 14, '2026-08-24 15:51:00');
INSERT INTO `comment_likes` VALUES (79, 15, '2026-08-24 15:52:00');
INSERT INTO `comment_likes` VALUES (79, 16, '2026-08-24 15:53:00');
INSERT INTO `comment_likes` VALUES (80, 3, '2026-08-24 16:19:00');
INSERT INTO `comment_likes` VALUES (80, 4, '2026-08-24 16:20:00');
INSERT INTO `comment_likes` VALUES (80, 5, '2026-08-24 16:21:00');
INSERT INTO `comment_likes` VALUES (80, 6, '2026-08-24 16:22:00');
INSERT INTO `comment_likes` VALUES (80, 8, '2026-08-24 16:24:00');
INSERT INTO `comment_likes` VALUES (81, 3, '2026-08-24 16:58:00');
INSERT INTO `comment_likes` VALUES (81, 4, '2026-08-24 16:59:00');
INSERT INTO `comment_likes` VALUES (81, 5, '2026-08-24 17:00:00');
INSERT INTO `comment_likes` VALUES (81, 6, '2026-08-24 17:01:00');
INSERT INTO `comment_likes` VALUES (81, 8, '2026-08-24 17:03:00');
INSERT INTO `comment_likes` VALUES (81, 9, '2026-08-24 17:04:00');
INSERT INTO `comment_likes` VALUES (81, 10, '2026-08-24 17:05:00');
INSERT INTO `comment_likes` VALUES (81, 11, '2026-08-24 17:06:00');
INSERT INTO `comment_likes` VALUES (81, 12, '2026-08-24 17:07:00');
INSERT INTO `comment_likes` VALUES (81, 13, '2026-08-24 17:08:00');
INSERT INTO `comment_likes` VALUES (81, 14, '2026-08-24 17:09:00');
INSERT INTO `comment_likes` VALUES (81, 15, '2026-08-24 17:10:00');
INSERT INTO `comment_likes` VALUES (82, 3, '2026-08-24 17:37:00');
INSERT INTO `comment_likes` VALUES (82, 4, '2026-08-24 17:38:00');
INSERT INTO `comment_likes` VALUES (82, 5, '2026-08-24 17:39:00');
INSERT INTO `comment_likes` VALUES (82, 6, '2026-08-24 17:40:00');

-- ----------------------------
-- Table structure for comment_replies
-- ----------------------------
DROP TABLE IF EXISTS `comment_replies`;
CREATE TABLE `comment_replies`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_id` bigint UNSIGNED NOT NULL,
  `admin_id` bigint UNSIGNED NOT NULL,
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_comment_replies_comment_created`(`comment_id` ASC, `created_at` ASC) USING BTREE,
  INDEX `idx_comment_replies_admin_created`(`admin_id` ASC, `created_at` ASC) USING BTREE,
  CONSTRAINT `fk_comment_replies_admin` FOREIGN KEY (`admin_id`) REFERENCES `user_accounts` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_replies_comment` FOREIGN KEY (`comment_id`) REFERENCES `artifact_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment_replies
-- ----------------------------
INSERT INTO `comment_replies` VALUES (1, 1, 1, '感谢你的观察。详情页后续会补充纹饰局部和器物用途说明。', '2026-08-18 15:06:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (2, 3, 2, '确实如此，线下展陈会结合器物工艺和釉色变化进行说明。', '2026-08-20 11:40:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (3, 4, 1, '谢谢你的反馈，我们会继续补充青铜人物造像和祭祀背景的资料。', '2026-08-21 10:20:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (4, 7, 2, '帛画的分层结构与汉代宇宙观有关，后续会增加更详细的图示说明。', '2026-08-20 14:30:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (5, 8, 1, '我们会补充纺织工艺和衣物保存状态的介绍，方便对照理解。', '2026-08-21 09:15:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (6, 9, 1, '何家村窖藏中的金银器能够帮助我们观察唐代贵族生活与中外交流。', '2026-08-22 17:05:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (7, 12, 2, '这个角度很准确，琮式瓶可以作为宋代器物仿古风尚的一个例子。', '2026-08-24 10:10:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (8, 11, 1, '四羊方尊的羊首装饰不仅有审美作用，也与商代礼器的仪式性有关。', '2026-08-24 09:05:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (9, 2, 25, '感谢建议，后续会增加作品流传、收藏和展陈背景的时间线说明。', '2026-08-23 10:12:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (10, 5, 1, '纵目面具的造型与古蜀文明的信仰和祭祀传统密切相关，详情页会补充背景资料。', '2026-08-22 17:05:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (11, 6, 25, '我们会增加神树结构示意，帮助查看枝、果和鸟形装饰之间的关系。', '2026-08-23 10:06:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (12, 10, 2, '舞马纹样与唐代宫廷宴饮文化有关，后续会补充相关历史说明。', '2026-08-24 09:02:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (13, 13, 26, '五牛图的动物观察非常细致，详情页会加入画面局部和作品构图说明。', '2026-08-18 11:10:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (14, 14, 1, '唐代古琴的形制和后世传承确实存在差异，我们会整理一段简要对比。', '2026-08-18 19:05:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (15, 15, 2, '汝窑器物常借鉴礼器造型，这件三足樽正好体现了宋代仿古审美。', '2026-08-19 10:06:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (16, 16, 25, '后母戊鼎的铭文、体量和铸造工艺可以结合商代王室礼制一起理解。', '2026-08-19 14:20:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (17, 17, 26, '人面鱼纹彩陶盆的图案具有鲜明的仰韶文化特征，后续会补充考古背景。', '2026-08-19 17:02:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (18, 18, 1, '妇好鸮尊的动物造型既有装饰作用，也体现商代礼器的神圣性。', '2026-08-20 10:18:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (19, 19, 2, '鹰形陶鼎可以从陶塑、动物形象和仰韶文化审美三个角度观察。', '2026-08-20 12:04:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (20, 20, 25, '漆棺上的云气纹和汉代升仙观念有关，后续会增加纹样分区说明。', '2026-08-20 16:02:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (21, 21, 26, '木俑所表现的乐舞场景可以与汉代墓葬中的其他乐伎资料对照理解。', '2026-08-20 19:28:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (22, 22, 2, '云纹漆案的纹饰布局很有秩序，我们会补充漆器制作工艺介绍。', '2026-08-21 10:24:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (23, 23, 1, '金面罩与青铜底座形成鲜明对比，是古蜀人物造像中很有辨识度的组合。', '2026-08-21 14:16:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (24, 24, 25, '玉璋图像与三星堆礼仪活动有关，后续会加入玉器用途和祭祀背景。', '2026-08-21 16:24:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (25, 25, 26, '早期青釉器物可以帮助理解瓷器从原始青瓷到成熟瓷器的发展过程。', '2026-08-21 19:08:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (26, 26, 1, '唐三彩镇墓类器物具有保护墓主人和表现身份秩序的象征意义。', '2026-08-22 10:06:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (27, 27, 2, '人物图盘适合结合明代青花绘画和故事题材的发展来观看。', '2026-08-22 12:02:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (28, 28, 25, '珐琅彩的色彩和绘画性很强，竹菊鹌鹑也体现了清代宫廷陈设趣味。', '2026-08-22 15:30:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (29, 29, 26, '骆驼载乐题材能反映唐代交通、商贸与多民族文化交流。', '2026-08-22 18:06:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (30, 30, 1, '多友鼎铭文是理解西周军政事务的重要材料，详情页会增加铭文释读提示。', '2026-08-23 09:20:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (31, 31, 2, '五祀卫鼎的长篇铭文可以和西周土地制度、贵族秩序联系起来理解。', '2026-08-23 11:18:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (32, 32, 25, '清明上河图的细节非常丰富，后续会增加适合移动端查看的局部导览。', '2026-08-23 13:06:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (33, 53, 2, '三足樽的圈足和腹部比例确实是观察器形的重要入口，我们会补充器形示意。', '2026-08-23 12:08:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (34, 55, 25, '四个羊首在结构上各有细节变化，后续会增加局部对照图。', '2026-08-23 13:04:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (35, 56, 1, '方尊肩部和腹部的纹饰共同构成视觉重点，这也是商代礼器常见的装饰方式。', '2026-08-23 13:52:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (36, 58, 26, '帛画的分层图像与汉代宇宙观关系密切，我们会补充简化示意。', '2026-08-23 15:12:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (37, 60, 2, '素纱单衣的纺织工艺确实具有很高的技术水平，详情页会增加丝线和织法说明。', '2026-08-23 16:56:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (38, 62, 25, '黑地彩绘漆棺的色彩关系很有代表性，适合和其他马王堆漆器一起观察。', '2026-08-23 18:28:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (39, 64, 1, '金面罩与头像的贴合工艺体现了古蜀黄金加工水平，后续会增加工艺介绍。', '2026-08-23 19:58:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (40, 66, 26, '兽首装饰确实强化了器物的仪式感，也能看出瓷器对青铜器传统的吸收。', '2026-08-23 21:24:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (41, 69, 2, '清明上河图的生活细节是作品的重要价值之一，局部导览会按场景进行整理。', '2026-08-24 08:22:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (42, 70, 25, '青绿山水的设色与留白共同营造出空间感，后续会补充构图观察提示。', '2026-08-24 09:00:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (43, 73, 1, '鹰形陶鼎的动态处理很有代表性，我们会补充仰韶陶塑的相关背景。', '2026-08-24 10:54:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (44, 74, 26, '立人像的手势和站姿具有仪式含义，详情页会增加造像姿态说明。', '2026-08-24 11:32:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (45, 77, 2, '镇墓兽需要结合墓葬空间和唐代丧葬观念理解，单看造型确实容易忽略背景。', '2026-08-24 13:26:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (46, 80, 25, '舞马纹样与唐代宴饮文化相关，后续会关联展示其他唐代金银器。', '2026-08-24 15:20:00', '2026-08-25 14:08:36');
INSERT INTO `comment_replies` VALUES (47, 82, 1, '铭文和器形结合起来看，能够更完整地理解西周礼器的政治与社会功能。', '2026-08-24 16:58:00', '2026-08-25 14:08:36');

-- ----------------------------
-- Table structure for cultural_artifacts
-- ----------------------------
DROP TABLE IF EXISTS `cultural_artifacts`;
CREATE TABLE `cultural_artifacts`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dynasty` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `material` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `artifact_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `museum_id` bigint UNSIGNED NOT NULL,
  `origin` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `favorite_count` int UNSIGNED NOT NULL DEFAULT 0,
  `status` enum('ONLINE','OFFLINE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ONLINE',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cultural_artifacts_search`(`dynasty` ASC, `material` ASC, `artifact_type` ASC, `status` ASC) USING BTREE,
  INDEX `idx_cultural_artifacts_museum_status`(`museum_id` ASC, `status` ASC) USING BTREE,
  CONSTRAINT `fk_cultural_artifacts_museum` FOREIGN KEY (`museum_id`) REFERENCES `museums` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cultural_artifacts
-- ----------------------------
INSERT INTO `cultural_artifacts` VALUES (1, '清明上河图卷', '北宋', '绢本设色', '书画', 1, '传世，故宫博物院藏', NULL, '北宋张择端绘长卷，以细密的城市生活图景展现汴京城郊的社会风貌，是中国古代风俗画的代表作品。', 6, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (2, '千里江山图卷', '北宋', '绢本设色', '书画', 1, '传世，故宫博物院藏', NULL, '北宋王希孟创作的青绿山水长卷，以矿物颜料描绘连绵山川和人物活动，是青绿山水画的重要代表。', 7, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (3, '五牛图卷', '唐', '纸本设色', '书画', 1, '传世，故宫博物院藏', NULL, '唐代韩滉所绘的五牛图卷，以不同姿态描绘五头牛，笔墨简练而形神兼备，是唐代传世绘画名作。', 5, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (4, '大圣遗音琴', '唐', '梧桐木、漆', '乐器', 1, '传世，故宫博物院藏', NULL, '唐代古琴文物，琴体保存有题刻和断纹等历史信息，体现了中国古琴制作与宫廷收藏传统。', 5, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (5, '汝窑天青釉弦纹三足樽', '北宋', '瓷', '陈设器', 1, '北宋汝窑，故宫博物院藏', NULL, '器物施天青釉，造型仿青铜樽，弦纹和三足构成简洁端庄的宋代宫廷瓷器风格。', 5, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (6, '后母戊鼎', '商晚期', '青铜', '礼器', 2, '河南安阳武官村出土', NULL, '商代晚期大型青铜方鼎，器身铸有“后母戊”铭文，是研究商代青铜铸造、礼制和文字的重要文物。', 7, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (7, '四羊方尊', '商晚期', '青铜', '礼器', 2, '湖南宁乡出土', NULL, '商代晚期青铜方尊，肩部装饰四只卷角羊，器形与纹饰结合体现了商代青铜礼器的高超铸造技艺。', 5, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (8, '人面鱼纹彩陶盆', '新石器时代仰韶文化', '彩陶', '陶器', 2, '陕西西安半坡遗址出土', NULL, '仰韶文化彩陶器，盆内绘有人面与鱼纹组合图案，是中国新石器时代彩陶艺术的重要代表。', 5, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (9, '妇好鸮尊', '商晚期', '青铜', '礼器', 2, '河南安阳妇好墓出土', NULL, '商代晚期鸮形青铜尊，造型取法猫头鹰并结合器物功能，反映了商代青铜艺术中的动物造型传统。', 2, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (10, '鹰形陶鼎', '新石器时代仰韶文化', '陶', '陶器', 2, '陕西华县太平庄出土', NULL, '仰韶文化鹰形陶塑，利用鹰的形体构成器物轮廓，兼具实用器与动物造型艺术的特征。', 4, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (11, '马王堆一号汉墓T形帛画', '西汉', '帛', '书画', 3, '长沙马王堆一号汉墓出土', NULL, '西汉墓葬出土的T形帛画，画面分层表现天上、人间与地下意象，是研究汉代宇宙观和丧葬观念的重要材料。', 6, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (12, '素纱单衣', '西汉', '丝织品', '织绣', 3, '长沙马王堆一号汉墓出土', NULL, '西汉丝织衣物，面料轻薄透明，体现了汉代丝织技术、纺织工艺和贵族服饰文化。', 5, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (13, '黑地彩绘漆棺', '西汉', '木、漆', '漆器', 3, '长沙马王堆一号汉墓出土', NULL, '马王堆汉墓出土的彩绘漆棺，黑地上绘制神话和云气等纹样，体现了汉代漆器工艺与墓葬礼制。', 4, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (14, '西汉奏乐木俑', '西汉', '木', '雕塑造像', 3, '长沙马王堆一号汉墓出土', NULL, '墓葬出土的木质乐伎俑，表现汉代宴飨和乐舞场景，为研究汉代宫廷与贵族生活提供了形象资料。', 4, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (15, '云纹漆案', '西汉', '木、漆', '漆器', 3, '长沙马王堆汉墓出土', NULL, '西汉漆案，器表以漆绘云气纹样，体现了马王堆汉墓漆器在造型、髹漆和纹饰方面的工艺水平。', 3, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (16, '青铜大立人像', '商代晚期至西周早期', '青铜', '雕塑造像', 4, '三星堆遗址二号祭祀坑出土', NULL, '三星堆青铜人物像代表，人物站立并持有器物，体现古蜀文明大型青铜人物造像和祭祀礼仪传统。', 7, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (17, '青铜纵目面具', '商代晚期至西周早期', '青铜', '雕塑造像', 4, '三星堆遗址二号祭祀坑出土', NULL, '具有夸张纵目特征的青铜面具，表现古蜀青铜造像独特的视觉样式和宗教想象。', 3, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (18, '青铜神树', '商代晚期至西周早期', '青铜', '祭祀器', 4, '三星堆遗址二号祭祀坑出土', NULL, '大型青铜树形器物，树枝、花果和鸟形装饰层层展开，是三星堆祭祀遗存中具有代表性的青铜器。', 5, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (19, '戴金面罩青铜人头像', '商代晚期至西周早期', '青铜、金', '雕塑造像', 4, '三星堆遗址出土', NULL, '青铜人头像表面覆盖金面罩，体现古蜀文明青铜铸造、黄金加工和人物造像工艺的结合。', 3, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (20, '肩扛象牙人形纹玉璋', '商代晚期至西周早期', '玉', '玉器', 4, '三星堆遗址出土', NULL, '玉璋上刻有人形与象牙等图像，是认识三星堆礼仪、信仰和玉器使用传统的重要材料。', 3, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (21, '青釉兽首鼎', '战国', '瓷', '瓷器', 5, '传世，上海博物馆藏', NULL, '战国青釉器物，器形模拟青铜鼎并以兽首装饰，体现早期瓷器对青铜和玉器造型的承继。', 4, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (22, '彩色釉陶镇墓兽', '唐', '陶', '陶俑', 5, '传世，上海博物馆藏', NULL, '唐代彩色釉陶镇墓类器物，造型具有想象性和威慑感，是唐代墓葬陶塑与釉陶工艺的代表类型。', 5, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (23, '青釉琮式瓶', '南宋', '瓷', '瓷器', 5, '传世，上海博物馆藏', NULL, '南宋青釉瓷瓶，瓶体借鉴玉琮的外形并施青釉，体现宋代瓷器对古代玉器和礼制造型的吸收。', 4, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (24, '青花人物图盘', '明', '瓷', '瓷器', 5, '传世，上海博物馆藏', NULL, '明代青花瓷盘，以人物故事为装饰主题，展示青花绘画、釉下彩工艺和陶瓷叙事装饰的发展。', 5, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (25, '珐琅彩竹菊鹌鹑图瓶', '清', '瓷、珐琅彩', '瓷器', 5, '传世，上海博物馆藏', NULL, '清代珐琅彩瓷瓶，以竹、菊和鹌鹑为装饰题材，体现宫廷瓷器对绘画性装饰和精细彩绘的追求。', 3, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (26, '三彩载乐骆驼俑', '唐', '三彩陶', '陶俑', 6, '陕西地区唐墓出土', NULL, '唐三彩骆驼俑背负乐队，表现唐代交通、商贸和多元文化交流背景下的乐舞生活。', 5, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (27, '镶金兽首玛瑙杯', '唐', '玛瑙、金', '酒器', 6, '西安何家村窖藏出土', NULL, '唐代玛瑙酒杯，杯口镶金并作兽首形制，反映唐代贵族生活、工艺技术和中外文化交流。', 7, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (28, '鎏金舞马衔杯纹银壶', '唐', '银', '酒器', 6, '西安何家村窖藏出土', NULL, '唐代鎏金银壶，器身装饰舞马衔杯纹样，联系唐玄宗时期舞马传统，具有鲜明的时代特色。', 5, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (29, '多友鼎', '西周', '青铜', '礼器', 6, '陕西地区出土', NULL, '西周青铜鼎，器内铭文记录战争和军政事务，是研究西周社会、军事和金文的重要材料。', 5, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `cultural_artifacts` VALUES (30, '五祀卫鼎', '西周', '青铜', '礼器', 6, '陕西地区出土', NULL, '西周青铜鼎，器内铸有长篇铭文，反映西周土地关系、礼制和贵族政治秩序。', 4, 'ONLINE', '2026-08-25 14:08:36', '2026-08-25 14:08:36');

-- ----------------------------
-- Table structure for museums
-- ----------------------------
DROP TABLE IF EXISTS `museums`;
CREATE TABLE `museums`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `open_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `longitude` decimal(10, 6) NULL DEFAULT NULL,
  `latitude` decimal(10, 6) NULL DEFAULT NULL,
  `image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` enum('ACTIVE','DISABLED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_museums_city_status`(`city` ASC, `status` ASC) USING BTREE,
  INDEX `idx_museums_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of museums
-- ----------------------------
INSERT INTO `museums` VALUES (1, '故宫博物院', '北京', '北京市东城区景山前街4号', '08:30 - 17:00，周一闭馆', 116.397155, 39.916345, 'https://s3.bmp.ovh/2026/08/25/4g500yXx.png', '以明清宫廷建筑、宫廷历史和历代艺术珍藏为核心的综合性博物馆，收藏有大量书画、陶瓷、宫廷器物和古琴文物。', 'ACTIVE', '2026-08-25 14:08:36', '2026-08-25 14:51:11');
INSERT INTO `museums` VALUES (2, '中国国家博物馆', '北京', '北京市东城区东长安街16号', '09:00 - 17:30，周一闭馆', 116.401234, 39.904805, 'https://s3.bmp.ovh/2026/08/25/5DzvkLUw.png', '以古代中国和近现代中国陈列为主要内容的国家级综合博物馆，收藏青铜器、陶器、玉器和近现代历史文物。', 'ACTIVE', '2026-08-25 14:08:36', '2026-08-25 14:54:24');
INSERT INTO `museums` VALUES (3, '湖南博物院', '长沙', '湖南省长沙市开福区东风路50号', '09:00 - 17:00，周一闭馆', 112.989683, 28.213296, 'https://s3.bmp.ovh/2026/08/25/PovwmGwW.png\r\nhttps://s3.bmp.ovh/2026/08/25/PovwmGwW.pnghttps://s3.bmp.ovh/2026/08/25/PovwmGwW.png\r\n', '湖南省重要历史文化博物馆，以长沙马王堆汉墓出土文物、湖湘历史和古代艺术收藏为特色。', 'ACTIVE', '2026-08-25 14:08:36', '2026-08-25 14:54:38');
INSERT INTO `museums` VALUES (4, '三星堆博物馆', '广汉', '四川省德阳市广汉市三星堆镇向新路133号', '08:30 - 18:00', 104.218600, 31.001400, 'https://s3.bmp.ovh/2026/08/25/t0N03Kei.png\r\n', '依托三星堆遗址建设的专题博物馆，集中展示古蜀文明的青铜器、金器、玉器和祭祀遗存。', 'ACTIVE', '2026-08-25 14:08:36', '2026-08-25 14:54:46');
INSERT INTO `museums` VALUES (5, '上海博物馆', '上海', '上海市黄浦区人民大道201号', '09:00 - 17:00，周一闭馆', 121.475700, 31.230400, 'https://s3.bmp.ovh/2026/08/25/CWFNAIH8.png\r\n', '以中国古代艺术为主要收藏方向的综合性博物馆，重点展示青铜器、陶瓷器、书画和工艺美术。', 'ACTIVE', '2026-08-25 14:08:36', '2026-08-25 14:54:52');
INSERT INTO `museums` VALUES (6, '陕西历史博物馆', '西安', '陕西省西安市雁塔区小寨东路91号', '08:30 - 19:00', 108.953500, 34.221900, 'https://s3.bmp.ovh/2026/08/25/XncAUPIO.png', '以陕西地区周秦汉唐历史和出土文物为重点的国家一级博物馆，馆藏金银器、青铜器、陶俑和唐代文物具有代表性。', 'ACTIVE', '2026-08-25 14:08:36', '2026-08-25 14:54:59');

-- ----------------------------
-- Table structure for user_accounts
-- ----------------------------
DROP TABLE IF EXISTS `user_accounts`;
CREATE TABLE `user_accounts`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('USER','ADMIN') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USER',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bio` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` enum('ACTIVE','DISABLED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `last_login_at` datetime NULL DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_accounts_username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `uk_user_accounts_phone`(`phone` ASC) USING BTREE,
  UNIQUE INDEX `uk_user_accounts_email`(`email` ASC) USING BTREE,
  INDEX `idx_user_accounts_role_status`(`role` ASC, `status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_accounts
-- ----------------------------
INSERT INTO `user_accounts` VALUES (1, 'admin', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 'ADMIN', NULL, 'admin@relic-voyage.local', '北京', '系统管理员', 'ACTIVE', '2026-08-24 09:12:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (2, 'curator01', '958fd30f64ac34d82850e17dd0d816130c61fd42c64c8e5782515108da1b2eff', 'ADMIN', NULL, 'curator01@relic-voyage.local', '西安', '文物与博物馆内容维护员', 'ACTIVE', '2026-08-23 16:40:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (3, 'linruo', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER', '13800001111', 'linruo@example.com', '北京', '关注文物详情、馆藏路线与收藏回看。', 'ACTIVE', '2026-08-24 08:50:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (4, 'zhouzhi', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER', '13900002222', 'zhouzhi@example.com', '上海', '喜欢青铜器、古代书画和博物馆展览。', 'ACTIVE', '2026-08-23 21:13:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (5, 'shenya', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER', '13700003333', 'shenya@example.com', '长沙', '主要关注马王堆汉墓和汉代生活史。', 'ACTIVE', '2026-08-22 11:08:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (6, 'guye', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER', '13600004444', 'guye@example.com', '西安', '喜欢唐代金银器和丝绸之路相关文物。', 'ACTIVE', '2026-08-21 14:26:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (7, 'guest88', '6b93ccba414ac1d0ae1e77f3fac560c748a6701ed6946735a49d463351518e16', 'USER', '13500005555', 'guest88@example.com', '成都', '体验账号，已停用用于演示账号状态管理。', 'DISABLED', '2026-08-20 09:02:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (8, 'zhaoyue', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER', '13800006666', 'zhaoyue@example.com', '北京', '关注宋代书画与宫廷艺术，常浏览故宫博物院馆藏。', 'ACTIVE', '2026-08-24 08:16:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (9, 'wangchuan', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER', '13800007777', 'wangchuan@example.com', '郑州', '喜欢商周青铜器和中国早期礼制研究。', 'ACTIVE', '2026-08-23 20:42:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (10, 'hejing', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER', '13800008888', 'hejing@example.com', '西安', '长期关注秦汉唐历史与出土文物。', 'ACTIVE', '2026-08-23 18:25:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (11, 'sunqi', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER', '13800009999', 'sunqi@example.com', '长沙', '喜欢马王堆汉墓、丝织品和汉代漆器。', 'ACTIVE', '2026-08-22 15:34:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (12, 'tangyi', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER', '13900006666', 'tangyi@example.com', '上海', '关注中国古代瓷器和博物馆展览路线。', 'ACTIVE', '2026-08-24 10:12:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (13, 'yuehan', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER', '13900007777', 'yuehan@example.com', '成都', '对古蜀文明、三星堆青铜器和玉器感兴趣。', 'ACTIVE', '2026-08-23 12:05:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (14, 'chenmo', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER', '13900008888', 'chenmo@example.com', '杭州', '喜欢从器物纹饰和工艺角度观察文物。', 'ACTIVE', '2026-08-22 21:18:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (15, 'jiangli', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER', '13900009999', 'jiangli@example.com', '南京', '关注青铜礼器、古代书画和历史地理。', 'ACTIVE', '2026-08-21 19:44:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (16, 'xurong', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER', '13700006666', 'xurong@example.com', '广州', '喜欢唐代文化、金银器和中外交流史。', 'ACTIVE', '2026-08-24 07:52:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (17, 'fengqi', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER', '13700007777', 'fengqi@example.com', '太原', '关注西周金文、青铜器铭文和礼制。', 'ACTIVE', '2026-08-20 16:32:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (18, 'xiaoyu', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER', '13700008888', 'xiaoyu@example.com', '武汉', '喜欢陶器、彩陶和新石器时代考古。', 'ACTIVE', '2026-08-23 09:38:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (19, 'luoxi', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER', '13700009999', 'luoxi@example.com', '昆明', '关注不同地区博物馆的专题展览。', 'ACTIVE', '2026-08-22 18:06:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (20, 'qinze', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER', '13600006666', 'qinze@example.com', '天津', '喜欢瓷器釉色、器形和宋代审美。', 'ACTIVE', '2026-08-21 11:24:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (21, 'mohan', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER', '13600007777', 'mohan@example.com', '重庆', '对古代雕塑造像和宗教艺术感兴趣。', 'ACTIVE', '2026-08-24 09:28:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (22, 'yanshu', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER', '13600008888', 'yanshu@example.com', '济南', '喜欢从日常生活角度理解古代文物。', 'ACTIVE', '2026-08-19 14:52:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (23, 'songlin', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER', '13600009999', 'songlin@example.com', '福州', '关注丝绸之路、唐代器物和海外交流。', 'ACTIVE', '2026-08-23 22:10:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (24, 'peixuan', 'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 'USER', '13500006666', 'peixuan@example.com', '青岛', '喜欢艺术史、书画作品和博物馆数字展览。', 'ACTIVE', '2026-08-22 09:18:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (25, 'reviewer02', 'fed0631dcc30d828779ffb9d021bb62f51f3fd6f84e5faf5290aedd337e98d67', 'ADMIN', NULL, 'reviewer02@relic-voyage.local', '长沙', '负责评论回复与汉代专题内容维护。', 'ACTIVE', '2026-08-24 10:20:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');
INSERT INTO `user_accounts` VALUES (26, 'museum_editor', 'ef5e5a1fb95055e0e56cccf98a41e784a132c14e7f6e1ba244302f0e72b29baf', 'ADMIN', NULL, 'museum-editor@relic-voyage.local', '上海', '负责博物馆资料、馆藏分类和展览信息维护。', 'ACTIVE', '2026-08-23 17:18:00', '2026-08-25 14:08:36', '2026-08-25 14:08:36');

-- ----------------------------
-- Table structure for user_browse_history
-- ----------------------------
DROP TABLE IF EXISTS `user_browse_history`;
CREATE TABLE `user_browse_history`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `artifact_id` bigint UNSIGNED NULL DEFAULT NULL,
  `museum_id` bigint UNSIGNED NULL DEFAULT NULL,
  `duration_seconds` int UNSIGNED NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_browse_history_user_time`(`user_id` ASC, `created_at` ASC) USING BTREE,
  INDEX `idx_user_browse_history_artifact_time`(`artifact_id` ASC, `created_at` ASC) USING BTREE,
  INDEX `idx_user_browse_history_museum_time`(`museum_id` ASC, `created_at` ASC) USING BTREE,
  CONSTRAINT `fk_user_browse_history_artifact` FOREIGN KEY (`artifact_id`) REFERENCES `cultural_artifacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_browse_history_museum` FOREIGN KEY (`museum_id`) REFERENCES `museums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_browse_history_user` FOREIGN KEY (`user_id`) REFERENCES `user_accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_browse_history
-- ----------------------------
INSERT INTO `user_browse_history` VALUES (1, 3, 1, NULL, 180, '2026-08-18 09:20:00');
INSERT INTO `user_browse_history` VALUES (2, 3, NULL, 1, 420, '2026-08-18 10:05:00');
INSERT INTO `user_browse_history` VALUES (3, 3, 4, NULL, 150, '2026-08-19 15:10:00');
INSERT INTO `user_browse_history` VALUES (4, 3, NULL, 3, 300, '2026-08-20 11:45:00');
INSERT INTO `user_browse_history` VALUES (5, 3, 27, NULL, 240, '2026-08-21 16:30:00');
INSERT INTO `user_browse_history` VALUES (6, 3, 11, NULL, 210, '2026-08-22 13:15:00');
INSERT INTO `user_browse_history` VALUES (7, 3, NULL, 4, 360, '2026-08-23 15:10:00');
INSERT INTO `user_browse_history` VALUES (8, 3, 2, NULL, 260, '2026-08-24 08:50:00');
INSERT INTO `user_browse_history` VALUES (9, 4, 2, NULL, 190, '2026-08-18 11:20:00');
INSERT INTO `user_browse_history` VALUES (10, 4, NULL, 5, 330, '2026-08-19 14:00:00');
INSERT INTO `user_browse_history` VALUES (11, 4, 21, NULL, 240, '2026-08-20 16:20:00');
INSERT INTO `user_browse_history` VALUES (12, 4, NULL, 6, 280, '2026-08-21 10:25:00');
INSERT INTO `user_browse_history` VALUES (13, 4, 24, NULL, 170, '2026-08-22 13:05:00');
INSERT INTO `user_browse_history` VALUES (14, 5, 11, NULL, 230, '2026-08-18 14:12:00');
INSERT INTO `user_browse_history` VALUES (15, 5, 12, NULL, 180, '2026-08-19 14:18:00');
INSERT INTO `user_browse_history` VALUES (16, 5, NULL, 3, 460, '2026-08-20 09:00:00');
INSERT INTO `user_browse_history` VALUES (17, 5, 14, NULL, 200, '2026-08-21 10:08:00');
INSERT INTO `user_browse_history` VALUES (18, 6, 26, NULL, 210, '2026-08-18 19:25:00');
INSERT INTO `user_browse_history` VALUES (19, 6, NULL, 6, 390, '2026-08-19 20:00:00');
INSERT INTO `user_browse_history` VALUES (20, 6, 28, NULL, 260, '2026-08-20 21:10:00');
INSERT INTO `user_browse_history` VALUES (21, 8, 1, NULL, 240, '2026-08-18 09:42:00');
INSERT INTO `user_browse_history` VALUES (22, 8, 2, NULL, 360, '2026-08-18 10:18:00');
INSERT INTO `user_browse_history` VALUES (23, 8, NULL, 1, 520, '2026-08-18 11:06:00');
INSERT INTO `user_browse_history` VALUES (24, 8, 3, NULL, 280, '2026-08-19 11:36:00');
INSERT INTO `user_browse_history` VALUES (25, 9, 6, NULL, 310, '2026-08-17 13:40:00');
INSERT INTO `user_browse_history` VALUES (26, 9, 7, NULL, 270, '2026-08-18 15:12:00');
INSERT INTO `user_browse_history` VALUES (27, 9, NULL, 2, 480, '2026-08-18 16:04:00');
INSERT INTO `user_browse_history` VALUES (28, 9, 29, NULL, 360, '2026-08-23 16:44:00');
INSERT INTO `user_browse_history` VALUES (29, 10, 10, NULL, 220, '2026-08-18 08:55:00');
INSERT INTO `user_browse_history` VALUES (30, 10, 11, NULL, 340, '2026-08-19 13:10:00');
INSERT INTO `user_browse_history` VALUES (31, 10, NULL, 6, 610, '2026-08-20 14:02:00');
INSERT INTO `user_browse_history` VALUES (32, 10, 27, NULL, 295, '2026-08-22 20:02:00');
INSERT INTO `user_browse_history` VALUES (33, 11, 12, NULL, 250, '2026-08-16 11:18:00');
INSERT INTO `user_browse_history` VALUES (34, 11, 13, NULL, 330, '2026-08-17 11:32:00');
INSERT INTO `user_browse_history` VALUES (35, 11, NULL, 3, 720, '2026-08-20 15:42:00');
INSERT INTO `user_browse_history` VALUES (36, 11, 15, NULL, 260, '2026-08-22 09:14:00');
INSERT INTO `user_browse_history` VALUES (37, 12, 21, NULL, 245, '2026-08-18 17:25:00');
INSERT INTO `user_browse_history` VALUES (38, 12, 23, NULL, 320, '2026-08-19 18:40:00');
INSERT INTO `user_browse_history` VALUES (39, 12, NULL, 5, 540, '2026-08-21 12:05:00');
INSERT INTO `user_browse_history` VALUES (40, 12, 25, NULL, 410, '2026-08-23 10:35:00');
INSERT INTO `user_browse_history` VALUES (41, 13, 16, NULL, 390, '2026-08-17 20:10:00');
INSERT INTO `user_browse_history` VALUES (42, 13, 17, NULL, 350, '2026-08-18 20:28:00');
INSERT INTO `user_browse_history` VALUES (43, 13, NULL, 4, 680, '2026-08-20 21:16:00');
INSERT INTO `user_browse_history` VALUES (44, 13, 20, NULL, 310, '2026-08-22 22:04:00');
INSERT INTO `user_browse_history` VALUES (45, 14, 4, NULL, 210, '2026-08-16 09:44:00');
INSERT INTO `user_browse_history` VALUES (46, 14, 8, NULL, 280, '2026-08-18 14:22:00');
INSERT INTO `user_browse_history` VALUES (47, 14, NULL, 5, 460, '2026-08-21 16:18:00');
INSERT INTO `user_browse_history` VALUES (48, 14, 22, NULL, 325, '2026-08-23 08:46:00');
INSERT INTO `user_browse_history` VALUES (49, 15, 1, NULL, 225, '2026-08-17 15:08:00');
INSERT INTO `user_browse_history` VALUES (50, 15, 6, NULL, 340, '2026-08-19 10:42:00');
INSERT INTO `user_browse_history` VALUES (51, 15, NULL, 2, 510, '2026-08-21 19:26:00');
INSERT INTO `user_browse_history` VALUES (52, 15, 29, NULL, 370, '2026-08-22 17:52:00');
INSERT INTO `user_browse_history` VALUES (53, 16, 2, NULL, 260, '2026-08-18 12:16:00');
INSERT INTO `user_browse_history` VALUES (54, 16, 11, NULL, 300, '2026-08-20 13:48:00');
INSERT INTO `user_browse_history` VALUES (55, 16, NULL, 6, 580, '2026-08-22 18:30:00');
INSERT INTO `user_browse_history` VALUES (56, 16, 28, NULL, 430, '2026-08-23 20:18:00');
INSERT INTO `user_browse_history` VALUES (57, 17, 5, NULL, 280, '2026-08-16 16:10:00');
INSERT INTO `user_browse_history` VALUES (58, 17, 7, NULL, 350, '2026-08-18 11:04:00');
INSERT INTO `user_browse_history` VALUES (59, 17, NULL, 2, 490, '2026-08-21 09:56:00');
INSERT INTO `user_browse_history` VALUES (60, 17, 30, NULL, 390, '2026-08-23 14:36:00');
INSERT INTO `user_browse_history` VALUES (61, 18, 8, NULL, 230, '2026-08-17 18:16:00');
INSERT INTO `user_browse_history` VALUES (62, 18, 10, NULL, 270, '2026-08-19 16:42:00');
INSERT INTO `user_browse_history` VALUES (63, 18, NULL, 2, 420, '2026-08-21 11:08:00');
INSERT INTO `user_browse_history` VALUES (64, 18, 15, NULL, 255, '2026-08-22 12:44:00');
INSERT INTO `user_browse_history` VALUES (65, 19, 16, NULL, 365, '2026-08-18 19:08:00');
INSERT INTO `user_browse_history` VALUES (66, 19, 20, NULL, 315, '2026-08-20 17:34:00');
INSERT INTO `user_browse_history` VALUES (67, 19, NULL, 4, 560, '2026-08-22 15:28:00');
INSERT INTO `user_browse_history` VALUES (68, 19, 24, NULL, 295, '2026-08-23 11:26:00');
INSERT INTO `user_browse_history` VALUES (69, 20, 3, NULL, 245, '2026-08-17 10:30:00');
INSERT INTO `user_browse_history` VALUES (70, 20, 5, NULL, 320, '2026-08-19 12:08:00');
INSERT INTO `user_browse_history` VALUES (71, 20, NULL, 5, 500, '2026-08-21 14:16:00');
INSERT INTO `user_browse_history` VALUES (72, 20, 23, NULL, 350, '2026-08-22 19:40:00');
INSERT INTO `user_browse_history` VALUES (73, 21, 17, NULL, 330, '2026-08-18 13:22:00');
INSERT INTO `user_browse_history` VALUES (74, 21, 18, NULL, 450, '2026-08-20 14:54:00');
INSERT INTO `user_browse_history` VALUES (75, 21, NULL, 4, 640, '2026-08-22 08:18:00');
INSERT INTO `user_browse_history` VALUES (76, 21, 27, NULL, 380, '2026-08-23 17:06:00');
INSERT INTO `user_browse_history` VALUES (77, 22, 4, NULL, 240, '2026-08-16 12:42:00');
INSERT INTO `user_browse_history` VALUES (78, 22, 14, NULL, 310, '2026-08-18 17:16:00');
INSERT INTO `user_browse_history` VALUES (79, 22, NULL, 3, 530, '2026-08-21 16:52:00');
INSERT INTO `user_browse_history` VALUES (80, 22, 29, NULL, 400, '2026-08-23 09:34:00');
INSERT INTO `user_browse_history` VALUES (81, 23, 12, NULL, 260, '2026-08-17 20:22:00');
INSERT INTO `user_browse_history` VALUES (82, 23, 26, NULL, 345, '2026-08-19 21:10:00');
INSERT INTO `user_browse_history` VALUES (83, 23, NULL, 6, 590, '2026-08-22 22:18:00');
INSERT INTO `user_browse_history` VALUES (84, 23, 30, NULL, 420, '2026-08-24 08:08:00');
INSERT INTO `user_browse_history` VALUES (85, 24, 1, NULL, 275, '2026-08-18 16:46:00');
INSERT INTO `user_browse_history` VALUES (86, 24, 3, NULL, 310, '2026-08-20 10:12:00');
INSERT INTO `user_browse_history` VALUES (87, 24, NULL, 1, 480, '2026-08-22 11:36:00');
INSERT INTO `user_browse_history` VALUES (88, 24, 27, NULL, 365, '2026-08-23 13:48:00');
INSERT INTO `user_browse_history` VALUES (89, 3, 23, NULL, 290, '2026-08-24 09:06:00');
INSERT INTO `user_browse_history` VALUES (90, 4, NULL, 4, 570, '2026-08-24 09:28:00');
INSERT INTO `user_browse_history` VALUES (91, 5, 15, NULL, 260, '2026-08-24 09:46:00');
INSERT INTO `user_browse_history` VALUES (92, 6, 30, NULL, 430, '2026-08-24 10:04:00');
INSERT INTO `user_browse_history` VALUES (93, 8, NULL, 2, 510, '2026-08-24 10:22:00');
INSERT INTO `user_browse_history` VALUES (94, 10, 18, NULL, 350, '2026-08-24 10:40:00');
INSERT INTO `user_browse_history` VALUES (95, 12, 28, NULL, 390, '2026-08-24 10:58:00');
INSERT INTO `user_browse_history` VALUES (96, 16, NULL, 6, 620, '2026-08-24 11:16:00');
INSERT INTO `user_browse_history` VALUES (97, 20, 25, NULL, 280, '2026-08-24 11:34:00');
INSERT INTO `user_browse_history` VALUES (98, 23, NULL, 5, 550, '2026-08-24 11:52:00');
INSERT INTO `user_browse_history` VALUES (99, 24, 24, NULL, 300, '2026-08-24 12:10:00');
INSERT INTO `user_browse_history` VALUES (100, 14, 19, NULL, 335, '2026-08-24 12:28:00');

SET FOREIGN_KEY_CHECKS = 1;
