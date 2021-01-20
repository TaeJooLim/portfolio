package com.portfolio.erp.controller.common;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.board.ArticleVO;
import com.portfolio.erp.model.company.CompanyVO;
import com.portfolio.erp.service.admin.board.BoardSrv;
import com.portfolio.erp.service.admin.company.CompanySrv;

@Controller
public class MainPageCtr {
	
	@Autowired
	CompanySrv companySrv;
	
	@Autowired
	BoardSrv bSrv;
	
	@RequestMapping("")
	public ModelAndView getMain() {
		ModelAndView mav = new ModelAndView();
		
		// 0. 회사정보 불러오기
		CompanyVO cvo = companySrv.getCompanyInfo();
		
		mav.addObject("comNum", cvo.getComNum());
		mav.addObject("comCeo", cvo.getComCeo());
		mav.addObject("comAddress", cvo.getComAddress());
		mav.addObject("comTel",cvo.getComTel());
		mav.addObject("comFax", cvo.getComFax());
		mav.addObject("comWebMenu", cvo.getComWebMenu());
		mav.addObject("comWebMenuUrl", cvo.getComWebMenuUrl());		
		mav.addObject("comWebTop", cvo.getComWebTop());
		mav.addObject("comWebBottom",cvo.getComWebBottom());
		mav.addObject("comWebCopyright", cvo.getComWebCopyright());
		
		mav.setViewName("erp/common/index");
		return mav;
	}
	
	// 1:1문의 jsp 페이지 연결
	@RequestMapping("/customerSupport")
	public ModelAndView customerSupport() {
		ModelAndView mav = new ModelAndView();
		
		// 0. 회사정보 불러오기
		CompanyVO cvo = companySrv.getCompanyInfo();
				
		mav.addObject("comNum", cvo.getComNum());
		mav.addObject("comCeo", cvo.getComCeo());
		mav.addObject("comAddress", cvo.getComAddress());
		mav.addObject("comTel",cvo.getComTel());
		mav.addObject("comFax", cvo.getComFax());
		mav.addObject("comWebMenu", cvo.getComWebMenu());
		mav.addObject("comWebMenuUrl", cvo.getComWebMenuUrl());		
		mav.addObject("comWebTop", cvo.getComWebTop());
		mav.addObject("comWebBottom",cvo.getComWebBottom());
		mav.addObject("comWebCopyright", cvo.getComWebCopyright());
		
		mav.setViewName("erp/common/customer_support");
		return mav;
	}
	
	
	// 1:1 문의 작성 AJAX
	@RequestMapping("/regSupportOne")
	@ResponseBody
	public String retSupportOne(@RequestParam String writer, @RequestParam String subject, @RequestParam String content) {
		ArticleVO avo = new ArticleVO();
		
		// 작성내용 입력
		avo.setBoardNum("999QnA");
		avo.setDivision("0");
		avo.setEmpIdFk(1);
		avo.setWriter(writer);
		avo.setSubject(subject);
		avo.setContent(content);
		
		bSrv.setArticle(avo);
		return "success";
	}
}