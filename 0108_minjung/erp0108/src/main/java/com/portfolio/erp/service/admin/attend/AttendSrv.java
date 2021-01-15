package com.portfolio.erp.service.admin.attend;

import java.util.List;

import com.portfolio.erp.model.attend.AttendVO;

public interface AttendSrv {
	
	public void setStarttime(AttendVO avo);
	
	public int isStarted(AttendVO avo);
	
	public void setEndtime(AttendVO avo);
	
	public int isEnded(AttendVO avo);

	public AttendVO getTimes(AttendVO avo);
	
	public int isDataExists(AttendVO avo);
	
	public List<AttendVO> getWorkDatas(String searchOpt, String words,int startIndex, int pageSize);
	
	public int isWorkDatas(String searchOpt, String words);
	
	public void changeLate(AttendVO avo);
	
	public void changeWorkplace(AttendVO avo);
	
	public void changeStatus(AttendVO avo);
	
	public void deleteRecords(int attendId);
	
	public AttendVO getRecordOne(AttendVO avo);
	
	public AttendVO getDefault(AttendVO avo);
	
	public void setChanges(AttendVO avo);
}