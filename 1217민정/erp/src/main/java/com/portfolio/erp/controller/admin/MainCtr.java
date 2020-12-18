package com.portfolio.erp.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainCtr {

	@RequestMapping("/admin_main")
	public String getMain() {
		return "erp/admin/admin_main";
	}
}
