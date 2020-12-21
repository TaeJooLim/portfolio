package com.example.project.controller.adminPageCtr.boardCtr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.BoardVO;
import com.example.project.model.MemberVO;
import com.example.project.paging.Pager;
import com.example.project.service.adminPageSrv.boardSrv.BoardSrv;

@Controller
@RequestMapping("/board")
public class BoardCtr {
	
	@Autowired
	BoardSrv boardSrv;
	
	@RequestMapping("/boardList")
	public ModelAndView getBoardList(
			@RequestParam(defaultValue = "boardCode") String searchOpt, 
			@RequestParam(defaultValue = "") String words,
			/*************** 페이징 parameter ***************/
			@RequestParam(defaultValue="1") int curPage
			) {
		
		ModelAndView mav = new ModelAndView();
		
		/* 게시판 수 */
		int count = boardSrv.getBoardCount(searchOpt, words);
		mav.addObject("count", count);
		/* 게시판 수 */
		
		/*************** 페이징 시작 ***************/
		Pager pager = new Pager(count,curPage);
		int start	= pager.getPageBegin();
		int end		= pager.getPageEnd();
		
		List<BoardVO> list = boardSrv.getBoardList(start, end, searchOpt,words);

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
		
		mav.setViewName("adminPage/board/boardList");
		return mav;
	}
	
	@RequestMapping(value="/board_create",method = RequestMethod.POST)
	@ResponseBody
	public String setBoard(@ModelAttribute BoardVO bvo) {
		boardSrv.setBoard(bvo);
		boardSrv.createArticleTbl(bvo.getBoardCode());
		boardSrv.createCommentTbl(bvo.getBoardCode());
		return "success";
	}
	
	// 게시판코드 중복방지
	@RequestMapping("/board_check")
	@ResponseBody
	public String getBoardChk(@RequestParam String boardCode) {
		String msg;
		int result = boardSrv.getBoardChk(boardCode);
		if( result > 0 ) {
			msg = "failure";
		}else {
			msg = "success";
		}
		return msg;
	}
	
	// 게시판 개별 삭제
	@RequestMapping("/board_delete")
	@ResponseBody
	public String setBoardDelete(@RequestParam String boardCode) {
		/* 게시판 생성의 역순 = commentTbl > articleTbl > boardTbl */
		boardSrv.dropCommentTbl(boardCode);
		boardSrv.dropArticleTbl(boardCode);
		boardSrv.setBoardDelete(boardCode);
		return "success";
	}
	
	// 체크박스 이용한 다중삭제
	@RequestMapping(value="/board_delete_all", method = RequestMethod.POST)
	@ResponseBody
	public String deleteBoardAll(@RequestParam(value="chkArr[]") List<String> chkArr) {
		String boardCode;
		for(String list : chkArr) {
			boardCode = list;
			boardSrv.dropCommentTbl(boardCode);
			boardSrv.dropArticleTbl(boardCode);
			boardSrv.deleteBoardAll(boardCode);
		}
		return "success";
	}
	
	// (모달) 게시판 설정 불러오기
	@RequestMapping(value="/board_modify", method = RequestMethod.POST)
	@ResponseBody
	public BoardVO getBoardOne(int bid) {
		BoardVO bvo = boardSrv.getBoardOne(bid);
		return bvo;
	}
	
	// (모달) 게시판 설정 변경
	@RequestMapping(value="/board_change", method = RequestMethod.POST)
	@ResponseBody
	public String setBoardChange(@ModelAttribute BoardVO bvo) {
		boardSrv.changeBoardSet(bvo);
		return "success";
	}
}
