package com.example.studentmanagement.dtos;

import lombok.Data;

@Data
public class SectionDTO {
    private String id;
    private String sec_id;
    private String sec_room;
    private String sec_class;
    private Integer sec_sweek;
    private Integer sec_eweek;
    private Integer sec_stime;
    private Integer sec_etime;
    private Integer sec_day;
    private String sec_name;
}
