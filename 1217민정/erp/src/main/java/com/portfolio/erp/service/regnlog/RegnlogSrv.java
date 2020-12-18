package com.portfolio.erp.service.regnlog;

import java.util.List;

import com.portfolio.erp.model.employee.EmployeeVO;

public interface RegnlogSrv {
	public void setEmpOne(EmployeeVO evo);
	public List<EmployeeVO> getDepartmentList();
	public List<EmployeeVO> getPositionList();
	
	public int loginChk(EmployeeVO evo);
}
