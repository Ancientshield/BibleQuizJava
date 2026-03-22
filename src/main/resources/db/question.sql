/*
 Navicat Premium Dump SQL

 Source Server         : LocalPostgreSQL
 Source Server Type    : PostgreSQL
 Source Server Version : 180001 (180001)
 Source Host           : localhost:5432
 Source Catalog        : postgres
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 180001 (180001)
 File Encoding         : 65001

 Date: 21/03/2026 16:42:44
*/


-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS "public"."question";
CREATE TABLE "public"."question" (
  "id" int4 NOT NULL DEFAULT nextval('question_id_seq'::regclass),
  "content" text COLLATE "pg_catalog"."default" NOT NULL,
  "option_a" varchar(255) COLLATE "pg_catalog"."default",
  "option_b" varchar(255) COLLATE "pg_catalog"."default",
  "option_c" varchar(255) COLLATE "pg_catalog"."default",
  "option_d" varchar(255) COLLATE "pg_catalog"."default",
  "correct_answer" varchar(1) COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."question" OWNER TO "postgres";

-- ----------------------------
-- Records of question
-- ----------------------------
BEGIN;
INSERT INTO "public"."question" ("id", "content", "option_a", "option_b", "option_c", "option_d", "correct_answer") VALUES (1, '以下哪位是舊約中帶領以色列人出埃及的領袖？', '亞伯拉罕', '摩西', '大衛', '所羅門', 'B');
INSERT INTO "public"."question" ("id", "content", "option_a", "option_b", "option_c", "option_d", "correct_answer") VALUES (2, '誰是被稱為「合神心意的人」的以色列王？', '掃羅', '所羅門', '大衛', '希西家', 'C');
INSERT INTO "public"."question" ("id", "content", "option_a", "option_b", "option_c", "option_d", "correct_answer") VALUES (3, '誰被投入獅子坑中卻安然無恙？', '以利亞', '但以理', '約拿', '耶利米', 'B');
INSERT INTO "public"."question" ("id", "content", "option_a", "option_b", "option_c", "option_d", "correct_answer") VALUES (4, '誰的妻子因為回頭看所多瑪而變成鹽柱？', '亞伯拉罕', '羅得', '以撒', '雅各', 'B');
INSERT INTO "public"."question" ("id", "content", "option_a", "option_b", "option_c", "option_d", "correct_answer") VALUES (5, '根據聖經，上帝創造世界花了多少時間？', '一天', '三天', '六天', '七天', 'C');
INSERT INTO "public"."question" ("id", "content", "option_a", "option_b", "option_c", "option_d", "correct_answer") VALUES (6, '耶穌基督有多少位門徒？', '七位', '十位', '十二位', '七十位', 'C');
INSERT INTO "public"."question" ("id", "content", "option_a", "option_b", "option_c", "option_d", "correct_answer") VALUES (7, '聖經中最短的一節經文是什麼？', '神就是愛', '耶穌哭了', '要常常喜樂', '不住禱告', 'B');
INSERT INTO "public"."question" ("id", "content", "option_a", "option_b", "option_c", "option_d", "correct_answer") VALUES (8, '耶穌基督出生在哪個城市？', '拿撒勒', '耶路撒冷', '伯利恆', '迦百農', 'C');
INSERT INTO "public"."question" ("id", "content", "option_a", "option_b", "option_c", "option_d", "correct_answer") VALUES (9, '以色列人在曠野漂流了多少年？', '十年', '二十年', '三十年', '四十年', 'D');
INSERT INTO "public"."question" ("id", "content", "option_a", "option_b", "option_c", "option_d", "correct_answer") VALUES (10, '以下哪個不是耶穌行的神蹟？', '五餅二魚餵飽五千人', '水變成酒', '分開紅海', '使拉撒路復活', 'C');
INSERT INTO "public"."question" ("id", "content", "option_a", "option_b", "option_c", "option_d", "correct_answer") VALUES (11, '挪亞方舟停在哪座山上？', '西奈山', '橄欖山', '亞拉臘山', '迦密山', 'C');
INSERT INTO "public"."question" ("id", "content", "option_a", "option_b", "option_c", "option_d", "correct_answer") VALUES (12, '誰在母腹中就被聖靈充滿？', '撒母耳', '施洗約翰', '耶利米', '參孫', 'B');
INSERT INTO "public"."question" ("id", "content", "option_a", "option_b", "option_c", "option_d", "correct_answer") VALUES (13, '「你們要嘗嘗主恩的滋味，便知道他是美善」出自哪卷書？', '箴言', '詩篇', '以賽亞書', '傳道書', 'B');
INSERT INTO "public"."question" ("id", "content", "option_a", "option_b", "option_c", "option_d", "correct_answer") VALUES (14, '保羅原本的名字是什麼？', '彼得', '掃羅', '巴拿巴', '西拉', 'B');
INSERT INTO "public"."question" ("id", "content", "option_a", "option_b", "option_c", "option_d", "correct_answer") VALUES (15, '耶穌在哪裡行了第一個神蹟？', '耶路撒冷', '迦百農', '迦拿', '伯大尼', 'C');
INSERT INTO "public"."question" ("id", "content", "option_a", "option_b", "option_c", "option_d", "correct_answer") VALUES (16, '聖經中誰的壽命最長？', '亞當', '挪亞', '瑪土撒拉', '亞伯拉罕', 'C');
INSERT INTO "public"."question" ("id", "content", "option_a", "option_b", "option_c", "option_d", "correct_answer") VALUES (17, '十誡是上帝在哪座山上頒布的？', '西奈山', '橄欖山', '錫安山', '何烈山', 'A');
INSERT INTO "public"."question" ("id", "content", "option_a", "option_b", "option_c", "option_d", "correct_answer") VALUES (18, '誰用五餅二魚獻給耶穌？', '一個小男孩', '彼得', '安得烈', '約翰', 'A');
INSERT INTO "public"."question" ("id", "content", "option_a", "option_b", "option_c", "option_d", "correct_answer") VALUES (19, '耶穌被釘十字架前在哪個園子禱告？', '伊甸園', '客西馬尼園', '橄欖園', '葡萄園', 'B');
INSERT INTO "public"."question" ("id", "content", "option_a", "option_b", "option_c", "option_d", "correct_answer") VALUES (20, '啟示錄的作者是誰？', '保羅', '彼得', '約翰', '雅各', 'C');
COMMIT;

-- ----------------------------
-- Primary Key structure for table question
-- ----------------------------
ALTER TABLE "public"."question" ADD CONSTRAINT "question_pkey" PRIMARY KEY ("id");
