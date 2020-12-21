package com.example.project.controller.adminPageCtr.memberMngmtCtr;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.MemberVO;
import com.example.project.paging.Pager;
import com.example.project.service.MemberSrv;
import com.example.project.service.adminPageSrv.memberMngmtSrv.MemberMngmtSrv;

@Controller
@RequestMapping("/member")
public class MemberMngmtCtr {

	@Autowired
	MemberMngmtSrv memMngmtSrv;
	
	@Autowired
	MemberSrv memSrv;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	// '사용자 신청 목록' 페이지 & '미승인 회원' 리스트 불러오기 & 검색
	@RequestMapping("/memberApplicant")
	public ModelAndView getMemApplicant(
			@RequestParam(defaultValue = "mem_id") String searchOpt, 
			@RequestParam(defaultValue = "") String words,
			/*************** 페이징 parameter ***************/
			@RequestParam(defaultValue = "1") int curPage
			) {
		
		ModelAndView mav = new ModelAndView();
		
		/* 미승인 회원 수 */
		int count = memMngmtSrv.getApplicantCount(searchOpt,words);
		mav.addObject("count", count);
		/* 미승인 회원 수 END */
		
		/*************** 페이징 시작 ***************/
		/* 예) start = 0 , end = 11 */
		/* 예) DB에서 SELECT * FROM grp_employee limit 0,11; */
		Pager pager = new Pager(count,curPage);
		int start	= pager.getPageBegin();
		int end		= pager.getPageEnd();
		
		List<MemberVO> list = memMngmtSrv.getMemApplicant(start, end, searchOpt, words);
		mav.addObject("list", list);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		
		mav.addObject("start", start); //게시글 갯수 자를 시작번호
		mav.addObject("end", end); //게시글 갯수 자를 끝번호
		
		mav.addObject("blockBegin", pager.getBlockBegin());
		mav.addObject("blockEnd", pager.getBlockEnd());
		mav.addObject("curBlock", pager.getCurBlock());
		mav.addObject("totalBlcok", pager.getTotBlock());

		mav.addObject("prevPage", pager.getPrevPage());
		mav.addObject("nextPage", pager.getNextPage());
		mav.addObject("curPage", pager.getCurPage());
		mav.addObject("totalPage", pager.getTotPage());
		
		//페이지 번호를 클릭했을 때 css active 클래스 처리
		mav.addObject("selected", pager.getCurPage());
		/*************** 페이징 끝 ***************/
		
		mav.setViewName("adminPage/memberMngmt/memberApplicant");
		return mav;
	}
	
	// 회원 승인 하기
	@RequestMapping(value = "/approveConfirm", method = RequestMethod.POST)
	@ResponseBody
	public String approveConfirm(@RequestParam int num) {
		memMngmtSrv.approveConfirm(num);
		return "success";
	}
	
	// 회원 승인 거부 하기 = 미승인 회원 DB에서 삭제
	@RequestMapping(value = "/disapproveConfirm", method = RequestMethod.POST)
	@ResponseBody
	public String disapproveConfirm(@RequestParam int num) {
		memMngmtSrv.disapproveConfirm(num);
		return "success";
	}
	
	// 다중 승인 처리
	@RequestMapping(value="/approveAll")
	@ResponseBody
	public String approveAll(@RequestParam(value="chkArr[]") List<String> chkArr) {
		int num;
		for(String list : chkArr) {
			num = Integer.parseInt(list);
			memMngmtSrv.approveAll(num);
		}
		return "success";
	}
	
	// 다중 거부 처리(DB에서삭제)
	@RequestMapping(value="/rejectAll")
	@ResponseBody
	public String rejectAll(@RequestParam(value="chkArr[]") List<String> chkArr) {
		int num;
		for(String list : chkArr) {
			num = Integer.parseInt(list);
			memMngmtSrv.rejectAll(num);
		}
		return "success";
	}
	
