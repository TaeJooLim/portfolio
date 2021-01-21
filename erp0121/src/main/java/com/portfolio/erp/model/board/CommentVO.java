package com.portfolio.erp.model.board;

public class CommentVO {
	private int cId;
	private int aIdFk;
	private String comment;
	private String who;
	private String reRegdate;
	private int reEmpIdFk;
	private int ref;
	private int reCId;
	private String reCIdDepart;
	private String reCIdName; 
	
	private String boardNum; //주소값 & DB table이름
	
	private String comEmpDartName; //부서이름 조인
	
	
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public int getaIdFk() {
		return aIdFk;
	}
	public void setaIdFk(int aIdFk) {
		this.aIdFk = aIdFk;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getWho() {
		return who;
	}
	public void setWho(String who) {
		this.who = who;
	}
	public String getReRegdate() {
		return reRegdate;
	}
	public void setReRegdate(String reRegdate) {
		this.reRegdate = reRegdate;
	}
	public int getReEmpIdFk() {
		return reEmpIdFk;
	}
	public void setReEmpIdFk(int reEmpIdFk) {
		this.reEmpIdFk = reEmpIdFk;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getReCId() {
		return reCId;
	}
	public void setReCId(int reCId) {
		this.reCId = reCId;
	}
	public String getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(String boardNum) {
		this.boardNum = boardNum;
	}
	public String getComEmpDartName() {
		return comEmpDartName;
	}
	public void setComEmpDartName(String comEmpDartName) {
		this.comEmpDartName = comEmpDartName;
	}
	
	public String getReCIdDepart() {
		return reCIdDepart;
	}
	public void setReCIdDepart(String reCIdDepart) {
		this.reCIdDepart = reCIdDepart;
	}
	public String getReCIdName() {
		return reCIdName;
	}
	public void setReCIdName(String reCIdName) {
		this.reCIdName = reCIdName;
	}
	
}
