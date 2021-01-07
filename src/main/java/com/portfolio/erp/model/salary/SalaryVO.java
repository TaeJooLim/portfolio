package com.portfolio.erp.model.salary;

public class SalaryVO {

	// 1. salary세금계산테이블 field
	private int salaryId;
	private int startingRange;
	private int endRange;
	private int netPay;
	private int salaryNps;
	private int salaryHInsurance;
	private int salaryCare;
	private int salaryEInsurance;
	private int salaryIncome;
	private int salaryLIncome;
	private int salaryTotalcost;
	
	// 1. 급여처리내역 field
	private int sformId;
	private String salaryDate;
	private String empNum;
	private String empName;
	private String empStep;
	private String empHeadcheck;
	private int salaryPay;
	
	private String empDepartmentName;	// JOIN
	private String empPositionName;		// JOIN
	private String empEnter;		// JOIN
	
	// 2. setter, getter
	public int getSalaryId() {
		return salaryId;
	}
	public String getEmpEnter() {
		return empEnter;
	}
	public void setEmpEnter(String empEnter) {
		this.empEnter = empEnter;
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
	public int getSformId() {
		return sformId;
	}
	public void setSformId(int sformId) {
		this.sformId = sformId;
	}
	public String getSalaryDate() {
		return salaryDate;
	}
	public void setSalaryDate(String salaryDate) {
		this.salaryDate = salaryDate;
	}
	public String getEmpStep() {
		return empStep;
	}
	public void setEmpStep(String empStep) {
		this.empStep = empStep;
	}
	public String getEmpHeadcheck() {
		return empHeadcheck;
	}
	public void setEmpHeadcheck(String empHeadcheck) {
		this.empHeadcheck = empHeadcheck;
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
	public int getSalaryPay() {
		return salaryPay;
	}
	public void setSalaryPay(int salaryPay) {
		this.salaryPay = salaryPay;
	}
	public void setSalaryId(int salaryId) {
		this.salaryId = salaryId;
	}
	public int getStartingRange() {
		return startingRange;
	}
	public void setStartingRange(int startingRange) {
		this.startingRange = startingRange;
	}
	public int getEndRange() {
		return endRange;
	}
	public void setEndRange(int endRange) {
		this.endRange = endRange;
	}
	public int getNetPay() {
		return netPay;
	}
	public void setNetPay(int netPay) {
		this.netPay = netPay;
	}
	public int getSalaryNps() {
		return salaryNps;
	}
	public void setSalaryNps(int salaryNps) {
		this.salaryNps = salaryNps;
	}
	public int getSalaryHInsurance() {
		return salaryHInsurance;
	}
	public void setSalaryHInsurance(int salaryHInsurance) {
		this.salaryHInsurance = salaryHInsurance;
	}
	public int getSalaryCare() {
		return salaryCare;
	}
	public void setSalaryCare(int salaryCare) {
		this.salaryCare = salaryCare;
	}
	public int getSalaryEInsurance() {
		return salaryEInsurance;
	}
	public void setSalaryEInsurance(int salaryEInsurance) {
		this.salaryEInsurance = salaryEInsurance;
	}
	public int getSalaryIncome() {
		return salaryIncome;
	}
	public void setSalaryIncome(int salaryIncome) {
		this.salaryIncome = salaryIncome;
	}
	
	public int getSalaryLIncome() {
		return salaryLIncome;
	}
	public void setSalaryLIncome(int salaryLIncome) {
		this.salaryLIncome = salaryLIncome;
	}
	public int getSalaryTotalcost() {
		return salaryTotalcost;
	}
	public void setSalaryTotalcost(int salaryTotalcost) {
		this.salaryTotalcost = salaryTotalcost;
	}
	
}
