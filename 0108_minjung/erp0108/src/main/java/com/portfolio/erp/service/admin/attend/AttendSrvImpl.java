package com.portfolio.erp.service.admin.attend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.erp.model.attend.AttendVO;
import com.portfolio.erp.repository.admin.attend.AttendDao;

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
	public List<AttendVO> getWorkDatas(String searchOpt, String words,int startIndex, int pageSize) {
		return attendDao.getWorkDatas(searchOpt, words,startIndex,pageSize);
	}

	@Override
	public int isWorkDatas(String searchOpt, String words) {
		return attendDao.isWorkDatas(searchOpt, words);
	}

	@Override
	public void changeLate(AttendVO avo) {
		attendDao.changeLate(avo);
	}

	@Override
	public void changeWorkplace(AttendVO avo) {
		attendDao.changeWorkplace(avo);
	}

	@Override
	public void changeStatus(AttendVO avo) {
		attendDao.changeStatus(avo);
	}

	@Override
	public void deleteRecords(int attendId) {
		attendDao.deleteRecords(attendId);
	}

	@Override
	public AttendVO getRecordOne(AttendVO avo) {
		return attendDao.getRecordOne(avo);
	}

	@Override
	public AttendVO getDefault(AttendVO avo) {
		return attendDao.getDefault(avo);
	}

	@Override
	public void setChanges(AttendVO avo) {
		attendDao.setChanges(avo);
	}
}
