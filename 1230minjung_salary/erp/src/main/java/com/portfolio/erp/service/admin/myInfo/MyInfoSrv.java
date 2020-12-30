package com.portfolio.erp.service.admin.myInfo;

import com.portfolio.erp.model.employee.EmployeeVO;

public interface MyInfoSrv {

	public EmployeeVO getMyInfo(EmployeeVO evo);

	public void setMyInfo(EmployeeVO evo);
	
	public EmployeeVO getMyDepart(EmployeeVO evo);
}
