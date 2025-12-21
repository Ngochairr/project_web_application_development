package com.example.studentmanagement.dtos;

import com.example.studentmanagement.entity.Student;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
public class FeeDTO {
    private String id;
    private String feeID;
    private String fee_student;
    private String FeeStudent;
    private String fee_name;
    private String fee_expiration;
    private Boolean fee_paid;
}