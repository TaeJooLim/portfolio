package com.portfolio.erp.model.employee;

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
   public Date getEmpRegdate() {
      return empRegdate;
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
   
}