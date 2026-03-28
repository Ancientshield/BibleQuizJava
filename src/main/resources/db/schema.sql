-- BibleQuiz 完整 DB Schema（Phase E ~ G 一次到位）
-- 設計文件：docs/Phase-E2 DB架構規劃紀錄.md

-- ============================================================
-- 1. question — 題目
-- ============================================================
CREATE TABLE IF NOT EXISTS question (
    id         SERIAL PRIMARY KEY,
    content    TEXT NOT NULL,
    category   VARCHAR(20),                                     -- 聖經人物/事件/歷史/地理/物件/經文/數字/書卷
    bible_ref  VARCHAR(50),                                     -- 答案的聖經出處，例如 '創世記 6:14'
    status     VARCHAR(20) NOT NULL DEFAULT 'PUBLISHED',        -- DRAFT / PENDING / PUBLISHED / REJECTED
    created_by BIGINT,                                          -- → app_user(id)，null = 系統內建種子題目
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP
);

-- ============================================================
-- 2. question_option — 選項（每題通常 4 個）
-- ============================================================
CREATE TABLE IF NOT EXISTS question_option (
    id          SERIAL PRIMARY KEY,
    question_id INT NOT NULL REFERENCES question(id) ON DELETE CASCADE,
    content     VARCHAR(255) NOT NULL,
    is_correct  BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE INDEX IF NOT EXISTS idx_option_question_id ON question_option(question_id);

-- ============================================================
-- 3. app_user — 使用者帳號
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
-- 4. question.created_by FK（app_user 建好後才能加）
-- ============================================================
ALTER TABLE question
    ADD CONSTRAINT fk_question_created_by
    FOREIGN KEY (created_by) REFERENCES app_user(id);

-- ============================================================
-- 5. quiz_session — 測驗場次（每完成一局建一筆，僅登入使用者）
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
-- 6. quiz_answer_log — 作答紀錄（每局 10 筆）
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
-- 7. auth_token — 驗證 / 重設密碼用的一次性 token
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
