package com.portfolio.erp.controller.user.order;
	
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.model.order.OrderVO;
import com.portfolio.erp.model.paging.PagingVO;
import com.portfolio.erp.model.product.ProductVO;
import com.portfolio.erp.service.admin.order.OrderSrv;
import com.portfolio.erp.service.admin.product.ProductSrv;
import com.portfolio.erp.service.common.CommonSrv;

@Controller
public class UserOrderCtr {
	
	@Autowired
	ProductSrv productSrv;
	
	@Autowired
	OrderSrv orderSrv;
	
	@Autowired
	CommonSrv commonSrv;
	
	// 구매요청서 작성 JSP연결
	@RequestMapping("/user/order_insert")
	public ModelAndView getOrder(@RequestParam String empDepartment) {
		ModelAndView mav = new ModelAndView();
		
		// 날짜자동계산
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		// 품명 불러오기
		int listCnt = productSrv.getProductCnt("p_name", "");
		List<ProductVO> pList = productSrv.getProductList("p_name", "", 0, listCnt);
		
		// 부서 불러오기
		List<EmployeeVO> dList = commonSrv.getDepartmentList();
		
		// 문서번호 자동완성(부서코드_년도_월_buy)
		String orderDocNum = empDepartment+"_"+year+"_"+month+"_buy";
		
		// 문서번호로 리스트 불러오기
		List<OrderVO> orderList = orderSrv.getOrderList(orderDocNum);
		
		// 총무부 부서장 emp_id검색
		EmployeeVO evo = commonSrv.getHeadInfo("400");	
		
		mav.addObject("year", year);
		mav.addObject("month", month);
		mav.addObject("day", day);
		mav.addObject("dList", dList);
		mav.addObject("prodList", pList);
		mav.addObject("headInfo", evo);
		mav.addObject("orderDocNum", orderDocNum);
		mav.addObject("orderList",orderList);
		mav.addObject("empDepartment", empDepartment);
		
		// 구매요청서 작성을 하지 않았을 경우, 예외처리
		if(orderList.size() != 0) {
			mav.addObject("orderConfirm", orderList.get(0).getOrderConfirm());
		}
		
		mav.setViewName("erp/user/erp_order/order_insert");
		
		return mav;		
	}
	
	// 구매요청서 FORM JSP연결
	@RequestMapping("/user/orderForm")
	public ModelAndView getOrderForm(@RequestParam String orderDocNum) {
		ModelAndView mav = new ModelAndView();
		List<OrderVO> list = orderSrv.getOrderFormInfo(orderDocNum);
		
		mav.addObject("empDepartmentName", list.get(list.size() - 1).getEmpDepartmentName());
		mav.addObject("empPositionName", list.get(list.size() - 1).getEmpPositionName());
		mav.addObject("orderEmpName", list.get(list.size() - 1).getOrderEmpName());
		mav.addObject("orderDocNum", orderDocNum);
		mav.addObject("orderDate", list.get(list.size() - 1).getOrderDate());
		mav.addObject("orderConfirm", list.get(list.size() - 1).getOrderConfirm());
		mav.addObject("orderConfirmDate", list.get(list.size() - 1).getOrderConfirmDate());
		mav.addObject("orderList", list);
		mav.addObject("orderSubject", list.get(list.size() - 1).getOrderSubject());
		
		// 총액 자동계산
		int tPrice = 0;
		for (int i = 0; i < list.size(); i++) {
			tPrice += list.get(i).getOrderTotalPrice();
		}
		mav.addObject("tPrice", tPrice);
		
		mav.setViewName("erp/user/erp_order/order_form");
		return mav;
	}
	
	// 구매요청서 목록 JSP연결
	@RequestMapping("/user/orderList")
	public ModelAndView getOrderList(@RequestParam(defaultValue="all") String searchOpt,
									 @RequestParam(defaultValue="") String words, 
									 @RequestParam(defaultValue = "1") int curPage) {
		ModelAndView mav = new ModelAndView();
		
		// 검색된 개수
		int listCnt = orderSrv.getCntOrderList(searchOpt, words);
		// 페이징처리
		PagingVO pagingvo = new PagingVO(listCnt, curPage);
					
		// 입력한 페이지번호에 따라서 시작번호가 바뀜
		int startIndex = pagingvo.getStartIndex();
		int pageSize = pagingvo.getPageSize();

		// 부서 불러오기
		List<EmployeeVO> dList = commonSrv.getDepartmentList();
		mav.addObject("dList", dList);
		
		// 구매요청서 제목리스트 불러오기
		List<OrderVO> subjectList = orderSrv.getOrderSubjectList(searchOpt, words, startIndex, pageSize);
		
		mav.addObject("listCnt",listCnt);
		mav.addObject("subjectList", subjectList);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("pagingvo", pagingvo);
		mav.setViewName("erp/user/erp_order/order_list");
		
		return mav;
	}
}