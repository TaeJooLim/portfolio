package com.portfolio.erp.controller.admin.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.client.ClientVO;
import com.portfolio.erp.model.product.ProductVO;
import com.portfolio.erp.service.admin.client.ClientSrv;
import com.portfolio.erp.service.admin.product.ProductSrv;

@Controller
public class ProductCtr {

	@Autowired
	ProductSrv productSrv;
	
	@Autowired
	ClientSrv clientSrv;
	
	// 상품입력 jsp연결
	@RequestMapping(value = "/admin/product_reg", method = RequestMethod.GET)
	public ModelAndView getProdcutReg() {
		ModelAndView mav = new ModelAndView();

		// 거래처리스트
		List<ClientVO> list = clientSrv.getClients("client_company","");
		int count = clientSrv.getClientCount("client_company","");
		mav.addObject("cList", list);
		mav.addObject("cCount", count);
		
		// 상품리스트
		mav.addObject("pList", productSrv.getProductList("p_name", ""));
		mav.addObject("pCnt", productSrv.getProductCnt("p_name", ""));
		mav.setViewName("erp/admin/erp_product/product_reg");
		
		return mav;
	}
	
	// 상품정보 DB에 입력
	@RequestMapping(value = "/admin/product_reg", method = RequestMethod.POST)
	public ModelAndView setProdcutOne(@ModelAttribute ProductVO pvo) {
		ModelAndView mav = new ModelAndView();
		
		pvo.setpCode(pvo.getpType() + pvo.getpGroup());
		productSrv.setProductOne(pvo);
		
		mav.addObject("msg", "상품입력이 정상적으로 완료되었습니다.");
		mav.addObject("pList", productSrv.getProductList("p_name", ""));
		mav.setViewName("erp/admin/erp_product/product_reg");
		
		return mav;
	}
	
	// 상품정보 삭제 AJAX
	@RequestMapping("/admin/deleteProductOne")
	@ResponseBody
	public String deleteProductOne(@RequestParam int pId) {
		productSrv.deleteProductOne(pId);
		return "success";
	}
	
	// 상품목록 jsp연결 + 검색기능포함
	@RequestMapping("/admin/product_list")
	public ModelAndView getProductListJsp(@RequestParam(defaultValue = "p_name") String searchOpt, 
											@RequestParam(defaultValue = "") String words) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pList", productSrv.getProductList(searchOpt, words));
		mav.addObject("pCnt", productSrv.getProductCnt(searchOpt, words));
		mav.setViewName("erp/admin/erp_product/product_list");
		
		return mav;
	}
}