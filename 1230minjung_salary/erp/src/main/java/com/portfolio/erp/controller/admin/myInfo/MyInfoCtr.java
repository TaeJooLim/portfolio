package com.portfolio.erp.controller.admin.myInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.service.admin.employee.EmpSrv;
import com.portfolio.erp.service.admin.myInfo.MyInfoSrv;
import com.portfolio.erp.service.regnlog.RegnlogSrv;

@Controller
public class MyInfoCtr {
	@Autowired
	MyInfoSrv myInfoSrv;
	
	@Autowired
	RegnlogSrv regnlogSrv;
	
	@Autowired
	EmpSrv empSrv;
	
	// 사용자의 내정보관리
	@RequestMapping(value = "/admin/my_info", method = RequestMethod.GET)
	public ModelAndView getMyInfo(@ModelAttribute EmployeeVO evo) {
		ModelAndView mav = new ModelAndView();
		
		List<EmployeeVO> pList = regnlogSrv.getPositionList();
	    List<EmployeeVO> dList = regnlogSrv.getDepartmentList();
		EmployeeVO myInfo = myInfoSrv.getMyInfo(evo); // 내정보(employee&detail)
		EmployeeVO vo = myInfoSrv.getMyDepart(evo); // 내부서이름
		
		mav.addObject("pList", pList);
		mav.addObject("dList", dList);
		mav.addObject("myInfo", myInfo);
		mav.addObject("depart", vo);
		mav.setViewName("erp/admin/erp_myinfo/my_info");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/my_info", method = RequestMethod.POST)
	public String setMyInfo(@ModelAttribute EmployeeVO evo) {
		myInfoSrv.setMyInfo(evo);
		return "redirect:/admin/my_info?empId="+evo.getEmpId();
	}
}