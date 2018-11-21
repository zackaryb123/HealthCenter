package com.zack.dao;

import com.zack.model.Drug;

import java.util.List;

public interface DrugDao {
    String addDrug(Drug drug);

    List<Drug> getDrugs();

    Drug getDrugById(String name);

    void updateDrug(Drug drug);
}
