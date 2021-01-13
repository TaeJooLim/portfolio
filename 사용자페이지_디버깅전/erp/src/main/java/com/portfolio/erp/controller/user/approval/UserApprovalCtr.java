package com.portfolio.erp.controller.user.approval;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.order.OrderVO;
import com.portfolio.erp.model.paging.PagingVO;
import com.portfolio.erp.service.admin.order.OrderSrv;
import com.portfolio.erp.service.admin.vacation.VacationSrv;
import com.portfolio.erp.service.common.CommonSrv;

@Controller
public class UserApprovalCtr {

	@Autowired
	VacationSrv vacationSrv;
	
	@Autowired
	OrderSrv orderSrv;
	
	@Autowired
	CommonSrv commonSrv;
	
	// 미결함
	@RequestMapping("/user/appWaiting")
	public ModelAndView getApprovalWaiting(	@RequestParam int empId, 
											@RequestParam(defaultValue="V") String appType,
											@RequestParam(defaultValue="all") String searchOpt,
											@RequestParam(defaultValue="") String words,
											@RequestParam(defaultValue="1") int curPage) {
		ModelAndView mav = new ModelAndView();
		int listCnt = 0;
		
		// 휴가사용신청서 확인
		if (appType.equals("V")) {listCnt = vacationSrv.getAppVacationListCnt(searchOpt, words, "N");}
		
		// 구매요청서 확인
		else {listCnt = orderSrv.getAppOrderListCnt(searchOpt, words, "N");}

		// 페이징처리 (5개씩 처리)
		PagingVO pagingvo = new PagingVO(listCnt, curPage);
		int startIndex = pagingvo.getStartIndex();
		int pageSize = pagingvo.getPageSize();
		
		List<OrderVO> oList = orderSrv.getAppOrderList(searchOpt, words, startIndex, pageSize, "N");
		mav.addObject("approvalType", "구매요청서");
		if (appType.equals("V")) {
			oList = vacationSrv.getAppVacationList(searchOpt, words, startIndex, pageSize, "N");
			mav.addObject("approvalType", "휴가사용신청서");
		}
		
		mav.addObject("appType", appType);
		mav.addObject("listCnt", listCnt);
		mav.addObject("pagingvo", pagingvo);
		mav.addObject("List", oList);
		
		mav.setViewName("erp/user/erp_approval/approval_waiting");
		return mav;
	}
	
	// 완결함
	@RequestMapping("/user/appComplete")
	public ModelAndView getApprovalComplete(@RequestParam int empId, 
											@RequestParam(defaultValue="V") String appType,
											@RequestParam(defaultValue="all") String searchOpt,
											@RequestParam(defaultValue="") String words,
											@RequestParam(defaultValue="1") int curPage) {
		
		ModelAndView mav = new ModelAndView();
		int listCnt = 0;
		
		// 휴가사용신청서 확인
		if (appType.equals("V")) {listCnt = vacationSrv.getAppVacationListCnt(searchOpt, words, "Y");}
		
		// 구매요청서 확인
		else {listCnt = orderSrv.getAppOrderListCnt(searchOpt, words, "Y");}

		// 페이징처리 (5개씩 처리)
		PagingVO pagingvo = new PagingVO(listCnt, curPage);
		int startIndex = pagingvo.getStartIndex();
		int pageSize = pagingvo.getPageSize();
		
		List<OrderVO> oList = orderSrv.getAppOrderList(searchOpt, words, startIndex, pageSize, "Y");
		mav.addObject("approvalType", "구매요청서");
		if (appType.equals("V")) {
			oList = vacationSrv.getAppVacationList(searchOpt, words, startIndex, pageSize, "Y");
			mav.addObject("approvalType", "휴가사용신청서");
		}
		
		mav.addObject("appType", appType);
		mav.addObject("listCnt", listCnt);
		mav.addObject("pagingvo", pagingvo);
		mav.addObject("List", oList);
		
		mav.setViewName("erp/user/erp_approval/approval_complete");
		return mav;
	}
	
	// 상신함
	@RequestMapping("/user/appSend")
	public ModelAndView getApprovalSend(@RequestParam int empId, 
										@RequestParam(defaultValue="V") String appType,
										@RequestParam(defaultValue="all") String searchOpt,
										@RequestParam(defaultValue="") String words,
										@RequestParam(defaultValue="1") int curPage) {
		
		ModelAndView mav = new ModelAndView();
		int listCnt = 0;
		
		// 휴가사용신청서 확인
		if (appType.equals("V")) {listCnt = vacationSrv.getAppVacationSendListCnt(searchOpt, words, empId);}
		
		// 구매요청서 확인
		else {listCnt = orderSrv.getAppOrderSendListCnt(searchOpt, words, empId);}

		// 페이징처리 (5개씩 처리)
		PagingVO pagingvo = new PagingVO(listCnt, curPage);
		int startIndex = pagingvo.getStartIndex();
		int pageSize = pagingvo.getPageSize();
		
		List<OrderVO> oList = orderSrv.getAppOrderSendList(searchOpt, words, startIndex, pageSize, empId);
		mav.addObject("approvalType", "구매요청서");
		if (appType.equals("V")) {
			oList = vacationSrv.getAppVacationSendList(searchOpt, words, startIndex, pageSize, empId);
			mav.addObject("approvalType", "휴가사용신청서");
		}
		
		mav.addObject("appType", appType);
		mav.addObject("listCnt", listCnt);
		mav.addObject("pagingvo", pagingvo);
		mav.addObject("List", oList);
		
		mav.setViewName("erp/user/erp_approval/approval_send");
		return mav;
	}
}
