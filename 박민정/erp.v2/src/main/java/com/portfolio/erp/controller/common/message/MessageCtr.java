package com.portfolio.erp.controller.common.message;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageCtr {

	// 메세지 보관함 연결
	@RequestMapping("/common/message_list")
	public String getMessageList() {
		return "erp/common/erp_message/message_list";
	}
	
	// 메세지 보내기 폼 연결
	@RequestMapping("/common/message_send")
	public String getMessageSendForm() {
		return "erp/common/erp_message/message_sendForm";
	}
}