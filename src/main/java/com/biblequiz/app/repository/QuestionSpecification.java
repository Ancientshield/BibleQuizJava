package com.biblequiz.app.repository;

import com.biblequiz.app.entity.AppUser;
import com.biblequiz.app.entity.Question;
import com.biblequiz.app.entity.QuestionOption;
import com.biblequiz.app.entity.QuestionStatus;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import jakarta.persistence.criteria.Subquery;
import org.springframework.data.jpa.domain.Specification;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/** 題目動態查詢 — 用 Criteria API 組合篩選條件，搭配 Pageable 分頁。 */
public class QuestionSpecification {

    private QuestionSpecification() {}

    /**
     * 組合所有篩選條件，null/空白的參數自動略過。
     * 選項和作者用子查詢避免 JOIN 造成重複列。
     */
    public static Specification<Question> withFilters(
            QuestionStatus status, Short categoryId,
            String keyword, String optionKeyword, String author,
            LocalDate dateFrom, LocalDate dateTo) {

        return (root, query, cb) -> {
            List<Predicate> predicates = new ArrayList<>();

            if (status != null) {
                predicates.add(cb.equal(root.get("status"), status));
            }

            if (categoryId != null) {
                predicates.add(cb.equal(root.get("category").get("id"), categoryId));
            }

            // 題目文字模糊搜尋
            if (keyword != null && !keyword.isBlank()) {
                predicates.add(cb.like(cb.lower(root.get("content")),
                        "%" + keyword.trim().toLowerCase() + "%"));
            }

            // 選項文字 — 子查詢找包含關鍵字的題目 ID
            if (optionKeyword != null && !optionKeyword.isBlank()) {
                Subquery<Integer> sub = query.subquery(Integer.class);
                Root<QuestionOption> optRoot = sub.from(QuestionOption.class);
                sub.select(optRoot.get("question").get("id"));
                sub.where(cb.like(cb.lower(optRoot.get("content")),
                        "%" + optionKeyword.trim().toLowerCase() + "%"));
                predicates.add(root.get("id").in(sub));
            }

            // 作者 — 子查詢比對暱稱或 email
            if (author != null && !author.isBlank()) {
                Subquery<Long> sub = query.subquery(Long.class);
                Root<AppUser> userRoot = sub.from(AppUser.class);
                sub.select(userRoot.get("id"));
                String pattern = "%" + author.trim().toLowerCase() + "%";
                sub.where(cb.or(
                        cb.like(cb.lower(userRoot.get("name")), pattern),
                        cb.like(cb.lower(userRoot.get("email")), pattern)));
                predicates.add(root.get("createdBy").in(sub));
            }

            // 日期區間（含頭含尾）
            if (dateFrom != null) {
                predicates.add(cb.greaterThanOrEqualTo(
                        root.get("createdAt"), dateFrom.atStartOfDay()));
            }
            if (dateTo != null) {
                predicates.add(cb.lessThan(
                        root.get("createdAt"), dateTo.plusDays(1).atStartOfDay()));
            }

            return cb.and(predicates.toArray(new Predicate[0]));
        };
    }
}
