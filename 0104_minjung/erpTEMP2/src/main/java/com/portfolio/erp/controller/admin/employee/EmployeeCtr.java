package com.portfolio.erp.controller.admin.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.service.admin.employee.EmpSrv;
import com.portfolio.erp.service.common.CommonSrv;
import com.portfolio.erp.service.regnlog.RegnlogSrv;

@Controller
@RequestMapping("/admin")
public class EmployeeCtr {
	
	@Autowired
	EmpSrv empSrv;
	
	@Autowired
	RegnlogSrv regnlogSrv;
	
	@Autowired
	CommonSrv commonSrv;
	
	@RequestMapping(value="/employee_register", method = RequestMethod.GET)
	public ModelAndView getEmployeeReg(@ModelAttribute EmployeeVO evo, @RequestParam int empId) {
		
		EmployeeVO empvo = empSrv.getEmployeeOne(empId);
		
		List<EmployeeVO> pList = commonSrv.getPositionList();
	    List<EmployeeVO> dList = commonSrv.getDepartmentList();
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pList", pList);
		mav.addObject("dList", dList);
		mav.addObject("employee", empvo);
		mav.setViewName("erp/admin/erp_employee/employee_register");
		
		return mav;
	}
	
	@RequestMapping(value="/employee_register", method = RequestMethod.POST)	
	public String setEmployeeReg(@ModelAttribute EmployeeVO evo) {
		
		empSrv.setEmpDetail(evo);
		
		return "redirect:/admin/employee_list";
	}
	
	@RequestMapping("/employee_list")
	public ModelAndView getEmployeeList(@RequestParam(defaultValue="emp_name") String searchOpt, 
										@RequestParam(defaultValue="") String words) {
		ModelAndView mav = new ModelAndView();
		
		int count = empSrv.getEmpCount(searchOpt, words);
		List<EmployeeVO> list = empSrv.getEmployeeList(searchOpt, words);
				
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.setViewName("erp/admin/erp_employee/employee_list");
		
		return mav;
	}
	
	@RequestMapping("/head_change")
	@ResponseBody
	public String headChange(@RequestParam String headType, @RequestParam String empNum) {
		//System.out.println(headType);
		//System.out.println(empNum);
		empSrv.headChange(headType, empNum);
		return "success";
	}
	
	@RequestMapping("/confirm_change")
	@ResponseBody
	public String confirmChange(@RequestParam String confirmType, @RequestParam String empNum) {
		//System.out.println(confirmType);
		System.out.println(empNum);
		empSrv.confirmChange(confirmType, empNum);
		return "success";
	}
	
	@RequestMapping("/employee_delete")
	@ResponseBody
	public String setEmployeeDelete(@RequestParam int empId) {
		System.out.println(empId);
		empSrv.setEmployeeDelete(empId);
		return "success";
	}
	
	@RequestMapping("/auth_change")
	@ResponseBody
	public String authChange(@RequestParam int auth, @RequestParam int empId) {
		
		empSrv.authChange(auth, empId);
		return "success";
	}

}
