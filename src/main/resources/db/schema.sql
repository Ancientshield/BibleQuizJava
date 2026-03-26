CREATE TABLE IF NOT EXISTS question (
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS question_option (
    id SERIAL PRIMARY KEY,
    question_id INT NOT NULL REFERENCES question(id) ON DELETE CASCADE,
    content VARCHAR(255) NOT NULL,
    is_correct BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE INDEX IF NOT EXISTS idx_option_question_id ON question_option(question_id);

CREATE TABLE IF NOT EXISTS app_user (
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255),
    provider VARCHAR(20) NOT NULL DEFAULT 'local',
    provider_id VARCHAR(255),
    role VARCHAR(20) NOT NULL DEFAULT 'USER',
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);
