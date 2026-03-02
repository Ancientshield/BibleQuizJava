# 《問答小遊戲》待辦完成清單與執行步驟

> 產生日期：2026-02-28
> 專案狀態：早期原型階段 — 後端基本 API 已完成，其餘功能皆待開發

---

## 現況總覽

### ✅ 已完成

| 項目                            | 說明                                                                     |
| ------------------------------- | ------------------------------------------------------------------------ |
| Spring Boot 後端骨架            | `QuizApplication.java` 入口、`pom.xml` 依賴配置                          |
| Question Entity + JPA 映射      | 對應 PostgreSQL `question` 資料表                                        |
| QuestionDTO（隱藏答案）         | 回傳前端時不暴露 `correctAnswer`                                         |
| QuestionRepository（基本 CRUD） | 繼承 `JpaRepository`                                                     |
| QuizService 核心邏輯            | 取得全部題目、隨機 10 題、單題驗答                                       |
| REST API 三支端點               | `GET /api/quiz/questions`、`GET /api/quiz/start`、`POST /api/quiz/check` |
| PostgreSQL Driver 依賴          | `pom.xml` 已加入                                                         |
| HelloController 測試端點        | `GET /hello` 煙霧測試                                                    |

### ❌ 未完成

| 項目                               | 優先級 |
| ---------------------------------- | ------ |
| Nuxt 3 前端                        | 🔴 高  |
| CORS 跨域設定                      | 🔴 高  |
| 遊戲流程完善（累計計分、結算畫面） | 🔴 高  |
| SQL Schema / 種子資料              | 🔴 高  |
| 登入功能（Spring Security）        | 🟡 中  |
| 管理者 CRUD 題目                   | 🟡 中  |
| Google 第三方登入                  | 🟡 中  |
| Dockerfile + docker-compose        | 🟠 中  |
| GitHub Actions CI/CD               | 🟠 中  |
| VPS 部署（Oracle Cloud）           | 🟠 中  |
| 環境設定檔分離（dev/prod）         | 🟢 低  |
| 全域錯誤處理                       | 🟢 低  |
| 單元測試 / 整合測試                | 🟢 低  |

---

## 階段一：基礎功能 — 後端完善

> 目標：讓後端 API 能完整支援「10 題問答遊戲」流程

### 1.1 建立 SQL Schema 與種子資料

- [ ] 建立 `src/main/resources/db/schema.sql`

```sql
CREATE TABLE IF NOT EXISTS question (
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    option_a VARCHAR(255) NOT NULL,
    option_b VARCHAR(255) NOT NULL,
    option_c VARCHAR(255) NOT NULL,
    option_d VARCHAR(255) NOT NULL,
    correct_answer CHAR(1) NOT NULL
);
```

- [ ] 建立 `src/main/resources/db/data.sql`，至少準備 20 題以上的種子資料
- [ ] 將 `application.properties` 的 `ddl-auto` 改為 `update`（開發階段），或引入 Flyway 管理 migration

### 1.2 完善遊戲流程 API

- [ ] **新增 `QuizResultDTO`**：包含 `correctAnswer`、`isCorrect`、`explanation`（選填）
- [ ] **修改 `POST /api/quiz/check` 回傳值**：改為回傳 `QuizResultDTO`（含正確答案），而非只有 `boolean`
- [ ] **新增 `POST /api/quiz/submit` 端點**：一次提交 10 題答案，回傳總分與每題結果

```
POST /api/quiz/submit
Request Body: { "answers": [ { "questionId": 1, "answer": "A" }, ... ] }
Response: { "totalScore": 7, "totalQuestions": 10, "results": [...] }
```

- [ ] **新增 `QuizSubmitRequest` DTO**：封裝批次提交的請求格式
- [ ] **新增 `QuizSubmitResponse` DTO**：封裝結算回傳格式

### 1.3 CORS 跨域設定

- [ ] 新增 `config/WebConfig.java`，實作 `WebMvcConfigurer`

```java
@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/api/**")
                .allowedOrigins("http://localhost:3000") // Nuxt dev server
                .allowedMethods("GET", "POST", "PUT", "DELETE")
                .allowCredentials(true);
    }
}
```

### 1.4 環境設定檔分離

- [ ] 建立 `application-dev.properties`（本地開發用，含 localhost DB 設定）
- [ ] 建立 `application-prod.properties`（生產環境，使用環境變數）
- [ ] 將密碼等敏感資訊改用 `${DB_PASSWORD}` 環境變數

### 1.5 全域錯誤處理

- [ ] 新增 `exception/GlobalExceptionHandler.java`（`@ControllerAdvice`）
- [ ] 處理 `EntityNotFoundException`、`IllegalArgumentException` 等常見例外
- [ ] 統一錯誤回傳格式：`{ "error": "...", "message": "...", "status": 404 }`

