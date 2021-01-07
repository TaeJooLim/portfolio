package com.portfolio.erp.repository.admin.vacation;

import java.util.List;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.model.vacation.VacationVO;

public interface VacationDao {
	
	public void setVacation(VacationVO vvo);
	
	public void updateEmpOff(EmployeeVO evo);
	
	public List<VacationVO> getVacationList(int empId);
	
	public void deleteVacation(String offStartDate, String offEndDate, int empId);
	
	public int getCntOffTypeA();
	public int getCntOffTypeB();
	public int getCntOffTypeC();
	public int getCntOffTypeD();

}
