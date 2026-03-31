package com.biblequiz.app.exception;

import com.biblequiz.app.dto.ErrorResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.server.ResponseStatusException;

/**
 * 全域例外處理 — 攔截所有 Controller 拋出的例外，回傳統一 JSON 格式。
 * 取代各 Controller 裡的手動 try-catch。
 */
@RestControllerAdvice
public class GlobalExceptionHandler {

    private static final Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    /** ResponseStatusException — QuestionService 等已經用這個拋 400/403/404 */
    @ExceptionHandler(ResponseStatusException.class)
    public ResponseEntity<ErrorResponse> handleResponseStatus(ResponseStatusException ex) {
        HttpStatus status = HttpStatus.valueOf(ex.getStatusCode().value());
        ErrorResponse body = new ErrorResponse(
                status.value(), status.getReasonPhrase(), ex.getReason());
        return ResponseEntity.status(status).body(body);
    }

    /** IllegalArgumentException → 400 Bad Request */
    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<ErrorResponse> handleIllegalArgument(IllegalArgumentException ex) {
        ErrorResponse body = new ErrorResponse(
                400, "Bad Request", ex.getMessage());
        return ResponseEntity.badRequest().body(body);
    }

    /** AccessDeniedException → 403 Forbidden（Spring Security 權限不足時拋出） */
    @ExceptionHandler(AccessDeniedException.class)
    public ResponseEntity<ErrorResponse> handleAccessDenied(AccessDeniedException ex) {
        ErrorResponse body = new ErrorResponse(
                403, "Forbidden", "權限不足");
        return ResponseEntity.status(HttpStatus.FORBIDDEN).body(body);
    }

    /** 兜底：未預期的例外 → 500 Internal Server Error */
    @ExceptionHandler(Exception.class)
    public ResponseEntity<ErrorResponse> handleGeneral(Exception ex) {
        log.error("未預期的錯誤", ex);
        ErrorResponse body = new ErrorResponse(
                500, "Internal Server Error", "伺服器內部錯誤");
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(body);
    }
}
