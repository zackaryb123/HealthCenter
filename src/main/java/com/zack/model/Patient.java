package com.zack.model;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "PATIENT")
public class Patient {
    private int id;
    private String name;
    private String type;
    private String category;
    private int days;
    private String xrays;
    private String scanning;

    @Id
    @Column(name = "ID")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "NAME")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "TYPE")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "CATEGORY")
    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Basic
    @Column(name = "DAYS")
    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
    }

    @Basic
    @Column(name = "XRAYS")
    public String getXrays() {
        return xrays;
    }

    public void setXrays(String xrays) {
        this.xrays = xrays;
    }

    @Basic
    @Column(name = "SCANNING")
    public String getScanning() {
        return scanning;
    }

    public void setScanning(String scanning) {
        this.scanning = scanning;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Patient patient = (Patient) o;
        return Objects.equals(id, patient.id) &&
                Objects.equals(name, patient.name) &&
                Objects.equals(type, patient.type) &&
                Objects.equals(category, patient.category) &&
                Objects.equals(days, patient.days) &&
                Objects.equals(xrays, patient.xrays) &&
                Objects.equals(scanning, patient.scanning);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, type, category, days, xrays, scanning);
    }
}
