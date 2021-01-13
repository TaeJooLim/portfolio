package com.portfolio.erp.service.admin.workcenter;

import java.util.List;

import com.portfolio.erp.model.workcenter.WorkcenterVO;

public interface WorkcenterSrv {
	
	public void setworkcenter(WorkcenterVO wvo);
	
	public List<WorkcenterVO> getworkcenterList(int startIndex, int pageSize);
	
	public int count();
	
	public void setworkcenterDel(int wcId);
}
