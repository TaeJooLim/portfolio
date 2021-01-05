package com.portfolio.erp.service.admin.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.repository.admin.employee.EmpDao;

@Service
public class EmpSrvImpl implements EmpSrv {
	
	@Autowired
	EmpDao eDao;

	@Override
	public void setEmpDetail(EmployeeVO evo) {
		eDao.setEmpDetail(evo);
		
	}

	@Override
	public int getEmpCount(String searchOpt, String words) {
		return eDao.getEmpCount(searchOpt, words);
	}

	@Override
	public List<EmployeeVO> getEmployeeList(String searchOpt, String words) {
		return eDao.getEmployeeList(searchOpt, words);
	}
	
	@Override
	public void headChange(String headType, String empNum) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("headType", headType);
		map.put("empNum",empNum);
		eDao.headChange(map);
	}

	@Override
	public void confirmChange(String confirmType, String empNum) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("confirmType", confirmType);
		map.put("empNum",empNum);
		eDao.confirmChange(map);
	}

	@Override
	public EmployeeVO getEmployeeOne(int empId) {
		return eDao.getEmployeeOne(empId);
	}

	@Override
	public void setEmployeeDelete(int empId) {
		eDao.setEmployeeDelete(empId);
		
	}

	@Override
	public void authChange(int auth, int empId) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("auth", auth);
		map.put("empId", empId);
		eDao.authChange(map);
	}

}