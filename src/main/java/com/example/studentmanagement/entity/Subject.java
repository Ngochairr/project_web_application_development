package com.example.studentmanagement.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;


@Entity
public class Subject {
    @Id
    @Column(name = "idsubject", length = 4)
    private String id;

    @Column(nullable = false, length = 45)
    private String name;
}
