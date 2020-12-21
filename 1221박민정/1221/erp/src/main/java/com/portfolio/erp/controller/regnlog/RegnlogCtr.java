package com.portfolio.erp.controller.regnlog;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.service.regnlog.RegnlogSrv;

@Controller
public class RegnlogCtr {

	@Autowired
	RegnlogSrv regnlogSrv;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegister() {
		return "erp/regnlog/registerForm";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public String getRegister(@ModelAttribute EmployeeVO evo) {

		evo.setEmpName(evo.getEmpName().trim());
		evo.setEmpEmail(evo.getEmpEmail().trim());

		String eYear	= evo.getEmpEnter().substring(2, 4);
		String eMonth	= evo.getEmpEnter().substring(5, 7);
		evo.setEmpNum(eYear + eMonth + evo.getEmpDepartment());
		System.out.println("사원번호: " + evo.getEmpNum());

		String pYear	= evo.getEmpBirth().substring(0, 4);
		String pMonth	= evo.getEmpBirth().substring(5, 7);
		String pDay		= evo.getEmpBirth().substring(8, 10);
		evo.setEmpPassword(pYear + pMonth + pDay);
		System.out.println("초기비밀번호(생년월일8자리) : " + evo.getEmpPassword());
		
		System.out.println("입사년도 : " + eYear + " | 입사월 : " + eMonth + " | 생년월일 : " + evo.getEmpBirth());
		System.out.println("사원명 : " + evo.getEmpName());

		regnlogSrv.setEmpOne(evo);
		
		return "erp/regnlog/registerForm";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLogin() {
		return "erp/regnlog/loginForm";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginChk(@ModelAttribute EmployeeVO evo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int result = regnlogSrv.loginChk(evo, session);
		String msg = "";
		mav.setViewName("erp/regnlog/loginForm");

		if (result == 0) {
			mav.addObject("msg", "로그인성공");
			msg = "로그인성공";
			mav.setViewName("erp/admin/admin_main");
		} else if (result == 1) {
			mav.addObject("msg", "가입승인 대기중");
			msg = "가입승인 대기중";
		} else {
			mav.addObject("msg", "아이디 비밀번호 불일치");
			msg = "아이디 비밀번호 불일치";
		}
		System.out.println(result + " = " + msg);
		return mav;
	}

	@RequestMapping("/getDepartmentList")
	@ResponseBody
	public List<EmployeeVO> getDepartmentList() {
		List<EmployeeVO> list = regnlogSrv.getDepartmentList();
		return list;
	}

	@RequestMapping("/getPositionList")
	@ResponseBody
	public List<EmployeeVO> getPositionList() {
		List<EmployeeVO> list = regnlogSrv.getPositionList();
		return list;
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		regnlogSrv.logout(session);
		return "erp/regnlog/loginForm";
	}
}