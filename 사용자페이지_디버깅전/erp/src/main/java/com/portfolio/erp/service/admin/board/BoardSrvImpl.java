package com.portfolio.erp.service.admin.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.erp.model.board.ArticleVO;
import com.portfolio.erp.model.board.BoardVO;
import com.portfolio.erp.model.board.CommentVO;
import com.portfolio.erp.repository.admin.board.BoardDao;

@Service
public class BoardSrvImpl implements BoardSrv{
	
	@Autowired
	BoardDao bDao;
	
	@Override
	public void setBoardReg(BoardVO bvo) {
		bDao.setBoardReg(bvo);
		
	}

	@Override
	public List<BoardVO> boardList() {
		return bDao.boardList();
	}

	@Override
	public int getBoardCheck(String boardCode, String boardDepartment) {
		return bDao.getBoardCheck(boardCode, boardDepartment);
	}

	@Override
	public int getBoardDepartCheck(String boardDepartment) {
		return bDao.getBoardDepartCheck(boardDepartment);
	}

	@Override
	public void setBoardDelete(int boardId) {
		bDao.setBoardDelete(boardId);
	}

	@Override
	public void setBoardMove(String boardMove, int boardId) {
		bDao.setBoardMove(boardMove, boardId);
		
	}

	@Override
	public void setChangeMove(String changeMove, String boardMove) {
		bDao.setChangeMove(changeMove, boardMove);
		
	}

	@Override
	public void createArticleTbl(String boardNum) {
		bDao.createArticleTbl(boardNum);
		
	}

	@Override
	public void createCommentTbl(String boardNum) {
		bDao.createCommentTbl(boardNum);
		
	}

	@Override
	public BoardVO getBoardOne(int boardId) {
		return bDao.getBoardOne(boardId);
	}

	@Override
	public void setBoareUpdate(BoardVO bvo) {
		bDao.setBoareUpdate(bvo);
		
	}

	@Override
	public BoardVO getBoardListOne(String boardNum) {
		return bDao.getBoardListOne(boardNum);
	}

	@Override
	public void dropArticleTbl(String boardNum) {
		bDao.dropArticleTbl(boardNum);
		
	}

	@Override
	public void dropCommentTbl(String boardNum) {
		bDao.dropCommentTbl(boardNum);
		
	}

	@Override
	public String getBoardNumOne(int boardId) {
		return bDao.getBoardNumOne(boardId);
		
	}

	@Override
	public void setArticle(ArticleVO avo) {
		bDao.setArticle(avo);
		
	}

	@Override
	public List<ArticleVO> articleList(String boardNum,String words,String searchOpt , int startIndex, int pageSize) {
		return bDao.articleList(boardNum, words, searchOpt,startIndex,pageSize);
	}

	@Override
	public int articleCount(String boardNum,String words,String searchOpt) {
		return bDao.articleCount(boardNum, words, searchOpt);
	}

	@Override
	public void setarticleDelete(int aId, String boardNum) {
		bDao.setarticleDelete(aId, boardNum);
		
	}

	@Override
	public ArticleVO getArticleOne(int aId, String boardNum) {
		return bDao.getArticleOne(aId, boardNum);
	}

	@Override
	public void setArticleModify(ArticleVO avo) {
		bDao.setArticleModify(avo);
	}

	@Override
	public void hitUp(int aId, String boardNum) {
		bDao.hitUp(aId, boardNum);
		
	}

	@Override
	public void setComment(CommentVO cvo) {
		bDao.setComment(cvo);
		
	}

	@Override
	public void CommentHitUp(int aIdFk, String boardNum) {
		bDao.CommentHitUp(aIdFk, boardNum);
		
	}

	@Override
	public List<CommentVO> commentList(int aId, String boardNum) {
		return bDao.commentList(aId, boardNum);
	}

	@Override
	public void CommentDelete(int cId, String boardNum) {
		bDao.CommentDelete(cId, boardNum);
		
	}

	@Override
	public void commentUpdate(CommentVO cvo) {
		bDao.commentUpdate(cvo);
		
	}

	@Override
	public int setCommentReply(CommentVO cvo) {
		 int result = 0;
		 //result += bDao.setCommentRef(cvo);
		  bDao.setCommentReply(cvo);
		 return result;
	}

	@Override
	public int setCommentRef(CommentVO cvo) {
		return 0;
	}

	@Override
	public int getMoveChk(String boardDepartment, String boardMove) {
		return bDao.getMoveChk(boardDepartment, boardMove);
	}
}
