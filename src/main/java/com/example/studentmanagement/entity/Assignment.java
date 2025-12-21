package com.example.studentmanagement.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Entity
@Table(name = "assignment")
@Data
public class Assignment {
    @Id
    private String idassignment;
    @ManyToOne
    @JoinColumn(name = "staff_id")
    private Staff staff;
    @ManyToOne
    @JoinColumn(name = "student_id")
    private Student student;
    @ManyToOne
    @JoinColumn(name = "section_id")
    private Section section;
    @Column(name = "subject_id")
    private String subjectId;
}