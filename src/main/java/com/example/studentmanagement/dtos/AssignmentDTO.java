package com.example.studentmanagement.dtos;

import jakarta.validation.constraints.*;
import lombok.Getter;

public class AssignmentDTO {
    @NotNull
    @Getter
    private Long staffId;

    @NotNull
    @Getter
    private Long subjectId;

    @NotNull
    @Getter
    private Long sectionId;
}
