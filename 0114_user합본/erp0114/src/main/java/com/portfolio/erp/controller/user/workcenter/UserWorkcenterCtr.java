package com.portfolio.erp.controller.user.workcenter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.paging.PagingVO;
import com.portfolio.erp.model.workcenter.WorkcenterVO;
import com.portfolio.erp.service.admin.employee.EmpSrv;
import com.portfolio.erp.service.admin.workcenter.WorkcenterSrv;

@Controller
public class UserWorkcenterCtr {
	
	@Autowired
	WorkcenterSrv wSrv;
	
	@Autowired
	EmpSrv empSrv;
	
	//workcenter 리스트 출력
	@RequestMapping("/user/workcenter")
	public ModelAndView getworkcenter(@RequestParam(defaultValue="1") int curPage) {
		
		ModelAndView mav = new ModelAndView();
		
		int listCnt = wSrv.count();
		
		// 페이징처리
		PagingVO pagingvo = new PagingVO(listCnt, curPage);
				
		// 입력한 페이지번호에 따라서 시작번호가 바뀜
		int startIndex = pagingvo.getStartIndex();
		int pageSize = pagingvo.getPageSize();
		List<WorkcenterVO> list = wSrv.getworkcenterList(startIndex, pageSize);
		
		
		mav.addObject("list", list);
		mav.addObject("listCnt", listCnt);
		mav.addObject("pagingvo", pagingvo);
		mav.setViewName("erp/user/erp_workcenter/workcenter_reg");
		return mav;	
	}
	
	// 입력
	@RequestMapping("/user/workcenter_insert")
	public String setworkcenter(@ModelAttribute WorkcenterVO wvo) {
		wSrv.setworkcenter(wvo);
		return "redirect:/user/workcenter";
	}

}
