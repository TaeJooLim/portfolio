package com.portfolio.erp.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.service.admin.employee.EmpSrv;

@Controller
public class MainCtr {

	@Autowired
	EmpSrv empSrv;
	
	@RequestMapping("/admin_main")
	public ModelAndView getMain(@RequestParam(defaultValue="confirm") String admin_main) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("confirmList", empSrv.getEmployeeList("emp_name", ""));
		mav.setViewName("erp/admin/admin_main");
		
		return mav;
	}
}
