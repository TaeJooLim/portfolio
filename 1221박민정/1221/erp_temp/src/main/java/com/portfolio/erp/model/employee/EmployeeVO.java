package com.portfolio.erp.model.employee;

import java.text.SimpleDateFormat;
import java.util.Date;

public class EmployeeVO {

	private int empId;
	private String empDepartment;
	private String empPosition;
	private String empNum;
	private String empEnter;
	private String empName;
	private String empBirth;
	private String empPassword;
	private String empEmail;
	private Date empRegdate;
	private String empHeadcheck;
	private int empStep;
	private int empAuth;
	private String empConfirm;
	private String empPhoto;
	private int empOffTotal;
	private int empOffUse;
	private int empOffRemain;

	private String empDepartmentName;
	private String empPositionName;

	/* 중복방지 ref */
	private int ref;

	/* employee_detail_tbl */
	private String empCompany;
	private String empTeam;
	private String empGender;
	private String empCP;
	private String empExtension;
	private String empLeader;
	private String empDriving;
	private String empCarlicense;
	private String empMycar;
	private String empGraduated;
	private String empMajor;
	private String empAcademy;
	private String empReward;
	private String empDisability;
	private String empArmy;
	private String empReligion;
	private String empMarried;
	private String empLicense1;
	private String empLicense2;
	private String empLicense3;
	private String empLang1;
	private String empLang2;
	private String empNation;
	private String empPost;
	private String empAddress;
	private String empBank;
	private String empAccountnum;
	private String empAddressDetail;
	private String empCareer;

	private int empIdFk; // Join
	
	

	
	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getEmpDepartment() {
		return empDepartment;
	}

	public void setEmpDepartment(String empDepartment) {
		this.empDepartment = empDepartment;
	}

	public String getEmpPosition() {
		return empPosition;
	}

	public void setEmpPosition(String empPosition) {
		this.empPosition = empPosition;
	}

	public String getEmpNum() {
		return empNum;
	}

	public void setEmpNum(String empNum) {
		this.empNum = empNum;
	}

	public String getEmpEnter() {
		return empEnter;
	}

