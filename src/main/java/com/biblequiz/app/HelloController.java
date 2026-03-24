package com.biblequiz.app;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/** 煙霧測試 — 確認 Spring Boot 有成功啟動 */
@RestController
public class HelloController {

    /** GET /hello → 回傳固定字串 */
    @GetMapping("/hello")
    public String hello() {
        return "Hello, BibleQuiz!";
    }
}