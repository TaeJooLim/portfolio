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
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("erp/admin/erp_client/client_list");
		return mav;
	}
}
