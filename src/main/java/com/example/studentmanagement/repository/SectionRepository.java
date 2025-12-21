package com.example.studentmanagement.repository;

import com.example.studentmanagement.entity.Section;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SectionRepository extends JpaRepository<Section,String> {
    Page<Section> findByNameContaining(String name, Pageable pageable);
}
