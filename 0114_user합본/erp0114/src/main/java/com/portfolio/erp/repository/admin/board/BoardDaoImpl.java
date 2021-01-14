package com.portfolio.erp.repository.admin.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.erp.model.board.ArticleVO;
import com.portfolio.erp.model.board.BoardVO;
import com.portfolio.erp.model.board.CommentVO;

@Repository
public class BoardDaoImpl implements BoardDao{
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public void setBoardReg(BoardVO bvo) {
		sqlsession.insert("board.setBoardReg",bvo);
	}

	@Override
	public List<BoardVO> boardList() {
		return sqlsession.selectList("board.boardList");
	}

	@Override
	public int getBoardCheck(String boardCode, String boardDepartment) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("boardCode", boardCode);
		map.put("boardDepartment", boardDepartment);
		return sqlsession.selectOne("board.getBoardCheck",map);
	}

	@Override
	public int getBoardDepartCheck(String boardDepartment) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("boardDepartment", boardDepartment);
		return sqlsession.selectOne("board.getBoardDepartCheck",map);
	}

	@Override
	public void setBoardDelete(int boardId) {
		sqlsession.delete("board.setBoardDelete",boardId);
		
	}

	@Override
	public void setBoardMove(String boardMove, int boardId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardMove", boardMove);
		map.put("boardId", boardId);
		sqlsession.update("board.setBoardMove",map);
		
	}

	@Override
	public void setChangeMove(String changeMove, String boardMove) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("changeMove", changeMove);
		map.put("boardMove", boardMove);
		sqlsession.update("board.setChangeMove",map);
		
	}

	@Override
	public void createArticleTbl(String boardNum) {
		String str = "CREATE TABLE board_article_" + boardNum;
		str += "(aid int not null auto_increment primary key,";
		str += "division char(1),";
		str += "subject varchar(300) not null,";
		str += "writer varchar(20) not null,";
		str += "content text,";
		str += "regdate datetime,";
		str += "hit int default 0,";
		str += "fileName varchar(300),";
		str += "fileOriName varchar(300),";
		str += "fileUrl varchar(500),";
		str += "emp_id_fk int,";
		str += "comment_hit int,";
		str += "secret char(1));";
		Map<String, String> map = new HashMap<String, String>();
		map.put("str", str);
		sqlsession.update("board.createArticleTbl", map);
		
	}

	@Override
	public void createCommentTbl(String boardNum) {
		String str = "CREATE TABLE board_comment_" + boardNum;
		str += "(cid int not null auto_increment primary key,";
		str += "aid_fk int not null,";
		str += "comment text,";
		str += "who varchar(20),";
		str += "re_emp_id_fk int,";
		str += "ref int,";
		str += "re_cid int,";
		str += "re_cid_name varchar(20),";
		str += "re_cid_depart varchar(20),";
		str += "re_regdate datetime);";
		Map<String, String> map = new HashMap<String, String>();
		map.put("str", str);
		sqlsession.update("board.createCommentTbl", map);
		
	}

	@Override
	public BoardVO getBoardOne(int boardId) {
		return sqlsession.selectOne("board.getBoardOne",boardId);
	}

	@Override
	public void setBoareUpdate(BoardVO bvo) {
		sqlsession.update("board.setBoareUpdate",bvo);
	}

	@Override
	public BoardVO getBoardListOne(String boardNum) {
		return sqlsession.selectOne("board.getBoardListOne",boardNum);
	}

	@Override
	public void dropArticleTbl(String boardNum) {
		String str = "drop TABLE board_article_" + boardNum;
		Map<String, String> map = new HashMap<String, String>();
		map.put("str", str);
		sqlsession.insert("board.dropArticleTbl", map);
		
	}

	@Override
	public void dropCommentTbl(String boardNum) {
		String str = "drop TABLE board_comment_" + boardNum;
		Map<String, String> map = new HashMap<String, String>();
		map.put("str", str);
		sqlsession.insert("board.dropCommentTbl", map);
		
	}

	@Override
	public String getBoardNumOne(int boardId) {
		return sqlsession.selectOne("board.getBoardNumOne",boardId);
		
	}

	@Override
	public void setArticle(ArticleVO avo) {
		sqlsession.insert("board.setArticle",avo);
	}

	@Override
	public List<ArticleVO> articleList(String boardNum,String words,String searchOpt, int startIndex, int pageSize) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("boardNum", boardNum);
		map.put("words", words);
		map.put("searchOpt", searchOpt);
		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		return sqlsession.selectList("board.articleList",map);
	}

	@Override
	public int articleCount(String boardNum,String words,String searchOpt) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("boardNum", boardNum);
		map.put("words", words);
		map.put("searchOpt", searchOpt);
		return sqlsession.selectOne("board.articleCount",map);
	}

	@Override
	public void setarticleDelete(int aId, String boardNum) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("aId", aId);
		map.put("boardNum", boardNum);
		sqlsession.delete("board.setarticleDelete",map);
		
	}

	@Override
	public ArticleVO getArticleOne(int aId, String boardNum) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("aId", aId);
		map.put("boardNum", boardNum);
		return sqlsession.selectOne("board.getArticleOne",map);
	}

	@Override
	public void setArticleModify(ArticleVO avo) {
		sqlsession.update("board.setArticleModify",avo);
	}

	@Override
	public void hitUp(int aId, String boardNum) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("aId", aId);
		map.put("boardNum", boardNum);
		sqlsession.update("board.hitUp",map);
	}

	@Override
	public void setComment(CommentVO cvo) {
		sqlsession.insert("board.setComment",cvo);
		
	}

	@Override
	public void CommentHitUp(int aIdFk, String boardNum) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("aIdFk", aIdFk);
		map.put("boardNum", boardNum);
		sqlsession.update("board.CommentHitUp",map);
		
	}

	@Override
	public List<CommentVO> commentList(int aId, String boardNum) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("aId", aId);
		map.put("boardNum", boardNum);
		return sqlsession.selectList("board.commentList",map);
	}

	@Override
	public void CommentDelete(int cId, String boardNum) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("cId", cId);
		map.put("boardNum", boardNum);
		sqlsession.update("board.CommentDelete",map);
		
	}

	@Override
	public void commentUpdate(CommentVO cvo) {
		sqlsession.update("board.commentUpdate",cvo);
	}

	@Override
	public int setCommentReply(CommentVO cvo) {
		return sqlsession.insert("board.setCommentReply",cvo);
	}

	@Override
	public int setCommentRef(CommentVO cvo) {
		return sqlsession.update("board.setCommentRef",cvo);
	}

	@Override
	public int getMoveChk(String boardDepartment, String boardMove) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("boardDepartment", boardDepartment);
		map.put("boardMove", boardMove);
		return sqlsession.selectOne("board.getMoveChk",map);
	}

}
