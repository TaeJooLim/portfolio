package com.portfolio.erp.model.board;

public class BoardVO {
	private int boardId;
	private String boardDepartment;
	private String boardCode;
	private String boardNum;
	private String boardOpen;
	private String boardManager;
	private String boardName;
	private String boardType;
	private String boardRead;
	private String boardWrite;
	private String boardComment;
	private String boardDown;
	private String boardMove;
	
	private String boardDepartmentName; //department조
	
	private int ref; //board_move
	
	
	public String getBoardDepartmentName() {
		return boardDepartmentName;
	}
	public void setBoardDepartmentName(String boardDepartmentName) {
		this.boardDepartmentName = boardDepartmentName;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getBoardDepartment() {
		return boardDepartment;
	}
	public void setBoardDepartment(String boardDepartment) {
		this.boardDepartment = boardDepartment;
	}
	public String getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}
	public String getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(String boardNum) {
		this.boardNum = boardNum;
	}
	public String getBoardOpen() {
		return boardOpen;
	}
	public void setBoardOpen(String boardOpen) {
		this.boardOpen = boardOpen;
	}
	public String getBoardManager() {
		return boardManager;
	}
	public void setBoardManager(String boardManager) {
		this.boardManager = boardManager;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getBoardRead() {
		return boardRead;
	}
	public void setBoardRead(String boardRead) {
		this.boardRead = boardRead;
	}
	public String getBoardWrite() {
		return boardWrite;
	}
	public void setBoardWrite(String boardWrite) {
		this.boardWrite = boardWrite;
	}
	public String getBoardComment() {
		return boardComment;
	}
	public void setBoardComment(String boardComment) {
		this.boardComment = boardComment;
	}
	public String getBoardDown() {
		return boardDown;
	}
	public void setBoardDown(String boardDown) {
		this.boardDown = boardDown;
	}
	public String getBoardMove() {
		return boardMove;
	}
	public void setBoardMove(String boardMove) {
		this.boardMove = boardMove;
	}
	
	
}
