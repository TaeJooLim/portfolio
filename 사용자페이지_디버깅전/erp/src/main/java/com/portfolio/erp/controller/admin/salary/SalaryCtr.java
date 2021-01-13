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

import com.portfolio.erp.model.paging.PagingVO;
import com.portfolio.erp.model.salary.SalaryVO;
import com.portfolio.erp.service.admin.employee.EmpSrv;
import com.portfolio.erp.service.admin.salary.SalarySrv;

@Controller
public class SalaryCtr {

	@Autowired
	SalarySrv salarySrv;
	
	@Autowired
	EmpSrv empSrv;
	
	// 세금계산테이블 불러오기(SELECT)
	@RequestMapping(value = "/admin/salary_tax_list", method = RequestMethod.GET)
	public ModelAndView getSalarayTaxList(@RequestParam(defaultValue="1") int curPage) {
		
		ModelAndView mav = new ModelAndView();
		
		// 검색된 리스트의 전체갯수
		int listCnt = salarySrv.getSalarayTaxCnt();
		
		// 페이징처리
		PagingVO pagingvo = new PagingVO(listCnt, curPage);
		int startIndex = pagingvo.getStartIndex();
		int pageSize = pagingvo.getPageSize();
		
		List<SalaryVO> list = salarySrv.getSalarayTaxList(startIndex, pageSize);
		
		mav.addObject("list", list);
		mav.addObject("pagingvo", pagingvo);
		
		mav.setViewName("erp/admin/erp_salary/salary_tax_list");
		
		
		
		
		// 페이징테스트
		System.out.println("beforecurPage = " + curPage);
		System.out.println("curPage = " + pagingvo.getCurPage());
		System.out.println("curRange = " + pagingvo.getCurRange());
		System.out.println("startPage = " + pagingvo.getStartPage());
		System.out.println("endPage = " + pagingvo.getEndPage());
		
		
		
		
		
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
	
	// 급여처리내역 jsp연결
	@RequestMapping("/admin/salary_list")
	public ModelAndView getSalaryList(	@RequestParam(defaultValue="emp_name") String searchOpt, 
										@RequestParam(defaultValue="") String searchDate, 
										@RequestParam(defaultValue="") String words, 
										@RequestParam(defaultValue="1") int curPage) {
		ModelAndView mav = new ModelAndView();
		
		// 검색된 갯수
		int listCnt = salarySrv.getMonthSalaryCnt();
		
		// 페이징처리
		PagingVO pagingvo = new PagingVO(listCnt, curPage);
		int startIndex = pagingvo.getStartIndex();
		int pageSize = pagingvo.getPageSize();
		
		List<SalaryVO> list = salarySrv.getMonthSalaryList(searchOpt, searchDate, words, startIndex, pageSize);
		
		mav.addObject("sList", list);
		mav.addObject("listCnt", listCnt);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		mav.addObject("pagingvo", pagingvo);
		
		mav.setViewName("erp/admin/erp_salary/salary_list");
		return mav;
	}
	
	// 자동급여처리 AJAX
	@RequestMapping("/admin/setSalaryAll")
	@ResponseBody
	public int setSalaryAll(@RequestParam String toDate) {
		int chk = salarySrv.setSalaryAll(toDate);
		return chk;
	}
	
	// 세금명세서 jsp연결
	@RequestMapping("/admin/salaryForm")
	public ModelAndView getSalaryForm(@RequestParam int sformId) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("svo", salarySrv.getMonthSalaryOne(sformId));
		mav.setViewName("erp/admin/erp_salary/salary_form");
		
		return mav;
	}
}