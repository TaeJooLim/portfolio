package com.portfolio.erp.repository.user.attend;

import com.portfolio.erp.model.attend.AttendVO;

public interface AttendDao {
	
	public void setStarttime(AttendVO avo);
	
	public int isStarted(AttendVO avo);
	
	public void setEndtime(AttendVO avo);
	
	public int isEnded(AttendVO avo);
	
	public AttendVO getTimes(AttendVO avo);
}
