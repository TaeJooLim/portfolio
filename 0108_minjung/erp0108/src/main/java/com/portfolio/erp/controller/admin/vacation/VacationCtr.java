package com.portfolio.erp.controller.admin.vacation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.model.vacation.VacationVO;
import com.portfolio.erp.service.admin.employee.EmpSrv;
import com.portfolio.erp.service.admin.vacation.VacationSrv;

@Controller
public class VacationCtr {
	
	@Autowired
	EmpSrv empSrv;
	
	@Autowired
	VacationSrv vcSrv;
	
	// 연차신청 페이지
	@RequestMapping(value="/admin/vacation", method=RequestMethod.GET)
	public ModelAndView getVacation(@RequestParam int empId) {
		ModelAndView mav = new ModelAndView();
		EmployeeVO empvo = empSrv.getEmployeeOne(empId);
		int typeA = vcSrv.getCntOffTypeA();
		double typeB = vcSrv.getCntOffTypeB() * 0.5;
		double typeC = vcSrv.getCntOffTypeC() * 0.25 ;
		int typeD = vcSrv.getCntOffTypeD();

		mav.addObject("employee", empvo);
		mav.addObject("typeA",typeA);
		mav.addObject("typeB",typeB);
		mav.addObject("typeC",typeC);
		mav.addObject("typeD",typeD);
		mav.addObject("vacationList", vcSrv.getVacationList(empId));
		mav.setViewName("erp/admin/erp_vacation/vacation_reg");
		return mav;
	}
	
	// 신청일수 계산
	@RequestMapping("/admin/vacation_reg")
	@ResponseBody
	public int getVacationDate(@RequestParam String begin, @RequestParam String end) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date stDt = sdf.parse(begin);
        Date edDt = sdf.parse(end);
        
        long diff = edDt.getTime() - stDt.getTime();
        long diffDays = diff / (24 * 60 * 60 * 1000);
  
		return (int) (diffDays+1);
	}
	
	// 연차신청
	@RequestMapping(value="/admin/vacation", method=RequestMethod.POST)
	public ModelAndView setVacation(@ModelAttribute EmployeeVO evo, @ModelAttribute VacationVO vvo, @RequestParam int empId) throws ParseException {
		ModelAndView mav = new ModelAndView();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		/*문서번호 만들기 'V' + off_type + emp_id_fk + YYYY + MM + DD + off_start_date */
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		String docNum = "V" + vvo.getOffType() + evo.getEmpId() + year + month + day + vvo.getOffStartDate();
		vvo.setOffDocNum(docNum);
		
		
		Date stDt = sdf.parse(vvo.getOffStartDate());
        Date edDt = sdf.parse(vvo.getOffEndDate());
        
        long diff = edDt.getTime() - stDt.getTime();
        double diffDays = (double)(diff / (24 * 60 * 60 * 1000));
        
        if(vvo.getOffType().equals("B")) diffDays = 0.5;
        if(vvo.getOffType().equals("C")) diffDays = 0.25;
        if(vvo.getOffType().equals("A") || vvo.getOffType().equals("D") ) diffDays += 1;
        
        vvo.setOffDateCnt(diffDays); //휴가일수
        
		cal.setTime(stDt);
        for (int i = 1; i <= diffDays+1; i++) {
        	Date dt = cal.getTime();
        	sdf.format(dt);

        	cal.add(Calendar.DATE, 1);
        	vvo.setOffDate(sdf.format(dt)); // 휴가일
        	
        	vcSrv.setVacation(vvo);
        }
        
        /*employee table 연차 정보 업데이트*/
        
        double offUse = evo.getEmpOffUse() + diffDays; // 사용일수
        evo.setEmpOffUse(offUse);
        double offRemain = evo.getEmpOffRemain() - diffDays; // 남은연차
        evo.setEmpOffRemain(offRemain);
        
        vcSrv.updateEmpOff(evo);
		
        mav.setViewName("redirect:/admin/vacation?empId=" + empId);
		
		return mav;
	}
	
	// 연차신청 취소
	@RequestMapping("/admin/vacation_delete_one")
	@ResponseBody
	public String deleteVacation(@RequestParam String offDocNum, 
								 @RequestParam int empId,
								 @RequestParam double offDateCnt,
								 @RequestParam double empOffUse,
								 @RequestParam double empOffRemain) {
		EmployeeVO evo = empSrv.getEmployeeOne(empId);
		evo.setEmpIdFk(empId);
		
		/*employee table 연차 정보 업데이트*/
		double offUse = empOffUse - offDateCnt; // 사용한 연차
		evo.setEmpOffUse(offUse);
		double offRemain = empOffRemain + offDateCnt; // 남은연차
	    evo.setEmpOffRemain(offRemain);
	    
	    vcSrv.updateEmpOff(evo);
	        
		vcSrv.deleteVacation(offDocNum, empId);
		return "success";
	}
	
	// 연차사용목록 전체(검색)
	@RequestMapping("/admin/vacation_list")
	public ModelAndView getVacationList(@RequestParam(defaultValue = "emp_name") String searchOpt, 
										@RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();
		/*전체목록 불러오기*/
		mav.addObject("vList", vcSrv.getVacationListAll(searchOpt, words));
		/*검색된 개수*/
		mav.addObject("vCnt", vcSrv.getVacationCnt(searchOpt, words));
		
		mav.setViewName("erp/admin/erp_vacation/vacation_info_list");
		return mav;
	}
	
	//연차신청 결재 업데이트
	@RequestMapping("/admin/vacation_confirm")
	@ResponseBody
	public String updateConfirm(@RequestParam String offDocNum) {
		vcSrv.updateConfirm(offDocNum);
		return "success";
	}
	
	//연차신청 Form
	@RequestMapping("/admin/vacationForm")
	public ModelAndView getVacationForm(@RequestParam String offDocNum) {
		ModelAndView mav = new ModelAndView();
		VacationVO vvo = vcSrv.getVacationForm(offDocNum);
		
		mav.addObject("vList", vvo);
		mav.setViewName("erp/admin/erp_vacation/vacation_form");
		return mav;
	}
	
}
