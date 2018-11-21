package com.zack.model;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "DRUG")
public class Drug {
    private String dname;
    private String instock;
    private String exp_date;
    private double price;

    @Id
    @Column(name = "DNAME")
    public String getDname() {
        return dname;
    }

    public void setDname(String name) {
        this.dname = name;
    }

    @Basic
    @Column(name = "INSTOCK")
    public String getInstock() {
        return instock;
    }

    public void setInstock(String instock) {
        this.instock = instock;
    }

    @Basic
    @Column(name = "EXP_DATE")
    public String getExp_date() {
        return exp_date;
    }

    public void setExp_date(String expDate) {
        this.exp_date = expDate;
    }

    @Basic
    @Column(name = "PRICE")
    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Drug drug = (Drug) o;
        return Double.compare(drug.price, price) == 0 &&
                Objects.equals(dname, drug.dname) &&
                Objects.equals(instock, drug.instock) &&
                Objects.equals(exp_date, drug.exp_date);
    }

    @Override
    public int hashCode() {
        return Objects.hash(dname, instock, exp_date, price);
    }
}
