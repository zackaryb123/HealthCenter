package com.zack.service.impl;

import com.zack.dao.DrugDao;
import com.zack.model.Drug;
import com.zack.service.DrugService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DrugServiceImpl implements DrugService {

    @Autowired
    DrugDao drugDao;

    @Override
    @Transactional
    public String addDrug(Drug drug) {
        return drugDao.addDrug(drug);
    }

    @Override
    @Transactional
    public List<Drug> getDrugs() {
        return drugDao.getDrugs();
    }

    @Override
    @Transactional
    public Drug getDrugById(String name) {
        return drugDao.getDrugById(name);
    }

    @Override
    @Transactional
    public void updateDrug(Drug drug) {
        drugDao.updateDrug(drug);
    }
}
