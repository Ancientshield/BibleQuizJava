package com.biblequiz.app.repository;

import com.biblequiz.app.entity.BibleBook;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BibleBookRepository extends JpaRepository<BibleBook, Short> {
}
