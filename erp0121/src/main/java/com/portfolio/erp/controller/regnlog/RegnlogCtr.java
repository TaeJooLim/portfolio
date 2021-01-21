package com.portfolio.erp.controller.regnlog;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.service.regnlog.RegnlogSrv;

@Controller
public class RegnlogCtr {
   
   @Autowired
   RegnlogSrv regnlogSrv;
   
   // RegisterForm
   @RequestMapping("/register")
   public String getRegister() {
	   return "erp/regnlog/registerForm";
   }
   
   @RequestMapping("/registerOne")
   @ResponseBody
   public String getRegisterOne(@ModelAttribute EmployeeVO evo) {
		   
	   // 공백제거
	   evo.setEmpName(evo.getEmpName().trim());
	   evo.setEmpEmail(evo.getEmpEmail().trim());
		  
	   /* 입사일 + 부서 = 사번 만들기 */
	   String eYear = evo.getEmpEnter().substring(2, 4);
	   String eMonth = evo.getEmpEnter().substring(5, 7);
	   evo.setEmpNum(eYear + eMonth + evo.getEmpDepartment());
	   evo.setEmpPassword(evo.getEmpBirth().substring(0, 4) + evo.getEmpBirth().substring(5, 7) + evo.getEmpBirth().substring(8, 10));
	      
	   // 연차 자동계산
	   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      
	   int stYear = Integer.parseInt(evo.getEmpEnter().substring(2, 4));
	   int stMonth = Integer.parseInt(evo.getEmpEnter().substring(5, 7));
	   int tdYear = Integer.parseInt(sdf.format(System.currentTimeMillis()).substring(2, 4));
	   int tdMonth = Integer.parseInt(sdf.format(System.currentTimeMillis()).substring(5, 7));

	   int offCal = (tdYear - stYear) * 12 + (tdMonth - stMonth);
	   if(offCal <= 0) offCal = 0;

	   evo.setEmpOffTotal((double)offCal);
	   evo.setEmpOffRemain((double)offCal);
	   
	   // 호봉 자동계산
	   int empStep = tdYear - stYear;
	   evo.setEmpStep(empStep);
	   
	   // DB연결
	   regnlogSrv.setEmpOne(evo);
	   
	   return "success";
   }
   
   
   
   // loginForm
   @RequestMapping(value = "/login", method = RequestMethod.GET)
   public String getLogin() {
	   return "erp/regnlog/loginForm";
   }
   
   @RequestMapping(value = "/login", method = RequestMethod.POST)
   public ModelAndView loginChk(@ModelAttribute EmployeeVO evo, HttpSession session) {
	   ModelAndView mav = new ModelAndView();
	   
	   evo.setEmpNum(evo.getEmpNum().trim());
	   int result = regnlogSrv.loginChk(evo, session);
	   String msg = "";
	   mav.setViewName("erp/regnlog/loginForm");
	   
	   // result == 0 >> 사용자로그인성공
	   if (result == 0) {
		   // 사용자페이지로 이동
		   mav.setViewName("redirect:/user_main?empId=" + session.getAttribute("empId"));
		   msg = "사용자로그인성공";
		   
	   // result == 4 >> 관리자로그인성공
	   } else if(result == 4) {
		   mav.setViewName("redirect:/admin_main");
		   msg = "관리자로그인성공";
		   
	   } else if(result == 1) {
		   mav.addObject("msg", "가입승인 대기중");
		   msg = "가입승인 대기중";
	   } else {
		   mav.addObject("msg", "아이디 비밀번호 불일치");
		   msg = "아이디 비밀번호 불일치";
	   }
	   System.out.println(result + " = " +msg);
	   return mav;
   }
   
   // 사원번호 찾기
   @RequestMapping("/login/empNumChk")
   @ResponseBody
   public String empNumChk(@RequestParam String emp_name, @RequestParam String emp_birth) {
	   EmployeeVO evo = regnlogSrv.empNumChk(emp_name, emp_birth);
	   
	   if (evo == null) {
		   return "fail";
	   }
	   return evo.getEmpNum();
   }
   // 비밀번호 찾기
   @RequestMapping("/login/empPasswordChk")
   @ResponseBody
   public String empPasswordChk(@RequestParam String emp_numchk, @RequestParam String emp_birthchk) {
	   emp_numchk = emp_numchk.trim();
	   String chk = regnlogSrv.empPasswordChk(emp_numchk, emp_birthchk);
	   return chk;
   }
   
   
   // 로그아웃
   @RequestMapping("/logout")
   public String logout(HttpSession session) {
	   regnlogSrv.logoutSession(session);
	   
	   return "redirect:/";
   }
   
}