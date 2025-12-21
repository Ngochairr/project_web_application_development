package com.example.studentmanagement.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class TimetableDTO {
    private Integer day;
    private Integer startTime;
    private Integer endTime;
    private Integer startWeek;
    private Integer endWeek;
    private String room_name;
    private String subject;
    private String teacherName;
    private String sectionname;
    private String classname;
}
