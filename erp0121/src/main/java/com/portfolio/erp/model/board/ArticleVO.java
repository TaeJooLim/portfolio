package com.portfolio.erp.model.board;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class ArticleVO {
	
	private int aId;
	private String division;
	private String subject;
	private String writer;
	private String content;
	private Date regdate;
	private int hit;
	private String fileName;
	private String fileOriName;
	private String fileUrl;
	private int empIdFk;
	private String empPhotoFk;
	private String secret;
	private int commentHit;
	
	private String boardNum; //주소값 & DB table이름
	
	private String empDepartNameFk; //empIdFk의 부서출력
	
	
	public String getRegdate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
		return sdf.format(regdate);
	}

	public String getEmpPhotoFk() {
		return empPhotoFk;
	}

	public void setEmpPhotoFk(String empPhotoFk) {
		this.empPhotoFk = empPhotoFk;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getaId() {
		return aId;
	}

	public void setaId(int aId) {
		this.aId = aId;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileOriName() {
		return fileOriName;
	}

	public void setFileOriName(String fileOriName) {
		this.fileOriName = fileOriName;
	}

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

	public int getEmpIdFk() {
		return empIdFk;
	}

	public void setEmpIdFk(int empIdFk) {
		this.empIdFk = empIdFk;
	}

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}

	public String getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(String boardNum) {
		this.boardNum = boardNum;
	}

	public int getCommentHit() {
		return commentHit;
	}

	public void setCommentHit(int commentHit) {
		this.commentHit = commentHit;
	}

	public String getEmpDepartNameFk() {
		return empDepartNameFk;
	}

	public void setEmpDepartNameFk(String empDepartNameFk) {
		this.empDepartNameFk = empDepartNameFk;
	}
	
	
	
	
}
