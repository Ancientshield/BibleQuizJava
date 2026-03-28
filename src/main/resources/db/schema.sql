-- BibleQuiz 完整 DB Schema（Phase E ~ G 一次到位）
-- 設計文件：docs/Phase-E2 DB架構規劃紀錄.md

-- ============================================================
-- 1. bible_book — 聖經書卷（66 卷，lookup table）
-- ============================================================
CREATE TABLE IF NOT EXISTS bible_book (
    id         SMALLSERIAL PRIMARY KEY,
    name       VARCHAR(20) NOT NULL UNIQUE,                         -- 創世記、出埃及記…
    testament  VARCHAR(2) NOT NULL,                                 -- OT（舊約）/ NT（新約）
    sort_order SMALLINT NOT NULL UNIQUE                             -- 1~66，聖經原始順序
);

-- ============================================================
-- 2. question_category — 題目分類（8 類，lookup table）
-- ============================================================
CREATE TABLE IF NOT EXISTS question_category (
    id         SMALLSERIAL PRIMARY KEY,
    name       VARCHAR(20) NOT NULL UNIQUE,                         -- 聖經人物、聖經事件…
    sort_order SMALLINT NOT NULL UNIQUE
);

-- ============================================================
-- 3. question — 題目
-- ============================================================
CREATE TABLE IF NOT EXISTS question (
    id               SERIAL PRIMARY KEY,
    content          TEXT NOT NULL,
    category_id      SMALLINT REFERENCES question_category(id),     -- → question_category，nullable（投稿時不填，審核時指定）
    bible_book_id    SMALLINT REFERENCES bible_book(id),            -- → bible_book，nullable
    bible_chapter    SMALLINT,                                      -- 章
    bible_verse_start SMALLINT,                                     -- 起始節
    bible_verse_end  SMALLINT,                                      -- 結束節（nullable，單節時為 null）
    status           VARCHAR(20) NOT NULL DEFAULT 'PUBLISHED',      -- DRAFT / PENDING / PUBLISHED / REJECTED
    created_by       BIGINT,                                        -- → app_user(id)，null = 系統內建種子題目
    created_at       TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at       TIMESTAMP
);

-- ============================================================
-- 4. question_option — 選項（每題通常 4 個）
-- ============================================================
CREATE TABLE IF NOT EXISTS question_option (
    id          SERIAL PRIMARY KEY,
    question_id INT NOT NULL REFERENCES question(id) ON DELETE CASCADE,
    content     VARCHAR(255) NOT NULL,
    is_correct  BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE INDEX IF NOT EXISTS idx_option_question_id ON question_option(question_id);

-- ============================================================
-- 5. app_user — 使用者帳號
-- ============================================================
CREATE TABLE IF NOT EXISTS app_user (
    id            BIGSERIAL PRIMARY KEY,
    email         VARCHAR(255) NOT NULL UNIQUE,
    name          VARCHAR(255),
    password_hash VARCHAR(255),                                  -- email 註冊用，OAuth 使用者為 null
    avatar_url    VARCHAR(500),                                  -- OAuth 頭像
    provider      VARCHAR(20) NOT NULL DEFAULT 'local',          -- local / google / line / facebook / instagram
    provider_id   VARCHAR(255),                                  -- OAuth provider 的 user ID（local 為 null）
    role          VARCHAR(20) NOT NULL DEFAULT 'USER',           -- USER / ADMIN
    email_verified BOOLEAN NOT NULL DEFAULT FALSE,               -- email 驗證完成才能登入
    created_at    TIMESTAMP NOT NULL DEFAULT NOW(),
    last_login_at TIMESTAMP
);

-- ============================================================
-- 6. question.created_by FK（app_user 建好後才能加）
-- ============================================================
ALTER TABLE question
    ADD CONSTRAINT fk_question_created_by
    FOREIGN KEY (created_by) REFERENCES app_user(id);

-- ============================================================
-- 7. quiz_session — 測驗場次（每完成一局建一筆，僅登入使用者）
-- ============================================================
CREATE TABLE IF NOT EXISTS quiz_session (
    id              BIGSERIAL PRIMARY KEY,
    user_id         BIGINT NOT NULL REFERENCES app_user(id),
    score           INT NOT NULL,
    total_questions INT NOT NULL DEFAULT 10,
    completed_at    TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_session_user_id ON quiz_session(user_id);

-- ============================================================
-- 8. quiz_answer_log — 作答紀錄（每局 10 筆）
-- ============================================================
CREATE TABLE IF NOT EXISTS quiz_answer_log (
    id                 BIGSERIAL PRIMARY KEY,
    session_id         BIGINT NOT NULL REFERENCES quiz_session(id) ON DELETE CASCADE,
    question_id        INT NOT NULL REFERENCES question(id),
    selected_option_id INT NOT NULL REFERENCES question_option(id),
    is_correct         BOOLEAN NOT NULL,
    answered_at        TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_answer_log_session  ON quiz_answer_log(session_id);
CREATE INDEX IF NOT EXISTS idx_answer_log_question ON quiz_answer_log(question_id);

-- ============================================================
-- 9. auth_token — 驗證 / 重設密碼用的一次性 token
-- ============================================================
CREATE TABLE IF NOT EXISTS auth_token (
    id          BIGSERIAL PRIMARY KEY,
    user_id     BIGINT NOT NULL REFERENCES app_user(id) ON DELETE CASCADE,
    token       VARCHAR(255) NOT NULL UNIQUE,
    type        VARCHAR(20) NOT NULL,                              -- VERIFY_EMAIL / RESET_PASSWORD
    expires_at  TIMESTAMP NOT NULL,
    used_at     TIMESTAMP,                                         -- null = 尚未使用
    created_at  TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_auth_token_token   ON auth_token(token);
CREATE INDEX IF NOT EXISTS idx_auth_token_user_id ON auth_token(user_id);
