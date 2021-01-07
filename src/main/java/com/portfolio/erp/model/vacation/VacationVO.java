package com.portfolio.erp.model.vacation;

import java.text.SimpleDateFormat;
import java.util.Date;

public class VacationVO {
	
	private int offId;			//pk
	private String offStartDate;// 휴가시작일 (input type ="date")
	private String offEndDate;	// 휴가종료일 (input type ="date")
	private String offDate;		// (자동계산)
	private double offDateCnt;		// 일 수 (자동계산)
	private String offType;		// 휴가종류 (연차,반차,휴직)
	private String offConfirm;	// 결재여부 (부서장이 결재)
	private Date offRegdate;
	
	private String offDocNum;	// 문서번호
	
	private int empIdFk;		// employee 테이블 조인
	
	private String empName;
	private String empDepartmentName;
	private String empPositionName;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	public int getOffId() {
		return offId;
	}

	public void setOffId(int offId) {
		this.offId = offId;
	}

	public String getOffStartDate() {
		return offStartDate;
	}

	public void setOffStartDate(String offStartDate) {
		this.offStartDate = offStartDate;
	}

	public String getOffEndDate() {
		return offEndDate;
	}

	public void setOffEndDate(String offEndDate) {
		this.offEndDate = offEndDate;
	}

	public String getOffDate() {
		return offDate;
	}

	public void setOffDate(String offDate) {
		this.offDate = offDate;
	}

	public double getOffDateCnt() {
		return offDateCnt;
	}

	public void setOffDateCnt(double offDateCnt) {
		this.offDateCnt = offDateCnt;
	}

	public String getOffType() {
		return offType;
	}

	public void setOffType(String offType) {
		this.offType = offType;
	}

	public String getOffConfirm() {
		return offConfirm;
	}

	public void setOffConfirm(String offConfirm) {
		this.offConfirm = offConfirm;
	}

	public String getOffDocNum() {
		return offDocNum;
	}

	public void setOffDocNum(String offDocNum) {
		this.offDocNum = offDocNum;
	}

	public int getEmpIdFk() {
		return empIdFk;
	}

	public void setEmpIdFk(int empIdFk) {
		this.empIdFk = empIdFk;
	}

	public String getOffRegdate() {
		return sdf.format(offRegdate);
	}

	public void setOffRegdate(Date offRegdate) {
		this.offRegdate = offRegdate;
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
	
}
