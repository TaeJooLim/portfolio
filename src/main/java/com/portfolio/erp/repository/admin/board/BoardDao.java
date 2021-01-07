package com.portfolio.erp.repository.admin.board;

import java.util.List;

import com.portfolio.erp.model.board.ArticleVO;
import com.portfolio.erp.model.board.BoardVO;
import com.portfolio.erp.model.board.CommentVO;

public interface BoardDao {
	
	public void setBoardReg(BoardVO bvo);
	
	public List<BoardVO> boardList();
	
	public int getBoardCheck(String boardCode ,String boardDepartment);
	
	public int getBoardDepartCheck(String boardDepartment);
	
	public BoardVO getBoardOne(int boardId);
	
	public void setBoardDelete(int boardId);
	
	public String getBoardNumOne(int boardId);
	
	public void dropArticleTbl(String boardNum);
	
	public void dropCommentTbl(String boardNum);
	
	public void setBoardMove(String boardMove, int boardId);
	
	public void setChangeMove(String changeMove, String boardMove);
	
	public void createArticleTbl(String boardNum);
	
	public void createCommentTbl(String boardNum);
	
	public void setBoareUpdate(BoardVO bvo);
	
	public BoardVO getBoardListOne(String boardNum);
	
	public void setArticle(ArticleVO avo);
	
	public List<ArticleVO> articleList(String boardNum,String words,String searchOpt);
	
	public int articleCount(String boardNum);
	
	public void setarticleDelete(int aId, String boardNum);
	
	public ArticleVO getArticleOne(int aId, String boardNum);
	
	public void setArticleModify(ArticleVO avo);
	
	public void hitUp(int aId, String boardNum);
	
	public void CommentHitUp(int aIdFk, String boardNum);
	
	public void setComment(CommentVO cvo);
	
	public List<CommentVO> commentList(int aId, String boardNum);
	
	public void CommentDelete(int cId, String boardNum);
	
	public void commentUpdate(CommentVO cvo);
	
	public int setCommentReply(CommentVO cvo);

	public int setCommentRef(CommentVO cvo);
	
}
