package com.example.project.model;

import java.util.Date;

public class BoardVO {
	
	private int bid;
	private String boardGrp;
	private String boardCode;
	private String boardColor;
	private String boardMaker;
	private String boardTitle;
	private String boardType;
	private String boardRead;
	private String boardWrite;
	private String boardReply;
	private String boardDownload;
	private Date boardRegdate;
	
	private String buseo_name; //부서코드를 글자로 변환해서 담기 위한 변수
	
	/*** 모달창의 값을 받기 위한 변수 ***/
	private String MboardGrp;
	private String MboardCode;
	private String MboardColor;
	private String MboardMaker;
	private String MboardTitle;
	private String MboardType;
	private String MboardRead;
	private String MboardWrite;
	private String MboardReply;
	private String MboardDownload;
	/*** 모달창의 값을 받기 위한 변수 ***/
	
	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getBoardGrp() {
		return boardGrp;
	}

	public void setBoardGrp(String boardGrp) {
		this.boardGrp = boardGrp;
	}

	public String getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}

	public String getBoardColor() {
		return boardColor;
	}

	public void setBoardColor(String boardColor) {
		this.boardColor = boardColor;
	}

	public String getBoardMaker() {
		return boardMaker;
	}

	public void setBoardMaker(String boardMaker) {
		this.boardMaker = boardMaker;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
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

	public String getBoardReply() {
		return boardReply;
	}

	public void setBoardReply(String boardReply) {
		this.boardReply = boardReply;
	}

	public String getBoardDownload() {
		return boardDownload;
	}

	public void setBoardDownload(String boardDownload) {
		this.boardDownload = boardDownload;
	}

	public Date getBoardRegdate() {
		return boardRegdate;
	}

	public void setBoardRegdate(Date boardRegdate) {
		this.boardRegdate = boardRegdate;
	}

	public String getBuseo_name() {
		return buseo_name;
	}

	public void setBuseo_name(String buseo_name) {
		this.buseo_name = buseo_name;
	}

	public String getMboardGrp() {
		return MboardGrp;
	}

	public void setMboardGrp(String mboardGrp) {
		MboardGrp = mboardGrp;
	}

	public String getMboardCode() {
		return MboardCode;
	}

	public void setMboardCode(String mboardCode) {
		MboardCode = mboardCode;
	}

	public String getMboardColor() {
		return MboardColor;
	}

	public void setMboardColor(String mboardColor) {
		MboardColor = mboardColor;
	}

	public String getMboardMaker() {
		return MboardMaker;
	}

	public void setMboardMaker(String mboardMaker) {
		MboardMaker = mboardMaker;
	}

	public String getMboardTitle() {
		return MboardTitle;
	}

	public void setMboardTitle(String mboardTitle) {
		MboardTitle = mboardTitle;
	}

	public String getMboardType() {
		return MboardType;
	}

	public void setMboardType(String mboardType) {
		MboardType = mboardType;
	}

	public String getMboardRead() {
		return MboardRead;
	}

	public void setMboardRead(String mboardRead) {
		MboardRead = mboardRead;
	}

	public String getMboardWrite() {
		return MboardWrite;
	}

	public void setMboardWrite(String mboardWrite) {
		MboardWrite = mboardWrite;
	}

	public String getMboardReply() {
		return MboardReply;
	}

	public void setMboardReply(String mboardReply) {
		MboardReply = mboardReply;
	}

	public String getMboardDownload() {
		return MboardDownload;
	}

	public void setMboardDownload(String mboardDownload) {
		MboardDownload = mboardDownload;
	}
	
}
