package com.portfolio.erp.controller.user.message;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.service.admin.employee.EmpSrv;
import com.portfolio.erp.service.common.MessageSrv;

@Controller
public class UserMessageCtr {

	@Autowired
	EmpSrv empSrv;
	
	@Autowired
	MessageSrv messageSrv;
	
	// 보낸메세지 보관함 연결
	@RequestMapping("/user/message_sendList")
	public ModelAndView getSendList(@RequestParam int empId, 
									@RequestParam(defaultValue = "msg_subject") String searchOpt, 
									@RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("mList", messageSrv.getSendMessageList(empId, searchOpt, words));
		mav.addObject("mCnt", messageSrv.getSendMessageCnt(empId, searchOpt, words));
		mav.setViewName("erp/user/erp_message/message_sendList");
		
		return mav;
	}
	
	// 받은메세지 보관함 연결
	@RequestMapping("/user/message_fromList")
	public ModelAndView getFromList(@RequestParam int empId, 
									@RequestParam(defaultValue="msg_subject") String searchOpt, 
									@RequestParam(defaultValue="") String words) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("mList", messageSrv.getFromMessageList(empId, searchOpt, words));
		mav.addObject("mCnt", messageSrv.getFromMessageCnt(empId, searchOpt, words));
		mav.setViewName("erp/user/erp_message/message_fromList");
		
		return mav;
	}
	
	// 메세지 읽기 폼 연결
	@RequestMapping("/user/message_read")
	public ModelAndView getMessageRead(@RequestParam int typeChk ,@RequestParam int msgId) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("erp/user/erp_message/message_readForm");
		mav.addObject("typeChk", typeChk);
		
		// 1이면 보낸메세지함으로 연결
		if(typeChk == 1) {
			messageSrv.changeMsgConfirm(msgId);
			mav.addObject("msgvo", messageSrv.getSendMessageOne(msgId));
		}
		// 2이면 받은메세지함으로 연결
		else {
			mav.addObject("msgvo", messageSrv.getFromMessageOne(msgId));
		}
		return mav;
	}
	
	// 메세지 보내기 폼 연결
	@RequestMapping("/user/message_send")
	public String getMessageSendForm() {
		return "erp/user/erp_message/message_sendForm";
	}
	
	// 사원이름 검색
	@RequestMapping("/user/empNameSearch")
	public ModelAndView empNameSearch(@RequestParam String words) {
		
		ModelAndView mav = new ModelAndView();
		
		List<EmployeeVO> list = empSrv.getEmployeeList("emp_name", words, 0, 10);
		mav.addObject("eList", list);
		mav.setViewName("erp/user/erp_message/message_sendForm");
		
		return mav;
	}

}