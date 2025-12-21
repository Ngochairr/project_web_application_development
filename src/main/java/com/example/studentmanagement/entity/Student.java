package com.example.studentmanagement.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "student")
public class Student {
    @Id
    @Column(name = "roll_no")
    @Getter
    @Setter
    private Integer roll;

    @Column(name = "name")
    @Getter
    @Setter
    private String fullName;

    public Integer getId() {
        return this.roll;
    }

}
