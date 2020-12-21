package com.example.project.repository.adminPageRepo.boardRepo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.project.model.ArticleVO;
import com.example.project.model.BoardVO;

@Repository
public class ArticleDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public BoardVO getBoardOne(String boardCode) {
		return sqlSession.selectOne("article.getBoardOne", boardCode);
	}
}
