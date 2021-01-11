package com.portfolio.erp.service.admin.vacation;

import java.util.List;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.model.vacation.VacationVO;

public interface VacationSrv {

	public void setVacation(VacationVO vvo);
	
	public void updateEmpOff(EmployeeVO evo);
	
	public void updateConfirm(String offDocNum);
	
	public List<VacationVO> getVacationList(int empId);
	
	public List<VacationVO> getVacationListAll(String searchOpt, String words);
	
	public int getVacationCnt(String searchOpt, String words);
	
	public VacationVO getVacationForm(String offDocNum);
	
	public void deleteVacation(String offDocNum, int empId);
	
	public void deleteVacationAll(String offDocNum);
	
	public int getCntOffTypeA();
	public int getCntOffTypeB();
	public int getCntOffTypeC();
	public int getCntOffTypeD();
}
