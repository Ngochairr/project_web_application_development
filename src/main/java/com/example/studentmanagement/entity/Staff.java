package com.example.studentmanagement.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Entity
@Table(name = "staff")
@Data
public class Staff {
    @Id
    @Column(name = "staff_id")
    private String id;
    private String staff_name;
    @OneToMany(mappedBy = "staff")
    private List<Salary> salaries;
}


