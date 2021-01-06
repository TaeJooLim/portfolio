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
	
	// 상품정보 입력 jsp연결
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
	public ModelAndView getProductList(@RequestParam(defaultValue = "p_name") String searchOpt, 
											@RequestParam(defaultValue = "") String words) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pList", productSrv.getProductList(searchOpt, words));
		mav.addObject("pCnt", productSrv.getProductCnt(searchOpt, words));
		mav.setViewName("erp/admin/erp_product/product_list");
		
		return mav;
	}
	
	// 상품정보 수정 jsp 연결
	@RequestMapping(value = "/admin/product_modify", method = RequestMethod.GET)
	public ModelAndView getProductModify(@RequestParam int pId) {
		ModelAndView mav = new ModelAndView();
		
		// 거래처리스트
		List<ClientVO> list = clientSrv.getClients("client_company","");
		mav.addObject("cList", list);
		
		// 상품정보
		mav.addObject("pvo", productSrv.getProductOne(pId));
		mav.setViewName("erp/admin/erp_product/product_modify");
		
		return mav;
	}
	
	// 상품정보 DB에 수정
	@RequestMapping(value = "/admin/product_modify", method = RequestMethod.POST)
	public ModelAndView updateProdcutOne(@ModelAttribute ProductVO pvo) {
		ModelAndView mav = new ModelAndView();
		
		productSrv.updateProductOne(pvo);
		
		mav.addObject("msg", "상품정보수정이 정상적으로 완료되었습니다.");
		mav.addObject("pList", productSrv.getProductList("p_name", ""));
		mav.setViewName("redirect:/admin/product_list");
		
		return mav;
	}
	
	// 제품별 소요자재 및 공정관리 jsp연결 및 제품리스트 검색 및 원자재리스트 출력
	@RequestMapping("/admin/BOMnProcess")
	public ModelAndView getBOMnProcess(	@RequestParam(defaultValue = "p_name") String searchOpt, 
										@RequestParam(defaultValue = "") String words) {
		
		ModelAndView mav = new ModelAndView();
		
		// 제품리스트
		mav.addObject("pList", productSrv.getTypeProductList(searchOpt, words, "A"));
		
		// 원자재리스트
		mav.addObject("bList", productSrv.getTypeProductList("p_name", "", "B"));
		mav.setViewName("erp/admin/erp_product/BOMnProcess");
		
		return mav;
	}

	// 선택한 원자재정보 불러오기 AJAX
	@RequestMapping("/admin/getBtypeList")
	@ResponseBody
	public ProductVO getBtypeList(@RequestParam int pId) {
		return productSrv.getProductOne(pId);
	}
	
	// 원자재 입력 AJAX
	@RequestMapping("/admin/BOMInsert")
	@ResponseBody
	public String setBOMInsert(@ModelAttribute ProductVO pvo) {
		productSrv.setBOMInsert(pvo);
		return "success";
	}
	
	// 입력된 원자재(BOM)리스트 불러오기 AJAX
	@RequestMapping("/admin/getBOMList")
	@ResponseBody
	public List<ProductVO> getBOMList(@RequestParam int pIdFk) {
		List<ProductVO> list = productSrv.getBODList(pIdFk);
		return list;
	}
	
	// 입력된 원자재(BOM) 삭제하기 AJAX
	@RequestMapping("/admin/delBOMOne")
	@ResponseBody
	public String delBOMOne(@RequestParam int pIdFk, @RequestParam int pmIdFk) {
		productSrv.delBOMOne(pIdFk, pmIdFk);
		return "success";
	}
}