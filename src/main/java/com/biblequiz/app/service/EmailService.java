package com.biblequiz.app.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService {

    private final JavaMailSender mailSender;

    @Value("${app.mail.from}")
    private String fromEmail;

    @Value("${app.base-url}")
    private String baseUrl;

    public EmailService(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    /** 發送 email 驗證信 */
    public void sendVerificationEmail(String to, String token) {
        String link = baseUrl + "/api/auth/verify?token=" + token;
        String subject = "BibleQuiz — 請驗證你的 Email";
        String body = """
                <div style="font-family: sans-serif; max-width: 480px; margin: 0 auto;">
                    <h2 style="color: #6366f1;">BibleQuiz Email 驗證</h2>
                    <p>感謝你註冊 BibleQuiz！請點擊下方按鈕完成 Email 驗證：</p>
                    <a href="%s"
                       style="display: inline-block; padding: 12px 24px; background: #6366f1;
                              color: #fff; text-decoration: none; border-radius: 8px;">
                        驗證 Email
                    </a>
                    <p style="margin-top: 16px; color: #666; font-size: 14px;">
                        或複製以下連結到瀏覽器：<br/>
                        <a href="%s">%s</a>
                    </p>
                    <p style="color: #999; font-size: 12px;">此連結 24 小時內有效。</p>
                </div>
                """.formatted(link, link, link);

        sendHtmlEmail(to, subject, body);
    }

    /** 發送密碼重設信（F-10 會用到） */
    public void sendPasswordResetEmail(String to, String token) {
        String link = baseUrl + "/reset-password?token=" + token;
        String subject = "BibleQuiz — 密碼重設";
        String body = """
                <div style="font-family: sans-serif; max-width: 480px; margin: 0 auto;">
                    <h2 style="color: #6366f1;">BibleQuiz 密碼重設</h2>
                    <p>你申請了密碼重設，請點擊下方按鈕設定新密碼：</p>
                    <a href="%s"
                       style="display: inline-block; padding: 12px 24px; background: #6366f1;
                              color: #fff; text-decoration: none; border-radius: 8px;">
                        重設密碼
                    </a>
                    <p style="margin-top: 16px; color: #666; font-size: 14px;">
                        或複製以下連結到瀏覽器：<br/>
                        <a href="%s">%s</a>
                    </p>
                    <p style="color: #999; font-size: 12px;">此連結 1 小時內有效。如果不是你本人操作，請忽略此信。</p>
                </div>
                """.formatted(link, link, link);

        sendHtmlEmail(to, subject, body);
    }

    private void sendHtmlEmail(String to, String subject, String htmlBody) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, "UTF-8");
            helper.setFrom(fromEmail);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(htmlBody, true);
            mailSender.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException("寄信失敗: " + e.getMessage(), e);
        }
    }
}
