package com.portfolio.erp.controller.common.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.service.common.CommonSrv;

@Controller
public class CommonCtr {

	@Autowired
	CommonSrv commonSrv;

	@RequestMapping("/getDepartmentList")
	@ResponseBody
	public List<EmployeeVO> getDepartmentList() {
	   List<EmployeeVO> list = commonSrv.getDepartmentList();
	   return list;
	}
	   
	@RequestMapping("/getPositionList")
	@ResponseBody
	public List<EmployeeVO> getPositionList() {
	   List<EmployeeVO> list = commonSrv.getPositionList();
	   return list;
	}
}
