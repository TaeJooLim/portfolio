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
import com.portfolio.erp.model.product.ProductVO;
import com.portfolio.erp.service.admin.client.ClientSrv;
import com.portfolio.erp.service.admin.contract.ContractSrv;
import com.portfolio.erp.service.admin.product.ProductSrv;

@Controller
public class ContractCtr {
	
	@Autowired
	ContractSrv cSrv;
	
	@Autowired
	ClientSrv clSrv;
	
	@Autowired
	ProductSrv productSrv;
	
	@RequestMapping("/admin/contract")
	public ModelAndView getContract(@ModelAttribute ClientVO vo) {	
		ModelAndView mav = new ModelAndView();
		List<ClientVO> clist = clSrv.getClients("client_company", "");
		mav.addObject("count",0);
		mav.addObject("clist",clist);
		mav.setViewName("erp/admin/erp_contract/contract");
		return mav;		
	}
	
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
		cvo.setContDocNum("0");
		String clientLicenseNumFk = cvo.getClientLicenseNumFk();	
		cSrv.setContract(cvo);

		int contID = cSrv.getID(clientLicenseNumFk);
		String clientCode = cSrv.getCode(clientLicenseNumFk,contID);
		String contDocNum = cvo.getTime()+ clientCode+ contID;
		cSrv.setContDocNum(contDocNum, contID);
		
		return "redirect:/admin/contract_detail?contID="+contID;		
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
	
		List<ProductVO> pList = productSrv.getProductList(searchOpt, words);
		
		return pList;	
	}
	
	@RequestMapping("/admin/contract_detail_insert")
	@ResponseBody
	public int setContD(@ModelAttribute ContractVO cvo) {
		int contID = cvo.getContID();
		cSrv.setContD(cvo);
	
		return contID;	
	}
	
	@RequestMapping("/admin/contract_detail_delete")
	@ResponseBody
	public String setContDDel(@RequestParam int contDID) {	
		cSrv.setContDDel(contDID);
		return "success";		
	}

	@RequestMapping("/admin/contract_list")
	public ModelAndView getContractList(@RequestParam(defaultValue = "") String words, 
										@RequestParam(defaultValue = "cont_doc_num") String searchOpt) {	
		
		ModelAndView mav = new ModelAndView();
		int count = cSrv.countC();
		List<ContractVO> list = cSrv.getcontlist(words,searchOpt);
		mav.addObject("list",list);
		mav.addObject("count",count);
		mav.setViewName("erp/admin/erp_contract/contract_list");
		return mav;		
	}
	
	@RequestMapping("/admin/contract_list_delete")
	@ResponseBody
	public String setContDel(@RequestParam int contID) {	
		cSrv.setContDel(contID);
		return "success";		
	}
	
	@RequestMapping("/admin/contract_modify")
	public ModelAndView getContModify(	@RequestParam String contDocNum,
										@RequestParam(defaultValue = "p_name") String searchOpt, 
										@RequestParam(defaultValue = "") String words,
										@ModelAttribute ContractVO cvo) {	
		ModelAndView mav = new ModelAndView();
		
		if(cvo.getContDpName() != null) {
			ContractVO prod = cSrv.getproduct(cvo.getContDpName());
			mav.addObject("cvo",prod);
		}
		
		int count = cSrv.countCD(contDocNum);
		cvo = cSrv.getcontDMOne(contDocNum);
		List<ContractVO> list = cSrv.getContDList(contDocNum);
		mav.addObject("contID",cvo.getContID());
		mav.addObject("clientLicenseNumFk",cvo.getClientLicenseNumFk());
		mav.addObject("m",cvo);
		mav.addObject("list",list);
		mav.addObject("count",count);
		mav.addObject("contDocNum",contDocNum);
		mav.addObject("pList", productSrv.getProductList(searchOpt, words));
		mav.setViewName("erp/admin/erp_contract/contract_modify");
		return mav;		
	}
	
	@RequestMapping("/admin/contract_modify_prod")
	@ResponseBody
	public List<ProductVO> getContMpName(	@ModelAttribute ContractVO cvo,
											@RequestParam(defaultValue = "p_name") String searchOpt, 
											@RequestParam(defaultValue = "") String words) {
	
		List<ProductVO> pList = productSrv.getProductList(searchOpt, words);
		return pList;	
	}
	
	@RequestMapping("/admin/contract_modify_delete")
	@ResponseBody
	public String setContDModDel(@RequestParam int contDID) {	
		cSrv.setContDDel(contDID);
		return "success";		
	}
	
	@RequestMapping("/admin/contract_modify_update")
	public String setContDModUp(@ModelAttribute ContractVO cvo) {	
		String contDocNum = cvo.getContDocNum();
		cSrv.setContDModUp(cvo);
		return "redirect:/admin/contract_modify?contDocNum="+contDocNum;		
	}
	
	@RequestMapping("/admin/contract_modify_insert")
	@ResponseBody
	public String setContDM(@ModelAttribute ContractVO cvo) {
		String contDocNum = cvo.getContDocNum();
		cSrv.setContD(cvo);
	
		return contDocNum;	
	}
	
}
