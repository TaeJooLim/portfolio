package com.portfolio.erp.controller.admin.car;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.car.CarVO;
import com.portfolio.erp.service.admin.car.CarSrv;

@Controller
public class CarCtr {
	
	@Autowired
	CarSrv carSrv;
	
	@RequestMapping("/admin/corp_car_management")
	public ModelAndView getCar(
			@RequestParam(defaultValue = "") String words, 
			@RequestParam(defaultValue = "car_num") String searchOpt) {
	
		List<CarVO> list = carSrv.getCarList(words,searchOpt);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		mav.setViewName("erp/admin/erp_car/corp_car_management");
		
		return mav;
	}
	
	@RequestMapping("/admin/corp_car_management_insert")
	public String setCar(@ModelAttribute CarVO cvo) {
		
		carSrv.setCar(cvo);
		return "redirect:/admin/corp_car_management";
	}
	
	@RequestMapping(value ="/admin/corp_car_management_updateList", method = RequestMethod.POST)
	@ResponseBody
	public CarVO getCarUpdateList(
			@ModelAttribute CarVO cvo) {
		cvo = carSrv.getCarUpdateList(cvo.getCarID());		
			return cvo;
	}
	
	@RequestMapping("/admin/corp_car_management_update")
	@ResponseBody
	public String getCarUpdate(
			@ModelAttribute CarVO cvo) {
			carSrv.getCarUpdate(cvo);
		
			return "erp/admin/erp_car/corp_car_management";
	}
	
	@RequestMapping(value ="/admin/corp_car_management_delete", method = RequestMethod.POST)
	@ResponseBody
	public String setCarDelete(
			@RequestParam(value = "chkArr[]") List<String> chkArr) {
			int carID;
			for(String list : chkArr) {
				carID = Integer.parseInt(list);
				carSrv.setCarDelete(carID);
			}
			return "success";
	}
	
	@RequestMapping("/admin/corp_car_log")
	public ModelAndView getCarUse(
			@RequestParam(defaultValue = "0") int carID,
			@RequestParam(defaultValue = "") String words, 
			@RequestParam(defaultValue = "car_destination") String searchOpt
			) {
		CarVO cvo = carSrv.getCarOne(carID);
		
		List<CarVO> list = carSrv.getCarUseList(words,searchOpt,carID);
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
		mav.setViewName("erp/admin/erp_car/corp_car_log");
		
		return mav;
	}
	
	@RequestMapping("/admin/corp_car_log_insert")
	@ResponseBody
	public String setCarUse(@ModelAttribute CarVO cvo) {
		carSrv.setCarUse(cvo);
		return "erp/admin/erp_car/corp_car_log";
	}
	
	@RequestMapping(value ="/admin/corp_car_log_updateList", method = RequestMethod.POST)
	@ResponseBody
	public CarVO getCarUseUpdateList(
			@ModelAttribute CarVO cvo) {
		cvo = carSrv.getCarUseUpdateList(cvo.getCarPID());		
			return cvo;
	}
	
	@RequestMapping("/admin/corp_car_log_update")
	@ResponseBody
	public String getCarUseUpdate(
			@ModelAttribute CarVO cvo) {
		carSrv.getCarUseUpdate(cvo);
		
		return "erp/admin/erp_car/corp_car_log";
	}
	
	@RequestMapping(value ="/adimn/corp_car_log_delete", method = RequestMethod.POST)
	@ResponseBody
	public String setCarUseDelete(
			@RequestParam(value = "chkArr[]") List<String> chkArr) {
			int carPID;
			for(String list : chkArr) {
				carPID = Integer.parseInt(list);
				carSrv.setCarUseDelete(carPID);
			}
			return "success";
	}
	
}