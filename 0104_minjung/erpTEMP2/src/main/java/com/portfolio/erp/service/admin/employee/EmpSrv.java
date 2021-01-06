package com.portfolio.erp.service.admin.employee;

import java.util.List;

import com.portfolio.erp.model.employee.EmployeeVO;

public interface EmpSrv {
	
	public void setEmpDetail(EmployeeVO evo);
	
	public int getEmpCount(String searchOpt, String words);
	
	public List<EmployeeVO> getEmployeeList(String searchOpt, String words);
	
	public void headChange(String headType, String empNum);
	
	public void confirmChange(String confirmType, String empNum);
	
	public EmployeeVO getEmployeeOne(int empId);

	public void setEmployeeDelete(int empId);
	
	public void authChange(int auth, int empId);

}