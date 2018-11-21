package com.zack.service;

import com.zack.model.Drug;

import java.util.List;

public interface DrugService {
    String addDrug(Drug drug);

    List<Drug> getDrugs();

    Drug getDrugById(String name);

    void updateDrug(Drug drug);
}
