package com.zack.dao.jdbc;

import com.zack.dao.PatientDao;
import com.zack.model.Patient;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class JdbcPatientDao implements PatientDao {
    HibernateTemplate hibernateTemplate;

    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    @Override
    public int addPatient(Patient patient) {
        return (Integer) hibernateTemplate.save(patient);
    }

    @Override
    public List<Patient> getAllPatients() {
        return hibernateTemplate.find("from Patient");
    }

    @Override
    public Patient getPatientById(int id) {
        return hibernateTemplate.get(Patient.class, id);
    }

    @Override
    public void updatePatient(Patient patient) {
        hibernateTemplate.saveOrUpdate(patient);
    }
}
