package com.portfolio.erp.model.message;

import java.util.Date;

public class MessageVO {

	// 1. field
	private int msgId;
	private int msgSendId;
	private int msgFromId;
	private String msgSubject;
	private String msgContent;
	private Date msgRegdate;
	private String msgConfirm;
	private String msgSendDel;
	private String msgFromDel;
	
	// Join
	private String empName;
	private String empDepartmentName;
	private String empPositionName;

	// regdate String으로 출력용
	private String regDateFormat;

	// 2. setter, getter
	public int getMsgId() {
		return msgId;
	}

	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}

	public int getMsgSendId() {
		return msgSendId;
	}

	public void setMsgSendId(int msgSendId) {
		this.msgSendId = msgSendId;
	}

	public int getMsgFromId() {
		return msgFromId;
	}

	public void setMsgFromId(int msgFromId) {
		this.msgFromId = msgFromId;
	}

	public String getMsgSubject() {
		return msgSubject;
	}

	public void setMsgSubject(String msgSubject) {
		this.msgSubject = msgSubject;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public Date getMsgRegdate() {
		return msgRegdate;
	}

	public void setMsgRegdate(Date msgRegdate) {
		this.msgRegdate = msgRegdate;
	}

	public String getMsgConfirm() {
		return msgConfirm;
	}

	public void setMsgConfirm(String msgConfirm) {
		this.msgConfirm = msgConfirm;
	}

	public String getMsgSendDel() {
		return msgSendDel;
	}

	public void setMsgSendDel(String msgSendDel) {
		this.msgSendDel = msgSendDel;
	}

	public String getMsgFromDel() {
		return msgFromDel;
	}

	public void setMsgFromDel(String msgFromDel) {
		this.msgFromDel = msgFromDel;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpDepartmentName() {
		return empDepartmentName;
	}

	public void setEmpDepartmentName(String empDepartmentName) {
		this.empDepartmentName = empDepartmentName;
	}

	public String getEmpPositionName() {
		return empPositionName;
	}

	public void setEmpPositionName(String empPositionName) {
		this.empPositionName = empPositionName;
	}

	public String getRegDateFormat() {
		return regDateFormat;
	}

	public void setRegDateFormat(String regDateFormat) {
		this.regDateFormat = regDateFormat;
	}

}