package com.portfolio.erp.repository.regnlog;

import java.util.List;

import com.portfolio.erp.model.employee.EmployeeVO;

public interface RegnlogDao {
	public void setEmpOne(EmployeeVO evo);
	public List<EmployeeVO> getDepartmentList();
	public List<EmployeeVO> getPositionList();
	
	public int loginChk(EmployeeVO evo);
}
