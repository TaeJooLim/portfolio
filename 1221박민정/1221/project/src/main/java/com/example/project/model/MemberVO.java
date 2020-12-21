package com.example.project.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MemberVO {
	
	/*** 테이블명 : member ***/
	private int num;
	private String memNum;
	private String memID;
	private String memPwd;
	private String memName;
	private String memGender;
	private String memJumin;
	private String memJuminBack;
	
	private String memBuseoCode;
	private String memBuseoName;
	private String memGradeCode;
	private String memGradeName;
	
	private String memEntdate;
	private Date memRegdate;
	private int memLevel;
	private String memConfirm;
	private String memPhoto;
	
	private int ref; //사원번호 중복을 피하기 위한 변수
	
	/*** 테이블명 : member_others ***/
	private int memOID;
	private String memCp;
	private String memTel;
	private String memEmail;
	private String memBirth;
	private String memRecruit;
	private String memAddr;
	private String memMarried;
	private String memService;
	private String memHobby;
	private String memSpeciality;
	private String memDisability;
	private String memDisabilityNum;
	private String memReward;
	private String memRewardNum;
	private String memFinalEdu;
	private String memHeight;
	private String memWeight;
	private String memReligion;
	private String memLicense1;
	private String memLicense2;
	private String memLicense3;
	private String memLicense4;
	private String memLang1;
	private String memLang2;
	private String memLang3;
	private String memLang4;
	private String memComment;
	private int numFK;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	/*** getter,setter ***/
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMemNum() {
		return memNum;
	}
	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}
	public String getMemID() {
		return memID;
	}
	public void setMemID(String memID) {
		this.memID = memID;
	}
	public String getMemPwd() {
		return memPwd;
	}
	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemGender() {
		return memGender;
	}
	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}
	public String getMemJumin() {
		return memJumin;
	}
	public void setMemJumin(String memJumin) {
		this.memJumin = memJumin;
	}
	public String getMemBuseoCode() {
		return memBuseoCode;
	}
	public void setMemBuseoCode(String memBuseoCode) {
		this.memBuseoCode = memBuseoCode;
	}
	public String getMemBuseoName() {
		return memBuseoName;
	}
	public void setMemBuseoName(String memBuseoName) {
		this.memBuseoName = memBuseoName;
	}
	public String getMemGradeCode() {
		return memGradeCode;
	}
	public void setMemGradeCode(String memGradeCode) {
		this.memGradeCode = memGradeCode;
	}
	public String getMemGradeName() {
		return memGradeName;
	}
	public void setMemGradeName(String memGradeName) {
		this.memGradeName = memGradeName;
	}
	public String getMemEntdate() {
		return memEntdate;
	}
	public void setMemEntdate(String memEntdate) {
		this.memEntdate = memEntdate;
	}
	public String getMemRegdate() {
		return sdf.format(memRegdate);
	}
	public void setMemRegdate(Date memRegdate) {
		this.memRegdate = memRegdate;
	}
	public int getMemLevel() {
		return memLevel;
	}
	public void setMemLevel(int memLevel) {
		this.memLevel = memLevel;
	}
	public String getMemConfirm() {
		return memConfirm;
	}
	public void setMemConfirm(String memConfirm) {
		this.memConfirm = memConfirm;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public String getMemJuminBack() {
		return memJuminBack;
	}
	public void setMemJuminBack(String memJuminBack) {
		this.memJuminBack = memJuminBack;
	}
	public int getMemOID() {
		return memOID;
	}
	public void setMemOID(int memOID) {
		this.memOID = memOID;
	}
	public String getMemCp() {
		return memCp;
	}
	public void setMemCp(String memCp) {
		this.memCp = memCp;
	}
	public String getMemTel() {
		return memTel;
	}
	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}
	public String getMemRecruit() {
		return memRecruit;
	}
	public void setMemRecruit(String memRecruit) {
		this.memRecruit = memRecruit;
	}
	public String getMemAddr() {
		return memAddr;
	}
	public void setMemAddr(String memAddr) {
		this.memAddr = memAddr;
	}
	public String getMemMarried() {
		return memMarried;
	}
	public void setMemMarried(String memMarried) {
		this.memMarried = memMarried;
	}
	public String getMemService() {
		return memService;
	}
	public void setMemService(String memService) {
		this.memService = memService;
	}
	public String getMemHobby() {
		return memHobby;
	}
	public void setMemHobby(String memHobby) {
		this.memHobby = memHobby;
	}
	public String getMemSpeciality() {
		return memSpeciality;
	}
	public void setMemSpeciality(String memSpeciality) {
		this.memSpeciality = memSpeciality;
	}
	public String getMemDisability() {
		return memDisability;
	}
	public void setMemDisability(String memDisability) {
		this.memDisability = memDisability;
	}
	public String getMemDisabilityNum() {
		return memDisabilityNum;
	}
	public void setMemDisabilityNum(String memDisabilityNum) {
		this.memDisabilityNum = memDisabilityNum;
	}
	public String getMemReward() {
		return memReward;
	}
	public void setMemReward(String memReward) {
		this.memReward = memReward;
	}
	public String getMemRewardNum() {
		return memRewardNum;
	}
	public void setMemRewardNum(String memRewardNum) {
		this.memRewardNum = memRewardNum;
	}
	public String getMemFinalEdu() {
		return memFinalEdu;
	}
	public void setMemFinalEdu(String memFinalEdu) {
		this.memFinalEdu = memFinalEdu;
	}
	public String getMemHeight() {
		return memHeight;
	}
	public void setMemHeight(String memHeight) {
		this.memHeight = memHeight;
	}
	public String getMemWeight() {
		return memWeight;
	}
	public void setMemWeight(String memWeight) {
		this.memWeight = memWeight;
	}
	public String getMemReligion() {
		return memReligion;
	}
	public void setMemReligion(String memReligion) {
		this.memReligion = memReligion;
	}
	public String getMemLicense1() {
		return memLicense1;
	}
	public void setMemLicense1(String memLicense1) {
		this.memLicense1 = memLicense1;
	}
	public String getMemLicense2() {
		return memLicense2;
	}
	public void setMemLicense2(String memLicense2) {
		this.memLicense2 = memLicense2;
	}
	public String getMemLicense3() {
		return memLicense3;
	}
	public void setMemLicense3(String memLicense3) {
		this.memLicense3 = memLicense3;
	}
	public String getMemLicense4() {
		return memLicense4;
	}
	public void setMemLicense4(String memLicense4) {
		this.memLicense4 = memLicense4;
	}
	public String getMemLang1() {
		return memLang1;
	}
	public void setMemLang1(String memLang1) {
		this.memLang1 = memLang1;
	}
	public String getMemLang2() {
		return memLang2;
	}
	public void setMemLang2(String memLang2) {
		this.memLang2 = memLang2;
	}
	public String getMemLang3() {
		return memLang3;
	}
	public void setMemLang3(String memLang3) {
		this.memLang3 = memLang3;
	}
	public String getMemLang4() {
		return memLang4;
	}
	public void setMemLang4(String memLang4) {
		this.memLang4 = memLang4;
	}
	public String getMemComment() {
		return memComment;
	}
	public void setMemComment(String memComment) {
		this.memComment = memComment;
	}
	public int getNumFK() {
		return numFK;
	}
	public void setNumFK(int numFK) {
		this.numFK = numFK;
	}
	
}