---

## 階段二：基礎功能 — 前端（Nuxt 3）

> 目標：建立完整的前端遊戲介面，與後端 API 串接

### 2.1 初始化 Nuxt 3 專案

- [ ] 在專案根目錄建立 `frontend/` 資料夾
- [ ] 執行 `npx nuxi@latest init frontend`
- [ ] 安裝必要套件：`@nuxtjs/tailwindcss`（或其他 UI 框架）

```bash
cd frontend
npm install
```

### 2.2 專案結構規劃

```
frontend/
├── pages/
│   ├── index.vue          # 首頁（開始遊戲按鈕）
│   └── quiz.vue           # 答題頁面
├── components/
│   ├── QuestionCard.vue    # 單題卡片元件
│   ├── OptionButton.vue    # 選項按鈕元件
│   ├── ConfirmModal.vue    # 確認提示窗
│   └── ResultBoard.vue     # 結算畫面
├── composables/
│   └── useQuiz.ts          # 遊戲邏輯 composable
├── types/
│   └── quiz.ts             # TypeScript 型別定義
└── nuxt.config.ts
```

### 2.3 實作頁面功能

- [ ] **首頁 `index.vue`**
  - 專案標題 + 簡介
  - 「開始遊戲」按鈕 → 呼叫 `GET /api/quiz/start` 取得 10 題
  - 導航至 `/quiz` 頁面

- [ ] **答題頁 `quiz.vue`**
  - 顯示當前題號（第 X / 10 題）與進度條
  - 顯示題目內容與四個選項按鈕（A / B / C / D）
  - 選擇後彈出確認視窗（`ConfirmModal`）
  - 按下確定 → `POST /api/quiz/check` 驗答
  - 顯示正確 / 錯誤動畫反饋
  - 自動進入下一題
  - 第 10 題結束後 → 顯示結算畫面（`ResultBoard`）

- [ ] **結算畫面 `ResultBoard.vue`**
  - 顯示答對題數 / 總題數
  - 顯示每題的答對 / 答錯明細
  - 「再玩一次」按鈕

### 2.4 API 串接

- [ ] 在 `nuxt.config.ts` 設定 API proxy 或 `runtimeConfig`

```ts
export default defineNuxtConfig({
  runtimeConfig: {
    public: {
      apiBase: "http://localhost:8080",
    },
  },
});
```

- [ ] 建立 `composables/useQuiz.ts`，封裝所有 API 呼叫邏輯
- [ ] 使用 `useFetch` 或 `$fetch` 與後端溝通

### 2.5 基礎功能驗收測試

- [ ] 前後端聯調：能完整跑完 10 題流程
- [ ] 確認答案不會在前端被洩露（檢查 Network tab）
- [ ] 確認結算畫面正確顯示分數

---

## 階段三：進階功能 — 登入與權限

> 目標：實作使用者認證系統，區分管理者與一般使用者

### 3.1 Spring Security 基礎設定

- [ ] `pom.xml` 加入依賴

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-security</artifactId>
</dependency>
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-oauth2-client</artifactId>
</dependency>
<dependency>
    <groupId>io.jsonwebtoken</groupId>
    <artifactId>jjwt-api</artifactId>
    <version>0.12.6</version>
