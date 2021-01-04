package com.portfolio.erp.controller.user;

import java.text.SimpleDateFormat;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.attend.AttendVO;
import com.portfolio.erp.service.user.attend.AttendSrv;

@Controller
public class UserMainCtr {
	
	@Autowired
	AttendSrv attendSrv;
	
	@RequestMapping(value = "/user_main", method = RequestMethod.GET)
	public ModelAndView getUserMain(@ModelAttribute AttendVO avo) {
		
		ModelAndView mav = new ModelAndView();
		
		/*	해당세션 회원의 출퇴근시간 가져오기
		AttendVO vo = attendSrv.getTimes(avo);
		
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
		
		if( vo.getAttendStarttime() != null ) {
			mav.addObject("startTime", sdf.format(vo.getAttendStarttime()));
		}else {
			mav.addObject("startTime", "--:--");
			
		}
		
		if( vo.getAttendEndtime() != null ) {
			mav.addObject("endTime", sdf.format(vo.getAttendEndtime()));
		}else {
			mav.addObject("endTime", "--:--");
		}
		*/
		
		mav.setViewName("erp/user/user_main");
		return mav;
	}
	
	@RequestMapping("/user/get_starttime")
	@ResponseBody
	public String getStarttime(@ModelAttribute AttendVO avo) {
		return "success";
	}
	
	/*	출근시간 입력	*/
	@RequestMapping("/user/set_starttime")
	@ResponseBody
	public String setStarttime(@ModelAttribute AttendVO	avo) {
		/*	출근을 입력한 이력이 있는가(0:출근안누름/1:출근누름)	*/
		int isStarted = attendSrv.isStarted(avo);
		
		if ( isStarted == 0 ) {
			attendSrv.setStarttime(avo);
			return "success";
		}else {
			return "false";
		}
	}
	
	/*	퇴근시간 입력	*/
	@RequestMapping("/user/set_endtime")
	@ResponseBody
	public String setEndtime(@ModelAttribute AttendVO	avo) {
		/*	0:퇴근안누름/1:퇴근누름	*/
		int isEnded = attendSrv.isEnded(avo);
		
		/*	0:출근안누름/1:출근누름	*/
		int isStarted = attendSrv.isStarted(avo);
		
		if ( isEnded == 0 && isStarted == 0 ) {
			return "needStart";
		}else if( isEnded == 0 && isStarted == 1){
			attendSrv.setEndtime(avo);
			return "success";
		}else {
			return "false";
		}
	}
}
