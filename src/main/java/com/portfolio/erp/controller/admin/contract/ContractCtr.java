package com.portfolio.erp.controller.admin.contract;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.client.ClientVO;
import com.portfolio.erp.model.contract.ContractVO;
import com.portfolio.erp.model.produce.ProduceVO;
import com.portfolio.erp.model.product.ProductVO;
import com.portfolio.erp.service.admin.client.ClientSrv;
import com.portfolio.erp.service.admin.company.CompanySrv;
import com.portfolio.erp.service.admin.contract.ContractSrv;
import com.portfolio.erp.service.admin.produce.ProduceSrv;
import com.portfolio.erp.service.admin.product.ProductSrv;

@Controller
public class ContractCtr {
	
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
	
	@RequestMapping("/admin/contract")
	public ModelAndView getContract(@ModelAttribute ClientVO vo) {	
		ModelAndView mav = new ModelAndView();
		
		//거래처 join값 표시
		List<ClientVO> clist = clSrv.getClients("client_company", "");
		mav.addObject("companyVO", companySrv.getCompanyInfo());
		mav.addObject("clist",clist);
		mav.setViewName("erp/admin/erp_contract/contract");
		return mav;		
	}
	
	//거래처 불러오기
	@RequestMapping("/admin/contract_client")
	@ResponseBody
	public ClientVO clientComOne(@RequestParam int clientId) {	
		ClientVO cvo = new ClientVO();
		cvo.setClientId(clientId);
		ClientVO cOne = clSrv.getClientOne(cvo);
		return cOne;		
	}
	
	@RequestMapping("/admin/contract_insert")
	public String setContract(@ModelAttribute ContractVO cvo) {
		
		//contDocNum 계산
		String contDocNum = cvo.getTime() + cvo.getContClientCode();
		cvo.setContDocNum(contDocNum);
		
		cSrv.setContract(cvo);

		return "redirect:/admin/contract_detail?contID="+cSrv.getContID();	
	}
	
	@RequestMapping("/admin/contract_detail")
	public ModelAndView getContractDetail(	@RequestParam int contID,
											@RequestParam(defaultValue = "p_name") String searchOpt, 
											@RequestParam(defaultValue = "") String words) {	
		ModelAndView mav = new ModelAndView();
		
		String contDocNum = cSrv.getcontDocNum(contID);
		List<ContractVO> list = cSrv.getContDList(contDocNum);
		int count = cSrv.countCD(contDocNum);
		
		List<ClientVO> clist = clSrv.getClients("client_company", "");
		
		mav.addObject("clist",clist);
		
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("contID",contID);
		mav.addObject("contDocNum",contDocNum);
		//product 불러온 값 표시
		mav.addObject("pList", productSrv.getProductList(searchOpt, words));
		mav.setViewName("erp/admin/erp_contract/contract");		
		return mav;		
	}
	
	@RequestMapping("/admin/contract_detail_list")
	public ModelAndView setContDpName(@RequestParam int contID, @ModelAttribute ContractVO cvo) {
		ModelAndView mav = new ModelAndView();
		
		String contDocNum = cSrv.getcontDocNum(contID);
		List<ContractVO> list = cSrv.getContDList(contDocNum);
		int count = cSrv.countCD(contDocNum);
		
		// product 선택 값 화면에 표시
		cvo = cSrv.getproduct(cvo.getContDpName());
		
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("contID",contID);
		mav.addObject("contDocNum",contDocNum);
		mav.addObject("cvo",cvo);
		mav.setViewName("erp/admin/erp_contract/contract");		
		
		return mav;
	}
	
	
	@RequestMapping("/admin/contract_detail_prod")
	@ResponseBody
	public List<ProductVO> getContDpName(@ModelAttribute ContractVO cvo,
			@RequestParam(defaultValue = "p_name") String searchOpt, 
			@RequestParam(defaultValue = "") String words) {
	//product 검색 값 표시
		List<ProductVO> pList = productSrv.getProductList(searchOpt, words);
		return pList;	
	}
	
