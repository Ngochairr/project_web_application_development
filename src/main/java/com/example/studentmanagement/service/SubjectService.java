package com.example.studentmanagement.service;

import com.example.studentmanagement.entity.Subject;
import com.example.studentmanagement.repository.SubjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubjectService {
    @Autowired private SubjectRepository subjectRepo;

    public void saveSubject(String name) {
        Subject subject = new Subject();
        subject.setName(name);
        subjectRepo.save(subject);
    }

    public List<Subject> getAll() {
        return subjectRepo.findAll();
    }
}
