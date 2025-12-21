package com.example.studentmanagement.entity;

import jakarta.persistence.*;
import lombok.Data;


@Entity
@Table(name = "salary")
@Data
public class Salary {
    @Id
    @Column(name = "idsalary")
    private Integer idsalary;

    @ManyToOne
    @JoinColumn(name = "staff_id")
    private Staff staff;

    @Column(name = "amount")
    private Integer amount;

    @Column(name = "payment_date")
    private Integer paymentDate;
}