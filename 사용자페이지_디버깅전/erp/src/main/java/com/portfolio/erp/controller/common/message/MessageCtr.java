package com.portfolio.erp.controller.common.message;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.service.admin.employee.EmpSrv;
import com.portfolio.erp.service.common.MessageSrv;

@Controller
public class MessageCtr {

	@Autowired
	EmpSrv empSrv;
	
	@Autowired
	MessageSrv messageSrv;
	
	// 보낸메세지 보관함 연결
	@RequestMapping("/common/message_sendList")
	public ModelAndView getSendList(@RequestParam int empId, 
									@RequestParam(defaultValue = "msg_subject") String searchOpt, 
									@RequestParam(defaultValue = "") String words) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("mList", messageSrv.getSendMessageList(empId, searchOpt, words));
		mav.addObject("mCnt", messageSrv.getSendMessageCnt(empId, searchOpt, words));
		mav.setViewName("erp/common/erp_message/message_sendList");
		
		return mav;
	}
	
	// 받은메세지 보관함 연결
	@RequestMapping("/common/message_fromList")
	public ModelAndView getFromList(@RequestParam int empId, 
									@RequestParam(defaultValue="msg_subject") String searchOpt, 
									@RequestParam(defaultValue="") String words) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("mList", messageSrv.getFromMessageList(empId, searchOpt, words));
		mav.addObject("mCnt", messageSrv.getFromMessageCnt(empId, searchOpt, words));
		mav.setViewName("erp/common/erp_message/message_fromList");
		
		return mav;
	}
	
	// 메세지 읽기 폼 연결
	@RequestMapping("/common/message_read")
	public ModelAndView getMessageRead(@RequestParam int typeChk ,@RequestParam int msgId) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("erp/common/erp_message/message_readForm");
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
	@RequestMapping("/common/message_send")
	public String getMessageSendForm() {
		return "erp/common/erp_message/message_sendForm";
	}
	
	// 메세지 보내기 Ajax
	@RequestMapping("/common/setMessage")
	@ResponseBody
	public String setMessage(	@RequestParam String msgSendId, 
								@RequestParam String msgFromId, 
								@RequestParam String msgSubject, 
								@RequestParam String msgContent ) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("msgSendId", msgSendId);
		map.put("msgFromId", msgFromId);
		map.put("msgSubject", msgSubject);
		map.put("msgContent", msgContent);
		
		messageSrv.setMessage(map);
		return "success";
	}
	
	// 사원이름 검색
	@RequestMapping("/common/empNameSearch")
	public ModelAndView empNameSearch(@RequestParam String words) {
		
		ModelAndView mav = new ModelAndView();
		
		List<EmployeeVO> list = empSrv.getEmployeeList("emp_name", words, 0, 10);
		mav.addObject("eList", list);
		mav.setViewName("erp/common/erp_message/message_sendForm");
		
		return mav;
	}
	
	// 보낸 메세지 삭제
	@RequestMapping("/common/delSendMsgAll")
	@ResponseBody
	public String delSendMsg(@RequestParam(value = "chkSelDel[]") List<String> chkSelDel) {
		System.out.println(chkSelDel);
		int msgId;
		for (String list : chkSelDel) {
			msgId = Integer.parseInt(list);
			messageSrv.changeMsgSendDel(msgId);
		}
		return "success";
	}
	
	// 받은 메세지 삭제
		@RequestMapping("/common/delFromMsgAll")
		@ResponseBody
		public String delFromMsg(@RequestParam(value = "chkSelDel[]") List<String> chkSelDel) {
			System.out.println(chkSelDel);
			int msgId;
			for (String list : chkSelDel) {
				msgId = Integer.parseInt(list);
				messageSrv.changeMsgFromDel(msgId);
			}
			return "success";
		}
}