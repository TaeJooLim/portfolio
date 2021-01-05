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
	
	public List<AttendVO> getWorkDatas();
	
	public int isWorkDatas();
	
	public void changeLate(AttendVO avo);
	
	public void changeWorkplace(AttendVO avo);
	
	public void changeStatus(AttendVO avo);
}
