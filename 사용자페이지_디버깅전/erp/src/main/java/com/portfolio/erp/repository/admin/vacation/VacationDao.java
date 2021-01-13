package com.portfolio.erp.repository.admin.vacation;

import java.util.List;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.model.order.OrderVO;
import com.portfolio.erp.model.vacation.VacationVO;

public interface VacationDao {
	
	public void setVacation(VacationVO vvo);

	public void updateEmpOff(EmployeeVO evo);

	public void updateConfirm(String offDocNum);

	public List<VacationVO> getVacationList(int empId, int startIndex, int pageSize);

	public int getVacationCntOne(int empId);

	public List<VacationVO> getVacationListAll(String searchOpt, String words, int startIndex, int pageSize);

	public VacationVO getVacationForm(String offDocNum);

	public int getVacationCnt(String searchOpt, String words);

	public int getCntOffTypeA(int empId);
	public int getCntOffTypeB(int empId);
	public int getCntOffTypeC(int empId);
	public int getCntOffTypeD(int empId);

	public void deleteVacation(String offDocNum, int empId);

	public void deleteVacationAll(String offDocNum);

	public int getAppVacationListCnt(String searchOpt, String words, String confirmChk);
	public List<OrderVO> getAppVacationList(String searchOpt, String words, int startIndex, int pageSize, String confirmChk);

	public int getAppVacationSendListCnt(String searchOpt, String words, int empId);
	public List<OrderVO> getAppVacationSendList(String searchOpt, String words, int startIndex, int pageSize, int empId);

}
