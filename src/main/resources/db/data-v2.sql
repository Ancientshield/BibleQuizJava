-- BibleQuiz 題庫 v2（含 category 分類 + bible_ref 出處）
-- 前提：question 表需有 category VARCHAR(20) + bible_ref VARCHAR(50) 欄位（見 E-13-1）
-- 使用前先清空舊資料：TRUNCATE question CASCADE;

-- ============================================================
-- 一、聖經人物（Q1-Q40）：選項是人名
-- ============================================================

-- Q1
INSERT INTO question (id, content, category, bible_ref) VALUES (1, '以下哪位是舊約中帶領以色列人出埃及的領袖？', '聖經人物', '出埃及記 3:10');
INSERT INTO question_option (question_id, content, is_correct) VALUES (1, '亞伯拉罕', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (1, '摩西', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (1, '大衛', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (1, '所羅門', FALSE);

-- Q2
INSERT INTO question (id, content, category, bible_ref) VALUES (2, '誰是被稱為「合神心意的人」的以色列王？', '聖經人物', '撒母耳記上 13:14');
INSERT INTO question_option (question_id, content, is_correct) VALUES (2, '掃羅', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (2, '所羅門', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (2, '大衛', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (2, '希西家', FALSE);

-- Q3
INSERT INTO question (id, content, category, bible_ref) VALUES (3, '誰被投入獅子坑中卻安然無恙？', '聖經人物', '但以理書 6:16-23');
INSERT INTO question_option (question_id, content, is_correct) VALUES (3, '但以理', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (3, '以利亞', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (3, '約拿', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (3, '耶利米', FALSE);

-- Q4
INSERT INTO question (id, content, category, bible_ref) VALUES (4, '誰的妻子因為回頭看所多瑪而變成鹽柱？', '聖經人物', '創世記 19:26');
INSERT INTO question_option (question_id, content, is_correct) VALUES (4, '亞伯拉罕', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (4, '以撒', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (4, '雅各', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (4, '羅得', TRUE);

-- Q5
INSERT INTO question (id, content, category, bible_ref) VALUES (5, '誰在母腹中就被聖靈充滿？', '聖經人物', '路加福音 1:15');
INSERT INTO question_option (question_id, content, is_correct) VALUES (5, '撒母耳', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (5, '施洗約翰', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (5, '耶利米', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (5, '參孫', FALSE);

-- Q6
INSERT INTO question (id, content, category, bible_ref) VALUES (6, '保羅原來的名字是什麼？', '聖經人物', '使徒行傳 13:9');
INSERT INTO question_option (question_id, content, is_correct) VALUES (6, '彼得', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (6, '巴拿巴', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (6, '掃羅', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (6, '西拉', FALSE);

-- Q7
INSERT INTO question (id, content, category, bible_ref) VALUES (7, '聖經中誰的壽命最長？', '聖經人物', '創世記 5:27');
INSERT INTO question_option (question_id, content, is_correct) VALUES (7, '瑪土撒拉', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (7, '亞當', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (7, '挪亞', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (7, '亞伯拉罕', FALSE);

-- Q8
INSERT INTO question (id, content, category, bible_ref) VALUES (8, '誰用五餅二魚獻給耶穌？', '聖經人物', '約翰福音 6:9');
INSERT INTO question_option (question_id, content, is_correct) VALUES (8, '彼得', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (8, '安得烈', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (8, '約翰', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (8, '一個小男孩', TRUE);

-- Q9
INSERT INTO question (id, content, category, bible_ref) VALUES (9, '啟示錄的作者是誰？', '聖經人物', '啟示錄 1:1-4');
INSERT INTO question_option (question_id, content, is_correct) VALUES (9, '保羅', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (9, '約翰', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (9, '彼得', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (9, '雅各', FALSE);

-- Q10
INSERT INTO question (id, content, category, bible_ref) VALUES (10, '以色列人的第一位國王是誰？', '聖經人物', '撒母耳記上 10:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (10, '大衛', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (10, '約書亞', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (10, '掃羅', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (10, '所羅門', FALSE);

-- Q11
INSERT INTO question (id, content, category, bible_ref) VALUES (11, '耶穌復活後首先向誰顯現？', '聖經人物', '馬可福音 16:9');
INSERT INTO question_option (question_id, content, is_correct) VALUES (11, '抹大拉的馬利亞', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (11, '彼得', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (11, '約翰', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (11, '耶穌的母親馬利亞', FALSE);

-- Q12
INSERT INTO question (id, content, category, bible_ref) VALUES (12, '哪位先知被大魚吞了三天三夜？', '聖經人物', '約拿書 1:17');
INSERT INTO question_option (question_id, content, is_correct) VALUES (12, '以利亞', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (12, '以利沙', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (12, '耶利米', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (12, '約拿', TRUE);

-- Q13
INSERT INTO question (id, content, category, bible_ref) VALUES (13, '建造第一座聖殿的是哪位國王？', '聖經人物', '列王紀上 6:1-2');
INSERT INTO question_option (question_id, content, is_correct) VALUES (13, '大衛', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (13, '所羅門', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (13, '希西家', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (13, '約西亞', FALSE);

-- Q14
INSERT INTO question (id, content, category, bible_ref) VALUES (14, '誰被稱為「信心之父」？', '聖經人物', '羅馬書 4:16');
INSERT INTO question_option (question_id, content, is_correct) VALUES (14, '挪亞', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (14, '摩西', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (14, '亞伯拉罕', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (14, '以撒', FALSE);

-- Q15
INSERT INTO question (id, content, category, bible_ref) VALUES (15, '出賣耶穌的門徒是誰？', '聖經人物', '馬太福音 26:14-16');
INSERT INTO question_option (question_id, content, is_correct) VALUES (15, '猶大', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (15, '彼得', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (15, '多馬', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (15, '馬太', FALSE);

-- Q16
INSERT INTO question (id, content, category, bible_ref) VALUES (16, '耶穌在十字架上將母親託付給哪位門徒照顧？', '聖經人物', '約翰福音 19:26-27');
INSERT INTO question_option (question_id, content, is_correct) VALUES (16, '彼得', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (16, '雅各', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (16, '安得烈', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (16, '約翰', TRUE);

-- Q17
INSERT INTO question (id, content, category, bible_ref) VALUES (17, '新約中第一位殉道者是誰？', '聖經人物', '使徒行傳 7:59-60');
INSERT INTO question_option (question_id, content, is_correct) VALUES (17, '彼得', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (17, '司提反', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (17, '雅各', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (17, '保羅', FALSE);

-- Q18
INSERT INTO question (id, content, category, bible_ref) VALUES (18, '雅各用紅豆湯買了誰的長子名分？', '聖經人物', '創世記 25:29-34');
INSERT INTO question_option (question_id, content, is_correct) VALUES (18, '以實瑪利', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (18, '約瑟', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (18, '以掃', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (18, '猶大', FALSE);

-- Q19
INSERT INTO question (id, content, category, bible_ref) VALUES (19, '誰在基立溪旁被烏鴉餵養？', '聖經人物', '列王紀上 17:2-6');
INSERT INTO question_option (question_id, content, is_correct) VALUES (19, '以利亞', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (19, '摩西', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (19, '以利沙', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (19, '撒母耳', FALSE);

-- Q20
INSERT INTO question (id, content, category, bible_ref) VALUES (20, '約翰福音第十一章記載，耶穌使誰從死裡復活？', '聖經人物', '約翰福音 11:43-44');
INSERT INTO question_option (question_id, content, is_correct) VALUES (20, '睚魯的女兒', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (20, '多加', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (20, '拿因城寡婦的兒子', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (20, '拉撒路', TRUE);

-- Q21
INSERT INTO question (id, content, category, bible_ref) VALUES (21, '誰在創世記中用計騙取父親以撒的祝福？', '聖經人物', '創世記 27:1-29');
INSERT INTO question_option (question_id, content, is_correct) VALUES (21, '以掃', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (21, '雅各', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (21, '約瑟', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (21, '猶大', FALSE);

-- Q22
INSERT INTO question (id, content, category, bible_ref) VALUES (22, '誰向上帝求用羊毛的乾濕作為印證？', '聖經人物', '士師記 6:36-40');
INSERT INTO question_option (question_id, content, is_correct) VALUES (22, '摩西', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (22, '巴拉', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (22, '基甸', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (22, '耶弗他', FALSE);

-- Q23
INSERT INTO question (id, content, category, bible_ref) VALUES (23, '在夢中求智慧並蒙神應允的國王是誰？', '聖經人物', '列王紀上 3:5-12');
INSERT INTO question_option (question_id, content, is_correct) VALUES (23, '所羅門', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (23, '大衛', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (23, '希西家', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (23, '約西亞', FALSE);

-- Q24
INSERT INTO question (id, content, category, bible_ref) VALUES (24, '新約中哪位門徒三次不認主？', '聖經人物', '馬太福音 26:69-75');
INSERT INTO question_option (question_id, content, is_correct) VALUES (24, '猶大', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (24, '多馬', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (24, '約翰', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (24, '彼得', TRUE);

-- Q25
INSERT INTO question (id, content, category, bible_ref) VALUES (25, '舊約中誰的力量來源在於頭髮？', '聖經人物', '士師記 16:17');
INSERT INTO question_option (question_id, content, is_correct) VALUES (25, '大衛', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (25, '參孫', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (25, '基甸', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (25, '耶弗他', FALSE);

-- Q26
INSERT INTO question (id, content, category, bible_ref) VALUES (26, '誰在約旦河為耶穌施洗？', '聖經人物', '馬太福音 3:13-16');
INSERT INTO question_option (question_id, content, is_correct) VALUES (26, '以利亞', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (26, '安得烈', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (26, '施洗約翰', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (26, '彼得', FALSE);

-- Q27
INSERT INTO question (id, content, category, bible_ref) VALUES (27, '亞伯拉罕差點獻為燔祭的兒子是誰？', '聖經人物', '創世記 22:1-14');
INSERT INTO question_option (question_id, content, is_correct) VALUES (27, '以撒', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (27, '以實瑪利', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (27, '雅各', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (27, '以掃', FALSE);

-- Q28
INSERT INTO question (id, content, category, bible_ref) VALUES (28, '被哥哥們賣到埃及為奴的是誰？', '聖經人物', '創世記 37:28');
INSERT INTO question_option (question_id, content, is_correct) VALUES (28, '便雅憫', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (28, '猶大', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (28, '流便', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (28, '約瑟', TRUE);

-- Q29
INSERT INTO question (id, content, category, bible_ref) VALUES (29, '誰接替摩西帶領以色列人進入迦南地？', '聖經人物', '約書亞記 1:1-2');
INSERT INTO question_option (question_id, content, is_correct) VALUES (29, '迦勒', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (29, '約書亞', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (29, '亞倫', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (29, '以利亞撒', FALSE);

-- Q30
INSERT INTO question (id, content, category, bible_ref) VALUES (30, '路得的婆婆叫什麼名字？', '聖經人物', '路得記 1:3-4');
INSERT INTO question_option (question_id, content, is_correct) VALUES (30, '利百加', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (30, '拉結', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (30, '拿俄米', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (30, '俄珥巴', FALSE);

-- Q31
INSERT INTO question (id, content, category, bible_ref) VALUES (31, '新約中哪位稅吏爬上桑樹要看耶穌？', '聖經人物', '路加福音 19:1-4');
INSERT INTO question_option (question_id, content, is_correct) VALUES (31, '撒該', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (31, '馬太', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (31, '利未', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (31, '尼哥底母', FALSE);

-- Q32
INSERT INTO question (id, content, category, bible_ref) VALUES (32, '摩西的哥哥、以色列第一位大祭司是誰？', '聖經人物', '出埃及記 28:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (32, '以利亞撒', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (32, '非尼哈', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (32, '以利', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (32, '亞倫', TRUE);

-- Q33
INSERT INTO question (id, content, category, bible_ref) VALUES (33, '哪位先知在迦密山上與巴力的先知對決？', '聖經人物', '列王紀上 18:20-40');
INSERT INTO question_option (question_id, content, is_correct) VALUES (33, '以賽亞', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (33, '以利亞', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (33, '耶利米', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (33, '以利沙', FALSE);

-- Q34
INSERT INTO question (id, content, category, bible_ref) VALUES (34, '大衛的兒子中，哪一位起兵叛變奪取王位？', '聖經人物', '撒母耳記下 15:1-12');
INSERT INTO question_option (question_id, content, is_correct) VALUES (34, '所羅門', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (34, '暗嫩', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (34, '押沙龍', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (34, '亞多尼雅', FALSE);

-- Q35
INSERT INTO question (id, content, category, bible_ref) VALUES (35, '亞當和夏娃的第三個兒子叫什麼名字？', '聖經人物', '創世記 4:25');
INSERT INTO question_option (question_id, content, is_correct) VALUES (35, '塞特', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (35, '亞伯', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (35, '該隱', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (35, '以諾', FALSE);

-- Q36
INSERT INTO question (id, content, category, bible_ref) VALUES (36, '創世記記載，哪位族長「與神同行，神將他取去，他就不在世了」？', '聖經人物', '創世記 5:24');
INSERT INTO question_option (question_id, content, is_correct) VALUES (36, '亞當', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (36, '挪亞', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (36, '亞伯拉罕', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (36, '以諾', TRUE);

-- Q37
INSERT INTO question (id, content, category, bible_ref) VALUES (37, '以斯帖的養父是誰？', '聖經人物', '以斯帖記 2:7');
INSERT INTO question_option (question_id, content, is_correct) VALUES (37, '哈曼', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (37, '末底改', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (37, '亞哈隨魯', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (37, '以斯拉', FALSE);

-- Q38
INSERT INTO question (id, content, category, bible_ref) VALUES (38, '哪位使徒被耶穌稱為「磐石」？', '聖經人物', '馬太福音 16:18');
INSERT INTO question_option (question_id, content, is_correct) VALUES (38, '約翰', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (38, '雅各', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (38, '彼得', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (38, '安得烈', FALSE);

-- Q39
INSERT INTO question (id, content, category, bible_ref) VALUES (39, '被稱為「外邦人的使徒」的是誰？', '聖經人物', '羅馬書 11:13');
INSERT INTO question_option (question_id, content, is_correct) VALUES (39, '保羅', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (39, '彼得', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (39, '巴拿巴', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (39, '腓利', FALSE);

-- Q40
INSERT INTO question (id, content, category, bible_ref) VALUES (40, '哪位女士用帳棚的橛子殺了迦南將軍西西拉？', '聖經人物', '士師記 4:21');
INSERT INTO question_option (question_id, content, is_correct) VALUES (40, '底波拉', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (40, '以斯帖', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (40, '喇合', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (40, '雅億', TRUE);

-- ============================================================
-- 二、聖經事件（Q41-Q80）：選項是事件描述
-- ============================================================

-- Q41
INSERT INTO question (id, content, category, bible_ref) VALUES (41, '耶穌在迦拿的婚宴上行了什麼神蹟？', '聖經事件', '約翰福音 2:1-11');
INSERT INTO question_option (question_id, content, is_correct) VALUES (41, '水變成酒', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (41, '醫治瞎子', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (41, '平靜風浪', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (41, '五餅二魚餵飽眾人', FALSE);

-- Q42
INSERT INTO question (id, content, category, bible_ref) VALUES (42, '上帝在巴別塔事件中做了什麼？', '聖經事件', '創世記 11:1-9');
INSERT INTO question_option (question_id, content, is_correct) VALUES (42, '降下大洪水', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (42, '變亂人的口音', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (42, '降下硫磺與火', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (42, '使地裂開', FALSE);

-- Q43
INSERT INTO question (id, content, category, bible_ref) VALUES (43, '五旬節那天發生了什麼重要的事？', '聖經事件', '使徒行傳 2:1-4');
INSERT INTO question_option (question_id, content, is_correct) VALUES (43, '耶穌復活', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (43, '耶穌升天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (43, '聖靈降臨在門徒身上', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (43, '聖殿被毀', FALSE);

-- Q44
INSERT INTO question (id, content, category, bible_ref) VALUES (44, '出埃及記中的第十災是什麼？', '聖經事件', '出埃及記 12:29-30');
INSERT INTO question_option (question_id, content, is_correct) VALUES (44, '蝗蟲之災', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (44, '黑暗之災', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (44, '血水之災', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (44, '擊殺埃及一切頭生的', TRUE);

-- Q45
INSERT INTO question (id, content, category, bible_ref) VALUES (45, '耶穌在曠野受試探時，魔鬼的第一個試探是什麼？', '聖經事件', '馬太福音 4:1-3');
INSERT INTO question_option (question_id, content, is_correct) VALUES (45, '將石頭變成食物', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (45, '從殿頂跳下去', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (45, '向魔鬼下拜', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (45, '行神蹟給人看', FALSE);

-- Q46
INSERT INTO question (id, content, category, bible_ref) VALUES (46, '上帝如何毀滅所多瑪和蛾摩拉？', '聖經事件', '創世記 19:24-25');
INSERT INTO question_option (question_id, content, is_correct) VALUES (46, '降下大洪水', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (46, '從天上降下硫磺與火', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (46, '使地裂開吞滅', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (46, '降下瘟疫', FALSE);

-- Q47
INSERT INTO question (id, content, category, bible_ref) VALUES (47, '以色列人過紅海後，追趕的埃及軍隊發生了什麼事？', '聖經事件', '出埃及記 14:26-28');
INSERT INTO question_option (question_id, content, is_correct) VALUES (47, '退回埃及', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (47, '迷失在曠野', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (47, '被海水淹沒', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (47, '被天火燒滅', FALSE);

-- Q48
INSERT INTO question (id, content, category, bible_ref) VALUES (48, '耶穌受洗時，天上發生了什麼事？', '聖經事件', '馬太福音 3:16-17');
INSERT INTO question_option (question_id, content, is_correct) VALUES (48, '降下大雨', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (48, '天使吹號', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (48, '出現彩虹', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (48, '天裂開了，聖靈彷彿鴿子降下', TRUE);

-- Q49
INSERT INTO question (id, content, category, bible_ref) VALUES (49, '約書亞帶領以色列人呼喊後，耶利哥城發生了什麼？', '聖經事件', '約書亞記 6:20');
INSERT INTO question_option (question_id, content, is_correct) VALUES (49, '城牆就塌陷了', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (49, '城門自動打開', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (49, '城被大水沖毀', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (49, '城被火燒滅', FALSE);

-- Q50
INSERT INTO question (id, content, category, bible_ref) VALUES (50, '耶穌升天時發生了什麼事？', '聖經事件', '使徒行傳 1:9');
INSERT INTO question_option (question_id, content, is_correct) VALUES (50, '一片大光照耀', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (50, '有一朵雲彩把耶穌接去', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (50, '天使降下梯子', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (50, '天上開了門', FALSE);

-- Q51
INSERT INTO question (id, content, category, bible_ref) VALUES (51, '上帝在洪水後與挪亞立約，應許了什麼？', '聖經事件', '創世記 9:11-13');
INSERT INTO question_option (question_id, content, is_correct) VALUES (51, '賜挪亞長壽', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (51, '使挪亞成為大國', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (51, '不再用洪水毀滅全地', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (51, '永遠保護挪亞的後裔', FALSE);

-- Q52
INSERT INTO question (id, content, category, bible_ref) VALUES (52, '耶穌被釘十字架時，從午正到申初發生了什麼？', '聖經事件', '馬可福音 15:33');
INSERT INTO question_option (question_id, content, is_correct) VALUES (52, '暴風雨', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (52, '天降冰雹', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (52, '大火從天降下', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (52, '遍地都黑暗了', TRUE);

-- Q53
INSERT INTO question (id, content, category, bible_ref) VALUES (53, '門徒在五旬節被聖靈充滿後有什麼表現？', '聖經事件', '使徒行傳 2:4');
INSERT INTO question_option (question_id, content, is_correct) VALUES (53, '說起別國的話來', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (53, '身體發光', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (53, '能行在水面上', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (53, '能看見異象', FALSE);

-- Q54
INSERT INTO question (id, content, category, bible_ref) VALUES (54, '掃羅在大馬士革路上被大光照射後，身體發生了什麼變化？', '聖經事件', '使徒行傳 9:8-9');
INSERT INTO question_option (question_id, content, is_correct) VALUES (54, '變得啞口無言', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (54, '眼睛瞎了', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (54, '全身癱瘓', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (54, '耳朵聾了', FALSE);

-- Q55
INSERT INTO question (id, content, category, bible_ref) VALUES (55, '以利亞在迦密山上獻祭時，發生了什麼事？', '聖經事件', '列王紀上 18:38');
INSERT INTO question_option (question_id, content, is_correct) VALUES (55, '大雨從天降下', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (55, '壇上的水蒸發了', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (55, '耶和華降下火來燒盡燔祭', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (55, '巴力的先知逃跑了', FALSE);

-- Q56
INSERT INTO question (id, content, category, bible_ref) VALUES (56, '耶穌斷氣時，聖殿裡發生了什麼事？', '聖經事件', '馬太福音 27:51');
INSERT INTO question_option (question_id, content, is_correct) VALUES (56, '聖殿倒塌', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (56, '約櫃消失', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (56, '祭壇上的火熄滅', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (56, '幔子從上到下裂為兩半', TRUE);

-- Q57
INSERT INTO question (id, content, category, bible_ref) VALUES (57, '摩西在何烈山看見了什麼異象？', '聖經事件', '出埃及記 3:2');
INSERT INTO question_option (question_id, content, is_correct) VALUES (57, '荊棘被火燒著卻沒有燒毀', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (57, '磐石流出水來', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (57, '一棵枯樹發芽開花', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (57, '天使手持火焰的劍', FALSE);

-- Q58
INSERT INTO question (id, content, category, bible_ref) VALUES (58, '出埃及記中的第一災是什麼？', '聖經事件', '出埃及記 7:20-21');
INSERT INTO question_option (question_id, content, is_correct) VALUES (58, '蛙災', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (58, '水變為血', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (58, '蝨子之災', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (58, '蠅災', FALSE);

-- Q59
INSERT INTO question (id, content, category, bible_ref) VALUES (59, '亞伯拉罕獻以撒時，上帝如何介入？', '聖經事件', '創世記 22:11-13');
INSERT INTO question_option (question_id, content, is_correct) VALUES (59, '以撒自己逃走了', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (59, '撒拉趕來阻止', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (59, '天使呼叫亞伯拉罕，攔住他的手', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (59, '上帝使以撒昏睡', FALSE);

-- Q60
INSERT INTO question (id, content, category, bible_ref) VALUES (60, '耶穌復活後在以馬忤斯路上，兩個門徒認出祂後發生了什麼？', '聖經事件', '路加福音 24:31');
INSERT INTO question_option (question_id, content, is_correct) VALUES (60, '門徒俯伏在地', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (60, '一陣大風吹來', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (60, '耶穌帶他們升天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (60, '耶穌忽然不見了', TRUE);

-- Q61
INSERT INTO question (id, content, category, bible_ref) VALUES (61, '以下哪一件事不是耶穌在曠野受的三個試探之一？', '聖經事件', '馬太福音 4:1-11');
INSERT INTO question_option (question_id, content, is_correct) VALUES (61, '在水面上行走', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (61, '將石頭變成食物', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (61, '從殿頂跳下去', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (61, '向魔鬼下拜換取萬國', FALSE);

-- Q62
INSERT INTO question (id, content, category, bible_ref) VALUES (62, '但以理的三個朋友被扔進火窯後，王看見了什麼？', '聖經事件', '但以理書 3:24-25');
INSERT INTO question_option (question_id, content, is_correct) VALUES (62, '火窯熄滅了', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (62, '有四個人在火中行走', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (62, '三人毫髮無傷地走出來', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (62, '天使從天降下', FALSE);

-- Q63
INSERT INTO question (id, content, category, bible_ref) VALUES (63, '耶穌潔淨聖殿時做了什麼？', '聖經事件', '約翰福音 2:14-16');
INSERT INTO question_option (question_id, content, is_correct) VALUES (63, '在殿裡講道七天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (63, '宣布聖殿將要被毀', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (63, '趕出殿裡做買賣的人', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (63, '使聖殿發光', FALSE);

-- Q64
INSERT INTO question (id, content, category, bible_ref) VALUES (64, '以色列人在曠野怨讟神和摩西，上帝降了什麼懲罰？', '聖經事件', '民數記 21:6');
INSERT INTO question_option (question_id, content, is_correct) VALUES (64, '降下冰雹', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (64, '使地裂開吞滅他們', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (64, '降下瘟疫', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (64, '火蛇咬他們', TRUE);

-- Q65
INSERT INTO question (id, content, category, bible_ref) VALUES (65, '耶穌醫治生來瞎眼的人時，用了什麼方法？', '聖經事件', '約翰福音 9:6-7');
INSERT INTO question_option (question_id, content, is_correct) VALUES (65, '用唾沫和泥抹在他眼睛上', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (65, '按手在他眼上', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (65, '對他說一句話就好了', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (65, '用布蒙住他的眼再打開', FALSE);

-- Q66
INSERT INTO question (id, content, category, bible_ref) VALUES (66, '以利沙的僕人基哈西因為什麼罪受到懲罰？', '聖經事件', '列王紀下 5:20-27');
INSERT INTO question_option (question_id, content, is_correct) VALUES (66, '拜偶像', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (66, '私自向乃縵索取財物', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (66, '洩露軍事機密', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (66, '背叛以利沙', FALSE);

-- Q67
INSERT INTO question (id, content, category, bible_ref) VALUES (67, '耶穌在客西馬尼園禱告時，門徒在做什麼？', '聖經事件', '馬太福音 26:40');
INSERT INTO question_option (question_id, content, is_correct) VALUES (67, '一起禱告', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (67, '守衛園子', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (67, '睡著了', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (67, '逃走了', FALSE);

-- Q68
INSERT INTO question (id, content, category, bible_ref) VALUES (68, '法老的夢中，七隻肥壯的母牛後來怎麼了？', '聖經事件', '創世記 41:1-4');
INSERT INTO question_option (question_id, content, is_correct) VALUES (68, '走進河裡', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (68, '被獅子吃掉', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (68, '變成了金子', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (68, '被七隻瘦弱的母牛吞吃了', TRUE);

-- Q69
INSERT INTO question (id, content, category, bible_ref) VALUES (69, '彼得在約帕看見了什麼異象？', '聖經事件', '使徒行傳 10:9-16');
INSERT INTO question_option (question_id, content, is_correct) VALUES (69, '一塊大布包著各樣活物從天降下', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (69, '天使從天降下', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (69, '一卷書從天降下', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (69, '火焰從天而降', FALSE);

-- Q70
INSERT INTO question (id, content, category, bible_ref) VALUES (70, '所羅門王晚年犯了什麼罪，導致王國後來分裂？', '聖經事件', '列王紀上 11:1-4');
INSERT INTO question_option (question_id, content, is_correct) VALUES (70, '殺害先知', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (70, '隨從外邦妻子去拜偶像', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (70, '壓榨百姓修建王宮', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (70, '與埃及結盟攻打鄰國', FALSE);

-- Q71
INSERT INTO question (id, content, category, bible_ref) VALUES (71, '耶穌復活後在提比哩亞海邊顯現時，門徒正在做什麼？', '聖經事件', '約翰福音 21:3-6');
INSERT INTO question_option (question_id, content, is_correct) VALUES (71, '在會堂禱告', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (71, '在家中吃飯', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (71, '打魚', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (71, '往以馬忤斯去', FALSE);

-- Q72
INSERT INTO question (id, content, category, bible_ref) VALUES (72, '亞干犯了什麼罪導致以色列人在艾城戰敗？', '聖經事件', '約書亞記 7:20-21');
INSERT INTO question_option (question_id, content, is_correct) VALUES (72, '拜偶像', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (72, '殺了同族的人', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (72, '背叛約書亞', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (72, '私藏了當滅之物', TRUE);

-- Q73
INSERT INTO question (id, content, category, bible_ref) VALUES (73, '彼得在五旬節講道後，聽眾有什麼反應？', '聖經事件', '使徒行傳 2:37-41');
INSERT INTO question_option (question_id, content, is_correct) VALUES (73, '覺得扎心，問「我們當怎樣行」', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (73, '把彼得抓起來', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (73, '不理會就散去', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (73, '向彼得獻祭', FALSE);

-- Q74
INSERT INTO question (id, content, category, bible_ref) VALUES (74, '使徒行傳中，亞拿尼亞和撒非喇夫妻犯了什麼罪？', '聖經事件', '使徒行傳 5:1-10');
INSERT INTO question_option (question_id, content, is_correct) VALUES (74, '拜偶像', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (74, '欺哄聖靈，私自留下田產的價銀', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (74, '殺害信徒', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (74, '否認耶穌', FALSE);

-- Q75
INSERT INTO question (id, content, category, bible_ref) VALUES (75, '以色列百姓要求撒母耳做什麼，使撒母耳不悅？', '聖經事件', '撒母耳記上 8:4-5');
INSERT INTO question_option (question_id, content, is_correct) VALUES (75, '建一座聖殿', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (75, '帶他們離開迦南', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (75, '為他們立一個王', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (75, '廢除十一奉獻', FALSE);

-- Q76
INSERT INTO question (id, content, category, bible_ref) VALUES (76, '出埃及記中，以色列人在利非訂口渴時，摩西怎樣取水？', '聖經事件', '出埃及記 17:5-6');
INSERT INTO question_option (question_id, content, is_correct) VALUES (76, '向天禱告降雨', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (76, '在地上挖井', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (76, '對磐石說話', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (76, '用杖擊打磐石', TRUE);

-- Q77
INSERT INTO question (id, content, category, bible_ref) VALUES (77, '耶穌被捕時，彼得做了什麼？', '聖經事件', '約翰福音 18:10');
INSERT INTO question_option (question_id, content, is_correct) VALUES (77, '拔刀削掉大祭司僕人的耳朵', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (77, '跪下來禱告', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (77, '大聲呼叫求救', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (77, '用身體擋住耶穌', FALSE);

-- Q78
INSERT INTO question (id, content, category, bible_ref) VALUES (78, '保羅和西拉在腓立比的監獄中，半夜在做什麼？', '聖經事件', '使徒行傳 16:25');
INSERT INTO question_option (question_id, content, is_correct) VALUES (78, '計畫逃跑', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (78, '禱告唱詩讚美神', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (78, '睡覺', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (78, '與獄卒爭論', FALSE);

-- Q79
INSERT INTO question (id, content, category, bible_ref) VALUES (79, '彼得在海面上走向耶穌時，為什麼開始下沉？', '聖經事件', '馬太福音 14:30');
INSERT INTO question_option (question_id, content, is_correct) VALUES (79, '耶穌命令他回去', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (79, '被大浪打到', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (79, '看見風浪就害怕了', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (79, '走得太遠力氣不夠', FALSE);

-- Q80
INSERT INTO question (id, content, category, bible_ref) VALUES (80, '耶穌在變像山上顯現時，門徒看見了什麼？', '聖經事件', '馬太福音 17:1-3');
INSERT INTO question_option (question_id, content, is_correct) VALUES (80, '天使列隊', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (80, '一座金城從天降下', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (80, '大地震動', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (80, '耶穌的臉面明亮如日頭，衣裳潔白如光', TRUE);

-- ============================================================
-- 三、聖經歷史（Q81-Q120）：選項是時間、時期、年數
-- ============================================================

-- Q81
INSERT INTO question (id, content, category, bible_ref) VALUES (81, '以色列人在曠野漂流了多少年？', '聖經歷史', '民數記 14:33-34');
INSERT INTO question_option (question_id, content, is_correct) VALUES (81, '十年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (81, '四十年', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (81, '七十年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (81, '一百年', FALSE);

-- Q82
INSERT INTO question (id, content, category, bible_ref) VALUES (82, '耶穌在曠野禁食了多久？', '聖經歷史', '馬太福音 4:2');
INSERT INTO question_option (question_id, content, is_correct) VALUES (82, '七天七夜', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (82, '二十天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (82, '四十天四十夜', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (82, '一百天', FALSE);

-- Q83
INSERT INTO question (id, content, category, bible_ref) VALUES (83, '以色列人在埃及寄居了多少年？', '聖經歷史', '出埃及記 12:40');
INSERT INTO question_option (question_id, content, is_correct) VALUES (83, '一百年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (83, '二百年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (83, '七百年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (83, '四百三十年', TRUE);

-- Q84
INSERT INTO question (id, content, category, bible_ref) VALUES (84, '約拿在大魚腹中待了多久？', '聖經歷史', '約拿書 1:17');
INSERT INTO question_option (question_id, content, is_correct) VALUES (84, '三天三夜', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (84, '一天一夜', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (84, '七天七夜', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (84, '四十天', FALSE);

-- Q85
INSERT INTO question (id, content, category, bible_ref) VALUES (85, '耶穌被釘十字架是在猶太人的什麼節期？', '聖經歷史', '約翰福音 19:14');
INSERT INTO question_option (question_id, content, is_correct) VALUES (85, '住棚節', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (85, '逾越節', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (85, '五旬節', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (85, '普珥節', FALSE);

-- Q86
INSERT INTO question (id, content, category, bible_ref) VALUES (86, '耶穌出生大約是在什麼時期？', '聖經歷史', '馬太福音 2:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (86, '士師時期', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (86, '大衛王朝時期', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (86, '羅馬帝國統治時期', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (86, '波斯帝國時期', FALSE);

-- Q87
INSERT INTO question (id, content, category, bible_ref) VALUES (87, '耶穌死後第幾天復活？', '聖經歷史', '路加福音 24:7');
INSERT INTO question_option (question_id, content, is_correct) VALUES (87, '當天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (87, '第二天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (87, '第七天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (87, '第三天', TRUE);

-- Q88
INSERT INTO question (id, content, category, bible_ref) VALUES (88, '拉撒路死了幾天後耶穌才到達？', '聖經歷史', '約翰福音 11:17');
INSERT INTO question_option (question_id, content, is_correct) VALUES (88, '四天', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (88, '一天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (88, '兩天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (88, '七天', FALSE);

-- Q89
INSERT INTO question (id, content, category, bible_ref) VALUES (89, '所羅門花了多少年建造第一座聖殿？', '聖經歷史', '列王紀上 6:38');
INSERT INTO question_option (question_id, content, is_correct) VALUES (89, '三年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (89, '七年', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (89, '十二年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (89, '二十年', FALSE);

-- Q90
INSERT INTO question (id, content, category, bible_ref) VALUES (90, '雅各為了娶拉結，前後共服事拉班多少年？', '聖經歷史', '創世記 29:20-30');
INSERT INTO question_option (question_id, content, is_correct) VALUES (90, '七年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (90, '十年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (90, '十四年', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (90, '二十一年', FALSE);

-- Q91
INSERT INTO question (id, content, category, bible_ref) VALUES (91, '尼希米帶領百姓重建耶路撒冷城牆花了多少天？', '聖經歷史', '尼希米記 6:15');
INSERT INTO question_option (question_id, content, is_correct) VALUES (91, '七天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (91, '三十天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (91, '一百天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (91, '五十二天', TRUE);

-- Q92
INSERT INTO question (id, content, category, bible_ref) VALUES (92, '挪亞洪水開始時，挪亞幾歲？', '聖經歷史', '創世記 7:6');
INSERT INTO question_option (question_id, content, is_correct) VALUES (92, '六百歲', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (92, '三百歲', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (92, '五百歲', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (92, '九百歲', FALSE);

-- Q93
INSERT INTO question (id, content, category, bible_ref) VALUES (93, '路加福音記載，耶穌在聖殿中與教師們談論時幾歲？', '聖經歷史', '路加福音 2:42');
INSERT INTO question_option (question_id, content, is_correct) VALUES (93, '八歲', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (93, '十二歲', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (93, '十五歲', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (93, '二十歲', FALSE);

-- Q94
INSERT INTO question (id, content, category, bible_ref) VALUES (94, '以色列王國分裂成南國猶大和北國以色列，是在什麼時候？', '聖經歷史', '列王紀上 12:1-20');
INSERT INTO question_option (question_id, content, is_correct) VALUES (94, '摩西死後', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (94, '大衛死後', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (94, '所羅門死後', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (94, '被擄歸回後', FALSE);

-- Q95
INSERT INTO question (id, content, category, bible_ref) VALUES (95, '耶穌開始出來傳道大約是幾歲？', '聖經歷史', '路加福音 3:23');
INSERT INTO question_option (question_id, content, is_correct) VALUES (95, '二十歲', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (95, '二十五歲', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (95, '三十三歲', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (95, '三十歲', TRUE);

-- Q96
INSERT INTO question (id, content, category, bible_ref) VALUES (96, '從耶穌復活到五旬節聖靈降臨，中間大約多少天？', '聖經歷史', '使徒行傳 1:3');
INSERT INTO question_option (question_id, content, is_correct) VALUES (96, '五十天', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (96, '七天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (96, '十天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (96, '一百天', FALSE);

-- Q97
INSERT INTO question (id, content, category, bible_ref) VALUES (97, '以色列人被擄到巴比倫共多少年？', '聖經歷史', '耶利米書 25:11-12');
INSERT INTO question_option (question_id, content, is_correct) VALUES (97, '四十年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (97, '七十年', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (97, '一百年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (97, '四百年', FALSE);

-- Q98
INSERT INTO question (id, content, category, bible_ref) VALUES (98, '以色列人被擄歸回，是在哪個帝國統治時期？', '聖經歷史', '以斯拉記 1:1-2');
INSERT INTO question_option (question_id, content, is_correct) VALUES (98, '巴比倫帝國時期', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (98, '亞述帝國時期', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (98, '波斯帝國時期', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (98, '希臘帝國時期', FALSE);

-- Q99
INSERT INTO question (id, content, category, bible_ref) VALUES (99, '摩西帶領以色列人出埃及時，摩西幾歲？', '聖經歷史', '出埃及記 7:7');
INSERT INTO question_option (question_id, content, is_correct) VALUES (99, '四十歲', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (99, '六十歲', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (99, '一百歲', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (99, '八十歲', TRUE);

-- Q100
INSERT INTO question (id, content, category, bible_ref) VALUES (100, '以色列人繞耶利哥城共花了幾天？', '聖經歷史', '約書亞記 6:3-4');
INSERT INTO question_option (question_id, content, is_correct) VALUES (100, '七天', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (100, '一天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (100, '三天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (100, '四十天', FALSE);

-- Q101
INSERT INTO question (id, content, category, bible_ref) VALUES (101, '挪亞時代的大雨下了多久？', '聖經歷史', '創世記 7:12');
INSERT INTO question_option (question_id, content, is_correct) VALUES (101, '七天七夜', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (101, '四十天四十夜', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (101, '一百天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (101, '一年', FALSE);

-- Q102
INSERT INTO question (id, content, category, bible_ref) VALUES (102, '耶穌復活後在地上顯現了多少天才升天？', '聖經歷史', '使徒行傳 1:3');
INSERT INTO question_option (question_id, content, is_correct) VALUES (102, '三天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (102, '十天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (102, '四十天', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (102, '七十天', FALSE);

-- Q103
INSERT INTO question (id, content, category, bible_ref) VALUES (103, '亞伯拉罕幾歲時得到應許之子以撒？', '聖經歷史', '創世記 21:5');
INSERT INTO question_option (question_id, content, is_correct) VALUES (103, '七十五歲', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (103, '八十六歲', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (103, '九十歲', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (103, '一百歲', TRUE);

-- Q104
INSERT INTO question (id, content, category, bible_ref) VALUES (104, '掃羅（保羅）在大馬士革路上瞎眼後，過了多久恢復視力？', '聖經歷史', '使徒行傳 9:9');
INSERT INTO question_option (question_id, content, is_correct) VALUES (104, '三天', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (104, '一天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (104, '七天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (104, '四十天', FALSE);

-- Q105
INSERT INTO question (id, content, category, bible_ref) VALUES (105, '摩西在西奈山上停留了多久領受律法？', '聖經歷史', '出埃及記 24:18');
INSERT INTO question_option (question_id, content, is_correct) VALUES (105, '七天七夜', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (105, '四十天四十夜', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (105, '一百天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (105, '一年', FALSE);

-- Q106
INSERT INTO question (id, content, category, bible_ref) VALUES (106, '以色列人出埃及後到達西奈山，大約花了多少時間？', '聖經歷史', '出埃及記 19:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (106, '七天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (106, '一個月', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (106, '三個月', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (106, '一年', FALSE);

-- Q107
INSERT INTO question (id, content, category, bible_ref) VALUES (107, '所羅門在耶路撒冷作以色列王共多少年？', '聖經歷史', '列王紀上 11:42');
INSERT INTO question_option (question_id, content, is_correct) VALUES (107, '七年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (107, '二十年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (107, '三十年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (107, '四十年', TRUE);

-- Q108
INSERT INTO question (id, content, category, bible_ref) VALUES (108, '「士師時期」大約介於以色列歷史的哪兩個階段之間？', '聖經歷史', '士師記 2:16-18');
INSERT INTO question_option (question_id, content, is_correct) VALUES (108, '約書亞之後到掃羅稱王之前', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (108, '亞伯拉罕時期到摩西時期之間', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (108, '大衛時期到所羅門時期之間', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (108, '被擄時期到歸回時期之間', FALSE);

-- Q109
INSERT INTO question (id, content, category, bible_ref) VALUES (109, '舊約和新約之間的「沉默時期」大約有多長？', '聖經歷史', '瑪拉基書 4:5-6');
INSERT INTO question_option (question_id, content, is_correct) VALUES (109, '約一百年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (109, '約四百年', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (109, '約兩百年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (109, '約七百年', FALSE);

-- Q110
INSERT INTO question (id, content, category, bible_ref) VALUES (110, '約瑟為酒政解夢後，又過了多久才被法老提出監牢？', '聖經歷史', '創世記 41:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (110, '七天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (110, '三個月', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (110, '兩年', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (110, '七年', FALSE);

-- Q111
INSERT INTO question (id, content, category, bible_ref) VALUES (111, '上帝用多少天創造天地萬物？', '聖經歷史', '創世記 1:31-2:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (111, '一天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (111, '三天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (111, '七天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (111, '六天', TRUE);

-- Q112
INSERT INTO question (id, content, category, bible_ref) VALUES (112, '以色列人受米甸人壓制幾年後，上帝興起基甸拯救他們？', '聖經歷史', '士師記 6:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (112, '七年', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (112, '三年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (112, '十二年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (112, '二十年', FALSE);

-- Q113
INSERT INTO question (id, content, category, bible_ref) VALUES (113, '希西家王生病時，上帝應許加增他多少年壽命？', '聖經歷史', '列王紀下 20:6');
INSERT INTO question_option (question_id, content, is_correct) VALUES (113, '五年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (113, '十五年', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (113, '十年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (113, '二十年', FALSE);

-- Q114
INSERT INTO question (id, content, category, bible_ref) VALUES (114, '挪亞一家在方舟裡大約待了多久？', '聖經歷史', '創世記 8:13-14');
INSERT INTO question_option (question_id, content, is_correct) VALUES (114, '四十天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (114, '三個月', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (114, '約一年', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (114, '三年', FALSE);

-- Q115
INSERT INTO question (id, content, category, bible_ref) VALUES (115, '大衛在希伯崙先作猶大王多少年，然後才作全以色列的王？', '聖經歷史', '撒母耳記下 5:5');
INSERT INTO question_option (question_id, content, is_correct) VALUES (115, '一年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (115, '三年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (115, '十二年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (115, '七年半', TRUE);

-- Q116
INSERT INTO question (id, content, category, bible_ref) VALUES (116, '參孫作以色列的士師多少年？', '聖經歷史', '士師記 15:20');
INSERT INTO question_option (question_id, content, is_correct) VALUES (116, '二十年', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (116, '七年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (116, '十年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (116, '四十年', FALSE);

-- Q117
INSERT INTO question (id, content, category, bible_ref) VALUES (117, '但以理書「七十個七」的預言，總年數是多少？', '聖經歷史', '但以理書 9:24');
INSERT INTO question_option (question_id, content, is_correct) VALUES (117, '七十年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (117, '四百九十年', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (117, '一百年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (117, '三百年', FALSE);

-- Q118
INSERT INTO question (id, content, category, bible_ref) VALUES (118, '以色列人受非利士人壓制多少年後，上帝興起參孫？', '聖經歷史', '士師記 13:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (118, '七年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (118, '二十年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (118, '四十年', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (118, '七十年', FALSE);

-- Q119
INSERT INTO question (id, content, category, bible_ref) VALUES (119, '保羅歸主後，過了多少年才上耶路撒冷去見使徒們？', '聖經歷史', '加拉太書 1:18');
INSERT INTO question_option (question_id, content, is_correct) VALUES (119, '四十天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (119, '一年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (119, '七年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (119, '三年', TRUE);

-- Q120
INSERT INTO question (id, content, category, bible_ref) VALUES (120, '大衛在耶路撒冷作全以色列的王多少年？', '聖經歷史', '撒母耳記下 5:5');
INSERT INTO question_option (question_id, content, is_correct) VALUES (120, '三十三年', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (120, '七年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (120, '二十年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (120, '四十年', FALSE);

-- ============================================================
-- 四、聖經地理（Q121-Q160）：選項是地名
-- ============================================================

-- Q121
INSERT INTO question (id, content, category, bible_ref) VALUES (121, '耶穌基督出生在哪個城市？', '聖經地理', '馬太福音 2:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (121, '拿撒勒', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (121, '伯利恆', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (121, '耶路撒冷', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (121, '迦百農', FALSE);

-- Q122
INSERT INTO question (id, content, category, bible_ref) VALUES (122, '挪亞方舟停在哪座山上？', '聖經地理', '創世記 8:4');
INSERT INTO question_option (question_id, content, is_correct) VALUES (122, '西奈山', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (122, '橄欖山', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (122, '亞拉臘山', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (122, '迦密山', FALSE);

-- Q123
INSERT INTO question (id, content, category, bible_ref) VALUES (123, '十誡是上帝在哪座山上頒布的？', '聖經地理', '出埃及記 19:20');
INSERT INTO question_option (question_id, content, is_correct) VALUES (123, '西奈山', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (123, '橄欖山', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (123, '錫安山', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (123, '尼波山', FALSE);

-- Q124
INSERT INTO question (id, content, category, bible_ref) VALUES (124, '耶穌在哪個城市行了第一個神蹟（水變酒）？', '聖經地理', '約翰福音 2:1-11');
INSERT INTO question_option (question_id, content, is_correct) VALUES (124, '耶路撒冷', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (124, '迦百農', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (124, '伯大尼', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (124, '迦拿', TRUE);

-- Q125
INSERT INTO question (id, content, category, bible_ref) VALUES (125, '耶穌被釘十字架前在哪個園子禱告？', '聖經地理', '馬太福音 26:36');
INSERT INTO question_option (question_id, content, is_correct) VALUES (125, '伊甸園', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (125, '客西馬尼園', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (125, '橄欖園', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (125, '葡萄園', FALSE);

-- Q126
INSERT INTO question (id, content, category, bible_ref) VALUES (126, '耶穌在哪個城市長大？', '聖經地理', '馬太福音 2:23');
INSERT INTO question_option (question_id, content, is_correct) VALUES (126, '拿撒勒', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (126, '伯利恆', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (126, '迦百農', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (126, '耶路撒冷', FALSE);

-- Q127
INSERT INTO question (id, content, category, bible_ref) VALUES (127, '以色列人出埃及後過了哪片海？', '聖經地理', '出埃及記 14:21-22');
INSERT INTO question_option (question_id, content, is_correct) VALUES (127, '地中海', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (127, '加利利海', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (127, '紅海', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (127, '死海', FALSE);

-- Q128
INSERT INTO question (id, content, category, bible_ref) VALUES (128, '創世記記載，他拉帶著亞伯蘭出了迦勒底的哪個城市？', '聖經地理', '創世記 11:31');
INSERT INTO question_option (question_id, content, is_correct) VALUES (128, '哈蘭', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (128, '巴比倫', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (128, '尼尼微', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (128, '吾珥', TRUE);

-- Q129
INSERT INTO question (id, content, category, bible_ref) VALUES (129, '以利亞與巴力先知對決是在哪座山上？', '聖經地理', '列王紀上 18:19');
INSERT INTO question_option (question_id, content, is_correct) VALUES (129, '西奈山', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (129, '迦密山', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (129, '橄欖山', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (129, '他泊山', FALSE);

-- Q130
INSERT INTO question (id, content, category, bible_ref) VALUES (130, '耶穌受洗是在哪條河？', '聖經地理', '馬太福音 3:13');
INSERT INTO question_option (question_id, content, is_correct) VALUES (130, '約旦河', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (130, '尼羅河', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (130, '幼發拉底河', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (130, '基順河', FALSE);

-- Q131
INSERT INTO question (id, content, category, bible_ref) VALUES (131, '所羅門聖殿建在哪個城市？', '聖經地理', '列王紀上 6:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (131, '示劍', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (131, '希伯崙', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (131, '耶路撒冷', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (131, '伯特利', FALSE);

-- Q132
INSERT INTO question (id, content, category, bible_ref) VALUES (132, '雅各在夢中看見天梯的地方，後來被他命名為什麼？', '聖經地理', '創世記 28:19');
INSERT INTO question_option (question_id, content, is_correct) VALUES (132, '示劍', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (132, '希伯崙', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (132, '別是巴', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (132, '伯特利', TRUE);

-- Q133
INSERT INTO question (id, content, category, bible_ref) VALUES (133, '約拿原本被差遣去哪個城市傳道卻逃跑了？', '聖經地理', '約拿書 1:2');
INSERT INTO question_option (question_id, content, is_correct) VALUES (133, '巴比倫', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (133, '尼尼微', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (133, '大馬士革', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (133, '推羅', FALSE);

-- Q134
INSERT INTO question (id, content, category, bible_ref) VALUES (134, '以色列人過約旦河後攻陷的第一座城是？', '聖經地理', '約書亞記 6:20');
INSERT INTO question_option (question_id, content, is_correct) VALUES (134, '耶利哥', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (134, '艾城', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (134, '示劍', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (134, '希伯崙', FALSE);

-- Q135
INSERT INTO question (id, content, category, bible_ref) VALUES (135, '巴別塔建在哪個平原上？', '聖經地理', '創世記 11:2');
INSERT INTO question_option (question_id, content, is_correct) VALUES (135, '約旦平原', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (135, '非利士平原', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (135, '示拿平原', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (135, '摩押平原', FALSE);

-- Q136
INSERT INTO question (id, content, category, bible_ref) VALUES (136, '大衛與歌利亞對戰的山谷叫什麼？', '聖經地理', '撒母耳記上 17:2');
INSERT INTO question_option (question_id, content, is_correct) VALUES (136, '約沙法谷', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (136, '欣嫩子谷', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (136, '汲淪谷', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (136, '以拉谷', TRUE);

-- Q137
INSERT INTO question (id, content, category, bible_ref) VALUES (137, '耶穌在哪個城市行了最多的神蹟，卻被責備不悔改？', '聖經地理', '馬太福音 11:23');
INSERT INTO question_option (question_id, content, is_correct) VALUES (137, '拿撒勒', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (137, '迦百農', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (137, '耶路撒冷', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (137, '伯利恆', FALSE);

-- Q138
INSERT INTO question (id, content, category, bible_ref) VALUES (138, '摩西在哪座山上遠眺應許之地卻不得進入？', '聖經地理', '申命記 34:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (138, '尼波山', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (138, '西奈山', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (138, '何烈山', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (138, '迦密山', FALSE);

-- Q139
INSERT INTO question (id, content, category, bible_ref) VALUES (139, '保羅第一次宣教旅程從哪個城市出發？', '聖經地理', '使徒行傳 13:1-3');
INSERT INTO question_option (question_id, content, is_correct) VALUES (139, '耶路撒冷', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (139, '大馬士革', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (139, '安提阿', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (139, '以弗所', FALSE);

-- Q140
INSERT INTO question (id, content, category, bible_ref) VALUES (140, '耶穌使拉撒路復活的地點在哪裡？', '聖經地理', '約翰福音 11:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (140, '迦百農', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (140, '耶路撒冷', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (140, '拿撒勒', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (140, '伯大尼', TRUE);

-- Q141
INSERT INTO question (id, content, category, bible_ref) VALUES (141, '所多瑪和蛾摩拉位於哪個地區？', '聖經地理', '創世記 13:10-12');
INSERT INTO question_option (question_id, content, is_correct) VALUES (141, '地中海沿岸', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (141, '約旦河平原', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (141, '加利利海邊', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (141, '幼發拉底河畔', FALSE);

-- Q142
INSERT INTO question (id, content, category, bible_ref) VALUES (142, '保羅在哪個城市傳道時引起銀匠底米丟的騷動？', '聖經地理', '使徒行傳 19:24-29');
INSERT INTO question_option (question_id, content, is_correct) VALUES (142, '以弗所', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (142, '哥林多', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (142, '腓立比', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (142, '帖撒羅尼迦', FALSE);

-- Q143
INSERT INTO question (id, content, category, bible_ref) VALUES (143, '以色列人出埃及後找到的第一處水源是苦的，那地方叫什麼？', '聖經地理', '出埃及記 15:23');
INSERT INTO question_option (question_id, content, is_correct) VALUES (143, '利非訂', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (143, '以琳', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (143, '瑪拉', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (143, '書珥', FALSE);

-- Q144
INSERT INTO question (id, content, category, bible_ref) VALUES (144, '耶穌復活後在哪裡升天？', '聖經地理', '使徒行傳 1:12');
INSERT INTO question_option (question_id, content, is_correct) VALUES (144, '西奈山', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (144, '錫安山', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (144, '迦密山', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (144, '橄欖山', TRUE);

-- Q145
INSERT INTO question (id, content, category, bible_ref) VALUES (145, '五旬節聖靈降臨是在哪個城市？', '聖經地理', '使徒行傳 2:1-5');
INSERT INTO question_option (question_id, content, is_correct) VALUES (145, '安提阿', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (145, '耶路撒冷', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (145, '迦百農', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (145, '撒瑪利亞', FALSE);

-- Q146
INSERT INTO question (id, content, category, bible_ref) VALUES (146, '摩西在哪座山上看見燃燒的荊棘？', '聖經地理', '出埃及記 3:1-2');
INSERT INTO question_option (question_id, content, is_correct) VALUES (146, '何烈山', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (146, '尼波山', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (146, '亞拉臘山', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (146, '迦密山', FALSE);

-- Q147
INSERT INTO question (id, content, category, bible_ref) VALUES (147, '使徒約翰寫啟示錄時被流放到哪個島？', '聖經地理', '啟示錄 1:9');
INSERT INTO question_option (question_id, content, is_correct) VALUES (147, '居比路', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (147, '革哩底', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (147, '拔摩島', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (147, '米利大', FALSE);

-- Q148
INSERT INTO question (id, content, category, bible_ref) VALUES (148, '耶穌與撒瑪利亞婦人談道是在哪個地區？', '聖經地理', '約翰福音 4:4-7');
INSERT INTO question_option (question_id, content, is_correct) VALUES (148, '猶太', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (148, '加利利', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (148, '比利亞', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (148, '撒瑪利亞', TRUE);

-- Q149
INSERT INTO question (id, content, category, bible_ref) VALUES (149, '亞伯拉罕在哪座山上獻以撒？', '聖經地理', '創世記 22:2');
INSERT INTO question_option (question_id, content, is_correct) VALUES (149, '西奈山', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (149, '摩利亞山', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (149, '橄欖山', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (149, '何烈山', FALSE);

-- Q150
INSERT INTO question (id, content, category, bible_ref) VALUES (150, '保羅在哪個城市的亞略巴古講道？', '聖經地理', '使徒行傳 17:22');
INSERT INTO question_option (question_id, content, is_correct) VALUES (150, '雅典', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (150, '羅馬', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (150, '哥林多', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (150, '以弗所', FALSE);

-- Q151
INSERT INTO question (id, content, category, bible_ref) VALUES (151, '約瑟被哥哥們賣到哪個國家？', '聖經地理', '創世記 37:28');
INSERT INTO question_option (question_id, content, is_correct) VALUES (151, '巴比倫', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (151, '亞述', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (151, '埃及', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (151, '波斯', FALSE);

-- Q152
INSERT INTO question (id, content, category, bible_ref) VALUES (152, '大衛在成為全以色列王之前，先在哪個城市作猶大王？', '聖經地理', '撒母耳記下 2:11');
INSERT INTO question_option (question_id, content, is_correct) VALUES (152, '伯利恆', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (152, '耶路撒冷', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (152, '示劍', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (152, '希伯崙', TRUE);

-- Q153
INSERT INTO question (id, content, category, bible_ref) VALUES (153, '猶大國被滅後，百姓被擄到哪裡？', '聖經地理', '列王紀下 25:11');
INSERT INTO question_option (question_id, content, is_correct) VALUES (153, '埃及', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (153, '巴比倫', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (153, '亞述', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (153, '波斯', FALSE);

-- Q154
INSERT INTO question (id, content, category, bible_ref) VALUES (154, '保羅寫「愛的真諦」（哥林多前書十三章）是寫給哪個城市的教會？', '聖經地理', '哥林多前書 1:2');
INSERT INTO question_option (question_id, content, is_correct) VALUES (154, '哥林多', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (154, '以弗所', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (154, '腓立比', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (154, '羅馬', FALSE);

-- Q155
INSERT INTO question (id, content, category, bible_ref) VALUES (155, '彼得看見大布異象時身在哪個城市？', '聖經地理', '使徒行傳 10:9-10');
INSERT INTO question_option (question_id, content, is_correct) VALUES (155, '耶路撒冷', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (155, '該撒利亞', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (155, '約帕', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (155, '安提阿', FALSE);

-- Q156
INSERT INTO question (id, content, category, bible_ref) VALUES (156, '以色列人過約旦河後，約書亞在哪裡立石為記並安營？', '聖經地理', '約書亞記 4:19-20');
INSERT INTO question_option (question_id, content, is_correct) VALUES (156, '耶利哥', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (156, '示劍', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (156, '示羅', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (156, '吉甲', TRUE);

-- Q157
INSERT INTO question (id, content, category, bible_ref) VALUES (157, '保羅被囚禁兩年等候審判的城市是？', '聖經地理', '使徒行傳 24:27');
INSERT INTO question_option (question_id, content, is_correct) VALUES (157, '耶路撒冷', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (157, '該撒利亞', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (157, '羅馬', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (157, '安提阿', FALSE);

-- Q158
INSERT INTO question (id, content, category, bible_ref) VALUES (158, '耶穌在哪個地方附近餵飽五千人？', '聖經地理', '路加福音 9:10-12');
INSERT INTO question_option (question_id, content, is_correct) VALUES (158, '伯賽大', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (158, '迦百農', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (158, '迦拿', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (158, '拿撒勒', FALSE);

-- Q159
INSERT INTO question (id, content, category, bible_ref) VALUES (159, '路得跟隨拿俄米回到哪個城市？', '聖經地理', '路得記 1:19');
INSERT INTO question_option (question_id, content, is_correct) VALUES (159, '耶路撒冷', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (159, '希伯崙', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (159, '伯利恆', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (159, '示劍', FALSE);

-- Q160
INSERT INTO question (id, content, category, bible_ref) VALUES (160, '啟示錄中七間教會位於哪個地區？', '聖經地理', '啟示錄 1:4');
INSERT INTO question_option (question_id, content, is_correct) VALUES (160, '馬其頓', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (160, '猶大', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (160, '埃及', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (160, '亞細亞', TRUE);

-- =============================================
-- 五、聖經物件（Q161-Q190，30 題）
-- =============================================

-- Q161
INSERT INTO question (id, content, category, bible_ref) VALUES (161, '上帝吩咐摩西製作什麼器具來安放十誡法版？', '聖經物件', '出埃及記 25:10-16');
INSERT INTO question_option (question_id, content, is_correct) VALUES (161, '金燈臺', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (161, '約櫃', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (161, '香壇', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (161, '陳設餅桌', FALSE);

-- Q162
INSERT INTO question (id, content, category, bible_ref) VALUES (162, '大衛用什麼武器擊殺歌利亞？', '聖經物件', '撒母耳記上 17:49-50');
INSERT INTO question_option (question_id, content, is_correct) VALUES (162, '機弦和石子', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (162, '弓箭', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (162, '長矛', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (162, '刀劍', FALSE);

-- Q163
INSERT INTO question (id, content, category, bible_ref) VALUES (163, '亞倫聖衣中，鑲有十二顆寶石代表十二支派的是哪件？', '聖經物件', '出埃及記 28:15-21');
INSERT INTO question_option (question_id, content, is_correct) VALUES (163, '以弗得', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (163, '冠冕', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (163, '胸牌', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (163, '外袍', FALSE);

-- Q164
INSERT INTO question (id, content, category, bible_ref) VALUES (164, '以色列人在曠野時，上帝從天降下什麼食物供應他們？', '聖經物件', '出埃及記 16:14-15');
INSERT INTO question_option (question_id, content, is_correct) VALUES (164, '無酵餅', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (164, '蜂蜜', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (164, '鵪鶉', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (164, '嗎哪', TRUE);

-- Q165
INSERT INTO question (id, content, category, bible_ref) VALUES (165, '猶大出賣耶穌所得的價錢是什麼？', '聖經物件', '馬太福音 26:15');
INSERT INTO question_option (question_id, content, is_correct) VALUES (165, '三十塊銀錢', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (165, '十塊金幣', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (165, '一百塊銀錢', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (165, '五十塊銀錢', FALSE);

-- Q166
INSERT INTO question (id, content, category, bible_ref) VALUES (166, '參孫用什麼武器擊殺了一千個非利士人？', '聖經物件', '士師記 15:15');
INSERT INTO question_option (question_id, content, is_correct) VALUES (166, '長矛', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (166, '驢腮骨', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (166, '機弦', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (166, '刀劍', FALSE);

-- Q167
INSERT INTO question (id, content, category, bible_ref) VALUES (167, '摩西在曠野中舉起什麼，讓被蛇咬的人看了就得活？', '聖經物件', '民數記 21:8-9');
INSERT INTO question_option (question_id, content, is_correct) VALUES (167, '金牛犢', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (167, '亞倫的杖', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (167, '銅蛇', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (167, '約櫃', FALSE);

-- Q168
INSERT INTO question (id, content, category, bible_ref) VALUES (168, '挪亞方舟是用什麼木材建造的？', '聖經物件', '創世記 6:14');
INSERT INTO question_option (question_id, content, is_correct) VALUES (168, '橄欖木', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (168, '香柏木', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (168, '皂莢木', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (168, '歌斐木', TRUE);

-- Q169
INSERT INTO question (id, content, category, bible_ref) VALUES (169, '以色列人繞耶利哥城時祭司吹的是什麼？', '聖經物件', '約書亞記 6:4');
INSERT INTO question_option (question_id, content, is_correct) VALUES (169, '羊角', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (169, '銀號', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (169, '琴', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (169, '鈸', FALSE);

-- Q170
INSERT INTO question (id, content, category, bible_ref) VALUES (170, '雅各送給約瑟的那件特別衣服是什麼？', '聖經物件', '創世記 37:3');
INSERT INTO question_option (question_id, content, is_correct) VALUES (170, '細麻衣', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (170, '彩衣', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (170, '羊皮衣', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (170, '祭司袍', FALSE);

-- Q171
INSERT INTO question (id, content, category, bible_ref) VALUES (171, '以色列人在曠野中造了什麼偶像來拜？', '聖經物件', '出埃及記 32:4');
INSERT INTO question_option (question_id, content, is_correct) VALUES (171, '銀像', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (171, '石柱', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (171, '金牛犢', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (171, '銅像', FALSE);

-- Q172
INSERT INTO question (id, content, category, bible_ref) VALUES (172, '上帝把十誡刻在什麼上面交給摩西？', '聖經物件', '出埃及記 31:18');
INSERT INTO question_option (question_id, content, is_correct) VALUES (172, '羊皮卷', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (172, '蒲草紙', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (172, '木板', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (172, '石版', TRUE);

-- Q173
INSERT INTO question (id, content, category, bible_ref) VALUES (173, '基甸用什麼物品放在禾場上來試驗上帝的旨意？', '聖經物件', '士師記 6:37');
INSERT INTO question_option (question_id, content, is_correct) VALUES (173, '羊毛', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (173, '細麻布', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (173, '祭壇石', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (173, '木柴', FALSE);

-- Q174
INSERT INTO question (id, content, category, bible_ref) VALUES (174, '逾越節時以色列人要把羊血塗在什麼上面？', '聖經物件', '出埃及記 12:7');
INSERT INTO question_option (question_id, content, is_correct) VALUES (174, '祭壇', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (174, '門框和門楣', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (174, '約櫃', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (174, '窗戶', FALSE);

-- Q175
INSERT INTO question (id, content, category, bible_ref) VALUES (175, '耶穌被釘十字架時，兵丁在他頭上戴了什麼？', '聖經物件', '馬太福音 27:29');
INSERT INTO question_option (question_id, content, is_correct) VALUES (175, '金冠', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (175, '銀冠', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (175, '荊棘冠冕', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (175, '橄欖冠', FALSE);

-- Q176
INSERT INTO question (id, content, category, bible_ref) VALUES (176, '以利沙叫貧窮寡婦倒滿所有器皿的是什麼？', '聖經物件', '列王紀下 4:1-7');
INSERT INTO question_option (question_id, content, is_correct) VALUES (176, '水', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (176, '麵粉', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (176, '蜂蜜', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (176, '油', TRUE);

-- Q177
INSERT INTO question (id, content, category, bible_ref) VALUES (177, '所羅門聖殿正面立了兩根銅柱，右邊那根叫什麼名字？', '聖經物件', '列王紀上 7:21');
INSERT INTO question_option (question_id, content, is_correct) VALUES (177, '雅斤', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (177, '波阿斯', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (177, '基路伯', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (177, '施恩座', FALSE);

-- Q178
INSERT INTO question (id, content, category, bible_ref) VALUES (178, '東方博士獻給嬰孩耶穌的禮物中，不包含以下哪一項？', '聖經物件', '馬太福音 2:11');
INSERT INTO question_option (question_id, content, is_correct) VALUES (178, '黃金', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (178, '銀子', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (178, '乳香', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (178, '沒藥', FALSE);

-- Q179
INSERT INTO question (id, content, category, bible_ref) VALUES (179, '會幕中用來燒香的器具叫什麼？', '聖經物件', '出埃及記 30:1-10');
INSERT INTO question_option (question_id, content, is_correct) VALUES (179, '洗濯盆', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (179, '陳設餅桌', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (179, '香壇', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (179, '燔祭壇', FALSE);

-- Q180
INSERT INTO question (id, content, category, bible_ref) VALUES (180, '大祭司一年一次進入至聖所時要穿什麼衣服？', '聖經物件', '利未記 16:4');
INSERT INTO question_option (question_id, content, is_correct) VALUES (180, '紫色袍', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (180, '彩衣', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (180, '駱駝毛衣', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (180, '細麻布聖服', TRUE);

-- Q181
INSERT INTO question (id, content, category, bible_ref) VALUES (181, '摩西在何烈山擊打什麼使水流出來給百姓喝？', '聖經物件', '出埃及記 17:6');
INSERT INTO question_option (question_id, content, is_correct) VALUES (181, '磐石', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (181, '大樹', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (181, '祭壇', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (181, '銅柱', FALSE);

-- Q182
INSERT INTO question (id, content, category, bible_ref) VALUES (182, '會幕中放有十二個餅的桌子叫什麼？', '聖經物件', '出埃及記 25:23-30');
INSERT INTO question_option (question_id, content, is_correct) VALUES (182, '香壇', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (182, '陳設餅桌', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (182, '燔祭壇', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (182, '洗濯盆', FALSE);

-- Q183
INSERT INTO question (id, content, category, bible_ref) VALUES (183, '路得在波阿斯田裡拾取的是什麼？', '聖經物件', '路得記 2:2-3');
INSERT INTO question_option (question_id, content, is_correct) VALUES (183, '葡萄', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (183, '橄欖', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (183, '麥穗', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (183, '無花果', FALSE);

-- Q184
INSERT INTO question (id, content, category, bible_ref) VALUES (184, '以利亞在基立溪旁時，烏鴉叼來什麼食物給他？', '聖經物件', '列王紀上 17:6');
INSERT INTO question_option (question_id, content, is_correct) VALUES (184, '嗎哪', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (184, '果子', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (184, '無酵餅', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (184, '餅和肉', TRUE);

-- Q185
INSERT INTO question (id, content, category, bible_ref) VALUES (185, '摩西在燃燒的荊棘前被上帝要求脫掉什麼？', '聖經物件', '出埃及記 3:5');
INSERT INTO question_option (question_id, content, is_correct) VALUES (185, '鞋', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (185, '外袍', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (185, '帽子', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (185, '腰帶', FALSE);

-- Q186
INSERT INTO question (id, content, category, bible_ref) VALUES (186, '有一個女人打破什麼瓶子把香膏澆在耶穌頭上？', '聖經物件', '馬可福音 14:3');
INSERT INTO question_option (question_id, content, is_correct) VALUES (186, '陶瓶', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (186, '玉瓶', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (186, '銅瓶', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (186, '銀瓶', FALSE);

-- Q187
INSERT INTO question (id, content, category, bible_ref) VALUES (187, '掃羅王違背上帝命令，留下了亞瑪力人最好的什麼？', '聖經物件', '撒母耳記上 15:9');
INSERT INTO question_option (question_id, content, is_correct) VALUES (187, '金銀', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (187, '田地', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (187, '牛羊', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (187, '衣物', FALSE);

-- Q188
INSERT INTO question (id, content, category, bible_ref) VALUES (188, '上帝用什麼作為與挪亞立約的記號？', '聖經物件', '創世記 9:13');
INSERT INTO question_option (question_id, content, is_correct) VALUES (188, '星星', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (188, '火柱', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (188, '橄欖枝', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (188, '虹', TRUE);

-- Q189
INSERT INTO question (id, content, category, bible_ref) VALUES (189, '撒母耳用什麼膏立掃羅為王？', '聖經物件', '撒母耳記上 10:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (189, '膏油', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (189, '水', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (189, '酒', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (189, '血', FALSE);

-- Q190
INSERT INTO question (id, content, category, bible_ref) VALUES (190, '所羅門建聖殿時主要使用的珍貴木材是什麼？', '聖經物件', '列王紀上 5:6');
INSERT INTO question_option (question_id, content, is_correct) VALUES (190, '歌斐木', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (190, '香柏木', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (190, '皂莢木', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (190, '橄欖木', FALSE);

-- =============================================
-- 六、聖經經文（Q191-Q230，40 題）
-- =============================================

-- Q191
INSERT INTO question (id, content, category, bible_ref) VALUES (191, '以下哪句經文出自詩篇二十三篇？', '聖經經文', '詩篇 23:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (191, '耶和華是我的牧者，我必不致缺乏', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (191, '你們要嘗嘗主恩的滋味，便知道他是美善', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (191, '耶和華靠近傷心的人，拯救靈性痛悔的人', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (191, '你的話是我腳前的燈，是我路上的光', FALSE);

-- Q192
INSERT INTO question (id, content, category, bible_ref) VALUES (192, '約翰福音三章十六節的內容是以下哪句？', '聖經經文', '約翰福音 3:16');
INSERT INTO question_option (question_id, content, is_correct) VALUES (192, '太初有道，道與神同在，道就是神', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (192, '神愛世人，甚至將他的獨生子賜給他們', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (192, '我就是道路、真理、生命', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (192, '神就是愛', FALSE);

-- Q193
INSERT INTO question (id, content, category, bible_ref) VALUES (193, '以下哪句是聖經的第一節經文？', '聖經經文', '創世記 1:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (193, '太初有道，道與神同在，道就是神', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (193, '耶和華是我的牧者，我必不致缺乏', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (193, '起初，神創造天地', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (193, '神就是光，在他毫無黑暗', FALSE);

-- Q194
INSERT INTO question (id, content, category, bible_ref) VALUES (194, '耶穌說「我就是道路、真理、生命」，下一句是什麼？', '聖經經文', '約翰福音 14:6');
INSERT INTO question_option (question_id, content, is_correct) VALUES (194, '你們必曉得真理，真理必叫你們得以自由', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (194, '凡勞苦擔重擔的人可以到我這裡來', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (194, '我是好牧人，好牧人為羊捨命', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (194, '若不藉著我，沒有人能到父那裡去', TRUE);

-- Q195
INSERT INTO question (id, content, category, bible_ref) VALUES (195, '以下哪句是十誡的第一條誡命？', '聖經經文', '出埃及記 20:3');
INSERT INTO question_option (question_id, content, is_correct) VALUES (195, '除了我以外，你不可有別的神', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (195, '不可殺人', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (195, '不可偷盜', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (195, '當孝敬父母', FALSE);

-- Q196
INSERT INTO question (id, content, category, bible_ref) VALUES (196, '以下哪句經文出自馬太福音的登山寶訓？', '聖經經文', '馬太福音 5:13');
INSERT INTO question_option (question_id, content, is_correct) VALUES (196, '信是所望之事的實底', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (196, '你們是世上的鹽', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (196, '應當一無掛慮', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (196, '忘記背後，努力面前', FALSE);

-- Q197
INSERT INTO question (id, content, category, bible_ref) VALUES (197, '以下哪句是保羅在哥林多前書「愛的真諦」中寫的？', '聖經經文', '哥林多前書 13:4');
INSERT INTO question_option (question_id, content, is_correct) VALUES (197, '神就是愛', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (197, '我們愛，因為神先愛我們', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (197, '愛是恆久忍耐，又有恩慈', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (197, '你要盡心、盡性、盡意愛主你的神', FALSE);

-- Q198
INSERT INTO question (id, content, category, bible_ref) VALUES (198, '以下哪句經文出自箴言？', '聖經經文', '箴言 9:10');
INSERT INTO question_option (question_id, content, is_correct) VALUES (198, '日光之下並無新事', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (198, '耶和華是我的牧者', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (198, '你們要嘗嘗主恩的滋味', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (198, '敬畏耶和華是智慧的開端', TRUE);

-- Q199
INSERT INTO question (id, content, category, bible_ref) VALUES (199, '以下哪句是耶穌在最後晚餐中擘餅時說的？', '聖經經文', '路加福音 22:19');
INSERT INTO question_option (question_id, content, is_correct) VALUES (199, '這是我的身體，為你們捨的', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (199, '我就是生命的糧', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (199, '我是好牧人', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (199, '我是葡萄樹，你們是枝子', FALSE);

-- Q200
INSERT INTO question (id, content, category, bible_ref) VALUES (200, '以下哪句經文出自腓立比書？', '聖經經文', '腓立比書 4:13');
INSERT INTO question_option (question_id, content, is_correct) VALUES (200, '萬事都互相效力，叫愛神的人得益處', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (200, '我靠著那加給我力量的，凡事都能做', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (200, '如今常存的有信、有望、有愛', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (200, '你們得救是本乎恩，也因著信', FALSE);

-- Q201
INSERT INTO question (id, content, category, bible_ref) VALUES (201, '以下哪句是耶穌呼召彼得時說的話？', '聖經經文', '馬太福音 4:19');
INSERT INTO question_option (question_id, content, is_correct) VALUES (201, '你跟從我吧', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (201, '你們來看', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (201, '來跟從我，我要叫你們得人如得魚一樣', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (201, '起來，拿你的褥子走吧', FALSE);

-- Q202
INSERT INTO question (id, content, category, bible_ref) VALUES (202, '以下哪句是啟示錄中的經文？', '聖經經文', '啟示錄 21:5');
INSERT INTO question_option (question_id, content, is_correct) VALUES (202, '日光之下並無新事', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (202, '太初有道，道與神同在', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (202, '萬事都互相效力', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (202, '看哪，我將一切都更新了', TRUE);

-- Q203
INSERT INTO question (id, content, category, bible_ref) VALUES (203, '以下哪句經文出自詩篇一一九篇？', '聖經經文', '詩篇 119:105');
INSERT INTO question_option (question_id, content, is_correct) VALUES (203, '你的話是我腳前的燈，是我路上的光', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (203, '耶和華是我的牧者，我必不致缺乏', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (203, '神是我們的避難所，是我們的力量', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (203, '諸天述說神的榮耀', FALSE);

-- Q204
INSERT INTO question (id, content, category, bible_ref) VALUES (204, '以下哪句是主禱文的開頭？', '聖經經文', '馬太福音 6:9');
INSERT INTO question_option (question_id, content, is_correct) VALUES (204, '耶和華是我的牧者', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (204, '我們在天上的父，願人都尊你的名為聖', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (204, '神愛世人，甚至將他的獨生子賜給他們', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (204, '我要向山舉目', FALSE);

-- Q205
INSERT INTO question (id, content, category, bible_ref) VALUES (205, '以下哪句經文出自傳道書？', '聖經經文', '傳道書 1:2');
INSERT INTO question_option (question_id, content, is_correct) VALUES (205, '敬畏耶和華是智慧的開端', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (205, '耶和華是我的亮光，是我的拯救', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (205, '虛空的虛空，凡事都是虛空', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (205, '天地要廢去，我的話卻不能廢去', FALSE);

-- Q206
INSERT INTO question (id, content, category, bible_ref) VALUES (206, '以下哪句經文出自羅馬書？', '聖經經文', '羅馬書 8:28');
INSERT INTO question_option (question_id, content, is_correct) VALUES (206, '我靠著那加給我力量的，凡事都能做', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (206, '你們得救是本乎恩', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (206, '愛是恆久忍耐，又有恩慈', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (206, '萬事都互相效力，叫愛神的人得益處', TRUE);

-- Q207
INSERT INTO question (id, content, category, bible_ref) VALUES (207, '以下哪句是耶穌在曠野受試探時引用的經文？', '聖經經文', '馬太福音 4:4');
INSERT INTO question_option (question_id, content, is_correct) VALUES (207, '人活著不是單靠食物，乃是靠神口裡所出的一切話', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (207, '你們要先求他的國和他的義', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (207, '凡勞苦擔重擔的人可以到我這裡來', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (207, '你們是世上的光', FALSE);

-- Q208
INSERT INTO question (id, content, category, bible_ref) VALUES (208, '以下哪句是耶穌頒布的大使命？', '聖經經文', '馬太福音 28:19');
INSERT INTO question_option (question_id, content, is_correct) VALUES (208, '你們要彼此相愛', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (208, '你們要去，使萬民作我的門徒', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (208, '你們是世上的鹽', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (208, '你們要常在我裡面', FALSE);

-- Q209
INSERT INTO question (id, content, category, bible_ref) VALUES (209, '以下哪句經文出自以賽亞書？', '聖經經文', '以賽亞書 53:5');
INSERT INTO question_option (question_id, content, is_correct) VALUES (209, '耶和華是我的牧者', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (209, '敬畏耶和華是智慧的開端', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (209, '他為我們的過犯受害，為我們的罪孽壓傷', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (209, '神愛世人，甚至將他的獨生子賜給他們', FALSE);

-- Q210
INSERT INTO question (id, content, category, bible_ref) VALUES (210, '以下哪句經文出自約翰一書？', '聖經經文', '約翰一書 4:8');
INSERT INTO question_option (question_id, content, is_correct) VALUES (210, '太初有道，道與神同在', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (210, '我是好牧人，好牧人為羊捨命', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (210, '你們必曉得真理，真理必叫你們得以自由', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (210, '神就是愛', TRUE);

-- Q211
INSERT INTO question (id, content, category, bible_ref) VALUES (211, '以下哪句經文出自創世記？', '聖經經文', '創世記 2:18');
INSERT INTO question_option (question_id, content, is_correct) VALUES (211, '那人獨居不好，我要為他造一個配偶幫助他', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (211, '你們要聖潔，因為我是聖潔的', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (211, '以色列啊，你要聽', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (211, '你出你入，耶和華都保護你', FALSE);

-- Q212
INSERT INTO question (id, content, category, bible_ref) VALUES (212, '以下哪句經文出自帖撒羅尼迦前書？', '聖經經文', '帖撒羅尼迦前書 5:16-18');
INSERT INTO question_option (question_id, content, is_correct) VALUES (212, '你們得救是本乎恩', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (212, '要常常喜樂，不住地禱告，凡事謝恩', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (212, '我靠著那加給我力量的，凡事都能做', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (212, '愛是恆久忍耐，又有恩慈', FALSE);

-- Q213
INSERT INTO question (id, content, category, bible_ref) VALUES (213, '以下哪句是耶穌復活後對門徒說的差遣之語？', '聖經經文', '約翰福音 20:21');
INSERT INTO question_option (question_id, content, is_correct) VALUES (213, '你們要彼此相愛', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (213, '你們要常在我裡面', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (213, '父怎樣差遣了我，我也照樣差遣你們', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (213, '你們是世上的鹽', FALSE);

-- Q214
INSERT INTO question (id, content, category, bible_ref) VALUES (214, '以下哪句經文出自希伯來書？', '聖經經文', '希伯來書 11:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (214, '萬事都互相效力', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (214, '要常常喜樂', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (214, '如今常存的有信、有望、有愛', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (214, '信就是所望之事的實底，是未見之事的確據', TRUE);

-- Q215
INSERT INTO question (id, content, category, bible_ref) VALUES (215, '以下哪句經文記載了神對亞伯拉罕的應許？', '聖經經文', '創世記 12:2');
INSERT INTO question_option (question_id, content, is_correct) VALUES (215, '我必叫你成為大國，我必賜福給你', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (215, '我是耶和華你的神', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (215, '耶和華是我的牧者', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (215, '敬畏耶和華是知識的開端', FALSE);

-- Q216
INSERT INTO question (id, content, category, bible_ref) VALUES (216, '以下哪句經文出自以弗所書？', '聖經經文', '以弗所書 2:8');
INSERT INTO question_option (question_id, content, is_correct) VALUES (216, '萬事都互相效力', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (216, '你們得救是本乎恩，也因著信', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (216, '我靠著那加給我力量的，凡事都能做', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (216, '愛是恆久忍耐，又有恩慈', FALSE);

-- Q217
INSERT INTO question (id, content, category, bible_ref) VALUES (217, '以下哪句是耶穌對疲乏之人的邀請？', '聖經經文', '馬太福音 11:28');
INSERT INTO question_option (question_id, content, is_correct) VALUES (217, '你們要先求他的國和他的義', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (217, '你跟從我吧', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (217, '凡勞苦擔重擔的人可以到我這裡來，我就使你們得安息', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (217, '你們是世上的光', FALSE);

-- Q218
INSERT INTO question (id, content, category, bible_ref) VALUES (218, '以下哪句經文出自約翰福音第一章？', '聖經經文', '約翰福音 1:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (218, '神愛世人，甚至將他的獨生子賜給他們', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (218, '我就是道路、真理、生命', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (218, '你們必曉得真理，真理必叫你們得以自由', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (218, '太初有道，道與神同在，道就是神', TRUE);

-- Q219
INSERT INTO question (id, content, category, bible_ref) VALUES (219, '以下哪句經文出自雅各書？', '聖經經文', '雅各書 2:26');
INSERT INTO question_option (question_id, content, is_correct) VALUES (219, '信心沒有行為是死的', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (219, '如今常存的有信、有望、有愛', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (219, '信就是所望之事的實底', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (219, '你們得救是本乎恩', FALSE);

-- Q220
INSERT INTO question (id, content, category, bible_ref) VALUES (220, '以下哪句經文出自約書亞記？', '聖經經文', '約書亞記 1:9');
INSERT INTO question_option (question_id, content, is_correct) VALUES (220, '耶和華是我的牧者', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (220, '你當剛強壯膽，不要懼怕，也不要驚惶', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (220, '以色列啊，你要聽', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (220, '敬畏耶和華是智慧的開端', FALSE);

-- Q221
INSERT INTO question (id, content, category, bible_ref) VALUES (221, '以下哪句是耶穌在約翰福音中的「我是」宣告之一？', '聖經經文', '約翰福音 15:5');
INSERT INTO question_option (question_id, content, is_correct) VALUES (221, '你們要彼此相愛', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (221, '父怎樣差遣了我，我也照樣差遣你們', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (221, '我是葡萄樹，你們是枝子', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (221, '你們必曉得真理', FALSE);

-- Q222
INSERT INTO question (id, content, category, bible_ref) VALUES (222, '以下哪句經文出自彼得前書？', '聖經經文', '彼得前書 5:7');
INSERT INTO question_option (question_id, content, is_correct) VALUES (222, '萬事都互相效力', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (222, '愛是恆久忍耐，又有恩慈', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (222, '信心沒有行為是死的', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (222, '你們要將一切的憂慮卸給神，因為他顧念你們', TRUE);

-- Q223
INSERT INTO question (id, content, category, bible_ref) VALUES (223, '以下哪句經文出自加拉太書？', '聖經經文', '加拉太書 5:22');
INSERT INTO question_option (question_id, content, is_correct) VALUES (223, '聖靈所結的果子就是仁愛、喜樂、和平', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (223, '你們得救是本乎恩', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (223, '要常常喜樂，不住地禱告', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (223, '如今常存的有信、有望、有愛', FALSE);

-- Q224
INSERT INTO question (id, content, category, bible_ref) VALUES (224, '以下哪句是詩篇四十六篇的經文？', '聖經經文', '詩篇 46:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (224, '耶和華是我的牧者，我必不致缺乏', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (224, '神是我們的避難所，是我們的力量', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (224, '你的話是我腳前的燈，是我路上的光', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (224, '諸天述說神的榮耀', FALSE);

-- Q225
INSERT INTO question (id, content, category, bible_ref) VALUES (225, '以下哪句經文常被引用來鼓勵信徒不要憂慮？', '聖經經文', '馬太福音 6:33');
INSERT INTO question_option (question_id, content, is_correct) VALUES (225, '信就是所望之事的實底', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (225, '萬事都互相效力', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (225, '你們要先求他的國和他的義，這些東西都要加給你們了', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (225, '忘記背後，努力面前的', FALSE);

-- Q226
INSERT INTO question (id, content, category, bible_ref) VALUES (226, '以下哪句經文出自歌羅西書？', '聖經經文', '歌羅西書 3:23');
INSERT INTO question_option (question_id, content, is_correct) VALUES (226, '愛是恆久忍耐，又有恩慈', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (226, '要常常喜樂，不住地禱告', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (226, '我靠著那加給我力量的，凡事都能做', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (226, '無論做什麼，都要從心裡做，像是給主做的', TRUE);

-- Q227
INSERT INTO question (id, content, category, bible_ref) VALUES (227, '以下哪句是耶穌登山寶訓中的八福之一？', '聖經經文', '馬太福音 5:3');
INSERT INTO question_option (question_id, content, is_correct) VALUES (227, '虛心的人有福了，因為天國是他們的', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (227, '你們是世上的鹽', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (227, '不要論斷人，免得你們被論斷', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (227, '你們要先求他的國和他的義', FALSE);

-- Q228
INSERT INTO question (id, content, category, bible_ref) VALUES (228, '以下哪句經文出自歷代志下？', '聖經經文', '歷代志下 7:14');
INSERT INTO question_option (question_id, content, is_correct) VALUES (228, '耶和華是我的牧者', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (228, '這稱為我名下的子民，若是自卑、禱告，尋求我的面，轉離他們的惡行，我必從天上垂聽', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (228, '以色列啊，你要聽', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (228, '你當剛強壯膽', FALSE);

-- Q229
INSERT INTO question (id, content, category, bible_ref) VALUES (229, '以下哪句經文出自耶利米書？', '聖經經文', '耶利米書 29:11');
INSERT INTO question_option (question_id, content, is_correct) VALUES (229, '他為我們的過犯受害，為我們的罪孽壓傷', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (229, '看哪，我將一切都更新了', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (229, '我知道我向你們所懷的意念是賜平安的意念，不是降災禍的意念', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (229, '起初，神創造天地', FALSE);

-- Q230
INSERT INTO question (id, content, category, bible_ref) VALUES (230, '以下哪句經文出自提摩太後書？', '聖經經文', '提摩太後書 3:16');
INSERT INTO question_option (question_id, content, is_correct) VALUES (230, '信心沒有行為是死的', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (230, '你們得救是本乎恩', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (230, '聖靈所結的果子就是仁愛、喜樂、和平', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (230, '聖經都是神所默示的，於教訓、督責、使人歸正、教導人學義都是有益的', TRUE);

-- =============================================
-- 七、聖經數字（Q231-Q260，30 題）
-- =============================================

-- Q231
INSERT INTO question (id, content, category, bible_ref) VALUES (231, '耶穌揀選了多少位使徒？', '聖經數字', '馬太福音 10:1-4');
INSERT INTO question_option (question_id, content, is_correct) VALUES (231, '十二位', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (231, '七位', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (231, '十位', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (231, '七十位', FALSE);

-- Q232
INSERT INTO question (id, content, category, bible_ref) VALUES (232, '雅各有幾個兒子，成為以色列十二支派的祖先？', '聖經數字', '創世記 35:22-26');
INSERT INTO question_option (question_id, content, is_correct) VALUES (232, '十個', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (232, '十二個', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (232, '十四個', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (232, '十六個', FALSE);

-- Q233
INSERT INTO question (id, content, category, bible_ref) VALUES (233, '耶穌餵飽五千人後，門徒收回了多少籃零碎？', '聖經數字', '馬太福音 14:20');
INSERT INTO question_option (question_id, content, is_correct) VALUES (233, '五籃', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (233, '七籃', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (233, '十二籃', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (233, '二十籃', FALSE);

-- Q234
INSERT INTO question (id, content, category, bible_ref) VALUES (234, '出埃及記中，上帝降給埃及的災禍共有多少個？', '聖經數字', '出埃及記 7:14-12:30');
INSERT INTO question_option (question_id, content, is_correct) VALUES (234, '五個', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (234, '七個', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (234, '九個', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (234, '十個', TRUE);

-- Q235
INSERT INTO question (id, content, category, bible_ref) VALUES (235, '挪亞帶進方舟的潔淨動物是每種幾對？', '聖經數字', '創世記 7:2');
INSERT INTO question_option (question_id, content, is_correct) VALUES (235, '七對', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (235, '一對', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (235, '兩對', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (235, '三對', FALSE);

-- Q236
INSERT INTO question (id, content, category, bible_ref) VALUES (236, '摩西差派幾個探子去窺探迦南地？', '聖經數字', '民數記 13:1-16');
INSERT INTO question_option (question_id, content, is_correct) VALUES (236, '十個', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (236, '十二個', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (236, '二十個', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (236, '七個', FALSE);

-- Q237
INSERT INTO question (id, content, category, bible_ref) VALUES (237, '耶穌在曠野受了幾次試探？', '聖經數字', '馬太福音 4:1-11');
INSERT INTO question_option (question_id, content, is_correct) VALUES (237, '一次', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (237, '兩次', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (237, '三次', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (237, '七次', FALSE);

-- Q238
INSERT INTO question (id, content, category, bible_ref) VALUES (238, '啟示錄中共有幾個封印？', '聖經數字', '啟示錄 6:1-8:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (238, '三個', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (238, '五個', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (238, '六個', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (238, '七個', TRUE);

-- Q239
INSERT INTO question (id, content, category, bible_ref) VALUES (239, '大衛用幾塊石子擊倒歌利亞？', '聖經數字', '撒母耳記上 17:49');
INSERT INTO question_option (question_id, content, is_correct) VALUES (239, '一塊', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (239, '三塊', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (239, '五塊', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (239, '七塊', FALSE);

-- Q240
INSERT INTO question (id, content, category, bible_ref) VALUES (240, '耶穌復活後在提比哩亞海邊顯現，門徒網了多少條魚？', '聖經數字', '約翰福音 21:11');
INSERT INTO question_option (question_id, content, is_correct) VALUES (240, '一百條', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (240, '一百五十三條', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (240, '二百條', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (240, '三百條', FALSE);

-- Q241
INSERT INTO question (id, content, category, bible_ref) VALUES (241, '基甸最後帶多少人去攻打米甸人？', '聖經數字', '士師記 7:7');
INSERT INTO question_option (question_id, content, is_correct) VALUES (241, '一百人', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (241, '兩百人', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (241, '三百人', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (241, '一千人', FALSE);

-- Q242
INSERT INTO question (id, content, category, bible_ref) VALUES (242, '耶穌餵飽四千人後，門徒收回了多少筐零碎？', '聖經數字', '馬太福音 15:37');
INSERT INTO question_option (question_id, content, is_correct) VALUES (242, '三筐', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (242, '五筐', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (242, '十二筐', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (242, '七筐', TRUE);

-- Q243
INSERT INTO question (id, content, category, bible_ref) VALUES (243, '彼得問耶穌「我當饒恕弟兄幾次」，彼得自己提出的次數是？', '聖經數字', '馬太福音 18:21');
INSERT INTO question_option (question_id, content, is_correct) VALUES (243, '七次', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (243, '三次', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (243, '十次', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (243, '四十九次', FALSE);

-- Q244
INSERT INTO question (id, content, category, bible_ref) VALUES (244, '以色列人繞耶利哥城的最後一天，繞了幾圈？', '聖經數字', '約書亞記 6:15');
INSERT INTO question_option (question_id, content, is_correct) VALUES (244, '一圈', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (244, '七圈', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (244, '三圈', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (244, '十三圈', FALSE);

-- Q245
INSERT INTO question (id, content, category, bible_ref) VALUES (245, '以利沙叫乃縵在約旦河裡沐浴幾次才得潔淨？', '聖經數字', '列王紀下 5:10');
INSERT INTO question_option (question_id, content, is_correct) VALUES (245, '一次', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (245, '三次', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (245, '七次', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (245, '十次', FALSE);

-- Q246
INSERT INTO question (id, content, category, bible_ref) VALUES (246, '啟示錄中共有幾支號角？', '聖經數字', '啟示錄 8:2');
INSERT INTO question_option (question_id, content, is_correct) VALUES (246, '三支', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (246, '五支', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (246, '六支', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (246, '七支', TRUE);

-- Q247
INSERT INTO question (id, content, category, bible_ref) VALUES (247, '五旬節那天彼得講道後，約有多少人信主受洗？', '聖經數字', '使徒行傳 2:41');
INSERT INTO question_option (question_id, content, is_correct) VALUES (247, '三千人', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (247, '一千人', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (247, '五千人', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (247, '一萬人', FALSE);

-- Q248
INSERT INTO question (id, content, category, bible_ref) VALUES (248, '撒迦利亞書預言彌賽亞被賣的價錢是多少？', '聖經數字', '撒迦利亞書 11:12-13');
INSERT INTO question_option (question_id, content, is_correct) VALUES (248, '二十塊銀子', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (248, '三十塊銀子', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (248, '四十塊銀子', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (248, '五十塊銀子', FALSE);

-- Q249
INSERT INTO question (id, content, category, bible_ref) VALUES (249, '約瑟的夢中，有幾捆禾稼向他的那捆下拜？', '聖經數字', '創世記 37:7');
INSERT INTO question_option (question_id, content, is_correct) VALUES (249, '五捆', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (249, '七捆', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (249, '十一捆', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (249, '十二捆', FALSE);

-- Q250
INSERT INTO question (id, content, category, bible_ref) VALUES (250, '啟示錄中寫信給幾間教會？', '聖經數字', '啟示錄 1:4');
INSERT INTO question_option (question_id, content, is_correct) VALUES (250, '三間', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (250, '五間', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (250, '六間', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (250, '七間', TRUE);

-- Q251
INSERT INTO question (id, content, category, bible_ref) VALUES (251, '耶穌在五餅二魚的神蹟中，餵飽了約多少男人（不含婦女和孩子）？', '聖經數字', '馬太福音 14:21');
INSERT INTO question_option (question_id, content, is_correct) VALUES (251, '五千人', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (251, '三千人', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (251, '四千人', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (251, '一萬人', FALSE);

-- Q252
INSERT INTO question (id, content, category, bible_ref) VALUES (252, '挪亞帶進方舟的不潔淨動物是每種幾對？', '聖經數字', '創世記 7:2');
INSERT INTO question_option (question_id, content, is_correct) VALUES (252, '七對', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (252, '一對', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (252, '三對', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (252, '五對', FALSE);

-- Q253
INSERT INTO question (id, content, category, bible_ref) VALUES (253, '參孫給非利士人出謎語，約定答出來就給多少件衣裳？', '聖經數字', '士師記 14:12-13');
INSERT INTO question_option (question_id, content, is_correct) VALUES (253, '十件', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (253, '二十件', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (253, '三十件', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (253, '五十件', FALSE);

-- Q254
INSERT INTO question (id, content, category, bible_ref) VALUES (254, '約瑟被哥哥們賣給以實瑪利商人的價錢是多少？', '聖經數字', '創世記 37:28');
INSERT INTO question_option (question_id, content, is_correct) VALUES (254, '十塊銀子', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (254, '十五塊銀子', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (254, '二十五塊銀子', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (254, '二十塊銀子', TRUE);

-- Q255
INSERT INTO question (id, content, category, bible_ref) VALUES (255, '耶穌除了十二使徒外，另外還差遣了多少人出去傳道？', '聖經數字', '路加福音 10:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (255, '七十人', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (255, '三十人', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (255, '五十人', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (255, '一百人', FALSE);

-- Q256
INSERT INTO question (id, content, category, bible_ref) VALUES (256, '列王紀上記載，所羅門有多少位妃子？', '聖經數字', '列王紀上 11:3');
INSERT INTO question_option (question_id, content, is_correct) VALUES (256, '三百位', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (256, '七百位', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (256, '五百位', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (256, '一千位', FALSE);

-- Q257
INSERT INTO question (id, content, category, bible_ref) VALUES (257, '以利亞在迦密山上獻祭時，叫人倒了幾次水在柴和祭物上？', '聖經數字', '列王紀上 18:34');
INSERT INTO question_option (question_id, content, is_correct) VALUES (257, '一次', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (257, '兩次', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (257, '三次', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (257, '四次', FALSE);

-- Q258
INSERT INTO question (id, content, category, bible_ref) VALUES (258, '大衛與歌利亞對戰前，從溪中挑選了幾塊光滑石子？', '聖經數字', '撒母耳記上 17:40');
INSERT INTO question_option (question_id, content, is_correct) VALUES (258, '一塊', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (258, '三塊', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (258, '七塊', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (258, '五塊', TRUE);

-- Q259
INSERT INTO question (id, content, category, bible_ref) VALUES (259, '耶穌在提比哩亞海邊顯現時，在場的門徒有幾人？', '聖經數字', '約翰福音 21:2');
INSERT INTO question_option (question_id, content, is_correct) VALUES (259, '七人', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (259, '五人', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (259, '十人', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (259, '十二人', FALSE);

-- Q260
INSERT INTO question (id, content, category, bible_ref) VALUES (260, '利未記規定以色列人每逢第幾年要守安息年，讓地休息？', '聖經數字', '利未記 25:4');
INSERT INTO question_option (question_id, content, is_correct) VALUES (260, '第三年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (260, '第七年', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (260, '第十年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (260, '第十二年', FALSE);

-- =============================================
-- 八、聖經書卷（Q261-Q300，40 題）
-- =============================================

-- Q261
INSERT INTO question (id, content, category, bible_ref) VALUES (261, '「起初，神創造天地」是哪卷書的開頭？', '聖經書卷', '創世記 1:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (261, '創世記', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (261, '出埃及記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (261, '約翰福音', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (261, '詩篇', FALSE);

-- Q262
INSERT INTO question (id, content, category, bible_ref) VALUES (262, '十誡最早記載在哪卷書？', '聖經書卷', '出埃及記 20:1-17');
INSERT INTO question_option (question_id, content, is_correct) VALUES (262, '利未記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (262, '出埃及記', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (262, '民數記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (262, '申命記', FALSE);

-- Q263
INSERT INTO question (id, content, category, bible_ref) VALUES (263, '路得的故事記載在哪卷書？', '聖經書卷', '路得記 1:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (263, '撒母耳記上', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (263, '士師記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (263, '路得記', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (263, '以斯帖記', FALSE);

-- Q264
INSERT INTO question (id, content, category, bible_ref) VALUES (264, '約拿被大魚吞的故事記載在哪卷書？', '聖經書卷', '約拿書 1:17');
INSERT INTO question_option (question_id, content, is_correct) VALUES (264, '以賽亞書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (264, '耶利米書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (264, '以西結書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (264, '約拿書', TRUE);

-- Q265
INSERT INTO question (id, content, category, bible_ref) VALUES (265, '「耶和華是我的牧者，我必不致缺乏」出自哪卷書？', '聖經書卷', '詩篇 23:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (265, '詩篇', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (265, '箴言', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (265, '傳道書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (265, '以賽亞書', FALSE);

-- Q266
INSERT INTO question (id, content, category, bible_ref) VALUES (266, '但以理在獅子坑中的故事記載在哪卷書？', '聖經書卷', '但以理書 6:16-23');
INSERT INTO question_option (question_id, content, is_correct) VALUES (266, '以西結書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (266, '但以理書', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (266, '以賽亞書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (266, '耶利米書', FALSE);

-- Q267
INSERT INTO question (id, content, category, bible_ref) VALUES (267, '保羅歸主的故事記載在哪卷書？', '聖經書卷', '使徒行傳 9:1-19');
INSERT INTO question_option (question_id, content, is_correct) VALUES (267, '羅馬書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (267, '哥林多前書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (267, '使徒行傳', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (267, '加拉太書', FALSE);

-- Q268
INSERT INTO question (id, content, category, bible_ref) VALUES (268, '巴別塔的故事記載在哪卷書？', '聖經書卷', '創世記 11:1-9');
INSERT INTO question_option (question_id, content, is_correct) VALUES (268, '出埃及記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (268, '利未記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (268, '民數記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (268, '創世記', TRUE);

-- Q269
INSERT INTO question (id, content, category, bible_ref) VALUES (269, '「敬畏耶和華是智慧的開端」出自哪卷書？', '聖經書卷', '箴言 9:10');
INSERT INTO question_option (question_id, content, is_correct) VALUES (269, '箴言', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (269, '傳道書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (269, '詩篇', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (269, '約伯記', FALSE);

-- Q270
INSERT INTO question (id, content, category, bible_ref) VALUES (270, '以斯帖拯救猶太人的故事記載在哪卷書？', '聖經書卷', '以斯帖記 4:14');
INSERT INTO question_option (question_id, content, is_correct) VALUES (270, '路得記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (270, '以斯帖記', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (270, '尼希米記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (270, '以斯拉記', FALSE);

-- Q271
INSERT INTO question (id, content, category, bible_ref) VALUES (271, '耶穌的登山寶訓記載在哪卷書？', '聖經書卷', '馬太福音 5-7');
INSERT INTO question_option (question_id, content, is_correct) VALUES (271, '馬可福音', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (271, '路加福音', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (271, '馬太福音', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (271, '約翰福音', FALSE);

-- Q272
INSERT INTO question (id, content, category, bible_ref) VALUES (272, '「愛的真諦」（愛是恆久忍耐，又有恩慈…）出自哪卷書？', '聖經書卷', '哥林多前書 13:4-8');
INSERT INTO question_option (question_id, content, is_correct) VALUES (272, '羅馬書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (272, '以弗所書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (272, '加拉太書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (272, '哥林多前書', TRUE);

-- Q273
INSERT INTO question (id, content, category, bible_ref) VALUES (273, '大衛與歌利亞對戰的故事記載在哪卷書？', '聖經書卷', '撒母耳記上 17');
INSERT INTO question_option (question_id, content, is_correct) VALUES (273, '撒母耳記上', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (273, '撒母耳記下', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (273, '列王紀上', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (273, '歷代志上', FALSE);

-- Q274
INSERT INTO question (id, content, category, bible_ref) VALUES (274, '「日光之下並無新事」出自哪卷書？', '聖經書卷', '傳道書 1:9');
INSERT INTO question_option (question_id, content, is_correct) VALUES (274, '箴言', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (274, '傳道書', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (274, '詩篇', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (274, '約伯記', FALSE);

-- Q275
INSERT INTO question (id, content, category, bible_ref) VALUES (275, '五旬節聖靈降臨的事件記載在哪卷書？', '聖經書卷', '使徒行傳 2:1-4');
INSERT INTO question_option (question_id, content, is_correct) VALUES (275, '路加福音', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (275, '約翰福音', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (275, '使徒行傳', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (275, '啟示錄', FALSE);

-- Q276
INSERT INTO question (id, content, category, bible_ref) VALUES (276, '約伯受苦的故事記載在哪卷書？', '聖經書卷', '約伯記 1:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (276, '詩篇', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (276, '箴言', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (276, '傳道書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (276, '約伯記', TRUE);

-- Q277
INSERT INTO question (id, content, category, bible_ref) VALUES (277, '耶穌誕生的故事最詳細地記載在哪卷福音書？', '聖經書卷', '路加福音 2:1-20');
INSERT INTO question_option (question_id, content, is_correct) VALUES (277, '路加福音', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (277, '馬太福音', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (277, '馬可福音', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (277, '約翰福音', FALSE);

-- Q278
INSERT INTO question (id, content, category, bible_ref) VALUES (278, '重建耶路撒冷城牆的故事記載在哪卷書？', '聖經書卷', '尼希米記 2-6');
INSERT INTO question_option (question_id, content, is_correct) VALUES (278, '以斯拉記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (278, '尼希米記', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (278, '歷代志下', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (278, '耶利米書', FALSE);

-- Q279
INSERT INTO question (id, content, category, bible_ref) VALUES (279, '以利亞在迦密山上與巴力先知對決的故事記載在哪卷書？', '聖經書卷', '列王紀上 18:20-40');
INSERT INTO question_option (question_id, content, is_correct) VALUES (279, '撒母耳記上', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (279, '歷代志上', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (279, '列王紀上', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (279, '列王紀下', FALSE);

-- Q280
INSERT INTO question (id, content, category, bible_ref) VALUES (280, '「信就是所望之事的實底，是未見之事的確據」出自哪卷書？', '聖經書卷', '希伯來書 11:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (280, '羅馬書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (280, '雅各書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (280, '加拉太書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (280, '希伯來書', TRUE);

-- Q281
INSERT INTO question (id, content, category, bible_ref) VALUES (281, '挪亞方舟的故事記載在哪卷書？', '聖經書卷', '創世記 6-8');
INSERT INTO question_option (question_id, content, is_correct) VALUES (281, '創世記', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (281, '出埃及記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (281, '約伯記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (281, '詩篇', FALSE);

-- Q282
INSERT INTO question (id, content, category, bible_ref) VALUES (282, '耶利哥城牆倒塌的故事記載在哪卷書？', '聖經書卷', '約書亞記 6:20');
INSERT INTO question_option (question_id, content, is_correct) VALUES (282, '民數記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (282, '約書亞記', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (282, '士師記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (282, '申命記', FALSE);

-- Q283
INSERT INTO question (id, content, category, bible_ref) VALUES (283, '參孫的故事記載在哪卷書？', '聖經書卷', '士師記 13-16');
INSERT INTO question_option (question_id, content, is_correct) VALUES (283, '撒母耳記上', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (283, '路得記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (283, '士師記', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (283, '約書亞記', FALSE);

-- Q284
INSERT INTO question (id, content, category, bible_ref) VALUES (284, '「萬事都互相效力，叫愛神的人得益處」出自哪卷書？', '聖經書卷', '羅馬書 8:28');
INSERT INTO question_option (question_id, content, is_correct) VALUES (284, '哥林多前書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (284, '以弗所書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (284, '腓立比書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (284, '羅馬書', TRUE);

-- Q285
INSERT INTO question (id, content, category, bible_ref) VALUES (285, '聖經最後一卷書是哪卷？', '聖經書卷', '啟示錄 1:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (285, '啟示錄', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (285, '猶大書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (285, '約翰三書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (285, '希伯來書', FALSE);

-- Q286
INSERT INTO question (id, content, category, bible_ref) VALUES (286, '所羅門求智慧的故事記載在哪卷書？', '聖經書卷', '列王紀上 3:5-12');
INSERT INTO question_option (question_id, content, is_correct) VALUES (286, '歷代志上', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (286, '列王紀上', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (286, '箴言', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (286, '傳道書', FALSE);

-- Q287
INSERT INTO question (id, content, category, bible_ref) VALUES (287, '「你們得救是本乎恩，也因著信」出自哪卷書？', '聖經書卷', '以弗所書 2:8');
INSERT INTO question_option (question_id, content, is_correct) VALUES (287, '羅馬書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (287, '加拉太書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (287, '以弗所書', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (287, '腓立比書', FALSE);

-- Q288
INSERT INTO question (id, content, category, bible_ref) VALUES (288, '被擄歸回後重建聖殿的記載主要在哪卷書？', '聖經書卷', '以斯拉記 3:8-6:15');
INSERT INTO question_option (question_id, content, is_correct) VALUES (288, '尼希米記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (288, '歷代志下', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (288, '耶利米書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (288, '以斯拉記', TRUE);

-- Q289
INSERT INTO question (id, content, category, bible_ref) VALUES (289, '「太初有道，道與神同在」是哪卷書的開頭？', '聖經書卷', '約翰福音 1:1');
INSERT INTO question_option (question_id, content, is_correct) VALUES (289, '約翰福音', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (289, '馬太福音', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (289, '希伯來書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (289, '創世記', FALSE);

-- Q290
INSERT INTO question (id, content, category, bible_ref) VALUES (290, '基甸用三百人打敗米甸人的故事記載在哪卷書？', '聖經書卷', '士師記 7');
INSERT INTO question_option (question_id, content, is_correct) VALUES (290, '約書亞記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (290, '士師記', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (290, '撒母耳記上', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (290, '民數記', FALSE);

-- Q291
INSERT INTO question (id, content, category, bible_ref) VALUES (291, '「要常常喜樂，不住地禱告，凡事謝恩」出自哪卷書？', '聖經書卷', '帖撒羅尼迦前書 5:16-18');
INSERT INTO question_option (question_id, content, is_correct) VALUES (291, '腓立比書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (291, '以弗所書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (291, '帖撒羅尼迦前書', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (291, '歌羅西書', FALSE);

-- Q292
INSERT INTO question (id, content, category, bible_ref) VALUES (292, '約瑟被賣到埃及的故事記載在哪卷書？', '聖經書卷', '創世記 37');
INSERT INTO question_option (question_id, content, is_correct) VALUES (292, '出埃及記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (292, '利未記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (292, '約伯記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (292, '創世記', TRUE);

-- Q293
INSERT INTO question (id, content, category, bible_ref) VALUES (293, '「神愛世人，甚至將他的獨生子賜給他們」出自哪卷書？', '聖經書卷', '約翰福音 3:16');
INSERT INTO question_option (question_id, content, is_correct) VALUES (293, '約翰福音', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (293, '羅馬書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (293, '約翰一書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (293, '希伯來書', FALSE);

-- Q294
INSERT INTO question (id, content, category, bible_ref) VALUES (294, '摩西擊打磐石出水的故事記載在哪卷書？', '聖經書卷', '出埃及記 17:5-6');
INSERT INTO question_option (question_id, content, is_correct) VALUES (294, '創世記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (294, '出埃及記', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (294, '利未記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (294, '民數記', FALSE);

-- Q295
INSERT INTO question (id, content, category, bible_ref) VALUES (295, '「聖靈所結的果子就是仁愛、喜樂、和平…」出自哪卷書？', '聖經書卷', '加拉太書 5:22');
INSERT INTO question_option (question_id, content, is_correct) VALUES (295, '以弗所書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (295, '羅馬書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (295, '加拉太書', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (295, '歌羅西書', FALSE);

-- Q296
INSERT INTO question (id, content, category, bible_ref) VALUES (296, '拉撒路從死裡復活的故事記載在哪卷福音書？', '聖經書卷', '約翰福音 11:1-44');
INSERT INTO question_option (question_id, content, is_correct) VALUES (296, '馬太福音', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (296, '馬可福音', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (296, '路加福音', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (296, '約翰福音', TRUE);

-- Q297
INSERT INTO question (id, content, category, bible_ref) VALUES (297, '「我靠著那加給我力量的，凡事都能做」出自哪卷書？', '聖經書卷', '腓立比書 4:13');
INSERT INTO question_option (question_id, content, is_correct) VALUES (297, '腓立比書', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (297, '以弗所書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (297, '哥林多後書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (297, '提摩太後書', FALSE);

-- Q298
INSERT INTO question (id, content, category, bible_ref) VALUES (298, '亞伯拉罕獻以撒的故事記載在哪卷書？', '聖經書卷', '創世記 22:1-14');
INSERT INTO question_option (question_id, content, is_correct) VALUES (298, '出埃及記', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (298, '創世記', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (298, '希伯來書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (298, '約伯記', FALSE);

-- Q299
INSERT INTO question (id, content, category, bible_ref) VALUES (299, '「信心沒有行為是死的」出自哪卷書？', '聖經書卷', '雅各書 2:26');
INSERT INTO question_option (question_id, content, is_correct) VALUES (299, '希伯來書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (299, '羅馬書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (299, '雅各書', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (299, '彼得前書', FALSE);

-- Q300
INSERT INTO question (id, content, category, bible_ref) VALUES (300, '好撒瑪利亞人的比喻記載在哪卷福音書？', '聖經書卷', '路加福音 10:25-37');
INSERT INTO question_option (question_id, content, is_correct) VALUES (300, '馬太福音', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (300, '馬可福音', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (300, '約翰福音', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (300, '路加福音', TRUE);

-- =============================================
-- 重置序列
-- =============================================
SELECT setval('question_id_seq', 300);
SELECT setval('question_option_id_seq', 1200);
