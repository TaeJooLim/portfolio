package com.portfolio.erp.controller.admin.attend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.attend.AttendVO;
import com.portfolio.erp.service.admin.attend.AttendSrv;

@Controller
public class AttendCtr {

	@Autowired
	AttendSrv attendSrv;
	
	@RequestMapping("/admin/attend_list")
	public ModelAndView getAttendList() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("count", attendSrv.isWorkDatas()); // attendance 테이블에 데이터가 몇개 있는가
		mav.addObject("list", attendSrv.getWorkDatas()); // attendance 테이블의 데이터목록
		
		mav.setViewName("/erp/admin/erp_attend/attend_list");
		return mav;
	}
	
	@RequestMapping("/admin/change_late")
	@ResponseBody
	public String changeLate(@ModelAttribute AttendVO avo) {
		attendSrv.changeLate(avo);
		return "success";
	}
	
	@RequestMapping("/admin/change_workplace")
	@ResponseBody
	public String changeWorkplace(@ModelAttribute AttendVO avo) {
		attendSrv.changeWorkplace(avo);
		return "success";
	}
	
	@RequestMapping("/admin/change_status")
	@ResponseBody
	public String changeStatus(@ModelAttribute AttendVO avo) {
		attendSrv.changeStatus(avo);
		return "success";
	}
}
