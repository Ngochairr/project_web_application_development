package com.example.studentmanagement.dtos;

import jakarta.validation.constraints.*;
import lombok.Data;


@Data
public class SalaryDTO {
    private Integer id;
    private String salary_id;
    private String salary_staff;
    private Double salary_amount;
    private String salary_date;
}
