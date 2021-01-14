package com.portfolio.erp.controller.user.client;

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
import com.portfolio.erp.model.paging.PagingVO;
import com.portfolio.erp.service.admin.client.ClientSrv;

@Controller
public class UserClientCtr {
	
	@Autowired
	ClientSrv clientSrv;

	// 거래처 목록
	@RequestMapping("/user/client_list")
	public ModelAndView getClients(
			@RequestParam(defaultValue = "client_company") String searchOpt,
			@RequestParam(defaultValue = "") String words,
			@RequestParam(defaultValue = "1") int curPage
			) {
		
		// 검색된 갯수
		int count = clientSrv.getClientCount(searchOpt,words);
		
		// 페이징처리
		PagingVO pagingvo = new PagingVO(count, curPage);
		
		// 입력한 페이지번호에 따라서 시작번호가 바뀜
		int startIndex = pagingvo.getStartIndex();
		int pageSize = pagingvo.getPageSize();
		
		List<ClientVO> list = clientSrv.getClients(searchOpt,words, startIndex, pageSize);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("count",count);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		mav.addObject("pagingvo", pagingvo);
		mav.setViewName("erp/user/erp_client/client_list");
		return mav;
	}
	
	// 거래처 등록 페이지 불러오기
	@RequestMapping(value="/user/client_reg",method = RequestMethod.GET)
	public String getClientReg() {
		return "erp/user/erp_client/client_reg";
	}
	
	// 거래처 등록하기
	@RequestMapping(value="/user/client_reg", method = RequestMethod.POST)
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
		
		return "redirect:/user/client_reg";
	}
	
	// 수정할 거래처 정보 가져오기
	@RequestMapping(value = "/user/client_mod", method = RequestMethod.GET)
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
		
		mav.setViewName("erp/user/erp_client/client_mod");
		return mav;
	}
	
	// 거래처 삭제
	@RequestMapping("/user/deleteClient")
	@ResponseBody
	public String deleteClient(@RequestParam int cid) {
		clientSrv.deleteClient(cid);
		return "success";
	}
}
