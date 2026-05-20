package com.biblequiz.app.service;

import com.biblequiz.app.dto.QuizSubmitRequest;
import com.biblequiz.app.entity.AppUser;
import com.biblequiz.app.entity.QuestionOption;
import com.biblequiz.app.entity.QuizAnswerLog;
import com.biblequiz.app.entity.QuizRound;
import com.biblequiz.app.repository.AppUserRepository;
import com.biblequiz.app.repository.QuestionOptionRepository;
import com.biblequiz.app.repository.QuizRoundRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;

/** 作答紀錄 Service — 接收前端整局結果，寫入 quiz_round + quiz_answer_log。 */
@Service
public class QuizRoundService {

    private final QuizRoundRepository quizRoundRepository;
    private final QuestionOptionRepository questionOptionRepository;
    private final AppUserRepository appUserRepository;

    public QuizRoundService(QuizRoundRepository quizRoundRepository,
                            QuestionOptionRepository questionOptionRepository,
                            AppUserRepository appUserRepository) {
        this.quizRoundRepository = quizRoundRepository;
        this.questionOptionRepository = questionOptionRepository;
        this.appUserRepository = appUserRepository;
    }

    /**
     * 儲存一局遊戲結果。
     * 後端自行判斷 isCorrect（從 DB 查選項的 is_correct），不信任前端傳的 score。
     */
    @Transactional
    public QuizRound submitQuiz(Long userId, QuizSubmitRequest request) {
        return submitQuiz(userId, request, false);
    }

    /**
     * 儲存一局遊戲結果（可指定是否為匿名訪客）。
     * 匿名 (isGuest=true) 走 guest sentinel user id,但不累加 total_score,避免 sentinel 積分被灌爆。
     */
    @Transactional
    public QuizRound submitQuiz(Long userId, QuizSubmitRequest request, boolean isGuest) {
        List<QuizSubmitRequest.AnswerEntry> answers = request.getAnswers();
        if (answers == null || answers.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "作答紀錄不能為空");
        }

        // 後端重新計算分數，不信任前端
        int correctCount = 0;
        List<QuizAnswerLog> logs = new ArrayList<>();

        for (QuizSubmitRequest.AnswerEntry entry : answers) {
            QuestionOption option = questionOptionRepository.findById(entry.getSelectedOptionId())
                    .orElseThrow(() -> new ResponseStatusException(HttpStatus.BAD_REQUEST, "選項不存在：" + entry.getSelectedOptionId()));

            boolean isCorrect = Boolean.TRUE.equals(option.getIsCorrect());
            if (isCorrect) correctCount++;

            QuizAnswerLog log = new QuizAnswerLog();
            log.setQuestionId(entry.getQuestionId());
            log.setSelectedOptionId(entry.getSelectedOptionId());
            log.setIsCorrect(isCorrect);
            logs.add(log);
        }

        QuizRound round = new QuizRound();
        round.setUserId(userId);
        round.setScore(correctCount);
        round.setTotalQuestions(answers.size());

        // 設定雙向關聯後一次存（CascadeType.ALL）
        for (QuizAnswerLog log : logs) {
            log.setRound(round);
        }
        round.setAnswerLogs(logs);

        QuizRound saved = quizRoundRepository.save(round);

        // 累加總積分（答對題數 × 10）— guest sentinel 不累加,避免被灌成天文數字
        if (!isGuest) {
            AppUser user = appUserRepository.findById(userId).orElse(null);
            if (user != null) {
                user.setTotalScore(user.getTotalScore() + (long) correctCount * 10);
                appUserRepository.save(user);
            }
        }

        return saved;
    }
}
