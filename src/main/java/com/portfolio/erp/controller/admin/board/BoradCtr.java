package com.portfolio.erp.controller.admin.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.board.ArticleVO;
import com.portfolio.erp.model.board.BoardVO;
import com.portfolio.erp.model.board.CommentVO;
import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.service.admin.board.BoardSrv;
import com.portfolio.erp.service.common.CommonSrv;

@Controller
public class BoradCtr {
	
	@Autowired
	CommonSrv commonSrv;
	
	@Autowired
	BoardSrv bSrv;
	
	@RequestMapping(value ="/admin/board_reg", method = RequestMethod.GET)
	public ModelAndView setBoaredReg() {
		ModelAndView mav = new ModelAndView();
		//부서불러오기
		List<EmployeeVO> dList = commonSrv.getDepartmentList();
		EmployeeVO evo = new EmployeeVO();
		evo.setEmpDepartmentName("사내");
		evo.setEmpDepartment("000");
		dList.add(evo);
		mav.addObject("dList", dList);
		
		//boardList불러오기
		List<BoardVO> blist = bSrv.boardList();
		mav.addObject("blist", blist);
		
		mav.setViewName("erp/admin/erp_board/board_reg");
		return mav;
	}
	
	@RequestMapping("/admin/board_reg_insert")
	@ResponseBody
	public String setBoaredRegInsert(@ModelAttribute BoardVO bvo) {
		int dpartChk = bSrv.getBoardDepartCheck(bvo.getBoardDepartment());
		String msg;
		if(dpartChk >= 5) {
			msg = "failure";
		}else {
			msg = "success";
			bSrv.setBoardReg(bvo);
			String boardNum = bvo.getBoardDepartment()+bvo.getBoardCode();
			bSrv.createArticleTbl(boardNum);
			bSrv.createCommentTbl(boardNum);
		}
		return msg;
	}
	
	@RequestMapping("/admin/board_reg_check")
	@ResponseBody
	public String boardCodeCheck(@ModelAttribute BoardVO bvo) {
		String msg;	
			int result = bSrv.getBoardCheck(bvo.getBoardCode(),bvo.getBoardDepartment());
			if( result > 0 ) msg = "failure";
			else msg = "success";
		return msg;
	}

	@RequestMapping("/admin/board_reg_update_view")
	@ResponseBody
	public BoardVO boardUpdateView(@RequestParam(value = "chkArr[]") List<String> chkArr) {
		int boardId;
		BoardVO bvo = null;
		for(String list : chkArr) {
			boardId = Integer.parseInt(list);
			bvo = bSrv.getBoardOne(boardId);
		}
		return bvo;
	}
	
	@RequestMapping("/admin/board_reg_update")
	@ResponseBody
	public String setBoareUpdate(@ModelAttribute BoardVO bvo) {
			bSrv.setBoareUpdate(bvo);
		return "success";
	}

	
	@RequestMapping(value ="/admin/board_reg_delete", method = RequestMethod.POST)
	@ResponseBody
	public String setBoardDelete(
			@RequestParam(value = "chkArr[]") List<String> chkArr) {
		int boardId;
			for(String list : chkArr) {
				boardId = Integer.parseInt(list);
				String baordNum = bSrv.getBoardNumOne(boardId);
				bSrv.setBoardDelete(boardId);
				bSrv.dropCommentTbl(baordNum);
				bSrv.dropArticleTbl(baordNum);
			}
			return "success";
	}
	

