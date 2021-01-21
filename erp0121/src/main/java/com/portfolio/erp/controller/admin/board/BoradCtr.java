package com.portfolio.erp.controller.admin.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
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
public class BoradCtr {
	
	@Autowired
	CommonSrv commonSrv;
	
	@Autowired
	BoardSrv bSrv;
	
	//게시판 생성
	@RequestMapping(value ="/admin/board_reg", method = RequestMethod.GET)
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
		
		mav.setViewName("erp/admin/erp_board/board_reg");
		return mav;
	}
	
	//게시판 부서별 등록
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
	
	//게시판 등록 시 , 부서별 code 중복확인
	@RequestMapping("/admin/board_reg_check")
	@ResponseBody
	public String boardCodeCheck(@ModelAttribute BoardVO bvo) {
		String msg;	
			int result = bSrv.getBoardCheck(bvo.getBoardCode(),bvo.getBoardDepartment());
			if( result > 0 ) msg = "failure";
			else msg = "success";
		return msg;
	}
	
	//게시판 등록-수정 값 출력
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
	
	//게시판 수정
	@RequestMapping("/admin/board_reg_update")
	@ResponseBody
	public String setBoareUpdate(@ModelAttribute BoardVO bvo) {
			bSrv.setBoareUpdate(bvo);
		return "success";
	}

	//게시판 삭제
	@RequestMapping(value ="/admin/board_reg_delete", method = RequestMethod.POST)
	@ResponseBody
	public String setBoardDelete(
			@RequestParam(value = "chkArr[]") List<String> chkArr) {
		int boardId;
			for(String list : chkArr) {
				boardId = Integer.parseInt(list);
				String baordNum = bSrv.getBoardNumOne(boardId);
				//삭제전 게시판 순서 이동 
				BoardVO bvo = bSrv.getBoardOne(boardId);
				String boardMove = bvo.getBoardMove();
				int count = bSrv.getMoveChk(baordNum.substring(0, 3),boardMove);
				int move = Integer.parseInt(boardMove.substring(boardMove.length()-1,boardMove.length()));
				if(count != move || count != 0) {
					for(int i = 0; i < count; i++){
						String changeMove = boardMove;
						boardMove = 
								boardMove.substring(0, 3)
								+ Integer.toString(Integer.parseInt(boardMove.substring(boardMove.length()-1,boardMove.length())) + 1);
						bSrv.setChangeMove(changeMove, boardMove);
					};
				};
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
					int DownCount = 0;
					int intmove = Integer.parseInt(boardMove.substring(boardMove.length()-1,boardMove.length()));
					
					if( move.equals("up")) {
						boardMove = changeMove.substring(0,changeMove.length()-1) + Integer.toString(intmove-1);
					}
					if( move.equals("down")) {
						boardMove = changeMove.substring(0,changeMove.length()-1) + Integer.toString(intmove+1);
						DownCount = bSrv.getBoardDepartCheck(boardMove.substring(0,boardMove.length()-1));
					}
					if(DownCount == intmove) {
						msg = "failure";
					}else {
						bSrv.setChangeMove(changeMove, boardMove);
						bSrv.setBoardMove(boardMove, boardId);
						msg = "success";
					}
		}
				return msg;
	}
	
	//각 게시판별 리스트 출력
	@RequestMapping("/admin/board_list")
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
		List<ArticleVO> alist = bSrv.articleList(boardNum, words, searchOpt, startIndex, pageSize);
		mav.addObject("alist",alist);
		mav.addObject("pagingvo", pagingvo);
		mav.addObject("listCnt",listCnt);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		mav.addObject("boardNum", boardNum);
		
		
		mav.setViewName("erp/admin/erp_board/board_list");
		return mav;
	}
	
	//게시물 작성
	@RequestMapping(value ="/admin/board_write", method = RequestMethod.GET)
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
		
		mav.setViewName("erp/admin/erp_board/board_write");
		return mav;
	}
	
	//게시물 작성 등록
	@RequestMapping("/admin/board_write_reg")
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
		
		return "redirect:/admin/board_list?boardNum="+boardNum;
	}
	
	//게시물 삭제
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
	
	//게시물 한개단위 삭제
	@RequestMapping("/admin/board_article_delete_one")
	public String setarticleDeleteOne(
			@RequestParam int aId,
			@RequestParam String boardNum) {
			
				bSrv.setarticleDelete(aId,boardNum);
			
			return "redirect:/admin/board_list?boardNum="+boardNum;
	}
	
	//게시물 수정값 출력
	@RequestMapping(value ="/admin/board_modify", method = RequestMethod.GET)
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
		
		mav.setViewName("erp/admin/erp_board/board_modify");
		return mav;
	}
	
	//게시물 수정 등록
	@RequestMapping("/admin/board_modify_update")
	public String setArticleModify(@ModelAttribute ArticleVO avo) {
		String boardNum = avo.getBoardNum();
		bSrv.setArticleModify(avo);
		return "redirect:/admin/board_list?boardNum="+boardNum;
	}
	
	//게시물 상세보기
	@RequestMapping(value ="/admin/board_view", method = RequestMethod.GET)
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
		
		mav.setViewName("erp/admin/erp_board/board_view");
		return mav;
	}
	
	//댓글 등록
	@RequestMapping("/admin/board_comment")
	@ResponseBody
	public String setComment(@ModelAttribute CommentVO cvo) {
		bSrv.CommentHitUp(cvo.getaIdFk(),cvo.getBoardNum());
		bSrv.setComment(cvo);
		
		return "success";
	}
	
	//댓글 삭제
	@RequestMapping("/admin/board_comment_delete")
	public String setCommentDel(@RequestParam String boardNum,
								@RequestParam int aIdFk,
								@RequestParam int cId) {
		bSrv.CommentDelete(cId,boardNum);
		
		return "redirect:/admin/board_view?boardNum="+boardNum+"&aId="+aIdFk;
	}
	
	//댓글 수정
	@RequestMapping("/admin/board_comment_update")
	public String setCommentUpdate(@ModelAttribute CommentVO cvo) {
		String boardNum = cvo.getBoardNum();
		int aIdFk = cvo.getaIdFk();
		
		bSrv.commentUpdate(cvo);
		
		return "redirect:/admin/board_view?boardNum="+boardNum+"&aId="+aIdFk;
	}
	
	//대댓글 등록
	@RequestMapping("/admin/board_comment_reply")
	public String setCommentReply(@ModelAttribute CommentVO cvo) {
		String boardNum = cvo.getBoardNum();
		int aIdFk = cvo.getaIdFk();
		bSrv.CommentHitUp(aIdFk,boardNum);
		bSrv.setCommentReply(cvo);
		
		return "redirect:/admin/board_view?boardNum="+boardNum+"&aId="+aIdFk;
	}
	
	// 첨부파일 다운로드
	@RequestMapping("/admin/article_download")
	public void articleDownload(HttpServletRequest request, 
								HttpServletResponse response, 
								@RequestParam String boardNum, 
								@RequestParam int aId) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		ArticleVO vo = bSrv.getArticleOne(aId, boardNum);
		
		try {
			String fileUrl = vo.getFileUrl();
			fileUrl += "/";
			String savePath = fileUrl;
			String fileName = vo.getFileName();
			
			String fileOriName = vo.getFileOriName();
			InputStream in = null;
			OutputStream os = null;
			File file = null;
			boolean skip = false;
			String client = "";
			
			try {
				file = new File(savePath, fileName);
				in = new FileInputStream(file);
			} catch(FileNotFoundException fne) {
				fne.printStackTrace();
				skip = true;
			}
			
			client = request.getHeader("User-Agent");

			// 파일 다운로드 헤더 지정
			response.reset();
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Description", "JSP Generated Data");

			if (!skip) {
					// IE
				if (client.indexOf("MSIE") != -1) {
					response.setHeader("Content-Disposition", "attachment; filename=\""
							+ java.net.URLEncoder.encode(fileOriName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
					// IE 11 이상.
				} else if (client.indexOf("Trident") != -1) {
					response.setHeader("Content-Disposition", "attachment; filename=\""
							+ java.net.URLEncoder.encode(fileOriName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
				} else {
					// 한글 파일명 처리
					response.setHeader("Content-Disposition",
							"attachment; filename=\"" + new String(fileOriName.getBytes("UTF-8"), "ISO8859_1") + "\"");
					response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
				}
				response.setHeader("Content-Length", "" + file.length());
				os = response.getOutputStream();
				byte b[] = new byte[(int) file.length()];
				int leng = 0;
				while ((leng = in.read(b)) > 0) {
					os.write(b, 0, leng);
				}
			} else {
				response.setContentType("text/html;charset=UTF-8");
				System.out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
			}
			in.close();
			os.close();
			
		} catch(Exception e) {
			System.out.println("ERROR : " + e.getMessage());
		}
	}
}