-- 題目
INSERT INTO question (id, content) VALUES (1, '以下哪位是舊約中帶領以色列人出埃及的領袖？');
INSERT INTO question (id, content) VALUES (2, '誰是被稱為「合神心意的人」的以色列王？');
INSERT INTO question (id, content) VALUES (3, '誰被投入獅子坑中卻安然無恙？');
INSERT INTO question (id, content) VALUES (4, '誰的妻子因為回頭看所多瑪而變成鹽柱？');
INSERT INTO question (id, content) VALUES (5, '根據聖經，上帝創造世界花了多少時間？');
INSERT INTO question (id, content) VALUES (6, '耶穌基督有多少位門徒？');
INSERT INTO question (id, content) VALUES (7, '聖經中最短的一節經文是什麼？');
INSERT INTO question (id, content) VALUES (8, '耶穌基督出生在哪個城市？');
INSERT INTO question (id, content) VALUES (9, '以色列人在曠野漂流了多少年？');
INSERT INTO question (id, content) VALUES (10, '以下哪個不是耶穌行的神蹟？');
INSERT INTO question (id, content) VALUES (11, '挪亞方舟停在哪座山上？');
INSERT INTO question (id, content) VALUES (12, '誰在母腹中就被聖靈充滿？');
INSERT INTO question (id, content) VALUES (13, '「你們要嘗嘗主恩的滋味，便知道他是美善」出自哪卷書？');
INSERT INTO question (id, content) VALUES (14, '保羅原本的名字是什麼？');
INSERT INTO question (id, content) VALUES (15, '耶穌在哪裡行了第一個神蹟？');
INSERT INTO question (id, content) VALUES (16, '聖經中誰的壽命最長？');
INSERT INTO question (id, content) VALUES (17, '十誡是上帝在哪座山上頒布的？');
INSERT INTO question (id, content) VALUES (18, '誰用五餅二魚獻給耶穌？');
INSERT INTO question (id, content) VALUES (19, '耶穌被釘十字架前在哪個園子禱告？');
INSERT INTO question (id, content) VALUES (20, '啟示錄的作者是誰？');

-- 選項（is_correct = TRUE 為正確答案）
INSERT INTO question_option (question_id, content, is_correct) VALUES
  (1, '亞伯拉罕', FALSE), (1, '摩西', TRUE), (1, '大衛', FALSE), (1, '所羅門', FALSE);

INSERT INTO question_option (question_id, content, is_correct) VALUES
  (2, '掃羅', FALSE), (2, '所羅門', FALSE), (2, '大衛', TRUE), (2, '希西家', FALSE);

INSERT INTO question_option (question_id, content, is_correct) VALUES
  (3, '以利亞', FALSE), (3, '但以理', TRUE), (3, '約拿', FALSE), (3, '耶利米', FALSE);

INSERT INTO question_option (question_id, content, is_correct) VALUES
  (4, '亞伯拉罕', FALSE), (4, '羅得', TRUE), (4, '以撒', FALSE), (4, '雅各', FALSE);

INSERT INTO question_option (question_id, content, is_correct) VALUES
  (5, '一天', FALSE), (5, '三天', FALSE), (5, '六天', TRUE), (5, '七天', FALSE);

INSERT INTO question_option (question_id, content, is_correct) VALUES
  (6, '七位', FALSE), (6, '十位', FALSE), (6, '十二位', TRUE), (6, '七十位', FALSE);

INSERT INTO question_option (question_id, content, is_correct) VALUES
  (7, '神就是愛', FALSE), (7, '耶穌哭了', TRUE), (7, '要常常喜樂', FALSE), (7, '不住禱告', FALSE);

INSERT INTO question_option (question_id, content, is_correct) VALUES
  (8, '拿撒勒', FALSE), (8, '耶路撒冷', FALSE), (8, '伯利恆', TRUE), (8, '迦百農', FALSE);

INSERT INTO question_option (question_id, content, is_correct) VALUES
  (9, '十年', FALSE), (9, '二十年', FALSE), (9, '三十年', FALSE), (9, '四十年', TRUE);

INSERT INTO question_option (question_id, content, is_correct) VALUES
  (10, '五餅二魚餵飽五千人', FALSE), (10, '水變成酒', FALSE), (10, '分開紅海', TRUE), (10, '使拉撒路復活', FALSE);

INSERT INTO question_option (question_id, content, is_correct) VALUES
  (11, '西奈山', FALSE), (11, '橄欖山', FALSE), (11, '亞拉臘山', TRUE), (11, '迦密山', FALSE);

INSERT INTO question_option (question_id, content, is_correct) VALUES
  (12, '撒母耳', FALSE), (12, '施洗約翰', TRUE), (12, '耶利米', FALSE), (12, '參孫', FALSE);

INSERT INTO question_option (question_id, content, is_correct) VALUES
  (13, '箴言', FALSE), (13, '詩篇', TRUE), (13, '以賽亞書', FALSE), (13, '傳道書', FALSE);

INSERT INTO question_option (question_id, content, is_correct) VALUES
  (14, '彼得', FALSE), (14, '掃羅', TRUE), (14, '巴拿巴', FALSE), (14, '西拉', FALSE);

INSERT INTO question_option (question_id, content, is_correct) VALUES
  (15, '耶路撒冷', FALSE), (15, '迦百農', FALSE), (15, '迦拿', TRUE), (15, '伯大尼', FALSE);

INSERT INTO question_option (question_id, content, is_correct) VALUES
  (16, '亞當', FALSE), (16, '挪亞', FALSE), (16, '瑪土撒拉', TRUE), (16, '亞伯拉罕', FALSE);

INSERT INTO question_option (question_id, content, is_correct) VALUES
  (17, '西奈山', TRUE), (17, '橄欖山', FALSE), (17, '錫安山', FALSE), (17, '何烈山', FALSE);

INSERT INTO question_option (question_id, content, is_correct) VALUES
  (18, '一個小男孩', TRUE), (18, '彼得', FALSE), (18, '安得烈', FALSE), (18, '約翰', FALSE);

INSERT INTO question_option (question_id, content, is_correct) VALUES
  (19, '伊甸園', FALSE), (19, '客西馬尼園', TRUE), (19, '橄欖園', FALSE), (19, '葡萄園', FALSE);

INSERT INTO question_option (question_id, content, is_correct) VALUES
  (20, '保羅', FALSE), (20, '彼得', FALSE), (20, '約翰', TRUE), (20, '雅各', FALSE);

-- 重設 sequence，避免下次 INSERT 衝突
SELECT setval('question_id_seq', (SELECT MAX(id) FROM question));
SELECT setval('question_option_id_seq', (SELECT MAX(id) FROM question_option));
