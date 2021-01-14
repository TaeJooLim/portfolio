package com.portfolio.erp.controller.user.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.model.paging.PagingVO;
import com.portfolio.erp.service.admin.employee.EmpSrv;
import com.portfolio.erp.service.common.CommonSrv;
import com.portfolio.erp.service.regnlog.RegnlogSrv;

@Controller
@RequestMapping("/user")
public class UserEmployeeCtr {
	
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
		mav.setViewName("erp/user/erp_employee/employee_register");
		
		return mav;
	}
	
	@RequestMapping(value="/employee_register", method = RequestMethod.POST)	
	public String setEmployeeReg(@ModelAttribute EmployeeVO evo) {
		
		empSrv.setEmpDetail(evo);
		
		return "redirect:/user/employee_list";
	}
	
	@RequestMapping("/employee_list")
	public ModelAndView getEmployeeList(@RequestParam(defaultValue="emp_name") String searchOpt, 
										@RequestParam(defaultValue="") String words, 
										@RequestParam(defaultValue="1") int curPage) {
		ModelAndView mav = new ModelAndView();
		
		// 검색된 갯수
		int listCnt = empSrv.getEmpCount(searchOpt, words);
		
		// 페이징처리
		PagingVO pagingvo = new PagingVO(listCnt, curPage);
		
		// 입력한 페이지번호에 따라서 시작번호가 바뀜
		int startIndex = pagingvo.getStartIndex();
		int pageSize = pagingvo.getPageSize();
		
		List<EmployeeVO> list = empSrv.getEmployeeList(searchOpt, words, startIndex, pageSize);
		
		mav.addObject("listCnt", listCnt);
		mav.addObject("list", list);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		mav.addObject("pagingvo", pagingvo);
		
		mav.setViewName("erp/user/erp_employee/employee_list");
		return mav;
	}
	
	// organization_chart
	@RequestMapping("/organization_chart")
	public ModelAndView getOrganization(@RequestParam(defaultValue="emp_name") String searchOpt, 
										@RequestParam(defaultValue="") String words, 
										@RequestParam String empDepartment,
										@RequestParam(defaultValue="1") int curPage) {
		ModelAndView mav = new ModelAndView();
		
		List<EmployeeVO> dList = commonSrv.getDepartmentList();
		
		int listCnt = empSrv.getCntOrganization(searchOpt, words, empDepartment);
		
		// 페이징처리
		PagingVO pagingvo = new PagingVO(listCnt, curPage);
		
		// 입력한 페이지번호에 따라서 시작번호가 바뀜
		int startIndex = pagingvo.getStartIndex();
		int pageSize = pagingvo.getPageSize();		
		
		/*부서코드 별 Select employeeList*/
		List<EmployeeVO> list = empSrv.getEmpOrganization(searchOpt, words, empDepartment, startIndex, pageSize);

		
		mav.addObject("list", list);
		mav.addObject("empDepartment", empDepartment);
		mav.addObject("departName", commonSrv.getDepartmentOne(empDepartment));
		mav.addObject("dList", dList);
		mav.addObject("listCnt", listCnt);
		mav.addObject("pagingvo", pagingvo);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		mav.setViewName("erp/user/erp_employee/organization_chart");
		return mav;
	}

}
