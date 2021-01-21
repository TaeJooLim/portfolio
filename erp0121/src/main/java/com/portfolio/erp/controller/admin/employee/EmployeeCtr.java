package com.portfolio.erp.controller.admin.employee;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.model.paging.PagingVO;
import com.portfolio.erp.service.admin.employee.EmpSrv;
import com.portfolio.erp.service.common.CommonSrv;
import com.portfolio.erp.service.regnlog.RegnlogSrv;

@Controller
@RequestMapping("/admin")
public class EmployeeCtr {
	
	@Autowired
	EmpSrv empSrv;
	
	@Autowired
	RegnlogSrv regnlogSrv;
	
	@Autowired
	CommonSrv commonSrv;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	@RequestMapping(value="/employee_register", method = RequestMethod.GET)
	public ModelAndView getEmployeeReg(@ModelAttribute EmployeeVO evo, @RequestParam int empId) {
		
		EmployeeVO empvo = empSrv.getEmployeeOne(empId);
		
		List<EmployeeVO> pList = commonSrv.getPositionList();
	    List<EmployeeVO> dList = commonSrv.getDepartmentList();
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pList", pList);
		mav.addObject("dList", dList);
		mav.addObject("employee", empvo);
		mav.setViewName("erp/admin/erp_employee/employee_register");
		
		return mav;
	}
	
	@RequestMapping(value="/employee_register", method = RequestMethod.POST)	
	public String setEmployeeReg(@ModelAttribute EmployeeVO evo, @RequestPart MultipartFile file) throws IOException  {
		
		/* 파일 업로드 */
		if (file.isEmpty()) {}
		else {
			UUID uuid = UUID.randomUUID();
			
			String fileName = uuid.toString() + "_" + file.getOriginalFilename();
			File location = new File(uploadPath+"/emp", fileName);
			FileCopyUtils.copy(file.getBytes(), location);
			
			evo.setEmpPhoto(fileName);
			/* 파일 업로드 */
			
		}
		empSrv.setEmpDetail(evo);
		return "redirect:/admin/employee_list";
	}
	
	@RequestMapping("/employee_list")
	public ModelAndView getEmployeeList(@RequestParam(defaultValue="emp_name") String searchOpt, 
										@RequestParam(defaultValue="") String words, 
										@RequestParam(defaultValue="1") int curPage) {
		ModelAndView mav = new ModelAndView();
		
		// 검색된 갯수
		int listCnt = empSrv.getEmpCount(searchOpt, words);
		
		// 페이징처리
		PagingVO pagingvo = new PagingVO(listCnt, curPage);
		
		// 입력한 페이지번호에 따라서 시작번호가 바뀜
		int startIndex = pagingvo.getStartIndex();
		int pageSize = pagingvo.getPageSize();
		
		List<EmployeeVO> list = empSrv.getEmployeeList(searchOpt, words, startIndex, pageSize);
		
		mav.addObject("listCnt", listCnt);
		mav.addObject("list", list);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		mav.addObject("pagingvo", pagingvo);
		
		mav.setViewName("erp/admin/erp_employee/employee_list");
		return mav;
	}
	
	@RequestMapping("/head_change")
	@ResponseBody
	public String headChange(@RequestParam String headType, @RequestParam String empNum) {
		//System.out.println(headType);
		//System.out.println(empNum);
		empSrv.headChange(headType, empNum);
		return "success";
	}
	
	@RequestMapping("/confirm_change")
	@ResponseBody
	public String confirmChange(@RequestParam String confirmType, @RequestParam String empNum) {
		//System.out.println(confirmType);
		System.out.println(empNum);
		empSrv.confirmChange(confirmType, empNum);
		return "success";
	}
	
	@RequestMapping("/employee_delete")
	@ResponseBody
	public String setEmployeeDelete(@RequestParam int empId) {
		System.out.println(empId);
		empSrv.setEmployeeDelete(empId);
		return "success";
	}
	
	@RequestMapping("/auth_change")
	@ResponseBody
	public String authChange(@RequestParam int auth, @RequestParam int empId) {
		
		empSrv.authChange(auth, empId);
		return "success";
	}
	
	// organization_chart
	@RequestMapping("/organization_chart")
	public ModelAndView getOrganization(@RequestParam(defaultValue="emp_name") String searchOpt, 
										@RequestParam(defaultValue="") String words, 
										@RequestParam String empDepartment,
										@RequestParam(defaultValue="1") int curPage) {
		ModelAndView mav = new ModelAndView();
		
		List<EmployeeVO> dList = commonSrv.getDepartmentList();
		
		int listCnt = empSrv.getCntOrganization(searchOpt, words, empDepartment);
		
		// 페이징처리
		PagingVO pagingvo = new PagingVO(listCnt, curPage);
		
		// 입력한 페이지번호에 따라서 시작번호가 바뀜
		int startIndex = pagingvo.getStartIndex();
		int pageSize = pagingvo.getPageSize();		
		
		/*부서코드 별 Select employeeList*/
		List<EmployeeVO> list = empSrv.getEmpOrganization(searchOpt, words, empDepartment, startIndex, pageSize);

		
		mav.addObject("list", list);
		mav.addObject("empDepartment", empDepartment);
		mav.addObject("departName", commonSrv.getDepartmentOne(empDepartment));
		mav.addObject("dList", dList);
		mav.addObject("listCnt", listCnt);
		mav.addObject("pagingvo", pagingvo);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		mav.setViewName("erp/admin/erp_employee/organization_chart");
		return mav;
	}

}
