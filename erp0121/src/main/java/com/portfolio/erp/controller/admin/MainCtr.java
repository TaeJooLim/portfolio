package com.portfolio.erp.controller.admin;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.service.admin.attend.AttendSrv;
import com.portfolio.erp.service.admin.board.BoardSrv;
import com.portfolio.erp.service.admin.employee.EmpSrv;
import com.portfolio.erp.service.common.MessageSrv;

@Controller
public class MainCtr {

	@Autowired
	MessageSrv msgSrv;
	
	@Autowired
	AttendSrv attendSrv;
	
	@Autowired
	EmpSrv empSrv;
	
	@Autowired
	BoardSrv boardSrv;
	
	@RequestMapping("/admin_main")
	public ModelAndView getMain(@RequestParam(defaultValue="confirm") String admin_main) {
		ModelAndView mav = new ModelAndView();
		
		// 1. 받은쪽지함 10개만 가져오기 (최신순)
		mav.addObject("msgList", msgSrv.getFromMessageList(1, "msg_subject", "", 0, 10));
		
		// 2. 출퇴근 미처리 인원 조회
		mav.addObject("attendList", attendSrv.getAttendListStatus(1));
		
		// 3. 가입승인 대기인원 조회
		mav.addObject("regList", empSrv.getEmpListNotConfirm());
		
		// 4. 시스템공지사항 게시글 5개만 가져오기 (최신순)
		mav.addObject("sysNoticeList", boardSrv.articleList("999sys", "", "subject", 0, 5));
		
		// 5. 사내공지사항 게시글 5개만 가져오기 (최신순)
		mav.addObject("comNoticeList", boardSrv.articleList("999com", "", "subject", 0, 5));
		
		// 6. 문의사항 게시글 5개만 가져오기 (최신순)
		mav.addObject("QnAList", boardSrv.articleList("999QnA", "", "subject", 0, 5));
		
		mav.setViewName("erp/admin/admin_main");
		return mav;
	}
}