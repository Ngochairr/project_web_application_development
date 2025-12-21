package com.example.studentmanagement.service;

import com.example.studentmanagement.dtos.StudentDTO;
import com.example.studentmanagement.entity.Student;
import com.example.studentmanagement.repository.SectionRepository;
import com.example.studentmanagement.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.*;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class StudentService {
    @Autowired private StudentRepository studentRepo;

    public StudentDTO getById(Integer roll) {
        Student s = studentRepo.findById(roll)
                .orElseThrow(() -> new RuntimeException("Student not found"));
        return mapToDTO(s);
    }

    public List<StudentDTO> getAll() {
        return studentRepo.findAll().stream().map(this::mapToDTO).collect(Collectors.toList());
    }

    public void saveStudent(StudentDTO dto) {
        Student student = studentRepo.findById( (dto.getRoll() != null ? dto.getRoll() : -1))
                .orElse(new Student());

        student.setRoll(dto.getRoll());
        student.setFullName(dto.getFullName());
        studentRepo.save(student);
    }

    public void deleteStudent(Integer roll) {
        studentRepo.deleteById(roll);
    }

    public Page<StudentDTO> search(String keyword, int page, int size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("fullName").ascending());
        return studentRepo.findByFullNameContaining(keyword, pageable)
                .map(this::mapToDTO);
    }

    public Page<StudentDTO> getPaginated(int page, int size, String sortBy, String order) {
        // Fix: Map the JSP field "roll" to the Java field "roll" or "roll_no"
        String sortField = sortBy.equals("roll") ? "roll" : sortBy;

        Sort sort = order.equalsIgnoreCase("desc") ?
                Sort.by(sortField).descending() : Sort.by(sortField).ascending();

        return studentRepo.findAll(PageRequest.of(page, size, sort))
                .map(this::mapToDTO);
    }

    private StudentDTO mapToDTO(Student s) {
        StudentDTO dto = new StudentDTO();
        dto.setId(s.getRoll());
        dto.setRoll(s.getRoll());
        dto.setFullName(s.getFullName());
        return dto;
    }
}