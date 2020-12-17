package com.portfolio.erp.controller.regnlog;

import java.util.List;

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
      
      /* 입사일 + 부서 = 사번 만들기 */
      String eYear = evo.getEmpEnter().substring(2, 4);
      String eMonth = evo.getEmpEnter().substring(5, 7);
      evo.setEmpDepartment("200");
      evo.setEmpNum(eYear + eMonth + evo.getEmpDepartment() );
      
      evo.setEmpPosition("10");
      evo.setEmpPassword(evo.getEmpBirth());
      System.out.println(evo.getEmpNum());

      /*부서 목록 불러오기*/
      
      
      regnlogSrv.setEmpOne(evo);
      return "erp/regnlog/registerForm";
   }
   
   // loginForm
   @RequestMapping(value = "/login", method = RequestMethod.GET)
   public String getLogin() {
	   return "erp/regnlog/loginForm";
   }
   
   @RequestMapping(value = "/login", method = RequestMethod.POST)
   public ModelAndView loginChk(@ModelAttribute EmployeeVO evo) {
	   ModelAndView mav = new ModelAndView();
	   int result = regnlogSrv.loginChk(evo);
	   String msg = "";
	   mav.setViewName("erp/regnlog/loginForm");
	   
	   if (result == 0) {
		   mav.addObject("msg", "로그인성공");
		   msg = "로그인성공";
		   mav.setViewName("erp/admin/admin_main");
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
}