package com.zack.dao;

import com.zack.model.Patient;

import java.util.List;

public interface PatientDao {
    int addPatient(Patient patient);

    List<Patient> getAllPatients();

    Patient getPatientById(int id);

    void updatePatient(Patient patient);
}
