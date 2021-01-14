package com.portfolio.erp.controller.user.car;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.car.CarVO;
import com.portfolio.erp.model.paging.PagingVO;
import com.portfolio.erp.service.admin.car.CarSrv;

@Controller
public class UserCarCtr {
	
	@Autowired
	CarSrv carSrv;
	
	@RequestMapping("/user/corp_car_management")
	public ModelAndView getCar(
			@RequestParam(defaultValue = "") String words, 
			@RequestParam(defaultValue = "car_num") String searchOpt,
			@RequestParam(defaultValue="1") int curPage) {
		// 검색된 갯수
		int listCnt = carSrv.carCount(words,searchOpt);
						
		// 페이징처리
		PagingVO pagingvo = new PagingVO(listCnt, curPage);
				
		// 입력한 페이지번호에 따라서 시작번호가 바뀜
		int startIndex = pagingvo.getStartIndex();
		int pageSize = pagingvo.getPageSize();
		
		List<CarVO> list = carSrv.getCarList(words,searchOpt, startIndex, pageSize);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		mav.addObject("listCnt", listCnt);
		mav.addObject("pagingvo", pagingvo);
		mav.setViewName("erp/user/erp_car/corp_car_management");
		
		return mav;
	}
	
	@RequestMapping("/user/corp_car_management_insert")
	public String setCar(@ModelAttribute CarVO cvo) {
		
		carSrv.setCar(cvo);
		return "redirect:/user/corp_car_management";
	}
	
	@RequestMapping("/user/corp_car_log")
	public ModelAndView getCarUse(
			@RequestParam(defaultValue = "0") int carID,
			@RequestParam(defaultValue = "") String words, 
			@RequestParam(defaultValue = "car_destination") String searchOpt,
			@RequestParam(defaultValue="1") int curPage
			) {
		CarVO cvo = carSrv.getCarOne(carID);
		int listCnt = carSrv.carUseCount(words,searchOpt,carID);
		
		// 페이징처리
		PagingVO pagingvo = new PagingVO(listCnt, curPage);
				
		// 입력한 페이지번호에 따라서 시작번호가 바뀜
		int startIndex = pagingvo.getStartIndex();
		int pageSize = pagingvo.getPageSize();
		
		List<CarVO> list = carSrv.getCarUseList(words,searchOpt,carID, startIndex, pageSize);
		ModelAndView mav = new ModelAndView();
			
		String carModel = null;
		String carNum = null;
		if(carID==0) {
			carModel = " ";
			carNum = " ";
		}else {
			carModel = cvo.getCarModel();
			carNum = cvo.getCarNum();
			mav.addObject("carTotalMileage", cvo.getCarTotalMileage());
		}
			
		mav.addObject("carID", carID);
		mav.addObject("carModel", carModel);
		mav.addObject("carNum", carNum);
		
		mav.addObject("list", list);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		mav.addObject("listCnt", listCnt);
		mav.addObject("pagingvo", pagingvo);
		mav.setViewName("erp/user/erp_car/corp_car_log");
		
		return mav;
	}
	
}