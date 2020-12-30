package com.portfolio.erp.service.admin.myInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.erp.model.employee.EmployeeVO;
import com.portfolio.erp.repository.admin.myInfo.MyInfoDao;

@Service
public class MyInfoSrvImpl implements MyInfoSrv{

	@Autowired
	MyInfoDao myInfoDao;
	
	@Override
	public EmployeeVO getMyInfo(EmployeeVO evo) {
		return myInfoDao.getMyInfo(evo);
	}

	@Override
	public void setMyInfo(EmployeeVO evo) {
		myInfoDao.setMyInfo(evo);
	}

	@Override
	public EmployeeVO getMyDepart(EmployeeVO evo) {
		return myInfoDao.getMyDepart(evo);
	}

}
