package com.example.studentmanagement.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "room")
public class Room {
    @Id
    @Column(name = "idroom", length = 4)
    private String idroom;
    @Column(nullable = false, length = 45)
    private String name;
    public String getIdroom() { return idroom; }
    public void setIdroom(String idroom) { this.idroom = idroom; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
}
