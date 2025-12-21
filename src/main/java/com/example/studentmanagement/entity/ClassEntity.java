package com.example.studentmanagement.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "class")
public class ClassEntity {
    @Id
    @Column(name = "idclass", length = 4)
    private String idclass;
    @Column(nullable = false, length = 45)
    private String name;
    public String getIdclass() { return idclass; }
    public void setIdclass(String idclass) { this.idclass = idclass; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
}
