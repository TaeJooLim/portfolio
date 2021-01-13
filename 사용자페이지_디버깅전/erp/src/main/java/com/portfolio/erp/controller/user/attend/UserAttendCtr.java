package com.portfolio.erp.controller.user.attend;

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
import com.portfolio.erp.model.paging.PagingVO;
import com.portfolio.erp.service.admin.attend.AttendSrv;

@Controller
public class UserAttendCtr {

	@Autowired
	AttendSrv attendSrv;
	
	@RequestMapping("/user/attend_list")
	public ModelAndView getAttendList(
			@ModelAttribute AttendVO avo,
			@RequestParam(defaultValue = "attend_workdate") String searchOpt,
			@RequestParam(defaultValue = "") String words,
			@RequestParam(defaultValue = "1") int curPage) {
		
		ModelAndView mav = new ModelAndView();
		
		// 세션의 출퇴근등록일 = 세션의 모든출퇴근기록일 수
		int count = attendSrv.countMyAttend(avo,searchOpt,words);
		
		// 페이징처리
		PagingVO pagingvo = new PagingVO(count, curPage);
		
		// 입력한 페이지번호에 따라서 시작번호가 바뀜
		int startIndex = pagingvo.getStartIndex();
		int pageSize = pagingvo.getPageSize();
		
		// 세션의 출퇴근 현황
		mav.addObject("list", attendSrv.getMyAttend(avo,searchOpt,words,startIndex,pageSize));
		mav.addObject("pagingvo", pagingvo);
		
		// 세션의 실제 출퇴근 등록일
		mav.addObject("count", count);
		
		// 세션의 정상출근상태인 일수(status=2)
		mav.addObject("countStatusTwo", attendSrv.countStatusTwo(avo));	
		
		// 세션의 처리필요상태인 일수(status=1)
		mav.addObject("countStatusOne", attendSrv.countStatusOne(avo));
		
		// 세션의 지각 일수(late='Y')
		mav.addObject("countLate", attendSrv.countLateDays(avo));
		
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		
		mav.setViewName("/erp/user/erp_attend/attend_list");
		return mav;
	}
	
	// 전사 출퇴근현황
	@RequestMapping("/user/attend_list_all")
	public ModelAndView getAttendList(
			@RequestParam(defaultValue = "emp_name") String searchOpt,
			@RequestParam(defaultValue = "") String words,
			@RequestParam(defaultValue = "1") int curPage) {
		ModelAndView mav = new ModelAndView();
		
		// 검색된 갯수
		int count = attendSrv.isWorkDatas(searchOpt, words);
		
		// 페이징처리
		PagingVO pagingvo = new PagingVO(count, curPage);
		
		// 입력한 페이지번호에 따라서 시작번호가 바뀜
		int startIndex = pagingvo.getStartIndex();
		int pageSize = pagingvo.getPageSize();
		
		// 결과가져오기
		List<AttendVO> list = attendSrv.getWorkDatas(searchOpt, words, startIndex, pageSize);
		
		mav.addObject("count", count);
		mav.addObject("list", list); // attendance 테이블의 데이터목록
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		mav.addObject("pagingvo", pagingvo);

		mav.setViewName("/erp/user/erp_attend/attend_list_all");
		return mav;
	}
	
	@RequestMapping("/user/change_late")
	@ResponseBody
	public String changeLate(@ModelAttribute AttendVO avo) {
		attendSrv.changeLate(avo);
		return "success";
	}

	@RequestMapping("/user/change_workplace")
	@ResponseBody
	public String changeWorkplace(@ModelAttribute AttendVO avo) {
		attendSrv.changeWorkplace(avo);
		return "success";
	}

	@RequestMapping("/user/change_status")
	@ResponseBody
	public String changeStatus(@ModelAttribute AttendVO avo) {
		attendSrv.changeStatus(avo);
		return "success";
	}

	@RequestMapping("/user/delete_records")
	@ResponseBody
	public String deleteRecords(@RequestParam(value = "chkArr[]") List<String> chkArr) {
		int attendId;
		for (String list : chkArr) {
			attendId = Integer.parseInt(list);
			attendSrv.deleteRecords(attendId);
		}
		return "success";
	}

	@RequestMapping("/user/get_record_one")
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

	@RequestMapping("/user/set_record_one")
	@ResponseBody
	public String setRecordOne(
			@RequestParam int attendId, 
			@RequestParam String attendWorkdate,
			@RequestParam String attendStarttime, 
			@RequestParam(defaultValue = "") String attendEndtime) throws ParseException {
		
		AttendVO avo = new AttendVO(); // String attendStart(End)time -> Date attendStart(End)time 바꿔서 담아준다
				
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
		
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
		return "redirect:/user/attend_list";
	}
}
