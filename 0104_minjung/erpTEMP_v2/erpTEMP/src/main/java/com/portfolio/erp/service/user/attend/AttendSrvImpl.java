package com.portfolio.erp.service.user.attend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.erp.model.attend.AttendVO;
import com.portfolio.erp.repository.user.attend.AttendDao;

@Service
public class AttendSrvImpl implements AttendSrv{

	@Autowired
	AttendDao attendDao;
	
	@Override
	public void setStarttime(AttendVO avo) {
		attendDao.setStarttime(avo);
	}

	@Override
	public int isStarted(AttendVO avo) {
		return attendDao.isStarted(avo);
	}

	@Override
	public void setEndtime(AttendVO avo) {
		attendDao.setEndtime(avo);
	}

	@Override
	public int isEnded(AttendVO avo) {
		return attendDao.isEnded(avo);
	}

	@Override
	public AttendVO getTimes(AttendVO avo) {
		return attendDao.getTimes(avo);
	}

	@Override
	public int isDataExists(AttendVO avo) {
		return attendDao.isDataExists(avo);
	}

	@Override
	public List<AttendVO> getWorkDatas() {
		return attendDao.getWorkDatas();
	}

	@Override
	public int isWorkDatas() {
		return attendDao.isWorkDatas();
	}

	@Override
	public void changeLate(AttendVO avo) {
		attendDao.changeLate(avo);
	}

}