package com.portfolio.erp.service.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.repository.common.CommonDao;

@Service
public class CommonSrvImpl implements CommonSrv {

	@Autowired
	CommonDao commonDao;
	
	@Override
	public EmployeeVO getHeadInfo(String empDepartment) {
		return commonDao.getHeadInfo(empDepartment);
	}

	@Override
	public List<EmployeeVO> getDepartmentList() {
		return commonDao.getDepartmentList();
	}

	@Override
	public List<EmployeeVO> getPositionList() {
		return commonDao.getPositionList();
	}

	
}
