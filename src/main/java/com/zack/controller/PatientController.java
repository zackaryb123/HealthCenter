package com.zack.controller;

import com.zack.model.Drug;
import com.zack.model.Patient;
import com.zack.service.DrugService;
import com.zack.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/patient")
public class PatientController {
    @Autowired
    PatientService patientService;
    @Autowired
    DrugService drugService;

    @RequestMapping("/modalAttr")
    public ModelAndView indexModalAttrs(){
        List<Drug> drugs = drugService.getDrugs();

        ModelAndView md = new ModelAndView("index");
        md.addObject("drugs", drugs);
        md.addObject("drug", new Drug());
        md.addObject("patient", new Patient());

        return md;
    }

    @RequestMapping("/edit")
    public ModelAndView indexModalAttrs(
            HttpServletRequest req, HttpServletResponse res
//            @ModelAttribute("patient") Patient patient
    ){
//        int id = patient.getId();
        int id = Integer.valueOf(req.getParameter("id"));
        System.out.println(id);
        ModelAndView md = new ModelAndView("editPatient");
        md.addObject("id", id);
        md.addObject("patient", new Patient());

        return md;
    }

    @RequestMapping("/update")
    public ModelAndView updateDrug(@ModelAttribute("patient") Patient patient) {
        try {
            patientService.updatePatient(patient);
            return new ModelAndView("editPatient", "msg", "Patient "+patient.getId()+" update successful");
        } catch (Exception e) {
            return new ModelAndView("editPatient", "error", e.getMessage());
        }
    }



    @RequestMapping(value = "/add",  method = RequestMethod.POST)
    public ModelAndView addDrug(@ModelAttribute("patient") Patient patient) {
        try {
            if (patientService.addPatient(patient) == patient.getId())
                return new ModelAndView("result", "msg", patient.getName()+" added successfully");
            else
                return new ModelAndView("error", "msg", "Drug already exist");
        } catch (Exception e) {
            return new ModelAndView("error", "msg", e.getMessage());
        }
    }

    @RequestMapping(value = "/view")
    public ModelAndView viewDrugs(){
        try{
            List<Patient> patients = patientService.getAllPatients();
            List<Drug> drugs = drugService.getDrugs();
            ModelAndView md = new ModelAndView("view");
            md.addObject("patients", patients);
            md.addObject("drugs", drugs);

            return md;
        } catch (Exception e){
            return new ModelAndView("error", "msg", e.getMessage());
        }
    }
}
