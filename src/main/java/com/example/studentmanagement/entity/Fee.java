package com.example.studentmanagement.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Entity
@Table(name = "fee")
@Data
public class Fee {
    @Id
    @Column(name = "fee_id")
    private String feeId;
    @Column(name = "name")
    private String name;
    @ManyToOne
    @JoinColumn(name = "student_id")
    private Student student;
    @Column(name = "expiration")
    private LocalDateTime expiration;
    @Column(name = "paid")
    private Integer paid;
}
