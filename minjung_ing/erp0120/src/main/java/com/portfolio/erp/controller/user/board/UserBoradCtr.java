package com.portfolio.erp.controller.user.board;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.board.ArticleVO;
import com.portfolio.erp.model.board.BoardVO;
import com.portfolio.erp.model.board.CommentVO;
import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.model.paging.PagingVO;
import com.portfolio.erp.service.admin.board.BoardSrv;
import com.portfolio.erp.service.common.CommonSrv;

@Controller
public class UserBoradCtr {
	
	@Autowired
	CommonSrv commonSrv;
	
	@Autowired
	BoardSrv bSrv;
	
	//게시판 생성
	@RequestMapping(value ="/user/board_reg", method = RequestMethod.GET)
	public ModelAndView setBoaredReg() {
		ModelAndView mav = new ModelAndView();
		//부서불러오기
		List<EmployeeVO> dList = commonSrv.getDepartmentList();
		EmployeeVO evo = new EmployeeVO();
		evo.setEmpDepartmentName("공용");
		evo.setEmpDepartment("999");
		dList.add(0,evo);
		mav.addObject("dList", dList);
		
		//boardList불러오기
		List<BoardVO> blist = bSrv.boardList();
		mav.addObject("blist", blist);
		
		mav.setViewName("erp/user/erp_board/board_reg");
		return mav;
	}
	
	//각 게시판별 리스트 출력
	@RequestMapping("/user/board_list")
	public ModelAndView setBoaredList(@RequestParam String boardNum,
			@RequestParam(defaultValue = "") String words, 
			@RequestParam(defaultValue = "subject") String searchOpt,
			@RequestParam(defaultValue="1") int curPage) {
		ModelAndView mav = new ModelAndView();
		
		//article Count ,검색된 갯수
		int listCnt  = bSrv.articleCount(boardNum,words,searchOpt);
		
		// 페이징처리
		PagingVO pagingvo = new PagingVO(listCnt, curPage);
				
		// 입력한 페이지번호에 따라서 시작번호가 바뀜
		int startIndex = pagingvo.getStartIndex();
		int pageSize = pagingvo.getPageSize();
		
		//부서불러오기
		List<EmployeeVO> dList = commonSrv.getDepartmentList();
		EmployeeVO evo = new EmployeeVO();
		evo.setEmpDepartmentName("공용");
		evo.setEmpDepartment("999");
		dList.add(0,evo);
		mav.addObject("dList", dList);
				
		//boardList불러오기
		List<BoardVO> blist = bSrv.boardList();
		mav.addObject("blist", blist);
		
		//boardNum값 불러오기
		BoardVO bvo = bSrv.getBoardListOne(boardNum);
		mav.addObject("bvo", bvo);
		
		//article list불러오기
		List<ArticleVO> alist = bSrv.articleList(boardNum,words,searchOpt, startIndex, pageSize);
		mav.addObject("alist",alist);
		mav.addObject("pagingvo", pagingvo);
		mav.addObject("listCnt",listCnt);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		mav.addObject("boardNum", boardNum);
		
		
		mav.setViewName("erp/user/erp_board/board_list");
		return mav;
	}
	
	//게시물 작성
	@RequestMapping(value ="/user/board_write", method = RequestMethod.GET)
	public ModelAndView getArticleWrite(@RequestParam String boardNum) {
		ModelAndView mav = new ModelAndView();
		
		//부서불러오기
		List<EmployeeVO> dList = commonSrv.getDepartmentList();
		EmployeeVO evo = new EmployeeVO();
		evo.setEmpDepartmentName("공용");
		evo.setEmpDepartment("999");
		dList.add(0,evo);
		mav.addObject("dList", dList);
				
		//boardList불러오기
		List<BoardVO> blist = bSrv.boardList();
		mav.addObject("blist", blist);
		
		//boardNum값 불러오기
		BoardVO bvo = bSrv.getBoardListOne(boardNum);
		mav.addObject("bvo", bvo);
		mav.addObject("boardNum", boardNum);
		
		mav.setViewName("erp/user/erp_board/board_write");
		return mav;
	}
	
