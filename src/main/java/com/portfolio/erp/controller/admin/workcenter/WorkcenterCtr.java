package com.portfolio.erp.controller.admin.workcenter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.model.workcenter.WorkcenterVO;
import com.portfolio.erp.service.admin.employee.EmpSrv;
import com.portfolio.erp.service.admin.workcenter.WorkcenterSrv;

@Controller
public class WorkcenterCtr {
	
	@Autowired
	WorkcenterSrv wSrv;
	
	@Autowired
	EmpSrv empSrv;
	
	//workcenter 리스트 출력
	@RequestMapping("/admin/workcenter")
	public ModelAndView getworkcenter() {
		
		ModelAndView mav = new ModelAndView();
		
		int count = wSrv.count();
		List<WorkcenterVO> list = wSrv.getworkcenterList();
		mav.addObject("list", list);
		mav.addObject("count", count);
		mav.setViewName("erp/admin/erp_workcenter/workcenter_reg");
		return mav;	
	}
	
	// employee에서 검색
	@RequestMapping("/admin/workcenter_empChk")
	@ResponseBody
	public List<EmployeeVO> getempChk(@ModelAttribute EmployeeVO evo) {
		List<EmployeeVO> list = empSrv.getEmployeeList("emp_name", evo.getEmpName(), 0, 10);
		return list;
	}
	
	// 입력
	@RequestMapping("/admin/workcenter_insert")
	public String setworkcenter(@ModelAttribute WorkcenterVO wvo) {
		wSrv.setworkcenter(wvo);
		return "redirect:/admin/workcenter";
	}
	
	//삭제
	@RequestMapping("/admin/workcenter_del")
	@ResponseBody
	public void setworkcenterDel(@RequestParam int wcId) {
		wSrv.setworkcenterDel(wcId);
	}
}
