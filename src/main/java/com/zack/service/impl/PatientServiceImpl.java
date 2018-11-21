package com.zack.service.impl;

import com.zack.dao.PatientDao;
import com.zack.model.Patient;
import com.zack.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PatientServiceImpl implements PatientService {

    @Autowired
    PatientDao patientDao;

    @Override
    @Transactional
    public int addPatient(Patient patient) {
        return patientDao.addPatient(patient);
    }

    @Override
    @Transactional
    public List<Patient> getAllPatients() {
        return patientDao.getAllPatients();
    }

    @Override
    @Transactional
    public Patient getPatientById(int id) {
        return patientDao.getPatientById(id);
    }

    @Override
    @Transactional
    public void updatePatient(Patient patient) {
        patientDao.updatePatient(patient);
    }
}
