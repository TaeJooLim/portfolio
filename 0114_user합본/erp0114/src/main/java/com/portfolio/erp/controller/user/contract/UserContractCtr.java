package com.portfolio.erp.controller.user.contract;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.client.ClientVO;
import com.portfolio.erp.model.contract.ContractVO;
import com.portfolio.erp.model.paging.PagingVO;
import com.portfolio.erp.service.admin.client.ClientSrv;
import com.portfolio.erp.service.admin.company.CompanySrv;
import com.portfolio.erp.service.admin.contract.ContractSrv;
import com.portfolio.erp.service.admin.produce.ProduceSrv;
import com.portfolio.erp.service.admin.product.ProductSrv;

@Controller
public class UserContractCtr {
	
	@Autowired
	ContractSrv cSrv;
	
	@Autowired
	ClientSrv clSrv;
	
	@Autowired
	ProductSrv productSrv;
	
	@Autowired
	ProduceSrv produceSrv;
	
	@Autowired
	CompanySrv companySrv;
	
	@RequestMapping("/user/contract")
	public ModelAndView getContract(@ModelAttribute ClientVO vo) {	
		ModelAndView mav = new ModelAndView();
		
		//거래처 join값 표시
		List<ClientVO> clist = clSrv.getClientsAll();
		mav.addObject("companyVO", companySrv.getCompanyInfo());
		mav.addObject("clist",clist);
		mav.setViewName("erp/user/erp_contract/contract");
		return mav;		
	}

	@RequestMapping("/user/contract_insert")
	public String setContract(@ModelAttribute ContractVO cvo) {
		
		//contDocNum 계산
		String contDocNum = cvo.getTime() + cvo.getContClientCode();
		cvo.setContDocNum(contDocNum);
		
		cSrv.setContract(cvo);

		return "redirect:/user/contract_detail?contID="+cSrv.getContID();	
	}
	
	@RequestMapping("/user/contract_detail")
	public ModelAndView getContractDetail(	@RequestParam int contID,
											@RequestParam(defaultValue = "p_name") String searchOpt, 
											@RequestParam(defaultValue = "") String words) {	
		ModelAndView mav = new ModelAndView();
		
		String contDocNum = cSrv.getcontDocNum(contID);
		List<ContractVO> list = cSrv.getContDList(contDocNum);
		int count = cSrv.countCD(contDocNum);
		
		List<ClientVO> clist = clSrv.getClientsAll();
		
		mav.addObject("clist",clist);
		
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("contID",contID);
		mav.addObject("contDocNum",contDocNum);
		mav.addObject("companyVO", companySrv.getCompanyInfo());
		
		//product 불러온 값 표시
		mav.addObject("pList", productSrv.getTypeProductList(searchOpt, words, "A", 0, 10));
		mav.setViewName("erp/user/erp_contract/contract");		
		return mav;		
	}
	
	@RequestMapping("/user/contract_detail_list")
	public ModelAndView setContDpName(@RequestParam int contID, @ModelAttribute ContractVO cvo) {
		ModelAndView mav = new ModelAndView();
		
		String contDocNum = cSrv.getcontDocNum(contID);
		List<ContractVO> list = cSrv.getContDList(contDocNum);
		int count = cSrv.countCD(contDocNum);
		
		// product 선택 값 화면에 표시
		cvo = cSrv.getproduct(cvo.getContDpName());
		List<ClientVO> clist = clSrv.getClientsAll();

		mav.addObject("companyVO", companySrv.getCompanyInfo());
		mav.addObject("clist",clist);
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("contID",contID);
		mav.addObject("contDocNum",contDocNum);
		mav.addObject("cvo",cvo);
		mav.setViewName("erp/user/erp_contract/contract");		
		
		return mav;
	}

	//계약서 리스트
	@RequestMapping("/user/contract_list")
	public ModelAndView getContractList(@RequestParam(defaultValue = "") String words, 
										@RequestParam(defaultValue = "cont_doc_num") String searchOpt,
										@RequestParam(defaultValue="1") int curPage) {	
		
		ModelAndView mav = new ModelAndView();
		int listCnt = cSrv.countC(words, searchOpt);
		// 페이징처리
		PagingVO pagingvo = new PagingVO(listCnt, curPage);
				
		// 입력한 페이지번호에 따라서 시작번호가 바뀜
		int startIndex = pagingvo.getStartIndex();
		int pageSize = pagingvo.getPageSize();
		
		List<ContractVO> list = cSrv.getcontlist(words, searchOpt, startIndex, pageSize);
		
		
		mav.addObject("list", list);
		mav.addObject("listCnt", listCnt);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		mav.addObject("pagingvo", pagingvo);
		
		mav.setViewName("erp/user/erp_contract/contract_list");
		return mav;		
	}

	//계약서 수정
	@RequestMapping("/user/contract_modify")
	public ModelAndView getContModify(	@RequestParam String contDocNum,
										@RequestParam(defaultValue = "p_name") String searchOpt, 
										@RequestParam(defaultValue = "") String words,
										@ModelAttribute ContractVO cvo) {	
		ModelAndView mav = new ModelAndView();
		
		//계약서 수정 - 계약서 품목(detail) 리스트표시
		if(cvo.getContDpName() != null) {
			ContractVO prod = cSrv.getproduct(cvo.getContDpName());
			mav.addObject("cvo", prod);
		}
		
		int count = cSrv.countCD(contDocNum);
		cvo = cSrv.getcontDMOne(contDocNum);
		List<ContractVO> list = cSrv.getContDList(contDocNum);
		mav.addObject("companyVO", companySrv.getCompanyInfo());
		mav.addObject("contID",cvo.getContID());
		mav.addObject("clientLicenseNumFk",cvo.getClientLicenseNumFk());
		mav.addObject("m", cvo);
		mav.addObject("list", list);
		mav.addObject("count", count);
		mav.addObject("contDocNum",contDocNum);
		mav.addObject("pList", productSrv.getTypeProductList(searchOpt, words, "A", 0, 10));
		mav.setViewName("erp/user/erp_contract/contract_modify");
		return mav;		
	}
	
	//계약서 입력값 수정
	@RequestMapping("/user/contract_modify_update")
	public String setContDModUp(@ModelAttribute ContractVO cvo) {	
		String contDocNum = cvo.getContDocNum();
		cSrv.setContDModUp(cvo);
		return "redirect:/user/contract_modify?contDocNum="+contDocNum;		
	}
	
	// 견적서 폼 이동
	@RequestMapping("/user/estimate")
	public ModelAndView getEstimate(@RequestParam String contDocNum) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("companyVO", companySrv.getCompanyInfo());
		mav.addObject("contractVO", cSrv.getcontDMOne(contDocNum));
		mav.addObject("cList", cSrv.getContDList(contDocNum));
		
		// 공급가액 + 세액 전체합계 구하는 반복문
		List<ContractVO> list = cSrv.getContDList(contDocNum);
		int totalCost = 0;
		for (int i = 0; i < list.size(); i++) {
			totalCost += (list.get(i).getContDpSell() * list.get(i).getContDpAmount());
			totalCost += (list.get(i).getContDpSell() * list.get(i).getContDpAmount() * 0.1);
		}
		mav.addObject("totalCost", totalCost);
		
		mav.setViewName("erp/user/erp_contract/estimate_form");
		return mav;
	}
}
