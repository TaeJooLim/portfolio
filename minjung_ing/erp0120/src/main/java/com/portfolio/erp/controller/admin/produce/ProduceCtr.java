package com.portfolio.erp.controller.admin.produce;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.paging.PagingVO;
import com.portfolio.erp.model.produce.ProduceVO;
import com.portfolio.erp.service.admin.contract.ContractSrv;
import com.portfolio.erp.service.admin.produce.ProduceSrv;
import com.portfolio.erp.service.admin.product.ProductSrv;

@Controller
public class ProduceCtr {

	@Autowired
	ProduceSrv produceSrv;
	
	@Autowired
	ProductSrv productSrv;
	
	@Autowired
	ContractSrv contractSrv;
	
	// 생산현황 JSP연결
	@RequestMapping("/admin/produce")
	public ModelAndView getProduce(@RequestParam String contDocNum) {
		ModelAndView mav = new ModelAndView();
		
		List<ProduceVO> list = produceSrv.getProduceOne(contDocNum);
		if(list.size() == 0) {
			produceSrv.setProduceOne(contDocNum);
		}
		mav.addObject("cvo", contractSrv.getcontDMOne(contDocNum));
		mav.addObject("contDocNum", contDocNum);
		mav.addObject("pList", produceSrv.getProduceOne(contDocNum));
		
		mav.setViewName("erp/admin/erp_produce/produce");
		return mav;
	}
	
	// 품질검사 JSP연결
	@RequestMapping("/admin/qc")
	public ModelAndView getQc(@RequestParam String contDocNum) {
		ModelAndView mav = new ModelAndView();
		
		List<ProduceVO> list = produceSrv.getProduceOne(contDocNum);
		if(list.size() == 0) {
			produceSrv.setProduceOne(contDocNum);
		}
		mav.addObject("cvo", contractSrv.getcontDMOne(contDocNum));
		mav.addObject("contDocNum", contDocNum);
		mav.addObject("pList", produceSrv.getProduceOne(contDocNum));
		
		mav.setViewName("erp/admin/erp_produce/qc");
		return mav;
		
	}
	
	// 출고상품목록 JSP연결
	@RequestMapping("/admin/release_list")
	public ModelAndView getReleaseList(	@RequestParam(defaultValue="prod_p_name") String searchOpt, 
										@RequestParam(defaultValue="") String words,
										@RequestParam(defaultValue="1") int curPage) {
		ModelAndView mav = new ModelAndView();
		
		// 검색된 리스트의 전체갯수
		int listCnt = produceSrv.getReleaseListCnt(searchOpt, words);
		
		// 페이징처리
		PagingVO pagingvo = new PagingVO(listCnt, curPage);
		int startIndex = pagingvo.getStartIndex();
		int pageSize = pagingvo.getPageSize();
		
		mav.addObject("pList", produceSrv.getReleaseList(searchOpt, words, startIndex, pageSize));
		mav.addObject("listCnt", listCnt);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		mav.addObject("pagingvo", pagingvo);
		
		mav.setViewName("erp/admin/erp_produce/release_list");
		return mav;
	}
	
	// 품질검사결과 수정 AJAX
	@RequestMapping("/admin/updateQcOne")
	@ResponseBody
	public String updateQcOne(@RequestParam String prodValue, @RequestParam int num, @RequestParam int prodId) {
		String processName = "prod_process" + num;
		produceSrv.updateQcOne(processName, prodValue, prodId);
		
		return "success";
	}
}