	//계약서 품목(detail) 등록
	@RequestMapping("/admin/contract_detail_insert")
	@ResponseBody
	public int setContD(@ModelAttribute ContractVO cvo) {
		int contID = cvo.getContID();
		cSrv.setContD(cvo);
	
		return contID;	
	}
	
	
	//계약서 품목(detail) 삭제
	@RequestMapping("/admin/contract_detail_delete")
	@ResponseBody
	public String setContDDel(@RequestParam int contDID) {	
		cSrv.setContDDel(contDID);
		return "success";		
	}
	
	//계약서 리스트
	@RequestMapping("/admin/contract_list")
	public ModelAndView getContractList(@RequestParam(defaultValue = "") String words, 
										@RequestParam(defaultValue = "cont_doc_num") String searchOpt) {	
		
		ModelAndView mav = new ModelAndView();
		int count = cSrv.countC();
		List<ContractVO> list = cSrv.getcontlist(words, searchOpt);
		
		
		mav.addObject("list", list);
		mav.addObject("count", count);
		mav.setViewName("erp/admin/erp_contract/contract_list");
		return mav;		
	}
	
	//계약서 리스트 삭제
	@RequestMapping("/admin/contract_list_delete")
	@ResponseBody
	public String setContDel(@RequestParam int contID) {	
		cSrv.setContDel(contID);
		return "success";	
	}
	
	//계약서 수정
	@RequestMapping("/admin/contract_modify")
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
		mav.addObject("pList", productSrv.getProductList(searchOpt, words));
		mav.setViewName("erp/admin/erp_contract/contract_modify");
		return mav;		
	}
	
	//계약서 수정 - 계약서 품목(detail) 검색
	@RequestMapping("/admin/contract_modify_prod")
	@ResponseBody
	public List<ProductVO> getContMpName(	@ModelAttribute ContractVO cvo,
											@RequestParam(defaultValue = "p_name") String searchOpt, 
											@RequestParam(defaultValue = "") String words) {
	
		List<ProductVO> pList = productSrv.getProductList(searchOpt, words);
		return pList;	
	}
	
	//계약서 수정 - 계약서 품목(detail) 삭제
	@RequestMapping("/admin/contract_modify_delete")
	@ResponseBody
	public String setContDModDel(@RequestParam int contDID) {	
		cSrv.setContDDel(contDID);
		return "success";		
	}
	
	//계약서 입력값 수정
	@RequestMapping("/admin/contract_modify_update")
	public String setContDModUp(@ModelAttribute ContractVO cvo) {	
		String contDocNum = cvo.getContDocNum();
		cSrv.setContDModUp(cvo);
		return "redirect:/admin/contract_modify?contDocNum="+contDocNum;		
	}
	
	//계약서 수정 - 계약서 품목(detail) 입력
	@RequestMapping("/admin/contract_modify_insert")
	@ResponseBody
	public String setContDM(@ModelAttribute ContractVO cvo) {
		String contDocNum = cvo.getContDocNum();
		cSrv.setContD(cvo);
	
		return contDocNum;	
	}
	
	// 생산등록 되었는지 확인 AJAX
	@RequestMapping("/admin/chkProduce")
	@ResponseBody
	public int chkProduce(@RequestParam String contDocNum) {
		return produceSrv.getProduceOne(contDocNum).size();
	}
	
	// 생산등록 되었는지 확인 AJAX
	@RequestMapping("/admin/chkQc")
	@ResponseBody
	public int chkQc(@RequestParam String contDocNum) {

		List<ProduceVO> list = produceSrv.getProduceOne(contDocNum);
		
		int cnt = 0;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getProdRelease().equals("Y")) cnt++;
		}
		
		// 계약서 내의 제품들 모두 출고완료 되었을 경우 '1' 출력 / 그렇지 않을 경우 '0' 출력
		if (list.size() == cnt) return 1;
		return 0;
	}
	
	// 견적서 폼 이동
	@RequestMapping("/admin/estimate")
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
		
		mav.setViewName("erp/admin/erp_contract/estimate_form");
		return mav;
	}
}
