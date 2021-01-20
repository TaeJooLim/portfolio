package com.portfolio.erp.controller.user;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.attend.AttendVO;
import com.portfolio.erp.model.board.ArticleVO;
import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.service.admin.attend.AttendSrv;
import com.portfolio.erp.service.admin.board.BoardSrv;
import com.portfolio.erp.service.admin.car.CarSrv;
import com.portfolio.erp.service.admin.company.CompanySrv;
import com.portfolio.erp.service.admin.employee.EmpSrv;
import com.portfolio.erp.service.admin.order.OrderSrv;
import com.portfolio.erp.service.admin.vacation.VacationSrv;
import com.portfolio.erp.service.common.CommonSrv;
import com.portfolio.erp.service.common.MessageSrv;

@Controller
public class UserMainCtr {
	
	@Autowired
	AttendSrv attendSrv;
	
	@Autowired
	EmpSrv empSrv;
	
	@Autowired
	BoardSrv bSrv;
	
	@Autowired
	MessageSrv messageSrv;
	
	@Autowired
	CarSrv carSrv;
	
	@Autowired
	CommonSrv commonSrv;
	
	@Autowired
	CompanySrv companySrv;
	
	@Autowired
	VacationSrv vacationSrv;
	
	@Autowired
	OrderSrv orderSrv;
	
	@RequestMapping(value = "/user_main", method = RequestMethod.GET)
	public ModelAndView getUserMain(@ModelAttribute EmployeeVO evo) {
		
		ModelAndView mav = new ModelAndView();
		
		// 0. 회사이름 받아오기
		mav.addObject("comName", companySrv.getCompanyInfo());
		
		/**	empId를 파라미터로 쓰는 메소드가 많음	**/
		int empId = evo.getEmpId();
		/**	empId를 파라미터로 쓰는 메소드가 많음	**/
		
		// 4. 휴가일수 나타내기
		EmployeeVO empvo = empSrv.getEmployeeOne(empId);
		mav.addObject("employee", empvo);
		
		// 1. 사내게시판 게시글목록 불러오기(boardNum='999com')
		/*	서비스로 넘어가는 파라미터를 맞추기위해 강제 디폴트값 부여	*/
		String boardWords = "";
		String boardSearchOpt = "subject";
		int startIndex = 0;
		int pageSize = 10;
		/*	서비스로 넘어가는 파라미터를 맞추기위해 강제 디폴트값 부여	*/
		
		// 1. 사내공지사한 게시판 게시글목록 불러오기
		List<ArticleVO> companyBoard = bSrv.articleList("999com",boardWords,boardSearchOpt,startIndex,pageSize);
		mav.addObject("companyBoard",companyBoard);
		mav.addObject("comBoardNum", "999com");
		
		// 2. 시스템게시판 게시글목록 불러오기(boardNum='999sys')
		List<ArticleVO> systemBoard = bSrv.articleList("999sys",boardWords,boardSearchOpt,startIndex,pageSize);
		mav.addObject("systemBoard",systemBoard);
		mav.addObject("sysBoardNum", "999sys");
		
		// 3. 나의 쪽지함(받은메시지 보관함과 연결)
		mav.addObject("mUnreadList", messageSrv.getFromMessageList(empId, "msg_subject", "", startIndex, pageSize)); // 받은메시지 목록
		mav.addObject("mUnreadCnt", messageSrv.getFromMessageCnt(empId, "msg_subject", "")); // 읽지않은 받은메시지 개수
		
		// 법인차량 사용일지 목록불러오기
		mav.addObject("carList", carSrv.getCarUseList("", "car_destination",0, 0, 10));
		
		// 5. 나의 부서 공지사항 불러오기
		String myBoardNum = commonSrv.getDepartmentCode(evo).getEmpDepartment() + "notice"; // 세션회원의 부서번호 + notice
		
		// 5. 관리자아이디로 접속할 경우, 문의사항 표시
		if (empId == 1) myBoardNum = "999Qna";
		List<ArticleVO> myBoard = bSrv.articleList(myBoardNum,boardWords,boardSearchOpt,startIndex,pageSize);
		mav.addObject("myBoard", myBoard);
		mav.addObject("myBoardNum", myBoardNum);
		
		// 6. 결재대기문서 리스트 불러오기
		EmployeeVO eevo = empSrv.getEmployeeOne(empId);
		
		// 총무부 부서장일 경우, 구매요청서 리스트 불러오기
		if (eevo.getEmpDepartment().equals("400") && eevo.getEmpHeadcheck().equals("Y")) {
			mav.addObject("approvalList", orderSrv.getAppOrderList("all", "", 0, 10, "N"));
			mav.addObject("approvalType", "구매요청서");
		}
		else if (eevo.getEmpDepartment().equals("100") && eevo.getEmpHeadcheck().equals("Y")) {
			mav.addObject("approvalList", vacationSrv.getAppVacationList("all", "", 0, 10, "N"));
			mav.addObject("approvalType", "휴가사용신청서");
		}
		
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
	public String setEndtime(@ModelAttribute AttendVO avo) {
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
