package com.portfolio.erp.controller.admin.attend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AttendCtr {

	@RequestMapping("/admin/attend_list")
	public String getAttendList() {
		return "/erp/admin/erp_attend/attend_list";
	}
}
