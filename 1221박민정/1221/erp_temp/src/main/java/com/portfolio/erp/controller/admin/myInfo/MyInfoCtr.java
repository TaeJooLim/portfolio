package com.portfolio.erp.controller.admin.myInfo;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyInfoCtr {
	
	// my_info : 해당 세션 사원의 정보를 뷰에 뿌림
	@RequestMapping(value = "/admin/my_info", method = RequestMethod.GET)
	public ModelAndView getMyInfo(HttpSession session) {
		String sessionEmpId = (String) session.getAttribute("empId");
		System.out.println(sessionEmpId);
		
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("erp/admin/erp_myinfo/my_info");
		return mav;
	}
}
