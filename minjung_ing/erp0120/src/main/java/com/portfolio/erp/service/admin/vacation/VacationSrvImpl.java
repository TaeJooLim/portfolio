package com.portfolio.erp.service.admin.vacation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.model.order.OrderVO;
import com.portfolio.erp.model.vacation.VacationVO;
import com.portfolio.erp.repository.admin.vacation.VacationDao;

@Service
public class VacationSrvImpl implements VacationSrv {
	
	@Autowired
	VacationDao vDao;

	@Override
	public void setVacation(VacationVO vvo) {
		vDao.setVacation(vvo);		
	}

	@Override
	public void updateEmpOff(EmployeeVO evo) {
		vDao.updateEmpOff(evo);
	}

	@Override
	public List<VacationVO> getVacationList(int empId, int startIndex, int pageSize) {
		return vDao.getVacationList(empId, startIndex, pageSize);
	}
	
	@Override
	public int getCntOffTypeA(int empId) {
		return vDao.getCntOffTypeA(empId);
	}

	@Override
	public int getCntOffTypeB(int empId) {
		return vDao.getCntOffTypeB(empId);
	}

	@Override
	public int getCntOffTypeC(int empId) {
		return vDao.getCntOffTypeC(empId);
	}
	
	@Override
	public int getCntOffTypeD(int empId) {
		return vDao.getCntOffTypeD(empId);
	}

	@Override
	public List<VacationVO> getVacationListAll(String searchOpt, String words, int startIndex, int pageSize) {
		return vDao.getVacationListAll(searchOpt, words, startIndex, pageSize);
	}

	@Override
	public int getVacationCnt(String searchOpt, String words) {
		return vDao.getVacationCnt(searchOpt, words);
	}

	@Override
	public void deleteVacation(String offDocNum, int empId) {
		
		vDao.deleteVacation(offDocNum, empId);
	}

	@Override
	public void deleteVacationAll(String offDocNum) {
		vDao.deleteVacationAll(offDocNum);
	}

	@Override
	public void updateConfirm(String offDocNum) {
		vDao.updateConfirm(offDocNum);
	}

	@Override
	public VacationVO getVacationForm(String offDocNum) {
		return vDao.getVacationForm(offDocNum);
	}

	@Override
	public int getVacationCntOne(int empId) {
		return vDao.getVacationCntOne(empId);
	}

	@Override
	public List<OrderVO> getAppVacationList(String searchOpt, String words, int startIndex, int pageSize, String confirmChk) {
		return vDao.getAppVacationList(searchOpt, words, startIndex, pageSize, confirmChk);
	}

	@Override
	public int getAppVacationListCnt(String searchOpt, String words, String confirmChk) {
		return vDao.getAppVacationListCnt(searchOpt, words, confirmChk);
	}

	@Override
	public int getAppVacationSendListCnt(String searchOpt, String words, int empId) {
		return vDao.getAppVacationSendListCnt(searchOpt, words, empId);
	}

	@Override
	public List<OrderVO> getAppVacationSendList(String searchOpt, String words, 
												int startIndex, int pageSize,
												int empId) {
		return vDao.getAppVacationSendList(searchOpt, words, startIndex, pageSize, empId);
	}

}
