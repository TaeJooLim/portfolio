package com.portfolio.erp.controller.admin.company;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.company.CompanyVO;
import com.portfolio.erp.service.admin.company.CompanySrv;

@Controller
public class CompanyCtr {
	
	@Autowired
	CompanySrv companySrv;
	
	@RequestMapping(value="/admin/company", method = RequestMethod.GET)
	public ModelAndView getCompanyInfo() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("company", companySrv.getCompanyInfo());
		mav.setViewName("erp/admin/erp_company/company_info");
		
		return mav;
	}
	
	@RequestMapping(value="/admin/company", method = RequestMethod.POST)
	public String setCompanyInfo(@ModelAttribute CompanyVO cvo) {

		companySrv.setCompanyInfo(cvo);
		
		return "redirect:/admin/company";
	}

}
