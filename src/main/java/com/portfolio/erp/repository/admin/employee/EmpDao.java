package com.portfolio.erp.repository.admin.employee;

import java.util.List;
import java.util.Map;

import com.portfolio.erp.model.employee.EmployeeVO;

public interface EmpDao {
	
	public void setEmpDetail(EmployeeVO evo);
	
	public int getEmpCount(String searchOpt, String words);
	
	public List<EmployeeVO> getEmployeeList(String searchOpt, String words, int startIndex, int pageSize);
	
	public void headChange(Map<String, String> map);
	
	public void confirmChange(Map<String, String> map);
	
	public EmployeeVO getEmployeeOne(int empId);
	
	public void setEmployeeDelete(int empId);
	
	public void authChange(Map<Object, Object> map);

}
