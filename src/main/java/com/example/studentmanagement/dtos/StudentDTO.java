package com.example.studentmanagement.dtos;

import lombok.Data;


import java.util.List;
@Data
public class StudentDTO {
    private Integer id;
    private Integer roll;
    private String fullName;
    private String studentClass;
    private List<AssignmentInfo> schedules;
    @Data
    public static class AssignmentInfo {
        private String subjectName;
        private String roomName;
        private String teacherName;
        private String dayOfWeek;
    }
}
