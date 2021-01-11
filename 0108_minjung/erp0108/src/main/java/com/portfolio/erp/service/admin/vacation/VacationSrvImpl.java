package com.portfolio.erp.service.admin.vacation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.erp.model.employee.EmployeeVO;
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
	public List<VacationVO> getVacationList(int empId) {
		return vDao.getVacationList(empId);
	}
	
	@Override
	public int getCntOffTypeA() {
		return vDao.getCntOffTypeA();
	}

	@Override
	public int getCntOffTypeB() {
		return vDao.getCntOffTypeB();
	}

	@Override
	public int getCntOffTypeC() {
		return vDao.getCntOffTypeC();
	}
	
	@Override
	public int getCntOffTypeD() {
		return vDao.getCntOffTypeD();
	}

	@Override
	public List<VacationVO> getVacationListAll(String searchOpt, String words) {
		return vDao.getVacationListAll(searchOpt, words);
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

}
