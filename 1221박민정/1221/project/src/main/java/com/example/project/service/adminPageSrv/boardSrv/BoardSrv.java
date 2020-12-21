package com.example.project.service.adminPageSrv.boardSrv;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.model.BoardVO;
import com.example.project.repository.adminPageRepo.boardRepo.BoardDao;

@Service
public class BoardSrv {
	
	@Autowired
	BoardDao boardDao;
	
	public void setBoard(BoardVO bvo) {
		boardDao.setBoard(bvo);
	}
	
	public void createArticleTbl(String boardCode) {
		boardDao.createArticleTbl(boardCode);
	}
	
	public void createCommentTbl(String boardCode) {
		boardDao.createCommentTbl(boardCode);
	}
	
	public int getBoardChk(String boardCode) {
		return boardDao.getBoardChk(boardCode);
	}
	
	public List<BoardVO> getBoardList(int start, int end, String searchOpt, String words) {
		return boardDao.getBoardList(start, end, searchOpt, words);
	}
	
	public void setBoardDelete(String boardCode) {
		boardDao.setBoardDelete(boardCode);
	}
	
	public void dropArticleTbl(String boardCode) {
		boardDao.dropArticleTbl(boardCode);
	}
	
	public void dropCommentTbl(String boardCode) {
		boardDao.dropCommentTbl(boardCode);
	}
	
	public int getBoardCount(String searchOpt, String words) {
		return boardDao.getBoardCount(searchOpt, words);
	}
	
	public void deleteBoardAll(String boardCode) {
		boardDao.deleteBoardAll(boardCode);
	}
	
	public BoardVO getBoardOne(int bid){
		return boardDao.getBoardOne(bid);
	}
	
	public void changeBoardSet(BoardVO bvo) {
		boardDao.changeBoardSet(bvo);
	}
}
