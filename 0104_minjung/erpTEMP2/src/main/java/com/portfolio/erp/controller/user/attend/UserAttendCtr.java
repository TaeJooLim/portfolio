package com.portfolio.erp.controller.user.attend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserAttendCtr {

	@RequestMapping("/user/attend_list")
	public String getAttendList() {
		return "/erp/user/erp_attend/attend_list";
	}
}
