package com.portfolio.erp.model.workcenter;

public class WorkcenterVO {
	
	private int wcId;
	private String wcName;
	private String wcUsage;
	private int wcArea;
	private int wcFloor;
	private String wcPost;
	private String wcAddress;
	private String wcContractFromDate;
	private String wcContractToDate;
	private String wcContract;
	
	private int empIdFk;
	
	//employee DB Join
	private String empName;
	private String empDepartmentName;
	private String empPositionName;
	private String empNum;
	
	
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

	public String getEmpNum() {
		return empNum;
	}

	public void setEmpNum(String empNum) {
		this.empNum = empNum;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public int getWcId() {
		return wcId;
	}

	public void setWcId(int wcId) {
		this.wcId = wcId;
	}

	public String getWcName() {
		return wcName;
	}

	public void setWcName(String wcName) {
		this.wcName = wcName;
	}

	public String getWcUsage() {
		return wcUsage;
	}

	public void setWcUsage(String wcUsage) {
		this.wcUsage = wcUsage;
	}

	public int getWcArea() {
		return wcArea;
	}

	public void setWcArea(int wcArea) {
		this.wcArea = wcArea;
	}

	public int getWcFloor() {
		return wcFloor;
	}

	public void setWcFloor(int wcFloor) {
		this.wcFloor = wcFloor;
	}

	public String getWcPost() {
		return wcPost;
	}

	public void setWcPost(String wcPost) {
		this.wcPost = wcPost;
	}

	public String getWcAddress() {
		return wcAddress;
	}

	public void setWcAddress(String wcAddress) {
		this.wcAddress = wcAddress;
	}

	public String getWcContractFromDate() {
		return wcContractFromDate;
	}

	public void setWcContractFromDate(String wcContractFromDate) {
		this.wcContractFromDate = wcContractFromDate;
	}

	public String getWcContractToDate() {
		return wcContractToDate;
	}

	public void setWcContractToDate(String wcContractToDate) {
		this.wcContractToDate = wcContractToDate;
	}

	public String getWcContract() {
		return wcContract;
	}

	public void setWcContract(String wcContract) {
		this.wcContract = wcContract;
	}

	public int getEmpIdFk() {
		return empIdFk;
	}

	public void setEmpIdFk(int empIdFk) {
		this.empIdFk = empIdFk;
	}
	
	
}
