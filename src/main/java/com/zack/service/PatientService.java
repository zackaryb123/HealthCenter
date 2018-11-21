package com.zack.service;

import com.zack.model.Patient;

import java.util.List;

public interface PatientService {
    int addPatient(Patient patient);

    List<Patient> getAllPatients();

    Patient getPatientById(int id);

    void updatePatient(Patient patient);
}
