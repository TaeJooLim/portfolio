package com.portfolio.erp.controller.common;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.company.CompanyVO;
import com.portfolio.erp.service.admin.company.CompanySrv;

@Controller
public class MainPageCtr {
	
	@Autowired
	CompanySrv companySrv;
	
	@RequestMapping("")
	public ModelAndView getMain() {
		ModelAndView mav = new ModelAndView();
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

}
