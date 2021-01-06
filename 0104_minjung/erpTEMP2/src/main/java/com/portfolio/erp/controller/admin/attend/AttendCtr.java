package com.portfolio.erp.controller.admin.attend;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.attend.AttendVO;
import com.portfolio.erp.service.admin.attend.AttendSrv;

@Controller
public class AttendCtr {

	@Autowired
	AttendSrv attendSrv;
	
	@RequestMapping("/admin/attend_list")
	public ModelAndView getAttendList(	@RequestParam(defaultValue = "emp_name") String searchOpt, 
										@RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();
				
		mav.addObject("count", attendSrv.isWorkDatas(searchOpt,words)); // attendance 테이블에 데이터가 몇개 있는가
		mav.addObject("list", attendSrv.getWorkDatas(searchOpt,words)); // attendance 테이블의 데이터목록
		
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
	
	@RequestMapping("/admin/delete_records")
	@ResponseBody
	public String deleteRecords(@RequestParam(value = "chkArr[]") List<String> chkArr) {
		int attendId;
		for(String list : chkArr) {
			attendId = Integer.parseInt(list);
			attendSrv.deleteRecords(attendId);
		}
		return "success";
	}
	
	@RequestMapping("/admin/get_record_one")
	@ResponseBody
	public Map<String, Object> getRecordOne(@ModelAttribute AttendVO avo) {
		// attendId에 맞는 출퇴근기록 가져오기
		AttendVO attend = attendSrv.getRecordOne(avo);
		
		// input type="time"에 맞게 변환
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("attendId", attend.getAttendId());
		map.put("departName", attend.getDepartName());
		map.put("empName", attend.getEmpName());
		map.put("attendWorkdate", attend.getAttendWorkdate());
		map.put("attendStarttime", sdf.format(attend.getAttendStarttime()));
		
		if( attend.getAttendEndtime() != null ) {
			map.put("attendEndtime", sdf.format(attend.getAttendEndtime()));
		}else {
			map.put("attendEndtime", "--:--");
		}
		
		return map;
	}
	
	@RequestMapping("/admin/set_record_one")
	@ResponseBody
	public String setRecordOne(@ModelAttribute AttendVO avo) {
		System.out.println("attendId : " + avo.getAttendId() + "\n attendWorkdate : " + avo.getAttendWorkdate());
		System.out.println("attendStartime : " + avo.getAttendStarttime() + "\n attendEndtime : " + avo.getAttendEndtime());
		//return "redirect:/admin/attend_list";
		return "success";
	}
}
