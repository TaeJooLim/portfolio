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
	public void deleteVacation(String offStartDate, String offEndDate, int empId) {
		
		vDao.deleteVacation(offStartDate, offEndDate, empId);
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

}
