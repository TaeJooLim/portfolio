package com.portfolio.erp.repository.common;

import java.util.List;

import com.portfolio.erp.model.employee.EmployeeVO;

public interface CommonDao {
	public EmployeeVO getHeadInfo(String empDepartment);
	public List<EmployeeVO> getDepartmentList();
	public List<EmployeeVO> getPositionList();
}
