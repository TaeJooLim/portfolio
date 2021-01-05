package com.portfolio.erp.service.admin.myInfo;

import java.util.List;

import com.portfolio.erp.model.employee.EmployeeVO;

public interface MyInfoSrv {

	public EmployeeVO getMyInfo(EmployeeVO evo);

	public void setMyInfo(EmployeeVO evo);
	
	public List<EmployeeVO> getCoworker(EmployeeVO evo);
	
	public void updatePwd(String pwd, String empNum);
}
