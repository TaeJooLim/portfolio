package com.portfolio.erp.controller.user.salary;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.paging.PagingVO;
import com.portfolio.erp.model.salary.SalaryVO;
import com.portfolio.erp.service.admin.employee.EmpSrv;
import com.portfolio.erp.service.admin.salary.SalarySrv;

@Controller
public class UserSalaryCtr {

	@Autowired
	SalarySrv salarySrv;
	
	@Autowired
	EmpSrv empSrv;
	
	// 세금계산테이블 불러오기(SELECT)
	@RequestMapping(value = "/user/salary_tax_list", method = RequestMethod.GET)
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
		
		mav.setViewName("erp/user/erp_salary/salary_tax_list");
		return mav;
	}
	
	// 급여처리내역 jsp연결
	@RequestMapping("/user/salary_list")
	public ModelAndView getSalaryList(	@RequestParam(defaultValue="emp_name") String searchOpt, 
										@RequestParam(defaultValue="") String searchDate, 
										@RequestParam(defaultValue="") String words, 
										@RequestParam(defaultValue="1") int curPage) {
		ModelAndView mav = new ModelAndView();
		
		// 검색된 갯수
		int listCnt = salarySrv.getMonthSalaryCnt(searchOpt, searchDate, words);
		
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
		
		mav.setViewName("erp/user/erp_salary/salary_list");
		return mav;
	}
	
	// 세금명세서 jsp연결
	@RequestMapping("/user/salaryForm")
	public ModelAndView getSalaryForm(@RequestParam int sformId) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("svo", salarySrv.getMonthSalaryOne(sformId));
		mav.setViewName("erp/user/erp_salary/salary_form");
		
		return mav;
	}
}