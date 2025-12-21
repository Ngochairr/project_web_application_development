package com.example.studentmanagement.repository;

import com.example.studentmanagement.dtos.TimetableDTO;
import com.example.studentmanagement.entity.Assignment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.*;

@Repository
public interface AssignmentRepository extends JpaRepository<Assignment, String> {
    @Query("SELECT new com.yourpackage.dto.TimetableDTO(" +
            "sec.day, sec.startTime, sec.endTime, sec.startWeek, sec.endWeek, " +
            "sec.roomId, a.subjectId, stf.staff_name, sec.name, sec.classId) " +
            "FROM Assignment a " +
            "JOIN a.section sec " +
            "JOIN a.staff stf " +
            "WHERE a.student.roll = :studentId")
    List<TimetableDTO> getTimetableForStudent(@Param("studentId") Integer studentId);
}