	//boardList 제목 이동
	@RequestMapping("/admin/board_reg_move")
	@ResponseBody
	public String setBoardMove(
			@RequestParam(value = "chkArr[]") List<String> chkArr,
			@RequestParam String boardMove,
			@RequestParam String move) {
		String msg ="";
				for(String list : chkArr) {
					String changeMove = boardMove;
					int boardId = Integer.parseInt(list);
					int intmove = Integer.parseInt(boardMove);
					int DownCount = 0;
					int DownChk = Integer.parseInt(boardMove.substring(boardMove.length()-1,boardMove.length()));
					
					if( move.equals("up")) {
						boardMove = Integer.toString(intmove-1);
					}
					if( move.equals("down")) {
						boardMove = Integer.toString(intmove+1);
						DownCount = bSrv.getBoardDepartCheck(boardMove.substring(0,boardMove.length()-1));
					}
					if(DownCount == DownChk) {
						msg = "failure";
					}else {
						bSrv.setChangeMove(changeMove, boardMove);
						bSrv.setBoardMove(boardMove, boardId);
						msg = "success";
					}
		}
				return msg;
	}
	
	@RequestMapping("/admin/board_list")
	public ModelAndView setBoaredList(@RequestParam String boardNum,
			@RequestParam(defaultValue = "") String words, 
			@RequestParam(defaultValue = "subject") String searchOpt) {
		ModelAndView mav = new ModelAndView();
		
		//부서불러오기
		List<EmployeeVO> dList = commonSrv.getDepartmentList();
		EmployeeVO evo = new EmployeeVO();
		evo.setEmpDepartmentName("사내");
		evo.setEmpDepartment("000");
		dList.add(evo);
		mav.addObject("dList", dList);
				
		//boardList불러오기
		List<BoardVO> blist = bSrv.boardList();
		mav.addObject("blist", blist);
		
		//boardNum값 불러오기
		BoardVO bvo = bSrv.getBoardListOne(boardNum);
		mav.addObject("bvo", bvo);
		
		//article list불러오기
		List<ArticleVO> alist = bSrv.articleList(boardNum,words,searchOpt);
		mav.addObject("alist",alist);
		
		//article Count
		int count = bSrv.articleCount(boardNum);
		mav.addObject("count",count);
				
		mav.setViewName("erp/admin/erp_board/board_list");
		return mav;
	}
	
	@RequestMapping(value ="/admin/board_write", method = RequestMethod.GET)
	public ModelAndView getArticleWrite(@RequestParam String boardNum) {
		ModelAndView mav = new ModelAndView();
		
		//부서불러오기
		List<EmployeeVO> dList = commonSrv.getDepartmentList();
		EmployeeVO evo = new EmployeeVO();
		evo.setEmpDepartmentName("사내");
		evo.setEmpDepartment("000");
		dList.add(evo);
		mav.addObject("dList", dList);
				
		//boardList불러오기
		List<BoardVO> blist = bSrv.boardList();
		mav.addObject("blist", blist);
		
		//boardNum값 불러오기
		BoardVO bvo = bSrv.getBoardListOne(boardNum);
		mav.addObject("bvo", bvo);
		mav.addObject("boardNum", boardNum);
		
		mav.setViewName("erp/admin/erp_board/board_write");
		return mav;
	}
	
	@RequestMapping("/admin/board_write_reg")
	public String setArticleWrite(@ModelAttribute ArticleVO avo) {
		String boardNum = avo.getBoardNum();
		bSrv.setArticle(avo);
		return "redirect:/admin/board_list?boardNum="+boardNum;
	}
	
	@RequestMapping(value ="/admin/board_article_delete", method = RequestMethod.POST)
	@ResponseBody
	public String setarticleDelete(
			@RequestParam(value = "chkArr[]") List<String> chkArr,
			@RequestParam String boardNum) {
			int aId;
			for(String list : chkArr) {
				aId = Integer.parseInt(list);
				bSrv.setarticleDelete(aId,boardNum);
			}
			return boardNum;
	}
	
