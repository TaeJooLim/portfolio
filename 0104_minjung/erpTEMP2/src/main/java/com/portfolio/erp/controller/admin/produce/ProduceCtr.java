package com.portfolio.erp.controller.admin.produce;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProduceCtr {

	// 생산현황 JSP연결
	@RequestMapping("/admin/produce")
	public String getProduce() {
		return "erp/admin/erp_produce/produce";
	}
	
	// 품질검사 JSP연결
	@RequestMapping("/admin/qc")
	public String getQc() {
		return "erp/admin/erp_produce/qc";
	}
	
	// 출고상품목록 JSP연결
	@RequestMapping("/admin/release_list")
	public String getReleaseList() {
		return "erp/admin/erp_produce/release_list";
	}
}