</dependency>
```

- [ ] 新增 `config/SecurityConfig.java`
  - `/api/quiz/**` 公開，不需登入即可玩遊戲
  - `/api/admin/**` 需要 `ADMIN` 角色
  - `/api/user/**` 需要登入

### 3.2 使用者資料模型

- [ ] 新增 `entity/User.java`

```java
@Entity
@Table(name = "app_user")
public class User {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String email;
    private String name;
    private String provider;     // "local" or "google"
    private String providerId;
    @Enumerated(EnumType.STRING)
    private Role role;           // ADMIN, USER
}
```

- [ ] 新增 `entity/Role.java` 列舉
- [ ] 新增 `repository/UserRepository.java`
- [ ] 建立對應 SQL schema

### 3.3 JWT 認證機制

- [ ] 新增 `security/JwtTokenProvider.java` — 生成與驗證 JWT
- [ ] 新增 `security/JwtAuthenticationFilter.java` — 請求攔截驗證
- [ ] 新增 `controller/AuthController.java` — 登入 / 登出端點

### 3.4 Google 第三方登入（OAuth2）

- [ ] 在 [Google Cloud Console](https://console.cloud.google.com/) 建立 OAuth2 憑證
- [ ] 設定 `application.properties`

```properties
spring.security.oauth2.client.registration.google.client-id=${GOOGLE_CLIENT_ID}
spring.security.oauth2.client.registration.google.client-secret=${GOOGLE_CLIENT_SECRET}
```

- [ ] 實作 `security/OAuth2SuccessHandler.java` — 登入成功後發行 JWT
- [ ] 前端加入 Google 登入按鈕，導向後端 OAuth2 授權路徑

### 3.5 前端登入介面

- [ ] 新增 `pages/login.vue` 登入頁面
- [ ] 新增 `middleware/auth.ts` 路由守衛
- [ ] 使用 `useState` 或 Pinia 管理使用者狀態
- [ ] 在 Navbar 顯示登入 / 登出、使用者名稱

---

## 階段四：進階功能 — 管理者與題目管理

> 目標：管理者可新增 / 編輯 / 刪除 / 審核題目

### 4.1 管理者後端 API

- [ ] 新增 `controller/AdminController.java`

| 方法   | 端點                                  | 說明           |
| ------ | ------------------------------------- | -------------- |
| POST   | `/api/admin/questions`                | 新增題目       |
| PUT    | `/api/admin/questions/{id}`           | 編輯題目       |
| DELETE | `/api/admin/questions/{id}`           | 刪除題目       |
| PATCH  | `/api/admin/questions/{id}/publish`   | 審核上架       |
| GET    | `/api/admin/questions?status=pending` | 查看待審核題目 |

- [ ] `Question` Entity 新增欄位

```java
@Column(name = "status")
@Enumerated(EnumType.STRING)
private QuestionStatus status; // DRAFT, PENDING, PUBLISHED

@ManyToOne
@JoinColumn(name = "created_by")
private User createdBy;

private LocalDateTime createdAt;
private LocalDateTime updatedAt;
```

- [ ] 新增 `entity/QuestionStatus.java` 列舉

### 4.2 一般使用者投稿題目

- [ ] 新增 `controller/UserQuestionController.java`
- [ ] 一般使用者可新增、編輯、刪除自己的題目（狀態為 `DRAFT`）
- [ ] **限制：每人最多暫存 10 題未審核題目**
- [ ] 提交審核 → 狀態改為 `PENDING`

### 4.3 管理者前端介面

- [ ] 新增 `pages/admin/` 目錄
  - `pages/admin/index.vue` — 管理後台首頁
  - `pages/admin/questions.vue` — 題目列表（含篩選：全部 / 待審核 / 已上架）
  - `pages/admin/questions/[id].vue` — 單題編輯頁
- [ ] 新增表單元件：新增 / 編輯題目
- [ ] 審核功能：一鍵核准上架

---

## 階段五：容器化與 CI/CD

> 目標：Docker 容器化 + GitHub Actions 自動化部署

### 5.1 後端 Dockerfile

- [ ] 在專案根目錄建立 `Dockerfile`

```dockerfile
# Build stage
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

# Run stage
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/quiz-*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
```

### 5.2 前端 Dockerfile

- [ ] 在 `frontend/` 建立 `Dockerfile`

```dockerfile
# Build stage
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run generate

# Serve stage
FROM nginx:alpine
COPY --from=build /app/.output/public /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
```

- [ ] 建立 `frontend/nginx.conf`（SPA fallback + API 反向代理）

### 5.3 docker-compose.yml

- [ ] 在專案根目錄建立 `docker-compose.yml`

```yaml
services:
  db:
    image: postgres:16
    environment:
      POSTGRES_DB: quiz
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: ${DB_PASSWORD}
    volumes:
      - pgdata:/var/lib/postgresql/data
      - ./src/main/resources/db/schema.sql:/docker-entrypoint-initdb.d/01-schema.sql
      - ./src/main/resources/db/data.sql:/docker-entrypoint-initdb.d/02-data.sql
    ports:
      - "5432:5432"

  backend:
    build: .
    environment:
      SPRING_DATASOURCE_URL: jdbc:postgresql://db:5432/quiz
      SPRING_DATASOURCE_PASSWORD: ${DB_PASSWORD}
    ports:
      - "8080:8080"
    depends_on:
      - db

  frontend:
    build: ./frontend
    ports:
      - "80:80"
    depends_on:
      - backend

volumes:
  pgdata:
```

### 5.4 GitHub Actions — 後端

- [ ] 建立 `.github/workflows/backend-deploy.yml`

```yaml
name: Backend CI/CD
on:
  push:
    branches: [main]
    paths: ["src/**", "pom.xml", "Dockerfile"]

jobs:
  build-and-push:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-java@v4
        with:
          java-version: "17"
          distribution: "temurin"
      - run: mvn clean package -DskipTests
      - uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}
      - uses: docker/build-push-action@v5
        with:
          push: true
          tags: ${{ secrets.DOCKER_USERNAME }}/quiz-backend:latest
```

### 5.5 GitHub Actions — 前端

- [ ] 建立 `.github/workflows/frontend-deploy.yml`

```yaml
name: Frontend CI/CD
on:
  push:
    branches: [main]
    paths: ["frontend/**"]

jobs:
  build-and-push:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: "20"
      - run: cd frontend && npm ci && npm run generate
      - uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}
      - uses: docker/build-push-action@v5
        with:
          context: ./frontend
          push: true
          tags: ${{ secrets.DOCKER_USERNAME }}/quiz-frontend:latest
```

---

## 階段六：VPS 部署（Oracle Cloud）

> 目標：在甲骨文雲端 VPS 上完成正式部署

### 6.1 VPS 環境準備

- [ ] SSH 連線至 VPS：`ssh -i ~/.ssh/ssh-key-2025-06-05.key ubuntu@158.101.18.7`
- [ ] 安裝 Docker & Docker Compose
- [ ] 設定防火牆規則（開放 80、443、8080 port）
- [ ] 設定 `.env` 檔案（DB 密碼、Google OAuth 金鑰等）

### 6.2 SSL 憑證（Let's Encrypt）

- [ ] 設定域名 DNS 指向 VPS IP
- [ ] 使用 Certbot 取得 SSL 憑證

```bash
docker run -it --rm \
  -v /etc/letsencrypt:/etc/letsencrypt \
  -p 80:80 \
  certbot/certbot certonly --standalone -d your-domain.com
```

- [ ] 在 Nginx 設定中啟用 HTTPS
- [ ] 設定自動續期 cron job

### 6.3 正式部署

- [ ] 從 Docker Hub 拉取映像

```bash
docker pull your-username/quiz-backend:latest
docker pull your-username/quiz-frontend:latest
```

- [ ] 建立 `docker-compose.prod.yml`（包含 SSL 掛載、環境變數）
- [ ] 啟動服務：`docker compose -f docker-compose.prod.yml up -d`
- [ ] 驗證所有服務正常運作

### 6.4 資料庫備份

- [ ] 設定定時備份腳本

```bash
#!/bin/bash
# backup.sh
BACKUP_DIR=/backups/postgres
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
docker exec postgres pg_dump -U postgres quiz > $BACKUP_DIR/quiz_$TIMESTAMP.sql
# 保留最近 7 天
find $BACKUP_DIR -mtime +7 -delete
```

- [ ] 加入 crontab：`0 3 * * * /path/to/backup.sh`

---

## 附錄：技術疑問釐清

### JDBC / JPA / Hibernate / JPQL / Spring Data JPA 的關係

```
┌─────────────────────────────────────────────────┐
│                  你的程式碼                       │
│            (Repository / Service)                │
├─────────────────────────────────────────────────┤
│           Spring Data JPA                        │  ← 你目前在用的層級
│     (自動產生 CRUD，幾乎不用寫 SQL)               │
├─────────────────────────────────────────────────┤
│              JPA 規範                            │  ← Java 持久化 API「標準」
│        (定義 @Entity, EntityManager 等)          │
├─────────────────────────────────────────────────┤
│        Hibernate（JPA 的實作）                    │  ← 實際執行 ORM 的引擎
│     JPQL 是 Hibernate 支援的查詢語言              │
├─────────────────────────────────────────────────┤
│               JDBC                               │  ← 最底層，直接發 SQL 給資料庫
│         (Hibernate 底層也是用 JDBC)               │
└─────────────────────────────────────────────────┘
```

| 名詞                | 是 ORM 嗎？ | 說明                                                          |
| ------------------- | :---------: | ------------------------------------------------------------- |
| **JDBC**            |     ❌      | Java 資料庫連線的底層 API，要自己寫 SQL                       |
| **JPA**             |   ⚠️ 規範   | 只是一套「標準介面」，本身不做事                              |
| **Hibernate**       |     ✅      | JPA 的實作，真正的 ORM 引擎                                   |
| **JPQL**            |     ❌      | 物件導向的查詢語言（類似 SQL），是 JPA 的一部分               |
| **Spring Data JPA** |   ✅ 封裝   | 在 JPA/Hibernate 之上再封裝，讓你只需寫 `interface` 就有 CRUD |

**你目前的專案用的是 Spring Data JPA（最上層）**，它底下自動幫你整合了 JPA 規範 → Hibernate 實作 → JDBC 驅動 → PostgreSQL。你不需要自己碰 JDBC 或 Hibernate，除非遇到特殊需求。

---

## 建議執行順序

```
階段一（1-2 天）→ 階段二（3-5 天）→ 聯調測試（1 天）
    ↓
基礎功能完成，可以先部署一版
    ↓
階段五 5.1-5.3（1 天）→ 階段六（1-2 天）
    ↓
有了 CI/CD 和部署環境後，再開發進階功能
    ↓
階段三（3-5 天）→ 階段四（2-3 天）→ 階段五 5.4-5.5（0.5 天）
    ↓
全部完成 🎉
```

**預估總工時：12 - 19 天**（依個人熟悉度調整）