	@RequestMapping(value ="/admin/board_modify", method = RequestMethod.GET)
	public ModelAndView getArticleModify(@RequestParam String boardNum,
											@RequestParam int aId) {
		ModelAndView mav = new ModelAndView();
		
		//부서불러오기
		List<EmployeeVO> dList = commonSrv.getDepartmentList();
		EmployeeVO evo = new EmployeeVO();
		evo.setEmpDepartmentName("사내");
		evo.setEmpDepartment("000");
		dList.add(evo);
		mav.addObject("dList", dList);
				
		//boardList불러오기
		List<BoardVO> blist = bSrv.boardList();
		mav.addObject("blist", blist);
		
		//boardNum값 불러오기
		BoardVO bvo = bSrv.getBoardListOne(boardNum);
		mav.addObject("bvo", bvo);
		mav.addObject("boardNum", boardNum);
		
		//article 내용 불러오기
		ArticleVO avo = bSrv.getArticleOne(aId,boardNum);
		mav.addObject("avo",avo);
		
		mav.setViewName("erp/admin/erp_board/board_modify");
		return mav;
	}
	
	@RequestMapping("/admin/board_modify_update")
	public String setArticleModify(@ModelAttribute ArticleVO avo) {
		String boardNum = avo.getBoardNum();
		bSrv.setArticleModify(avo);
		return "redirect:/admin/board_list?boardNum="+boardNum;
	}
	
	@RequestMapping(value ="/admin/board_view", method = RequestMethod.GET)
	public ModelAndView getArticleView(@RequestParam String boardNum,
											@RequestParam int aId) {
		ModelAndView mav = new ModelAndView();
		
		//게시물 조회수
		bSrv.hitUp(aId,boardNum);
		
		//부서불러오기
		List<EmployeeVO> dList = commonSrv.getDepartmentList();
		EmployeeVO evo = new EmployeeVO();
		evo.setEmpDepartmentName("사내");
		evo.setEmpDepartment("000");
		dList.add(evo);
		mav.addObject("dList", dList);
				
		//boardList불러오기
		List<BoardVO> blist = bSrv.boardList();
		mav.addObject("blist", blist);
		
		//boardNum값 불러오기
		BoardVO bvo = bSrv.getBoardListOne(boardNum);
		mav.addObject("bvo", bvo);
		mav.addObject("boardNum", boardNum);
		
		//article 내용 불러오기
		ArticleVO avo = bSrv.getArticleOne(aId,boardNum);
		mav.addObject("avo",avo);
		
		//댓글불러오기
		List<CommentVO> clist = bSrv.commentList(aId,boardNum);
		mav.addObject("clist",clist);
		
		mav.setViewName("erp/admin/erp_board/board_view");
		return mav;
	}
	@RequestMapping("/admin/board_comment")
	@ResponseBody
	public String setComment(@ModelAttribute CommentVO cvo) {
		bSrv.CommentHitUp(cvo.getaIdFk(),cvo.getBoardNum());
		bSrv.setComment(cvo);
		
		return "success";
	}
	
	@RequestMapping("/admin/board_comment_delete")
	public String setCommentDel(@RequestParam String boardNum,
								@RequestParam int aIdFk,
								@RequestParam int cId) {
		bSrv.CommentDelete(cId,boardNum);
		
		return "redirect:/admin/board_view?boardNum="+boardNum+"&aId="+aIdFk;
	}
	
	@RequestMapping("/admin/board_comment_update")
	public String setCommentUpdate(@ModelAttribute CommentVO cvo) {
		String boardNum = cvo.getBoardNum();
		int aIdFk = cvo.getaIdFk();
		
		bSrv.commentUpdate(cvo);
		
		return "redirect:/admin/board_view?boardNum="+boardNum+"&aId="+aIdFk;
	}
	
	@RequestMapping("/admin/board_comment_reply")
	public String setCommentReply(@ModelAttribute CommentVO cvo) {
		String boardNum = cvo.getBoardNum();
		int aIdFk = cvo.getaIdFk();
		bSrv.CommentHitUp(aIdFk,boardNum);
		bSrv.setCommentReply(cvo);
		
		return "redirect:/admin/board_view?boardNum="+boardNum+"&aId="+aIdFk;
	}
}
