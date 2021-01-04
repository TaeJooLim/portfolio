package com.portfolio.erp.service.regnlog;


import javax.servlet.http.HttpSession;

import com.portfolio.erp.model.employee.EmployeeVO;

public interface RegnlogSrv {
	public void setEmpOne(EmployeeVO evo);

	public EmployeeVO empNumChk(String emp_name, String emp_birth);
	public String empPasswordChk(String emp_num, String emp_birth);
	
	public int loginChk(EmployeeVO evo, HttpSession session);
	public void logoutSession(HttpSession session);
}
