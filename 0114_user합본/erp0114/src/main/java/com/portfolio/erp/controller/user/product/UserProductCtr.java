package com.portfolio.erp.controller.user.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.client.ClientVO;
import com.portfolio.erp.model.paging.PagingVO;
import com.portfolio.erp.model.product.ProductVO;
import com.portfolio.erp.service.admin.client.ClientSrv;
import com.portfolio.erp.service.admin.product.ProductSrv;
import com.portfolio.erp.service.admin.workcenter.WorkcenterSrv;

@Controller
public class UserProductCtr {

	@Autowired
	ProductSrv productSrv;
	
	@Autowired
	ClientSrv clientSrv;
	
	@Autowired
	WorkcenterSrv wSrv;
	
	// 상품정보 입력 jsp연결
	@RequestMapping(value = "/user/product_reg", method = RequestMethod.GET)
	public ModelAndView getProdcutReg() {
		ModelAndView mav = new ModelAndView();

		// 거래처리스트
		List<ClientVO> list = clientSrv.getClientsAll();
		int count = clientSrv.getClientCount("client_company","");
		mav.addObject("cList", list);
		mav.addObject("cCount", count);
		
		// 상품리스트
		mav.addObject("pList", productSrv.getProductList("p_name", "", 0, 10));
		mav.addObject("pCnt", productSrv.getProductCnt("p_name", ""));
		mav.setViewName("erp/user/erp_product/product_reg");
		
		return mav;
	}
	
	// 상품정보 DB에 입력
	@RequestMapping(value = "/user/product_reg", method = RequestMethod.POST)
	public ModelAndView setProdcutOne(@ModelAttribute ProductVO pvo) {
		ModelAndView mav = new ModelAndView();
		
		pvo.setpCode(pvo.getpType() + pvo.getpGroup());
		productSrv.setProductOne(pvo);
		
		mav.addObject("pList", productSrv.getProductList("p_name", "", 0, 10));
		mav.setViewName("erp/user/erp_product/product_reg");
		
		return mav;
	}

	
	// 상품목록 jsp연결 + 검색기능포함
	@RequestMapping("/user/product_list")
	public ModelAndView getProductList(	@RequestParam(defaultValue = "p_name") String searchOpt, 
										@RequestParam(defaultValue = "") String words,
										@RequestParam(defaultValue = "1") int curPage) {
		
		ModelAndView mav = new ModelAndView();
		
		// 검색된 갯수
		int listCnt = productSrv.getProductCnt(searchOpt, words);
		
		// 페이징처리
		PagingVO pagingvo = new PagingVO(listCnt, curPage);
				
		// 입력한 페이지번호에 따라서 시작번호가 바뀜
		int startIndex = pagingvo.getStartIndex();
		int pageSize = pagingvo.getPageSize();
		
		mav.addObject("pList", productSrv.getProductList(searchOpt, words, startIndex, pageSize));
		mav.addObject("listCnt", productSrv.getProductCnt(searchOpt, words));
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		mav.addObject("pagingvo", pagingvo);
		
		mav.setViewName("erp/user/erp_product/product_list");
		
		return mav;
	}
	
	// 상품정보 수정 jsp 연결
	@RequestMapping(value = "/user/product_modify", method = RequestMethod.GET)
	public ModelAndView getProductModify(@RequestParam int pId) {
		ModelAndView mav = new ModelAndView();
		
		// 거래처리스트
		List<ClientVO> list = clientSrv.getClientsAll();
		mav.addObject("cList", list);
		
		mav.addObject("listCnt", productSrv.getProductCnt("p_name", ""));
		mav.addObject("pList", productSrv.getProductList("p_name", "", 0, 10));
		
		// 상품정보
		mav.addObject("pvo", productSrv.getProductOne(pId));
		mav.setViewName("erp/user/erp_product/product_modify");
		
		return mav;
	}
	
	// 상품정보 DB에 수정
	@RequestMapping(value = "/user/product_modify", method = RequestMethod.POST)
	public ModelAndView updateProdcutOne(@ModelAttribute ProductVO pvo) {
		ModelAndView mav = new ModelAndView();
		
		productSrv.updateProductOne(pvo);
		
		mav.setViewName("redirect:/user/product_list");
		return mav;
	}
	
	// 제품별 소요자재 및 공정관리 jsp연결 및 제품리스트 검색 및 원자재리스트 출력
	@RequestMapping("/user/BOMnProcess")
	public ModelAndView getBOMnProcess(	@RequestParam(defaultValue = "p_name") String searchOpt, 
										@RequestParam(defaultValue = "") String words) {
		
		ModelAndView mav = new ModelAndView();
		
		// 제품리스트
		mav.addObject("pList", productSrv.getTypeProductList(searchOpt, words, "A", 0, 10));
		
		// 원자재리스트
		mav.addObject("bList", productSrv.getTypeProductList("p_name", "", "B", 0, 10));
		
		// 워크센터리스트
		int listCnt = wSrv.count();
		mav.addObject("wcList", wSrv.getworkcenterList(0, listCnt));
		
		mav.setViewName("erp/user/erp_product/BOMnProcess");
		return mav;
	}


}