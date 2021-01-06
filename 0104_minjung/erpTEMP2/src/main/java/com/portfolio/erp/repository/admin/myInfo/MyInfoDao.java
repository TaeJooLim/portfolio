package com.portfolio.erp.repository.admin.myInfo;

import java.util.List;

import com.portfolio.erp.model.employee.EmployeeVO;

public interface MyInfoDao {

	public EmployeeVO getMyInfo(EmployeeVO evo);
	
	public void setMyInfo(EmployeeVO evo);
	
	public List<EmployeeVO> getCoworker(EmployeeVO evo);
	
	public void updatePwd(String pwd, String empNum);
}