	// <DB->page>사용자 등록 페이지에 현재세션의 사용자정보 띄우기
	@RequestMapping(value = "/memberInsert", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getMemOne(HttpSession session) {
		String sessionNum = (String) session.getAttribute("memNum");

		ModelAndView mav = new ModelAndView();
		MemberVO memOne = memMngmtSrv.getMemOne(sessionNum);
		MemberVO memOthersOne = memMngmtSrv.getMemOthersOne(sessionNum);
		
		mav.addObject("memOne", memOne);
		mav.addObject("memOthersOne", memOthersOne);
		mav.setViewName("adminPage/memberMngmt/memberInsert");
		
		return mav;
	}

	// <page->DB> 사용자 등록 페이지에서 DB로 사용자정보 보내기
	@RequestMapping(value = "/memberInsert", method = RequestMethod.POST)
	public String setMemOthers(MemberVO mvo) {
		memMngmtSrv.setMemOthers(mvo);
		return "redirect:/member/memberApplicant";
	}
	
	// '사용자 목록' 페이지 & 모든 회원 리스트 불러오기 & 검색(미완성)
	@RequestMapping("/memberList")
	public ModelAndView getMemList(
			@RequestParam(defaultValue = "mem_id") String searchOpt, 
			@RequestParam(defaultValue = "") String words,
			/*************** 페이징 parameter ***************/
			@RequestParam(defaultValue = "1") int curPage
			) {
		
		ModelAndView mav = new ModelAndView();
		
		/* 모든 회원 수 */
		int count = memMngmtSrv.getMemCount(searchOpt,words);
		mav.addObject("count", count);
		/* 모든 회원 수 END */
		
		/*************** 페이징 시작 ***************/
		/* 예) start = 0 , end = 11 */
		/* 예) DB에서 SELECT * FROM grp_employee limit 0,11; */
		Pager pager = new Pager(count,curPage);
		int start	= pager.getPageBegin();
		int end		= pager.getPageEnd();
		
		List<MemberVO> list = memMngmtSrv.getMemList(start, end, searchOpt,words);
		mav.addObject("list", list);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		
		mav.addObject("start", start); //게시글 갯수 자를 시작번호
		mav.addObject("end", end); //게시글 갯수 자를 끝번호
		
		mav.addObject("blockBegin", pager.getBlockBegin());
		mav.addObject("blockEnd", pager.getBlockEnd());
		mav.addObject("curBlock", pager.getCurBlock());
		mav.addObject("totalBlcok", pager.getTotBlock());

		mav.addObject("prevPage", pager.getPrevPage());
		mav.addObject("nextPage", pager.getNextPage());
		mav.addObject("curPage", pager.getCurPage());
		mav.addObject("totalPage", pager.getTotPage());
		
		//페이지 번호를 클릭했을 때 css active 클래스 처리
		mav.addObject("selected", pager.getCurPage());
		/*************** 페이징 끝 ***************/
		
		mav.setViewName("adminPage/memberMngmt/memberList");
		return mav;
	}
	
	// 성별 변경
	@RequestMapping(value="/changeGender", method=RequestMethod.POST)
	@ResponseBody
	public String changeGender(@RequestParam String memGender, @RequestParam int num) {
		memMngmtSrv.changeGender(memGender, num);
		return "success";
	}
	
	// 권한수준(레벨) 변경
	@RequestMapping(value="/changeLevel", method=RequestMethod.POST)
	@ResponseBody
	public String changeLevel(@RequestParam String memLevel, @RequestParam int num) {
		memMngmtSrv.changeLevel(memLevel, num);
		return "success";
	}
	
	// 승인 여부 변경
	@RequestMapping(value="/changeConfirm", method=RequestMethod.POST)
	@ResponseBody
	public String changeConfirm(@RequestParam String memConfirm, @RequestParam int num) {
		memMngmtSrv.changeConfirm(memConfirm, num);
		return "success";
	}
	
	// 회원 개별 삭제
	@RequestMapping(value="/deleteOne", method=RequestMethod.POST)
	@ResponseBody
	public String deleteOne(@RequestParam int num) {
		memMngmtSrv.deleteOne(num);
		return "success";
	}
	
	// 회원 다중 삭제
	@RequestMapping(value="/deleteMemAll", method=RequestMethod.POST)
	@ResponseBody
	public String deleteMemAll(@RequestParam(value="chkArr[]") List<String> chkArr) {
		int num;
		for(String list : chkArr) {
			num = Integer.parseInt(list);
			memMngmtSrv.deleteMemAll(num);
		}
		return "success";
	}
	
}
