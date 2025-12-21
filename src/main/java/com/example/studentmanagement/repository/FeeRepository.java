package com.example.studentmanagement.repository;

import com.example.studentmanagement.entity.Fee;
import com.example.studentmanagement.entity.Student;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.*;

@Repository
public interface FeeRepository extends JpaRepository<Fee, String> {
    List<Fee> findByStudentRollAndPaid(Integer roll, Integer paid);
}
