package com.portfolio.erp.controller.admin.client;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.admin.client.ClientVO;
import com.portfolio.erp.service.admin.client.ClientSrv;

@Controller
@RequestMapping("/admin")
public class ClientCtr {
	
	@Autowired
	ClientSrv clientSrv;
	
	@RequestMapping(value="/client_reg",method = RequestMethod.GET)
	public String getClientReg() {
		return "erp/admin/erp_client/client_reg";
	}
	
	@RequestMapping(value="/client_reg", method = RequestMethod.POST)
	public String setClientOne(@ModelAttribute ClientVO cvo) {
		
		cvo.setClientLicenseNum(cvo.getClientLicenseNum().trim());
		
		/* clientCode를 만들기 위한 등록일(regdate)해체 작업 */
		String target	= cvo.getClientRegdate(); // yyyy-MM-dd
		String year		= target.substring(2, 4); // yy
		String month	= target.substring(5, 7); // MM
		String result	= year + month;			  // yyMM
		cvo.setClientCode(result);
		/* *************************************** */
		
		clientSrv.setClientOne(cvo);
		
		return "redirect:/admin/client_reg";
	}
	
	@RequestMapping("/client_list")
	public ModelAndView getClients(
			@RequestParam(defaultValue = "client_company") String searchOpt,
			@RequestParam(defaultValue = "") String words
			) {
		List<ClientVO> list = clientSrv.getClients(searchOpt,words);
		int count = clientSrv.getClientCount(searchOpt,words);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("count",count);
		mav.setViewName("erp/admin/erp_client/client_list");
		return mav;
	}
	
	@RequestMapping("/deleteClient")
	@ResponseBody
	public String deleteClient(@RequestParam int cid) {
		clientSrv.deleteClient(cid);
		return "success";
	}
	
	@RequestMapping(value = "/client_mod", method = RequestMethod.GET)
	public ModelAndView getModifyClient(@ModelAttribute ClientVO vo) {
		ModelAndView mav = new ModelAndView();
		ClientVO cvo = clientSrv.getClientOne(vo);
		
		mav.addObject("clientId", cvo.getClientId());
		mav.addObject("clientCode", cvo.getClientCode());
		mav.addObject("clientUseState", cvo.getClientUseState());
		mav.addObject("clientCompany", cvo.getClientCompany());
		mav.addObject("clientLicenseNum", cvo.getClientLicenseNum());
		mav.addObject("clientCeoName", cvo.getClientCeoName());
		mav.addObject("clientBusinessCondition", cvo.getClientBusinessCondition());
		mav.addObject("clientBusinessType", cvo.getClientBusinessType());
		mav.addObject("clientRegdate", cvo.getClientRegdate());
		mav.addObject("clientCompanyPhone", cvo.getClientCompanyPhone());
		mav.addObject("clientCompanyFax", cvo.getClientCompanyFax());
		mav.addObject("clientCompanyPage", cvo.getClientCompanyPage());
		mav.addObject("clientPost", cvo.getClientPost());
		mav.addObject("clientAddress", cvo.getClientAddress());
		mav.addObject("clientNation", cvo.getClientNation());
		mav.addObject("clientDetailAddress", cvo.getClientDetailAddress());
		mav.addObject("clientResCp", cvo.getClientResCp());
		mav.addObject("clientResponsibility", cvo.getClientResponsibility());
		mav.addObject("clientResEmail", cvo.getClientResEmail());
		mav.addObject("clientPaymentType", cvo.getClientPaymentType());
		mav.addObject("clientHandling", cvo.getClientHandling());
		mav.addObject("clientNote", cvo.getClientNote());
		mav.addObject("clientTaxEmail", cvo.getClientTaxEmail());
		mav.addObject("clientTaxResponsibility", cvo.getClientTaxResponsibility());
		mav.addObject("clientTaxCompanyPhone", cvo.getClientTaxCompanyPhone());
		
		mav.setViewName("erp/admin/erp_client/client_mod");
		return mav;
	}
	
	@RequestMapping(value = "/client_mod", method = RequestMethod.POST)
	public String updateClient(@ModelAttribute ClientVO vo) {
		clientSrv.updateClient(vo);
		return "redirect:/admin/client_mod?clientId="+vo.getClientId();
	}
}
