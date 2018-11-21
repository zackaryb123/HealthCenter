package com.zack.dao.jdbc;

import com.zack.dao.DrugDao;
import com.zack.model.Drug;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class JdbcDrugDao implements DrugDao {
    HibernateTemplate hibernateTemplate;

    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    @Override
    public String addDrug(Drug drug) {
        return (String) hibernateTemplate.save(drug);
    }

    @Override
    public List<Drug> getDrugs() {
        return hibernateTemplate.find("from Drug");
    }

    @Override
    public Drug getDrugById(String name) {
        return hibernateTemplate.get(Drug.class, name);
    }

    @Override
    public void updateDrug(Drug drug) {
        hibernateTemplate.saveOrUpdate(drug);
    }
}
