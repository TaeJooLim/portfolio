package com.portfolio.erp.service.admin.workcenter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.erp.model.workcenter.WorkcenterVO;
import com.portfolio.erp.repository.admin.workcenter.WorkcenterDao;

@Service
public class WorkcenterSrvImpl implements WorkcenterSrv{

 @Autowired
 WorkcenterDao wDao;

@Override
public void setworkcenter(WorkcenterVO wvo) {
	wDao.setworkcenter(wvo);
}

@Override
public List<WorkcenterVO> getworkcenterList() {
	return wDao.getworkcenterList();
}

@Override
public int count() {
	return wDao.count();
}

@Override
public void setworkcenterDel(int wcId) {
	wDao.setworkcenterDel(wcId);
	
}
 
 
}
