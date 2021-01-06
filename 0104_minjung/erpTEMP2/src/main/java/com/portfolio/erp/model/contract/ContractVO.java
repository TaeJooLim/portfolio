package com.portfolio.erp.model.contract;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ContractVO {
	
	private int contID;
	private String contDocNum;
	private String contComName;
	private String contEmpCompany;
	private String contDepartName;
	private String contPositionName;
	private String contEmpName;
	private String contClientCompany;
	private String contClientCeoName;
	private String contClientResponsibility;
	private String contClientResCp;
	private String contClientResEmail;
	private String contOrderDate;
	private String contDueDate;
	private String contNote;
	
	private String clientLicenseNumFk;
	
	private int contDID;
	private String contDdocNumFk;
	private String contDpName;
	private String contDpUnit;
	private int contDpAmount;
	private int contDpSell;
	private String contDVat;
	      
	private int pBuy;
	private String pSize;
	private String pCode;
	
	
	Date now = new Date();
	SimpleDateFormat format = new SimpleDateFormat ("yyyyMMdd");
	private String time = format.format(now);
	
	
	
	public String getpSize() {
		return pSize;
	}
	public void setpSize(String pSize) {
		this.pSize = pSize;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getContDVat() {
		return contDVat;
	}
	public void setContDVat(String contDVat) {
		this.contDVat = contDVat;
	}
	public int getpBuy() {
		return pBuy;
	}
	public void setpBuy(int pBuy) {
		this.pBuy = pBuy;
	}
	public String getClientLicenseNumFk() {
		return clientLicenseNumFk;
	}
	public void setClientLicenseNumFk(String clientLicenseNumFk) {
		this.clientLicenseNumFk = clientLicenseNumFk;
	}
	public int getContID() {
		return contID;
	}
	public void setContID(int contID) {
		this.contID = contID;
	}
	public String getContDocNum() {
		return contDocNum;
	}
	public void setContDocNum(String contDocNum) {
		this.contDocNum = contDocNum;
	}
	public String getContComName() {
		return contComName;
	}
	public void setContComName(String contComName) {
		this.contComName = contComName;
	}
	public String getContEmpCompany() {
		return contEmpCompany;
	}
	public void setContEmpCompany(String contEmpCompany) {
		this.contEmpCompany = contEmpCompany;
	}
	public String getContDepartName() {
		return contDepartName;
	}
	public void setContDepartName(String contDepartName) {
		this.contDepartName = contDepartName;
	}
	public String getContPositionName() {
		return contPositionName;
	}
	public void setContPositionName(String contPositionName) {
		this.contPositionName = contPositionName;
	}
	public String getContEmpName() {
		return contEmpName;
	}
	public void setContEmpName(String contEmpName) {
		this.contEmpName = contEmpName;
	}
	public String getContClientCompany() {
		return contClientCompany;
	}
	public void setContClientCompany(String contClientCompany) {
		this.contClientCompany = contClientCompany;
	}
	public String getContClientCeoName() {
		return contClientCeoName;
	}
	public void setContClientCeoName(String contClientCeoName) {
		this.contClientCeoName = contClientCeoName;
	}
	public String getContClientResponsibility() {
		return contClientResponsibility;
	}
	public void setContClientResponsibility(String contClientResponsibility) {
		this.contClientResponsibility = contClientResponsibility;
	}
	public String getContClientResCp() {
		return contClientResCp;
	}
	public void setContClientResCp(String contClientResCp) {
		this.contClientResCp = contClientResCp;
	}
	public String getContClientResEmail() {
		return contClientResEmail;
	}
	public void setContClientResEmail(String contClientResEmail) {
		this.contClientResEmail = contClientResEmail;
	}
	public String getContOrderDate() {
		return contOrderDate;
	}
	public void setContOrderDate(String contOrderDate) {
		this.contOrderDate = contOrderDate;
	}
	public String getContDueDate() {
		return contDueDate;
	}
	public void setContDueDate(String contDueDate) {
		this.contDueDate = contDueDate;
	}
	public String getContNote() {
		return contNote;
	}
	public void setContNote(String contNote) {
		this.contNote = contNote;
	}
	public int getContDID() {
		return contDID;
	}
	public void setContDID(int contDID) {
		this.contDID = contDID;
	}
	public String getContDdocNumFk() {
		return contDdocNumFk;
	}
	public void setContDdocNumFk(String contDdocNumFk) {
		this.contDdocNumFk = contDdocNumFk;
	}
	public String getContDpName() {
		return contDpName;
	}
	public void setContDpName(String contDpName) {
		this.contDpName = contDpName;
	}
	public String getContDpUnit() {
		return contDpUnit;
	}
	public void setContDpUnit(String contDpUnit) {
		this.contDpUnit = contDpUnit;
	}
	public int getContDpAmount() {
		return contDpAmount;
	}
	public void setContDpAmount(int contDpAmount) {
		this.contDpAmount = contDpAmount;
	}
	public int getContDpSell() {
		return contDpSell;
	}
	public void setContDpSell(int contDpSell) {
		this.contDpSell = contDpSell;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
	
	
}
