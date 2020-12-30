package com.portfolio.erp.controller.admin.salary;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.salary.SalaryVO;
import com.portfolio.erp.service.admin.salary.SalarySrv;

@Controller
public class SalaryCtr {

	@Autowired
	SalarySrv salarySrv;
	
	// 세금계산테이블 불러오기(SELECT)
	@RequestMapping(value = "/admin/salary_tax_list", method = RequestMethod.GET)
	public ModelAndView getSalarayTaxList() {
		ModelAndView mav = new ModelAndView();
		
		List<SalaryVO> list = salarySrv.getSalarayTaxList();
		
		mav.addObject("list", list);
		mav.setViewName("erp/admin/erp_salary/salary_tax_list");
		return mav;
	}
	
	// 세금계산테이블 수정 후 저장(UDPATE)
	@RequestMapping(value = "/admin/salary_tax_list", method = RequestMethod.POST)
	@ResponseBody
	public String setSalaryTaxList(@ModelAttribute SalaryVO svo) {
		
		/*	total = 국민연금+건강보험+장기요양+고용보험+소득세+지방소득세	*/
		int total = svo.getSalaryNps() + svo.getSalaryHInsurance() + svo.getSalaryCare() +
					svo.getSalaryEInsurance() + svo.getSalaryIncome() + svo.getSalaryLIncome();
		svo.setSalaryTotalcost(total); // 공제항목의 소계(total) 계산결과를 저장
		
		/*	시작범위 - 공제항목 소계(total)	*/
		int netpay = svo.getStartingRange() - total;
		svo.setNetPay(netpay); // 금액범위(시작벙뮈) - 공제항목의 소계  = 실수령액
		
		salarySrv.setSalaryTaxList(svo);
		return "success";
	}
	
	// 세금계산테이블 행 삭제
	@RequestMapping(value = "/admin/delete_salary_tax_list", method = RequestMethod.POST)
	@ResponseBody
	public String deleteSalaryTaxList(@ModelAttribute SalaryVO svo) {
		salarySrv.deleteSalaryTaxList(svo);
		return "success";
	}
	
	// 급여처리내역 불러오기
	@RequestMapping("/admin/salary_list")
	public String getSalarayList() {
		return "erp/admin/erp_salary/salary_list";
	}
}
