package com.portfolio.erp.controller.admin.vacation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.paging.PagingVO;
import com.portfolio.erp.model.vacation.VacationVO;
import com.portfolio.erp.service.admin.employee.EmpSrv;
import com.portfolio.erp.service.admin.vacation.VacationSrv;

@Controller
public class VacationCtr {
	
	@Autowired
	EmpSrv empSrv;
	
	@Autowired
	VacationSrv vcSrv;
	
	
	// 연차사용목록 전체(검색)
	@RequestMapping("/admin/vacation_list")
	public ModelAndView getVacationList(@RequestParam(defaultValue = "emp_name") String searchOpt, 
										@RequestParam(defaultValue = "") String words,
										@RequestParam(defaultValue = "1") int curPage) {
		ModelAndView mav = new ModelAndView();

		/*검색된 개수*/
		int vCnt = vcSrv.getVacationCnt(searchOpt, words);
		/*페이징*/
		PagingVO pagingvo = new PagingVO(vCnt, curPage);
		// 입력한 페이지번호에 따라서 시작번호가 바뀜
		int startIndex = pagingvo.getStartIndex();
		int pageSize = pagingvo.getPageSize();

		mav.addObject("vCnt", vCnt);
		mav.addObject("vList", vcSrv.getVacationListAll(searchOpt, words, startIndex, pageSize));
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		mav.addObject("pagingvo", pagingvo);
		mav.setViewName("erp/admin/erp_vacation/vacation_info_list");
		return mav;
	}

	//연차신청 결재 업데이트
	@RequestMapping("/admin/vacation_confirm")
	@ResponseBody
	public String updateConfirm(@RequestParam String offDocNum) {
		vcSrv.updateConfirm(offDocNum);
		return "success";
	}

	//연차신청 Form
	@RequestMapping("/admin/vacationForm")
	public ModelAndView getVacationForm(@RequestParam String offDocNum) {
		ModelAndView mav = new ModelAndView();
		VacationVO vvo = vcSrv.getVacationForm(offDocNum);

		mav.addObject("vList", vvo);
		mav.setViewName("erp/admin/erp_vacation/vacation_form");
		return mav;
	}
	
}
