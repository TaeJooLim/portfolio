package com.portfolio.erp.service.common;

import java.util.List;

import com.portfolio.erp.model.employee.EmployeeVO;

public interface CommonSrv {
	public EmployeeVO getHeadInfo(String empDepartment);
	public List<EmployeeVO> getDepartmentList();
	public List<EmployeeVO> getPositionList();
}
