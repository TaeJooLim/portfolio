package com.example.project.service.adminPageSrv.boardSrv;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.model.ArticleVO;
import com.example.project.model.BoardVO;
import com.example.project.repository.adminPageRepo.boardRepo.ArticleDao;

@Service
public class ArticleSrv {
	
	@Autowired
	ArticleDao articleDao;
	
	public BoardVO getBoardOne(String boardCode) {
		return articleDao.getBoardOne(boardCode);
	}
}
