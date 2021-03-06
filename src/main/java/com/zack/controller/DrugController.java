package com.zack.controller;

import com.zack.model.Drug;
import com.zack.model.Patient;
import com.zack.service.DrugService;
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
@RequestMapping("/drug")
public class DrugController {

    @Autowired
    DrugService drugService;


    @RequestMapping("/edit")
    public ModelAndView indexModalAttrs(
            HttpServletRequest req, HttpServletResponse res
//            @ModelAttribute("drug") Drug drug
    ){
//        String name = drug.getDname();
        String name = req.getParameter("dname");
        ModelAndView md = new ModelAndView("editDrug");
        md.addObject("dname", name);
        md.addObject("drug", new Drug());

        return md;
    }

    @RequestMapping("/update")
    public ModelAndView updateDrug(@ModelAttribute("drug") Drug drug) {
        try {
            drugService.updateDrug(drug);
            return new ModelAndView("editDrug", "msg", "Drug "+drug.getDname()+" update successful");
        } catch (Exception e) {
            return new ModelAndView("editDrug", "error", e.getMessage());
        }
    }



    @RequestMapping(value = "/add",  method = RequestMethod.POST)
    public ModelAndView addDrug1(@ModelAttribute("drug") Drug drug) {
        List<Drug> drugs = drugService.getDrugs();
        try {
            if (drugService.addDrug(drug).equals(drug.getDname())){
                ModelAndView mv = new ModelAndView("index");
                mv.addObject("addDrug", drug.getDname()+" added successfully");
                mv.addObject("drug", new Drug());
                mv.addObject("patient", new Patient());
                mv.addObject("drugs", drugs);
                return mv;
            } else{
                ModelAndView mv = new ModelAndView("index");
                mv.addObject( "addDrugErr", "Drug already exist");
                mv.addObject("drug", new Drug());
                mv.addObject("patient", new Patient());
                mv.addObject("drugs", drugs);
                return mv;
            }
        } catch (Exception e) {
            ModelAndView mv = new ModelAndView("index");
            mv.addObject("addDrugErr", e.getMessage());
            mv.addObject("drug", new Drug());
            mv.addObject("patient", new Patient());
            mv.addObject("drugs", drugs);
            return mv;
        }
    }


}
