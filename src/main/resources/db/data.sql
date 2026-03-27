-- Phase E：正規化種子資料（20 題，每題 4 個選項）

-- Q1
INSERT INTO question (id, content) VALUES (1, '以下哪位是舊約中帶領以色列人出埃及的領袖？');
INSERT INTO question_option (question_id, content, is_correct) VALUES (1, '亞伯拉罕', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (1, '摩西', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (1, '大衛', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (1, '所羅門', FALSE);

-- Q2
INSERT INTO question (id, content) VALUES (2, '誰是被稱為「合神心意的人」的以色列王？');
INSERT INTO question_option (question_id, content, is_correct) VALUES (2, '掃羅', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (2, '所羅門', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (2, '大衛', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (2, '希西家', FALSE);

-- Q3
INSERT INTO question (id, content) VALUES (3, '誰被投入獅子坑中卻安然無恙？');
INSERT INTO question_option (question_id, content, is_correct) VALUES (3, '以利亞', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (3, '但以理', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (3, '約拿', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (3, '耶利米', FALSE);

-- Q4
INSERT INTO question (id, content) VALUES (4, '誰的妻子因為回頭看所多瑪而變成鹽柱？');
INSERT INTO question_option (question_id, content, is_correct) VALUES (4, '亞伯拉罕', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (4, '羅得', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (4, '以撒', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (4, '雅各', FALSE);

-- Q5
INSERT INTO question (id, content) VALUES (5, '根據聖經，上帝創造世界花了多少時間？');
INSERT INTO question_option (question_id, content, is_correct) VALUES (5, '一天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (5, '三天', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (5, '六天', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (5, '七天', FALSE);

-- Q6
INSERT INTO question (id, content) VALUES (6, '耶穌基督有多少位門徒？');
INSERT INTO question_option (question_id, content, is_correct) VALUES (6, '七位', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (6, '十位', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (6, '十二位', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (6, '七十位', FALSE);

-- Q7
INSERT INTO question (id, content) VALUES (7, '聖經中最短的一節經文是什麼？');
INSERT INTO question_option (question_id, content, is_correct) VALUES (7, '神就是愛', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (7, '耶穌哭了', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (7, '要常常喜樂', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (7, '不住禱告', FALSE);

-- Q8
INSERT INTO question (id, content) VALUES (8, '耶穌基督出生在哪個城市？');
INSERT INTO question_option (question_id, content, is_correct) VALUES (8, '拿撒勒', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (8, '耶路撒冷', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (8, '伯利恆', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (8, '迦百農', FALSE);

-- Q9
INSERT INTO question (id, content) VALUES (9, '以色列人在曠野漂流了多少年？');
INSERT INTO question_option (question_id, content, is_correct) VALUES (9, '十年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (9, '二十年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (9, '三十年', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (9, '四十年', TRUE);

-- Q10
INSERT INTO question (id, content) VALUES (10, '以下哪個不是耶穌行的神蹟？');
INSERT INTO question_option (question_id, content, is_correct) VALUES (10, '五餅二魚餵飽五千人', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (10, '水變成酒', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (10, '分開紅海', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (10, '使拉撒路復活', FALSE);

-- Q11
INSERT INTO question (id, content) VALUES (11, '挪亞方舟停在哪座山上？');
INSERT INTO question_option (question_id, content, is_correct) VALUES (11, '西奈山', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (11, '橄欖山', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (11, '亞拉臘山', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (11, '迦密山', FALSE);

-- Q12
INSERT INTO question (id, content) VALUES (12, '誰在母腹中就被聖靈充滿？');
INSERT INTO question_option (question_id, content, is_correct) VALUES (12, '撒母耳', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (12, '施洗約翰', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (12, '耶利米', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (12, '參孫', FALSE);

-- Q13
INSERT INTO question (id, content) VALUES (13, '「你們要嘗嘗主恩的滋味，便知道他是美善」出自哪卷書？');
INSERT INTO question_option (question_id, content, is_correct) VALUES (13, '箴言', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (13, '詩篇', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (13, '以賽亞書', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (13, '傳道書', FALSE);

-- Q14
INSERT INTO question (id, content) VALUES (14, '保羅原本的名字是什麼？');
INSERT INTO question_option (question_id, content, is_correct) VALUES (14, '彼得', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (14, '掃羅', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (14, '巴拿巴', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (14, '西拉', FALSE);

-- Q15
INSERT INTO question (id, content) VALUES (15, '耶穌在哪裡行了第一個神蹟？');
INSERT INTO question_option (question_id, content, is_correct) VALUES (15, '耶路撒冷', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (15, '迦百農', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (15, '迦拿', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (15, '伯大尼', FALSE);

-- Q16
INSERT INTO question (id, content) VALUES (16, '聖經中誰的壽命最長？');
INSERT INTO question_option (question_id, content, is_correct) VALUES (16, '亞當', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (16, '挪亞', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (16, '瑪土撒拉', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (16, '亞伯拉罕', FALSE);

-- Q17
INSERT INTO question (id, content) VALUES (17, '十誡是上帝在哪座山上頒布的？');
INSERT INTO question_option (question_id, content, is_correct) VALUES (17, '西奈山', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (17, '橄欖山', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (17, '錫安山', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (17, '何烈山', FALSE);

-- Q18
INSERT INTO question (id, content) VALUES (18, '誰用五餅二魚獻給耶穌？');
INSERT INTO question_option (question_id, content, is_correct) VALUES (18, '一個小男孩', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (18, '彼得', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (18, '安得烈', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (18, '約翰', FALSE);

-- Q19
INSERT INTO question (id, content) VALUES (19, '耶穌被釘十字架前在哪個園子禱告？');
INSERT INTO question_option (question_id, content, is_correct) VALUES (19, '伊甸園', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (19, '客西馬尼園', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (19, '橄欖園', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (19, '葡萄園', FALSE);

-- Q20
INSERT INTO question (id, content) VALUES (20, '啟示錄的作者是誰？');
INSERT INTO question_option (question_id, content, is_correct) VALUES (20, '保羅', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (20, '彼得', FALSE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (20, '約翰', TRUE);
INSERT INTO question_option (question_id, content, is_correct) VALUES (20, '雅各', FALSE);

-- 重置序列，讓下次 INSERT 從正確的 ID 開始
SELECT setval('question_id_seq', 20);
SELECT setval('question_option_id_seq', 80);
