package com.portfolio.erp.controller.admin.myInfo;

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
import com.portfolio.erp.service.admin.myInfo.MyInfoSrv;
import com.portfolio.erp.service.common.CommonSrv;

@Controller
public class MyInfoCtr {
	@Autowired
	MyInfoSrv myInfoSrv;
	
	@Autowired
	CommonSrv commonSrv;
	
	@Autowired
	EmpSrv empSrv;
	
	// 사용자의 내정보관리
	@RequestMapping(value = "/admin/my_info", method = RequestMethod.GET)
	public ModelAndView getMyInfo(@ModelAttribute EmployeeVO evo) {
		ModelAndView mav = new ModelAndView();
		
		List<EmployeeVO> pList = commonSrv.getPositionList();
	    List<EmployeeVO> dList = commonSrv.getDepartmentList();
		EmployeeVO myInfo = myInfoSrv.getMyInfo(evo); // 내정보(employee&detail)
		
	    List<EmployeeVO> coworker = myInfoSrv.getCoworker(myInfo);
	    
		// EmployeeVO vo = myInfoSrv.getMyDepart(evo); // 내부서이름
		
		mav.addObject("pList",	pList);
		mav.addObject("dList",	dList);
		mav.addObject("myInfo", myInfo);
		mav.addObject("coworker",coworker);
		mav.setViewName("erp/admin/erp_myinfo/my_info");
		
		return mav;
	}
	
	@RequestMapping(value = "/admin/my_info", method = RequestMethod.POST)
	public String setMyInfo(@ModelAttribute EmployeeVO evo) {
		myInfoSrv.setMyInfo(evo);
		return "redirect:/admin/my_info?empId="+evo.getEmpId();
	}
	
	@RequestMapping("/admin/check_pwd")
	@ResponseBody
	public String checkPwd(@RequestParam String pwd, @RequestParam String empNum) {
		String msg;
		// 비밀번호 정규식 = 영문소문자 최소 1게 && 숫자 최소 1개 && 8~20자 이내
		String regExp = "^(?=.*[a-z])(?=.*[0-9]).{8,20}$";
		boolean result = pwd.matches(regExp);
		if ( result == true ) {
			myInfoSrv.updatePwd(pwd, empNum);
			msg = "success";
			return msg;
		}else {
			msg = "failure";
			return msg;
		}
	}
}