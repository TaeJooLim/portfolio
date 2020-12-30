package com.portfolio.erp.repository.admin.myInfo;

import com.portfolio.erp.model.employee.EmployeeVO;

public interface MyInfoDao {

	public EmployeeVO getMyInfo(EmployeeVO evo);
	
	public void setMyInfo(EmployeeVO evo);
	
	public EmployeeVO getMyDepart(EmployeeVO evo);
}
