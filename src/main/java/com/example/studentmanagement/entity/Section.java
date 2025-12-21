package com.example.studentmanagement.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "section")
@Data
public class Section {
    @Id
    @Column(name = "idsection")
    private String id;

    @Column(name = "name")
    private String name;

    @Column(name = "room_id")
    private String roomId; // FK

    @Column(name = "class_id")
    private String classId; // FK to class table

    @Column(name = "start_week")
    private Integer startWeek;

    @Column(name = "end_week")
    private Integer endWeek;

    @Column(name = "start_time")
    private Integer startTime;

    @Column(name = "end_time")
    private Integer endTime;

    @Column(name = "day")
    private Integer day;
}