	public void setEmpEnter(String empEnter) {
		this.empEnter = empEnter;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpBirth() {
		return empBirth;
	}

	public void setEmpBirth(String empBirth) {
		this.empBirth = empBirth;
	}

	public String getEmpPassword() {
		return empPassword;
	}

	public void setEmpPassword(String empPassword) {
		this.empPassword = empPassword;
	}

	public String getEmpEmail() {
		return empEmail;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	public String getEmpRegdate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(empRegdate);
	}

	public void setEmpRegdate(Date empRegdate) {
		this.empRegdate = empRegdate;
	}

	public String getEmpHeadcheck() {
		return empHeadcheck;
	}

	public void setEmpHeadcheck(String empHeadcheck) {
		this.empHeadcheck = empHeadcheck;
	}

	public int getEmpStep() {
		return empStep;
	}

	public void setEmpStep(int empStep) {
		this.empStep = empStep;
	}

	public int getEmpAuth() {
		return empAuth;
	}

	public void setEmpAuth(int empAuth) {
		this.empAuth = empAuth;
	}

	public String getEmpConfirm() {
		return empConfirm;
	}

	public void setEmpConfirm(String empConfirm) {
		this.empConfirm = empConfirm;
	}

	public String getEmpPhoto() {
		return empPhoto;
	}

	public void setEmpPhoto(String empPhoto) {
		this.empPhoto = empPhoto;
	}

	public int getEmpOffTotal() {
		return empOffTotal;
	}

	public void setEmpOffTotal(int empOffTotal) {
		this.empOffTotal = empOffTotal;
	}

	public int getEmpOffUse() {
		return empOffUse;
	}

	public void setEmpOffUse(int empOffUse) {
		this.empOffUse = empOffUse;
	}

	public int getEmpOffRemain() {
		return empOffRemain;
	}

	public void setEmpOffRemain(int empOffRemain) {
		this.empOffRemain = empOffRemain;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
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

	public String getEmpCompany() {
		return empCompany;
	}

	public void setEmpCompany(String empCompany) {
		this.empCompany = empCompany;
	}

	public String getEmpTeam() {
		return empTeam;
	}

	public void setEmpTeam(String empTeam) {
		this.empTeam = empTeam;
	}

	public String getEmpGender() {
		return empGender;
	}

	public void setEmpGender(String empGender) {
		this.empGender = empGender;
	}

	public String getEmpCP() {
		return empCP;
	}

	public void setEmpCP(String empCP) {
		this.empCP = empCP;
	}

	public String getEmpExtension() {
		return empExtension;
	}

	public void setEmpExtension(String empExtension) {
		this.empExtension = empExtension;
	}

	public String getEmpLeader() {
		return empLeader;
	}

	public void setEmpLeader(String empLeader) {
		this.empLeader = empLeader;
	}

	public String getEmpDriving() {
		return empDriving;
	}

	public void setEmpDriving(String empDriving) {
		this.empDriving = empDriving;
	}

	public String getEmpCarlicense() {
		return empCarlicense;
	}

	public void setEmpCarlicense(String empCarlicense) {
		this.empCarlicense = empCarlicense;
	}

	public String getEmpMycar() {
		return empMycar;
	}

	public void setEmpMycar(String empMycar) {
		this.empMycar = empMycar;
	}

	public String getEmpGraduated() {
		return empGraduated;
	}

	public void setEmpGraduated(String empGraduated) {
		this.empGraduated = empGraduated;
	}

	public String getEmpMajor() {
		return empMajor;
	}

	public void setEmpMajor(String empMajor) {
		this.empMajor = empMajor;
	}

	public String getEmpAcademy() {
		return empAcademy;
	}

	public void setEmpAcademy(String empAcademy) {
		this.empAcademy = empAcademy;
	}

	public String getEmpReward() {
		return empReward;
	}

	public void setEmpReward(String empReward) {
		this.empReward = empReward;
	}

	public String getEmpDisability() {
		return empDisability;
	}

	public void setEmpDisability(String empDisability) {
		this.empDisability = empDisability;
	}

	public String getEmpArmy() {
		return empArmy;
	}

	public void setEmpArmy(String empArmy) {
		this.empArmy = empArmy;
	}

	public String getEmpReligion() {
		return empReligion;
	}

	public void setEmpReligion(String empReligion) {
		this.empReligion = empReligion;
	}

	public String getEmpMarried() {
		return empMarried;
	}

	public void setEmpMarried(String empMarried) {
		this.empMarried = empMarried;
	}

	public String getEmpLicense1() {
		return empLicense1;
	}

	public void setEmpLicense1(String empLicense1) {
		this.empLicense1 = empLicense1;
	}

	public String getEmpLicense2() {
		return empLicense2;
	}

	public void setEmpLicense2(String empLicense2) {
		this.empLicense2 = empLicense2;
	}

	public String getEmpLicense3() {
		return empLicense3;
	}

	public void setEmpLicense3(String empLicense3) {
		this.empLicense3 = empLicense3;
	}

	public String getEmpLang1() {
		return empLang1;
	}

	public void setEmpLang1(String empLang1) {
		this.empLang1 = empLang1;
	}

	public String getEmpLang2() {
		return empLang2;
	}

	public void setEmpLang2(String empLang2) {
		this.empLang2 = empLang2;
	}

	public String getEmpNation() {
		return empNation;
	}

	public void setEmpNation(String empNation) {
		this.empNation = empNation;
	}

	public String getEmpPost() {
		return empPost;
	}

	public void setEmpPost(String empPost) {
		this.empPost = empPost;
	}

	public String getEmpAddress() {
		return empAddress;
	}

	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}

	public String getEmpBank() {
		return empBank;
	}

	public void setEmpBank(String empBank) {
		this.empBank = empBank;
	}

	public String getEmpAccountnum() {
		return empAccountnum;
	}

	public void setEmpAccountnum(String empAccountnum) {
		this.empAccountnum = empAccountnum;
	}

	public String getEmpAddressDetail() {
		return empAddressDetail;
	}

	public void setEmpAddressDetail(String empAddressDetail) {
		this.empAddressDetail = empAddressDetail;
	}

	public String getEmpCareer() {
		return empCareer;
	}

	public void setEmpCareer(String empCareer) {
		this.empCareer = empCareer;
	}

	public int getEmpIdFk() {
		return empIdFk;
	}

	public void setEmpIdFk(int empIdFk) {
		this.empIdFk = empIdFk;
	}

}