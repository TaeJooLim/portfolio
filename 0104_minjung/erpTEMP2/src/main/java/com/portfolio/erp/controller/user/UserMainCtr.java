package com.portfolio.erp.controller.user;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.attend.AttendVO;
import com.portfolio.erp.service.admin.attend.AttendSrv;

@Controller
public class UserMainCtr {
	
	@Autowired
	AttendSrv attendSrv;
	
	@RequestMapping(value = "/user_main", method = RequestMethod.GET)
	public ModelAndView getUserMain(@ModelAttribute AttendVO avo) {
		
		ModelAndView mav = new ModelAndView();
				
		mav.setViewName("erp/user/user_main");
		return mav;
	}
	
	/*	출퇴근시간 가져오기	*/
	@RequestMapping("/user/get_worktimes")
	@ResponseBody
	public Map<String,String> getWorktimes(@ModelAttribute AttendVO avo) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		int result = attendSrv.isDataExists(avo);
		// System.out.println("오늘의 출퇴근기록 데이터가 있는가(0:없음/1:있음) : " + result);
		
		// 오늘의 출퇴근기록이 존재함
		if( result >  0 ) {
			AttendVO vo = attendSrv.getTimes(avo);
			
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
			sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
			
			if( vo.getAttendStarttime() != null ) {
				map.put("starttime", sdf.format(vo.getAttendStarttime()));
			}else {
				map.put("starttime", "--:--");
			}
			
			if( vo.getAttendEndtime() != null ) {
				map.put("endtime", sdf.format(vo.getAttendEndtime()));
			}else {
				map.put("endtime", "--:--");
			}
			
		// 출퇴근기록이 없음
		}else {
			map.put("starttime", "--:--");
			map.put("endtime", "--:--");
		}
		
		return map;
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
