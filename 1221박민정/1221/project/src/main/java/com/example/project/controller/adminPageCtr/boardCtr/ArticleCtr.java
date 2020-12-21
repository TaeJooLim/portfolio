package com.example.project.controller.adminPageCtr.boardCtr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.ArticleVO;
import com.example.project.model.BoardVO;
import com.example.project.service.adminPageSrv.boardSrv.ArticleSrv;

@Controller
@RequestMapping("/article")
public class ArticleCtr {

	@Autowired
	ArticleSrv articleSrv;
	
	@RequestMapping("/article_list")
	public ModelAndView getArticleList(@RequestParam String boardCode) {
		ModelAndView mav = new ModelAndView();
		
		BoardVO bvo = articleSrv.getBoardOne(boardCode);
		
		mav.addObject("boardGrp", bvo.getBoardGrp());
		mav.addObject("boardColor", bvo.getBoardColor());
		mav.addObject("boardTitle", bvo.getBoardTitle());
		
		mav.setViewName("adminPage/board/articleList");
		return mav;
	}
	
}