	//게시물 작성 등록
	@RequestMapping("/user/board_write_reg")
	public String setArticleWrite(@ModelAttribute ArticleVO avo, @RequestPart MultipartFile files) throws IllegalStateException, IOException {
		String boardNum = avo.getBoardNum();
		
		//만약 첨부 파일을 첨부하지 않은 사람 (예외처리)
				if( files.isEmpty() ) { //첨부파일 없을 때
					bSrv.setArticle(avo);
									
				}else { //첨부파일 있을 때
					String fileUrl 		= "C://upload//article//"; //첨부파일 저장 위치
					String fileName 	= files.getOriginalFilename(); //첨부파일 이름
					String fileNameEx	= FilenameUtils.getExtension(fileName).toLowerCase(); //파일 중복 방지위해 파일이름 소문자로 변경
									
					File desFile;
					String desFileName;
									
					do {
						desFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameEx;
						desFile = new File(fileUrl + desFileName);
										
					}while(desFile.exists());
						
					desFile.getParentFile().mkdirs(); //폴더 생성
					files.transferTo(desFile);
										
					avo.setFileName(desFileName);
					avo.setFileOriName(fileName);
					avo.setFileUrl(fileUrl);
										
					bSrv.setArticle(avo);
				}
		
		return "redirect:/user/board_list?boardNum="+boardNum;
	}
	
	//게시물 한개단위 삭제
	@RequestMapping("/user/board_article_delete_one")
	public String setarticleDeleteOne(
			@RequestParam int aId,
			@RequestParam String boardNum) {
			
				bSrv.setarticleDelete(aId,boardNum);
			
			return "redirect:/user/board_list?boardNum="+boardNum;
	}
	
	//게시물 수정값 출력
	@RequestMapping(value ="/user/board_modify", method = RequestMethod.GET)
	public ModelAndView getArticleModify(@RequestParam String boardNum,
											@RequestParam int aId) {
		ModelAndView mav = new ModelAndView();
		
		//부서불러오기
		List<EmployeeVO> dList = commonSrv.getDepartmentList();
		EmployeeVO evo = new EmployeeVO();
		evo.setEmpDepartmentName("공용");
		evo.setEmpDepartment("999");
		dList.add(0,evo);
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
		
		mav.setViewName("erp/user/erp_board/board_modify");
		return mav;
	}
	
	//게시물 수정 등록
	@RequestMapping("/user/board_modify_update")
	public String setArticleModify(@ModelAttribute ArticleVO avo) {
		String boardNum = avo.getBoardNum();
		bSrv.setArticleModify(avo);
		return "redirect:/user/board_list?boardNum="+boardNum;
	}
	
	//게시물 상세보기
	@RequestMapping(value ="/user/board_view", method = RequestMethod.GET)
	public ModelAndView getArticleView(@RequestParam String boardNum,
											@RequestParam int aId) {
		ModelAndView mav = new ModelAndView();
		
		//게시물 조회수
		bSrv.hitUp(aId,boardNum);
		
		//부서불러오기
		List<EmployeeVO> dList = commonSrv.getDepartmentList();
		EmployeeVO evo = new EmployeeVO();
		evo.setEmpDepartmentName("공용");
		evo.setEmpDepartment("999");
		dList.add(0,evo);
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
		
		mav.setViewName("erp/user/erp_board/board_view");
		return mav;
	}
	
	//댓글 삭제
	@RequestMapping("/user/board_comment_delete")
	public String setCommentDel(@RequestParam String boardNum,
								@RequestParam int aIdFk,
								@RequestParam int cId) {
		bSrv.CommentDelete(cId,boardNum);
		
		return "redirect:/user/board_view?boardNum="+boardNum+"&aId="+aIdFk;
	}
	
	//댓글 수정
	@RequestMapping("/user/board_comment_update")
	public String setCommentUpdate(@ModelAttribute CommentVO cvo) {
		String boardNum = cvo.getBoardNum();
		int aIdFk = cvo.getaIdFk();
		
		bSrv.commentUpdate(cvo);
		
		return "redirect:/user/board_view?boardNum="+boardNum+"&aId="+aIdFk;
	}
	
	//대댓글 등록
	@RequestMapping("/user/board_comment_reply")
	public String setCommentReply(@ModelAttribute CommentVO cvo) {
		String boardNum = cvo.getBoardNum();
		int aIdFk = cvo.getaIdFk();
		bSrv.CommentHitUp(aIdFk,boardNum);
		bSrv.setCommentReply(cvo);
		
		return "redirect:/user/board_view?boardNum="+boardNum+"&aId="+aIdFk;
	}
}
