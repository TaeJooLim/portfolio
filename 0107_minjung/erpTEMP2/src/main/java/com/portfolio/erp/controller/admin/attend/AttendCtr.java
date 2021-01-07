package com.portfolio.erp.controller.admin.attend;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ModelAndView getAttendList(@RequestParam(defaultValue = "emp_name") String searchOpt,
			@RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("count", attendSrv.isWorkDatas(searchOpt, words)); // attendance 테이블에 데이터가 몇개 있는가
		mav.addObject("list", attendSrv.getWorkDatas(searchOpt, words)); // attendance 테이블의 데이터목록

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
		for (String list : chkArr) {
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

		if (attend.getAttendEndtime() != null) {
			map.put("attendEndtime", sdf.format(attend.getAttendEndtime()));
		} else {
			map.put("attendEndtime", "--:--");
		}

		return map;
	}

	@RequestMapping("/admin/set_record_one")
	@ResponseBody
	public String setRecordOne(
			@RequestParam int attendId, 
			@RequestParam String attendWorkdate,
			@RequestParam String attendStarttime, 
			@RequestParam(defaultValue = "") String attendEndtime) throws ParseException {
		
		AttendVO avo = new AttendVO(); // String attendStart(End)time -> Date attendStart(End)time 바꿔서 담아준다
				
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
		SimpleDateFormat sdfForNull = new SimpleDateFormat("");
		
		// AttendVO 의 attendId
		avo.setAttendId(attendId);
		
		// AttendVO 의 attendWorkdate
		avo.setAttendWorkdate(attendWorkdate);
		
		// AttendVO 객체의 attendStarttime
		if( attendStarttime.equals("") ) {
			Date starttime = null;
			avo.setAttendStarttime(starttime);
		}else {
			Date starttime = sdf.parse(attendWorkdate + " " + attendStarttime + ":00");
			avo.setAttendStarttime(starttime);
		}
		
		// AttendVO 객체의 attendEndtime
		if( attendEndtime.equals("") ) {
			Date endtime = null;
			avo.setAttendEndtime(endtime);
		}else {
			Date endtime = sdf.parse(attendWorkdate + " " + attendEndtime + ":00");
			avo.setAttendEndtime(endtime);
		}
		
		// 입력받은 출근시간과 퇴근시간을 이용하여 초과근무시간과 총근무시간 계산이 필요
		// 1. (총근무시간 계산) 퇴근시간 - 출근시간 을 분(m)단위로 나타내기
		// 만약 출근시간이나 퇴근시간이 null 이라면 초과근무시간과 총근무시간은 0분이다.
		if(avo.getAttendStarttime() == null || avo.getAttendEndtime() == null) {
			avo.setAttendTotaltime(0);
			avo.setAttendOvertime(0);
		}else {
			int total = (int) (( avo.getAttendEndtime().getTime() - avo.getAttendStarttime().getTime() ) / (1000 * 60));
			avo.setAttendTotaltime(total);
			int overtime = total - attendSrv.getDefault(avo).getAttendDefaulttime();
			avo.setAttendOvertime(overtime);
		}
		
		/***	(끝)변경된 모든 정보를 업데이트		***/
		attendSrv.setChanges(avo);
		
		/*	콘솔창 테스트용	
		System.out.println("id : " + avo.getAttendId() + "\nWorkdate : " + avo.getAttendWorkdate());
		System.out.println("Starttime : " + avo.getAttendStarttime() + "\nEndtime : " + avo.getAttendEndtime());
		System.out.println("total : " + avo.getAttendTotaltime() + "분\novertime : " + avo.getAttendOvertime() + "분");
		*/
		return "redirect:/admin/attend_list";
	}
}
